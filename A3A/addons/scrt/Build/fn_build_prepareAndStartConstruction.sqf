#include "..\defines.inc"
FIX_LINE_NUMBERS()

params [["_constructionType", ""], ["_constructionClass", ""]];

if (_constructionClass isEqualTo "") exitWith {
    [localize "STR_A3A_reinf_buildCvc_header", localize "STR_A3A_reinf_build_error_empty"] call SCRT_fnc_misc_deniedHint;
};

if (_constructionType isEqualTo "") exitWith {
    [localize "STR_A3A_reinf_buildCvc_header", localize "STR_A3A_reinf_build_error_empty_type"] call SCRT_fnc_misc_deniedHint;
};

if (!(isNil "HR_GRG_placing") && {HR_GRG_placing}) exitWith {
    [localize "STR_A3A_reinf_buildCvc_header", localize "STR_A3AP_error_already_placing_generic"] call SCRT_fnc_misc_deniedHint;
};

if (player != player getVariable ["owner",player]) exitWith {
    [localize "STR_A3A_reinf_buildCvc_header", localize "STR_A3AP_error_aicontrol_generic"] call SCRT_fnc_misc_deniedHint;
};

if ([getPosATL player] call A3A_fnc_enemyNearCheck) exitWith {
    [localize "STR_A3A_reinf_buildCvc_header", localize "STR_A3AP_error_enemynear_generic"] call SCRT_fnc_misc_deniedHint;
};

construction_selectedEngineer = objNull;

private _engineers = (units group player) select {_x call A3A_fnc_isEngineer};
private _playerIsEngineer = false;
private _otherPlayerEngineers = [];
private _aiEngineers = [];
private _abortMessage = "";

{
	if (_x call A3A_fnc_isEngineer) then {
		if (isPlayer _x) then {
			if (player == _x) then {
				_playerIsEngineer = true;
			} else {
				_otherPlayerEngineers pushBack _x;
			};
		} else {
			//AI Engineer
			_aiEngineers pushBack _x;
		};
	};
} forEach units group player;

private _engineerIsBusy = {
	private _engineer = param [0, objNull];
	((_engineer getVariable ["helping",false])
	or (_engineer getVariable ["rearming",false])
	or (_engineer getVariable ["constructing",false]));
};

//Check if the player can build
if (_playerIsEngineer) then {
	if ([player] call A3A_fnc_canFight && !([player] call _engineerIsBusy)) then {
		construction_selectedEngineer = player;
	} else {
		_abortMessage = _abortMessage + (localize "STR_A3A_reinf_build_engie_not_possible");
	};
} else {
	_abortMessage =	_abortMessage + (localize "STR_A3A_reinf_build_no_engie");
};

//Check if an engineer can build.
if (isNull construction_selectedEngineer && count _otherPlayerEngineers > 0) then {
	construction_selectedEngineer = _otherPlayerEngineers select 0;
	_abortMessage = _abortMessage + localize "STR_A3A_reinf_build_engie_human_engie";
};

if (isNull construction_selectedEngineer) then {
	if (count _aiEngineers > 0 && player != leader player) exitWith {
		_abortMessage =	_abortMessage + localize "STR_A3A_reinf_build_only_sl";
	};

    {
        if ([_x] call A3A_fnc_canFight && !([_x] call _engineerIsBusy)) exitWith {
            construction_selectedEngineer = _x;
            _abortMessage = _abortMessage + format [localize "STR_A3A_reinf_build_ordering", _x];
        };
    } forEach _aiEngineers;

	if (isNull construction_selectedEngineer) exitWith {
		_abortMessage =	_abortMessage + (localize "STR_A3A_reinf_build_no_engies_squad");
	};
};

if (isNull construction_selectedEngineer ||((player != construction_selectedEngineer) and (isPlayer construction_selectedEngineer))) exitWith {
	[localize "STR_A3A_reinf_buildCvc_header", _abortMessage] call A3A_fnc_customHint;
};

if (_constructionType == "HEAVY_BUNKER" && {{sidesX getVariable [_x,sideUnknown] == teamPlayer} count factories < 3}) exitWith {
    [localize "STR_A3A_reinf_buildCvc_header", localize "STR_A3A_reinf_build_fact_required"] call A3A_fnc_customHint;
};

construction_cost = 0;
construction_buildTime = 0;
construction_type = _constructionType;

switch(_constructionType) do {
    case("TRENCH"): {
        construction_cost = 100;
        construction_buildTime = 25;
    };
    case("OBSTACLE"): {
        construction_cost = 250;
        construction_buildTime = 25;
    };
    case("LIGHT_BUNKER"): {
        construction_cost = 1000;
        construction_buildTime = 60;
    };
    case("HEAVY_BUNKER"): {
        construction_cost = 2000;
        construction_buildTime = 60;
    };
    case("MISC"): {
        construction_cost = 50;
        construction_buildTime = 25;
    };
    default { 
        Error_1("Bad Construction Type - %1 ", _constructionType);
    };
};

private _sites = ((markersX - controlsX) + citiesX) select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
private _playerPosition = position player;
construction_nearestFriendlyMarker = [_sites,_playerPosition] call BIS_fnc_nearestPosition;

if (!(_playerPosition inArea construction_nearestFriendlyMarker)) exitWith {
    [localize "STR_A3A_reinf_buildCvc_header", localize "STR_A3A_reinf_build_outside_zone"] call SCRT_fnc_misc_deniedHint;
    construction_cost = nil; 
    construction_selectedEngineer = nil;
    construction_buildTime = nil;
    construction_type = nil;
};

private _money = player getVariable "moneyX";

if (_money < construction_cost) exitWith {
    [localize "STR_A3A_reinf_buildCvc_header", format [localize "STR_A3A_reinf_build_no_money", construction_cost, A3A_faction_civ get "currencySymbol"]] call SCRT_fnc_misc_deniedHint;
    construction_cost = nil; 
    construction_selectedEngineer = nil;
    construction_buildTime = nil;
    construction_type = nil;
};

private _extraMessage = format [localize "STR_veh_callback_constructions_text", construction_cost, A3A_faction_civ get "currencySymbol"];
private _fnc_placed = {
	params ["_vehicle", "_cost"];

    if (_vehicle isEqualTo objNull) exitWith {};

    private _earlyEscape = false;
    switch (construction_type) do { //return inverted here so true = cant place
        case "LIGHT_BUNKER";
        case "HEAVY_BUNKER": {
            if (isOnRoad _vehicle || {!(_vehicle inArea construction_nearestFriendlyMarker)}) then {
                [localize "STR_A3A_reinf_buildCvc_header", localize "STR_veh_callback_constructions"] call SCRT_fnc_misc_deniedHint;
                _earlyEscape = true;
            };
        };
    };
    if (_earlyEscape) exitWith {};

	private _type = typeOf _vehicle;
    private _pos = getPosASL _vehicle;
    private _dir = getDir _vehicle;
    deleteVehicle _vehicle;
    [_type, _pos, _dir] spawn A3A_fnc_buildCreateVehicleCallback;
};

[_constructionClass, _fnc_placed, {false}, [construction_cost], nil, nil, nil, _extraMessage] call HR_GRG_fnc_confirmPlacement;
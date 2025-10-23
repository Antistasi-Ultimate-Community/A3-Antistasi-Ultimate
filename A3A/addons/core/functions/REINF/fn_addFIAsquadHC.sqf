#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_typeGroup", ["_withBackpck", ""]];

if (player != theBoss) exitWith {[localize "STR_A3A_reinf_addFIASquadHC_header", localize "STR_generic_commander_only"] call SCRT_fnc_misc_deniedHint;};
if (markerAlpha respawnTeamPlayer == 0) exitWith {[localize "STR_A3A_reinf_addFIASquadHC_header", localize "STR_A3A_reinf_addFIASquadHC_error_moveHq"] call SCRT_fnc_misc_deniedHint;};
if (!([player] call A3A_fnc_hasRadio)) exitWith {[localize "STR_A3A_reinf_addFIASquadHC_header", localize "STR_A3A_reinf_addFIASquadHC_error_radio"] call SCRT_fnc_misc_deniedHint;};
if ([getPosATL petros] call A3A_fnc_enemyNearCheck) exitWith {[localize "STR_A3A_reinf_addFIASquadHC_header", localize "STR_A3A_reinf_addFIASquadHC_error_enemynear"] call SCRT_fnc_misc_deniedHint;};

if (count hcAllGroups player >= ([6,10] select (player call A3A_fnc_isMember))) exitWith {
    [localize "STR_A3A_reinf_addFIASquadHC_header", localize "STR_A3A_reinf_addFIASquadHC_error_too_many_hc"] call A3A_fnc_customHint;
};

private _exit = false;
if (_typeGroup isEqualType "" && {_typeGroup isEqualTo ""}) then {
	_exit = true; 
    [localize "STR_A3A_reinf_addFIASquadHC_header", localize "STR_A3A_reinf_addFIASquadHC_error_not_supported"] call A3A_fnc_customHint;
};
if (_exit) exitWith {};

if (tierWar < 3 && {_typeGroup isEqualTo (FactionGet(reb,"groupAT"))}) exitWith {
	[localize "STR_A3A_reinf_addFIASquadHC_header", localize "STR_A3A_reinf_addFIASquadHC_error_AT_restr"] call SCRT_fnc_misc_deniedHint;
};

if (tierWar < 2 && {_typeGroup in (FactionGetRebel(A3A_faction_reb, "staticMGs") + FactionGetTieredFT(A3A_faction_reb,"vehiclesLightArmed", 0))}) exitWith {
	[localize "STR_A3A_reinf_addFIASquadHC_header", localize "STR_A3A_reinf_addFIASquadHC_error_MG_restr"] call SCRT_fnc_misc_deniedHint;
};

if (tierWar < 4 && {_typeGroup in (FactionGetRebel(A3A_faction_reb, "staticAT") + FactionGetRebel(A3A_faction_reb, "staticAA") + FactionGetRebel(A3A_faction_reb, "vehiclesAT") + FactionGetTieredFT(A3A_faction_reb,"vehiclesAA", 0) + [FactionGetTieredFT(A3A_faction_reb,"groupSquadSupp", 0)])}) exitWith {
	[localize "STR_A3A_reinf_addFIASquadHC_header", localize "STR_A3A_reinf_addFIASquadHC_error_ATAA_restr"] call SCRT_fnc_misc_deniedHint;
};

if (tierWar < 5 && {_typeGroup in (FactionGetRebel(A3A_faction_reb, "staticMortars"))}) exitWith {
	[localize "STR_A3A_reinf_addFIASquadHC_header", localize "STR_A3A_reinf_addFIASquadHC_error_mortar_restr"] call SCRT_fnc_misc_deniedHint;
};

private _isInfantry = false;
private _typeVehX = "";
private _costs = 0;
private _costHR = 0;
private _formatX = [];
private _format = "Squd-";

private _hr = server getVariable "hr";
private _resourcesFIA = server getVariable "resourcesFIA";

if (_typeGroup isEqualType []) then {
    _formatX = _typeGroup;
	{ _costs = _costs + (server getVariable _x); _costHR = _costHR +1 } forEach _typeGroup;

	if (_withBackpck == "MG") then {_costs = _costs + ([(FactionGetRebel(A3A_faction_reb, "staticMGs")) # 0] call A3A_fnc_vehiclePrice)};
	if (_withBackpck == "Mortar") then {_costs = _costs + ([(FactionGetRebel(A3A_faction_reb, "staticMortars")) # 0] call A3A_fnc_vehiclePrice)};
	_isInfantry = true;

} else {
    private _typeCrew = FactionGet(reb,"unitCrew");
	_costs = 2*(server getVariable _typeCrew) + ([_typeGroup] call A3A_fnc_vehiclePrice);
	if (_typeGroup in FactionGetRebel(A3A_faction_reb, "staticAA")) then { _costs = _costs + ([(FactionGetTieredFT(A3A_faction_reb,"vehiclesTruck", 0)) # 0] call A3A_fnc_vehiclePrice) };
    _formatX = [_typeCrew, _typeCrew];
	_costHR = 2;

	if ((_typeGroup in FactionGetRebel(A3A_faction_reb, "staticMortars")) or (_typeGroup in FactionGetTieredFT(A3A_faction_reb,"staticMGs", 0))) exitWith { _isInfantry = true };
};

if (_hr < _costHR) then {_exit = true; [localize "STR_A3A_reinf_addFIASquadHC_header", format [localize "STR_A3A_reinf_addFIASquadHC_error_not_enough_hr",_costHR]] call SCRT_fnc_misc_deniedHint;};

if (_resourcesFIA < _costs) then {_exit = true; [localize "STR_A3A_reinf_addFIASquadHC_header", format [localize "STR_A3A_reinf_addFIASquadHC_error_not_enough_money",_costs, A3A_faction_civ get "currencySymbol"]] call SCRT_fnc_misc_deniedHint;};

if (_exit) exitWith {};

private _mounts = [];
private _vehType = switch true do {
    case (!_isInfantry && {_typeGroup in FactionGetRebel(A3A_faction_reb, "staticAA")}): {
        if (FactionGetRebel(A3A_faction_reb, "vehiclesAA") isEqualTo []) exitWith {_mounts pushBack [(FactionGetTieredFT(A3A_faction_reb,"staticAA", 0)) # 0,-1,[[1],[],[]]]; (FactionGetTieredFT(A3A_faction_reb,"vehiclesTruck", 0)) # 0};
        (FactionGetRebel(A3A_faction_reb, "vehiclesAA")) # 0
    };
    case (!_isInfantry): {_typeGroup};
    case (count _formatX isEqualTo 2): {(FactionGetRebel(A3A_faction_reb, "vehiclesBasic")) # 0};
    case (count _formatX > 4): {(FactionGetRebel(A3A_faction_reb, "vehiclesTruck")) # 0};
    default {(FactionGetRebel(A3A_faction_reb, "vehiclesLightUnarmed")) # 0};
};
private _idFormat = switch true do {
    case (_typeGroup isEqualTo (FactionGet(reb,"groupMedium"))): {"Tm-"};
    case (_typeGroup isEqualTo (FactionGet(reb,"groupAT"))): {"AT-"};
    case (_typeGroup isEqualTo (FactionGet(reb,"groupSniper"))): {"Snpr-"};
    case (_typeGroup isEqualTo (FactionGet(reb,"groupSentry"))): {"Stry-"};
    case (_typeGroup isEqualTo (FactionGet(reb,"groupCrew"))): {"Crew-"};
    case (_typeGroup in (FactionGetRebel(A3A_faction_reb, "staticMortars"))): {"Mort-"};
    case (_typeGroup in (FactionGetRebel(A3A_faction_reb, "staticMGs"))): {"MG-"};
    case (_typeGroup in (FactionGetRebel(A3A_faction_reb, "vehiclesAT"))): {"M.AT-"};
    case (_typeGroup in (FactionGetRebel(A3A_faction_reb, "vehiclesLightArmed"))): {"M.MG-"};
    case (_typeGroup in (FactionGetRebel(A3A_faction_reb, "staticAA"))): {"M.AA-"};
    default {
        switch _withBackpck do {
            case "MG": {"SqMG-"};
            case "Mortar": {"Mortar"};
            default {"Squd-"};
        };
    };
};
private _special = if (_isInfantry) then {
    if (_typeGroup isEqualType []) then { _withBackpck } else {"staticAutoT"};
} else {
    if (_mounts isNotEqualTo []) exitWith {"BuildAA"};
    "VehicleSquad"
};

private _fnc_placeCheck = {
    params ["_vehicle"];
    [getMarkerPos respawnTeamPlayer distance _vehicle > 50, "You cant place HC vehicles further than 50m from HQ"];
};
private _fnc_placed = {
    params ["_vehicle", "_formatX", "_idFormat", "_special"];
    [_formatX, _idFormat, _special, _vehicle] spawn A3A_fnc_spawnHCGroup;
};

private _vehiclePlacementMethod = if (getMarkerPos respawnTeamPlayer distance player > 50) then {
    {
        private _searchCenter = getMarkerPos respawnTeamPlayer getPos [20 + random 30, random 360];
        private _spawnPos = _searchCenter findEmptyPosition [0, 30, _vehType];
        if (_spawnPos isEqualTo []) then {_spawnPos = _searchCenter};
        private _vehicle = _vehType createVehicle _spawnPos;

        if (_mounts isNotEqualTo []) then {
            private _static = (FactionGetRebel(A3A_faction_reb, "staticAA")) # 0 createVehicle _spawnPos;
            private _nodes = [_vehicle, _static] call A3A_Logistics_fnc_canLoad;
            if (_nodes isEqualType 0) exitWith {};
            (_nodes + [true]) call A3A_Logistics_fnc_load;
            _static call HR_GRG_fnc_vehInit;
        };

        [_formatX, _idFormat, _special, _vehicle] spawn A3A_fnc_spawnHCGroup;
    }
} else { HR_GRG_fnc_confirmPlacement };

if (!_isInfantry) exitWith { [_vehType, _fnc_placed, _fnc_placeCheck, [_formatX, _idFormat, _special], _mounts] call _vehiclePlacementMethod };

private _vehCost = [_vehType] call A3A_fnc_vehiclePrice;
if (_isInfantry and (_costs + _vehCost) > server getVariable "resourcesFIA") exitWith {
    [localize "STR_A3A_reinf_addFIASquadHC_header", format [localize "STR_A3A_reinf_addFIASquadHC_error_not_enough_money_barefoot",_vehCost, A3A_faction_civ get "currencySymbol"]] call A3A_fnc_customHint;
    [_formatX, _idFormat, _special, objNull] spawn A3A_fnc_spawnHCGroup;
};

#ifdef UseDoomGUI
    ERROR("Disabled due to UseDoomGUI Switch.")
#else
    createDialog "vehQuery";
#endif

sleep 1;
disableSerialization;
private _display = findDisplay 100;

if (str (_display) != "no display") then {
	private _ChildControl = _display displayCtrl 104;
	_ChildControl  ctrlSetTooltip format [localize "STR_dialog_fia_squad_hc_buy_veh", _vehCost, A3A_faction_civ get "currencySymbol"];
	_ChildControl = _display displayCtrl 105;
	_ChildControl  ctrlSetTooltip localize "STR_dialog_fia_squad_hc_barefoot";
};

waitUntil {(!dialog) or (!isNil "vehQuery")};
if ((!dialog) and (isNil "vehQuery")) exitWith { [_formatX, _idFormat, _special, objNull] spawn A3A_fnc_spawnHCGroup }; //spawn group call here

vehQuery = nil;
[_vehType, _fnc_placed, _fnc_placeCheck, [_formatX, _idFormat, _special], _mounts] call _vehiclePlacementMethod;

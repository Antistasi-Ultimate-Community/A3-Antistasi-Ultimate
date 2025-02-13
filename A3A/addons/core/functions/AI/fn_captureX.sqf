#include "..\..\script_component.hpp"

private _unit = _this select 0;
private _playerX = _this select 1;
private _recruiting = _this select 3 select 0;
private _recruitToSquad = _this select 3 select 1;

[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];

if (!alive _unit) exitWith {};

private _sideX = side (group _unit);
private _interrogated = _unit getVariable ["interrogated", false];

private _modAggro = [0, 0];
private _modHR = false;
private _response = "";
private _fleeSide = _sideX;
private _joinPlyGroup = false;

private _unitPrefix = _unit getVariable "unitPrefix";

if (_recruiting) then {
	_playerX globalChat localize "STR_recruit_text";

	private _chance = switch (true) do {
		case ("militia" isEqualTo _unitPrefix): {
			60;
		};
		case (_sideX == Occupants): {
			40;
		};
		case (_sideX == Invaders): {
			20;
		};
		default {
			0;
		};
	};

	if (_interrogated) then { _chance = _chance / 2 };

	if (random 100 < _chance) then
	{
		if (_recruitToSquad && {count units _playerX < 10}) then {
			_joinPlyGroup = true;
		};
		_modAggro = [1, 30];
		_response = localize "STR_recruit_success_text";
		_modHR = true;
		_fleeSide = teamPlayer;
	}
	else
    {
		_response =  localize "STR_recruit_fail_text";
		_modAggro = [0, 0];
	};
}
else {
	_playerX globalChat localize "STR_release_request_text";
	_response = selectRandom [
		localize "STR_release_response_one_text",
		localize "STR_release_response_two_text",
		localize "STR_release_response_three_text"
	];

    _modAggro = [-3, 30];

	[player, _sideX] call SCRT_fnc_common_givePrisonerReleasePaycheck;
	[5,player] call A3A_fnc_addScorePlayer;
};


sleep 2;
_unit globalChat _response;
if (_joinPlyGroup) then {
	// * preserve original unit identity for new recruit
	private _nameUnit = (name _unit) splitString " ";
	private _identityUnit = createHashMapFromArray [
		["face", face _unit],
		["speaker", _unit getVariable "A3U_PoW_speaker"],
		["firstName", _nameUnit select 0],
		["lastName", _nameUnit select 1]
	];
	private _uniformUnit = uniform _unit;
	private _posUnit = position _unit;
	deleteVehicle _unit;

	private _recruit = [group player, "loadouts_reb_militia_Unarmed", _posUnit, [], 0, "NONE", _identityUnit] call A3A_fnc_createUnit;
	[_recruit, true] spawn A3A_fnc_FIAinit;
	_recruit setUnitLoadout [ [], [], [], [_uniformUnit, []], [], [], "", "", [], ["","","","","",""] ];
	_recruit disableAI "AUTOCOMBAT"; // ? not sure what this does. But it's used after creating a unit in fn_reinfPlayer.
	sleep 1;
	_recruit setVariable ["unitType", "loadouts_reb_militia_Rifleman", true]; // * allows the AI to be dismissed or garrisoned. Needs to be set AFTER FIAinit so we don't equip the rebel.
} else {
	[_unit, _fleeSide] remoteExec ["A3A_fnc_fleeToSide", _unit];

	private _group = group _unit;		// Group should be surrender-specific now
	sleep 100;
	if (alive _unit && {!(_unit getVariable ["incapacitated", false])}) then
	{
		([_sideX] + _modAggro) remoteExec ["A3A_fnc_addAggression",2];
		if (_modHR) then { [1,0] remoteExec ["A3A_fnc_resourcesFIA",2] };
	};

	deleteVehicle _unit;
	deleteGroup _group;
};

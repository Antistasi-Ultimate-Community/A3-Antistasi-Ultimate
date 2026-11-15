// SERVER: puts the trader and their stall into the world (only done while
// players are nearby - see fn_vendorLoop).
#include "..\script_component.hpp"
params [["_e", [], [[]]]];
if (_e isEqualTo []) exitWith {};
_e params ["_id", "_town", "_pos", "_dir", "_civ", "_vname"];
if (!isNull ([_id] call ABZ_fnc_vendorUnit)) exitWith {};
// a stale entry (the unit was deleted under us) still owns props: clear
// them first, or the tables pile up
if (_id in ABZ_vendorObjs) then { [_id] call ABZ_fnc_vendorDespawn };
if !(isClass (configFile >> "CfgVehicles" >> _civ)) then { _civ = "C_man_1" };

private _grp = createGroup [civilian, true];
// never let a headless-client balancer take him: disableAI does not survive
// an owner change, and a trader who walks off breaks the stall
{ _grp setVariable [_x, true, true] } forEach ["acex_headless_blacklist", "ace_headless_blacklist", "Vcm_Disable"];
private _u = _grp createUnit [_civ, _pos, [], 0, "CAN_COLLIDE"];
_u setPosATL _pos;
_u setDir _dir;
{ _u setVariable [_x, true, true] } forEach ["acex_headless_blacklist", "ace_headless_blacklist"];
removeAllWeapons _u;
removeBackpackGlobal _u;	// nothing to loot, and no "Open Bag" prompt competing with ours
removeAllItems _u;
[_u] call ABZ_fnc_vendorPrep;
_u setVariable ["ABZ_vendorId", _id, true];
_u setVariable ["ABZ_vendorName", _vname, true];

// MPKilled fires on every machine wherever the unit is local, so a death is
// never missed even if ownership moved; only the server acts on it
_u addMPEventHandler ["MPKilled", {
	params ["_unit", ["_killer", objNull], ["_instigator", objNull]];
	if (!isServer) exitWith {};
	private _id = _unit getVariable ["ABZ_vendorId", -1];
	if (_id >= 0) then { [_id, _unit, [_instigator, _killer] select (isNull _instigator)] call ABZ_fnc_vendorKilled };
}];
// if anything moves him off the server, take him straight back and re-prep
_u addEventHandler ["Local", {
	params ["_unit", "_isLocal"];
	if (_isLocal) then {
		[_unit] call ABZ_fnc_vendorPrep;
	} else {
		if (isServer && {!isNull group _unit}) then {
			Warning_2("[ABZ] Trader #%1 left the server (owner %2) - taking him back",_unit getVariable ["ABZ_vendorId", -1],owner _unit);
			(group _unit) setGroupOwner 2;
		};
	};
}];

// the stall: a table with cases on it and a sunshade. SIMPLE objects on
// purpose - a physics object with its simulation frozen still shoves (and
// hurts, even kills) a player who brushes against it; a simple object has
// no physics at all, like the map's own furniture. Same trick Antistasi's
// arms dealer tent uses for its chair and desk.
private _props = [];
private _fnc_prop = {
	params ["_cls", "_rel", "_pdir"];
	if !(isClass (configFile >> "CfgVehicles" >> _cls)) exitWith {};
	_rel params ["_rx", "_ry"];
	// model-relative offset (x right, y forward) rotated by the stall's facing
	private _at = _pos vectorAdd [_rx * cos _dir + _ry * sin _dir, -_rx * sin _dir + _ry * cos _dir, 0];
	private _p = [_cls, ATLToASL _at, _dir + _pdir] call BIS_fnc_createSimpleObject;
	if (isNull _p) exitWith {};
	_p setDir (_dir + _pdir);
	_p setPosATL _at;
	_p setVariable ["ABZ_prop", true, true];
	_p setVariable ["ABZ_vendorId", _id, true];	// looking at the stall counts as talking to the trader
	_props pushBack _p;
};
["Land_WoodenTable_large_F", [0, 1.3], 0] call _fnc_prop;
["Land_PlasticCase_01_medium_F", [-1.6, 1.0], 25] call _fnc_prop;
["Land_PlasticCase_01_large_F", [1.7, 0.9], -20] call _fnc_prop;
["Land_Sunshade_F", [0.9, 2.3], 0] call _fnc_prop;

ABZ_vendorObjs set [_id, [_u, _props]];
Info_3("[ABZ] Trader %1 (#%2) spawned at %3",_vname,_id,_town);

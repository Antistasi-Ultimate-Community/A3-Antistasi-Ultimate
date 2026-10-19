// Makes sure every Bazaar scroll-wheel action exists on a unit, re-adding
// them if anything took them away. Called from the CBA "unit" player event
// AND every ~1.5s from the client keeper loop (XEH_postInit).
//
// Why the keeper: without ACE medical, Antistasi's revive runs
// `removeAllActions player` every time a player is downed and picked up
// (A3A_fnc_unconscious -> A3A_fnc_flagaction "remove"), and its carry/drag
// does the same. The unit object stays the same, so no CBA unit event fires.
// The v1.0.x one-shot guard never re-added them: the Bazaar went dead after
// the first revive until the next respawn or a game restart.
//
// Presence is checked by action id AND title (actionParams), never by a flag.
params [["_unit", objNull, [objNull]], ["_force", false, [false]]];
if (isNull _unit) exitWith {};

private _have = _unit getVariable ["ABZ_actionIds", []];	// [[id, title], ...]
private _intact = _have isNotEqualTo [] && {(_have findIf {
	((_unit actionParams (_x select 0)) param [0, ""]) isNotEqualTo (_x select 1)
}) == -1};
if (_intact && {!_force}) exitWith {};

// remove any of ours that survived - only ids whose title is still ours, so
// we never delete another mod's action that inherited a recycled id
{
	_x params ["_id", "_title"];
	if (((_unit actionParams _id) param [0, ""]) isEqualTo _title) then { _unit removeAction _id };
} forEach _have;

private _defs = [
	[
		"<t color='#f1c27d'>Browse the Bazaar</t>",
		{ [[_this select 1] call ABZ_fnc_nearVendor] call ABZ_fnc_openShop },
		6, true,	// priority 6: above Open Bag (1.62), Talk (2), Load (3); below Treat self (9.9) and ladders (10)
		"([_this] call ABZ_fnc_nearVendor) >= 0"
	],
	[
		// v1.1.0: at the destination stall of my smuggling run
		"<t color='#ffb060'>Hand Over the Smuggled Crate</t>",
		{ ["ABZ_runDeliver", [_this select 1]] call CBA_fnc_serverEvent },
		5.9, true,
		"ABZ_myRunDest >= 0 && {([_this] call ABZ_fnc_nearVendor) == ABZ_myRunDest}"
	],
	[
		"<t color='#f1c27d'>Inspect Bazaar Crate</t>",
		{ [cursorObject] call ABZ_fnc_crateInfo },
		1.5, false,
		"private _t = cursorObject; !isNull _t && {((_t getVariable ['ABZ_crate', []]) isNotEqualTo []) || {(_t getVariable ['ABZ_runId', -1]) >= 0}} && {_this distance _t < 5}"
	],
	[
		"<t color='#a0ffa0'>Unpack Crate Into Arsenal</t>",
		{ ["ABZ_unpack", [cursorObject, _this select 1]] call CBA_fnc_serverEvent },
		1.55, true,
		"private _t = cursorObject; !isNull _t && {(_t getVariable ['ABZ_crate', []]) isNotEqualTo []} && {_this distance _t < 6} && {[_t] call ABZ_fnc_atHQ}"
	],
	[
		// v1.1.0 "Unpack From The Truck": every sealed crate within 20m, loaded or not
		"<t color='#a0ffa0'>Unpack Every Bazaar Crate Here (20m)</t>",
		{ ["ABZ_unpackAll", [_this select 1]] call CBA_fnc_serverEvent },
		1.56, true,
		"ABZ_unpackHere > 0"
	]
];

// Fallback cargo handling for servers WITHOUT Antistasi's logistics (which
// already knows how to load this crate class into vehicles)
if (isNil "A3A_Logistics_fnc_addLoadAction") then {
	_defs pushBack [
		"<t color='#ffd080'>Load Crate Into Vehicle</t>",
		{ ["ABZ_crateLoad", [cursorObject, call ABZ_fnc_loadTarget, _this select 1]] call CBA_fnc_serverEvent },
		1.5, true,
		"private _t = cursorObject; !isNull _t && {(_t getVariable ['ABZ_crate', []]) isNotEqualTo []} && {_this distance _t < 5} && {isNull attachedTo _t} && {!isNull (call ABZ_fnc_loadTarget)}"
	];
	_defs pushBack [
		"<t color='#ffd080'>Unload Bazaar Crates</t>",
		{ ["ABZ_crateUnload", [cursorObject, _this select 1]] call CBA_fnc_serverEvent },
		1.5, true,
		"private _t = cursorObject; !isNull _t && {_this distance _t < 8} && {((_t getVariable ['ABZ_loaded', []]) findIf { !isNull _x && {(attachedTo _x) isEqualTo _t} }) > -1}"
	];
};

private _ids = [];
{
	_x params ["_title", "_code", "_prio", "_window", "_cond"];
	private _id = _unit addAction [_title, _code, nil, _prio, _window, true, "", _cond];
	_ids pushBack [_id, _title];
} forEach _defs;
_unit setVariable ["ABZ_actionIds", _ids];

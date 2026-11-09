// Client: the id of the trader this unit is standing at, or -1.
// Three ways to count as "at the stall", checked in order:
//   1. looking at the trader or his table/cases within 6m
//   2. a living trader within 6m
//   3. within 6m of a stall position the server publishes (ABZ_stalls), so
//      the prompt does not depend on the trader unit's variables arriving
// Called every frame from the action condition - keep it cheap: no sorting,
// no allocation beyond one nearEntities.
// NOTE (v1.0.2): the v1.0.1 version had its cursor branch inside an
// if/then with exitWith, which only leaves the then-block - so looking at
// the stall never counted. Every exit here is at the top level.
params [["_unit", objNull, [objNull]]];
if (!hasInterface) exitWith { -1 };
if (isNull _unit) then { _unit = player };
if (isNull _unit || {!alive _unit} || {!isNull objectParent _unit}) exitWith { -1 };
// downed players don't trade (Antistasi's revive makes them captive, which
// would otherwise pass for undercover)
if (lifeState _unit == "INCAPACITATED" || {_unit getVariable ["incapacitated", false]}) exitWith { -1 };

private _res = -1;
private _o = cursorObject;
if (!isNull _o && {_unit distance _o < 6}) then {
	_res = _o getVariable ["ABZ_vendorId", -1];
	if !(_res isEqualType 0) then { _res = -1 };
	if (_o isKindOf "CAManBase" && {!alive _o}) then { _res = -1 };	// a dead trader's body is not a stall
};
if (_res >= 0) exitWith { _res };

private _best = 6;
{
	if (alive _x) then {
		private _id = _x getVariable ["ABZ_vendorId", -1];
		private _d = _unit distance _x;
		if (_id isEqualType 0 && {_id >= 0} && {_d < _best}) then { _best = _d; _res = _id };
	};
} forEach (_unit nearEntities ["CAManBase", 6]);
if (_res >= 0) exitWith { _res };

_best = 6;
{
	_x params [["_id", -1], ["_p", [0, 0, 0]], ["_centre", []]];
	private _d = _unit distance2D _p;
	if (_d < _best) then { _best = _d; _res = _id };
} forEach (missionNamespace getVariable ["ABZ_stalls", []]);
_res

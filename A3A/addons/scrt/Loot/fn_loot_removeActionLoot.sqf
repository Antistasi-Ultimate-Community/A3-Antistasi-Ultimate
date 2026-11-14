params ["_vehicle"];

private _lootActionID = _vehicle getVariable ["lootActionID", nil];
if(!isNil "_lootActionID") then {
	[_vehicle, _lootActionID] call BIS_fnc_holdActionRemove;
	_vehicle setVariable ["lootActionID", nil];
};

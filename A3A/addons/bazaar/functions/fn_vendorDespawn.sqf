// SERVER: removes a trader's unit and stall from the world (the entry and
// its stock stay - they come back when a player returns).
params [["_id", -1, [0]]];
private _o = ABZ_vendorObjs getOrDefault [_id, []];
if (_o isEqualTo []) exitWith {};
_o params ["_u", "_props"];
{ if (!isNull _x) then { deleteVehicle _x } } forEach _props;
if (!isNull _u) then {
	private _g = group _u;
	deleteVehicle _u;
	if (!isNull _g && {(units _g) isEqualTo []}) then { deleteGroup _g };
};
ABZ_vendorObjs deleteAt _id;

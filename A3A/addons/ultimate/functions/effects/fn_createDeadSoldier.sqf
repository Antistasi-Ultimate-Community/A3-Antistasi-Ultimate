params ["_unitType", "_position", "_faction"];

private _tempGroup = createGroup civilian;

private _unitTypeFinal = _faction get _unitType;
private _identity = [_faction, _unitTypeFinal] call A3A_fnc_createRandomIdentity;
private _unit = [_tempGroup, _unitTypeFinal, _position, [], 0, "NONE", _identity] call A3A_fnc_createUnit;
_unit setDir (random 360);

_unit setDamage 1;

private _bloodSplat = createVehicle [
	(selectRandom ["BloodPool_01_Large_New_F", "BloodSplatter_01_Large_New_F", "BloodSplatter_01_Medium_New_F", "BloodPool_01_Medium_New_F"]),
	(getPosATL _unit),
	[], 
	0,
	"CAN_COLLIDE"
];

_unit;
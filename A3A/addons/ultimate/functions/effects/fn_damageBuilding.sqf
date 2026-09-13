params [["_building", ObjNull]];

if (_building isEqualTo ObjNull) exitWith {};

private _effects = [];

_building setDamage random [0.7, 0.9, 1];
private _buildingPos = position _building;
private _buildingCollision = 2 boundingBoxReal _building;
private _p1 = _buildingCollision select 0;
private _p2 = _buildingCollision select 1;
private _maxHeight = abs ((_p2 select 2) - (_p1 select 2));

private _bAtlPos = (getPosATL _building);
private _bMinHeightAsl = ATLToASL _bAtlPos;
private _bMaxHeightAsl = ATLToASL ([_bAtlPos select 0, _bAtlPos select 1, _maxHeight]);

private _realRoofHeightAsl = ((lineIntersectsSurfaces [_bMaxHeightAsl, _bMinHeightAsl]) select 0) select 0;
if (!isNil "_realRoofHeightAsl") then {
    private _effect = ObjNull;
    if (random 100 <= 50) then {
        if (random 100 >= 70) then {
            _effect = createVehicle ["test_EmptyObjectForSmoke", _buildingPos, [], 0, "CAN_COLLIDE"];
            _effect setPosASL _realRoofHeightAsl;
        } else {
            _effect = [_buildingPos] call A3U_fnc_createFire;
            {_x setPosASL _realRoofHeightAsl} forEach _effect;
        };
    } else {
        _building setDamage 1;
    };
    _effects pushBack _effect;
};

_building animate ["door_1A_move",1];
_building animate ["door_1B_move",1];
_building animate ["door_2_rot",1];
_building animate ["door_3_rot",1];

_effects;
//Credits to killzonekid
lineIntersectsSurfaces [
    getPosWorld _this, 
    getPosWorld _this vectorAdd [0, 0, 50], 
    _this, objNull, true, 1, "GEOM", "NONE"
] select 0 params ["","","","_house"];


if (isNil "_house") exitWith {false};
if (_house isKindOf "House") exitWith {true};

false

params [["_nameX", ""], ["_pos", []], ["_size", 0]];

private _mrk = createMarkerLocal [format ["%1", _nameX], _pos];
_mrk setMarkerSizeLocal [_size, _size];
_mrk setMarkerShapeLocal "RECTANGLE";
_mrk setMarkerBrushLocal "SOLID";
_mrk setMarkerColorLocal colorOccupants;
_mrk setMarkerTextLocal _nameX;
_mrk setMarkerAlpha 0;

spawner setVariable [_nameX, 2, true];

private _dmrk = createMarkerLocal [format ["Dum%1", _nameX], _pos];
_dmrk setMarkerShapeLocal "ICON";
_dmrk setMarkerTypeLocal "loc_Ruin";
_dmrk setMarkerColor colorOccupants;

sidesX setVariable [_mrk, Occupants, true];
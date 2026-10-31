
params ["_x", "_y", "_z"];

private _x2 = ((_x select 0) + ((cos (90-_z)) * _y));
private _y2 = ((_x select 1) + ((sin (90-_z)) * _y));

[_x2, _y2, 0]

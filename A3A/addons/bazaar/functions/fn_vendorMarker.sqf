// SERVER: (re)creates a trader's map marker per the "Map markers" setting.
params [["_e", [], [[]]]];
if (_e isEqualTo []) exitWith {};
_e params ["_id", "_town", "_pos", "", "", "_vname", "", "", "", "_state", "", "_center"];

private _name = format ["ABZ_vendor_%1", _id];
deleteMarker _name;
private _mode = missionNamespace getVariable ["ABZ_markerMode", 1];
if (_mode == 0 || {_state != "ok"}) exitWith {};

private _m = createMarker [_name, [_center, _pos] select (_mode == 2)];
_m setMarkerType "mil_dot";
_m setMarkerColor "ColorOrange";
_m setMarkerText ([format ["Bazaar - %1", _town], format ["Bazaar - %1 (%2)", _vname, _town]] select (_mode == 2));

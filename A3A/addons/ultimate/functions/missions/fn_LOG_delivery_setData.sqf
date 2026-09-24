params ["_marker", "_data"];

private _markerNamespace = [_marker] call A3U_fnc_LOG_delivery_format;

missionNamespace setVariable [_markerNamespace, _data];
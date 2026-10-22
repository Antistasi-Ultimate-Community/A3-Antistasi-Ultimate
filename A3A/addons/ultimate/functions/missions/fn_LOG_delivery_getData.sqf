params ["_marker"];

private _markerNamespace = [_marker] call A3U_fnc_LOG_delivery_format;

private _data = missionNamespace getVariable [_markerNamespace, []];

_data;
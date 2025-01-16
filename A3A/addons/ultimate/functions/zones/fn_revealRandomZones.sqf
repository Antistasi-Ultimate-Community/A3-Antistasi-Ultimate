/*
    Author:
    Silence

    Description:
    Reveals random military zones.

    Params:
	_amount    <INT> <DEFAULT: 2>
	_message   <STRING> <DEFAULT: ""> <Gives random message if value == "">

    Usage:
    [5, "A developer has revealed some zones."] call A3U_fnc_revealRandomZones;

    Return:
    _message   <STRING>
*/

params [
    ["_amount", 2],
    ["_message", ""]
];

if !(isServer) exitWith {
    [_amount, _message] remoteExec ["A3U_fnc_revealRandomZones", 2];
};

if (_amount isEqualTo 0) then {
    _amount = 1;
};

if (_message isEqualTo "") then {
    _message = selectRandom
    [
        "Civilians sympathetic to our cause gave us some intel on enemy zones.", // To-Do: Localize
        "A map marked with enemy locations was found by one of our comrades." // To-Do: Localize
    ];
};

private _availableMarkers = [];
private _unhiddenMarkers = [];

{
    private _markerSide = sidesX getVariable [_x, sideUnknown];
    if (_x in markersImmune) then {} else {
        if (_markerSide isNotEqualTo resistance) then {
            _availableMarkers pushBack _x;
        };
    };
} forEach markersX;

if (_availableMarkers isEqualTo []) exitWith {["Aborting function. All markers are revealed already.", _fnc_scriptName] call A3U_fnc_log};

// Grab random markers (if available)
for "_i" from 0 to (_amount - 1) do {
    private _marker = selectRandom _availableMarkers;
    _unhiddenMarkers pushBack _marker;
};

[_unhiddenMarkers] call A3U_fnc_revealZones; // reveal the zones

private _markerGrids = _message+"<br/><br/>The following zones have been revealed:<br/>"; // To-Do: Localize

{
    private _gridPos = (_x call BIS_fnc_posToGrid) joinString "";
    private _name = toLower _x splitString "_";
    _markerGrids = _markerGrids + "<br/>" + _gridPos + "<br/>" + (_name select 0) + "<br/>"; // <br/> gridcoords <br/> zonetype <br/>
} forEach _unhiddenMarkers;

[format["%1 marker(s) were revealed."], _fnc_scriptName] call A3U_fnc_log;

["Zone Information", _markerGrids] remoteExec ["A3A_fnc_customHint", 0, false];

_message;
/*
    Author:
    Silence

    Description:
    Reveals a zone.

    Params:
	_marker    <STRING>

    Usage:
    ["outpost_1"] call A3U_fnc_revealZone;

    Return:
    N/A
*/
#include "..\..\script_component.hpp"

params ["_marker"];

if !(hideEnemyMarkers) exitWith {Error("Aborting function, hideEnemyMarkers is not enabled.")};
if (_marker isEqualTo "") exitWith {Error("Aborting function, _marker does not exist.")};

private _markerText = markerText "Dum"+_marker;
private _markerTextSplit = toLower ((_markerText splitString "_") select 0);
"Dum"+_marker setMarkerAlphaLocal 1;
"Dum"+_marker setMarkerText "Revealed "+_markerTextSplit;
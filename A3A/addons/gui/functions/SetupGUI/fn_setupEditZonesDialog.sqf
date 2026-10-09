/*
function: A3A_fnc_setupEditZonesDialog
    This function should only be called from setupDialog onLoad and control activation EHs.

Author: John Jordan (jaj22)

Maintainer : John Woodruff (jwoodruff40) [This file based on fn_setupHQPosDialog.sqf]

Environment: Scheduled for onLoad mode / Unscheduled for everything else unless specified

Arguments:
    <STRING> Mode, e.g. "onLoad", "switchTab"
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Modes:
    - onload called on creation to setup dialog
    - onUnload called on deletion to handle deletion of dialog
    - mouseUp called on mouseUp event from the dialog, handles pos not allowed

Return Value:
    Nothing

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_mode", "_params"];

Debug_1("Edit map dialog called with mode %1", _mode);

private _display = findDisplay A3A_IDD_EDITZONES_DIALOG;
private _parent = displayParent _display;

switch (_mode) do
{
    case ("onLoad"):
    {
        private _allEnemyMarkers = (markersX - controlsX - citiesX - ["Synd_HQ"]);
        private _occMarkers = _allEnemyMarkers select { sidesX getVariable [_x, Occupants] isEqualTo Occupants };
        private _invMarkers = _allEnemyMarkers select { sidesX getVariable [_x, Occupants] isEqualTo Invaders };

        _display setVariable ["dangerZones", _allEnemyMarkers];

        // ! Override airport marker type to force them to show on the map
        { _x setMarkerTypeLocal "A3AU_airport_mrk" } forEach (airportsX apply {"Dum"+_x});

        // ! Force hide fuel stations because they clutter the map way too much
        { _x setMarkerAlpha 0 } forEach (fuelStationsX);

        // ! Force enable enemy zone hiding variables to control marker visibility
        hideEnemyMarkers = true;
        revealedZones = _allEnemyMarkers;
        markersImmune = [];
        publicVariable "hideEnemyMarkers";
        publicVariable "revealedZones";
        publicVariable "markersImmune";

        ["updateZoneVisibility", []] call A3A_fnc_setupEditZonesDialog;
    };

    case ("onUnload"): {
        // ! Reset airport marker type and color
        {
            _x setMarkerTypeLocal "";
            _x setMarkerColor "colorUNKNOWN";
        } forEach (airportsX apply {"Dum"+_x});

        // ! Reset fuel station marker visibility
        { _x setMarkerAlpha 1 } forEach (fuelStationsX);

        // ! Reset enemy zone hiding variables
        missionNamespace setVariable ["hideEnemyMarkers", nil, true];
        missionNamespace setVariable ["revealedZones", nil, true];
        missionNamespace setVariable ["markersImmune", nil, true];

        // ! Publish sidesX
        publicVariable "sidesX";
    };

    case ("mouseUp"):
    {
        _params params ["_mapCtrl", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
        if (_button != 0) exitWith {};          // left mouse button only

        private _posClicked = _mapCtrl posScreenToWorld [_xPos, _yPos];
        private _titleStr = localize "STR_antistasi_dialogs_setup_ez_feedback_title";

        private _nearMarker = [_display getVariable "dangerZones", _posClicked] call BIS_fnc_nearestPosition;
        if (markerPos _nearMarker distance2d _posClicked > 500) exitWith {
            [_titleStr, localize "STR_antistasi_dialogs_setup_ez_feedback_nomarker"] call A3A_fnc_customHint;
        };

        if (surfaceIsWater _posClicked) exitWith {
            [_titleStr, localize "STR_antistasi_dialogs_setup_ez_feedback_inwater"] call A3A_fnc_customHint;
        };

        if (_posClicked findIf { (_x < 0) || (_x > worldSize) } != -1) exitWith {
            [_titleStr, localize "STR_antistasi_dialogs_setup_ez_feedback_outsidemap"] call A3A_fnc_customHint;
        };


        private _markerSide = sidesX getVariable [_nearMarker, Occupants];
        private _wasInvader = _markerSide isEqualTo Invaders;
        sidesX setVariable [_nearMarker, [Invaders, Occupants] select _wasInvader];
        [_nearMarker] call A3A_fnc_mrkUpdate;

        ["updateZoneVisibility", []] call A3A_fnc_setupEditZonesDialog;
    };

    case ("updateZoneVisibility"):
    {
        // ! This is a dirty hack to update zone visibility in the pre-game start map by forcing usage of the hide enemy markers / revealed zones system
        private _outpostsCheck = cbChecked (_display displayCtrl A3A_IDC_EDITZONES_OUTPOSTSCHECKBOX);
        private _milbasesCheck = cbChecked (_display displayCtrl A3A_IDC_EDITZONES_MILBASESCHECKBOX);
        private _airportsCheck = cbChecked (_display displayCtrl A3A_IDC_EDITZONES_AIRPORTSCHECKBOX);
        private _resourcesCheck = cbChecked (_display displayCtrl A3A_IDC_EDITZONES_RESOURCESCHECKBOX);
        private _factoriesCheck = cbChecked (_display displayCtrl A3A_IDC_EDITZONES_FACTORIESCHECKBOX);

        //{ _x setMarkerAlphaLocal ([0, 1] select _airportsCheck) } forEach (airportsX apply { "Dum"+_x });

        private _revealedZones = [];
        if (_outpostsCheck) then { _revealedZones append outposts };
        if (_milbasesCheck) then { _revealedZones append milbases };
        if (_airportsCheck) then { _revealedZones append airportsX };
        if (_resourcesCheck) then { _revealedZones append resourcesX };
        if (_factoriesCheck) then { _revealedZones append factories };

        revealedZones = _revealedZones;
        publicVariable "revealedZones";
        [_display getVariable ["dangerZones", []]] call A3U_fnc_mrkUpdateBulk;
    };
};

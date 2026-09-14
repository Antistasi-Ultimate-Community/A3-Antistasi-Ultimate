#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3USPCM_garrison_fnc_changeLocationOwner

Description:
    Changes the owner of a location

Parameters:
    0: _marker - Location marker name <STRING>

Optional:

Example:
    (begin example)
    ["outpost"] call A3USPCM_garrison_fnc_changeLocationOwner;
    (end example)

Returns:
    Nothing

Author:
    goreSplatter
---------------------------------------------------------------------------- */
params[
    ["_marker", "", [""]]
];

private _owner = sidesX getVariable[_marker, sideUnknown];
private _newOwner = [teamPlayer,west] select(_owner isEqualTo teamPlayer);
private _guiCaption = format[LLSTRING(RscA3USPCMGarrisonManagerDialog_ChangeOwnership_Caption), _marker];
private _guiText = format[LLSTRING(RscA3USPCMGarrisonManagerDialog_ChangeOwnership_Confirm), _owner, _newOwner];

if !([_guiText, _guiCaption, true, true] call BIS_fnc_guiMessage) exitWith {};
TRACE_3(QFUNC(onMapButtonUp),_marker,_owner,_newOwner);

[_newOwner, _marker] remoteExec ["A3A_fnc_markerChange", 2];
[] spawn {
    uiSleep 0.25;
    [] call FUNC(updateList);
};

nil;

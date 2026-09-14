#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3USPCM_garrison_fnc_updateGarrison

Description:
    Update selected location's garrison information

Parameters:

Optional:

Example:

Returns:
    Nothing

Author:
    goreSplatter
---------------------------------------------------------------------------- */
params[["_listbox",controlNull,[controlNull]], ["_index",0,[0]]];
private _entry = GVAR(lbEntries) getOrDefault[_index, false];

if !assert(_entry isEqualType createHashMap) exitWith {};

private _info = [_entry] call FUNC(getGarrisonInfo);
private _color = GVAR(markerColors) getOrDefault[_entry get "color", [1,0,1,1]];

{
    private _color = switch _foreachIndex do {
        case 0;
        case 1: { [[[1,1,1,1], [0.4,0.4,0.4,1]] select (_info#0 isEqualTo _info#1), [1,0,0,1]] select (_x get "count" isEqualTo 0) };
        default { [[1,1,1,1], [0.4,0.4,0.4,1]] select (_x get "count" isEqualTo 0) };
    };

    _listbox lnbSetText[[_index, _forEachIndex + 2], str(_x get "count")];
    _listbox lnbSetTooltip[[_index, _forEachIndex + 2], _x getOrDefault["name", ""]];
    _listbox lnbSetColor[[_index, _forEachIndex + 2], _color];
} forEach _info;

_listbox lnbSetColor[[_index, 1], _color];
_listbox lnbSetPicture[[_index, 0], _entry get "picture"];
_listbox lnbSetPictureColor[[_index, 0], _color];
_listbox lnbSetData[[_index, 0], _entry get "marker"];

nil;

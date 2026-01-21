#include "..\script_component.hpp"
#include "..\RscDefine.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_tracklist_editor_fnc_exportPlaylist

Description:
    Export playlist to editor control for copying

Parameters:

Optional:

Example:

Returns:
    Nothing

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(exportPlaylist),_this);

[true, "export"] call FUNC(toggleCopyPasteControl);

private _display = uiNamespace getVariable[QGVAR(menuDisplay), displayNull];
if !assert(!isNull _display) exitWith {};

private _keys = keys GVAR(tracks);
_keys sort true;

private _export = ['"1.0"'];
_keys apply {
    _export pushBack format[":%1", _x];
    GVAR(tracks) get _x apply {
        _export pushBack _x;
    };
};
_display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_EDITCOPYPASTE ctrlSetText(_export joinString endl);
ctrlSetFocus(_display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_EDITCOPYPASTE);

nil;

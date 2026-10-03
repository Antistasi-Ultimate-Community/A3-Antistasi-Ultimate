#include "..\script_component.hpp"
#include "..\RscDefine.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_tracklist_editor_fnc_toggleCopyPasteControl

Description:
    Toggle copy/paste control in playlist editor dialog

Parameters:
    0: _enable <BOOL>
    1: _mode <STRING>

Optional:

Example:

Returns:
    Nothing

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(toggleCopyPasteControl),_this);

private _display = uiNamespace getVariable[QGVAR(menuDisplay), displayNull];
if !assert(!isNull _display) exitWith {};

params[
    ["_enable", false, [false]],
    ["_mode", "", [""]]
];

_display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_EDITCOPYPASTE ctrlEnable _enable;
_display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_EDITCOPYPASTE ctrlShow _enable;
_display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_EDITCOPYPASTE ctrlSetFade 0;
_display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_EDITCOPYPASTE ctrlCommit 0;

{
    _display displayCtrl _x ctrlEnable !_enable;
    _display displayCtrl _x ctrlShow !_enable;
} forEach [
    IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_LISTALLTRACKS,
    IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_STATICTREEPOSITION,
    IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNREMOVE,
    IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNADDSELECTION,
    IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNEXPORT,
    IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNIMPORT
];

switch true do {
    case !_enable: {
        _display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNSAVEPLAYLIST ctrlSetText localize LSTRING(RscA3USPCMTracklistEditorDialog_BtnSavePlaylist);
        _display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNSAVEPLAYLIST setVariable[QGVAR(copyPasteMode), nil];
    };
    case (_mode isEqualTo "import"): {
        _display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNSAVEPLAYLIST ctrlSetText localize LSTRING(RscA3USPCMTracklistEditorDialog_BtnImport);
        _display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNSAVEPLAYLIST setVariable[QGVAR(copyPasteMode), _mode];
    };
    case (_mode isEqualTo "export"): {
        _display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNSAVEPLAYLIST ctrlSetText localize LSTRING(RscA3USPCMTracklistEditorDialog_BtnDone);
        _display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNSAVEPLAYLIST setVariable[QGVAR(copyPasteMode), _mode];
    };
};

nil;

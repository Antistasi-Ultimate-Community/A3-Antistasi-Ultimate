#include "..\script_component.hpp"
#include "..\RscDefine.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_tracklist_editor_fnc_onDialogOpen

Description:
    Initialize playlist editor dialog

Parameters:

Optional:

Example:

Returns:
    Nothing

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(onDialogOpen),_this);

if !assert(params[
    ["_display", displayNull, [displayNull]]
]) exitWith {};

if !assert(!isNull _display) exitWith {};

private["_control"];
uiNamespace setVariable[QGVAR(menuDisplay), _display];

// Close button
_display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNCLOSE ctrlAddEventHandler["ButtonClick", {
    closeDialog 2;
}];

// Import/export buttons
_display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNIMPORT ctrlAddEventHandler["ButtonClick", {
    [] call FUNC(importPlaylist);
}];

_display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNEXPORT ctrlAddEventHandler["ButtonClick", {
    [] call FUNC(exportPlaylist);
}];

// Copy/paste edit box
_display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_EDITCOPYPASTE ctrlEnable false;
_display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_EDITCOPYPASTE ctrlShow false;

// Save button
_display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNSAVEPLAYLIST ctrlAddEventHandler["ButtonClick", {
    params["_control"];

    if (_control getVariable[QGVAR(copyPasteMode), false] isNotEqualTo false) exitWith { 
        if (_control getVariable[QGVAR(copyPasteMode), false] isEqualTo "import") then {
            [true] call FUNC(importPlaylist);
        };

        [false, ""] call FUNC(toggleCopyPasteControl);
    };

    [] call FUNC(savePlaylist);
}];

// Add/remove buttons
_display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNADDSELECTION ctrlEnable false;
_display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNADDSELECTION ctrlAddEventHandler["ButtonClick", {
    params["_control"];

    private _display = uiNamespace getVariable[QGVAR(menuDisplay), displayNull];
    private _list = _display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_LISTALLTRACKS;
    private _tree = _display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_STATICTREEPOSITION;
    private _path = tvCurSel _tree;
    private _track = _list lnbData[lbCurSel _list, 0];

    if (_path isNotEqualTo []) then {
        private _name = [configFile >> "CfgMusic" >> _track >> "name", "STRING", _track] call CBA_fnc_getConfigEntry;
        private _leafIdx = _tree tvAdd[[_path select 0], _name];
        _tree tvSetData[[_path select 0, _leafIdx], _track];
        _tree tvSort[[_path select 0], false];
    };

    _control ctrlEnable false;
}];

_display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNREMOVE ctrlEnable false;
_display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNREMOVE ctrlAddEventHandler["ButtonClick", {
    params["_control"];

    private _display = uiNamespace getVariable[QGVAR(menuDisplay), displayNull];
    private _tree = _display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_STATICTREEPOSITION;
    private _path = tvCurSel _tree;

    if (count _path > 1) then {
        _tree tvDelete _path;
        _control ctrlEnable false;
    };
}];

// Tracklist
_control = _display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_LISTALLTRACKS;
_control lnbAddColumn 0.8;
lnbClear _control;

{
    private _title = getText(_x >> "name");
    if ("" isEqualTo _title) then { _title = configName _x };

    private _idx = _control lnbAddRow[_title, [getNumber(_x >> "duration"), "MM:SS"] call BIS_fnc_secondsToString];
    _control lnbSetData[[_idx, 0], configName _x];
} forEach ("true" configClasses(configFile >> "CfgMusic"));

_control lnbSort[0, false];
_control ctrlAddEventHandler["LBDblClick", {
    params["_ctrl","_idx"];
    private _track = _ctrl lnbData[_idx, 0];
    [_track, false] call FUNC(playTrack);
}];

_control ctrlAddEventHandler["LBSelChanged", {
    params["_control","_idx"];

    private _display = uiNamespace getVariable[QGVAR(menuDisplay), displayNull];
    private _tree = _display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_STATICTREEPOSITION;
    private _path = tvCurSel _tree;
    private _track = _control lnbData[_idx, 0];
    private _valid = true;

    if (_valid && (_path isEqualTo [])) then {
        _valid = false;
    };

    if (_valid) then {
        private _count = _tree tvCount[_path select 0];

        _valid = -1 isEqualTo (([0, _count - 1] call FUNCMAIN(arrayRange)) findIf {
            private _class = _tree tvData[_path select 0, _x];
            (_track isEqualTo _class);
        });
    };

    TRACE_3(QFUNC(onDialogOpen),_this,_path,_valid);
    _display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNADDSELECTION ctrlEnable _valid;
}];

nil;

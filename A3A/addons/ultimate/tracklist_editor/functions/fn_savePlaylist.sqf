#include "..\script_component.hpp"
#include "..\RscDefine.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_tracklist_editor_fnc_savePlaylist

Description:
    Save playlist

Parameters:

Optional:

Example:

Returns:
    Nothing

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(savePlaylist),_this);

private _display = uiNamespace getVariable[QGVAR(menuDisplay), displayNull];
if !assert(!isNull _display) exitWith {};

private _result = createHashMap;
private _tree = _display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_STATICTREEPOSITION;

private _count = _tree tvCount[];

[0, _count - 1] call FUNCMAIN(arrayRange) apply {
    private _index = _x;
    private _section = _tree tvData[_index];
    private _leaves = _tree tvCount[_index];

    GVAR(tracks) set[_section, [0, _leaves - 1] call FUNCMAIN(arrayRange) apply {
        _tree tvData[_index, _x];
    }];
};

Trace_1("save playlist",GVAR(tracks));

closeDialog 0;
nil;

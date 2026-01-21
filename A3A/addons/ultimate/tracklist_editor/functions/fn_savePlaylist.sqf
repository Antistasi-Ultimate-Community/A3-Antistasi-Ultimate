#include "..\script_component.hpp"
#include "..\RscDefine.hpp"
/* ----------------------------------------------------------------------------
Function: A3USPCM_music_fnc_savePlaylist

Description:
    Save playlist

Parameters:

Optional:

Example:

Returns:
    Nothing

Author:
    goreSplatter
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(savePlaylist),_this);

private _display = uiNamespace getVariable[QGVAR(menuDisplay), displayNull];
if !assert(!isNull _display) exitWith {};

private _result = createHashMap;
private _tree = _display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_STATICTREEPOSITION;

private _count = _tree tvCount[];

[0, _count - 1] call FUNCMAIN(utilRange) apply {
    private _index = _x;
    private _section = _tree tvData[_index];
    private _leaves = _tree tvCount[_index];

    GVAR(tracks) set[_section, [0, _leaves - 1] call FUNCMAIN(utilRange) apply {
        _tree tvData[_index, _x];
    }];
};

TRACE_1("save playlist",GVAR(tracks));

closeDialog 0;
nil;

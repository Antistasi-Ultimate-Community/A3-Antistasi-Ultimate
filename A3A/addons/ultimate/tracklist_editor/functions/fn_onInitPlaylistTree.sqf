#include "..\script_component.hpp"
#include "..\RscDefine.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_tracklist_editor_fnc_onInitPlaylistTree

Description:
    Convert static placeholder control to playlist tree control

Parameters:
    0: _control - Placeholder <CONTROL>
    1: _config - Config <CONFIG>

Optional:

Example:

Returns:
    Nothing

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(onInitPlaylistTree),_this);

params[
    ["_control",controlNull,[controlNull]],
    ["_config",configNull,[configNull]]
];

if !assert(!isNull _control) exitWith {};
if !assert(!isNull _config) exitWith {};

waitUntil { !isNull(uiNamespace getVariable [QGVAR(menuDisplay), displayNull]) };

private _display = uiNamespace getVariable [QGVAR(menuDisplay), displayNull];
private _idc = ctrlIDC _control;
private _position = ctrlPosition _control;

ctrlDelete _control;

private _tree = _display ctrlCreate["RscTree", _idc];

_tree ctrlSetPosition _position;
_tree ctrlCommit 0;

[
    ["default", LSTRING(CategoryMusicDefault)],
    ["combat", LSTRING(CategoryMusicCombat)],
    ["stealth", LSTRING(CategoryMusicStealth)],
    ["night", LSTRING(CategoryMusicNight)]
] apply {
    _x params["_category", "_title"];

    private _idx = _tree tvAdd[[], localize _title];
    _tree tvSetData[[_idx], _category];

    GVAR(tracks) get _category apply {
        private _name = [configFile >> "CfgMusic" >> _x >> "name", "STRING", _x] call CBA_fnc_getConfigEntry;
        private _leafIdx = _tree tvAdd[[_idx], _name];

        _tree tvSetData[[_idx, _leafIdx], _x];
    };
};

_tree tvSortAll[[], false];
tvExpandAll _tree;

_tree ctrlAddEventHandler["TreeSelChanged", {
    params["_tree","_path"];

    private _data = _tree tvData _path;
    private _count = _tree tvCount[_path select 0];
    private _display = uiNamespace getVariable [QGVAR(menuDisplay), displayNull];

    TRACE_3(QFUNC(onInitPlaylistTree),_path,_count,_data);

    if (count _path isEqualTo 1) exitWith {
        _display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNREMOVE ctrlEnable false;
    };

    TRACE_2(QFUNC(onInitPlaylistTree),_count,REMEMBER_TRACKS);
    _display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNREMOVE ctrlEnable(_count > REMEMBER_TRACKS);
}];

nil;

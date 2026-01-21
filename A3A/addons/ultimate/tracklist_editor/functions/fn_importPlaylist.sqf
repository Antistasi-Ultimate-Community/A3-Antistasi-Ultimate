#include "..\script_component.hpp"
#include "..\RscDefine.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_tracklist_editor_fnc_importPlaylist

Description:
    Import playlist from editor control

Parameters:

Optional:
    0: _doImport <BOOL>

Example:

Returns:
    Nothing

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(importPlaylist),_this);

params[
    ["_doImport", false, [true]]
];

private _display = uiNamespace getVariable[QGVAR(menuDisplay), displayNull];
if !assert(!isNull _display) exitWith {};

if !_doImport exitWith {
    [true, "import"] call FUNC(toggleCopyPasteControl);

    _display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_EDITCOPYPASTE ctrlSetText localize LSTRING(RscA3USPCMTracklistEditorDialog_EditCopyPasteImport);
    ctrlSetFocus(_display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_EDITCOPYPASTE);
};

private _import = ctrlText(_display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_EDITCOPYPASTE);

_import = _import splitString endl apply { trim _x };

try {
    private _version = _import deleteAt 0;
    private _section = false;
    private _result = createHashMap;
    private _lineNo = 0;

    TRACE_1("import version",_version);

    if (_version isNotEqualTo '"1.0"') then { throw format[localize LSTRING(RscA3USPCMTracklistEditorDialog_ImportErrorVersion), _lineNo + 1] };

    while { _import isNotEqualTo [] } do {
        INC(_lineNo);

        private _line = _import deleteAt 0;

        if (_line isEqualTo "") then { continue };

        if (":" isEqualTo(_line select[0, 1])) then {
            _section = _line select[1];
            TRACE_2("found section",_lineNo,_section);
            continue;
        };

        if (_section isEqualTo false) then { throw format[localize LSTRING(RscA3USPCMTracklistEditorDialog_ImportErrorSection), _lineNo] };

        private _tracks = _result getOrDefault[_section, []];
        if !isClass(configFile >> "CfgMusic" >> _line) then {
            WARNING_1("during import: '%1' is not a valid track",_line);
        } else {
            _tracks pushBackUnique _line;
            _result set[_section, _tracks];
        };
    };

    private _needKeys = ["combat","stealth","night","default"];
    private _resultKeys = keys _result;

    if ((_resultKeys - _needKeys) isNotEqualTo []) then {
        WARNING_1("imported playlist has unknown sections: %1",_resultKeys-_needKeys);
        throw format[localize LSTRING(RscA3USPCMTracklistEditorDialog_ImportErrorSectionUnknown), (_resultKeys-_needKeys) joinString ", "];
    };

    _needKeys apply {
        if !(_x in _result) then {
            WARNING_1("missing section '%1' in imported playlist",_x);
            throw format[localize LSTRING(RscA3USPCMTracklistEditorDialog_ImportErrorSectionMissing), _x];
        };

        if (count(_result get _x) < REMEMBER_TRACKS) then {
            WARNING_2("section '%1' has less than %2 tracks",_x,REMEMBER_TRACKS);
            throw format[localize LSTRING(RscA3USPCMTracklistEditorDialog_ImportErrorSectionTracks), _x, REMEMBER_TRACKS];
        };
    };

    GVAR(tracks) = _result;
    [_display displayCtrl IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_STATICTREEPOSITION, configFile] call FUNC(onInitPlaylistTree);

} catch {
    [
        localize LSTRING(RscA3USPCMTracklistEditorDialog_ImportError),
        _exception
    ] call A3A_fnc_customHint;
    playSound "A3AP_UiFailure";
};

nil;

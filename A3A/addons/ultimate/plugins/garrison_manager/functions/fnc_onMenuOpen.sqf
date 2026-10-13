#include "..\script_component.hpp"
#include "..\RscDefine.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_garrison_manager_fnc_onMenuOpen

Description:
    Open garrison editor

Parameters:

Optional:

Example:

Returns:
    Nothing

Author:
    goreSplatter
---------------------------------------------------------------------------- */
disableSerialization;

Trace_1(QFUNC(onMenuOpen),_this);

if !assert(params[
    ["_display", nil, [displayNull]]
]) exitWith {};
if !assert(!isNull _display) exitWith {};

uiNamespace setVariable[QGVAR(menuDisplay), _display];

_display setVariable[QGVAR(eventHandlers), createHashMap];
_display getVariable QGVAR(eventHandlers) set[CBA_EVENT_PRESELECT_LOCATION, [CBA_EVENT_PRESELECT_LOCATION, LINKFUNC(onPreselectLocation)] call CBA_fnc_addEventHandler];

private["_control"];

// Labels
_display displayCtrl IDC_RSCA3UGARRISONMANAGERDIALOG_STATICLABELBLUFOR ctrlSetText(A3A_faction_occ get "name");
_display displayCtrl IDC_RSCA3UGARRISONMANAGERDIALOG_STATICLABELINDEP ctrlSetText(A3A_faction_reb get "name");
_display displayCtrl IDC_RSCA3UGARRISONMANAGERDIALOG_STATICLABELOPFOR ctrlSetText(A3A_faction_inv get "name");

// Filters
private _checkStates = missionNamespace getVariable[QGVAR(dialogCheckBoxes), createHashMapFromArray [
    [IDC_RSCA3UGARRISONMANAGERDIALOG_CHECKSHOWBLUFOR, false],
    [IDC_RSCA3UGARRISONMANAGERDIALOG_CHECKSHOWOPFOR, false],
    [IDC_RSCA3UGARRISONMANAGERDIALOG_CHECKSHOWINDEP, true],
    [IDC_RSCA3UGARRISONMANAGERDIALOG_CHECKSHOWBASES, false],
    [IDC_RSCA3UGARRISONMANAGERDIALOG_CHECKSHOWOUTPOSTS, false],
    [IDC_RSCA3UGARRISONMANAGERDIALOG_CHECKSHOWPOSTS, false],
    [IDC_RSCA3UGARRISONMANAGERDIALOG_CHECKSHOWRESOURCES, false],
    [IDC_RSCA3UGARRISONMANAGERDIALOG_CHECKSHOWTOWNS, true],
    [IDC_RSCA3UGARRISONMANAGERDIALOG_CHECKHIDEFULL, false]
]];

missionNamespace setVariable[QGVAR(dialogCheckBoxes), _checkStates];

_checkStates apply {
    private _control = _display displayCtrl _x;

    _control ctrlEnable true;
    _control cbSetChecked _y;
    _control ctrlAddEventHandler["CheckedChanged", {
        params[["_control",controlNull,[controlNull]],["_state",0,[0]]];
        missionNamespace getVariable QGVAR(dialogCheckBoxes) set[ctrlIDC _control, [false, true] select _state];
        [] call FUNC(updateList);
    }];
};

// Close button top-right
_display displayCtrl IDC_RSCA3UGARRISONMANAGERDIALOG_BTNCLOSE ctrlAddEventHandler["ButtonClick", {
    closeDialog 0;
}];

// Location list
private _rightMargin = 0.35;
private _width = (1 - _rightMargin) / (count GVAR(lbColumns) - 1);

_control = _display displayCtrl IDC_RSCA3UGARRISONMANAGERDIALOG_LISTOVERVIEW;
_control lnbAddColumn 0.025;
_control lnbAddColumn _rightMargin;

for "_j" from 1 to (count GVAR(lbColumns) - 1) do {
    _rightMargin = _rightMargin + _width;
    _control lnbAddColumn _rightMargin;
};

_control ctrlAddEventHandler["LBDblClick", {
    params[["_control",controlNull,[controlNull]], ["_index",0,[0]]];
    private _data = _control lnbData[_index,0];
    Trace_1(QFUNC(onMenuOpen_EH_LBDblClick),_data);

    if (_data isEqualTo "") exitWith {};

    private _display = uiNamespace getVariable [QGVAR(menuDisplay), displayNull];
    if !assert(!isNull _display) exitWith {};
    
    private _map = _display displayCtrl IDC_RSCA3UGARRISONMANAGERDIALOG_MAPCONTROL;
    _map ctrlMapAnimAdd[0.25, ctrlMapScale _map, markerPos _data];
    ctrlMapAnimCommit _map;
}];

_control ctrlAddEventHandler["LBSelChanged", {
    [CBA_EVENT_LOCATION_SELECTED, _this] call CBA_fnc_localEvent;
}];

_display getVariable QGVAR(eventHandlers) set[CBA_EVENT_LOCATION_SELECTED, [CBA_EVENT_LOCATION_SELECTED, {
    params[["_control",controlNull,[controlNull]], ["_index",0,[0]]];
    private _data = _control lnbData[_index,0];
    Trace_1(QFUNC(onMenuOpen_EH_LBSelChanged),_data);

    private _validSelection = _data isNotEqualTo "";
    private _display = uiNamespace getVariable [QGVAR(menuDisplay), displayNull];
    if !assert(!isNull _display) exitWith {};

    if (_validSelection) then {
        _validSelection = sidesX getVariable[_data, sideUnknown] isEqualTo teamPlayer;
    };

    _display displayCtrl IDC_RSCA3UGARRISONMANAGERDIALOG_BTNRECRUIT ctrlEnable _validSelection;
    _display displayCtrl IDC_RSCA3UGARRISONMANAGERDIALOG_LISTRECRUITTYPES ctrlEnable _validSelection;

    if !_validSelection then {
        [false] call FUNC(updateRecruitList);
    } else {
        private _entry = GVAR(lbEntries) getOrDefault[_index, false];

        if assert(_entry isEqualType createHashMap) then {
            [_entry] call FUNC(updateRecruitList);
        };
    };
}] call CBA_fnc_addEventHandler];

// Map
_control = _display displayCtrl IDC_RSCA3UGARRISONMANAGERDIALOG_MAPCONTROL;
_control ctrlAddEventHandler["MouseButtonUp", {
    call FUNC(onMapButtonUp);
}];

// Recruit list
_control = _display displayCtrl IDC_RSCA3UGARRISONMANAGERDIALOG_LISTRECRUITTYPES;
_control lnbAddColumn 0.1;
_control ctrlEnable false;
_control ctrlSetFontHeight 0.03;
_control ctrlAddEventHandler["LBDblClick", {
    call FUNC(doRecruit);
}];
_control ctrlAddEventHandler["KeyUp", {
    params[["_control",controlNull,[controlNull]],["_key",0,[0]]];

    if (_key isEqualTo DIK_RETURN) then {
        [_control] call FUNC(doRecruit);
    };
}];

GVAR(lbColumns) select { _x select 2 isNotEqualTo "" } apply {
    private _index = _control lnbAddRow["", _x # 1];
    _control lnbSetData [[_index, 0], _x # 2];
};

// Recruit button
_control = _display displayCtrl IDC_RSCA3UGARRISONMANAGERDIALOG_BTNRECRUIT;
_control ctrlEnable false;
_control ctrlAddEventHandler["ButtonClick", {
    call FUNC(doRecruit);
}];

// Update list
[] call FUNC(updateList);

// Auto list update loop
GVAR(nextAutoUpdate) = -1;
[] spawn FUNC(startAutoUpdateLoop);

nil;

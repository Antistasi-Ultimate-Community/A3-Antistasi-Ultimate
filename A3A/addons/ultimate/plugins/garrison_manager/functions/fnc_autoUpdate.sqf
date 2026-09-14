#include "..\script_component.hpp"
#include "..\RscDefine.hpp"
/* ----------------------------------------------------------------------------
Function: A3USPCM_garrison_fnc_autoUpdate

Description:
    Auto update garrison of selected location

Parameters:

Optional:

Example:

Returns:
    Nothing

Author:
    goreSplatter
---------------------------------------------------------------------------- */
private _display = uiNamespace getVariable [QGVAR(menuDisplay), displayNull];
if !assert(!isNull _display) exitWith {};

private _listbox = _display displayCtrl IDC_RSCA3USPCMGARRISONMANAGERDIALOG_LISTOVERVIEW;
private _index = lnbCurSelRow _listbox;

TRACE_1(QFUNC(autoUpdate),_index);

if (_index >= 0) then {
    [_listbox, _index] call FUNC(updateGarrison);

    private _entry = GVAR(lbEntries) getOrDefault[_index, false];

    if assert(_entry isEqualType createHashMap) then {
        [_entry] call FUNC(updateRecruitList);
    };
};

nil;

#include "..\script_component.hpp"
#include "..\RscDefine.hpp"
/* ----------------------------------------------------------------------------
Function: A3USPCM_garrison_fnc_updateRecruitList

Description:
    Update unit counts in recruitment list

Parameters:
    0: _param1 - description <TYPE>
    1: _param2 - description <TYPE>

Optional:
    2: _param3 - description <TYPE>

Example:

Returns:
    Nothing

Author:
    goreSplatter
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(updateRecruitList),_this);

params[
    ["_entry", false, [false, createHashMap]]
];

private _display = uiNamespace getVariable [QGVAR(menuDisplay), displayNull];
if !assert(!isNull _display) exitWith {};

private _listbox = _display displayCtrl IDC_RSCA3USPCMGARRISONMANAGERDIALOG_LISTRECRUITTYPES;
private _counts = [];

if (_entry isEqualType false) then {
    for "_n" from 0 to ((lnbSize _listbox select 0) - 1) do {
        _counts pushBack "";
    };
} else {
    private _info = [_entry] call FUNC(getGarrisonInfo);
    _info apply {
        if (_x getOrDefault["dataColumn", false]) then {
            _counts pushBack str(_x get "count");
        };
    };
};

{
    _listbox lnbSetText[[_forEachIndex, 0], _x];
    _listbox lnbSetColor[[_forEachIndex, 0], [[1,1,1,1], [0.4,0.4,0.4,1]] select (_x isEqualTo 0)];
} forEach _counts;

nil;

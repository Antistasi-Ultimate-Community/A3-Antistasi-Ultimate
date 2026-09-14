#include "..\script_component.hpp"
#include "..\RscDefine.hpp"
/* ----------------------------------------------------------------------------
Function: A3USPCM_garrison_fnc_doRecruit

Description:
    Recruit button event handler callback

Parameters:
    0: _control - Recruit button control

Optional:

Example:

Returns:
    Nothing

Author:
    goreSplatter
---------------------------------------------------------------------------- */
params[["_control",controlNull,[controlNull]]];
private _display = uiNamespace getVariable[QGVAR(menuDisplay), displayNull];
if !assert(!isNull _display) exitWith {};

private _unitList = _display displayCtrl IDC_RSCA3USPCMGARRISONMANAGERDIALOG_LISTRECRUITTYPES;
private _index = lnbCurSelRow _unitList;

if (_index < 0) exitWith {};

private _unitType = _unitList lnbData[_index, 0];

private _locationList = _display displayCtrl IDC_RSCA3USPCMGARRISONMANAGERDIALOG_LISTOVERVIEW;
private _locationIndex = lnbCurSelRow _locationList;
private _marker = _locationList lnbData[_locationIndex, 0];

_unitType = A3A_faction_reb get _unitType;

TRACE_4(QFUNC(doRecruit),_index,_unitType,_locationIndex,_marker);

positionXGarr = _marker;

[_unitType] spawn {
    params["_unitType"];
    private _handle = [_unitType] spawn A3A_fnc_garrisonAdd;
    waitUntil {scriptDone _handle};
    GVAR(nextAutoUpdate) = diag_tickTime + 0.5;
};

nil;

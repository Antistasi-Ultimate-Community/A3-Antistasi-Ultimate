#include "..\script_component.hpp"
#include "..\RscDefine.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_garrison_manager_fnc_onPreselectLocation

Description:
    Handle preselect location event

Parameters:
    0: _location - Name of location to preselect <STRING>

Optional:

Example:

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(onPreselectLocation),_this);

if !assert(params[
    ["_location", nil, [""]]
]) exitWith {};

private _mapLocationToFilter = [
    [IDC_RSCA3UGARRISONMANAGERDIALOG_CHECKSHOWBASES, { _this in(milbases + airportsX + seaports + ["Synd_HQ"]) }],
    [IDC_RSCA3UGARRISONMANAGERDIALOG_CHECKSHOWOUTPOSTS, { _this in outposts }],
    [IDC_RSCA3UGARRISONMANAGERDIALOG_CHECKSHOWPOSTS, { _this in(aapostsFIA + atpostsFIA + hmgpostsFIA + roadblocksFIA) }],
    [IDC_RSCA3UGARRISONMANAGERDIALOG_CHECKSHOWRESOURCES, { _this in(resourcesX + factories) }],
    [IDC_RSCA3UGARRISONMANAGERDIALOG_CHECKSHOWTOWNS, { _this in citiesX }]
];

private _index = _mapLocationToFilter findIf {
    _x params["", "_condition"];
    _location call _condition;
};

if (_index isEqualTo -1) exitWith {
    ERROR_1("failed to find control mapping for location ""%1""",_location);
};

_mapLocationToFilter select _index params["_idc"];
TRACE_1(QFUNC(onPreselectLocation),_idc);

[[_idc, true], [IDC_RSCA3UGARRISONMANAGERDIALOG_CHECKHIDEFULL, false]] apply {
    _x params["_checkIdc","_checkChecked"];

    uiNamespace getVariable QGVAR(menuDisplay) displayCtrl _checkIdc cbSetChecked _checkChecked;
    GVAR(dialogCheckBoxes) set[_checkIdc, _checkChecked];
};

uiNamespace getVariable QGVAR(menuDisplay) displayCtrl IDC_RSCA3UGARRISONMANAGERDIALOG_LISTOVERVIEW setVariable[QGVAR(preselectedLocation), _location];

[] call FUNC(updateList);

nil;

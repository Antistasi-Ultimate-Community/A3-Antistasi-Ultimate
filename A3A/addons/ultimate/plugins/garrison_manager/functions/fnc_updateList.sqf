#include "..\script_component.hpp"
#include "..\RscDefine.hpp"
/* ----------------------------------------------------------------------------
Function: A3USPCM_garrison_fnc_updateList

Description:
    Update garrison list

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

private _states = missionNamespace getVariable QGVAR(dialogCheckBoxes);
private _listbox = _display displayCtrl IDC_RSCA3USPCMGARRISONMANAGERDIALOG_LISTOVERVIEW;
lnbClear _listbox;
_listbox lnbSetCurSelRow 0;

private _showBLUFOR = _states get IDC_RSCA3USPCMGARRISONMANAGERDIALOG_CHECKSHOWBLUFOR;
private _showINDEP = _states get IDC_RSCA3USPCMGARRISONMANAGERDIALOG_CHECKSHOWINDEP;
private _showOPFOR = _states get IDC_RSCA3USPCMGARRISONMANAGERDIALOG_CHECKSHOWOPFOR;

private _showBases = _states get IDC_RSCA3USPCMGARRISONMANAGERDIALOG_CHECKSHOWBASES;
private _showOutposts = _states get IDC_RSCA3USPCMGARRISONMANAGERDIALOG_CHECKSHOWOUTPOSTS;
private _showPosts = _states get IDC_RSCA3USPCMGARRISONMANAGERDIALOG_CHECKSHOWPOSTS;
private _showResources = _states get IDC_RSCA3USPCMGARRISONMANAGERDIALOG_CHECKSHOWRESOURCES;
private _showTowns = _states get IDC_RSCA3USPCMGARRISONMANAGERDIALOG_CHECKSHOWTOWNS;
private _hideFull = _states get IDC_RSCA3USPCMGARRISONMANAGERDIALOG_CHECKHIDEFULL;

private _closeLocation = {
    params[["_format","",[""]], ["_entry",nil,[createHashMap]]];

    private _loc = nearestLocations[_entry get "position", ["NameCityCapital","NameCity","NameVillage"], 1500, _entry get "position"];

    if (_loc isNotEqualTo []) exitWith { format[_format, text(_loc select 0)] };
    format[_format, mapGridPosition(_entry get "position")];
};

private _entries = markersX select {
    (
        (_showBases && {_x in (milbases + airportsX + seaports + ["Synd_HQ"])}) ||
        (_showOutposts && {_x in outposts}) ||
        (_showResources && {_x in (resourcesX + factories)}) ||
        (_showTowns && {_x in citiesX}) ||
        (_showPosts && {_x in (aapostsFIA + atpostsFIA + hmgpostsFIA + roadblocksFIA)})
    ) && (
        (_showBLUFOR && {sidesX getVariable[_x, sideUnknown] isEqualTo west}) ||
        (_showINDEP && {sidesX getVariable[_x, sideUnknown] isEqualTo resistance}) ||
        (_showOPFOR && {sidesX getVariable[_x, sideUnknown] isEqualTo east})
    ) && (
        !_hideFull || {
            count(garrison getVariable[_x, []]) < ([_x] call A3A_fnc_getGarrisonLimit)
        }
    )
} apply {
    private _entry = createHashMapFromArray[
        ["picture", ""],
        ["marker", _x],
        ["position", markerPos _x],
        ["side", sidesX getVariable[_x, sideUnknown]]
    ];

    _entry set["color", switch (_entry get "side") do {
        case east: { "colorOPFOR" };
        case west: { "colorBLUFOR" };
        case resistance: { "ColorGUER" };
        case civilian: { "ColorCIV" };
        default { "ColorUNKNOWN" };
    }];

    private _label = switch true do {
        case(_x isEqualTo "Synd_HQ"): {
            _entry set["picture", "\A3\ui_f\data\map\markers\handdrawn\flag_CA.paa"];
            [LLSTRING(RscA3USPCMGarrisonManagerDialog_ListOverview_Column_Name_SyndicateHQLabel), _entry] call _closeLocation;
        };
        case(_x in citiesX): {
            _entry set["picture", "\A3\ui_f\data\map\mapcontrol\Ruin_CA.paa"];
            _x;
        };
        case(_x in resourcesX): {
            _entry set["picture", "\A3\ui_f\data\map\mapcontrol\Rock_CA.paa"];
            [LLSTRING(RscA3USPCMGarrisonManagerDialog_ListOverview_Column_Name_ResourceLabel), _entry] call _closeLocation;
        };
        case(_x in outposts): {
            _entry set["picture", "\A3\ui_f\data\map\mapcontrol\bunker_CA.paa"];
            [LLSTRING(RscA3USPCMGarrisonManagerDialog_ListOverview_Column_Name_OutpostLabel), _entry] call _closeLocation;
        };
        case(_x in factories): {
            _entry set["picture", "\A3\ui_f\data\map\markers\nato\u_installation.paa"];
            [LLSTRING(RscA3USPCMGarrisonManagerDialog_ListOverview_Column_Name_FactoryLabel), _entry] call _closeLocation;
        };
        case(_x in milbases): {
            _entry set["picture", "\A3\ui_f\data\map\mapcontrol\Tourism_CA.paa"];
            [LLSTRING(RscA3USPCMGarrisonManagerDialog_ListOverview_Column_Name_MilBaseLabel), _entry] call _closeLocation;
        };
        case(_x in airportsX): {
            _entry set["picture", "\a3\ui_f\data\igui\cfg\simpletasks\types\Plane_ca.paa"];
            [LLSTRING(RscA3USPCMGarrisonManagerDialog_ListOverview_Column_Name_AirportLabel), _entry] call _closeLocation;
        };
        case(_x in seaports): {
            _entry set["picture", "\A3\ui_f\data\map\markers\nato\n_naval.paa"];
            [LLSTRING(RscA3USPCMGarrisonManagerDialog_ListOverview_Column_Name_SeaportLabel), _entry] call _closeLocation;
        };
        case(_x in aapostsFIA): {
            _entry set["picture", "\A3\ui_f\data\igui\cfg\simpletasks\types\defend_ca.paa"];
            [LLSTRING(RscA3USPCMGarrisonManagerDialog_ListOverview_Column_Name_AApostLabel), _entry] call _closeLocation;
        };
        case(_x in atpostsFIA): {
            _entry set["picture", "\A3\ui_f\data\igui\cfg\simpletasks\types\defend_ca.paa"];
            [LLSTRING(RscA3USPCMGarrisonManagerDialog_ListOverview_Column_Name_ATpostLabel), _entry] call _closeLocation;
        };
        case(_x in hmgpostsFIA): {
            _entry set["picture", "\A3\ui_f\data\igui\cfg\simpletasks\types\defend_ca.paa"];
            [LLSTRING(RscA3USPCMGarrisonManagerDialog_ListOverview_Column_Name_HMGpostLabel), _entry] call _closeLocation;
        };
        case (_x in roadblocksFIA): {
            _entry set["picture", "\A3\ui_f\data\igui\cfg\simpletasks\types\defend_ca.paa"];
            [LLSTRING(RscA3USPCMGarrisonManagerDialog_ListOverview_Column_Name_RoadblockLabel), _entry] call _closeLocation;
        };
        case (_x in watchpostsFIA): {
            _entry set["picture", "\A3\ui_f\data\igui\cfg\simpletasks\types\defend_ca.paa"];
            [LLSTRING(RscA3USPCMGarrisonManagerDialog_ListOverview_Column_Name_WatchpostLabel), _entry] call _closeLocation;
        };
        default { format["UNK(%1)", _x] };
    };

    [_label, _entry];
};

private _index = _listbox lnbAddRow[""];
{
    _x params["_text","_tooltip"];
    _listbox lnbSetText[[_index, _forEachIndex + 1], _text];
    _listbox lnbSetTooltip[[_index, _forEachIndex + 1], _tooltip];
} forEach GVAR(lbColumns);

GVAR(lbEntries) = createHashMap;

private _preselection = -1;
private _preselectedLocation = _listbox getVariable[QGVAR(preselectedLocation), ""];
_listbox setVariable[QGVAR(preselectedLocation), nil];

_entries sort true;
_entries apply {
    _x params[["_label", ""], ["_entry", nil, [createHashMap]]];

    private _index = _listbox lnbAddRow["", _label];

    if (_entry get "marker" isEqualTo _preselectedLocation) then {
        _preselection = _index;
    };

    GVAR(lbEntries) set[_index, _entry];
    [_listbox, _index] call FUNC(updateGarrison);
};

if (_preselection != -1) then {
    _listbox lnbSetCurSelRow _preselection;
    [{
        [CBA_EVENT_LOCATION_SELECTED, _this] call CBA_fnc_localEvent;
    }, [_listbox, _preselection]] call CBA_fnc_execNextFrame;
};

nil;

/*
Maintainer: DoomMetal
    Handles the initialization and updating of the Black Market dialog.
    This function should only be called from BlackMarket onLoad and control activation EHs.

Arguments:
    <STRING> Mode, only possible value for this dialog is "onLoad"
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Return Value:
    Nothing

Scope: Clients, Local Arguments, Local Effect
Environment: Scheduled for onLoad mode / Unscheduled for everything else unless specified
Public: No
Dependencies:
    None

Example:
    ["onLoad"] spawn A3A_fnc_blackMarketDialog; // initialization
*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params[
    ["_mode","onLoad"], 
    ["_params",[]],
    ["_fnc_populateMenu", {[]}],
    ["_callbackHandlerKey", "BUYFIA"]
];

private _allTabs = [
    [A3A_IDC_BLACKMARKETMAIN, A3A_IDC_BLACKMARKETVEHICLESGROUP, "ALL"],
    [A3A_IDC_BLACKMARKETARTY, A3A_IDC_BLACKMARKETVEHICLESGROUPATRY, "ARTILLERY"],
    [A3A_IDC_BLACKMARKETAPC, A3A_IDC_BLACKMARKETVEHICLESGROUPAPC, "APC"],
    [A3A_IDC_BLACKMARKETAA, A3A_IDC_BLACKMARKETVEHICLESGROUPAA, "AA"],
    [A3A_IDC_BLACKMARKETUAV, A3A_IDC_BLACKMARKETVEHICLESGROUPUAV, "UAV"],
    [A3A_IDC_BLACKMARKETTANK, A3A_IDC_BLACKMARKETVEHICLESGROUPTANK, "TANK"],
    [A3A_IDC_BLACKMARKETSTATICS, A3A_IDC_BLACKMARKETVEHICLESGROUPSTATICS, "STATICS"],
    [A3A_IDC_BLACKMARKETHELI, A3A_IDC_BLACKMARKETVEHICLESGROUPHELI, "HELI"],
    [A3A_IDC_BLACKMARKETPLANE, A3A_IDC_BLACKMARKETVEHICLESGROUPPLANE, "PLANE"],
    [A3A_IDC_BLACKMARKETARMEDCAR, A3A_IDC_BLACKMARKETVEHICLESGROUPARMEDCAR, "ARMEDCAR"],
    [A3A_IDC_BLACKMARKETUNARMEDCAR, A3A_IDC_BLACKMARKETVEHICLESGROUPUNARMED, "UNARMEDCAR"],
    [A3A_IDC_BLACKMARKETBOAT, A3A_IDC_BLACKMARKETVEHICLESGROUPBOAT, "BOAT"]
];

private _fnc_buildTab = {
    params ["_tabIDC", "_groupIDC", "_category"];

    private _tabBuildState = uiNamespace getVariable ["A3U_BM_tabBuildState", createHashMap];
    private _buildState = _tabBuildState getOrDefault [_category, 0];
    if (_buildState > 0) exitWith {};

    _tabBuildState set [_category, 1];
    uiNamespace setVariable ["A3U_BM_tabBuildState", _tabBuildState];

    [_tabIDC, _groupIDC, _category] spawn A3A_fnc_blackMarketTabs;
};

switch (_mode) do
{
    case ("switchTab"):
    {
        ['on'] call SCRT_fnc_ui_toggleMenuBlur;

        private _vehicleType = (uiNamespace getVariable ["bm_vehicleTypeBox", ""]);
        private _cursel = lbCurSel _vehicleType;
        private _categoryIndex = _vehicleType lbValue _cursel;

        private _display = findDisplay A3A_IDD_BLACKMARKETVEHICLEDIALOG;

        Debug_1("MainDialog switching tab to %1.", _categoryIndex);

        if (_categoryIndex < 0 || {_categoryIndex > 11}) exitWith {};
        private _selectedTab = _allTabs select _categoryIndex;
        private _selectedTabIDC = _selectedTab select 0;

        // Hide all tabs
        Debug("Hiding all tabs");
        {
            private _ctrl = _display displayCtrl _x;
            _ctrl ctrlShow false;
        } forEach (_allTabs apply {_x select 0});


        // Show selected tab
        Debug("Showing selected tab");
        private _selectedTabCtrl = _display displayCtrl _selectedTabIDC;
        _selectedTabCtrl ctrlShow true;

        _selectedTab call _fnc_buildTab;
    };

    case ("onLoad"):
    {
        ['on'] call SCRT_fnc_ui_toggleMenuBlur;

        private _displayBM = findDisplay A3A_IDD_BLACKMARKETVEHICLEDIALOG;
        private _bmTable = _displayBM displayCtrl A3A_IDC_SETUP_BMTABLE;

        private _vehicleTypes = [localize "STR_antistasi_dialogs_vehicle_tab_all", localize "STR_antistasi_dialogs_vehicle_tab_arty", localize "STR_antistasi_dialogs_vehicle_tab_apc", localize "STR_antistasi_dialogs_vehicle_tab_AA",
        localize "STR_antistasi_dialogs_vehicle_tab_uav", localize "STR_antistasi_dialogs_vehicle_tab_tank",localize "STR_antistasi_dialogs_vehicle_tab_statics", localize "STR_antistasi_dialogs_vehicle_tab_heli", 
        localize "STR_antistasi_dialogs_vehicle_tab_plane", localize "STR_antistasi_dialogs_vehicle_tab_armedcar", localize "STR_antistasi_dialogs_vehicle_tab_unarmedcar", localize "STR_antistasi_dialogs_vehicle_tab_boat"];
        private _vals = ["all", "artillery", "apc", "aa", "uav", "tank", "statics", "heli", "plane", "armedcar", "unarmedcar", "boat"];

        uiNamespace setVariable ["A3U_BM_tabBuildState", createHashMapFromArray (_allTabs apply {[_x select 2, 0]})];
        uiNamespace setVariable ["A3U_BM_vehicleMetadataCache", createHashMap];
        uiNamespace setVariable ["A3U_BM_dlcMetadataCache", createHashMap];

        private _valsCtrl = _bmTable;
        /* _valsCtrl ctrlSetPosition [GRID_W * -30.4, GRID_H*-17.9, GRID_W*125, GRID_H*5]; */
        _valsCtrl ctrlCommit 0;
        {
            private _index = _valsCtrl lbAdd (_vehicleTypes#_forEachIndex);
            _valsCtrl lbSetValue [_index, (_vals find _x)];
        } forEach _vals;
        
        private _default = "all";
        private _defaultIndex = _vals find _default;
        _valsCtrl lbSetCurSel _defaultIndex;
        _valsCtrl lbSetSelected [0, true];

        uiNamespace setVariable ["bm_vehicleTypeBox", _valsCtrl];

        {
            (_displayBM displayCtrl (_x select 0)) ctrlShow false;
        } forEach _allTabs;

        private _defaultTab = _allTabs select _defaultIndex;
        (_displayBM displayCtrl (_defaultTab select 0)) ctrlShow true;
        _defaultTab call _fnc_buildTab;

        _bmTable ctrlAddEventHandler ["LBSelChanged", {
            params ["_control", "_selectedIndex"];
            private _categoryIndex = lbCurSel _control;
            if (_categoryIndex isEqualTo -1) exitWith {};
            ["switchTab", [_vehicleType]] call A3A_fnc_blackMarketDialog;
        }];
    };

    case ("onUnload"): 
    {
        ['off'] call SCRT_fnc_ui_toggleMenuBlur;
        uiNamespace setVariable ["A3U_BM_tabBuildState", nil];
        uiNamespace setVariable ["A3U_BM_vehicleMetadataCache", nil];
        uiNamespace setVariable ["A3U_BM_dlcMetadataCache", nil];
    };

    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("BlackMarketDialog mode does not exist: %1", _mode);
    };
};

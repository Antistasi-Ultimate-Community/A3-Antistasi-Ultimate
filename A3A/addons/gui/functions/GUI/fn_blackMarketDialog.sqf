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

switch (_mode) do
{
    case ("switchTab"):
    {
        ['on'] call SCRT_fnc_ui_toggleMenuBlur;

        private _vehicleType = (uiNamespace getVariable ["bm_vehicleTypeBox", ""]);
        private _categoryIndex = _vehicleType lbValue lbCurSel _vehicleType;

        diag_log _categoryIndex;

        private _display = findDisplay A3A_IDD_BLACKMARKETVEHICLEDIALOG;

        Debug_1("MainDialog switching tab to %1.", _categoryIndex);

        private _selectedTabIDC = -1;
        switch (_categoryIndex) do 
        {
            case (0): 
            {
                _selectedTabIDC = A3A_IDC_BLACKMARKETMAIN;
            };
            case (1): 
            {
                _selectedTabIDC = A3A_IDC_BLACKMARKETARTY;
            };
            case (2): 
            {
                _selectedTabIDC = A3A_IDC_BLACKMARKETAPC;
            };
            case (3): 
            {
                _selectedTabIDC = A3A_IDC_BLACKMARKETAA;
            };
            case (4): 
            {
                _selectedTabIDC = A3A_IDC_BLACKMARKETUAV;
            };
            case (5): 
            {
                _selectedTabIDC = A3A_IDC_BLACKMARKETTANK;
            };
            case (6):
            {
                _selectedTabIDC = A3A_IDC_BLACKMARKETSTATICS;
            };
            case (7): 
            {
                _selectedTabIDC = A3A_IDC_BLACKMARKETHELI;
            };
            case (8): 
            {
                _selectedTabIDC = A3A_IDC_BLACKMARKETPLANE;
            };
            case (9): 
            {
                _selectedTabIDC = A3A_IDC_BLACKMARKETARMEDCAR;
            };
            case (10): 
            {
                _selectedTabIDC = A3A_IDC_BLACKMARKETUNARMEDCAR;
            };
            case (11): 
            {
                _selectedTabIDC = A3A_IDC_BLACKMARKETBOAT;
            };
        };

        if (_selectedTabIDC == -1) exitWith {
            Error("Attempted to access tab without permission : %1", _selectedTab);
        };

        private _allTabs = [
            A3A_IDC_BLACKMARKETMAIN,
            A3A_IDC_BLACKMARKETARTY,
            A3A_IDC_BLACKMARKETAPC,
            A3A_IDC_BLACKMARKETAA,
            A3A_IDC_BLACKMARKETUAV,
            A3A_IDC_BLACKMARKETTANK,
            A3A_IDC_BLACKMARKETSTATICS,
            A3A_IDC_BLACKMARKETHELI,
            A3A_IDC_BLACKMARKETPLANE,
            A3A_IDC_BLACKMARKETARMEDCAR,
            A3A_IDC_BLACKMARKETUNARMEDCAR,
            A3A_IDC_BLACKMARKETBOAT,
            A3A_IDC_BLACKMARKETPREVIEW
        ];

        // Hide all tabs
        Debug("Hiding all tabs");
        {
            private _ctrl = _display displayCtrl _x;
            _ctrl ctrlShow false;
        } forEach _allTabs;


        // Show selected tab
        Debug("Showing selected tab");
        private _selectedTabCtrl = _display displayCtrl _selectedTabIDC;
        _selectedTabCtrl ctrlShow true;
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

        ["vehicles", [A3A_IDC_BLACKMARKETMAIN, A3A_IDC_BLACKMARKETVEHICLESGROUP, "all"]] call A3A_fnc_blackMarketTabs; ///show all?
        ["vehicles", [A3A_IDC_BLACKMARKETARTY, A3A_IDC_BLACKMARKETVEHICLESGROUPATRY, "artillery"]] call A3A_fnc_blackMarketTabs;
        ["vehicles", [A3A_IDC_BLACKMARKETAPC, A3A_IDC_BLACKMARKETVEHICLESGROUPAPC, "apc"]] call A3A_fnc_blackMarketTabs;
        ["vehicles", [A3A_IDC_BLACKMARKETAA, A3A_IDC_BLACKMARKETVEHICLESGROUPAA, "AA"]] call A3A_fnc_blackMarketTabs;
        ["vehicles", [A3A_IDC_BLACKMARKETUAV, A3A_IDC_BLACKMARKETVEHICLESGROUPUAV, "uav"]] call A3A_fnc_blackMarketTabs;
        ["vehicles", [A3A_IDC_BLACKMARKETTANK, A3A_IDC_BLACKMARKETVEHICLESGROUPTANK, "tank"]] call A3A_fnc_blackMarketTabs;
        ["vehicles", [A3A_IDC_BLACKMARKETSTATICS, A3A_IDC_BLACKMARKETVEHICLESGROUPSTATICS, "statics"]] call A3A_fnc_blackMarketTabs;
        ["vehicles", [A3A_IDC_BLACKMARKETHELI, A3A_IDC_BLACKMARKETVEHICLESGROUPHELI, "heli"]] call A3A_fnc_blackMarketTabs;
        ["vehicles", [A3A_IDC_BLACKMARKETPLANE, A3A_IDC_BLACKMARKETVEHICLESGROUPPLANE, "plane"]] call A3A_fnc_blackMarketTabs;
        ["vehicles", [A3A_IDC_BLACKMARKETARMEDCAR, A3A_IDC_BLACKMARKETVEHICLESGROUPARMEDCAR, "armedcar"]] call A3A_fnc_blackMarketTabs;
        ["vehicles", [A3A_IDC_BLACKMARKETUNARMEDCAR, A3A_IDC_BLACKMARKETVEHICLESGROUPUNARMED, "unarmedcar"]] call A3A_fnc_blackMarketTabs;
        ["vehicles", [A3A_IDC_BLACKMARKETBOAT, A3A_IDC_BLACKMARKETVEHICLESGROUPBOAT, "boat"]] call A3A_fnc_blackMarketTabs;

        waitUntil {sleep 1; uiNamespace getVariable ["A3U_BM_isTabsComplete", false]};

        private _valsCtrl = _bmTable;
        /* _valsCtrl ctrlSetPosition [GRID_W * -30.4, GRID_H*-17.9, GRID_W*125, GRID_H*5]; */
        _valsCtrl ctrlCommit 0;
        {
            private _index = _valsCtrl lbAdd (_vehicleTypes#_forEachIndex);
            _valsCtrl lbSetValue [_index, (_vals find _x)];
        } forEach _vals;
        
        private _default = "all";
        _valsCtrl lbSetCurSel (_vals find _default);
        _valsCtrl lbSetSelected [0, true];

        uiNamespace setVariable ["bm_vehicleTypeBox", _valsCtrl];
    };

    case ("onUnload"): 
    {
        ['off'] call SCRT_fnc_ui_toggleMenuBlur;
    };

    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("BlackMarketDialog mode does not exist: %1", _mode);
    };
};

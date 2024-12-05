/*
Maintainer: DoomMetal
    Handles the initialization and updating of the Buy Vehicle dialog.
    This function should only be called from BuyVehicle onLoad and control activation EHs.
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
    ["onLoad"] spawn A3A_fnc_buyVehicleDialog; // initialization
*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params[
    ["_mode","onLoad"], ["_params",[]]
];

switch (_mode) do
{
    case ("switchTab"):
    {   
        private _display = findDisplay A3A_IDD_BUYVEHICLEDIALOG; 
        private _selectedTab = _params select 0;
        lnbClear A3A_IDC_SETUP_CVTABLE;

        Debug_1("MainDialog switching tab to %1.", _selectedTab);

        private _selectedTabIDC = -1;
        switch (_selectedTab) do 
        {
            case ("civil"): {
                _selectedTabIDC = A3A_IDC_BUYCIVVEHICLEMAIN;
                lnbClear _valsCtrl;
    
                private _displayCV = findDisplay A3A_IDD_BUYVEHICLEDIALOG;
                private _cvTable = _displayCV displayCtrl A3A_IDC_SETUP_CVTABLE;
                private _valsCtrl = _cvTable;
                private _vehicleTypes = [localize "STR_antistasi_dialogs_vehicle_tab_civall",
                localize "STR_antistasi_dialogs_vehicle_tab_civcars",
                localize "STR_antistasi_dialogs_vehicle_tab_civtrucks",
                localize "STR_antistasi_dialogs_vehicle_tab_civboats",
                localize "STR_antistasi_dialogs_vehicle_tab_civheli",
                localize "STR_antistasi_dialogs_vehicle_tab_civplanes"
                ];
                private _vals = ["civilian", "civcars", "civtrucks", "civboats", "civheli", "civplane"];

                _valsCtrl ctrlCommit 0;
                {
                    private _index = _valsCtrl lbAdd (_vehicleTypes#_forEachIndex);
                    _valsCtrl lbSetValue [_index, (_vals find _x)];
                } forEach _vals;
            
                private _default = "civilian";
                _valsCtrl lbSetCurSel (_vals find _default);
                _valsCtrl lbSetSelected [0, true];
            
                uiNamespace setVariable ["cv_vehicleTypeBox", _valsCtrl];
            };
            case("rebel"): {
                _selectedTabIDC = A3A_IDC_BUYREBVEHICLEMAIN;
                lnbClear _valsCtrl;

                private _displayCV = findDisplay A3A_IDD_BUYVEHICLEDIALOG;
                private _cvTable = _displayCV displayCtrl A3A_IDC_SETUP_CVTABLE;
                private _valsCtrl = _cvTable;
                private _vehicleTypes = [localize "STR_antistasi_dialogs_vehicle_tab_reball",
                localize "STR_antistasi_dialogs_vehicle_tab_rebbasic",
                localize "STR_antistasi_dialogs_vehicle_tab_rebtrucks",
                localize "STR_antistasi_dialogs_vehicle_tab_reblightunarmed",
                localize "STR_antistasi_dialogs_vehicle_tab_rebboats",
                localize "STR_antistasi_dialogs_vehicle_tab_rebmedical",
                localize "STR_antistasi_dialogs_vehicle_tab_reblightarmed",
                localize "STR_antistasi_dialogs_vehicle_tab_rebat",
                localize "STR_antistasi_dialogs_vehicle_tab_rebaa",
                localize "STR_antistasi_dialogs_vehicle_tab_rebplane"
                ];
                private _vals = ["military","militarybasic","militarytrucks","militarylightunarmed","militaryboats","militarymedical","militarylightarmed","militaryat","militaryaa","militaryplane"];
                
                _valsCtrl ctrlCommit 0;
                {
                    private _index = _valsCtrl lbAdd (_vehicleTypes#_forEachIndex);
                    _valsCtrl lbSetValue [_index, (_vals find _x)];
                } forEach _vals;
            
                private _default = "military";
                _valsCtrl lbSetCurSel (_vals find _default);
                _valsCtrl lbSetSelected [0, true];
            
                uiNamespace setVariable ["cv_vehicleTypeBox", _valsCtrl];
            };
            case ("static"): {
                _selectedTabIDC = A3A_IDC_BUYSTATICMAIN;
                lnbClear _valsCtrl;
    
                private _displayCV = findDisplay A3A_IDD_BUYVEHICLEDIALOG;
                private _cvTable = _displayCV displayCtrl A3A_IDC_SETUP_CVTABLE;
                private _valsCtrl = _cvTable;
                private _vehicleTypes = [localize "STR_antistasi_dialogs_vehicle_tab_statics",
                localize "STR_antistasi_dialogs_vehicle_tab_staticMG",
                localize "STR_antistasi_dialogs_vehicle_tab_staticAT",
                localize "STR_antistasi_dialogs_vehicle_tab_staticAA",
                localize "STR_antistasi_dialogs_vehicle_tab_staticmortars"
                ];
                private _vals = ["static","staticMG","staticAT","staticAA","staticMORTAR"];

                _valsCtrl ctrlCommit 0;
                {
                    private _index = _valsCtrl lbAdd (_vehicleTypes#_forEachIndex);
                    _valsCtrl lbSetValue [_index, (_vals find _x)];
                } forEach _vals;
            
                private _default = "static";
                _valsCtrl lbSetCurSel (_vals find _default);
                _valsCtrl lbSetSelected [0, true];
            
                uiNamespace setVariable ["cv_vehicleTypeBox", _valsCtrl];
            };
            case("other"): {
                _selectedTabIDC = A3A_IDC_BUYOTHERMAIN;
                lnbClear _valsCtrl;

                private _displayCV = findDisplay A3A_IDD_BUYVEHICLEDIALOG;
                private _cvTable = _displayCV displayCtrl A3A_IDC_SETUP_CVTABLE;
                private _valsCtrl = _cvTable;
                private _vehicleTypes = [localize "STR_antistasi_dialogs_vehicle_tab_other"];
                private _vals = ["other"];

                _valsCtrl ctrlCommit 0;
                {
                    private _index = _valsCtrl lbAdd (_vehicleTypes#_forEachIndex);
                    _valsCtrl lbSetValue [_index, (_vals find _x)];
                } forEach _vals;
            
                private _default = "other";
                _valsCtrl lbSetCurSel (_vals find _default);
                _valsCtrl lbSetSelected [0, true];
            
                uiNamespace setVariable ["cv_vehicleTypeBox", _valsCtrl];
            };
        };

        if (_selectedTabIDC == -1) exitWith {
            Error("Attempted to access tab without permission : %1", _selectedTab);
        };

        private _allTabs = [
            A3A_IDC_BUYCIVVEHICLEMAIN,
            A3A_IDC_BUYCIVVEHICLECARS,
            A3A_IDC_BUYCIVVEHICLETRUCKS,
            A3A_IDC_BUYCIVVEHICLEBOATS,
            A3A_IDC_BUYCIVVEHICLEHELI,
            A3A_IDC_BUYCIVVEHICLEPLANE,
            A3A_IDC_BUYREBVEHICLEBASIC,
            A3A_IDC_BUYREBVEHICLETRUCKS,
            A3A_IDC_BUYREBVEHICLELIGHTUNARMED,
            A3A_IDC_BUYREBVEHICLEBOATS,
            A3A_IDC_BUYREBVEHICLEMEDICAL,
            A3A_IDC_BUYREBVEHICLELIGHTARMED,
            A3A_IDC_BUYREBVEHICLEAT,
            A3A_IDC_BUYREBVEHICLEAA,
            A3A_IDC_BUYREBVEHICLEPLANE,
            A3A_IDC_BUYSTATICVEHICLEMG,
            A3A_IDC_BUYSTATICVEHICLEAT,
            A3A_IDC_BUYSTATICVEHICLEAA,
            A3A_IDC_BUYSTATICVEHICLEMORTAR,
            A3A_IDC_BUYREBVEHICLEMAIN,
            A3A_IDC_BUYSTATICMAIN,
            A3A_IDC_BUYOTHERMAIN,
            A3A_IDC_BUYVEHICLEPREVIEW
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

    case ("selectCategory"):
    {
        private _display = findDisplay A3A_IDD_BUYVEHICLEDIALOG;
        private _selectedCategory = _params select 0;
        diag_log _selectedCategory;

        private _selectedTabIDC = -1;
        switch (_selectedCategory) do
        {
            case localize "STR_antistasi_dialogs_vehicle_tab_civall": {
                _selectedTabIDC = A3A_IDC_BUYCIVVEHICLEMAIN; 
            };
            case localize "STR_antistasi_dialogs_vehicle_tab_civcars": {
                _selectedTabIDC = A3A_IDC_BUYCIVVEHICLECARS;
            };
            case localize "STR_antistasi_dialogs_vehicle_tab_civtrucks": {
                _selectedTabIDC = A3A_IDC_BUYCIVVEHICLETRUCKS;
            };
            case localize "STR_antistasi_dialogs_vehicle_tab_civboats": {
                _selectedTabIDC = A3A_IDC_BUYCIVVEHICLEBOATS;
            };
            case localize "STR_antistasi_dialogs_vehicle_tab_civheli": {
                _selectedTabIDC = A3A_IDC_BUYCIVVEHICLEHELI;
            };
            case localize "STR_antistasi_dialogs_vehicle_tab_civplanes": {
                _selectedTabIDC = A3A_IDC_BUYCIVVEHICLEPLANE;
            };
            case localize "STR_antistasi_dialogs_vehicle_tab_rebbasic": {
                _selectedTabIDC = A3A_IDC_BUYREBVEHICLEBASIC;
            };
            case localize "STR_antistasi_dialogs_vehicle_tab_rebtrucks": {
                _selectedTabIDC = A3A_IDC_BUYREBVEHICLETRUCKS;
            };
            case localize "STR_antistasi_dialogs_vehicle_tab_reball": {
                _selectedTabIDC = A3A_IDC_BUYREBVEHICLEMAIN;
            };
            case localize "STR_antistasi_dialogs_vehicle_tab_reblightunarmed": {
                _selectedTabIDC = A3A_IDC_BUYREBVEHICLELIGHTUNARMED;
            };
            case localize "STR_antistasi_dialogs_vehicle_tab_rebboats": {
                _selectedTabIDC = A3A_IDC_BUYREBVEHICLEBOATS;
            };
            case localize "STR_antistasi_dialogs_vehicle_tab_rebmedical": {
                _selectedTabIDC = A3A_IDC_BUYREBVEHICLEMEDICAL;
            };
            case localize "STR_antistasi_dialogs_vehicle_tab_reblightarmed": {
                _selectedTabIDC = A3A_IDC_BUYREBVEHICLELIGHTARMED;
            };
            case localize "STR_antistasi_dialogs_vehicle_tab_rebat": {
                _selectedTabIDC = A3A_IDC_BUYREBVEHICLEAT;
            };
            case localize "STR_antistasi_dialogs_vehicle_tab_rebaa": {
                _selectedTabIDC = A3A_IDC_BUYREBVEHICLEAA;
            };
            case localize "STR_antistasi_dialogs_vehicle_tab_rebplane": {
                _selectedTabIDC = A3A_IDC_BUYREBVEHICLEPLANE;
            };
            case localize "STR_antistasi_dialogs_vehicle_tab_statics": {
                _selectedTabIDC = A3A_IDC_BUYSTATICMAIN;
            };
            case localize "STR_antistasi_dialogs_vehicle_tab_staticMG": {
                _selectedTabIDC = A3A_IDC_BUYSTATICVEHICLEMG;
            };
            case localize "STR_antistasi_dialogs_vehicle_tab_staticAT": {
                _selectedTabIDC = A3A_IDC_BUYSTATICVEHICLEAT;
            };
            case localize "STR_antistasi_dialogs_vehicle_tab_staticAA": {
                _selectedTabIDC = A3A_IDC_BUYSTATICVEHICLEAA;
            };
            case localize "STR_antistasi_dialogs_vehicle_tab_staticmortars": {
                _selectedTabIDC = A3A_IDC_BUYSTATICVEHICLEMORTAR;
            };
            case localize "STR_antistasi_dialogs_vehicle_tab_other": {
                _selectedTabIDC = A3A_IDC_BUYOTHERMAIN;
            };
        };
        private _allTabs = [
            A3A_IDC_BUYCIVVEHICLEMAIN,
            A3A_IDC_BUYCIVVEHICLECARS,
            A3A_IDC_BUYCIVVEHICLETRUCKS,
            A3A_IDC_BUYCIVVEHICLEBOATS,
            A3A_IDC_BUYCIVVEHICLEHELI,
            A3A_IDC_BUYCIVVEHICLEPLANE,
            A3A_IDC_BUYREBVEHICLEBASIC,
            A3A_IDC_BUYREBVEHICLETRUCKS,
            A3A_IDC_BUYREBVEHICLELIGHTUNARMED,
            A3A_IDC_BUYREBVEHICLEBOATS,
            A3A_IDC_BUYREBVEHICLEMEDICAL,
            A3A_IDC_BUYREBVEHICLELIGHTARMED,
            A3A_IDC_BUYREBVEHICLEAT,
            A3A_IDC_BUYREBVEHICLEAA,
            A3A_IDC_BUYREBVEHICLEPLANE,
            A3A_IDC_BUYSTATICVEHICLEMG,
            A3A_IDC_BUYSTATICVEHICLEAT,
            A3A_IDC_BUYSTATICVEHICLEAA,
            A3A_IDC_BUYSTATICVEHICLEMORTAR,
            A3A_IDC_BUYREBVEHICLEMAIN,
            A3A_IDC_BUYSTATICMAIN,
            A3A_IDC_BUYOTHERMAIN,
            A3A_IDC_BUYVEHICLEPREVIEW
        ];

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

        ["vehicles", [A3A_IDC_BUYCIVVEHICLECARS, A3A_IDC_CIVVEHICLESGROUPCARS, "civcars"]] call A3A_fnc_buyVehicleTabs;
        ["vehicles", [A3A_IDC_BUYCIVVEHICLETRUCKS, A3A_IDC_CIVVEHICLESGROUPTRUCKS, "civtrucks"]] call A3A_fnc_buyVehicleTabs;
        ["vehicles", [A3A_IDC_BUYCIVVEHICLEBOATS, A3A_IDC_CIVVEHICLESGROUPBOATS, "civboats"]] call A3A_fnc_buyVehicleTabs;
        ["vehicles", [A3A_IDC_BUYCIVVEHICLEHELI, A3A_IDC_CIVVEHICLESGROUPHELI, "civheli"]] call A3A_fnc_buyVehicleTabs;
        ["vehicles", [A3A_IDC_BUYCIVVEHICLEPLANE, A3A_IDC_CIVVEHICLESGROUPPLANE, "civplane"]] call A3A_fnc_buyVehicleTabs;
        
        ["vehicles", [A3A_IDC_BUYREBVEHICLEBASIC, A3A_IDC_REBVEHICLESGROUPBASIC, "militarybasic"]] call A3A_fnc_buyVehicleTabs;
        ["vehicles", [A3A_IDC_BUYREBVEHICLETRUCKS, A3A_IDC_REBVEHICLESGROUPTRUCKS, "militarytrucks"]] call A3A_fnc_buyVehicleTabs;
        ["vehicles", [A3A_IDC_BUYREBVEHICLELIGHTUNARMED, A3A_IDC_REBVEHICLESGROUPLIGHTUNARMED, "militarylightunarmed"]] call A3A_fnc_buyVehicleTabs;
        ["vehicles", [A3A_IDC_BUYREBVEHICLEBOATS, A3A_IDC_REBVEHICLESGROUPBOATS, "militaryboats"]] call A3A_fnc_buyVehicleTabs;
        ["vehicles", [A3A_IDC_BUYREBVEHICLEMEDICAL, A3A_IDC_REBVEHICLESGROUPMEDICAL, "militarymedical"]] call A3A_fnc_buyVehicleTabs;
        ["vehicles", [A3A_IDC_BUYREBVEHICLELIGHTARMED, A3A_IDC_REBVEHICLESGROUPLIGHTARMED, "militarylightarmed"]] call A3A_fnc_buyVehicleTabs;
        ["vehicles", [A3A_IDC_BUYREBVEHICLEAT, A3A_IDC_REBVEHICLESGROUPAT, "militaryat"]] call A3A_fnc_buyVehicleTabs;
        ["vehicles", [A3A_IDC_BUYREBVEHICLEAA, A3A_IDC_REBVEHICLESGROUPAA, "militaryaa"]] call A3A_fnc_buyVehicleTabs;
        ["vehicles", [A3A_IDC_BUYREBVEHICLEPLANE, A3A_IDC_REBVEHICLESGROUPPLANE, "militaryplane"]] call A3A_fnc_buyVehicleTabs;

        ["vehicles", [A3A_IDC_BUYSTATICVEHICLEMG, A3A_IDC_STATICVEHICLESGROUPMG, "staticMG"]] call A3A_fnc_buyVehicleTabs;
        ["vehicles", [A3A_IDC_BUYSTATICVEHICLEAT, A3A_IDC_STATICVEHICLESGROUPAT, "staticAT"]] call A3A_fnc_buyVehicleTabs;
        ["vehicles", [A3A_IDC_BUYSTATICVEHICLEAA, A3A_IDC_STATICVEHICLESGROUPAA, "staticAA"]] call A3A_fnc_buyVehicleTabs;
        ["vehicles", [A3A_IDC_BUYSTATICVEHICLEMORTAR, A3A_IDC_STATICVEHICLESGROUPMORTAR, "staticMORTAR"]] call A3A_fnc_buyVehicleTabs;

        ["vehicles", [A3A_IDC_BUYCIVVEHICLEMAIN, A3A_IDC_CIVVEHICLESGROUP, "civilian"]] call A3A_fnc_buyVehicleTabs;
        ["vehicles", [A3A_IDC_BUYREBVEHICLEMAIN, A3A_IDC_REBVEHICLESGROUP, "military"]] call A3A_fnc_buyVehicleTabs;
        ["vehicles", [A3A_IDC_BUYSTATICMAIN, A3A_IDC_STATICSGROUP, "static"]] call A3A_fnc_buyVehicleTabs;
        ["other"] call A3A_fnc_buyVehicleTabs;

        // show the vehicle tab so that user don't freak out
        private _display = findDisplay A3A_IDD_BUYVEHICLEDIALOG;
        private _selectedTabCtrl = _display displayCtrl A3A_IDC_BUYCIVVEHICLEMAIN;
        _selectedTabCtrl ctrlShow true;

        private _displayCV = findDisplay A3A_IDD_BUYVEHICLEDIALOG;
        private _cvTable = _displayCV displayCtrl A3A_IDC_SETUP_CVTABLE;
        private _valsCtrl = _cvTable;
        private _vehicleTypes = [localize "STR_antistasi_dialogs_vehicle_tab_civall",
        localize "STR_antistasi_dialogs_vehicle_tab_civcars",
        localize "STR_antistasi_dialogs_vehicle_tab_civtrucks",
        localize "STR_antistasi_dialogs_vehicle_tab_civboats",
        localize "STR_antistasi_dialogs_vehicle_tab_civheli",
        localize "STR_antistasi_dialogs_vehicle_tab_civplanes"
        ];
        private _vals = ["civilian", "civcars", "civtrucks", "civboats", "civheli", "civplane"];

        _valsCtrl ctrlCommit 0;
        {
            private _index = _valsCtrl lbAdd (_vehicleTypes#_forEachIndex);
            _valsCtrl lbSetValue [_index, (_vals find _x)];
        } forEach _vals;
        
        private _default = "civilian";
        _valsCtrl lbSetCurSel (_vals find _default);
        _valsCtrl lbSetSelected [0, true];
        
        uiNamespace setVariable ["cv_vehicleTypeBox", _valsCtrl];
    };

    case ("onUnload"): 
    {
        ['off'] call SCRT_fnc_ui_toggleMenuBlur;
    };

    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("BuyVehicleDialog mode does not exist: %1", _mode);
    };
};

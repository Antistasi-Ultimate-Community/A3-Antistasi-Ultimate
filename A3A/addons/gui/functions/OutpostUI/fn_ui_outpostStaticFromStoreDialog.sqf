#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params[
    ["_mode","onLoad"], 
    ["_params",[]]
];

switch (_mode) do
{
    case ("switchTabMG"):
    {       
        private _display = findDisplay A3A_IDD_BUYVEHICLEMGDIALOG;
        private _selectedTab = _params select 0;

        Debug_1("MainDialog switching tab to %1.", _selectedTab);

        private _selectedTabIDC = -1;
        switch (_selectedTab) do 
        {
            case ("staticMG"): {
                _selectedTabIDC = A3A_IDC_MGSTATICMAIN;
            };
        };
        if (_selectedTabIDC == -1) exitWith {
            Error("Attempted to access tab without permission : %1", _selectedTab);
        };
        private _allTabs = [
            A3A_IDC_MGSTATICMAIN,
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

    case ("onLoadMG"):
    {
        ['on'] call SCRT_fnc_ui_toggleMenuBlur;
        ["vehicles", [A3A_IDC_MGSTATICMAIN, A3A_IDC_MGSTATICGROUP, "staticMG"]] call A3A_fnc_ui_buyVehicleMGTabs;

        // show the vehicle tab so that user don't freak out
        private _display = findDisplay A3A_IDD_BUYVEHICLEMGDIALOG;
        private _selectedTabCtrl = _display displayCtrl A3A_IDC_MGSTATICMAIN;
        _selectedTabCtrl ctrlShow true;
    };

    ///////////AT
    case ("switchTabAT"):
    {       
        private _display = findDisplay A3A_IDD_BUYVEHICLEATDIALOG;
        private _selectedTab = _params select 0;
        Debug_1("MainDialog switching tab to %1.", _selectedTab);
        private _selectedTabIDC = -1;
        switch (_selectedTab) do 
        {
            case ("staticAT"): {
                _selectedTabIDC = A3A_IDC_ATSTATICMAIN;
            };
        };
        if (_selectedTabIDC == -1) exitWith {
            Error("Attempted to access tab without permission : %1", _selectedTab);
        };
        private _allTabs = [
            A3A_IDC_ATSTATICMAIN,
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

    case ("onLoadAT"):
    {
        ['on'] call SCRT_fnc_ui_toggleMenuBlur;
        ["vehicles", [A3A_IDC_ATSTATICMAIN, A3A_IDC_ATSTATICGROUP, "staticAT"]] call A3A_fnc_ui_buyVehicleATTabs;

        // show the vehicle tab so that user don't freak out
        private _display = findDisplay A3A_IDD_BUYVEHICLEATDIALOG;
        private _selectedTabCtrl = _display displayCtrl A3A_IDC_ATSTATICMAIN;
        _selectedTabCtrl ctrlShow true;
    };

    ///////////AA
    case ("switchTabAA"):
    {       
        private _display = findDisplay A3A_IDD_BUYVEHICLEAADIALOG;
        private _selectedTab = _params select 0;
        Debug_1("MainDialog switching tab to %1.", _selectedTab);
        private _selectedTabIDC = -1;
        switch (_selectedTab) do 
        {
            case ("staticAA"): {
                _selectedTabIDC = A3A_IDC_AASTATICMAIN;
            };
        };
        if (_selectedTabIDC == -1) exitWith {
            Error("Attempted to access tab without permission : %1", _selectedTab);
        };
        private _allTabs = [
            A3A_IDC_AASTATICMAIN,
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

    case ("onLoadAA"):
    {
        ['on'] call SCRT_fnc_ui_toggleMenuBlur;
        ["vehicles", [A3A_IDC_AASTATICMAIN, A3A_IDC_AASTATICGROUP, "staticAA"]] call A3A_fnc_ui_buyVehicleAATabs;
        
        // show the vehicle tab so that user don't freak out
        private _display = findDisplay A3A_IDD_BUYVEHICLEAADIALOG;
        private _selectedTabCtrl = _display displayCtrl A3A_IDC_AASTATICMAIN;
        _selectedTabCtrl ctrlShow true;
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

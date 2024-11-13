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
    case ("switchTab"):
    {       
        private _display = findDisplay A3A_IDD_DISPLAYGARAGEVEHICLES;
        private _selectedTab = _params select 0;

        Debug_1("MainDialog switching tab to %1.", _selectedTab);

        private _selectedTabIDC = -1;
        switch (_selectedTab) do 
        {
            case ("light"): {
                _selectedTabIDC = A3A_IDC_GARAGELIGHTARMEDMAIN;
                ["vehicles", [A3A_IDC_GARAGELIGHTARMEDMAIN, A3A_IDC_GARAGELIGHTARMEDGROUP, "light"]] spawn A3A_fnc_ui_roadblockFromGarage;
            };
            case ("heavy"): {
                _selectedTabIDC = A3A_IDC_GARAGEHEAVYVEHICLEMAIN;
                ["vehicles", [A3A_IDC_GARAGEHEAVYVEHICLEMAIN, A3A_IDC_GARAGEHEAVYVEHICLEGROUP, "heavy"]] spawn A3A_fnc_ui_roadblockFromGarage;
			};
        };

        if (_selectedTabIDC == -1) exitWith {
            Error("Attempted to access tab without permission : %1", _selectedTab);
        };

        private _allTabs = [
            A3A_IDC_GARAGELIGHTARMEDMAIN,
            A3A_IDC_GARAGEHEAVYVEHICLEMAIN,
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

    case ("onLoad"):
    {
        ['off'] call SCRT_fnc_ui_toggleMenuBlur;
        
        // show the vehicle tab so that user don't freak out
        private _display = findDisplay A3A_IDD_DISPLAYGARAGEVEHICLES;
        private _selectedTabCtrl = _display displayCtrl A3A_IDC_GARAGELIGHTARMEDMAIN;
        _selectedTabCtrl ctrlShow true;
    };

    case ("onUnload"): 
    {
        //['off'] call SCRT_fnc_ui_toggleMenuBlur;
    };

    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("BuyVehicleDialog mode does not exist: %1", _mode);
    };
};
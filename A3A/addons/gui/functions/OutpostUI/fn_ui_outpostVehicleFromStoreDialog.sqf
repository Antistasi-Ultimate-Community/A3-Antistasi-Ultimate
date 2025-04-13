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
        private _display = findDisplay A3A_IDD_BUYVEHICLEROADBLOCKDIALOG;
        private _selectedTab = _params select 0;

        Debug_1("MainDialog switching tab to %1.", _selectedTab);

        private _selectedTabIDC = -1;
        switch (_selectedTab) do 
        {
            case ("lightarmed"): {
                _selectedTabIDC = A3A_IDC_BUYLIGHTARMEDMAIN;
            };
            case("AT"): {
                _selectedTabIDC = A3A_IDC_BUYATVEHICLEMAIN;
			};
            case ("AA"): {
                _selectedTabIDC = A3A_IDC_BUYAAVEHICLEMAIN;
            };
        };

        if (_selectedTabIDC == -1) exitWith {
            Error("Attempted to access tab without permission : %1", _selectedTab);
        };

        private _allTabs = [
            A3A_IDC_BUYLIGHTARMEDMAIN,
            A3A_IDC_BUYATVEHICLEMAIN,
            A3A_IDC_BUYAAVEHICLEMAIN,
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
        ['on'] call SCRT_fnc_ui_toggleMenuBlur;
        ["vehicles", [A3A_IDC_BUYLIGHTARMEDMAIN, A3A_IDC_LIGHTARMEDGROUP, "lightarmed"]] call A3A_fnc_ui_buyVehicleRoadblockTabs; ///step 3
        ["vehicles", [A3A_IDC_BUYATVEHICLEMAIN, A3A_IDC_ATVEHICLEGROUP, "AT"]] call A3A_fnc_ui_buyVehicleRoadblockTabs;
        ["vehicles", [A3A_IDC_BUYAAVEHICLEMAIN, A3A_IDC_AAVEHICLEGROUP, "AA"]] call A3A_fnc_ui_buyVehicleRoadblockTabs;

        // show the vehicle tab so that user don't freak out
        private _display = findDisplay A3A_IDD_BUYVEHICLEROADBLOCKDIALOG;
        private _selectedTabCtrl = _display displayCtrl A3A_IDC_BUYLIGHTARMEDMAIN;
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

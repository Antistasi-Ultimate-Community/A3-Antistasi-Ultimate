#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params[
    ["_mode","onLoad"], 
    "_this"
];
params ["_outpostType"];

private _IDs = switch (_outpostType) do {
	case ("AA"): { [A3A_IDC_AASTATICMAIN, A3A_IDC_AASTATICGROUP, A3A_IDD_BUYVEHICLEAADIALOG] };
	case ("AT"): { [A3A_IDC_ATSTATICMAIN, A3A_IDC_ATSTATICGROUP, A3A_IDD_BUYVEHICLEATDIALOG] };
	case ("MG"): { [A3A_IDC_MGSTATICMAIN, A3A_IDC_MGSTATICGROUP, A3A_IDD_BUYVEHICLEMGDIALOG] };
	case ("RB");
	case ("RB_LA"): { [A3A_IDC_BUYLIGHTARMEDMAIN, A3A_IDC_LIGHTARMEDGROUP, A3A_IDD_BUYVEHICLEROADBLOCKDIALOG] };
	case ("RB_AT"): { [A3A_IDC_BUYATVEHICLEMAIN, A3A_IDC_ATVEHICLEGROUP, A3A_IDD_BUYVEHICLEROADBLOCKDIALOG] };
	case ("RB_AA"): { [A3A_IDC_BUYAAVEHICLEMAIN, A3A_IDC_AAVEHICLEGROUP, A3A_IDD_BUYVEHICLEROADBLOCKDIALOG] };
	default { [0, 0, 0] };
};
_IDs params ["_mainIDC", "_groupIDC", "_IDD"];

switch (_mode) do
{
	// new stuff
	case ("onLoad"):
	{
		['on'] call SCRT_fnc_ui_toggleMenuBlur;

		if (_outpostType isEqualTo "RB_LA" || {_outpostType isEqualTo "RB"}) exitWith {
			{ ["onLoad", [_x]] call A3A_fnc_UI_vehicleFromStore } forEach ["RB_AT", "RB_AA"];
		};

		[_mainIDC, _groupIDC, _IDD, _outpostType] call A3A_fnc_UI_buyVehicleTabs;

		ctrlShow [_mainIDC, true];
	};

	case ("switchTab"):
	{
		// Hide all tabs
        Debug("Hiding all tabs");
		ctrlShow [A3A_IDC_BUYVEHICLEPREVIEW, false];
        
		// Show selected tab
        Debug("Showing selected tab");
		ctrlShow [_mainIDC, true];
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

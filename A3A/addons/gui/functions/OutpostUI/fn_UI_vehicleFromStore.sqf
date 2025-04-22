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

private _IDD = A3A_IDD_BUYVEHICLEOUTPOSTDIALOG;
private _IDCs = switch (_outpostType) do {
	case ("AA");
	case ("AT");
	case ("MG"): { [A3A_IDC_STATICMAIN, A3A_IDC_STATICGROUP] };
	case ("RB_LA"): { [A3A_IDC_BUYLIGHTARMEDMAIN, A3A_IDC_LIGHTARMEDGROUP] };
	case ("RB_AT"): { [A3A_IDC_BUYATVEHICLEMAIN, A3A_IDC_ATVEHICLEGROUP] };
	case ("RB_AA"): { [A3A_IDC_BUYAAVEHICLEMAIN, A3A_IDC_AAVEHICLEGROUP] };
	default { [0, 0, 0] };
};
_IDCs params ["_mainIDC", "_groupIDC"];

switch (_mode) do
{
	// new stuff
	case ("onLoad"):
	{
		['on'] call SCRT_fnc_ui_toggleMenuBlur;

		if (_outpostType isEqualTo "RB_LA") then {
			{ ["onLoad", [_x]] call A3A_fnc_UI_vehicleFromStore } forEach ["RB_AT", "RB_AA"];
		};
		[_groupIDC, _IDD, _outpostType] call A3A_fnc_UI_buyVehicleTabs;

		["switchTab", _outpostType] call A3A_fnc_UI_vehicleFromStore;
	};

	case ("switchTab"):
	{
		// Hide all tabs
        Debug("Hiding all tabs");
		{ ctrlShow [_x, false] } forEach [A3A_IDC_BUYLIGHTARMEDMAIN, A3A_IDC_BUYATVEHICLEMAIN, A3A_IDC_BUYAAVEHICLEMAIN, A3A_IDC_BUYVEHICLEPREVIEW];
        
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

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_typeX", "_position"];

private _moneyCost = minefieldCost select 0;
private _hrCost = minefieldCost select 1;
private _quantity = minefieldCost select 2;
private _mine = minefieldCost select 3;

if (_typeX == "delete") then {
	_moneyCost = _moneyCost - (server getVariable FactionGet(reb,"unitExp"));
	_hrCost = 1;
};

[-_hrCost,-_moneyCost] remoteExec ["A3A_fnc_resourcesFIA",2];

if (_typeX == "delete") exitWith {
	closeDialog 0;
	closeDialog 0;
	[localize "STR_A3A_Dialogs_mineDialog_header", localize "STR_A3A_Dialogs_mineDialog_desc"] call A3A_fnc_customHint;

	if ([] call FUNCMAIN(isTeardownEnabled)) exitWith {
		playSound "A3AP_UiFailure";
		[localize "STR_A3A_Dialogs_mineDialog_header", localize "STR_A3A_Dialogs_teardownActivePleaseDisable_text"] call A3A_fnc_customHint;
	};

	[[],"A3A_fnc_mineSweep"] remoteExec ["A3A_fnc_scheduler",2];
};

private _quantityMax = if (_typeX == "ATMine") then {
	20;
} else {
	40;
};

if (_quantity > _quantityMax) then {
	_quantity = _quantityMax;
};

if (_quantity isEqualTo -1) then {
	_quantity = _quantityMax;
};

[[_typeX,_position,_quantity,_mine],"A3A_fnc_buildMinefield"] remoteExec ["A3A_fnc_scheduler",2];

closeDialog 0;
closeDialog 0;
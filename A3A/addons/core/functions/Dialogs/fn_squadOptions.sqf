#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!([player] call A3A_fnc_hasRadio)) exitWith {
	[localize "STR_A3A_Dialogs_squadOptions_header", localize "STR_A3A_reinf_addFIASquadHC_error_radio"] call SCRT_fnc_misc_deniedHint;
};
#ifdef UseDoomGUI
	ERROR("Disabled due to UseDoomGUI Switch.")
#else
	_nul = createDialog "squadOptions";
#endif

sleep 1;
disableSerialization;

private _display = findDisplay 100;

if (str (_display) == "no display") exitWith {};

private _costs = 0;
private _costHR = 0;

{_costs = _costs + (server getVariable _x); _costHR = _costHR +1} forEach FactionGet(reb,"groupSquad");
(_display displayCtrl 104) ctrlSetTooltip format [localize "STR_dialog_cost_hire", _costs, _costHR, A3A_faction_civ get "currencySymbol"];

_costs = 0;
_costHR = 0;
{_costs = _costs + (server getVariable _x); _costHR = _costHR +1} forEach FactionGet(reb,"groupSquadEng");
(_display displayCtrl 105) ctrlSetTooltip format [localize "STR_dialog_cost_hire", _costs, _costHR, A3A_faction_civ get "currencySymbol"];

_costs = 0;
_costHR = 0;
{_costs = _costs + (server getVariable _x); _costHR = _costHR +1} forEach FactionGet(reb,"groupSquadSupp");
_costs = _costs + ([(FactionGetTieredFT(A3A_faction_reb, "staticMGs", 0)) # 0] call A3A_fnc_vehiclePrice);
(_display displayCtrl 106) ctrlSetTooltip format [localize "STR_dialog_cost_hire", _costs, _costHR, A3A_faction_civ get "currencySymbol"];

_costs = 0;
_costHR = 0;
{_costs = _costs + (server getVariable _x); _costHR = _costHR +1} forEach FactionGet(reb,"groupSquadSupp");
_costs = _costs + ([(FactionGetTieredFT(A3A_faction_reb, "staticMortars", 0))# 0] call A3A_fnc_vehiclePrice);
(_display displayCtrl 107) ctrlSetTooltip format [localize "STR_dialog_cost_hire", _costs, _costHR, A3A_faction_civ get "currencySymbol"];

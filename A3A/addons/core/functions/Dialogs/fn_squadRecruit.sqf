#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private ["_childControl","_costs","_costHR"];
if (!([player] call A3A_fnc_hasRadio)) exitWith {
	[localize "STR_antistasi_dialogs_squad_recruitment_menu_frame_text", localize "STR_A3A_reinf_addFIASquadHC_error_radio"] call SCRT_fnc_misc_deniedHint;
};
#ifdef UseDoomGUI
	ERROR("Disabled due to UseDoomGUI Switch.")
#else
	createDialog "squadRecruit";
#endif

sleep 1;
disableSerialization;

private _display = findDisplay 100;

if (str (_display) == "no display") exitWith {};

private _crewCost = server getVariable FactionGet(reb,"unitCrew");

private _costs = 0;
private _costHR = 0;

_costs = 0;
_costHR = 0;
{_costs = _costs + (server getVariable _x); _costHR = _costHR +1} forEach FactionGet(reb,"groupMedium");
(_display displayCtrl 105) ctrlSetTooltip format [localize "STR_dialog_cost_hire",_costs,_costHR, A3A_faction_civ get "currencySymbol"];

_costs = 0;
_costHR = 0;
{_costs = _costs + (server getVariable _x); _costHR = _costHR +1} forEach FactionGet(reb,"groupAT");
(_display displayCtrl 106) ctrlSetTooltip format [localize "STR_dialog_cost_hire",_costs,_costHR, A3A_faction_civ get "currencySymbol"];

_costs = 0;
_costHR = 0;
{_costs = _costs + (server getVariable _x); _costHR = _costHR +1} forEach FactionGet(reb,"groupSniper");
(_display displayCtrl 107) ctrlSetTooltip format [localize "STR_dialog_cost_hire",_costs,_costHR, A3A_faction_civ get "currencySymbol"];

_costHR = 2;
_costs = 2*_crewCost + ([(FactionGetTieredFT(A3A_faction_reb, "staticMGs", 0)) # 0] call A3A_fnc_vehiclePrice);
(_display displayCtrl 108) ctrlSetTooltip format [localize "STR_dialog_cost_hire",_costs,_costHR, A3A_faction_civ get "currencySymbol"];

_costs = 0;
_costHR = 0;
{_costs = _costs + (server getVariable _x); _costHR = _costHR +1} forEach FactionGet(reb,"groupCrew");
(_display displayCtrl 112) ctrlSetTooltip format [localize "STR_dialog_cost_hire",_costs,_costHR, A3A_faction_civ get "currencySymbol"];

_costHR = 2;
_costs = 2*_crewCost + ([(FactionGetTieredFT(A3A_faction_reb, "vehiclesAT", 0)) # 0] call A3A_fnc_vehiclePrice);
(_display displayCtrl 109) ctrlSetTooltip format [localize "STR_dialog_cost_hire",_costs,_costHR, A3A_faction_civ get "currencySymbol"];

_costHR = 2;
_costs = 2*_crewCost + ([(FactionGetTieredFT(A3A_faction_reb, "vehiclesTruck", 0)) # 0] call A3A_fnc_vehiclePrice) + ([(FactionGetTieredFT(A3A_faction_reb,"staticAA", 0)) # 0] call A3A_fnc_vehiclePrice);
(_display displayCtrl 110) ctrlSetTooltip format [localize "STR_dialog_cost_hire",_costs,_costHR, A3A_faction_civ get "currencySymbol"];

_costHR = 2;
_costs = 2*_crewCost + ([(FactionGetTieredFT(A3A_faction_reb, "staticMortars", 0)) # 0] call A3A_fnc_vehiclePrice);
(_display displayCtrl 111) ctrlSetTooltip format [localize "STR_dialog_cost_hire",_costs,_costHR, A3A_faction_civ get "currencySymbol"];

_costHR = 2;
_costs = 2*_crewCost + ([FactionGetTieredFT(A3A_faction_reb, "vehiclesLightArmed", 0) # 0] call A3A_fnc_vehiclePrice);
(_display displayCtrl 112) ctrlSetTooltip format [localize "STR_dialog_cost_hire",_costs,_costHR, A3A_faction_civ get "currencySymbol"];

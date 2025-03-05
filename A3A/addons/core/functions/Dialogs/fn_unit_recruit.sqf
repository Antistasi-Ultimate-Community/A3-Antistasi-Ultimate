#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

#ifdef UseDoomGUI
    ERROR("Disabled due to UseDoomGUI Switch.")
#else
	createDialog "unitRecruit";
#endif

sleep 1;
disableSerialization;

private _display = findDisplay 100;

if (str (_display) == "no display") exitWith {};

private _childControl = _display displayCtrl 104;

(_display displayCtrl 104) ctrlSetTooltip format [localize "STR_dialog_cost_hire_no_HR",rifle_hr_cost,server getVariable FactionGet(reb,"unitRifle"),A3A_faction_civ get "currencySymbol"];
(_display displayCtrl 105) ctrlSetTooltip format [localize "STR_dialog_cost_hire_no_HR",MG_hr_cost,server getVariable FactionGet(reb,"unitMG"),A3A_faction_civ get "currencySymbol"];
(_display displayCtrl 126) ctrlSetTooltip format [localize "STR_dialog_cost_hire_no_HR",MED_hr_cost,server getVariable FactionGet(reb,"unitMedic"),A3A_faction_civ get "currencySymbol"];
(_display displayCtrl 107) ctrlSetTooltip format [localize "STR_dialog_cost_hire_no_HR",ENG_hr_cost,server getVariable FactionGet(reb,"unitEng"),A3A_faction_civ get "currencySymbol"];
(_display displayCtrl 108) ctrlSetTooltip format [localize "STR_dialog_cost_hire_no_HR",EXP_hr_cost,server getVariable FactionGet(reb,"unitExp"),A3A_faction_civ get "currencySymbol"];
(_display displayCtrl 109) ctrlSetTooltip format [localize "STR_dialog_cost_hire_no_HR",GL_hr_cost,server getVariable FactionGet(reb,"unitGL"),A3A_faction_civ get "currencySymbol"];
(_display displayCtrl 110) ctrlSetTooltip format [localize "STR_dialog_cost_hire_no_HR",Sniper_hr_cost,server getVariable FactionGet(reb,"unitSniper"),A3A_faction_civ get "currencySymbol"];
(_display displayCtrl 111) ctrlSetTooltip format [localize "STR_dialog_cost_hire_no_HR",LAT_hr_cost,server getVariable FactionGet(reb,"unitLAT"),A3A_faction_civ get "currencySymbol"];
(_display displayCtrl 112) ctrlSetTooltip format [localize "STR_dialog_cost_hire_no_HR",AT_hr_cost,server getVariable FactionGet(reb,"unitAT"),A3A_faction_civ get "currencySymbol"];
(_display displayCtrl 113) ctrlSetTooltip format [localize "STR_dialog_cost_hire_no_HR",AA_hr_cost,server getVariable FactionGet(reb,"unitAA"),A3A_faction_civ get "currencySymbol"];
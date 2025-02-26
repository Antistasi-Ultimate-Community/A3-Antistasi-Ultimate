//	Author: Socrates
// 
//	Description:
//	Removes current trader positon, rollbacks variables and assigns new find trader task.
//
//	Returns:
//	void
//
// 	How to use: 
// 	[] spawn SCRT_fnc_trader_rerollTrader;
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

if (disableTrader) exitWith {};

#define COST 1000

if (!(isTraderQuestCompleted || (!(isNil 'isTraderQuestAssigned') && {isTraderQuestAssigned}))) exitWith {
    Error("Trader task is not completed yet, aborting.");
};

Info("Arms dealer reroll initiated.");

private _resourcesFIA = server getVariable "resourcesFIA";
if (_resourcesFIA < COST) exitWith {
    [
        localize "STR_notifiers_fail_type",
        localize "STR_notifiers_trader_position_reroll_trader_header",  
        parseText (localize "STR_notifiers_trader_position_reroll_trader_no_money"), 
        30
    ] spawn SCRT_fnc_ui_showMessage;
};

closeDialog 0;
closeDialog 0;

[0, -COST] remoteExec ["A3A_fnc_resourcesFIA",2];

Debug("Cancelling state variables.");

isTraderQuestAssigned = false;
isTraderQuestCompleted = false;
publicVariable "isTraderQuestAssigned";
publicVariable "isTraderQuestCompleted";

Debug("Deleting trader markers.");

deleteMarker "TraderMarker";
traderMarker = nil;
publicVariable "traderMarker";

Debug("Deleting trader.");

deleteVehicle traderX;
publicVariable "traderX";

Debug("Deleting trader objects.");

{
    deleteVehicle _x;
} forEach traderObjects;

sleep 1.5;

traderObjects = nil;
publicVariable "traderObjects";

Debug("Assigning new trader task.");

[] remoteExec ["SCRT_fnc_trader_prepareTraderQuest", 2];

Info("Trader reroll finished.");
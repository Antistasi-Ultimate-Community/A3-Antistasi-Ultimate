// SERVER: builds the sellable vehicle catalog once. Source per the "Vehicle Stock source" setting:
// the vehicles of every faction in the campaign (default) or a scan of everything loaded.
// Entries: [class, category, source side variable name]
// Categories match Antistasi Ultimate's own black market so the facility
// requirements line up with it (see fn_vehReq).
// Antistasi only - outside it there are no factions or facilities.
#include "..\script_component.hpp"
if (!isServer) exitWith {};
ABZ_vehPool = [];
if !(call ABZ_fnc_isAntistasi) exitWith {
	Error("[ABZ] Vehicle catalog: not an Antistasi mission - no military vehicles");
};

private _stockSource = missionNamespace getVariable ["ABZ_vehStockSource", 0]; 
switch (_stockSource) do {
	case 0: { call ABZ_fnc_vehPoolFromFactions };
	case 1: { call ABZ_fnc_vehPoolFromBlackMarket };
	case 2: { call ABZ_fnc_vehPoolFromConfigs };
} params ["_rows", "_skipped"];
ABZ_vehPool = _rows;

private _counts = createHashMap;
{ _counts set [_x select 1, (_counts getOrDefault [_x select 1, 0]) + 1] } forEach ABZ_vehPool;

private _source = ["factions", "blackmarket", "configs"] select _stockSource;
Debug_4("[ABZ] Vehicle catalog: %1 military vehicles from %2 %3 (%4 candidates skipped: UAV/artillery/supply/static/invalid)",count ABZ_vehPool,_source,toArray _counts,_skipped);

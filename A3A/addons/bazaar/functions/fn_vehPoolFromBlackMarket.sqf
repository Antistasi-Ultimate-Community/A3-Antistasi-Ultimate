/*
	Author:
		Creep'nCrunch / jwoodruff40
	
	Description:
		Builds a pool of vehicles from the black market configs
	
	Params:
		None
	
	Dependencies:
		N/A
	
	Scope:
		Server
	
	Environment:
		Unscheduled
	
	Usage:
		call ABZ_fnc_vehPoolFromBlackMarket;
	
	Return:
		[array of stock rows, number of skipped entries] <ARRAY>
*/
#include "..\script_component.hpp"
private _rows = [];
private _skipped = 0;

private _stock = missionNamespace getVariable "A3U_blackMarketStock";
if (isNil "_stock" || {!(_stock isEqualType createHashMap)}) exitWith { [[], 0] };

{
	private _cat = _x;
	private _vehicles = _y;
	_rows append (_vehicles apply {_x params ["_class", "_price"]; [_class, _cat, ""]});
} forEach _stock;

[_rows, _skipped]

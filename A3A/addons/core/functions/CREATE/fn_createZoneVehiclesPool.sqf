/*
	Maintainer:
		jwoodruff40 / Creep'nCrunch
	
	Description:
		Creates a weighted array of vehicles for spawning within a zone, splitting the weights evenly among the classes in each category
	
	Params:
		_faction <HASHMAP> Faction hashmap
		_types <ARRAY> Template keys, e.g. ["vehiclesTrucks", "vehiclesLightArmed"]
		_weights <ARRAY> Weight of each category, same order as _types
	
	Dependencies:
		N/A
	
	Scope:
		Server (by virtue of being called from the createAIXXX functions; doesn't have to be)
	
	Environment:
		Scheduled (by virtue of being called from the createAIXXX functions; doesn't have to be)
	
	Usage:
		private _pool = [_faction, ["vehiclesTrucks"], [2]] call A3A_fnc_createZoneVehiclesPool;
	
	Return:
		_pool <ARRAY> (weighted)
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_faction", "_types", "_weights"];

// we deliberately use the [[items], [weights]] format instead of [item, weight, item, weight, ...] because it makes this part simpler
private _pool = [];
{
	private _vehs = _faction getOrDefault [_x, []];
	if (_vehs isEqualTo []) then { continue };
	private _weight = (_weights select _forEachIndex) / count _vehs;
	{
		_pool append [_x, _weight];
	} forEach _vehs;
} forEach _types;

_pool

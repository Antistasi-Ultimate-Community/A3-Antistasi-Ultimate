/* ----------------------------------------------------------------------------
	Function: A3A_fnc_mapmodesUnregister
	
	Description:
		Removes your mode from this client's dropdown. If active, the framework calls your cleanup callback first.
	
	Parameters:
		0: _id - Registered provider ID <String>
	
	Example:
		["MyAddon_supply"] call A3A_fnc_mapmodesUnregister;
	
	Returns:
		<Boolean> true on removal; false for malformed or unknown IDs, no interface, 
		or nested mutations. Callback exceptions propagate.
	
	Scope:
		Client
	
	Author:
		eirish
---------------------------------------------------------------------------- */

#include "..\..\script_component.hpp"
private _result = false;
isNil { _result = _this call FUNC(unregisterMode); };
_result

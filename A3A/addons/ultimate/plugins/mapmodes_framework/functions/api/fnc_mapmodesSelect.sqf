/* ----------------------------------------------------------------------------
	Function: A3A_fnc_mapmodesSelect
	
	Description:
		Selects a registered mode on this client, cleaning up the previous one first.
		A successful explicit choice is remembered in the player's profile. Selecting
		the current mode does not repeat its callbacks.
	
	Parameters:
		0: _id - Provider ID, or empty string for default map <String>
	
	Example:
		["MyAddon_supply"] call A3A_fnc_mapmodesSelect;
		[""] call A3A_fnc_mapmodesSelect;
	
	Returns:
		<Boolean> true on success, including same-mode selection. false for malformed
		or unknown IDs, no interface or nested transitions. Callback exceptions propagate.
	
	Scope:
		Client; provider callbacks run unscheduled even from a scheduled caller.
	
	Author:
		eirish
---------------------------------------------------------------------------- */

#include "..\..\script_component.hpp"
if !assert(params[
	["_id", nil, [""]]
	]) exitWith {
		false
	};
private _result = false;
isNil { _result = _this call FUNC(selectMode); };
_result

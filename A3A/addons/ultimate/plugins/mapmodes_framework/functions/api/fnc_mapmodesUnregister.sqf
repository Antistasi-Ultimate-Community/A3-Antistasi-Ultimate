/* ----------------------------------------------------------------------------
Function: A3A_fnc_mapmodesUnregister

Description:
	Removes your mode from this client's dropdown. If active, the framework calls
	your cleanup callback first. Failed cleanup aborts removal.

Parameters:
	0: _id - Registered provider ID <String>

Example:
	["MyAddon_supply"] call A3A_fnc_mapmodesUnregister;

Returns:
	<Boolean> True on removal; false for malformed or unknown IDs, no interface,
	nested mutations or an explicit deactivation exception.

Scope:
	Client

Author:
	eirish
---------------------------------------------------------------------------- */

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private _result = false;
isNil { _result = _this call FUNC(unregisterMode); };
_result
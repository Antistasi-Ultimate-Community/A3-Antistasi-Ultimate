/* ----------------------------------------------------------------------------
Function: A3A_fnc_mapmodesGetActive

Description:
	Reads this client's selected provider without calling its code.

Parameters:
	None; call with an empty array.

Example:
	[] call A3A_fnc_mapmodesGetActive;

Returns:
	<String> Provider ID, or "" for Default map, malformed arguments or no interface.

Scope:
	Client

Author:
	eirish
---------------------------------------------------------------------------- */

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!hasInterface || {!(_this isEqualTo [])}) exitWith {""};
missionNamespace getVariable [QGVAR(active), ""]
/* ----------------------------------------------------------------------------
Function: A3A_fnc_mapmodesGetModes

Description:
	Returns cached provider metadata in dropdown order. Records are detached copies;
	callbacks and mutable registry storage are not exposed. Default map is implicit.

Parameters:
	None; call with an empty array.

Example:
	[] call A3A_fnc_mapmodesGetModes;

Returns:
	<Array> [[ID, label, official boolean, order, icon path], ...]. Returns [] for malformed
	arguments or no interface. Default map is not included in the provider list.

Scope:
	Client

Author:
	eirish
---------------------------------------------------------------------------- */

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!hasInterface || {!(_this isEqualTo [])}) exitWith {[]};
(missionNamespace getVariable [QGVAR(modes), []]) apply {+_x}
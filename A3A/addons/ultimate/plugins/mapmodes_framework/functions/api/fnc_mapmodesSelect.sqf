/* ----------------------------------------------------------------------------
Function: A3A_fnc_mapmodesSelect

Description:
	Selects a registered mode on this client, cleaning up the previous one first.
	A successful explicit choice is remembered in the player's profile. Selecting
	the current mode does not repeat its callbacks.

Parameters:
	0: _id - Provider ID, or empty string for Default map <String>

Example:
	["MyAddon_supply"] call A3A_fnc_mapmodesSelect;
	[""] call A3A_fnc_mapmodesSelect;

Returns:
	<Boolean> True on success, including same-mode selection. False for malformed
	or unknown IDs, no interface, nested transitions or explicit callback exceptions.

Scope:
	Client; provider callbacks run unscheduled even from a scheduled caller.

Author:
	eirish
---------------------------------------------------------------------------- */

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if !(_this isEqualType [] && {count _this isEqualTo 1} && {!isNil {_this select 0}} && {(_this select 0) isEqualType ""}) exitWith {false};
private _result = false;
isNil { _result = [_this select 0, true] call FUNC(selectMode); };
_result
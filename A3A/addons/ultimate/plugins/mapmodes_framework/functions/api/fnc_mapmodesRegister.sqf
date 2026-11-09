/* ----------------------------------------------------------------------------
Function: A3A_fnc_mapmodesRegister

Description:
	Registers your mode on this client after your functions are prepared.
	You own rendering and cleanup. Callbacks receive no arguments, run unscheduled,
	and must not sleep. Registration selects the mode only when restoring a saved choice.

Parameters:
	0: _id - Unique namespaced provider ID <String>
	1: _label - Localized display name <String>
	2: _activate - Code that enables your mode <Code>
	3: _deactivate - Code that removes your owned handlers, controls and workers <Code>

Optional:
	4: _order - Sort priority within the provider group; default 100 <Number>
	5: _icon - Texture path displayed before the name; default empty <String>

Example:
	["MyAddon_supply", localize "STR_MyAddon_Supply",
		{[] call MyAddon_fnc_enable}, {[] call MyAddon_fnc_disable}
	] call A3A_fnc_mapmodesRegister;

Returns:
	<Boolean> True on registration. False for malformed input, duplicate IDs,
	no client interface or mutations attempted during another transition.

Scope:
	Client; registration is local and is not broadcast.

Author:
	eirish
---------------------------------------------------------------------------- */

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private _result = false;
isNil { _result = _this call FUNC(registerMode); };
_result
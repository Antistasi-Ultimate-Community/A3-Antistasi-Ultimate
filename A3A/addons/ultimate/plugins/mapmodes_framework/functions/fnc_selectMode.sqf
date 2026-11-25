/* ----------------------------------------------------------------------------
	Function: A3A_ultimate_mapmodes_framework_fnc_selectMode
	
	Description:
	    Switches this client's provider, cleaning up the previous mode first.
	    Same-mode selections do not rerun callbacks. Saves successful explicit choices
	    but does not overwrite preferences during automatic restoration.
	
	Parameters:
	    0: _id - Registered provider ID, or empty string for default map <String>
	
	Optional:
	    1: _explicit - Whether this is a player/script choice; default true <Boolean>
	
	Example:
	    ["MyAddon_supply", false] call A3A_ultimate_mapmodes_framework_fnc_selectMode;
	
	Returns:
	    <Boolean> true on success; false for unknown modes or reentrancy.
	    Callback exceptions propagate to the caller.
	
	Scope:
	    Client
	
	Author:
	    eirish
---------------------------------------------------------------------------- */

#include "..\script_component.hpp"

params ["_id", ["_explicit", true]];
if (!hasInterface || {
	missionNamespace getVariable [QGVAR(transitioning), false]
}) exitWith {
	false
};
private _registry = missionNamespace getVariable [QGVAR(registry), createHashMap];
if (_id != "" && {
	!(_id in _registry)
}) exitWith {
	false
};
private _previous = missionNamespace getVariable [QGVAR(active), ""];
missionNamespace setVariable [QGVAR(transitioning), true];
if (_id != _previous) then {
	if (_previous in _registry) then {
		[] call ((_registry get _previous) select 2);
	};
	missionNamespace setVariable [QGVAR(active), ""];
	if (_id != "") then {
		[] call ((_registry get _id) select 1);
		missionNamespace setVariable [QGVAR(active), _id];
	};
};
missionNamespace setVariable [QGVAR(transitioning), false];
if (_explicit) then {
	missionNamespace setVariable [QGVAR(explicitSelection), true];
	missionNamespace setVariable [QGVAR(preferred), _id];
	if ((profileNamespace getVariable [QGVAR(preferred), ""]) isNotEqualTo _id) then {
		profileNamespace setVariable [QGVAR(preferred), _id];
		saveProfileNamespace;
	};
};
[false] call FUNC(refreshSelector);
true

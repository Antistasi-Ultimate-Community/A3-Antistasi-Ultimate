#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3USPCM_store_fnc_canStartAdvancedSelling

Description:
    Condition callback for ACE3 interaction

Parameters:
    0: _container - Inventory container <OBJECT>

Optional:

Example:

Returns:
    <BOOL>

Author:
    goreSplatter
---------------------------------------------------------------------------- */
params[["_container",objNull,[objNull]], ["_player",objNull,[objNull]]];

if !assert(!isNull _container) exitWith {false};
if (!isNull _player && { !isNull objectParent _player }) exitWith {false};

if (missionNamespace getVariable["traderX",false] isEqualTo false) exitWith {false};
if (_container distance2D traderX > ADVANCED_SELLING_RANGE) exitWith {false};

[_container] call FUNCMAIN(utilVehicleHasCargo);

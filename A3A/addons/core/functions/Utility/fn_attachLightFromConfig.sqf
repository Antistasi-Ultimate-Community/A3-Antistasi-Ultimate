#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_attachLightFromConfig

Description:
    Attaches a light to an object based on its config settings.

Parameters:
    0: _object -  Object to which the light will be attached <OBJECT>

Optional:

Example:
    (begin example)
    [myObject1] call A3A_fnc_attachLightFromConfig;
    (end example)

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Debug_2("%1(%2)",QFUNCMAIN(attachLightFromConfig),_this);

if !assert(params[
    ["_object", nil, [objNull]]
]) exitWith {};
if !assert(!isNull _object) exitWith {};

// No interface, no lights
if (!hasInterface) exitWith {};

private _config = configOf _object >> "LightParams";

if !assert(isClass _config) exitWith {};

private _light = [
	_object,
	getArray(_config >> "color"),
	getArray(_config >> "ambient"),
	getNumber(_config >> "intensity"),
	[false, true] select(getNumber(_config >> "useFlare")),
	getNumber(_config >> "flareSize"),
	getNumber(_config >> "flareMaxDistance"),
	[false, true] select(getNumber(_config >> "dayLight"))
] call FUNCMAIN(attachLight);

_object setVariable[QGVAR(ChemLite_LiteSource), _light];
_object addEventHandler["Deleted", {
	params["_object"];
	private _light = _object getVariable[QGVAR(ChemLite_LiteSource), objNull];

	if !(isNull _light) then {
		deleteVehicle _light;
	};
}];

nil;

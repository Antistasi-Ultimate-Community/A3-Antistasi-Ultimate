/*
 * File: fn_itemConfig.sqf
 * Author: Spoffy
 * Description:
 *    Returns the config of an item from its class name
 * Params:
 *    _class - Class of the item to retrieve the config of. 
 * Returns:
 *    Config of the item, or configNull if not found.
 * Example Usage:
 *   ("mySpecialMagazine") call A3A_fnc_itemConfig;
 */


params ["_class"];

private _rootclass = ["CfgAmmo", "CfgMagazines", "CfgWeapons"];
private _config = configNull;

{
	_config = configFile >> _x >> _class;
	if (isClass _config) then { break };
} forEach _rootclass;

_config
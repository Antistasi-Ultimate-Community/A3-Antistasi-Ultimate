/*
	Function: HALs_store_fnc_getCompatibleItems
	Author: HallyG
	Returns all items and magazines compatible with a weapon.

	Argument(s):
	0: Weapon classname <STRING>

	Return Value:
	<ARRAY>

	Example:
	(primaryWeapon player) call HALs_store_fnc_getCompatibleItems;
__________________________________________________________________*/
params [
	["_classname", ""]
];

private _attachments = _classname call BIS_fnc_compatibleItems;
private _config = configFile >> "CfgWeapons" >> _classname;
_attachments append getArray (_config >> "magazines");

{
	if (_x isNotEqualTo "this") then {
		_attachments append getArray (_config >> _x >> "magazines");
	};
} forEach getArray (_config >> "muzzles");

_attachments

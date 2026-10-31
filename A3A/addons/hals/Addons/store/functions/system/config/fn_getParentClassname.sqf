/*
	Function: HALs_store_fnc_getParentClassname
	Author: HallyG
	Returns the classname of a weapons parent.

	Argument(s):
	0: Item Classname <STRING>

	Return Value:
	<STRING>

	Example:
	_item call HALs_store_fnc_getParentClassname;
__________________________________________________________________*/
#define CFG configFile >> "CfgWeapons"

private _parent = inheritsFrom (CFG >> _this);
if (getNumber (_parent >> 'scope') isEqualTo 2) exitWith {
	configName _parent;
};

_this 

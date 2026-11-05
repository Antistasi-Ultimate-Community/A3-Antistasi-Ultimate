// Friendly name for a classname, cached.
params [["_class", "", [""]]];
if (_class == "") exitWith { "(none)" };
if (_class in ABZ_nameCache) exitWith { ABZ_nameCache get _class };

private _name = "";
{
	private _c = configFile >> _x >> _class;
	if (!isClass _c) then { continue };
	_name = getText (_c >> "displayName");
	if (_name != "") exitWith {};
} forEach ["CfgWeapons", "CfgMagazines", "CfgVehicles", "CfgGlasses"];

if (_name == "") then { _name = _class };
ABZ_nameCache set [_class, _name];
_name

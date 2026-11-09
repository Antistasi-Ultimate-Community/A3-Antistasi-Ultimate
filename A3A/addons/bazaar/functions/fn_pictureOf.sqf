// A preview image for a classname, or "" when there is nothing to show.
// Vehicles use their editor preview (a real picture); everything else its
// inventory picture.
params [["_class", "", [""]]];
if (_class == "") exitWith { "" };

private _cv = configFile >> "CfgVehicles" >> _class;
if (isClass _cv && {!(_class isKindOf "Bag_Base")}) exitWith {
	private _p = getText (_cv >> "editorPreview");
	if (_p == "") then { _p = getText (_cv >> "picture") };
	_p
};

private _pic = "";
{
	private _c = configFile >> _x >> _class;
	if (!isClass _c) then { continue };
	{
		private _p = getText (_c >> _x);
		if (_p != "") exitWith { _pic = _p };
	} forEach ["picture", "editorPreview", "icon"];
	if (_pic != "") exitWith {};
} forEach ["CfgWeapons", "CfgMagazines", "CfgVehicles", "CfgGlasses"];
_pic

// Can this classname be sold at all? Public scope, has a name, and is a
// weapon / magazine / wearable / backpack that exists in the loaded configs.
// Backpacks that assemble into something (UAV bags, static weapon bags and
// their tripod halves) are excluded - those are Antistasi's logistics
// progression, not Bazaar stock. (v1.1.0: weapon bags declare base[] as an
// ARRAY and drone bags leave base empty, so the old "base is a non-empty
// string" test let both through as $80 backpacks.)
params [["_c", "", [""]]];
if (_c == "") exitWith { false };

private _cw = configFile >> "CfgWeapons" >> _c;
if (isClass _cw) exitWith {
	getNumber (_cw >> "scope") == 2 && {getText (_cw >> "displayName") != ""}
};
private _cm = configFile >> "CfgMagazines" >> _c;
if (isClass _cm) exitWith {
	getNumber (_cm >> "scope") == 2 && {getText (_cm >> "displayName") != ""}
};
private _cg = configFile >> "CfgGlasses" >> _c;
if (isClass _cg) exitWith {
	getNumber (_cg >> "scope") == 2
};
private _cv = configFile >> "CfgVehicles" >> _c;
if (isClass _cv) exitWith {
	getNumber (_cv >> "scope") == 2
	&& {_c isKindOf "Bag_Base"}
	&& {!(_c isKindOf "Weapon_Bag_Base")}
	&& {
		private _ai = _cv >> "assembleInfo";
		!isClass _ai || {
			getText (_ai >> "assembleTo") == ""
			&& {getText (_ai >> "base") == ""}
			&& {(getArray (_ai >> "base")) isEqualTo []}
		}
	}
};
false

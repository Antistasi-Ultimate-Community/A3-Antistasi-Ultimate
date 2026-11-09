// Sorts a classname into a Bazaar kind: "weapon", "ammo", "gear",
// "clothing" - or "" for things the Bazaar never sells (vehicle weapons,
// artillery shells, throw/put pseudo-weapons, unknown mod junk...).
// Returns [kind, subtype] where subtype is BIS_fnc_itemType's second value.
params [["_class", "", [""]]];
if (_class == "") exitWith { ["", ""] };

// ACE3 / CBA misc items (bandages, morphine, earplugs, cable ties, wirecutters,
// ACE optics-slot items...) piggyback on an attachment ItemInfo type, so
// BIS_fnc_itemType files them as optics or muzzles. Antistasi's arsenal keeps
// them under MiscItem - the Bazaar does the same.
private _cw = configFile >> "CfgWeapons" >> _class;
if (isClass _cw && {_class isKindOf ["CBA_MiscItem", configFile >> "CfgWeapons"]}) exitWith {
	["gear", "MiscItem"]
};
if (isClass _cw && {getNumber (_cw >> "ACE_isMedicalItem") > 0}) exitWith {
	["gear", "MiscItem"]
};

private _t = _class call BIS_fnc_itemType;
_t params [["_type", "", [""]], ["_sub", "", [""]]];
private _wear = ["Uniform", "Vest", "Headgear", "Glasses", "Backpack"];

private _kind = switch (_type) do {
	case "Weapon": {
		if (_sub in ["AssaultRifle", "Rifle", "SubmachineGun", "Shotgun", "Handgun", "MachineGun", "SniperRifle", "RocketLauncher", "MissileLauncher"]) then { "weapon" } else { "" }
	};
	case "Magazine": {
		if (_sub in ["Bullet", "ShotgunShell", "Grenade", "SmokeShell", "Flare", "Shell", "Rocket", "Missile"]) then { "ammo" } else { "" }
	};
	case "Mine": { "ammo" };
	case "Item": { if (_sub in _wear) then { "clothing" } else { "gear" } };
	case "Equipment": { if (_sub in _wear) then { "clothing" } else { "gear" } };
	default { "" };
};

// "Unknown" items are usually a mod's bookkeeping objects - leave them out
if (_kind == "gear" && {_sub in ["UnknownEquipment", "Unknown"]}) then { _kind = "" };

[_kind, _sub]

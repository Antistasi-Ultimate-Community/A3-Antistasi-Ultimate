// Base (pre-multiplier, pre-rarity) price of an item, from what it is
// rather than from any per-mod table - so it prices RHS, 3CB, CUP and
// Faction Forger gear the same way vanilla is priced.
// [_class, _kind, _subtype] -> number
params [["_class", "", [""]], ["_kind", "", [""]], ["_sub", "", [""]]];

private _p = switch (_sub) do {
	case "AssaultRifle";
	case "Rifle": { 450 };
	case "SubmachineGun": { 300 };
	case "Shotgun": { 250 };
	case "Handgun": { 120 };
	case "MachineGun": { 900 };
	case "SniperRifle": { 1200 };
	case "RocketLauncher": { 1500 };
	case "MissileLauncher": { 3500 };
	case "Bullet";
	case "ShotgunShell": { 15 };
	case "Grenade": { 40 };
	case "SmokeShell": { 15 };
	case "Flare": { 10 };
	case "Shell": { 30 };
	case "Rocket": { 300 };
	case "Missile": { 800 };
	case "Mine";
	case "MineBounding";
	case "MineDirectional";
	case "Explosive": { 200 };
	case "AccessorySights": { 150 };
	case "AccessoryMuzzle": { 100 };
	case "AccessoryPointer": { 60 };
	case "AccessoryBipod": { 80 };
	case "NVGoggles": { 500 };
	case "Binocular": { 80 };
	case "LaserDesignator": { 900 };
	case "Radio": { 100 };
	case "GPS": { 120 };
	case "Map";
	case "Compass";
	case "Watch": { 20 };
	case "FirstAidKit": { 20 };
	case "Medikit": { 150 };
	case "Toolkit": { 200 };
	case "MineDetector": { 150 };
	case "UAVTerminal": { 600 };
	case "Uniform": { 60 };
	case "Vest": { 120 };
	case "Headgear": { 40 };
	case "Backpack": { 80 };
	case "Glasses": { 20 };
	case "MiscItem": { 25 };	// ACE/CBA misc items: medical, earplugs, tools
	default { 50 };
};

private _cw = configFile >> "CfgWeapons" >> _class;
private _cm = configFile >> "CfgMagazines" >> _class;

switch (_sub) do {
	// bullets are priced per round (a 200-round box is worth more than a 30-round mag)
	case "Bullet";
	case "ShotgunShell": {
		_p = 10 max round (0.5 * getNumber (_cm >> "count"));
	};
	// thermal / night optics are the real prize
	case "AccessorySights": {
		private _modes = _cw >> "ItemInfo" >> "OpticsModes";
		private _ti = false;
		private _nv = false;
		{
			private _vm = (getArray (_x >> "visionMode")) apply { toLower _x };	// "Ti", "TI", "nvg"... - mods spell it every way
			if ("ti" in _vm) then { _ti = true };
			if ("nvg" in _vm) then { _nv = true };
		} forEach ("true" configClasses _modes);
		if (_ti) then { _p = _p * 5 } else { if (_nv) then { _p = _p * 2.5 } };
	};
	case "Binocular": {
		private _vm = (getArray (_cw >> "visionMode")) apply { toLower _x };
		if ("ti" in _vm) then { _p = _p * 6 } else { if ("nvg" in _vm) then { _p = _p * 3 } };
	};
	// armor is what you pay for on helmets and vests
	case "Headgear": {
		private _a = getNumber (_cw >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor");
		if (_a > 0) then { _p = _p + round (30 * _a) };
	};
	case "Vest": {
		private _a = getNumber (_cw >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Chest" >> "armor");
		if (_a > 0) then { _p = _p + round (25 * _a) };
	};
	case "Backpack": {
		private _l = getNumber (configFile >> "CfgVehicles" >> _class >> "maximumLoad");
		if (_l > 0) then { _p = 30 max round (_l / 6) };
	};
};

round _p

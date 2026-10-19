// Client: single-item purchases arrive here (ABZ_give). Goes into the
// player's kit - empty weapon/clothing slot or free inventory space - and
// anything that doesn't fit lands in a holder on the ground beside them.
// While undercover nothing that breaks cover is put on (v1.1.1).
// _rounds (magazines, optional): exact round count per magazine - a refund
// hands back part-used magazines as they were, never as full ones.
params [["_class", "", [""]], ["_qty", 1, [0]], ["_rounds", [], [[]]]];
if (!hasInterface || {_class == ""}) exitWith {};

private _cw = configFile >> "CfgWeapons" >> _class;
private _cm = configFile >> "CfgMagazines" >> _class;
private _cv = configFile >> "CfgVehicles" >> _class;
private _cg = configFile >> "CfgGlasses" >> _class;
private _dropped = 0;
private _holder = objNull;

private _fnc_drop = {
	params ["_c", ["_ammo", -1]];
	if (isNull _holder) then {
		private _p = player getPos [1.2, getDir player];
		_holder = createVehicle ["GroundWeaponHolder", _p, [], 0, "CAN_COLLIDE"];
		_holder setPosATL [_p select 0, _p select 1, 0];
	};
	switch (true) do {
		case (isClass _cm): { if (_ammo >= 0) then { _holder addMagazineAmmoCargo [_c, 1, _ammo] } else { _holder addMagazineCargoGlobal [_c, 1] } };
		case (isClass _cw && {(getNumber (_cw >> "type")) in [1, 2, 4, 4096]}): { _holder addWeaponCargoGlobal [_c, 1] };
		case (isClass _cv): { _holder addBackpackCargoGlobal [_c, 1] };
		default { _holder addItemCargoGlobal [_c, 1] };
	};
	_dropped = _dropped + 1;
};

// undercover (v1.1.1): a weapon in the hands, a vest or an armoured helmet
// would break cover the moment it arrives (Antistasi's fn_goUndercover) -
// it goes into the backpack, vest or uniform instead (or the ground)
private _keepCover = captive player;
private _fnc_stow = {
	params ["_c", ["_isWeapon", false]];
	private _to = switch (true) do {
		case (!isNull backpackContainer player && {player canAddItemToBackpack _c}): { backpackContainer player };
		case (!isNull vestContainer player && {player canAddItemToVest _c}): { vestContainer player };
		case (!isNull uniformContainer player && {player canAddItemToUniform _c}): { uniformContainer player };
		default { objNull };
	};
	switch (true) do {
		case (isNull _to): { [_c] call _fnc_drop };
		case (_isWeapon): { _to addWeaponCargoGlobal [_c, 1] };
		default { _to addItemCargoGlobal [_c, 1] };
	};
};
private _fnc_weapon = {
	params ["_c", "_slotFree"];
	if (_slotFree && {!_keepCover}) then { player addWeaponGlobal _c } else {
		if (_keepCover) then { [_c, true] call _fnc_stow } else { [_c] call _fnc_drop };
	};
};

for "_i" from 1 to (_qty max 1) do {
	switch (true) do {
		case (isClass _cm): {
			private _ammo = _rounds param [_i - 1, -1];
			if !(_ammo isEqualType 0) then { _ammo = -1 };
			if (player canAdd _class) then {
				if (_ammo >= 0) then { player addMagazine [_class, _ammo] } else { player addMagazine _class };
			} else { [_class, _ammo] call _fnc_drop };
		};
		case (isClass _cv): {	// backpack
			if (backpack player == "") then { player addBackpackGlobal _class } else { [_class] call _fnc_drop };
		};
		case (isClass _cg): {
			if (goggles player == "") then { player addGoggles _class } else { [_class] call _fnc_drop };
		};
		case (isClass _cw): {
			private _type = getNumber (_cw >> "type");
			private _itype = getNumber (_cw >> "ItemInfo" >> "type");
			switch (true) do {
				case (_type == 1): { [_class, primaryWeapon player == ""] call _fnc_weapon };
				case (_type == 4): { [_class, secondaryWeapon player == ""] call _fnc_weapon };
				case (_type == 2): { [_class, handgunWeapon player == ""] call _fnc_weapon };
				case (_type == 4096): {	// binoculars, rangefinders, NVGs
					private _isNV = (toLower getText (_cw >> "simulation")) == "nvgoggles";
					if (!_isNV && {binocular player == ""}) then {
						player addWeaponGlobal _class;
					} else {
						if (player canAdd _class) then { player addItem _class } else { [_class] call _fnc_drop };
					};
				};
				case (_itype == 801): { if (uniform player == "") then { player forceAddUniform _class } else { [_class] call _fnc_drop } };
				case (_itype == 701): {
					switch (true) do {
						case (vest player == "" && {!_keepCover}): { player addVest _class };
						case (_keepCover): { [_class] call _fnc_stow };
						default { [_class] call _fnc_drop };
					};
				};
				case (_itype == 605): {
					private _armoured = getNumber (_cw >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") > 2;
					switch (true) do {
						case (headgear player == "" && {!_keepCover || {!_armoured}}): { player addHeadgear _class };
						case (_keepCover && {_armoured}): { [_class] call _fnc_stow };
						default { [_class] call _fnc_drop };
					};
				};
				default { if (player canAdd _class) then { player addItem _class } else { [_class] call _fnc_drop } };
			};
		};
		default { [_class] call _fnc_drop };
	};
};

if (_dropped > 0) then {
	systemChat format ["[Bazaar] No room for %1 of them - they're on the ground beside you.", _dropped];
};

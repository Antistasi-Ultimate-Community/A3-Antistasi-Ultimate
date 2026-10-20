// SERVER: the heart of unpacking one sealed bulk crate at HQ - its contents
// go into the Antistasi arsenal (one crate = one unlock's worth), the crate
// leaves the world (out of whatever vehicle carried it, properly - see
// fn_crateRemove). Outside Antistasi the crate opens where it stands.
// No messages or chat here: the callers (fn_serverUnpack, one crate;
// fn_serverUnpackAll, every crate around) report.
// [crate, player] -> [ok, what happened, run Antistasi's unlock pass, "25x Name"]
params [["_crate", objNull, [objNull]], ["_player", objNull, [objNull]]];
private _d = _crate getVariable ["ABZ_crate", []];
if (isNull _crate || {_d isEqualTo []}) exitWith { [false, "", false, ""] };
_d params ["_class", "_count"];
_crate setVariable ["ABZ_crate", nil, true];	// claimed once - no double dipping

private _name = [_class] call ABZ_fnc_displayNameOf;
private _label = format ["%1x %2", _count, _name];
private _cw = configFile >> "CfgWeapons" >> _class;
private _cm = configFile >> "CfgMagazines" >> _class;
private _isMag = isClass _cm && {!isClass _cw};

private _toArsenal = (call ABZ_fnc_isAntistasi) && {!isNil "jn_fnc_arsenal_addItem"} && {!isNil "jn_fnc_arsenal_itemType"};
private _tab = -1;
if (_toArsenal) then {
	_tab = _class call jn_fnc_arsenal_itemType;
	if !(_tab isEqualType 0) then { _tab = -1 };
};

if !(_toArsenal && {_tab >= 0}) exitWith {
	// no Antistasi arsenal (or an item it won't take): the crate just opens
	[_crate] call ABZ_fnc_crateRelease;
	isNil { private _i = ABZ_crates find _crate; if (_i > -1) then { ABZ_crates deleteAt _i } };
	_crate lockInventory false;
	[_crate, _class, _count] call ABZ_fnc_addCargo;
	diag_log format ["[ABZ] %1 opened a crate of %2x %3 (no arsenal to feed)", name _player, _count, _class];
	[true, format [localize "STR_A3U_Bazaar_Crate_Opened", _label], false, _label]
};

// the arsenal counts magazines in rounds, not mags
private _amount = _count;
if (_isMag) then { _amount = _count * (1 max getNumber (_cm >> "count")) };
[_tab, _class, _amount] call jn_fnc_arsenal_addItem;
[_crate] call ABZ_fnc_crateRemove;

private _msg = format [localize "STR_A3U_Bazaar_Crate_Unpacked", _label];
private _manage = false;
private _min = missionNamespace getVariable ["minWeaps", -1];
if !(_min isEqualType 0) then { _min = -1 };
if (_min >= 0) then {
	// unlocks ON: Antistasi's own unlock pass runs right away (the caller spawns it once)
	_manage = !isNil "A3A_fnc_arsenalManage";
	if (_min > 0 && {_count >= _min}) then { _msg = _msg + localize "STR_A3U_Bazaar_Notify_FullUnlock" };
} else {
	// unlocks DISABLED on this server (minWeaps = -1)
	if ((missionNamespace getVariable ["ABZ_bulkUnlockAnyway", false]) && {_count >= (call ABZ_fnc_bulkSize)} && {!isNil "A3A_fnc_unlockEquipment"}) then {
		// the server wants crates to be the one unlock path - honor Antistasi's
		// own "never unlock" rules first
		private _forbidden = missionNamespace getVariable ["A3U_forbiddenItems", []];
		private _cats = if (!isNil "A3A_fnc_equipmentClassToCategories") then { _class call A3A_fnc_equipmentClassToCategories } else { [] };
		private _blocked = (_forbidden isEqualType [] && {_class in _forbidden})
			|| {("MissileLaunchers" in _cats) && {(missionNamespace getVariable ["allowGuidedLaunchers", 1]) == 0}}
			|| {("Explosives" in _cats) && {(missionNamespace getVariable ["allowUnlockedExplosives", 1]) == 0}}
			|| {"StaticWeaponParts" in _cats};
		if (_blocked) then {
			_msg = _msg + localize "STR_A3U_Bazaar_Notify_CantBeUnlocked";
		} else {
			[_class] call A3A_fnc_unlockEquipment;
			_msg = _msg + localize "STR_A3U_Bazaar_Notify_UnlockedArsenal";
			diag_log format ["[ABZ] %1 unlocked via bulk crate on an unlocks-disabled server", _class];
		};
	} else {
		_msg = _msg + localize "STR_A3U_Bazaar_Notify_NoArsenalUnlocks";
	};
};
diag_log format ["[ABZ] %1 unpacked %2x %3 into the arsenal (tab %4, amount %5)", name _player, _count, _class, _tab, _amount];
[true, _msg, _manage, _label]

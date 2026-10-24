// Shared (client + server): the class a trader deals this item as, or ""
// when traders don't buy it at all. ONE rule for the sell list, the price,
// the job match, the server's purchase, the refund, the table and the
// Bazaar's own stock (fn_buildPool):
//
//   a trader only buys what he would sell himself.
//
// So it must pass the same test as the Bazaar's own stock (fn_classValid +
// fn_itemKind: public scope-2 gear of a sellable kind), after folding a
// held variant to the item it is a mode of:
//   - a CBA disposable launcher (CUP/3CB/ACE AT tubes) is held as its loaded,
//     fireable class -> dealt as the carry class it came from (what the
//     trader lists and refunds - CBA reloads it on pickup)
//   - a TFAR radio is held as a numbered instance -> its parent radio
//   - an RHS optic in 3D/PiP mode -> its base optic
//   - an attachment switched to another mode (ACE/CUP laser and optic
//     toggles) -> the first public class along its own switch links
//   Weapons are never folded: a preset is sold as itself, complete.
// Never traded:
//   - spent tubes (scope 1, no fold) - junk
//   - a disposable launcher's loose rocket: CBA turns any loose one into a
//     whole launcher inside a new container
//   - a backpack that comes with built-in cargo (preset packs): buying one
//     back would refill it
params [["_c", "", [""]]];
if (_c == "") exitWith { "" };

// fireable disposable -> carry class
private _ll = missionNamespace getVariable ["cba_disposable_LoadedLaunchers", nil];
if (!isNil "_ll") then {
	private _carry = "";
	if (_ll isEqualType createHashMap) then {
		_carry = _ll getOrDefault [_c, _ll getOrDefault [toLower _c, ""]];
	} else {
		if (_ll isEqualType locationNull || {_ll isEqualType objNull}) then { _carry = _ll getVariable [_c, ""] };
	};
	if (_carry isEqualType "" && {_carry != ""} && {isClass (configFile >> "CfgWeapons" >> _carry)}) then { _c = _carry };
};

// held variant of a non-weapon item -> the public item it is a mode of
private _cw = configFile >> "CfgWeapons" >> _c;
if (isClass _cw && {!([_c] call ABZ_fnc_classValid)} && {!([_c] call ABZ_fnc_isWeaponType)}) then {
	private _found = "";
	{
		if (_x != "" && {[_x] call ABZ_fnc_classValid}) exitWith { _found = _x };
	} forEach [getText (_cw >> "tf_parent"), getText (_cw >> "rhs_optic_base")];
	if (_found == "" && {(getNumber (_cw >> "ItemInfo" >> "type")) in [101, 201, 301, 302]}) then {
		// walk the attachment's own (non-inherited) switch links and base class
		private _seen = [toLower _c];
		private _todo = [_c];
		for "_step" from 1 to 8 do {
			if (_todo isEqualTo [] || {_found != ""}) exitWith {};
			private _next = [];
			{
				{
					private _v = getText _x;
					if (_v != "" && {!((toLower _v) in _seen)}) then {
						_seen pushBack (toLower _v);
						_next pushBack _v;
						if (_found == "" && {[_v] call ABZ_fnc_classValid}) then { _found = _v };
					};
				} forEach configProperties [configFile >> "CfgWeapons" >> _x, "(toLower configName _x) in ['mrt_switchitemnextclass', 'mrt_switchitemprevclass', 'baseweapon']", false];
			} forEach _todo;
			_todo = _next;
		};
	};
	if (_found != "") then { _c = _found };
};

private _disp = missionNamespace getVariable ["cba_disposable_magazines", []];
if (_disp isEqualType [] && {(_disp findIf { _x isEqualType "" && {_x == _c} }) > -1}) exitWith { "" };	// == is case-insensitive
if !([_c] call ABZ_fnc_classValid) exitWith { "" };
if ((([_c] call ABZ_fnc_itemKind) select 0) == "") exitWith { "" };

private _cv = configFile >> "CfgVehicles" >> _c;
if (isClass _cv && {
	(("true" configClasses (_cv >> "TransportMagazines")) isNotEqualTo [])
	|| {("true" configClasses (_cv >> "TransportItems")) isNotEqualTo []}
	|| {("true" configClasses (_cv >> "TransportWeapons")) isNotEqualTo []}
}) exitWith { "" };

_c

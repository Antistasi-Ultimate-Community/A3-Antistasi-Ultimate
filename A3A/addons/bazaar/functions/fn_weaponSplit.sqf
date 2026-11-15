// Shared: what a trader does with one weapon that ISN'T in the seller's hands
// - stored in their uniform, vest or backpack, or lying in a vehicle or crate
// (v1.1.1). Drawing it to strip it would break undercover, so the trader
// strips it himself:
//   - he buys the gun with its built-in parts (fn_weaponParts)
//   - parts you fitted and the loaded magazine(s) are handed back (a laser
//     designator's battery too)
//   - a disposable launcher only sells with its rocket in it (spent = junk);
//     an empty magazine goes with the gun
//   - a preset missing built-in parts is bought as the plain gun
//     (fn_wantedBase), and everything fitted on it is handed back
// The refund of a refused sale hands back that same class (its built-in
// parts come with it), so nothing is created or lost.
// [weaponsItems entry] -> [class sold ("" = he won't), parts handed back,
//    magazines handed back [[class, rounds], ...], why not]
params [["_entry", [], [[]]]];
if (_entry isEqualTo [] || {!((_entry select 0) isEqualType "")}) exitWith { ["", [], [], ""] };
private _w = _entry select 0;

private _disp = missionNamespace getVariable ["cba_disposable_magazines", []];
if !(_disp isEqualType []) then { _disp = [] };
_disp = _disp apply { toLower _x };
private _deal = [_w] call ABZ_fnc_sellClass;
private _isDisposable = _deal != "" && {_deal != _w};

// loaded magazines
private _mags = [];
private _rocket = false;
for "_k" from 1 to ((count _entry) - 1) do {
	private _p = _entry select _k;
	if (_p isEqualType [] && {_p isNotEqualTo []} && {(_p select 0) isEqualType ""} && {(_p select 0) != ""}) then {
		private _mc = _p select 0;
		private _ma = _p param [1, 0];
		if !(_ma isEqualType 0) then { _ma = 0 };
		switch (true) do {
			case ((toLower _mc) in _disp): { if (_ma > 0) then { _rocket = true } };	// stays in the tube
			case (_ma > 0): { _mags pushBack [_mc, _ma] };
			default {};	// an empty magazine goes with the gun
		};
	};
};
if (_isDisposable && {!_rocket}) exitWith { ["", [], [], localize "STR_A3U_Bazaar_Hands_Spent"] };

// built-in parts stay with the gun; anything else fitted comes back
([_entry] call ABZ_fnc_weaponParts) params ["_left", "_extras", "_all"];
private _sold = _w;
private _why = "";
if (_left isNotEqualTo []) then {
	// built-in parts missing: bought as the plain gun, everything fitted handed back
	private _b = [_w] call ABZ_fnc_wantedBase;
	if (_b != _w && {(([[_b]] call ABZ_fnc_weaponParts) select 0) isEqualTo []}) then {
		_sold = _b;
		_extras = _all;
	} else {
		_sold = "";
		_why = format ["it's missing parts it came with (%1)", (_left apply { [_x select 2] call ABZ_fnc_displayNameOf }) joinString ", "];
	};
};
if (_sold != "" && {([_sold] call ABZ_fnc_sellClass) isEqualTo ""}) then { _sold = ""; _why = localize "STR_A3U_Bazaar_Notify_TraderWontBuy" };
[_sold, [[], _extras] select (_sold != ""), [[], _mags] select (_sold != ""), _why]

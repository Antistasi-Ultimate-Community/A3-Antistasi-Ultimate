// Client: can the weapon of this class IN THE PLAYER'S HANDS be handed to a
// trader as it is right now? Returns "" when yes, otherwise what the player
// has to do first. (Weapons stored in a uniform, vest or backpack - or in a
// vehicle or crate - are stripped by the trader instead: fn_weaponSplit.)
//
// A weapon in the hands is bought exactly as its class comes - nothing
// fitted, nothing loaded, nothing missing (the player can fix that on the
// spot). The trader lists that same class and a refund hands that same class
// back (with whatever parts the class comes with), so nothing is ever deleted
// unpaid or created for free:
//   - attachments you added       -> take them off first (sell them separately)
//   - a loaded magazine           -> unload it first (sell it separately)
//   - built-in parts that are missing -> put them back first
// Exceptions that are part of the item, not something you added:
//   - a built-in part switched to another mode of the SAME kind (ACE/CUP
//     laser and optic toggles mount a sister class of the same device -
//     only switch links a class declares itself count, like CBA uses them)
//   - the battery in a laser designator (there is no way to unload it)
//   - the rocket inside a CBA disposable launcher - which, conversely, MUST
//     still be in it: a spent or emptied tube is worth nothing
//   - an empty magazine still in the gun (nothing to unload)
params [["_c", "", [""]]];
if (_c == "" || {!hasInterface}) exitWith { "" };
if !([_c] call ABZ_fnc_isWeaponType) exitWith { "" };
if !(_c in [primaryWeapon player, secondaryWeapon player, handgunWeapon player, binocular player]) exitWith {
	localize "STR_A3U_Bazaar_Hands_Empty"
};

private _entry = (weaponsItems player) select { (_x select 0) == _c };
if (_entry isEqualTo []) exitWith { "" };
_entry = _entry select 0;

// built-in parts missing, and parts fitted that aren't built in (fn_weaponParts)
([_entry] call ABZ_fnc_weaponParts) params ["_linked", "_extra"];

private _disp = missionNamespace getVariable ["cba_disposable_magazines", []];
if !(_disp isEqualType []) then { _disp = [] };
_disp = _disp apply { toLower _x };
private _deal = [_c] call ABZ_fnc_sellClass;
private _isDisposable = _deal != "" && {_deal != _c};
private _isBino = _c == binocular player;

private _loaded = false;
private _rocket = false;
{
	if (_x isEqualType [] && {_x isNotEqualTo []} && {(_x select 0) isEqualType ""} && {(_x select 0) != ""} && {(_x param [1, 0]) > 0}) then {
		if ((toLower (_x select 0)) in _disp) then { _rocket = true } else { _loaded = true };
	};
} forEach _entry;

// stowed, the trader strips it himself - only worth saying when he'd take it
private _orStow = ["", localize "STR_A3U_Bazaar_Hands_OrStow"] select ((([_entry] call ABZ_fnc_weaponSplit) select 0) != "");
private _missing = format [localize "STR_A3U_Bazaar_Hands_Missing", (_linked apply { [_x select 2] call ABZ_fnc_displayNameOf }) joinString ", "];
if (_linked isNotEqualTo [] && {_orStow == ""}) exitWith { _missing };
if (_extra isNotEqualTo []) exitWith {
	format [localize "STR_A3U_Bazaar_Hands_Extra", (_extra apply { [_x] call ABZ_fnc_displayNameOf }) joinString ", ", _orStow]
};
if (_loaded && {!_isBino}) exitWith { format [localize "STR_A3U_Bazaar_Hands_Loaded", _orStow] };
if (_linked isNotEqualTo []) exitWith { _missing + _orStow };
if (_isDisposable && {!_rocket}) exitWith { localize "STR_A3U_Bazaar_Hands_Spent" };
""

// Client: can this class be handed to a trader from the player's kit right
// now? Returns "" when yes, otherwise what the player has to do first.
// Only weapons have conditions (everything else: fn_removeMine's rules).
//   - a weapon stored in the uniform, vest or backpack (v1.1.1): always,
//     the trader strips it himself and hands fitted parts and the loaded
//     magazine back into the pack (fn_weaponSplit) - no need to draw it and
//     break undercover. One that is spent or can't be sold says why.
//   - a weapon in the hands: bare, unloaded and complete (fn_handsCheck)
params [["_c", "", [""]]];
if (_c == "" || {!hasInterface}) exitWith { "" };
if !([_c] call ABZ_fnc_isWeaponType) exitWith { "" };
if (([_c] call ABZ_fnc_weaponStored) isNotEqualTo []) exitWith { "" };
if (_c in [primaryWeapon player, secondaryWeapon player, handgunWeapon player, binocular player]) exitWith {
	[_c] call ABZ_fnc_handsCheck
};
localize "STR_A3U_Bazaar_Sell_TraderStrip"

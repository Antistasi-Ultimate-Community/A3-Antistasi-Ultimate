// Client: pins a class to my Wanted List, or unpins it if it's already
// there. Up to ten ACTIVE pins (fn_wantedList - the first ten that exist in
// the loaded mods); pins for mods that aren't loaded right now are kept
// untouched in the profile. A pin beyond the first ten (two modsets'
// pins loaded together) is moved up into the active ten instead of being
// removed.
// [class] -> true if it is pinned (and active) now
params [["_c", "", [""]]];
if (_c == "" || {!([_c] call ABZ_fnc_wantedValid)}) exitWith { false };
private _base = [_c] call ABZ_fnc_wantedBase;	// a preset is pinned as the plain gun
private _all = profileNamespace getVariable ["ABZ_wanted", []];
if !(_all isEqualType []) then { _all = [] };
_all = _all select { _x isEqualType "" && {_x != ""} };
private _active = call ABZ_fnc_wantedList;
private _name = [_base] call ABZ_fnc_displayNameOf;
private _fnc_is = { _x == _c || {_x == _base} };	// == ignores case
private _pinned = false;

if ((_active findIf _fnc_is) > -1) then {
	// unpin
	private _i = _all findIf _fnc_is;
	if (_i > -1) then { _all deleteAt _i };
	[format [localize "STR_A3U_Bazaar_Notify_WantedUnpinned", _name]] call ABZ_fnc_notify;
} else {
	private _i = _all findIf _fnc_is;
	if (_i > -1) then {
		// pinned, but past the first ten: move it up front
		private _p = _all deleteAt _i;
		_all = [_p] + _all;
		_pinned = true;
		[format [localize "STR_A3U_Bazaar_Notify_WantedAlreadyPinned", _name, ABZ_wantedMax]] call ABZ_fnc_notify;
	} else {
		if ((count _active) >= ABZ_wantedMax) then {
			[format [localize "STR_A3U_Bazaar_Notify_WantedFull", ABZ_wantedMax]] call ABZ_fnc_notify;
		} else {
			// in front of any idle pins from other modsets, so it's active at once
			_all = [_base] + _all;
			_pinned = true;
			[format [localize "STR_A3U_Bazaar_Notify_WantedPinned", _name]] call ABZ_fnc_notify;
		};
	};
};
profileNamespace setVariable ["ABZ_wanted", _all];
saveProfileNamespace;
_pinned

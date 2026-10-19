// Client (scheduled): "type its name" for the Wanted List. Searches the
// loaded mods for gear a trader could deal in (fn_sellClass: public items
// of a kind the Bazaar sells) whose name contains the text, and pins the
// best match: an exact name first, then a name that starts with it, then
// the shortest. Other close matches are listed so a longer search can
// pick them instead.
params [["_text", "", [""]]];
private _t = toLower (trim _text);
if (count _t < 3) exitWith { ["Type at least 3 letters of the item's name."] call ABZ_fnc_notify };
// one search at a time - a mission-scoped lock that expires on its own, so
// nothing can leave it stuck (uiNamespace would outlive the mission)
if (time < (missionNamespace getVariable ["ABZ_wantedBusyUntil", -1])) exitWith {};
ABZ_wantedBusyUntil = time + 30;
private _btn = (findDisplay 78800) displayCtrl 78816;
if (!isNull _btn) then { _btn ctrlEnable false };
["Searching every loaded mod for that name...", "Wanted List"] call ABZ_fnc_notify;

private _hits = [];	// [rank, name length, class, name]
private _seen = createHashMap;	// lowercase class -> true (one hit per class)
{
	private _root = _x;
	{
		private _dn = getText (_x >> "displayName");
		private _l = toLower _dn;
		private _at = _l find _t;
		if (_at > -1) then {
			private _c = [configName _x] call ABZ_fnc_wantedBase;	// presets -> the plain gun traders stock
			if (!((toLower _c) in _seen) && {([_c] call ABZ_fnc_sellClass) isEqualTo _c}) then {
				_seen set [toLower _c, true];
				_hits pushBack [(([2, 1] select (_at == 0)) min ([2, 0] select (_l == _t))), count _dn, _c, _dn];
			};
		};
	} forEach ("getNumber (_x >> 'scope') == 2" configClasses (configFile >> _root));
} forEach ["CfgWeapons", "CfgMagazines", "CfgGlasses"];
{
	private _dn = getText (_x >> "displayName");
	private _l = toLower _dn;
	private _at = _l find _t;
	if (_at > -1) then {
		private _c = configName _x;
		if (([_c] call ABZ_fnc_sellClass) isEqualTo _c) then {
			_hits pushBack [(([2, 1] select (_at == 0)) min ([2, 0] select (_l == _t))), count _dn, _c, _dn];
		};
	};
} forEach ("getNumber (_x >> 'scope') == 2 && {getNumber (_x >> 'isBackpack') == 1}" configClasses (configFile >> "CfgVehicles"));

private _fnc_done = {
	ABZ_wantedBusyUntil = -1;
	private _b = (findDisplay 78800) displayCtrl 78816;
	if (!isNull _b) then { _b ctrlEnable true };
};
if (_hits isEqualTo []) exitWith {
	call _fnc_done;
	[format ["Nothing a trader deals in is called '%1'. Try part of the name as it shows in the arsenal.", _text], "Wanted List"] call ABZ_fnc_notify;
};
_hits sort true;	// best rank, then shortest name
private _best = _hits select 0;
// one entry per name (colour variants of one name are the same pin to most people)
private _others = [];
{
	if ((_x select 3) != (_best select 3) && {!((_x select 3) in _others)}) then { _others pushBack (_x select 3) };
	if (count _others >= 4) exitWith {};
} forEach _hits;
// add-only: searching a name that's already pinned never unpins it
private _pinned = ((call ABZ_fnc_wantedList) findIf { _x == (_best select 2) || {([_x] call ABZ_fnc_wantedBase) == (_best select 2)} }) > -1;
if (_pinned) then {
	[format ["%1 is already on your Wanted List.", _best select 3], "Wanted List"] call ABZ_fnc_notify;
} else {
	_pinned = [_best select 2] call ABZ_fnc_wantedToggle;
};
if (_pinned && {_others isNotEqualTo []}) then {
	systemChat format ["[Bazaar] Pinned '%1'. Also matching: %2 - type more of the name to pin one of those instead.", _best select 3, _others joinString ", "];
};
call _fnc_done;
if (!isNull (findDisplay 78800)) then { isNil { call ABZ_fnc_shopFillList } };

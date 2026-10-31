// SERVER: is this item already unlimited ("unlocked") in the Antistasi
// arsenal? Always false outside Antistasi.
//
// Looked up by NAME across every arsenal tab, ignoring case. JNA's own
// lookup (jn_fnc_arsenal_itemType + itemCount) is case-sensitive twice
// over: it picks a grenade's or explosive's tab with a case-sensitive `in`
// against config spellings, then compares names with isEqualTo - so a name
// spelled differently (the Bazaar's lowercase names, a mod's own spelling)
// would be looked for in the wrong tab and never found.
// The set of unlimited names is built at most once per frame, so a whole
// restock (one frame, many checks) scans the arsenal once.
params [["_class", "", [""]]];
if (_class == "" || {isNil "jna_dataList"} || {!(jna_dataList isEqualType [])}) exitWith { false };

if (isNil "ABZ_unlimitedFrame" || {ABZ_unlimitedFrame != diag_frameNo}) then {
	private _set = createHashMap;
	{
		if (_x isEqualType []) then {
			{
				if (_x isEqualType [] && {(_x param [1, 0]) isEqualTo -1} && {(_x select 0) isEqualType ""}) then {
					_set set [toLower (_x select 0), true];
				};
			} forEach _x;
		};
	} forEach jna_dataList;
	ABZ_unlimitedSet = _set;
	ABZ_unlimitedFrame = diag_frameNo;
};
(toLower _class) in ABZ_unlimitedSet

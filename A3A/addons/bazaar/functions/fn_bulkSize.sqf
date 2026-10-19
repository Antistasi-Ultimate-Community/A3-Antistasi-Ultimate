// How many of an item go into a bulk crate. The server setting wins when
// set; 0 means "match Antistasi's unlock count" (minWeaps), so that one
// crate is exactly one arsenal unlock. 25 when nothing else is known.
private _n = round (missionNamespace getVariable ["ABZ_bulkSize", 0]);
if (_n <= 0) then {
	_n = missionNamespace getVariable ["minWeaps", 25];
	if (!(_n isEqualType 0) || {_n <= 0}) then { _n = 25 };
};
_n

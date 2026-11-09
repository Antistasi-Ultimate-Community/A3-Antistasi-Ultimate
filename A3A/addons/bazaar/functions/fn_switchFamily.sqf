// Shared: every mode of an attachment - the class, the classes it switches
// to and from (CBA/ACE laser and optic toggles, NIArms reticles, CUP G36
// optics...), and their declared base classes - as lowercase names.
// Reads only links a class declares itself (configProperties, no
// inheritance), exactly like CBA's own switchAttachment does, so an
// unrelated part that merely inherits from a switchable one isn't pulled in.
// Breadth-first, at most 8 steps. [class] -> [lowercase names]
params [["_item", "", [""]]];
if (_item == "") exitWith { [] };
private _fam = [toLower _item];
private _todo = [_item];
for "_step" from 1 to 8 do {
	if (_todo isEqualTo []) exitWith {};
	private _next = [];
	{
		{
			private _v = getText _x;
			if (_v != "" && {!((toLower _v) in _fam)}) then { _fam pushBack (toLower _v); _next pushBack _v };
		} forEach configProperties [configFile >> "CfgWeapons" >> _x, "(toLower configName _x) in ['mrt_switchitemnextclass', 'mrt_switchitemprevclass', 'baseweapon']", false];
	} forEach _todo;
	_todo = _next;
};
_fam

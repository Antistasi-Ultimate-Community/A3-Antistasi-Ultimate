// CLIENT, unscheduled-safe (v1.1.2): list and combo text that fits its cell.
// A list cell's text is NOT cut at its column: a long item name ran on into
// the price and quantity columns (Vicky, 16:10). So every row of the item
// list is built here: measured with getTextWidth at the control's own font
// and height and, when it does not fit, shortened with ".." keeping the
// important part. The FULL text then goes in the row's tooltip, and the info
// panel shows the whole name anyway.
// A text is given as PARTS, shown one after the other: a string (one part,
// cut from its end), or [[text, kind(, short)], ...]:
//   kind 0  a name: cut from its end, "Katiba 6.5 mm Car.."
//   kind 1  kept: a count, a price, "[BULK x25]"
//   kind 2  optional (" (gone)", a suffix): cut, then dropped - the last one first
//   kind 3  kept while the names keep 3 letters, dropped before a name goes under 3
//   short   a shorter form of a part, used before a name goes under 3 letters
// Steps, the first that fits wins: the whole text; each optional part from
// the last one cut (3 letters at least) or dropped; the names cut (3 letters
// at least); the same with the short forms; each kind-3 part from the last
// one dropped, the names cut again; the names cut to 1 letter; the whole
// text cut from its end.
// Room of a cell: a 2D list's column (config columns[] x the control's width;
// the last column less the scrollbar, 0.021), a listbox's width less the
// scrollbar, a combo's width less its arrow (a square of the box height) -
// each less 0.2 x the font height for the gap between cells.
//   ["room", control]      -> [[room per column], fontHeight]
//   ["text", parts, room, fontHeight] -> [text, fullText, shortened]
//   ["lnbRow", control, [parts per column], room] -> row (lnbAddRow, tooltip when shortened)
//   ["lbAdd", control, parts, room] -> index (lbAdd, tooltip when shortened)
//   room: what ["room", control] returned - optional, measured when left out
params [["_mode", "", [""]]];

private _fnc_room = {
	params ["_c"];
	private _rooms = [];
	private _fh = 0;
	if (!isNull _c) then {
		private _p = ctrlPosition _c;
		private _w = _p select 2;
		_fh = ctrlFontHeight _c;
		private _pad = 0.2 * 0.75 * _fh;
		switch (ctrlType _c) do {
			case 102: {
				private _cols = getArray (configFile >> "ABZ_Shop" >> "Controls" >> ctrlClassName _c >> "columns");
				if !(_cols isNotEqualTo [] && {_cols isEqualTypeAll 0}) then { _cols = [0] };
				{
					private _end = _cols param [_forEachIndex + 1, 1];
					_rooms pushBack ((_end - _x) * _w - _pad - ([0, 0.021] select (_forEachIndex == (count _cols) - 1)));
				} forEach _cols;
			};
			case 4: { _rooms = [_w - 0.75 * (_p select 3) - _pad] };
			default { _rooms = [_w - 0.021 - _pad] };
		};
	};
	[_rooms, _fh]
};

private _fnc_fit = {
	params ["_parts", "_room", "_fh"];
	if (_parts isEqualType "") then { _parts = [[_parts, 0]] };
	private _w = [];
	{
		if (_x isEqualType [] && {count _x >= 2} && {(_x select 0) isEqualType ""} && {(_x select 0) != ""}) then {
			_w pushBack [_x select 0, _x select 1, _x param [2, "", [""]]];
		};
	} forEach _parts;
	private _fnc_join = { (_this apply { _x select 0 }) joinString "" };
	private _full = _w call _fnc_join;
	private _fnc_fits = { (_this getTextWidth ["PuristaMedium", _fh]) <= _room };
	// where the letters start (" (gone)" -> 2)
	private _fnc_lead = {
		private _c = toArray _this;
		private _i = _c findIf { (_x >= 48 && {_x <= 57}) || {_x >= 65 && {_x <= 90}} || {_x >= 97 && {_x <= 122}} || {_x > 127} };
		[_i, count _c] select (_i < 0)
	};
	// the longest start of _s (at least _min characters) + ".." for which _pre + it + _post fits
	private _fnc_cut = {
		params ["_s", "_min", "_pre", "_post"];
		private _c = toArray _s;
		private _lo = _min;
		private _hi = (count _c) - 1;
		private _best = "";
		while { _lo <= _hi } do {
			private _k = floor ((_lo + _hi) / 2);
			private _e = _k;
			while { _e > 0 && {(_c select (_e - 1)) in [32, 40, 91, 44, 45, 43, 47]} } do { _e = _e - 1 };
			private _p = (toString (_c select [0, _e])) + "..";
			if ((_pre + _p + _post) call _fnc_fits) then { _best = _p; _lo = _k + 1 } else { _hi = _k - 1 };
		};
		_best
	};
	// the names cut (3 letters at least), the last one first -> the text, "" when none fits
	private _fnc_heads = {
		private _r = "";
		for "_h" from (count _w - 1) to 0 step -1 do {
			if (_r != "") exitWith {};
			private _s = (_w select _h) select 0;
			if (((_w select _h) select 1) == 0 && {count (toArray _s) > 3}) then {
				private _pre = (_w select [0, _h]) call _fnc_join;
				private _post = (_w select [_h + 1, 999]) call _fnc_join;
				private _p = [_s, (_s call _fnc_lead) + 3, _pre, _post] call _fnc_cut;
				if (_p != "") then { _r = _pre + _p + _post };
			};
		};
		_r
	};
	private _res = "";
	if (_fh <= 0 || {_room <= 0} || {_full call _fnc_fits}) then {
		_res = _full;
	} else {
		// 1. optional parts, the last one first: cut (3 letters at least) or dropped
		for "_i" from (count _w - 1) to 0 step -1 do {
			if (_res != "") exitWith {};
			if (((_w select _i) select 1) == 2) then {
				private _pre = (_w select [0, _i]) call _fnc_join;
				private _post = (_w select [_i + 1, 999]) call _fnc_join;
				private _s = (_w select _i) select 0;
				private _p = [_s, (_s call _fnc_lead) + 3, _pre, _post] call _fnc_cut;
				if (_p != "") then {
					_res = _pre + _p + _post;
				} else {
					_w deleteAt _i;
					private _j = _w call _fnc_join;
					if (_j call _fnc_fits) then { _res = _j };
				};
			};
		};
		// 2. the names cut (3 letters at least) - as they are, then with the short forms
		{
			if (_res != "") exitWith {};
			if (_x) then {
				{ if ((_x select 2) != "") then { _x set [0, _x select 2] } } forEach _w;
				private _j = _w call _fnc_join;
				if (_j call _fnc_fits) then { _res = _j };
			};
			if (_res == "") then { _res = call _fnc_heads };
		} forEach [false, true];
		// 2b. kind-3 parts, the last one first: dropped, the names cut again (3 letters at least)
		for "_i" from (count _w - 1) to 0 step -1 do {
			if (_res != "") exitWith {};
			if (((_w select _i) select 1) == 3) then {
				_w deleteAt _i;
				private _j = _w call _fnc_join;
				_res = if (_j call _fnc_fits) then { _j } else { call _fnc_heads };
			};
		};
		// 3. the names cut to one letter, the last one first
		for "_i" from (count _w - 1) to 0 step -1 do {
			if (_res != "") exitWith {};
			if (((_w select _i) select 1) == 0) then {
				private _pre = (_w select [0, _i]) call _fnc_join;
				private _post = (_w select [_i + 1, 999]) call _fnc_join;
				private _p = [(_w select _i) select 0, 1, _pre, _post] call _fnc_cut;
				if (_p != "") then {
					_res = _pre + _p + _post;
				} else {
					(_w select _i) set [0, (toString [(toArray ((_w select _i) select 0)) select 0]) + ".."];
				};
			};
		};
		// 4. the whole text
		if (_res == "") then {
			_res = [_w call _fnc_join, 1, "", ""] call _fnc_cut;
			if (_res == "") then { _res = ".." };
		};
	};
	[_res, _full, _res != _full]
};

private _out = [];
switch (_mode) do {
	case "room": {
		_this params ["", ["_c", controlNull, [controlNull]]];
		_out = [_c] call _fnc_room;
	};
	case "text": {
		_this params ["", ["_parts", "", ["", []]], ["_room", 0, [0]], ["_fh", 0, [0]]];
		_out = [_parts, _room, _fh] call _fnc_fit;
	};
	case "lnbRow": {
		_this params ["", ["_c", controlNull, [controlNull]], ["_cells", [], [[]]], ["_ri", [], [[]]]];
		if (_ri isEqualTo []) then { _ri = [_c] call _fnc_room };
		_ri params [["_rooms", [], [[]]], ["_fh", 0, [0]]];
		private _fits = [];
		{ _fits pushBack ([_x, _rooms param [_forEachIndex, 0], _fh] call _fnc_fit) } forEach _cells;
		_out = _c lnbAddRow (_fits apply { _x select 0 });
		if ((_fits findIf { _x select 2 }) > -1) then {
			private _tip = ((_fits apply { _x select 1 }) select { _x != "" && {_x != "-"} }) joinString "  |  ";
			for "_k" from 0 to (count _fits - 1) do { _c lnbSetTooltip [[_out, _k], _tip] };
		};
	};
	case "lbAdd": {
		_this params ["", ["_c", controlNull, [controlNull]], ["_parts", "", ["", []]], ["_ri", [], [[]]]];
		if (_ri isEqualTo []) then { _ri = [_c] call _fnc_room };
		_ri params [["_rooms", [], [[]]], ["_fh", 0, [0]]];
		([_parts, _rooms param [0, 0], _fh] call _fnc_fit) params ["_t", "_full", "_cut"];
		_out = _c lbAdd _t;
		if (_cut) then { _c lbSetTooltip [_out, _full] };
	};
};
_out

/*
	Function: HALs_fnc_sortArray
	Author: HallyG
	Sorts an array by applying the given code to each element.

	Argument(s):
	0: Unsorted array <ARRAY>
	1: Sorting code (returns NUMBER or STRING) <CODE>
	2: Ascending? (default: true) <BOOLEAN>

	Return Value:
	<ARRAY>

	Example:
	[[player, ammo1], {_x distance [0,0,0]}, true] call HALs_fnc_sortArray;
__________________________________________________________________*/
params [
	["_arr", [], [[]]],
	["_code", {_x}, [{}]],
	["_order", true, [true]]
];


if (_code isNotEqualTo {}) exitWith {
	private _arr = _arr apply {
		[call _code, _x]
	};

	_arr sort _order;
	_arr apply {_x select 1}
};

_arr = +_arr;
_arr sort _order;
_arr

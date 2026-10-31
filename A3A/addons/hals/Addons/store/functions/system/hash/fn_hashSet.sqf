/*
	Function: HALs_store_fnc_hashSet
	Author: NouberNou, HallyG
	https://www.reddit.com/r/armadev/comments/3haiax/improving_the_speed_of_associative_maps_with/

	Argument(s):
	0: None

	Return Value:
	None

	Example:
	[] call HALs_store_fnc_hashSet;
__________________________________________________________________*/
#define GET_HASH _a = toArray _k; _d = (count _a); _h = (_a select 0)*(_a select _d-1)+(_d+(_a select ((_d-2)) max 0))

params ["_container", "_key", "_val"];
private ["_hash", "_chain", "_keys", "_val", "_index"];
	
_k = _key;
GET_HASH;
_hash = _h;

if (count _container < _hash) then {
	_container set [_hash, [[],[]]];
};
	
_pairs = _container select _hash;
	
if (isNil "_pairs") then {
	_pairs = [[], []];
	_container set [_hash, _pairs];
};
	
_keys = _pairs select 0;
_vals = _pairs select 1;
_index = _keys find _key;
	
if (_index == -1) then {
	_keys pushBack _key;
	_vals pushBack _val;
} else {
	_vals set[_index, _val];
};

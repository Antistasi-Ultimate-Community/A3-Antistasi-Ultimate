/*
	Function: HALs_store_fnc_hashGet
	Author: NouberNou, HallyG
	https://www.reddit.com/r/armadev/comments/3haiax/improving_the_speed_of_associative_maps_with/

	Argument(s):
	0: None

	Return Value:
	None

	Example:
	[] call HALs_store_fnc_hashGet;
__________________________________________________________________*/
#define GET_HASH _a = toArray _k; _d = (count _a); _h = (_a select 0)*(_a select _d-1)+(_d+(_a select ((_d-2)) max 0))

params ["_c", "_k"];
GET_HASH;

(((_c select _h) select 1) select (((_c select _h) select 0) find _k))

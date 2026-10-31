/*
Maintainer: Socrates
   Returns how many points required to get the rank. 

Parameters:
	<STRING> Rank in uppercase

Return Value:
    <HASHMAP> RanksToValues map


Scope: Client
Environment: Any
Public: Yes

Example:
_rank call SCRT_fnc_common_getPromotionThreshold;
*/

private _rank = _this;

private _promotions = [
	"PRIVATE",
	"CORPORAL",
	"SERGEANT",
	"LIEUTENANT",
	"CAPTAIN",
	"MAJOR",
	"COLONEL"
] createHashMapFromArray [
	0,
	100,
	250,
	500,
	1000,
	1600,
	2500,
	3000
];

_promotions getOrDefault [_rank, -1]

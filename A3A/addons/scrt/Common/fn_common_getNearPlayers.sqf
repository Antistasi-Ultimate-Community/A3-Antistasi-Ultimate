//	Author: Socrates
// 
//	Description:
//	Finds all near players.
//
//	Returns:
//	Array of players in given radius.
//
// 	How to use: 
// 	[50, _vehicle] call SCRT_fnc_common_getNearPlayers;
//


params ["_distance", "_center"];

private _players = (call BIS_fnc_listPlayers) select {side _x in [teamPlayer, civilian] && {_x distance2D _center <= _distance}};

_players

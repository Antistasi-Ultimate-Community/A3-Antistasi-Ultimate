// Sides hostile to the rebels: Antistasi's Occupants and Invaders when it
// is running, otherwise whatever is hostile to the players' side.
private _out = [];
if (call ABZ_fnc_isAntistasi) exitWith {
	{
		if (!isNil _x) then { _out pushBack (missionNamespace getVariable _x) };
	} forEach ["Occupants", "Invaders"];
	_out
};
private _mine = if (hasInterface) then { playerSide } else { independent };
{
	if ((_x getFriend _mine) < 0.6) then { _out pushBack _x };
} forEach [east, west, independent];
_out

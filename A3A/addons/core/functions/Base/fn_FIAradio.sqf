private _chance = tierWar*3;

{
	private _pos = getPos _x;
	private _markerX = [outposts,_pos] call BIS_fnc_nearestPosition;
	if ((sidesX getVariable [_markerX,sideUnknown] == teamPlayer) and {alive _x}) then {_chance = _chance + 4};
} forEach antennas;

private _return = false;

if (random 100 < _chance) then {
	if (count _this == 0) then
		{
			if (not revealX) then {
			["TaskSucceeded", ["", (localize "STR_notifiers_comms_intercept")]] remoteExec ["BIS_fnc_showNotification",teamPlayer];
			revealX = true; publicVariable "revealX";
			[] remoteExec ["A3A_fnc_revealToPlayer",teamPlayer];
			};
		}
	else
		{
		_return = true;
		};
} else {
	if (count _this == 0) then {
		if (revealX) then {
			["TaskFailed", ["", (localize "STR_notifiers_comms_lost")]] remoteExec ["BIS_fnc_showNotification",teamPlayer];
			revealX = false; 
			publicVariable "revealX";
		};
	};
};
_return

params ["_unit", "_side", ["_noCaptive", false], ["_isPanic", false]];

private _marker = respawnTeamPlayer;
if (_side != teamPlayer) then {
	private _potentials = (outposts + airportsX + resourcesX + factories + seaports + milbases);
	_potentials = _potentials select { sidesX getVariable [_x, sideUnknown] == _side };
	_potentials = _potentials select { spawner getVariable _x != 0 };		// only flee to unspawned locations
	if (_potentials isEqualTo []) exitWith {};
	_marker = [_potentials, _unit] call BIS_fnc_nearestPosition;
};

if (!_isPanic) then {
	// In case unit was surrendered
	_unit enableAI "ANIM";
	_unit enableAI "MOVE";
	_unit stop false;
	_unit switchMove "";
};

if (_noCaptive) then {
	_unit setVariable ["canBeIncapacitated", false, true];
	_unit setCaptive false;
}; 

_unit doMove (getMarkerPos _marker);

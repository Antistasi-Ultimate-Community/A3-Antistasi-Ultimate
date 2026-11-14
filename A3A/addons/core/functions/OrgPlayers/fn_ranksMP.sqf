params ["_playerX", "_rank"];

_playerX = _playerX getVariable ["owner",_playerX];
_playerX setRank _rank;

[] spawn A3A_fnc_statistics;

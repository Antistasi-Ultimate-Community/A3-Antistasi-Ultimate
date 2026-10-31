params ["_scoreToAdd", "_player"];

if (!isPlayer _player || {!(side _player in [teamPlayer, civilian])}) exitWith {};

_player = _player getVariable ["owner",_player];
private _storedPoints = _player getVariable ["score",0];

_scoreToAdd = _storedPoints + _scoreToAdd;

if (_scoreToAdd < 0) then {
	_scoreToAdd = 0;
};

_player setVariable ["score",_scoreToAdd,true];

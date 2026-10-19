// SERVER: will this trader deal with this player right now?
// Returns "" when yes, otherwise the reason to show the player.
if (!isServer) exitWith { "Server only." };
params [["_player", objNull, [objNull]], ["_e", [], [[]]]];

if (isNull _player || {_e isEqualTo []} || {(_e select 9) != "ok"}) exitWith { "That trader isn't doing business right now." };
private _stall = _e select 2;
private _u = [_e select 0] call ABZ_fnc_vendorUnit;
if (isNull _u || {!alive _u}) exitWith { "The trader stepped away for a moment - try again in a few seconds." };
if (_player distance _u > 10 && {_player distance2D _stall > 8}) exitWith { "Get closer to the trader." };
if (!alive _player || {lifeState _player == "INCAPACITATED"} || {_player getVariable ["incapacitated", false]}) exitWith {
	"Not while you're down."
};

// the undercover waiver is decided by the trader's own town (its centre),
// the same lookup the client pre-check makes
private _why = [_player, _e select 11] call ABZ_fnc_undercoverOk;
if (_why != "") exitWith { _why };

// enemies close to the stall, or further out but watching you
private _r = missionNamespace getVariable ["ABZ_enemyRadius", 60];
private _eyes = [];
if (_r > 0) then {
	_eyes = ([_stall, _r] call ABZ_fnc_enemiesNear) select {
		(_x distance2D _stall) < 30 || {(_x knowsAbout _player) > 1.5}
	};
};
if (_eyes isNotEqualTo []) exitWith {
	"'Not now - too many eyes around.' Move that enemy patrol along first."
};
""

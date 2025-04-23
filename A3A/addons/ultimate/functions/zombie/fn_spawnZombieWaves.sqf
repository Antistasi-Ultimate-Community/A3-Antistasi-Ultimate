params [
    ["_waves", 5],
    ["_craterWaves", 3],
    ["_zombiesPerCrater", round (random 10)],
    ["_positionX", [0,0,0]],
    ["_group", grpNull],
	["_taskID", 0]
];

// pseudo: 5 waves, each wave consisting of _craterWaves, each _craterWave consisting of _zombiesPerCrater
// {_waves = 5, _craterWaves = 3, _zombiesPerCrater = 5} will result in 15 zombies per wave, with 5 waves, so around ~75 zombies spread across each wave

// we'll use this for GC later
private _sources = [];
private _timeoutExit = (time + 1200); // ~20 minutes

if (_taskID isNotEqualTo 0) then {
	missionNamespace setVariable [_taskID+"_done", false];
};

private _soundSourceQuake = "#particlesource" createVehicle ASLToAGL _positionX;
[_soundSourceQuake, ["Earthquake_04", 3000, 1, 0, 0]] remoteExec ["say3D", 0];
_sources pushBack _soundSourceQuake;

[
	"The ground is rumbling...", 
	format 
	[
		"Be prepared for the incoming zombie hordes.<br/><br/>The tremor intensity suggests %1 waves are inbound, each wave consisting of %2 emergence holes.<br/><br/>They will surface within the next minute!",
		_waves, 
		_craterWaves
	]
] remoteExec ["A3A_fnc_customHint", 0, false];

uiSleep 60;

for "_wave" from 1 to _waves do 
{
	private _timeout = (time + 60);

	private _sourcesWave = [_craterWaves, _zombiesPerCrater, _positionX, _group] call A3U_fnc_spawnZombieWave;
	_sources append _sourcesWave;

	waitUntil {
		private _aliveZombies = {alive _x || {_x getVariable ["ACE_isUnconscious", false] isEqualTo false}} count units _groupZombies;
		private _aliveZombiesWin = (round (_aliveZombies / 2));
		(_aliveZombies <= _aliveZombiesWin) || {time >= _timeout}
	};

	uiSleep 30;
};

// Wait until they're all dead or timeout has passed, then clean up
waitUntil {
	private _aliveZombies = {alive _x} count units _group;
	(_aliveZombies <= 0) || {time >= _timeoutExit}
};

{
	deleteVehicle _x;
} forEach _sources;

{
	if (_x getVariable ["A3U_isZombie", false]) then {
		hideBody _x;
	};
} forEach allDeadMen;

if (_taskID isNotEqualTo 0) then {
	missionNamespace setVariable [_taskID+"_done", true];
};
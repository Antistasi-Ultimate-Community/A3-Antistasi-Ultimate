params [
    ["_craterWaves", 3],
    ["_zombiesPerCrater", round (random 10)],
    ["_positionX", [0,0,0]],
    ["_group", grpNull]
];

// pseudo: 5 waves, each wave consisting of _craterWaves, each _craterWave consisting of _zombiesPerCrater
// {_waves = 5, _craterWaves = 3, _zombiesPerCrater = 5} will result in 15 zombies per wave, with 5 waves, so around ~75 zombies spread across each wave

// we'll use this for GC later
private _sources = [];

for "_i" from 1 to _craterWaves do
{
	private _pos = _positionX getPos [random 60, random 360];
	private _crater = ["Land_ShellCrater_02_small_F", _pos] call A3U_fnc_spawnZombieCrater;
	private _craterProp = _crater#0;
	private _particleSource = _crater#1;
	private _soundSource = _crater#2;
	_craterProp setDir (random 360);

	private _soundSourceRoar = [_pos] call A3U_fnc_spawnZombieRoar;
	private _zombieType = "Zombie_O_RA_Civ"; // (A3A_faction_civ get "unitSpecial")

	for "_y" from 1 to _zombiesPerCrater do {
		private _zombiePos = _pos getPos [random 3, random 360];
		[_group, _zombieType, _zombiePos] spawn A3U_fnc_spawnZombie;
		uiSleep 0.1;
	};

	_sources append [_craterProp, _soundSource, _soundSourceRoar];

	uiSleep 2;

	deleteVehicle _particleSource;

	uiSleep 5;
};

_sources;
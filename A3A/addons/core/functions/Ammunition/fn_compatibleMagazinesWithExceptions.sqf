/*
	Author:
	Zets

	Description:
	Get all compatibile magazines except forbidden ones for selected weapons. Function looks both for magazines listed in "magazines" array & compatibile magazineWells.
	
	Params:
		0: (String) :
			Weapon class name
		1: (Array) [Optional] :
			List of magazines to be excluded from result
		2: (Bool) [Optional] :
			Decide if magazines with scope 1 should be also returned

	Output:
		Array of magazines (strings)

	Usage:
		[_weapon] call A3U_fnc_compatibleMagazinesWithExceptions;
		[_weapon, _forbiddenList] call A3U_fnc_compatibleMagazinesWithExceptions;
*/

params [
	["_weapon","",[""]],
	["_forbiddenList",[],[[]]],
	["_showHidden",false,[false]]
];

private _weaponCfg = configFile >> "CfgWeapons" >> _weapon;


if (isClass _weaponCfg) then
{
	private _compatibleMagazines = [];

	// Go through all available muzzles
	{
		_muzzle = if (_x == "this") then {_weaponCfg} else {_weaponCfg >> _x};

		// Get magazines from "magazines" array
		_magazinesList = getArray (_muzzle >> "magazines");

		// Add magazines from magazine wells
		{
			{
				_magazinesList append (getArray _x);
			}forEach  configProperties [configFile >> "CfgMagazineWells" >> _x,"isArray _x"];
		} forEach getArray (_muzzle >> "magazineWell");

		// Add only unique entries to output
		{
			private _magazine		= _x;
			private _magazineCfg	= configFile >> "cfgMagazines" >> _magazine;

			if ( ((getNumber (_magazineCfg >> "scope") isEqualTo 2) || _showHidden) && !(_magazine in _forbiddenList) ) then {
				_compatibleMagazines pushBackUnique _magazine;
			};
		} forEach _magazinesList;
	} forEach getArray (_weaponCfg >> "muzzles");

	_compatibleMagazines
} else {
	if (_weapon != "") then {["'%1' not found in CfgWeapons",_weapon] call bis_fnc_error;};
	[]
};

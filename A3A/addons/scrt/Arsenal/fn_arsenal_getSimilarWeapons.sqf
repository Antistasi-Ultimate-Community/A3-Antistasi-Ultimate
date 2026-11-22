//	Author: Socrates
//
//	Description:
//	Finds all similar weapons using it's base classnames.
//
//	Returns:
//	Array of weapons and it's quantity inherited from all parent classes presented in this array.
//
// 	How to use:
// 	[_weapons] call SCRT_fn_common_getSimilarWeapons;
#include "..\defines.inc"
FIX_LINE_NUMBERS()

#define BLACKLISTED_CLASSES ["Rifle_Base_F", "Rifle_Long_Base_F","Rifle_Short_Base_F", "Pistol_Base_F", "Launcher_Base_F","gm_rifle_base", "gm_machineGun_base", "gm_launcher_base", "vn_rifle", "vn_rifle762", "vn_lmg", "vn_pistol","vn_rifle_boltaction_base","vn_rifle_boltaction_clip_base","vn_shotgun","vn_smg","vn_sa7","vn_Launcher_Base_F","vn_rpg2","Uns_Rifle","Uns_Rifle762","Uns_LMG","Uns_HMG","uns_Shotgun","uns_Rifle_boltaction_base","uns_Rifle_boltaction_clip_base","Uns_Pistol"]

params ["_weapons"];

if(_weapons isEqualTo []) exitWith {};

private _weaponConfigs = "getNumber(_x >> 'scope') isEqualTo 2 && {getNumber(_x >> 'type') in [1,2,4,4096]}" configClasses(configFile >> "CfgWeapons") apply { configName _x };

private _possibleClassesMap = createHashMap;
private _baseInputClassesMap = createHashMap;

//get base classes and it's quantity
{
	private _item = _x select 0;
	private _quantity = _x select 1;

	_baseConfig = inheritsFrom (configFile >> "CfgWeapons" >> _item);
	_cfgName = configName _baseConfig;

	if (_cfgName in BLACKLISTED_CLASSES) then {
		continue;
	};

	private _similarClassnames = _weaponConfigs select {
		_weaponConfig = inheritsFrom (configFile >> "CfgWeapons" >> _x);
		configName _weaponConfig == _cfgName
	};

	// exclude weapons with attached scopes, muzzles, etc - they will appear as dupes in arsenal
	_similarClassnames = _similarClassnames select {
		private _linkedOptics = getText(configFile >> "CfgWeapons" >> _x >> "LinkedItems" >> "LinkedItemsOptic" >> "item");
		private _linkedMuzzle = getText(configFile >> "CfgWeapons" >> _x >> "LinkedItems" >> "LinkedItemsMuzzle" >> "item" );
		private	_linkedAccs = getText(configFile >> "CfgWeapons" >> _x >> "LinkedItems" >> "LinkedItemsAcc" >> "item");
		private	_linkedUnderbarrel = getText(configFile >> "CfgWeapons" >> _x >> "LinkedItems" >> "LinkedItemsUnder" >> "item");
		_linkedOptics == "" && _linkedMuzzle == "" && _linkedAccs == "" && _linkedUnderbarrel == ""
	};

	private _originItemFireModes = getArray (configFile >> "CfgWeapons" >> _item >> "modes");
	private _originItemMuzzles = count (getArray (configFile >> "CfgWeapons" >> _item >> "muzzles"));
	private _originItemOpticSystem = getText(configFile >> "CfgWeapons" >> _item >> "LinkedItems" >> "LinkedItemsOptic" >> "slot");
	private _originMagazines = getArray (configFile >> "CfgWeapons" >> _item >> "magazineWell");
	_originMagazines sort true;

	//exclude weapons with different fire modes and muzzle count because some of them are, you know, totally different weapons
	_similarClassnames = _similarClassnames select {
		private _weapon = _x;
		private _weaponFireModes = getArray (configFile >> "CfgWeapons" >> _weapon >> "modes"); //separating weapons with different firing modes
		private _weaponMuzzles = count (getArray (configFile >> "CfgWeapons" >> _weapon >> "muzzles")); //distincting weapons with underbarrels
		private _weaponSystem = getText(configFile >> "CfgWeapons" >> _weapon >> "LinkedItems" >> "LinkedItemsOptic" >> "slot"); //separating weapons with different mount systems
		private _weaponMagazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazineWell");
		_weaponMagazines sort true;
		_originItemFireModes isEqualTo _weaponFireModes && _weaponMuzzles == _originItemMuzzles && _originItemOpticSystem == _weaponSystem && _originMagazines isEqualTo _weaponMagazines
	};

	Debug_3("Weapon: %1, Base Config: %2, Final similar weapons: %3",str _item,_cfgName,str _similarClassnames);

	_possibleClassesMap set [_cfgName, _similarClassnames];

	private _baseConfigQuantity = _baseInputClassesMap get _cfgName;

	if (!isNil "_baseConfigQuantity") then {
		_baseInputClassesMap set [_cfgName, (_baseConfigQuantity + _quantity)];
	} else {
		_baseInputClassesMap set [_cfgName, _quantity];
	};
} forEach _weapons;


private _result = [];

//if some weapon exceeds minimum weapons threshold - grab every class that has same parent and make it pending to infinite on next arsenal tick
{
	if (_y < minWeaps) then {
		continue;
	};

	private _similarClassnames = _possibleClassesMap get _x;

	if (!isNil "_similarClassnames") then {
		{
			_result pushBack [_x, minWeaps];
		} forEach _similarClassnames;
	};
} forEach _baseInputClassesMap;

//remove duplicates
{
	_item = _x select 0;
	_weapons deleteAt (_weapons findIf {(_x select 0) == _item});
} forEach _result;

_result append _weapons;

_result

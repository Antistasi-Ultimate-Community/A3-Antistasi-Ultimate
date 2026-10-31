#include "..\defines.inc"
FIX_LINE_NUMBERS()

#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

private _box = _this;

Info("Supply crate airdrop init.");

["buttonInvToJNA"] call jn_fnc_arsenal;

Debug("Clearing supply crate from predefined content.");

clearItemCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;


Debug("Getting players.");

private _players = call SCRT_fnc_misc_getRebelPlayers;
private _aiUnits = (units theBoss) select { !isPlayer _x };
private _affectedEntities = _players + _aiUnits;

if(_affectedEntities isEqualTo []) exitWith {
    Warning("No players detected, aborting filling crate.");
};

Debug("Getting possible crate ammo.");

private _possibleMagazines = [];
private _unlockedMagazines = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL) select {_x select 1 == -1};
private _unlockedThrowables = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW) select {_x select 1 == -1};
_unlockedMagazines = _unlockedMagazines apply {_x select 0};
_unlockedThrowables = _unlockedThrowables apply {_x select 0};

Debug("Getting possible magazine with arsenal check.");

{
    private _unit = _x;

    private _primaryMagazines = getArray(configFile >> "CfgWeapons" >> primaryWeapon _unit >> "magazines");
    if(_primaryMagazines isNotEqualTo []) then {
        _mag = _primaryMagazines select 0;
        if(_mag in _unlockedMagazines) then {
            _possibleMagazines pushBack _mag;
        };
    };

    private _secondaryMagazines = getArray(configFile >> "CfgWeapons" >> secondaryWeapon _unit >> "magazines");
    if(_secondaryMagazines isNotEqualTo []) then {
        _mag = _secondaryMagazines select 0;
        if(_mag in _unlockedMagazines) then {
            _possibleMagazines pushBack _mag;
        };
    };

    private _handgunMagazines = getArray(configFile >> "CfgWeapons" >> handgunWeapon _unit >> "magazines");
    if(_handgunMagazines isNotEqualTo []) then {
        _mag = _handgunMagazines select 0;
        if(_mag in _unlockedMagazines) then {
            _possibleMagazines pushBack _mag;
        };
    };
} forEach _affectedEntities;

Debug("Filling supply crate with ammo, grenades and first aid kits.");

{
    _magCount = round random [4,7,10];
   _box addMagazineCargoGlobal [_x, _magCount];
} forEach _possibleMagazines;

_firstAidCount = round random [6,10,16];
_box addItemCargoGlobal ["FirstAidKit", _firstAidCount];

if(_unlockedThrowables isNotEqualTo []) then {
    private _randomThrowables = [selectRandom _unlockedThrowables, selectRandom _unlockedThrowables, selectRandom _unlockedThrowables];
    {
        _throwable = _x;
        _throwableCount = round random [4,6,8];
        _box addMagazineCargoGlobal [_throwable, _throwableCount];
    } forEach _randomThrowables;
};

Info("Supply Drop fill function successfully finished it's work.");

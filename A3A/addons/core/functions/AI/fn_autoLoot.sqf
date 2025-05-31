params ["_unit", "_truckX"];

if ((isPlayer _unit) or (player != leader group player)) exitWith {};
if !([_unit] call A3A_fnc_canFight) exitWith {};
if (_unit getVariable ["helping",false]) exitWith {_unit groupChat localize "STR_chats_autoloot_rearm_heal_in_progress"};
_rearming = _unit getVariable "rearming";
if (_rearming) exitWith {_unit groupChat localize "STR_chats_autoloot_rearm_in_progress"; _unit setVariable ["rearming",false]};
if (_unit == gunner _truckX) exitWith {_unit groupChat localize "STR_chats_autoloot_rearm_gun_manning"};
if (!canMove _truckX) exitWith {_unit groupChat localize "STR_chats_autoloot_load_vehicle"};

private _shoppingCarts = [
    "A3AU_Land_Pod_Heli_Transport_04_box_F_shoppingCart",
    "A3AU_B_Slingload_01_Cargo_F_shoppingCart",
    "A3AU_Land_Cargo10_light_blue_F_shoppingCart",
    "A3AU_Land_CargoBox_V1_F_shoppingCart"
];

private _containers = [];
{
    _containers append (nearestObjects [_truckX, [_x], 15]);
} forEach _shoppingCarts;

_fn_isContainerFull = {
    params ["_container"];
    (load _container >= 1)
};

_objectsX = [];
_hasBox = false;
_weaponX = "";
_weaponsX = [];
private _bigTimeOut = time + 120;
_objectsX = nearestObjects [_unit, ["WeaponHolderSimulated", "GroundWeaponHolder", "WeaponHolder"], 50];
if (count _objectsX == 0) exitWith {_unit groupChat localize "STR_chats_autoloot_no_bodies"};

private _target = objNull;
private _distanceX = 51;
{
    _objectX = _x;
    if (_unit distance _objectX < _distanceX) then {
        if ((count weaponCargo _objectX > 0) and !(_objectX getVariable ["busy",false])) then {
            _weaponsX = weaponCargo _objectX;
            for "_i" from 0 to (count _weaponsX - 1) do {
                _potential = _weaponsX select _i;
                _basePossible = [_potential] call BIS_fnc_baseWeapon;
                if ((_basePossible in allRifles) or (_basePossible in allSniperRifles) or (_basePossible in allMachineGuns) or (_potential in allMissileLaunchers) or (_potential in allRocketLaunchers)) then {
                    _target = _objectX;
                    _distanceX = _unit distance _objectX;
                    _weaponX = _potential;
                };
            };
        };
    };
} forEach _objectsX;

if (isNull _target) exitWith {_unit groupChat localize "STR_chats_autoloot_no_loot"};
_target setVariable ["busy",true];
_unit setVariable ["rearming",true];
_unit groupChat localize "STR_chats_autoloot_start_looting";

private _originalLoadout = getUnitLoadout _unit;

removeBackpackGlobal _unit;
removeVest _unit;
{_unit unlinkItem _x} forEach assignedItems _unit;
removeAllItemsWithMagazines _unit;
{_unit removeWeaponGlobal _x} forEach weapons _unit;
removeHeadgear _unit;

_unit action ["GetOut",_truckX];
[_unit] orderGetin false;

private _continuar = true;

while {_continuar and ([_unit] call A3A_fnc_canFight) and (_unit getVariable "rearming") and (alive _truckX) and (_bigTimeout > time)} do {
    if (isNull _target) exitWith {_continuar = false};
    _target setVariable ["busy",true];
    _unit doMove (getPosATL _target);
    private _timeOut = time + 60;
    waitUntil {sleep 1; (!alive _unit) or (isNull _target) or (_unit distance _target < 3) or (_timeOut < time) or (unitReady _unit)};
    if (_unit distance _target < 3) then {
        _unit action ["TakeWeapon",_target,_weaponX];
        sleep 3;
    };
    _target setVariable ["busy",false];
    private _tempPrimary = primaryWeapon _unit;
    if (_tempPrimary != "") then {
        private _magazines = getArray (configFile / "CfgWeapons" / _tempPrimary / "magazines");
        private _victims = allDead select {(_x distance _unit < 51) and (!(_x getVariable ["busy",false]))};
        _hasBox = false;
        _distanceX = 51;
        {
            _victim = _x;
            if (({_x in _magazines} count (magazines _victim) > 0) and (_unit distance _victim < _distanceX)) then {
                _target = _victim;
                _hasBox = true;
                _distanceX = _victim distance _unit;
            };
        } forEach _victims;
        if ((_hasBox) and (_unit getVariable "rearming")) then {
            _unit stop false;
            _target setVariable ["busy",true];
            _unit doMove (getPosATL _target);
            private _timeOut = time + 60;
            waitUntil {sleep 1; !([_unit] call A3A_fnc_canFight) or (isNull _target) or (_unit distance _target < 3) or (_timeOut < time) or (unitReady _unit)};
            if (_unit distance _target < 3) then {
                {if (!(_x in unlockedMagazines) and !(_x in unlockedItems)) then {_unit addItemToUniform _x}} forEach (uniformItems _target);
                if (backPack _target != "") then {
                    _unit addBackpack ((backpack _target) call A3A_fnc_basicBackpack);
                    {if (!(_x in unlockedMagazines) and !(_x in unlockedItems)) then {_unit addItemToBackpack _x}} forEach backpackItems _target;
                    removeBackpack _target;
                };
                _unit addVest (vest _target);
                {if (!(_x in unlockedMagazines) and !(_x in unlockedItems)) then {_unit addItemToVest _x}} forEach vestItems _target;
                _unit action ["rearm",_target];
                removeVest _target;
                if (((headgear _target) in allArmoredHeadgear) and !((headgear _target) in unlockedItems)) then {
                    _unit addHeadgear (headGear _target);
                    removeHeadgear _target;
                };
                {if !(_x in unlockedItems) then {_unit linkItem _x}} forEach assignedItems _target;
                {if !(_x in unlockedItems) then {_target unlinkItem _x}} forEach assignedItems _target;
            };
            _target setVariable ["busy",false];
        };
    };

    _unit doMove (getPosATL _truckX);
    private _timeOut = time + 60;
    waitUntil {sleep 1; !([_unit] call A3A_fnc_canFight) or (!alive _truckX) or (_unit distance _truckX < 8) or (_timeOut < time)};
    if ((alive _truckX) and ([_unit] call A3A_fnc_canFight)) then {
        private _allItems = [];
        
        _allItems append (weapons _unit);
        _allItems append (assignedItems _unit);
        _allItems append (vestItems _unit);
        _allItems append (backPackItems _unit);
        _allItems append [headgear _unit, backpack _unit, vest _unit];
        
        // Filter empty elements
        private _itemsToAdd = _allItems select {!isNil "_x" && {_x != ""}};
        
        private _remainingItems = _itemsToAdd;
        private _allContainersFull = true;
        
        // Try to load into containers
        {
            private _container = _x;
            
            // Skip full containers
            if ([_container] call _fn_isContainerFull) then { continue };
            
            _allContainersFull = false;
            
            // Create copy for iteration
            private _itemsToProcess = +_remainingItems;
            
            {
                private _item = _x;
                private _loadBefore = load _container;
                
                // Attempt to add item
                _container addItemCargoGlobal [_item, 1];
                
                // Verify if item was added
                private _loadAfter = load _container;
                if (_loadAfter <= _loadBefore) then {
                    // Item not added (likely no space)
                    continue;
                };
                
                // Remove successfully added item
                _remainingItems = _remainingItems - [_item];
                
                // Check if container is now full
                if ([_container] call _fn_isContainerFull) then {
                    _unit groupChat localize "STR_chats_autoloot_container_full";
                };
                
                // Exit if all items are loaded
                if (count _remainingItems == 0) exitWith {};
                
            } forEach _itemsToProcess;
            
            // Exit if all items are loaded
            if (count _remainingItems == 0) exitWith {};
        } forEach _containers;
        
        // Load remaining items into truck
        if (count _remainingItems > 0) then {
            { 
                _truckX addItemCargoGlobal [_x, 1];
            } forEach _remainingItems;
            
            if (_allContainersFull && count _containers > 0) then {
                _unit groupChat localize "STR_chats_autoloot_allcontainers_full";
            };
        };
        removeBackpackGlobal _unit;
        removeVest _unit;
        {_unit unlinkItem _x} forEach assignedItems _unit;
        removeAllItemsWithMagazines _unit;
        {_unit removeWeaponGlobal _x} forEach weapons _unit;
        removeHeadgear _unit;
    };
    _target = objNull;
    _distanceX = 51;
    {
        _objectX = _x;
        if (_unit distance _objectX < _distanceX) then {
            if ((count weaponCargo _objectX > 0) and !(_objectX getVariable ["busy",false])) then {
                _weaponsX = weaponCargo _objectX;
                for "_i" from 0 to (count _weaponsX - 1) do {
                    _potential = _weaponsX select _i;
                    _basePossible = [_potential] call BIS_fnc_baseWeapon;
                    if ((not(_basePossible in unlockedWeapons)) and ((_basePossible in allRifles) or (_basePossible in allSniperRifles) or (_basePossible in allMachineGuns) or (_potential in allMissileLaunchers) or (_potential in allRocketLaunchers))) then {
                        _target = _objectX;
                        _distanceX = _unit distance _objectX;
                        _weaponX = _potential;
                    };
                };
            };
        };
    } forEach _objectsX;
};
if (!_continuar) then {
    _unit groupChat localize "STR_chats_autoloot_no_more_weapons";
};

_unit doFollow player;
_unit setVariable ["rearming",false];
_unit setUnitLoadout _originalLoadout;
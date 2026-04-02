#include "..\defines.inc"
FIX_LINE_NUMBERS()

/*
    fn_lootgatherLoot
	author: Socrates
	description: Loots all the bodies and crates near the vehicle or loot crate.
	returns: nothing
*/
params ["_vehicle", "_radius", ["_overridePosition",[]]];

private _time = serverTime;

if (_overridePosition isEqualTo [] && {[getPosATL player, _radius] call A3A_fnc_enemyNearCheck}) exitWith {
    if (hasInterface) then {
        {
            [localize "STR_antistasi_actions_looter_enemies_nearby"] remoteExecCall ["systemChat", _x];
        } forEach ([_radius, _vehicle] call SCRT_fnc_common_getNearPlayers);
        playSound "A3AP_UiFailure";
	};
};

if ((_time - (_vehicle getVariable ["lastLooted", -10])) < 10) exitWith {
	if (hasInterface) then {
        {
            [localize "STR_antistasi_actions_looter_cooldown_text"] remoteExecCall ["systemChat", _x];
        } forEach ([_radius, _vehicle] call SCRT_fnc_common_getNearPlayers);
        playSound "A3AP_UiFailure";
	};
};
_vehicle setVariable ["lastLooted", _time, true];

private _position = if (!(_overridePosition isEqualTo [])) then {_overridePosition} else {position _vehicle};
private _supplies = (_position nearSupplies _radius) select {
    ((_x isKindOf "Man" && !(alive _x)) || 
    {(typeOf _x) in ([FactionGet(inv, "surrenderCrate"), FactionGet(occ, "surrenderCrate"), FactionGet(riv, "surrenderCrate"), "WeaponHolderSimulated", "GroundWeaponHolder", "WeaponHolder"])}) &&
    !(_x getVariable ["isLooted", false])
};

if(_supplies isEqualTo []) exitWith {
    {
        localize "STR_antistasi_actions_no_loot_text" remoteExec ["systemChat", _x];
    } forEach ([_radius, _vehicle] call SCRT_fnc_common_getNearPlayers);
};

private _moneyEarned = 0;
private _data = [];

private _mass = getMass _vehicle;
if (_mass == 0) then { _mass = 0.01; };
_vehicle setVariable ["A3A_lootBox_initialMass", _mass];
_vehicle setVariable ["A3A_lootBox_currentMass", _mass];

private _lootMass = 0;

private _launchMessages = [
    "STR_A3U_Petros_lootbox_launch1",
    "STR_A3U_Petros_lootbox_launch2",
    "STR_A3U_Petros_lootbox_launch3"
];

private _getItemMass = {
    params ["_item"];
    private _mass = 0;

    if (isClass (configFile >> "CfgWeapons" >> _item)) then {
        _mass = getNumber (configFile >> "CfgWeapons" >> _item >> "mass");
    };
    if (_mass == 0 && {isClass (configFile >> "CfgMagazines" >> _item)}) then {
        _mass = getNumber (configFile >> "CfgMagazines" >> _item >> "mass");
    };
    if (_mass == 0 && {isClass (configFile >> "CfgVehicles" >> _item)}) then {
        _mass = getNumber (configFile >> "CfgVehicles" >> _item >> "mass");
    };

    if (_mass == 0) then {
        switch (true) do {
            case (_item isKindOf ["Weapon", configFile >> "CfgWeapons"]): { _mass = 3; };
            case (_item isKindOf ["Magazine", configFile >> "CfgMagazines"]): { _mass = 0.3; };
            case (_item isKindOf ["ItemCore", configFile >> "CfgWeapons"]): { _mass = 0.1; };
            default { _mass = 0.05; };
        };
    } else {
        _mass = _mass / 2;
        _mass = _mass max 0.1;
    };
    _mass
};

private _updateMass = {
    params ["_box", "_addedMass"];
    private _currentMass = _box getVariable ["A3A_lootBox_currentMass", getMass _box];
    _currentMass = _currentMass - _addedMass;
    if (_currentMass <= 0.1) then { _currentMass = 0.01; };
    _box setVariable ["A3A_lootBox_currentMass", _currentMass];
    [_box, _currentMass] remoteExec ["setMass", 0];
    
    if (_currentMass <= 0.02) then {
        private _message = localize (selectRandom _launchMessages);
        {
            _message remoteExec ["systemChat", _x];
        } forEach ([10, _vehicle] call SCRT_fnc_common_getNearPlayers);
        sleep 1;
        if (isNil {_box getVariable "A3A_lootBox_monitor"}) then {
            _box setVariable ["A3A_lootBox_monitor", true];
            [_box] spawn {
                params ["_box"];
                private _velocity = [0,0,2];
                private _startTime = time;
                while { true } do {
                    sleep 0.1;
                    [_box, _velocity] remoteExec ["setVelocity", 0];
                    if ((getPosATL _box select 2) > 10) then { _velocity = [0,0,5]; };
                    if ( (getPosATL _box select 2 > 100) || (_box getVariable ["A3A_lootBox_wasHit", false]) || (time - _startTime > 30)) exitWith {
                        private _fullMass = _box getVariable ["A3A_lootBox_initialMass", 0.01];
                        _box setVariable ["A3A_lootBox_currentMass", _fullMass];
                        [_box, _fullMass] remoteExec ["setMass", 0];
                        [_box, ["A3A_Sound_Pop", 200, 1, 0, 0, true]] remoteExec ["say3D", 0];
                        [[10, 1, 125]] remoteExec ["addCamShake", 0];
                    };
                };
                _box setVariable ["A3A_lootBox_monitor", nil];
                _box setVariable ["A3A_lootBox_wasHit", nil];
                _box removeEventHandler ["Hit", _box getVariable ["A3A_lootBox_hitEH", -1]];
                sleep 4;
                [_box, ["A3A_Sound_Deflate", 50, 1, 0, 0, true]] remoteExec ["say3D", 0];
            };
            private _hitEH = _box addEventHandler ["Hit", { params ["_box"]; _box setVariable ["A3A_lootBox_wasHit", true]; }];
            _box setVariable ["A3A_lootBox_hitEH", _hitEH];
        };
    };
};

{
    _lootContainer = _x;

    _magazines = magazineCargo _lootContainer;
    _weaponsWithAttachments = weaponsItems _lootContainer;
    _items = itemCargo _lootContainer;
    _backpacks = backpackCargo _lootContainer;

    if ((lootCrateUnlockedItems isEqualTo true)) then {

        _data = [_magazines, _weaponsWithAttachments, _items, _backpacks];

        private _unlocked = [_data] call a3u_fnc_removeUnlockedItems;

        // redefine vars minus returned _data, to refresh array
        _magazines = _magazines - _unlocked;
        _weaponsWithAttachments = _weaponsWithAttachments - _unlocked;
        _items = _items - _unlocked;
        _backpacks = _backpacks - _unlocked;

    };
    
    if (count _magazines > 0) then {
        {
            if(_x in arrayMoney) then {
                _moneyIndex = arrayMoney find _x;
                if (_moneyIndex isNotEqualTo -1) then {
                    _moneyEarned = _moneyEarned + (arrayMoneyAmount select _moneyIndex);
                };
            } else {
                _vehicle addMagazineCargoGlobal [_x, 1];
                _lootMass = _lootMass + ([_x] call _getItemMass);
            };
        } forEach _magazines;
    };

    if (count _backpacks > 0) then {
        {
            if ((lootCrateUnlockedItems isEqualTo true) && {_x in unlockedBackpacks}) exitWith {};
            _vehicle addBackpackCargoGlobal [_x, 1];
            _lootMass = _lootMass + ([_x] call _getItemMass);
        } forEach _backpacks;
    };

    if (count _items > 0) then {
        {
            if ((lootCrateUnlockedItems isEqualTo true) && {_x in unlockedItems}) exitWith {};
            _vehicle addItemCargoGlobal [_x, 1];
            _lootMass = _lootMass + ([_x] call _getItemMass);
        } forEach _items;
    };

    if (count _weaponsWithAttachments > 0) then {
        {
            if ((lootCrateUnlockedItems isEqualTo true) && {_x in unlockedWeapons}) exitWith {};
            _vehicle addWeaponWithAttachmentsCargoGlobal [_x, 1];
            private _weaponClass = _x select 0;
            _lootMass = _lootMass + ([_weaponClass] call _getItemMass);
        } forEach _weaponsWithAttachments;
    };

    switch (true) do {
        case (_lootContainer isKindOf "Man"): {

            private _assignedItems = assignedItems _lootContainer;
            private _lootContainerMagazines = magazines _lootContainer;
            private _vest = vest _lootContainer;
            private _headgear = headgear _lootContainer;
            private _backpack = backpack _lootContainer;
            private _lootContainerWeapons = weaponsItems _lootContainer;

            if (lootCrateUnlockedItems isEqualTo true) then {

                _data = [_assignedItems, _lootContainerMagazines, _lootContainerWeapons];
            
                private _unlocked = [_data] call a3u_fnc_removeUnlockedItems;

                // redefine vars minus returned _data, to refresh array
                _assignedItems = _assignedItems - _unlocked;
                _lootContainerMagazines = _lootContainerMagazines - _unlocked;
                _lootContainerWeapons = _lootContainerWeapons - _unlocked;

            };
            
            if (count _assignedItems > 0) then {
                {
                    _vehicle addItemCargoGlobal [_x,1];
                    _lootMass = _lootMass + ([_x] call _getItemMass);
                    _lootContainer unassignItem _x;
                    _lootContainer removeItem _x;
                } forEach _assignedItems;
            };

            if (count _lootContainerMagazines > 0) then {
                {
                    if (_x in arrayMoney) then {
                        _moneyIndex = arrayMoney find _x;
                        if(_moneyIndex isNotEqualTo -1) then {
                            _moneyEarned = _moneyEarned + (arrayMoneyAmount select _moneyIndex);
                        };
                    } else {
                        _vehicle addMagazineCargoGlobal [_x, 1];
                        _lootMass = _lootMass + ([_x] call _getItemMass);
                    };
                    _lootContainer removeMagazines _x;
                } forEach _lootContainerMagazines;
            };

            if (_vest isNotEqualTo "") then {
                if ((lootCrateUnlockedItems isEqualTo true) && {_vest in unlockedVests}) exitWith {removeVest _lootContainer};
                _vehicle addItemCargoGlobal [_vest,1];
                _lootMass = _lootMass + ([_vest] call _getItemMass);
                removeVest _lootContainer;
            };

            if (_headgear isNotEqualTo "") then {
                if ((lootCrateUnlockedItems isEqualTo true) && {_headgear in unlockedHeadgear}) exitWith {removeHeadgear _lootContainer};
                _vehicle addItemCargoGlobal [_headgear,1];
                _lootMass = _lootMass + ([_headgear] call _getItemMass);
                removeHeadgear _lootContainer;
            };

            if (_backpack isNotEqualTo "") then {
                if ((lootCrateUnlockedItems isEqualTo true) && {_backpack in unlockedBackpacks}) exitWith {removeBackpackGlobal _lootContainer};
                _vehicle addBackpackCargoGlobal [_backpack,1];
                _lootMass = _lootMass + ([_backpack] call _getItemMass);
                removeBackpackGlobal _lootContainer;
            };

            if (count _lootContainerWeapons > 0) then {
                {
                    if ((lootCrateUnlockedItems isEqualTo true) && {_x in unlockedWeapons}) exitWith {_lootContainer removeWeaponGlobal _x};
                    _lootContainer addWeaponWithAttachmentsCargoGlobal [_x, 1];
                    private _weaponClass = _x select 0;
                    _lootMass = _lootMass + ([_weaponClass] call _getItemMass);
                    _lootContainer removeWeaponGlobal (_x#0);
                } forEach _lootContainerWeapons;
            };

            removeAllWeapons _lootContainer;
            _lootContainer setVariable ["isLooted", true, true];
        };
        default {
            deleteVehicle _lootContainer;
        };
    };
} forEach _supplies;


if (_moneyEarned > 0) then {
    _allPlayers = call SCRT_fnc_misc_getRebelPlayers;
    _playersCount = count _allPlayers;
    
    if (_playersCount > 0) then {
        _incomePerPlayer = round(_moneyEarned / _playersCount);
        {
            [_incomePerPlayer, _x] call A3A_fnc_addMoneyPlayer;
        } forEach _allPlayers;

        [localize "STR_antistasi_actions_common_notifications_money_found_title", localize "STR_antistasi_actions_common_notifications_money_found_text"] remoteExecCall ["A3A_fnc_customHint", [teamPlayer, civilian]];
    };
};

private _volume = if (_overridePosition isNotEqualTo []) then {500} else {_radius};
playSound3D ["x\A3A\addons\core\Sounds\Misc\LootSuccess.ogg", _vehicle, false, getPosASL _vehicle, 3, 1, _volume];

{
    localize "STR_antistasi_actions_successful_loot_text" remoteExec ["systemChat", _x];
} forEach ([_radius, _vehicle] call SCRT_fnc_common_getNearPlayers);

[_vehicle, ["A3A_Sound_Inflate", 50, 1, 0, 0, true]] remoteExec ["say3D", 0];
sleep 2.5;
[_vehicle, _lootMass] call _updateMass;


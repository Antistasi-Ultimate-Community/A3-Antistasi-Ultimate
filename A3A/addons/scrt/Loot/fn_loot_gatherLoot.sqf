#include "..\defines.inc"
FIX_LINE_NUMBERS()

/*
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
            };
        } forEach _magazines;
    };

    if (count _backpacks > 0) then {
        {
            if ((lootCrateUnlockedItems isEqualTo true) && {_x in unlockedBackpacks}) exitWith {};
            _vehicle addBackpackCargoGlobal [_x, 1];
        } forEach _backpacks;
    };

    if (count _items > 0) then {
        {
            if ((lootCrateUnlockedItems isEqualTo true) && {_x in unlockedItems}) exitWith {};
            _vehicle addItemCargoGlobal [_x, 1];
        } forEach _items;
    };

    if (count _weaponsWithAttachments > 0) then {
        {
            if ((lootCrateUnlockedItems isEqualTo true) && {_x in unlockedWeapons}) exitWith {};
            _vehicle addWeaponWithAttachmentsCargoGlobal [_x, 1];
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
                    };
                    _lootContainer removeMagazines _x;
                } forEach _lootContainerMagazines;
            };

            if (_vest isNotEqualTo "") then {
                if ((lootCrateUnlockedItems isEqualTo true) && {_vest in unlockedVests}) exitWith {removeVest _lootContainer};
                _vehicle addItemCargoGlobal [_vest,1];
                removeVest _lootContainer;
            };

            if (_headgear isNotEqualTo "") then {
                if ((lootCrateUnlockedItems isEqualTo true) && {_headgear in unlockedHeadgear}) exitWith {removeHeadgear _lootContainer};
                _vehicle addItemCargoGlobal [_headgear,1];
                removeHeadgear _lootContainer;
            };

            if (_backpack isNotEqualTo "") then {
                if ((lootCrateUnlockedItems isEqualTo true) && {_backpack in unlockedBackpacks}) exitWith {removeBackpackGlobal _lootContainer};
                _vehicle addBackpackCargoGlobal [_backpack,1];
                removeBackpackGlobal _lootContainer;
            };

            if (count _lootContainerWeapons > 0) then {
                {
                    if ((lootCrateUnlockedItems isEqualTo true) && {_x in unlockedWeapons}) exitWith {_lootContainer removeWeaponGlobal _x};
                    _lootContainer addWeaponWithAttachmentsCargoGlobal [_x, 1];
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

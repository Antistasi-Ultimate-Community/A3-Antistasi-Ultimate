#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
//fn_ammunitionTransfer

if (!isServer) exitWith {};
private ["_subObject","_ammunition","_originX","_destinationX"];
_originX = _this select 0;
if (isNull _originX) exitWith {};
_destinationX = _this select 1;

if (isNil {	// Run in unschedule scope.
	if (_originX getVariable ["A3A_JNA_ammunitionTransfer_busy",false]) then {
		nil;  // will lead to exit.
	} else {
		_originX setVariable ["A3A_JNA_ammunitionTransfer_busy",true];
		0;  // not nil, will allow script to continue.
	};
}) exitWith {};  // Silent exit, likely due to spamming

_ammunition= [];
_items = [];
_ammunition = magazineCargo _originX;
_items = itemCargo _originX;
_weaponsX = [];
_weaponsItemsCargo = weaponsItemsCargo _originX;
_backpcks = [];

if (count backpackCargo _originX > 0) then {
	{
		_backpcks pushBack (_x call A3A_fnc_basicBackpack);
	} forEach backpackCargo _originX;
};
_containers = everyContainer _originX;
if (count _containers > 0) then {
	for "_i" from 0 to (count _containers) - 1 do {
		_subObject = magazineCargo ((_containers select _i) select 1);
		if (!isNil "_subObject") then {_ammunition = _ammunition + _subObject} else {Error_1("Error from %1",magazineCargo (_containers select _i))};
		//_ammunition = _ammunition + (magazineCargo ((_containers select _i) select 1));
		_items = _items + (itemCargo ((_containers select _i) select 1));
		_weaponsItemsCargo = _weaponsItemsCargo + weaponsItemsCargo ((_containers select _i) select 1);
	};
};

if (!isNil "_weaponsItemsCargo") then {
	if (count _weaponsItemsCargo > 0) then {
		{
			_weaponsX pushBack ([(_x select 0)] call BIS_fnc_baseWeapon);
			for "_i" from 1 to (count _x) - 1 do {
				_thingX = _x select _i;
				if (_thingX isEqualType "") then {
					if (_thingX != "") then {_items pushBack _thingX};
				}
				else {
					if (_thingX isEqualType []) then {
					if (count _thingX > 0) then {
						_ammunition pushBack (_thingX select 0);
						};
					};
				};
			};
		} forEach _weaponsItemsCargo;
	};
};

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
    };
    _mass
};

private _totalAddedMass = 0;

_weaponsFinal = [];
_weaponsFinalCount = [];
{
	_weaponX = _x;
	if ((!(_weaponX in _weaponsFinal)) && (!(_weaponX in unlockedWeapons))) then {
		_weaponsFinal pushBack _weaponX;
		_weaponsFinalCount pushBack ({_x == _weaponX} count _weaponsX);
	};
} forEach _weaponsX;

if (count _weaponsFinal > 0) then {
	for "_i" from 0 to (count _weaponsFinal) - 1 do {
		private _weapon = _weaponsFinal select _i;
		private _count = _weaponsFinalCount select _i;
		_destinationX addWeaponCargoGlobal [_weapon, _count];
		_totalAddedMass = _totalAddedMass + ([_weapon] call _getItemMass) * _count;
	};
};

_ammunitionFinal = [];
_ammunitionFinalCount = [];
if (isNil "_ammunition") then {
	Error_4("Ammunition transmission error. I had this: %1 and these containers: %2, the originX was a %3 and the objectX is defined as: %4", magazineCargo _originX, everyContainer _originX,typeOf _originX,_originX);
} else {
	{
		_weaponX = _x;
		if ((not(_weaponX in _ammunitionFinal)) and (not(_weaponX in unlockedMagazines))) then {
			_ammunitionFinal pushBack _weaponX;
			_ammunitionFinalCount pushBack ({_x == _weaponX} count _ammunition);
		};
	} forEach  _ammunition;
};


if (count _ammunitionFinal > 0) then {
	for "_i" from 0 to (count _ammunitionFinal) - 1 do {
		private _mag = _ammunitionFinal select _i;
		private _count = _ammunitionFinalCount select _i;
		_destinationX addMagazineCargoGlobal [_mag, _count];
		_totalAddedMass = _totalAddedMass + ([_mag] call _getItemMass) * _count;
	};
};

_itemsFinal = [];
_itemsFinalCount = [];
{
	_weaponX = _x;
	if ((not(_weaponX in _itemsFinal)) and (not(_weaponX in unlockedItems))) then {
		_itemsFinal pushBack _weaponX;
		_itemsFinalCount pushBack ({_x == _weaponX} count _items);
	};
} forEach _items;

if (count _itemsFinal > 0) then {
	for "_i" from 0 to (count _itemsFinal) - 1 do {
		private _item = _itemsFinal select _i;
		private _count = _itemsFinalCount select _i;
		_destinationX addItemCargoGlobal [_item, _count];
		_totalAddedMass = _totalAddedMass + ([_item] call _getItemMass) * _count;
	};
};

_backpcksFinal = [];
_backpcksFinalCount = [];
{
	_weaponX = _x;
	if ((not(_weaponX in _backpcksFinal)) and (not(_weaponX in unlockedBackpacks))) then {
		_backpcksFinal pushBack _weaponX;
		_backpcksFinalCount pushBack ({_x == _weaponX} count _backpcks);
	};
} forEach _backpcks;

if (count _backpcksFinal > 0) then {
	for "_i" from 0 to (count _backpcksFinal) - 1 do {
		private _backpack = _backpcksFinal select _i;
		private _count = _backpcksFinalCount select _i;
		_destinationX addBackpackCargoGlobal [_backpack, _count];
		_totalAddedMass = _totalAddedMass + ([_backpack] call _getItemMass) * _count;
	};
};

private _thresholdMass = 3500;
private _currentMass = _destinationX getVariable ["A3A_arsenal_currentMass", getMass _destinationX];
if (_currentMass == 0) then { _currentMass = 0.01; };
private _newMass = _currentMass + _totalAddedMass;

if (isNil {_destinationX getVariable "A3A_arsenal_initialMass"}) then {
    _destinationX setVariable ["A3A_arsenal_initialMass", _currentMass];
    _destinationX setVariable ["A3A_arsenal_currentMass", _currentMass];
    _destinationX setVariable ["A3A_arsenal_exploded", false];
    _destinationX setVariable ["A3A_arsenal_exploding", false];
};

private _hasExploded = _destinationX getVariable ["A3A_arsenal_exploded", false];
private _isExploding = _destinationX getVariable ["A3A_arsenal_exploding", false];

private _warning1Messages = [
    "STR_A3U_Petros_arsenal_warning1a",
    "STR_A3U_Petros_arsenal_warning1b",
    "STR_A3U_Petros_arsenal_warning1c"
];


if (!_hasExploded && _newMass >= _thresholdMass && !_isExploding) then {
    _destinationX setVariable ["A3A_arsenal_exploding", true];

    [_destinationX, ["A3A_Sound_Crackling", 50, 1, 0, 0, true]] remoteExec ["say3D", 0];
    sleep 1;
    private _nearPlayers = allPlayers select { (_x distance _destinationX) < 50 && alive _x };
    if (count _nearPlayers > 0) then {
        private _owners = _nearPlayers apply { owner _x };
        private _message = format ["Petros :)  %1", localize (selectRandom _warning1Messages)];
        [_message] remoteExec ["systemChat", _owners];
    };

    [_destinationX] spawn {
        params ["_box"];
        private _warning2Messages = [
            "STR_A3U_Petros_arsenal_warning2a",
            "STR_A3U_Petros_arsenal_warning2b",
            "STR_A3U_Petros_arsenal_warning2c"
        ];
        sleep 2;

        private _nearPlayers = allPlayers select { (_x distance _box) < 50 && alive _x };
        if (count _nearPlayers > 0) then {
            private _owners = _nearPlayers apply { owner _x };
            private _message = format ["Petros :)  %1", localize (selectRandom _warning2Messages)];
            [_message] remoteExec ["systemChat", _owners];
        };

        sleep 3;
        [petros, "A3A_Audio_Petros_Scream_long"] remoteExec ["say3D", 0];

        [_box, ["A3A_Sound_Crackling", 50, 1, 0, 0, true]] remoteExec ["say3D", 0];
        sleep 2;

        private _pos = getPosATL _box;
        private _radius = 50;
        private _objects = _box nearObjects _radius;
        _objects = _objects select {
            (_x isKindOf "LandVehicle") ||
            (_x isKindOf "Air") ||
            (_x isKindOf "Ship") ||
            (_x isKindOf "Man") ||
            (simulationEnabled _x)
        };

        [_box, ["A3A_Sound_Thud", 200, 1, 0, 0, true]] remoteExec ["say3D", 0];

        {
            if (local _x) then {
                _x allowDamage false;
            } else {
                [_x, false] remoteExec ["allowDamage", owner _x];
            };
        } forEach _objects;

        {
            private _objPos = getPosATL _x;
            private _dir = _objPos vectorDiff _pos;
            private _dist = vectorMagnitude _dir;
            if (_dist < 0.5) then { _dist = 0.5; };
            
            if (_x isKindOf "Man") then {
                private _force = (1 / _dist) * 20000;
                private _forceVec = vectorNormalized _dir vectorMultiply _force;
                if (local _x) then {
                    _x addForce [_forceVec, [0,0,0], false];
                } else {
                    [_x, [_forceVec, [0,0,0], false]] remoteExec ["addForce", owner _x];
                };
            } else {
                private _force = (1 / _dist) * 300;
                private _vel = vectorNormalized _dir vectorMultiply _force;
                [_x, _vel] remoteExec ["setVelocity", 0];
            };
        } forEach _objects;

        sleep 5;
        {
            if (local _x) then {
                _x allowDamage true;
            } else {
                [_x, true] remoteExec ["allowDamage", owner _x];
            };
        } forEach _objects;

        private _fullMass = _box getVariable ["A3A_arsenal_initialMass", 0.01];
        _box setVariable ["A3A_arsenal_currentMass", _fullMass];
        [_box, _fullMass] remoteExec ["setMass", 0];
        _box setVariable ["A3A_arsenal_exploded", true];
        _box setVariable ["A3A_arsenal_exploding", false];
        _box setVariable ["A3A_arsenal_exploded", false];
    };
} else {
    if (!_hasExploded && !_isExploding) then {
        _destinationX setVariable ["A3A_arsenal_currentMass", _newMass];
        [_destinationX, _newMass] remoteExec ["setMass", 0];

        [_destinationX, ["A3A_Sound_Crackling", 50, 1, 0, 0, true]] remoteExec ["say3D", 0];
        sleep 1;
        private _nearPlayers = allPlayers select { (_x distance _destinationX) < 50 && alive _x };
        if (count _nearPlayers > 0) then {
            private _owners = _nearPlayers apply { owner _x };
            private _message = format ["Petros :)  %1", localize (selectRandom _warning1Messages)];
            [_message] remoteExec ["systemChat", _owners];
        };
    };
};

if (count _this == 3) then {
	deleteVehicle _originX;
}
else {
	clearMagazineCargoGlobal _originX;
	clearWeaponCargoGlobal _originX;
	clearItemCargoGlobal _originX;
	clearBackpackCargoGlobal _originX;
};

if (_destinationX == boxX) then {
	if ((_originX isKindOf "ReammoBox_F") && {_originX != vehicleBox}) then {deleteVehicle _originX};
	_updated = [] call A3A_fnc_arsenalManage;
	if (_updated != "") then {
		_updated = format [localize "STR_hints_arsenal_transfer_updated", _updated];
		[petros,"income",_updated] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
	};
} else {
	[petros,"hint",localize "STR_hints_arsenal_transfer_success", localize "STR_hints_arsenal_transfer_header"] remoteExec ["A3A_fnc_commsMP",driver _destinationX];
};

if (!isNull _originX) then {
	_originX setVariable ["A3A_JNA_ammunitionTransfer_busy",false];
};

params[["_truckX", nil, [objNull]]];

if !(isNil "_truckX") then {
	if (_truckX isKindOf "StaticWeapon") then {_truckX = objNull};
} else {
	private _trucksX = nearestObjects [boxX, ["Helicopter","Plane","LandVehicle","ReammoBox_F"], 20];
	_trucksX = _trucksX select { !(isObjectHidden _x) && { isNull attachedTo _x } && { !(_x isKindOf "StaticWeapon") } };
	// Prevent trolling by hiding small UAVs near the arsenal
	_trucksX = _trucksX select { getNumber(configOf _x >> "isUAV") == 0 };
	_trucksX = _trucksX - [boxX, vehicleBox];
	_truckX = _trucksX param[0, objNull, [objNull]];
};

if (isNull _truckX) exitWith {};

private _weaponsX = weaponCargo _truckX;
private _ammunition = magazineCargo _truckX;
private _items = itemCargo _truckX;
private _backpcks = backpackCargo _truckX;

private _moneyEarned = 0;

//money parse
{
	if(_x in arrayMoney) then {
		_moneyIndex = arrayMoney find _x;
		if(_moneyIndex != -1) then {
			_moneyEarned = _moneyEarned + (arrayMoneyAmount select _moneyIndex);
		};
	};
} forEach _ammunition;

if(_moneyEarned > 0) then {
	_allPlayers = call BIS_fnc_listPlayers;
    _playersCount = count _allPlayers;
    
    if(_playersCount > 0) then {
        _incomePerPlayer = round(_moneyEarned / _playersCount);
        { 
        	if(side _x == teamPlayer) then {
				[_incomePerPlayer,_x] call A3A_fnc_addMoneyPlayer;
			};
    	} forEach _allPlayers;
    };

    [localize "STR_antistasi_actions_common_notifications_money_found_title", localize "STR_antistasi_actions_common_notifications_money_found_text"] remoteExecCall ["A3A_fnc_customHint", teamPlayer];
};


private _todo = _weaponsX + _ammunition + _items + _backpcks;
private _vehName = getText (configFile >> "CfgVehicles" >> (typeof _truckX) >> "displayName");

if (count _todo < 1) exitWith
	{
	if (count _this == 0) then {[localize "STR_A3A_ammunition_transfer_header", format [localize "STR_A3A_ammunition_transfer_veh_empty", _vehName]] call A3A_fnc_customHint;};
	if (count _this == 2) then {deleteVehicle _truckX};
	};

if (count _this == 0) then {
	[localize "STR_A3A_ammunition_transfer_header", format [localize "STR_A3A_ammunition_transfer_success", _vehName]] call A3A_fnc_customHint;
};

if (count _this == 2) then {
	[_truckX,boxX,true] remoteExec ["A3A_fnc_ammunitionTransfer",2];
}
else {
	[_truckX,boxX] remoteExec ["A3A_fnc_ammunitionTransfer",2];
};

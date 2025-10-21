#include "..\defines.inc"
FIX_LINE_NUMBERS()

params ["_side", "_markerPosition", "_size"];

private _return = [];
private _aggression = if (_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
private _isFia = if (random 10 > (tierWar + difficultyCoef)) then {true} else {false};

private _faction = Faction(_side);

private _oversizeChance =  _aggression / 2;
if (_oversizeChance > 25) then {
	_oversizeChance = 25;
};

if ((random 100) < _oversizeChance) then {
    private _vehiclePool = if (_isFia) then {
        (FactionGetTieredFT(_faction, "vehiclesAPCs", 0)) +
        (FactionGetTieredFT(_faction, "vehiclesLightArmed", 0))
         //TODO: vehiclesMilitiaTanks
    } else {
        (FactionGoDTiered(_faction, "vehiclesAPCs")) +
        (FactionGoDTiered(_faction, "vehiclesLightArmed")) +
        (FactionGoDTiered(_faction, "vehiclesIFVs"))
    };
    private _selectedVehicle = selectRandomWeighted _vehiclePool;

    if (!isNil "_selectedVehicle") then {
        private _road = nil;
        private _radiusX = 5;

        while {true} do {
            _road = _markerPosition nearRoads _radiusX;
            if (count _road > 0) exitWith {};
            if (_radiusX > 700) exitWith {};
            _radiusX = _radiusX + 10;
        };

        private _position = nil;
        if (!isNil "_road") then {
            private _roadcon = roadsConnectedto (_road select 0);
            private _dirveh = if(count _roadcon > 0) then {[_road select 0, _roadcon select 0] call BIS_fnc_DirTo} else {random 360};
            _position = getPos (_road select 0);
        } else {
            _position = [_markerPosition, 10, _size, 5, 0, 0.7, 0, [], [_markerPosition, _markerPosition]] call BIS_fnc_findSafePos;
        };

        private _vehicleData = [_position, 0, _selectedVehicle, _side] call A3A_fnc_spawnVehicle;
        _return = _vehicleData;

        Info_2("Oversized vehicle position: %1, classname: %2", str _position, _selectedVehicle);
    } else {
        Warning_1("%1 has not enough vehicles, oversized vehicle will be not spawned.", str _side);
    };  
};

_return
#include "..\defines.inc"
FIX_LINE_NUMBERS()

params ["_side", "_markerPosition", "_size"];

private _return = [];
private _aggression = [aggressionInvaders, aggressionOccupants] select (_side == Occupants);
private _isFia = random 10 > (tierWar + difficultyCoef);

private _faction = Faction(_side);

private _oversizeChance =  _aggression / 2;
if (_oversizeChance > 25) then {
	_oversizeChance = 25;
};

if ((random 100) < _oversizeChance) then {
    private _vehiclePool = if (_isFia) then {
            (_faction get "vehiclesMilitiaAPCs") + (_faction get "vehiclesMilitiaLightArmed") //TODO: vehiclesMilitiaTanks
    } else {
        (_faction get "vehiclesAPCs") + (_faction get "vehiclesLightArmed") +  (_faction get "vehiclesIFVs")
    };
    private _selectedVehicle = selectRandom _vehiclePool;

    if (!isNil "_selectedVehicle") then {
        private _road = nil;
        private _radiusX = 5;

        while {true} do {
            _road = _markerPosition nearRoads _radiusX;
            if (_road isNotEqualTo []) exitWith {};
            if (_radiusX > 700) exitWith {};
            _radiusX = _radiusX + 10;
        };

        private _position = nil;
        if (!isNil "_road") then {
            private _roadcon = roadsConnectedTo (_road select 0);
            private _dirveh = if(_roadcon isNotEqualTo []) then {[_road select 0, _roadcon select 0] call BIS_fnc_DirTo} else {random 360};
            _position = getPos (_road select 0);
        } else {
            _position = [_markerPosition, 10, _size, 5, 0, 0.7, 0, [], [_markerPosition, _markerPosition]] call BIS_fnc_findSafePos;
        };

        private _vehicleData = [_position, 0, _selectedVehicle, _side] call A3A_fnc_spawnVehicle;
        _return = _vehicleData;

        Info_2("Oversized vehicle position: %1, classname: %2",str _position,_selectedVehicle);
    } else {
        Warning_1("%1 has not enough vehicles, oversized vehicle will be not spawned.",str _side);
    };  
};

_return

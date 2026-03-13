#include "Constants.inc"
#include "..\defines.inc"
FIX_LINE_NUMBERS()

params [["_overridePosition", []], ["_overrideRadius", -1], ["_proximityChance", 40]];
 
Info("Civ Car Demo Charge Rival Event Init.");

private _vehicles = [];
private _effects = [];

private _allPlayers = call SCRT_fnc_misc_getRebelPlayers;

private _originPosition = nil;

if (_overridePosition isEqualTo []) then {
    private _player = selectRandom _allPlayers;
    if (isNil "_player") exitWith {
        Error("No players found, aborting.");
    };

    _originPosition = position _player;
    Info_2("%1 will be used as center of the event at %2 position.", name _player, str _originPosition);
} else {
    _originPosition = _overridePosition;
    Info_1("%1 position will be used as center of the event.", str _originPosition);
};

if (isNil "_originPosition") exitWith {
    Info("No suitable position for event, cooldowning...");

    isRivalEventInProgress = false;
    publicVariableServer "isRivalEventInProgress";
    rivalEventCooldown = 300;
    publicVariableServer "rivalEventCooldown";
};

private _spawnPosition = nil;

if (_overrideRadius != -1) then {
    _spawnPosition = [_originPosition, 100, _overrideRadius, 0, 0] call BIS_fnc_findSafePos;
} else {
    _spawnPosition = [_originPosition, 500, distanceSPWN, 0, 0] call BIS_fnc_findSafePos;
};

private _roads = objNull;
private _radiusX = 5;

while {true} do {
    _roads = _spawnPosition nearRoads _radiusX;
    if (count _roads > 0) exitWith {};
    _radiusX = _radiusX + 5;
};

private _road = selectRandom _roads;
private _roadcon = roadsConnectedto _road;
private _dirveh = if (count _roadcon != 0) then {[_road, _roadcon select 0] call BIS_fnc_dirTo} else {random 360};
private _roadPosition = getPos _road;

private _vehicleClass = selectRandom arrayCivVeh;

if (_vehicleClass == "" || {_vehicleClass == "not_supported"}) exitWith {
    Error("No vehicle class, aborting event.");
    isRivalEventInProgress = false;
    publicVariableServer "isRivalEventInProgress";
    rivalEventCooldown = 300;
    publicVariableServer "rivalEventCooldown";
};

private _chargedVehicle = createVehicle [_vehicleClass, [_roadPosition select 0, _roadPosition select 1, 0.9], [], 0, "CAN_COLLIDE"];
_chargedVehicle setDir _dirveh;

[_chargedVehicle, civilian] call A3A_fnc_AIVEHinit;
[_chargedVehicle, _proximityChance] call SCRT_fnc_rivals_plantCarDemoCharge;

private _vehiclePosition = position _chargedVehicle;
_chargedVehicle setPos [(_vehiclePosition select 0) - 1, (_vehiclePosition select 1) - 1, _vehiclePosition select 2];

#if __A3_DEBUG__
    private _localMarker = createMarkerLocal [format ["%1exp%2", random 10000, random 10000], (position _chargedVehicle)];
    _localMarker setMarkerSizeLocal [1,1];
    _localMarker setMarkerAlpha 1; 
    _localMarker setMarkerTypeLocal "KIA";
    _localMarker setMarkerColorLocal "ColorEAST";
#endif

private _timeOut = time + 1800;
waitUntil { sleep 5; (time > _timeOut) || isNull _chargedVehicle || {_allPlayers findIf {_x distance2D (position _chargedVehicle) < distanceSPWN} == -1}};

[_chargedVehicle] spawn A3A_fnc_vehDespawner;

isRivalEventInProgress = false;
publicVariableServer "isRivalEventInProgress";

rivalEventCooldown = [] call SCRT_fnc_rivals_getEventCooldown;
publicVariableServer "rivalEventCooldown";

Info("Civ Car Demo Charge Rival Event clean up complete.");
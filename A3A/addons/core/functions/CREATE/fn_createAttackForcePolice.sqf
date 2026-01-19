/*  
Maintainer: Silence
    Create land attack force, police

Scope: Server or HC
Environment: Scheduled (sleeps between unit spawns)

Arguments:
    <SIDE> Side to create force for
    <STRING> Marker name of source base to spawn at
    <POS or STRING> Position or marker of target location for attack force
    <STRING> Resource pool to use
    <INTEGER> Total number of vehicles to create
    <STRING> Optional, troop type to use (Default: "Police")

Return array:
    <SCALAR> Resources spent
    <ARRAY> Array of vehicle objects created
    <ARRAY> Array of crew groups created
    <ARRAY> Array of cargo groups created
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_side", "_base", "_target", "_resPool", "_vehCount", ["_tierMod", 0], ["_troopType", "Police"]];
private _targpos = if (_target isEqualType []) then { _target } else { markerPos _target };
// private _transportRatio = 1 - _vehAttackCount / _vehCount;

if (_tierMod isEqualTo 0) then {_tierMod = 1};

private _resourcesSpent = 0;
private _vehicles = [];
private _crewGroups = [];
private _cargoGroups = [];

private _transportPool = [];

private _faction = Faction(_side);
_transportPool = _faction get "vehiclesPolice";

private _numTransports = 0;
private _landPosBlacklist = [];

private _route = [getMarkerPos (_base), _targpos];
// private _route = [getMarkerPos (_base), _targpos] call A3A_fnc_findPath;
// private _routeClean = [];
// {_routeClean pushBack (_x#0)} forEach _route; // lazy but works

private _leadVehicle = ObjNull;
private _lastVehicle = ObjNull;

for "_i" from 1 to _vehCount do {
    private _vehType = ObjNull;

    // Attempt to grab veh types
    _vehType = selectRandom _transportPool;
    if (isNil "_vehType") then {
        Error_1("Failed to grab land vehicle, attempting to grab a transport vehicle.", _base);
        // exit early, somehow police have no vehicles
    };

    private _vehData = [_vehType, _troopType, _resPool, _landPosBlacklist, _side, _base, _targPos] call A3A_fnc_createAttackVehicle;
    if !(_vehData isEqualType []) exitWith {
        Error_1("Failed to spawn land vehicle at marker %1", _base);
    }; // couldn't create for some reason, assume we're out of spawn places?

    private _vehicle = (_vehData#0);

    if (_i isEqualTo 1) then {_leadVehicle = _vehicle};
    if (_i isEqualTo _vehCount) then {_leadVehicle setVariable ["A3A_convoyHasFormed", true, true]};

    // diag_log format ["%1 | %2 | %3", _i, _leadVehicle, (_leadVehicle getVariable ["A3A_convoyHasFormed", false])];

    _vehicles pushBack _vehicle;
    if (!isNull (_vehData#1)) then { _crewGroups pushBack (_vehData#1) };
    if (!isNull (_vehData#2)) then { _cargoGroups pushBack (_vehData#2) };
    _landPosBlacklist = (_vehData#3);

    private _vehCost = A3A_vehicleResourceCosts getOrDefault [_vehType, 0];
    private _crewCost = 10 * (count units (_vehData#1) + count units (_vehData#2));
    _resourcesSpent = _resourcesSpent + _vehCost + _crewCost;

    _numTransports = _numTransports + 1;

    // [_vehicle, _route, _vehicles, 120, false, true, [15, 30], _leadVehicle] spawn A3A_fnc_vehicleConvoyTravel;

    sleep 10;
};

_vehicles spawn {
    sleep 60;
    // Free spawn places for any vehicles that still exist
    private _vehicles = _this select { !isNull _x };
    private _spawnPlaces = _vehicles apply { _x getVariable "spawnPlace" };
    _spawnPlaces call A3A_fnc_freeSpawnPositions;
    { _x setVariable ["spawnPlace", nil] } forEach _vehicles;
};

[_resourcesSpent, _vehicles, _crewGroups, _cargoGroups];

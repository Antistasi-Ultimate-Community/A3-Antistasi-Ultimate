/*  
Maintainer: wersal
    Create orbital attack force

Scope: Server or HC
Environment: Scheduled (sleeps between unit spawns)

Arguments:
    <SIDE> Side to create force for
    <STRING> Marker name of source base to spawn at
    <POS or STRING> Position or marker of target location for attack force
    <STRING> Resource pool to use
    <INTEGER> Total number of vehicles to create
    <INTEGER> Number of attack/support vehicles to create
    <STRING> Optional, troop type to use (Default: "Normal")

Return array:
    <SCALAR> Resources spent
    <ARRAY> Array of vehicle objects created
    <ARRAY> Array of crew groups created
    <ARRAY> Array of cargo groups created
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_side", "_base", "_target", "_resPool", "_vehCount", "_vehAttackCount", ["_troopType", "Specops"]];
private _targpos = if (_target isEqualType []) then { _target } else { markerPos _target };

private _resourcesSpent = 0;
private _vehicles = [];
private _crewGroups = [];
private _cargoGroups = [];

private _faction = Faction(_side);
private _transportPlanes = _faction get "vehiclesDropPod";
if (_transportPlanes isEqualTo []) exitWith { [-1, [], [], []] }; /// should we even do that if there is no defined droppods?

for "_i" from 1 to _vehCount do {
    private _transportPlaneType = selectRandom _transportPlanes;
    private _vehData = [_transportPlaneType, _troopType, _resPool, [], _side, _base, _targPos, true] call A3A_fnc_createAttackVehicleOrbital;
    if (_vehData isEqualType []) then {
        _vehicles pushBack (_vehData#0);
        _crewGroups pushBack (_vehData#1);
        if !(isNull (_vehData#2)) then { _cargoGroups pushBack (_vehData#2) };
        private _vehCost = A3A_vehicleResourceCosts getOrDefault [_transportPlaneType, 0];
        private _crewCost = 10 * (count units (_vehData#1) + count units (_vehData#2)); //should probably determine it smarter
        _resourcesSpent = _resourcesSpent + _vehCost + _crewCost;
        sleep 2;
    };
};

private _supportPool = [_side, tierWar] call A3A_fnc_getVehiclesAirSupport;
private _availableCAS = ["CAS", "CASDIVE"] select {_x in _supportPool};
if (_availableCAS isNotEqualTo []) then {
    for "_i" from 1 to _vehAttackCount do {
        private _casType = selectRandom _availableCAS;
        [_casType, _side, _resPool, 500, false, _targPos, 0, 5] remoteExec ["A3A_fnc_createSupport", 2];
        sleep 2;
    };
};

[_resourcesSpent, _vehicles, _crewGroups, _cargoGroups];

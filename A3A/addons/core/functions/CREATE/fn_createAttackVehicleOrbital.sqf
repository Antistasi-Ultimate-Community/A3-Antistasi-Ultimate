/*  Creates a vehicle for orbital QRF, including crew and cargo

    Execution on: HC or Server

    Scope: Internal

    Parameters:
        _vehicleType: STRING : The name of the vehicle to spawn
        _troopType: STRING : Type of cargo units to use
        _resPool: STRING : Resource pool name for vehicle/troops, probably "attack" or "defence"
        _landPosBlacklist: ARRAY : List of blacklisted position
        _side: SIDE : The side of the attacker
        _markerOrigin: STRING : The name of the marker marking the origin
        _posDestination: ARRAY : Target position (ASL or ATL? probably used as 2d anyway)

    Returns:
        ARRAY : [_vehicle, _crewGroup, _cargoGroup, _landPosBlacklist]
        or
        OBJECT : objNull if the spawning did not worked
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_vehicleType", "_troopType", "_resPool", "_landPosBlacklist", "_side", "_markerOrigin", "_posDestination", ["_isAirdrop", false]];

private _faction = Faction(_side);
private _vehicle = [_markerOrigin, _vehicleType] call A3A_fnc_spawnVehicleAtMarker;

if(isNull _vehicle) exitWith {objNull};

// Fill cargo turrets
private _crewGroup = [_side, _vehicle, nil, true] call A3A_fnc_createVehicleCrew; //emm, not sure if that's needed
{
    [_x, nil, nil, _resPool] call A3A_fnc_NATOinit
} forEach (units _crewGroup);
[_vehicle, _side, _resPool] call A3A_fnc_AIVEHinit;

private _cargoGroup = grpNull;
private _spawnPos = getMarkerPos _markerOrigin;

private _eliteTier = missionNamespace getVariable ["A3U_setting_tierWarElite", 8];

if (tierWar < _eliteTier) then {
    private _unitClasses = [
        unit(elite, "SquadLeader"),
        selectRandomWeighted [unit(elite, "LAT"), 2, unit(elite, "MachineGunner"), 1],
        selectRandomWeighted [unit(elite, "Rifleman"), 1.25, unit(elite, "Grenadier"), 1],
        selectRandomWeighted [unit(elite, "MachineGunner"), 2, unit(elite, "Marksman"), 1],
        selectRandomWeighted [unit(elite, "LAT"), 1, unit(elite, "AT"), 1.5],
        selectRandomWeighted [unit(elite, "AA"), 1, unit(elite, "Rifleman"), 2],
        selectRandomWeighted [unit(elite, "Rifleman"), 1, unit(elite, "Radioman"), 1],
        unit(elite, "Medic")
    ];
    _cargoGroup = createGroup _side;
    {
        private _unit = _cargoGroup createUnit [_x, _spawnPos, [], 0, "NONE"];
        [_unit, nil, nil, _resPool] call A3A_fnc_NATOinit;
    } forEach _unitClasses;
} else {
    private _groupType = _faction get "groupSpecOpsRandom";
    _cargoGroup = [_spawnPos, _side, _groupType, true, false] call A3A_fnc_spawnGroup;
    {
        [_x, nil, nil, _resPool] call A3A_fnc_NATOinit;
    } forEach units _cargoGroup;
};

_landPosBlacklist = [_vehicle, _crewGroup, _cargoGroup, _posDestination, _markerOrigin, _landPosBlacklist, _isAirdrop, _resPool] call A3A_fnc_createVehicleQRFBehaviour;
ServerDebug_5("Spawn Performed: Created vehicle %1 with %2 crew (%3) and %4 cargo (%5)", typeof _vehicle, count units _crewGroup, _crewGroup, count units _cargoGroup, _cargoGroup);

[_vehicle, _crewGroup, _cargoGroup, _landPosBlacklist];

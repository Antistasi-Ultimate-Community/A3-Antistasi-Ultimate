if (!isServer and hasInterface) exitWith{};
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_markerX"];

private ["_vehiclesX","_groups","_soldiers","_positionX","_staticsX","_garrison"];

private _vehiclesX = [];
private _groups = [];
private _soldiers = [];
private _civs = [];
_positionX = getMarkerPos (_markerX);

private _civNonHuman = Faction(civilian) getOrDefault ["attributeCivNonHuman", false];

if (_markerX != "Synd_HQ" && {!(_markerX in milAdministrationsX)}) then {  ///maaaaaaybe we should save vehicles near ANY friendly marker?
	if (!(_markerX in citiesX)) then {
		private _veh = createVehicle [FactionGet(reb,"flag"), _positionX, [],0, "NONE"];
		_veh setFlagTexture FactionGet(reb,"flagTexture");
		_veh allowDamage false;
		_vehiclesX pushBack _veh;
		[_veh,"SDKFlag"] remoteExec ["A3A_fnc_flagaction",0,_veh];

		if (_markerX in seaports) then {
			[_veh,"seaport"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_veh];
		};
	};

	if ((_markerX in resourcesX) or (_markerX in factories)) then {
		private _spawnedCivilians = [_markerX, 4] call A3A_fnc_createResourceCiv;
		if !(isNil "_spawnedCivilians") then {
			_groups pushBack (_spawnedCivilians # 0);
			_civs append (_spawnedCivilians # 1);
		};
	};
};

private _size = [_markerX] call A3A_fnc_sizeMarker;
private _staticsX = staticsToSave select {_x distance2D _positionX < _size};

private _garrison = [];
_garrison = _garrison + (garrison getVariable [_markerX,[]]);

// Don't create these unless required
private _groupStatics = grpNull;
private _groupMortars = grpNull;

// Create the purchased mortars
private _typeCrew = FactionGet(reb,"unitCrew");
if (_typeCrew in _garrison) then {
	_groupMortars = createGroup teamPlayer;
	{
		private _unit = [_groupMortars, _typeCrew, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
		private _pos = [_positionX] call A3A_fnc_mortarPos;
		private _veh = (FactionGetRebel(A3A_faction_reb, "staticMortars")) # 0 createVehicle _pos;
		_vehiclesX pushBack _veh;

		[_groupMortars] call A3A_fnc_artilleryAdd;

		_unit assignAsGunner _veh;
		_unit moveInGunner _veh;
		[_veh, teamPlayer] call A3A_fnc_AIVEHinit;
		_soldiers pushBack _unit;
	} forEach (_garrison select {_x == _typeCrew});
	_garrison deleteAt (_garrison find _typeCrew);;
};

// Move riflemen into saved static weapons in area
{
    private _veh = _x; // Rename to avoid variable shadowing
    if !(isNil {_veh getVariable "lockedForAI"}) then { continue };
    if (!(isNull attachedTo _veh) && {_veh in (attachedTo _veh getVariable ["ace_cargo_loaded", []])}) then { continue };

    // Get all available crew positions
    private _crewPositions = [];
    
    // Check gunner position
    if (isNull gunner _veh) then {
        _crewPositions pushBack ["Gunner", []];
    };
    
    // Check commander position
    if ((_veh emptyPositions "Commander") > 0 && isNull commander _veh) then {
        _crewPositions pushBack ["Commander", []];
    };
    
    // Check turret positions - FIXED TURRET UNIT CHECK
    private _emptyTurrets = allTurrets [_veh, false] select { isNull (_veh turretUnit _x) };
    { _crewPositions pushBack ["Turret", _x] } forEach _emptyTurrets;

    // Process each position
    {
        if (count _garrison == 0) exitWith {};
        private _role = _x#0;
        private _turretPath = _x#1;
        
        // Find rifleman in garrison
        private _index = _garrison findIf { _x == FactionGet(reb,"unitRifle") };
        if (_index == -1) exitWith {};
        
        // Create unit - FIXED TYPEOF CHECK
        private _unitGroup = if (typeOf _veh in FactionGet(all,"staticMortars")) then {
            if (isNull _groupMortars) then { _groupMortars = createGroup teamPlayer };
            _groupMortars
        } else {
            if (isNull _groupStatics) then { _groupStatics = createGroup teamPlayer };
            _groupStatics
        };
        
        private _unit = [_unitGroup, _garrison#_index, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
        
        // Assign position
        switch (_role) do {
            case "Gunner": { 
                _unit moveInGunner _veh;
                if (_unitGroup == _groupMortars) then {
                    [_unitGroup] call A3A_fnc_artilleryAdd;
                };
            };
            case "Commander": { _unit moveInCommander _veh };
            case "Turret": { _unit moveInTurret [_veh, _turretPath] };
        };
        
        // Initialize and track unit
        [_unit,_markerX] call A3A_fnc_FIAinitBases;
        _soldiers pushBack _unit;
        _garrison deleteAt _index;
        
    } forEach _crewPositions;
    
} forEach _staticsX;


// Make A3A_rebelGarrisonGroupSize groups out of the remainder of the garrison
_garrison = _garrison call A3A_fnc_garrisonReorg;

private _totalUnits = count _garrison;
private _countUnits = 0;
private _countGroup = A3A_rebelGarrisonGroupSize;
private _groupX = grpNull;

while {(spawner getVariable _markerX != 2) and (_countUnits < _totalUnits)} do {
	if (_countGroup == A3A_rebelGarrisonGroupSize) then {
		_groupX = createGroup teamPlayer;
		_groups pushBack _groupX;
		_countGroup = 0;
	};
	private _typeX = _garrison select _countUnits;
	private _unit = [_groupX, _typeX, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
	if (_typeX isEqualTo FactionGet(reb,"unitSL")) then {_groupX selectLeader _unit};
	[_unit,_markerX] call A3A_fnc_FIAinitBases;
	_soldiers pushBack _unit;
	_countUnits = _countUnits + 1;
	_countGroup = _countGroup + 1;
	_groupX setBehaviour "AWARE";
	_groupX setCombatMode "YELLOW";
	sleep 0.5;
};

for "_i" from 0 to (count _groups) - 1 do {
	_groupX = _groups select _i;
	if (_i == 0) then {
		private _garrisonGroup = [_groupX, getMarkerPos _markerX, _size] call A3A_fnc_patrolGroupGarrison;
		if (count _garrisonGroup > 0) then {
			_groups append _garrisonGroup;
		};
	} else {
		[_groupX, "Patrol_Defend", 0, 150, -1, true, _positionX, false] call A3A_fnc_patrolLoop;
	};
};

["locationSpawned", [_markerX, "RebelOutpost", true]] call EFUNC(Events,triggerEvent);

waitUntil {sleep 1; (spawner getVariable _markerX == 2)};

{ if (alive _x) then { deleteVehicle _x }; } forEach _soldiers;
{ deleteVehicle _x } forEach _civs;
{ deleteGroup _x } forEach _groups;

deleteGroup _groupStatics;
deleteGroup _groupMortars;

{if (!(_x in staticsToSave)) then {deleteVehicle _x}} forEach _vehiclesX;
["locationSpawned", [_markerX, "RebelOutpost", false]] call EFUNC(Events,triggerEvent);

private _vehicle = cursorTarget;

if(isNil "_vehicle" || {isNull _vehicle}) exitWith {};
if (!(_vehicle isKindOf "LandVehicle")) exitWith {
    if (isNil {_vehicle getVariable "unflipWarningShown"}) exitWith {
        [localize "STR_unflip_fail_header", localize "STR_unflip_fail_wrong_type"] call SCRT_fnc_misc_deniedHint;
        _vehicle setVariable ["unflipWarningShown", true];
    };
};

private _isAlive = alive _vehicle;
if !(alive _vehicle) exitWith {
    [localize "STR_unflip_fail_header", localize "STR_unflip_fail_veh_destroyed"] call SCRT_fnc_misc_deniedHint;
};

private _crew = crew _vehicle;
if !(_crew isEqualTo []) exitWith {
    [localize "STR_unflip_fail_header", localize "STR_unflip_fail_veh_occupied"] call SCRT_fnc_misc_deniedHint;
};

private _escape = false;
private _hasRepairConditions = false;

if((getMass _vehicle) > 10000) then {
    private _nearVehicles = nearestObjects [(position _vehicle),["Car", "Truck", "Tank"],50];
    //flippable vehicle is included too
    _nearVehicles deleteAt (_nearVehicles find _vehicle);
    if (_nearVehicles isEqualTo []) then {
        _escape = true;
    } else {
        if (_nearVehicles findIf {[_x] call HR_GRG_fnc_isRepairSource} != -1) then {
            _hasRepairConditions = true;
        };
    };
};

if (_escape) exitWith {
    [localize "STR_unflip_fail_header", localize "STR_unflip_fail_too_heavy"] call SCRT_fnc_misc_deniedHint;
};

private _nearFriendlies = (_vehicle nearEntities ["Man", 35]) select {side _x in [teamPlayer, civilian] && {[_x] call A3A_fnc_canFight}};
private _friendlyCount = count _nearFriendlies;
if (_friendlyCount < unflipPersonCount && {!_hasRepairConditions}) exitWith {
    [localize "STR_unflip_fail_header", format [localize "STR_unflip_fail_not_enough_people", str unflipPersonCount]] call SCRT_fnc_misc_deniedHint;
};

(_vehicle call BIS_fnc_getPitchBank) params ["_vx","_vy"];
if (([_vx,_vy] findIf {_x > 80 || _x < -80}) != -1) then {	
	[_vehicle] spawn {
        params ["_unflippableVehicle"];
        _unflippableVehicle allowDamage false;
        _unflippableVehicle setVectorUp [0,0,1];
        _unflippableVehicle setPosATL [(getPosATL _unflippableVehicle) select 0, (getPosATL _unflippableVehicle) select 1, 0];
        sleep 1;
        _unflippableVehicle allowDamage true;
        terminate _thisScript;
	};
};

playSound "A3AP_UiSuccess";
_vehicle setVariable ["unflipWarningShown", nil];

/*
    Performs a paradrop with the given group and vehicle

Arguments:
    <OBJECT> The vehicle from which the drop will be performed
    <GROUP> The group that will jump and perform the drop (NOT THE PILOTS!)
    <MARKER> OR <POSITION> The designated target
    <MARKER> The origin location this vehicle is coming from
    (OPTIONAL) <BOOL> If this drop is there to reinforce (default false)

Return Value:
    <NIL>

Scope: Server/HC
Environment: Scheduled
Public: Yes
Dependencies:
    NONE

Example:
[_myPlane, _ODSTgroup, _targetPos, "CSAT_Carrier"] call SCRT_fnc_common_paradropVehicle;
*/

#include "..\defines.inc"
FIX_LINE_NUMBERS()

params
[
    ["_plane", objNull, [objNull]],
    ["_groupJumper", grpNull, [grpNull]],
    ["_target", "", ["", []]],
    ["_originMarker", "", [""]],
    ["_resPool", nil, [""]]
];

private _vehType = typeOf _plane;

private _groupPilot = group driver _plane;
{
    _x disableAI "TARGET";
    _x disableAI "AUTOTARGET";
    _x setBehaviour "CARELESS";
} foreach (units _groupPilot);

{
    _x setVariable ["jumpSave_Backpack", backpack _x];
    _x setVariable ["jumpSave_BackpackItems", backpackItems _x];
    removebackpack _x;
} forEach (units _groupJumper);

private _targetPosition = if(_target isEqualType "") then {getMarkerPos _target} else {_target};
private _originPosition = getMarkerPos _originMarker;

private _entryDistance = 350;
_plane flyInHeight 250;
_plane setCollisionLight false;
_plane setDir (_originPosition getDir _targetPosition);
_plane setVelocityModelSpace [0, 100, 0];

private _normalAngle = (_originPosition getDir _targetPosition);
private _attackAngle = (random 120) - 60;
private _entryPos = [];
while {true} do {
    _entryPos = _targetPosition getPos [_entryDistance, (_normalAngle - 180) - _attackAngle];
    if(!surfaceIsWater _entryPos) exitWith {};
    _attackAngle = (random 120) - 60;
};
private _exitPos = _targetPosition getPos [_entryDistance, _normalAngle + _attackAngle];

{
    _x set [2, 250];
} forEach [_entryPos, _exitPos, _originPosition];

private _wp = _groupPilot addWaypoint [_entryPos, -1];
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "NORMAL";
_wp setWaypointStatements ["true", "if !(local this) exitWith {}; (vehicle this) setVariable ['dropPosReached', true];"];

private _wp1 = _groupPilot addWaypoint [_exitPos, -1];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointSpeed "NORMAL";


waitUntil {sleep 1; (_plane getVariable ["dropPosReached", false]) || {!alive _plane || {!canMove _plane}}};

if(_plane getVariable ["dropPosReached", false] && {!(_plane getVariable ["planeDead", false])}) then {
    Debug("Drop pos reached");
    _plane setCollisionLight true;
    {
        unAssignVehicle _x;
        //Move them into alternating left/right positions, so their parachutes are less likely to kill each other
        private _pos = if (_forEachIndex % 2 == 0) then {_plane modeltoWorld [7, -20, -5]} else {_plane modeltoWorld [-7, -20, -5]};
        _x setPos _pos;
        _x spawn {
            waitUntil {sleep 0.25; ((getPos _this) select 2) < 150};
            _this addBackpack "B_Parachute";
            waitUntil { sleep 0.05; isTouchingGround _this};
            _this addBackpack (_this getVariable "jumpSave_Backpack");
            {
                _this addItemToBackpack _x;
            } forEach (_this getVariable "jumpSave_BackpackItems");
        };
        sleep 0.25;
  	} forEach units _groupJumper;
    
    private _side = side _plane;
    private _faction = Faction(_side);

    private _dir = getDir _plane;
    private _initialPos = (getPos _plane) vectorAdd [0, 0, -6.5];
    private _apcClass =  selectRandomWeighted (_faction get "vehiclesAirborne");

    private _apcData = [_initialPos, _dir, _apcClass, _side] call A3A_fnc_spawnVehicle;
    private _apc = _apcData select 0;
	private _apcCrew = _apcData select 1;
	private _apcGroup = _apcData select 2;

    _plane setVariable ["apc", _apc, true]; //broadcast in case of HC

    {
        _x disableAI "TARGET";
        _x disableAI "AUTOTARGET";
    } forEach _apcCrew;

    [_apc, _side, _resPool] call A3A_fnc_AIVEHinit;

    [_apc, _plane, _groupJumper, _targetPosition, _apcCrew, _apcGroup] spawn {
        params ["_apc", "_plane", "_groupJumper", "_targetPosition", "_apcCrew", "_apcGroup"];

        waitUntil {((getPos _apc) select 2) < 150};

        private _parachute = createVehicle ["B_Parachute_02_F", [0,0,0], [], 0, "NONE"];
        _parachute setDir getDir _apc;
        _parachute setPos getPos _apc;
        _apc attachTo [_parachute, [0, 0, 1.5]];  

        [_parachute, _apc] spawn {
            params ["_parachute", "_apc"];

            while {((position _apc) select 2) > 2 && {!(isNull _parachute)}} do {
                sleep 1;
                (_apc call BIS_fnc_getPitchBank) params ["_vx","_vy"];
                if (([_vx,_vy] findIf {_x > 80 || {_x < -80}}) != -1) then {	
                    _parachute setVectorUp [0,0,1];
                    _apc setVectorUp [0,0,1];
                };
            };
        };

        waitUntil {
            sleep 0.01;
            ((position _apc) select 2) < 2 
            || {isNull _parachute
            || {(count (lineIntersectsWith [getPosASL _apc, (getPosASL _apc) vectorAdd [0, 0, -0.5], _apc, _parachute])) > 0 }}
        };

        _parachute disableCollisionWith _apc;
        _apc setVectorUp [0,0,1];
        _apc setVelocity [0,0,0];
        detach _apc;    
        if (!isNull _parachute) then {deleteVehicle _parachute};

        {
            _x enableAI "TARGET";
            _x enableAI "AUTOTARGET";
        } forEach _apcCrew;

        [_apc] call A3A_fnc_smokeCoverAuto;
        
        {
            unassignVehicle _x;
            _x assignAsCargo _apc;
        } forEach units _groupJumper; //some sort of check is needed to stop apc waiting endlessly for jumper group and make it start moving immediately

        private _apcLeader = leader _apcGroup;
        (units _apcGroup) joinSilent _groupJumper;
        _groupJumper selectLeader _apcLeader;

        private _posLeader = position ((units _groupJumper) select 0);
        _posLeader set [2,0];

        private _wp1 = _groupJumper addWaypoint [_targetPosition, 10];
        _wp1 setWaypointType "MOVE";
        _wp1 setWaypointBehaviour "AWARE";
        _wp1 setWaypointSpeed "FULL";
        private _wp2 = _groupJumper addWaypoint [_targetPosition, 50];
        _wp2 setWaypointType "SAD";
        _wp2 setWaypointCombatMode "RED";
        _wp2 setWaypointSpeed "FULL";
        _wp2 setWaypointBehaviour "COMBAT";
        _groupJumper spawn A3A_fnc_attackDrillAI;
    };
};

private _weapons = count weapons _helicopter;
private _driverturret = _helicopter weaponsTurret [0];
private _gunnerturret = _helicopter weaponsTurret [-1];
private _weaponsturret = count _driverturret + count _gunnerturret;

if (_vehType in FactionGet(all,"vehiclesTransportAir") && _weapons > 2 || _weaponsturret > 2) exitWith { //assuming first 2 are laserdesignator and flares
    [_helicopter, _crewGroup, _posDestination] spawn A3A_fnc_attackHeli;
};

if (_vehType in FactionGet(all,"vehiclesHelisAttack") + FactionGet(all,"vehiclesHelisLightAttack")) exitWith {
    [_plane, _groupPilot, _targetPosition] spawn A3A_fnc_attackHeli
};

private _wp2 = _groupPilot addWaypoint [_originPosition, -1];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointSpeed "FULL";
_wp2 setWaypointStatements ["true", "if !(local this) exitWith {}; deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];

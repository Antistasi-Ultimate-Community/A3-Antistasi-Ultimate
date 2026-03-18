/*
    common_paradropVehicle

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

private _dropPos = _targetPosition;
for "_i" from 1 to 10 do {
    private _testPos = _targetPosition getPos [random 150 + 150, random 360];
    if !(surfaceIsWater _testPos) exitWith { _dropPos = _testPos };
};
Debug_1("Paradrop: Target position %1, Drop position %2", _targetPosition, _dropPos);

private _entryDistance = 350;
_plane flyInHeight 250;
_plane setCollisionLight false;
_plane setDir (_originPosition getDir _dropPos);
_plane setVelocityModelSpace [0, 100, 0];

private _normalAngle = (_originPosition getDir _dropPos);
private _attackAngle = (random 120) - 60;
private _entryPos = [];

while {true} do {
    _entryPos = _dropPos getPos [_entryDistance, (_normalAngle - 180) - _attackAngle];
    if(!surfaceIsWater _entryPos) exitWith {};
    _attackAngle = (random 120) - 60;
};
private _exitPos = _dropPos getPos [_entryDistance, _normalAngle + _attackAngle];

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

[_plane, _dropPos, _vehType in FactionGet(all,"vehiclesTransportAir")] call A3A_fnc_approachSpeedControl;

[_plane, _dropPos] spawn {
    params ["_plane", "_dropPos"];
    waitUntil {sleep 1; (_plane distance2D _dropPos) < 800};
    while {_plane distance2D _dropPos > 675} do {
        [_plane, 0.3] call A3A_fnc_fireCMFlare;
    };
};

if(canMove _plane || alive (driver _plane)) then {
    [_plane, "open"] spawn A3A_fnc_HeliDoors;
    sleep 0.25;
};

waitUntil {sleep 1; (_plane getVariable ["dropPosReached", false]) || {!alive _plane || {!canMove _plane}}};
if !(alive _plane) exitWith {};

if(_plane getVariable ["dropPosReached", false] && {!(_plane getVariable ["planeDead", false])}) then {
    Debug("Drop pos reached");
    _plane setCollisionLight true;
    
    private _side = side _plane;
    private _faction = Faction(_side);

    private _dir = getDir _plane;
    private _initialPos = (getPos _plane) vectorAdd [0, 0, -6.5];
    private _apcClass = selectRandom (_faction get "vehiclesAirborne");

    private _apcData = [_initialPos, _dir, _apcClass, _side] call A3A_fnc_spawnVehicle;
    private _apc = _apcData select 0;
    private _apcCrew = _apcData select 1;
    private _apcGroup = _apcData select 2;

    private _planeVelocity = velocity _plane;
    private _troopVelocity = [(_planeVelocity select 0) * 0.2, (_planeVelocity select 1) * 0.2, -1];
    _apc setVelocity [(_planeVelocity select 0) * 0.2, (_planeVelocity select 1) * 0.2, -1];

    _plane setVariable ["apc", _apc, true]; // broadcast in case of HC

    {
        _x disableAI "TARGET";
        _x disableAI "AUTOTARGET";
    } forEach _apcCrew;

    [_apc, _side, _resPool] call A3A_fnc_AIVEHinit;

    [_apc, _plane, _groupJumper, _dropPos, _apcCrew, _apcGroup] spawn {
        params ["_apc", "_plane", "_groupJumper", "_targetPos", "_apcCrew", "_apcGroup"];

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

        private _startTime = time;
        waitUntil {
            sleep 0.01;
            (time - _startTime > 30) 
            || ((position _apc) select 2) < 2 
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
        } forEach units _groupJumper;

        private _apcLeader = leader _apcGroup;
        (units _apcGroup) joinSilent _groupJumper;
        _groupJumper selectLeader _apcLeader;

        private _posLeader = position ((units _groupJumper) select 0);
        _posLeader set [2,0];

        private _wp1 = _groupJumper addWaypoint [_targetPos, 10];
        _wp1 setWaypointType "MOVE";
        _wp1 setWaypointBehaviour "AWARE";
        _wp1 setWaypointSpeed "FULL";
        private _wp2 = _groupJumper addWaypoint [_targetPos, 50];
        _wp2 setWaypointType "SAD";
        _wp2 setWaypointCombatMode "RED";
        _wp2 setWaypointSpeed "FULL";
        _wp2 setWaypointBehaviour "COMBAT";
        _groupJumper spawn A3A_fnc_attackDrillAI;
    };

    sleep 1;

    {
        unassignVehicle _x;
        //Move them into alternating left/right positions, so their parachutes are less likely to kill each other
        private _sideOffset = [1, -1] select (_forEachIndex % 2 == 0);
        private _pos = _plane modelToWorld [7 * _sideOffset, -20, -5];
        _x setPosASL (AGLtoASL _pos);
        _x setVelocity _troopVelocity;

        removeBackpack _x;

        _x spawn {
            params ["_unit"];

            sleep (getPosATL _unit # 2 / 70);      // can't fall faster than that, save some checks
            waitUntil {sleep 0.25; getPosATL _unit # 2 < 120};

            _unit addBackpack "B_Parachute";
            if !("lowTech" in A3A_factionEquipFlags) then {
                if !(disableAutoSmokeCover) then {
                    private _smokeGrenade = selectRandom allSmokeGrenades;
                    private _smoke = _smokeGrenade createVehicle (getPosATL _unit);
                    _smoke attachTo [_unit, [0,0,0]];
                    _unit setVariable ["jumpSave_Smoke", _smoke];
                };
            };

            private _startLand = time;
            waitUntil {
                sleep 0.5;
                isTouchingGround _unit || (time - _startLand > 30)
            };

            private _smoke = _unit getVariable "jumpSave_Smoke";
            if (!isNil "_smoke") then {
                detach _smoke;
            };

            removeBackpack _unit;

            private _oldBackpack = _unit getVariable "jumpSave_Backpack";
            private _oldItems = _unit getVariable "jumpSave_BackpackItems";
            if (_oldBackpack != "") then {
                _unit addBackpack _oldBackpack;
                {
                    _unit addItemToBackpack _x;
                } forEach _oldItems;
            };
        };
        sleep 0.35;
    } forEach units _groupJumper;

    [_plane, _exitPos] spawn {
        params ["_plane", "_exitPos"];
        sleep 2;
        while {_plane distance2D _exitPos > 100 && alive _plane && canMove _plane && _plane distance2D _exitPos < 500} do {
            [_plane, 0.3] call A3A_fnc_fireCMFlare;
        };
        if(canMove _plane || alive (driver _plane)) then {
            [_plane, "close"] spawn A3A_fnc_HeliDoors;
        };
    };
};

_plane limitSpeed (2 * getNumber(configOf _plane >> "maxSpeed"));	// remove the limit

if ([_plane, _groupPilot, _targetPosition] call A3A_fnc_checkAndSpawnAttack) exitWith {};

private _wp2 = _groupPilot addWaypoint [_originPosition, -1];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointSpeed "FULL";
_wp2 setWaypointStatements ["true", "if !(local this) exitWith {}; deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];

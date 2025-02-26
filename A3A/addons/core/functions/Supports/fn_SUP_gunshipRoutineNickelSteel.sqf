#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_suppData", "_side", "_oppositeSide", "_faction", "_vehType","_resPool", "_airport", "_sleepTime", "_reveal"];
_suppData params ["_supportName", "_side", "_suppType", "_suppCenter", "_suppRadius", "_suppTarget"];
/* while {_sleepTime > 0} do
{
    sleep 1;
    _sleepTime = _sleepTime - 1;
    if((spawner getVariable _airport) != 2) exitWith {};
}; */

private _gunshipData = [_side, _airport, _supportName, _vehType, _suppTarget, _resPool, _suppCenter, _faction get "unitPilot"] call A3A_fnc_SUP_gunshipSpawn;
_gunshipData params ["_gunship", "_strikeGroup"];

private _crew = objNull;

private _mainGunner = objNull;
private _heavyGunner = objNull;

for "_i" from 1 to 2 do {
    _crew = [_strikeGroup, _faction get "unitPilot", getPos _gunship] call A3A_fnc_createUnit;
    if(_i == 1) then {
        _crew moveInTurret [_gunship, [1]];
        _mainGunner = _crew;
    } else {
        _crew moveInTurret [_gunship, [2]];
        _heavyGunner = _crew;
    };
};

_gunship addEventHandler
[
    "Fired",
    {
        params ["_gunship", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

        private _target = _gunship getVariable ["currentTarget", objNull];
        if(_target isEqualTo objNull) exitWith {}; //what?

        if(_target isEqualType objNull) then
        {
            _target = getPosASL _target;
        };
        if(_weapon == "vn_gunpod_twin_gau4" || _weapon == "vn_gunpod_gau2") then ///probably delete this check and pretend that every maingun on every gunship is the same
        {
            _target = (_target vectorAdd [0,0,20]) apply {_x + (random 10) - 5};
            private _speed = (speed _projectile)/3.6;
            private _dir = vectorNormalized (_target vectorDiff (getPosASL _projectile));
            _projectile setVelocity (_dir vectorMultiply _speed);
            _projectile setVectorDir _dir;
        };
    }
];

/* private _targetList = server getVariable [format ["%1_targets", _supportName], []];
private _reveal = _targetList select 0 select 1; */

private _supportMarker = format ["%1_coverage", _supportName];
/* private _supportPos = getMarkerPos _supportMarker;

private _textMarker = createMarker [format ["%1_text", _supportName], _suppCenter];
_textMarker setMarkerShape "ICON";
_textMarker setMarkerType "mil_dot";
_textMarker setMarkerText "Gunship";
_textMarker setMarkerColor colorOccupants;
_textMarker setMarkerAlpha 0;
//[_reveal, _suppCenter, Invaders, "GUNSHIP", format ["%1_coverage", _supportName], _textMarker] spawn A3A_fnc_showInterceptedSupportCall;
private _delay = selectRandom [-1,1];
if (_delay < 0) then { _delay = (0.5 + random 1) * (450 - 15*tierWar - 1*_aggro) };
[_reveal, _side, "GUNSHIP", _suppCenter, _delay] spawn A3A_fnc_showInterceptedSetupCall; */

waitUntil
{
    sleep 1;
    (isNull _gunship) ||
    {!(alive _gunship) ||
    (_gunship getVariable ["InArea", false])}
};
sleep 20; //maybe more to get plane in to the position
if !(_gunship getVariable ["InArea", false]) exitWith
{
    Debug_1("%1 has been destroyed before reaching the area", _supportName);
    //Gunship destroyed before reaching the area
	[_gunship] spawn A3A_fnc_vehDespawner;
};

_gunship setVariable ["IsActive", true];

//Define the belts used against targets, true means HE round, false means AP round
private _antiInfBelt = [true, true, true];
private _antiLightVehicleBelt = [true, false, true];
private _antiAPCBelt = [false, true, false];
private _antiTankBelt = [false, false, false];

private _mainGunnerList = [];
[_gunship, _mainGunnerList, _mainGunner, _supportName] spawn
{
    #include "..\..\script_component.hpp"
    FIX_LINE_NUMBERS()
    params ["_gunship", "_mainGunnerList", "_mainGunner", "_supportName"];

    private _fnc_executeFireOrder =
    {
        Debug_1("Fireorder %1 recieved", _this);
        params ["_gunner", "_target", "_gunshots", "_belt", "_rocketShots"];
        private _gunship = vehicle _gunner;
        private _steps = _gunshots max _rocketShots;

        //Calculate used ammo
        private _rocketsLeft = _gunship getVariable ["Rockets", 0];
        _rocketsLeft = _rocketsLeft - _rocketShots;
        if(_rocketsLeft <= 0) then {_gunship setVariable ["OutOfAmmo", true]};
        _gunship setVariable ["Rockets", _rocketsLeft];

        private _HEUsed = {_x} count _belt;
        private _APUsed = 3 - _HEUsed;

        private _APLeft = _gunship getVariable ["AP_Ammo", 0];
        _APLeft = _APLeft - ((_APUsed/3) * _gunshots);
        _gunship setVariable ["AP_Ammo", _APLeft];

        private _HELeft = _gunship getVariable ["HE_Ammo", 0];
        _HELeft = _HELeft - ((_HEUsed/3) * _gunshots);
        _gunship setVariable ["HE_Ammo", _HELeft];

        if(_HELeft <= 0 || _APLeft <= 0) then
        {
            _gunship setVariable ["OutOfAmmo", true];
        };

        _gunship setVariable ["currentTarget", _target];

        _gunner reveal [_target, 3];
        _gunner doTarget _target;
        _gunner doWatch _target;
		[_gunship, "vn_v_launcher_mk24"] call BIS_fnc_fire;

        //Simulate targeting time (cause the fucking AI does not targets for real)
        sleep 0.3;

        for "_i" from 1 to _steps do
        {
            if(_gunshots > 0) then
            {
                private _muzzle = if(_belt select ((_i - 1) % 3)) then {"HE"} else {"AP"};
                _gunner forceWeaponFire [_muzzle, "close"];
                _gunshots = _gunshots - 1;
            };
            if(_rocketShots > 0) then
            {
                _gunner forceWeaponFire ["rockets_Skyfire", "Burst"];
                _rocketShots = _rocketShots - 1;
            };
            sleep 0.1;
        };
        _gunner doTarget objNull;
        _gunner doWatch objNull;
        _gunship setVariable ["currentTarget", nil];
    };

    while {_gunship getVariable ["IsActive", false]} do
    {
        if(isNull (_gunship getVariable ["currentTarget", objNull])) then
        {
            //Currently not firing
            private _targetList = server getVariable [format ["%1_targets", _supportName], []];
            if(count _targetList > 0) then
            {
                Debug("Gunship | Using priority list");
                //Priority target, execute first
                private _target = _targetList#0#0#0;
                private _supportMarker = format ["%1_coverage", _supportName];
                if
                (
                    ((_target distance2D (getMarkerPos _supportMarker)) < 350) &&
                    {(_target isKindOf "Man" && {[_target] call A3A_fnc_canFight}) ||
                    {(_target isKindOf "AllVehicles") && (alive _target)}}
                ) then
                {
                    //Target active
                    if(_target isKindOf "LandVehicle") then
                    {
                        if(_target isKindOf "Tank") then
                        {
                            [_mainGunner, _target, 24, [false, false, false], 0] call _fnc_executeFireOrder;
                        }
                        else
                        {
                            [_mainGunner, _target, 24, [false, true, false], 8] call _fnc_executeFireOrder;
                        };
                    }
                    else
                    {
                        [_mainGunner, _target, 24, [true, true, true], 4] call _fnc_executeFireOrder;
                    };
                }
                else
                {
                    //Target eliminated, remove from list
                    _targetList deleteAt 0;
                    server setVariable [format ["%1_targets", _supportName], _targetList, true];
                };
            }
            else
            {
                if(count _mainGunnerList > 0) then
                {
                    Debug("Gunship | Using target list");
                    private _targetParams = _mainGunnerList deleteAt 0;
                    _targetParams params ["_target", "_gunshots", "_belt", "_rocketShots"];
                    if
                    (
                        (_target isKindOf "Man" && {[_target] call A3A_fnc_canFight}) ||
                        {_target isKindOf "AllVehicles" && (alive _target)}
                    ) then
                    {
                        [_mainGunner, _target, _gunshots, _belt, _rocketShots] call _fnc_executeFireOrder;
                    };
                }
                else
                {
                    _gunship setVariable ["CurrentlyFiring", false];
                };
            };
        };
        sleep 1;
    };
};
///"vn_gunpod_twin_gau4" gau-4 3000 ammo
///"vn_gunpod_gau2" gau-2 14000 ammo
///"SEARCHLIGHT" search light
///"vn_v_launcher_mk24" fire flares when found new target
_gunship setVariable ["AP_Ammo", 14000]; //change variables later
_gunship setVariable ["HE_Ammo", 14000]; //change variables later
_gunship setVariable ["Rockets", 3000]; //delete this one

private _supportMarker = format ["%1_coverage", _supportName];
_gunship turretUnit [1] action ["SearchLightOn", _gunship];
_strikeGroup setCombatMode "YELLOW";  ///seemengly doesn't want to fire without it(i.e. with "blue" combat mode)

private _lifeTime = 400;
while {_lifeTime > 0} do
{
    if
    (
        isNull (_gunship getVariable ["currentTarget", objNull])
    ) then
    ///if !(_gunship getVariable ["CurrentlyFiring", false]) then
    {
        private _targets = _suppCenter nearEntities [["Man", "LandVehicle", "Helicopter", "Plane", "Ship"], 600];
        _targets = _targets select
        {
            if(_x isKindOf "Man") then
            {
                ((side group _x) in [teamPlayer, _oppositeSide]) && {[_x] call A3A_fnc_canFight}
            }
            else
            {
                (alive _x) && {(_x getVariable ["ownerSide", sideUnknown]) in [teamPlayer, _oppositeSide] || {(side group driver _x) in [teamPlayer, _oppositeSide]}} ////don't forget to change it to _oppositeSide or something
            }
        };
        Debug_2("%1 found %2 targets in its area", _supportName, count _targets);

        if(count _targets > 0) then
        {
            {
                private _target = _x;
                if(_target isKindOf "Helicopter") then
                {
                    //Fast moving helicopter, use minigun against it
                    _mainGunnerList pushBack [_target, 12, _antiLightVehicleBelt, 0];
                }
                else
                {
                    if(_target isKindOf "Plane" && (isTouchingGround _target)) then
                    {
                        //parked or grounded plane, use minigun against it
                        _mainGunnerList pushBack [_target, 12, _antiLightVehicleBelt, 0];
                    }
                    else
                    {
                        if(_target isKindOf "LandVehicle") then
                        {
                            if(_target isKindOf "Tank") then
                            {
                                //MBT, breach with AP ammo
                                _mainGunnerList pushBack [_target, 24, _antiTankBelt, 0];
                            }
                            else
                            {
                                if(_target in FactionGet(all,"vehiclesAPCs")) then
                                {
                                    //APC, use mainly AP and rarely rockets
                                    _mainGunnerList pushBack [_target, 18, _antiAPCBelt, 4];
                                }
                                else
                                {
                                    //Any kind of light vehicle, destroy with rockets and mixed belt
                                    _mainGunnerList pushBack [_target, 12, _antiLightVehicleBelt, 8];
                                };
                            };
                        }
                        else
                        {
                            if(_target isKindOf "Ship") then
                            {
                                //boat,probably light,use rockets and mixed belt
                                _mainGunnerList pushBack [_target, 12, _antiLightVehicleBelt, 0];
                            }
                            else
                            {
                                //Infantry, if crowded use rockets too
                                private _nearUnits = _targets select {(_x isKindOf "Man") && ([_x] call A3A_fnc_canFight) && {(_x distanceSqr _target) < 100}};
                                private _rockets = 0;
                                if(count _nearUnits > 2) then {_rockets = 4};
                                _mainGunnerList pushBack [_target, 6, _antiInfBelt, _rockets];
                            };
                        };
                    }; 
                };
            } forEach _targets;
            _gunship setVariable ["CurrentlyFiring", true];
        };
    };


    //No ammo left
    if(_gunship getVariable ["OutOfAmmo", false]) exitWith
    {
        Info_1("%1 run out of ammo, returning to base", _supportName);
        _gunship setVariable ["currentTarget", objNull];
    };

    //Retreating
    if(_gunship getVariable ["Retreat", false]) exitWith
    {
        Info_1("%1 met heavy resistance, retreating", _supportName);
        _gunship setVariable ["currentTarget", objNull];
    };

    //Gunship died
    if !(alive _gunship) then
    {
        Info_1("%1 has been destroyed while in the area", _supportName);
        _gunship setVariable ["currentTarget", objNull];
    };

    sleep 10;
    _lifeTime = _lifeTime - 10;
};

_gunship setVariable ["IsActive", false];

//Have the plane fly back home
if (alive _gunship) then
{
    private _wpBase = _strikeGroup addWaypoint [(getMarkerPos _airport) vectorAdd [0, 0, 1000], 0];
    _wpBase setWaypointType "MOVE";
    _wpBase setWaypointBehaviour "CARELESS";
    _wpBase setWaypointSpeed "FULL";
    _wpBase setWaypointStatements ["true", "if !(local this) exitWith {}; deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];
    _strikeGroup setCurrentWaypoint _wpBase;
    _gunship flyInHeight 1000;

    waitUntil {!(alive _gunship) || ((getMarkerPos _airport) distance2D _gunship) < 100};
    if(alive _gunship) then
    {
        [_gunship] spawn A3A_fnc_vehDespawner;
    };
};
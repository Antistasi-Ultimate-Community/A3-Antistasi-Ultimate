params ["_side", "_airport", "_supportName", "_plane", "_supportObj", "_resPool", "_supportPos", "_pilotType"];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
//No runway on this airport, use airport position
//Not sure if I should go with 150 or 1000 here, players might be only 1001 meters away
//While technically 1000 meter height is technically visible from a greater distance
//150 is more likely to be in the actual viewcone of a player
private _spawnPos = (getMarkerPos _airport);
private _strikePlane = createVehicle [_plane, _spawnPos, [], 0, "FLY"];
[_strikePlane, _side] call A3A_fnc_AIVEHInit; ///maybe a bad idea, if something breaks delete it
private _startDir = _spawnPos getDir _supportPos;
_strikePlane setDir _startDir;

//Put it in the sky
_strikePlane setPosATL (_spawnPos vectorAdd [0, 0, 800]);
//Hide the hovering airplane from players view
_strikePlane setVelocityModelSpace [0, 150, 0];

#if __A3_DEBUG__
_strikePlane spawn {
    while {alive _this} do {
        sleep 1;
        private _localMarker = createMarkerLocal [format ["%1test%2", random 10000, random 10000], (position _this)];
        _localMarker setMarkerSizeLocal [1,1];
        _localMarker setMarkerAlpha 1; 
        _localMarker setMarkerTypeLocal "hd_dot";
        _localMarker setMarkerColorLocal "ColorRed";
    };

    private _localMarker = createMarkerLocal [format ["%1test%2", random 10000, random 10000], (position _this)];
    _localMarker setMarkerSizeLocal [1,1];
    _localMarker setMarkerAlpha 1; 
    _localMarker setMarkerTypeLocal "KIA";
    _localMarker setMarkerColorLocal "ColorRed";	
};
#endif

private _strikeGroup = createGroup _side;
private _pilot = [_strikeGroup, _pilotType, getPos _strikePlane] call A3A_fnc_createUnit;
_pilot moveInDriver _strikePlane;

_strikePlane disableAI "AUTOTARGET";
_strikeGroup setCombatMode "BLUE";

_strikePlane setVariable ["supportName", _supportName, true];

//Setting up the EH for support destruction
_strikePlane addEventHandler ["Killed", {
    params ["_strikePlane"];
    ["TaskSucceeded", ["", localize "STR_notifiers_gunship_killed"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
    [_strikePlane] spawn A3A_fnc_postMortem;
}];

_strikePlane addEventHandler ["IncomingMissile", {
    //Missile launch against this plane detected, attack if vehicle, send other support if manpads
    params ["_plane", "_ammo", "_vehicle"];
    if !(_vehicle isKindOf "Man") then {
        //Vehicle fired a missile against the plane, add to target list if ground, no warning for players as this is an internal decision of the pilot
        if(_vehicle isKindOf "Air") then {
            [group driver _plane, ["ASF", "SAM"], _vehicle] spawn A3A_fnc_callForSupport;
            _plane setVariable ["Retreat", true, true];
        } else {
            private _supportName = _plane getVariable "supportName";
            [_supportName, [_vehicle, 3], 0] spawn A3A_fnc_addSupportTarget;
        };
    };
}];

_strikePlane addEventHandler ["HandleDamage", {
    params ["_plane", "_selection", "_damage", "_vehicle", "_projectile"];
    //Check if bullet, we dont care about missiles, as these are handled above
    if(_projectile isKindOf "BulletCore") then {
        //Plane is getting hit by bullets, check if fired by unit or vehicle
        if(!(isNull (objectParent _vehicle)) || (_vehicle isKindOf "AllVehicles")) then {
            //Getting hit by a vehicle
            private _supportName = _plane getVariable "supportName";
            private _vehicle = if(_vehicle isKindOf "AllVehicles") then {_vehicle} else {objectParent _vehicle};
            if(_vehicle isKindOf "Air") then {
                //Vehicle is a plane or attack heli (or a lucky chopper), retreat, as no AA weapons on board
                [group driver _plane, ["ASF", "SAM"], _vehicle] spawn A3A_fnc_callForSupport;
                _plane setVariable ["Retreat", true];
            } else {
                if((getPos _vehicle) inArea (format ["%1_coverage", _supportName])) then {
                    //Vehicle is a ground based AA, add to attack list
                    [_supportName, [_vehicle, 3], 0] spawn A3A_fnc_addSupportTarget;
                } else {
                    //Vehicle is outside of radius, call in other support
                    [group driver _plane, ["CAS", "CASDIVE", "CRUISEMISSILE", "CANNON", "CARPETBOMB", "MORTAR", "HOWITZER"], _vehicle] spawn A3A_fnc_callForSupport;
                };
            };
        };
    };
    if(damage _plane > 0.5) then {
        _plane setVariable ["Retreat", true];
    };
    nil; //HandleDamage must return Nothing for damage to apply normally.
}];

_strikeGroup deleteGroupWhenEmpty true;

//Calculate loiter entry point
private _distance = _strikePlane distance2D _supportPos;
private _angle = asin (1500/_distance);
private _lenght = cos (_angle) * _distance;
Debug_3("Distance %1 Length %2 Angle %3", _distance, _lenght, _angle);
private _height = (ATLToASL _supportPos) select 2;
_height = _height + 600;
//Sets minimal height in relation to ground
/* if (_strikePlane isKindOf "USAF_AC130U_base") then {
    _strikePlane flyInHeight 700; ///cause this is stupid, stupid plane (not tested)
} else {
    _strikePlane flyInHeight 600; /// fly higher or fly lower ?
}; */
switch (true) do
{
	case (_strikePlane isKindOf "VTOL_01_armed_base_F"): {_strikePlane flyInHeight 600;};
	case (_strikePlane isKindOf "vnx_air_c119_base"): {_strikePlane flyInHeight 500;};
    case (_strikePlane isKindOf "USAF_AC130U_base"): {_strikePlane flyInHeight 700;};
    case (_strikePlane isKindOf "OPTRE_Pelican_F"): {_strikePlane flyInHeight 500;};
    case (_strikePlane isKindOf "ls_hmp_base"): {_strikePlane flyInHeight 500;};
    case (_strikePlane isKindOf "3AS_HMP_Base"): {_strikePlane flyInHeight 500;};
    case (_strikePlane isKindOf "3AS_laat_Base"): {_strikePlane flyInHeight 500;};
    case (_strikePlane isKindOf "UK3CB_AC47_Base"): {_strikePlane flyInHeight 500;};
	default {_strikePlane flyInHeight 600;};
};
private _entryPos = _spawnPos getPos [_lenght, _startDir + _angle];
Debug_1("Entry Pos: %1", _entryPos);
_entryPos set [2, _height];
private _entryPoint = _strikeGroup addWaypoint [_entryPos, 0, 1];
_entryPoint setWaypointType "MOVE";
_entryPoint setWaypointSpeed "FULL";
_entryPoint setWaypointBehaviour "CARELESS"; ///Might break something
_entryPoint setWaypointStatements ["true", "(vehicle this) setVariable ['InArea', true];"];
private _loiterWP = _strikeGroup addWaypoint [_supportPos, 0, 2];
_loiterWP setWaypointType "LOITER";
_loiterWP setWaypointLoiterType "CIRCLE_L";
_loiterWP setWaypointBehaviour "CARELESS"; ///Might break something
_loiterWP setWaypointSpeed "NORMAL"; ///maybe "LIMITED"

/* if (_strikePlane isKindOf "USAF_AC130U_base") then {
    _loiterWP setWaypointLoiterRadius 900; ///cause this is stupid, stupid plane (not tested)
} else {
    _loiterWP setWaypointLoiterRadius 800; /// big or small?
}; */
switch (true) do
{
	case (_strikePlane isKindOf "VTOL_01_armed_base_F"): {_loiterWP setWaypointLoiterRadius 800;};
	case (_strikePlane isKindOf "vnx_air_c119_base"): {_loiterWP setWaypointLoiterRadius 700;};
    case (_strikePlane isKindOf "USAF_AC130U_base"): {_loiterWP setWaypointLoiterRadius 900;};
    case (_strikePlane isKindOf "OPTRE_Pelican_F"): {_loiterWP setWaypointLoiterRadius 700;};
    case (_strikePlane isKindOf "ls_hmp_base"): {_loiterWP setWaypointLoiterRadius 700;};
    case (_strikePlane isKindOf "3AS_HMP_Base"): {_loiterWP setWaypointLoiterRadius 700;};
    case (_strikePlane isKindOf "3AS_laat_Base"): {_loiterWP setWaypointLoiterRadius 700;};
    case (_strikePlane isKindOf "UK3CB_AC47_Base"): {_loiterWP setWaypointLoiterRadius 700;};
	default {_loiterWP setWaypointLoiterRadius 800;};
};
_strikePlane setDir (_startDir + _angle);
[_strikePlane, _strikeGroup];
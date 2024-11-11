/*  Create the logic for attacking units, how different units should attack and behave

    Execution on: HC or Server

    Scope: Internal

    Parameters:
        _vehicle: OBJECT : The vehicle that gets the order
        _crewGroup: GROUP : The group of crew units of _vehicle
        _cargoGroup: GROUP : The group of cargo units of _vehicle, grpNull if none
        _posDestination: POSITION : The position of the target
        _markerOrigin: STRING : The marker from which the units are send
        _landPosBlacklist: ARRAY : A list of already blocked positions

    Returns:
        _landPosBlacklist: ARRAY : The updated list of blocked positions
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_vehicle", "_crewGroup", "_cargoGroup", "_posDestination", "_markerOrigin", "_landPosBlacklist", ["_isAirdrop", false], "_resPool"];

_vehicle setVehicleRadar 0;
_vehicle setVehicleReceiveRemoteTargets true;
_vehicle setVehicleReportRemoteTargets true;
_vehicle setVehicleReportOwnPosition true;

private _vehType = typeOf _vehicle;

private _vtol = "";

if (getNumber (configOf _vehicle >> "vtol") > 0 && _vehType in FactionGet(all,"vehiclesTransportAir")) then {
    _vtol = _vehType;
    _vehicle setVehicleRadar 1;
};

if (_vehicle isKindOf "Air" || typeOf _vehicle in (_faction get "vehiclesDropPod")) then
{
    if (_vehType in FactionGet(all,"vehiclesHelisTransport") + FactionGet(all,"vehiclesHelisLight") || _vtol != "" || (typeOf _vehicle in (_faction get "vehiclesDropPod"))) exitWith
    {
        //Transport helicopter or VTOL
        _landPos = [_posDestination, 200, 400, 10, 0, 0.12, 0, [], [[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;
        private _posOrigin = getMarkerPos _markerOrigin;
        _posOrigin set [2, 50];
        
        _landPosVTOL = [_posDestination, 300, 600, 10, 0, 0.12, 0, [], [[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;

        {
            if(_x distance2D _landPos < 20) exitWith { _landPos = [0, 0, 0] };
        } forEach _landPosBlacklist;
        
        if (typeOf _vehicle in (_faction get "vehiclesDropPod") ) exitWith {
            [_vehicle, _cargoGroup, _posDestination, _posOrigin] spawn A3A_fnc_OrbitalLanding; // , _crewGroup
        };
        {
            if(_x distance2D _landPosVTOL < 20) exitWith { _landPos = [0, 0, 0] };
        } forEach _landPosBlacklist;

        if !(_landPos isEqualTo [0,0,0]) then
        {
            if (_vtol != "") then {
                _landPosVTOL set [2, 0];
                _landPosBlacklist pushBack _landPosVTOL;
                private _roll = random 100;
					if(_roll >= 50) then {
						[_vehicle, _crewGroup, _cargoGroup, _posDestination, _posOrigin, _landPosVTOL] spawn A3A_fnc_combatLanding;
					} else {
                        if(_roll <= 30) then{
                            [_vehicle, _cargoGroup, _posDestination, _markerOrigin] spawn A3A_fnc_paradrop;
                        } else {
                            [_vehicle, _cargoGroup, _posDestination, _markerOrigin, _resPool] spawn SCRT_fnc_common_paradropVehicle;
                        };
					};
            } else {
                private _roll = random 100;
                _landPos set [2, 0];
                _landPosBlacklist pushBack _landPos;
                if(_roll >= 20) then {
				    [_vehicle, _crewGroup, _cargoGroup, _posDestination, _posOrigin, _landPos] spawn A3A_fnc_combatLanding;
			    } else {
                    [_vehicle, _cargoGroup, _posDestination, _posOrigin, _crewGroup] spawn A3A_fnc_fastrope;
			    };
            };
        }
        else
        {
            if (_vtol != "") then {
                private _roll = random 100;
				if(_roll >= 40) then {
					[_vehicle, _cargoGroup, _posDestination, _posOrigin, _crewGroup] spawn A3A_fnc_fastropeVTOL;
				} else {
                    if(_roll <= 30) then {
                        [_vehicle, _cargoGroup, _posDestination, _markerOrigin] spawn A3A_fnc_paradrop;
                    } else {
                        [_vehicle, _cargoGroup, _posDestination, _markerOrigin, _resPool] spawn SCRT_fnc_common_paradropVehicle;
                    };
				};
            } else {
                private _roll = random 100;
				if(_roll >= 35) then {
					[_vehicle, _cargoGroup, _posDestination, _posOrigin, _crewGroup] spawn A3A_fnc_fastrope;
				} else {
                    [_vehicle, _cargoGroup, _posDestination, _markerOrigin] spawn A3A_fnc_paradrop;
				};
            };
        };
    };
    if (_vehType in FactionGet(all,"vehiclesHelisAttack") + FactionGet(all,"vehiclesHelisLightAttack")) exitWith 
    {   //Attack helicopter
        _landPosAttackheli = [_posDestination, 400, 800, 10, 0, 0.12, 0, [], [[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;
        private _posOrigin = getMarkerPos _markerOrigin;
        _posOrigin set [2, 50];

        {
            if(_x distance2D _landPosAttackheli < 20) exitWith { _landPosAttackheli = [0, 0, 0] };
        } forEach _landPosBlacklist;

        if (count units _cargoGroup > 3) then {
            if !(_landPosAttackheli isEqualTo [0,0,0]) then
            {
                _landPosAttackheli set [2, 0];
                _landPosBlacklist pushBack _landPosAttackheli;
                [_vehicle, _crewGroup, _cargoGroup, _posDestination, _posOrigin, _landPosAttackheli] spawn A3A_fnc_combatLanding;
            }
            else
            {
                private _roll = random 100;
				if(_roll >= 20) then {
					[_vehicle, _cargoGroup, _posDestination, _posOrigin, _crewGroup] spawn A3A_fnc_fastrope;
				} else {
                    [_vehicle, _cargoGroup, _posDestination, _markerOrigin] spawn A3A_fnc_paradrop;
				};
            };
        } else {
            [_vehicle, _crewGroup, _posDestination] spawn A3A_fnc_attackHeli;
        };
    };
    if (_vehType in FactionGet(all,"vehiclesTransportAir") && {!(_vehicle isKindOf "Helicopter") && {_isAirdrop}}) exitWith 
    {
        //Dropship with para units and airdrop veh
        [_vehicle, _cargoGroup, _posDestination, _markerOrigin, _resPool] spawn SCRT_fnc_common_paradropVehicle;
    };
    if (_vehType in FactionGet(all,"vehiclesTransportAir")) exitWith
    {
        //Dropship with para units
        [_vehicle, _cargoGroup, _posDestination, _markerOrigin] spawn A3A_fnc_paradrop;
    };

    Error_1("Obsolete/unidentified vehicle type %1", _vehType);
    //Attack plane or drone - should be unused now?
    private _vehWP0 = _crewGroup addWaypoint [_posDestination, 0];
    _vehWP0 setWaypointBehaviour "COMBAT";
    _vehWP0 setWaypointType "SAD";
    _crewGroup setCombatMode "RED";

}
else            // ground vehicle
{
    private _typeName = call {
        if (_vehType in FactionGet(all,"vehiclesTanks")) exitWith {localize "STR_qrf_marker_tank"};
        if (_vehType in FactionGet(all,"vehiclesLightTanks")) exitWith {localize "STR_qrf_marker_light_tank"};
        if (_vehType in FactionGet(all,"vehiclesLightAPCs")) exitWith {localize "STR_qrf_marker_light_apc"};
        if (_vehType in FactionGet(all,"vehiclesAA")) exitWith {localize "STR_qrf_marker_aa"};
        if (_vehType in FactionGet(all,"vehiclesArtillery")) exitWith {localize "STR_qrf_marker_atillery"};
        if (_vehType in FactionGet(all,"vehiclesAirborne")) exitWith {localize "STR_qrf_marker_airborne"};
        if (_vehType in FactionGet(all,"vehiclesIFVs")) exitWith {localize "STR_qrf_marker_ifv"};
        if (_vehType in FactionGet(all,"vehiclesArmor") && unitIsUAV _vehicle) exitWith {localize "STR_qrf_marker_ugv"};
        if (_vehType in FactionGet(all,"vehiclesArmor"))  exitWith {localize "STR_qrf_marker_apc"};
        if (_vehType in FactionGet(all,"vehiclesTrucks")) exitWith {localize "STR_qrf_marker_truck"};
        localize "STR_qrf_marker_mrap";
    };

    if (isNull _cargoGroup) exitWith
    {
        // Vehicle has no passengers, just kill stuff
        {_x disableAI "MINEDETECTION"} forEach (units _crewGroup);
        _vehicle allowCrewInImmobile true;

        //Adding the waypoints
        [getPosATL _vehicle, _posDestination, _crewGroup] call A3A_fnc_WPCreate;

        // Turn final waypoint into SAD
        private _attackWP = [_crewGroup, count waypoints _crewGroup - 1];
        _attackWP setWaypointType "SAD";
        _attackWP setWaypointBehaviour "COMBAT";

        [_vehicle, _typeName] spawn A3A_fnc_inmuneConvoy;
    };

    if (isNull gunner _vehicle and count units _cargoGroup < 4) exitWith
    {
        // Vehicle has no weapons(?) and small cargo, merge crew group into cargo group
        (units _crewGroup) joinSilent _cargoGroup;
        deleteGroup _crewGroup;
        _cargoGroup selectLeader driver _vehicle;

        //Create the path waypoints
        private _landPos = [_posDestination, getPosATL _vehicle, false, _landPosBlacklist] call A3A_fnc_findSafeRoadToUnload;
        _landPosBlacklist pushBack _landPos;
        [getPosATL _vehicle, _landPos, _cargoGroup] call A3A_fnc_WPCreate;

        //Turn final waypoint into disembark. Should still be behaviour SAFE...
        private _dismountWP = [_cargoGroup, count waypoints _cargoGroup - 1];
        //_dismountWP setWaypointType "GETOUT";         // better to leave it as move? GETOUT is pretty busted
        _dismountWP setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) leaveVehicle (assignedVehicle this); (group this) spawn A3A_fnc_attackDrillAI"];

        private _attackWP = _cargoGroup addWaypoint [_posDestination, 0];
        _attackWP setWaypointBehaviour "AWARE";

        [_vehicle, _typeName] spawn A3A_fnc_inmuneConvoy;
    };

    if (count units _crewGroup == 1) exitWith
    {
        // driver + large cargo. Unload and RTB

        //Set up vehicle waypoints
        private _landPos = [_posDestination, getPosATL _vehicle, false, _landPosBlacklist] call A3A_fnc_findSafeRoadToUnload;
        _landPosBlacklist pushBack _landPos;
        [getPosATL _vehicle, _landPos, _crewGroup] call A3A_fnc_WPCreate;

        //Turn final waypoint into disembark. Should still be behaviour SAFE...
        private _vehWP0 = [_crewGroup, count waypoints _crewGroup - 1];
        _vehWP0 setWaypointType "TR UNLOAD";
        _vehWP0 setWaypointBehaviour "AWARE";
        _vehWP0 setWaypointStatements ["true", "if !(local this) exitWith {}; [group this] spawn A3A_fnc_enemyReturnToBase"];

        //Set the waypoints for cargoGroup
        private _cargoWP0 = _cargoGroup addWaypoint [_landpos, 0];
        //_cargoWP0 setWaypointType "GETOUT";
        _cargoWP0 setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) leaveVehicle (assignedVehicle this); (group this) spawn A3A_fnc_attackDrillAI"];
        private _cargoWP1 = _cargoGroup addWaypoint [_posDestination, 0];
        _cargoWP1 setWaypointBehaviour "AWARE";
        //Link the dismount waypoints
        _vehWP0 synchronizeWaypoint [_cargoWP0];

        [_vehicle, _typeName] spawn A3A_fnc_inmuneConvoy;
    };

    if (true) exitWith
    {
        // weapons + separate cargo units
        {_x disableAI "MINEDETECTION"} forEach (units _crewGroup);
        if (_vehType in FactionGet(all,"vehiclesArmor")) then { _vehicle allowCrewInImmobile true };

        //Set up vehicle waypoints
        private _landPos = [_posDestination, getPosATL _vehicle, false, _landPosBlacklist] call A3A_fnc_findSafeRoadToUnload;
        _landPosBlacklist pushBack _landPos;
        [getPosATL _vehicle, _landPos, _crewGroup] call A3A_fnc_WPCreate;

        //Turn final waypoint into disembark. Should still be behaviour SAFE...
        private _vehWP0 = [_crewGroup, count waypoints _crewGroup - 1];
        _vehWP0 setWaypointType "TR UNLOAD";
        _vehWP0 setWaypointBehaviour "AWARE";
        _vehWP0 setWaypointStatements ["true", "if !(local this) exitWith {}; [vehicle this] call A3A_fnc_smokeCoverAuto"];
        private _vehWP1 = _crewGroup addWaypoint [_posDestination, 0];
        _vehWP1 setWaypointType "SAD";
        _vehWP1 setWaypointBehaviour "COMBAT";

        //Set the waypoints for cargoGroup
        private _cargoWP0 = _cargoGroup addWaypoint [_landpos, 0];
        //_cargoWP0 setWaypointType "GETOUT";
        _cargoWP0 setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) leaveVehicle (assignedVehicle this); (group this) spawn A3A_fnc_attackDrillAI"];
        private _cargoWP1 = _cargoGroup addWaypoint [_posDestination, 0];
        _cargoWP1 setWaypointBehaviour "AWARE";
        //Link the dismount waypoints
        _vehWP0 synchronizeWaypoint [_cargoWP0];

        [_vehicle, _typeName] spawn A3A_fnc_inmuneConvoy;
    };
};

_landPosBlacklist;


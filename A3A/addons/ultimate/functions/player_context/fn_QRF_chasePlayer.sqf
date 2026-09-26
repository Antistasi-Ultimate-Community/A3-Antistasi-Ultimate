#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_QRF_chasePlayer

Description:
    Dispatches a targeted response force that actively tracks a specific 
    player. Overrides standard loitering behavior by continually updating the 
    strike team's waypoints to the target's real-time map coordinates until 
    the engagement concludes.

Parameters:
    0: _targetPlayer - The player object to be hunted <OBJECT>
    1: _factionStr - The attacking faction name ("Occupants" or "Invaders") <STRING>
    2: _qrfType - The deployment method ("LAND", "AIR", or "CAS") <STRING>

Optional:
    3: _adminOwner - The clientOwner ID of the admin who called it <NUMBER> (default: 2)

Example:
    (begin example)
    [[_targetPlayer, "Occupants", "CAS", clientOwner], "A3U_fnc_QRF_chasePlayer"] remoteExec ["A3A_fnc_scheduler", 2];
    (end example)

Returns:
    Nothing <ANY>

Environment:
    Server, Unscheduled

Author:
    Maxx
---------------------------------------------------------------------------- */

params ["_targetPlayer", "_factionStr", "_qrfType", ["_adminOwner", 2]];

[_targetPlayer, _factionStr, _qrfType, _adminOwner] spawn {
    params ["_targetPlayer", "_factionStr", "_qrfType", "_adminOwner"];

    if (isNull _targetPlayer || !alive _targetPlayer) exitWith {};

    private _side = if (_factionStr == "Occupants") then {Occupants} else {Invaders};
    private _targPos = getPosATL _targetPlayer;

    private _base = "";
    if (_qrfType == "LAND") then {
        _base = [_side, _targPos] call A3A_fnc_availableBasesLand;
    } else {
        _base = [_side, _targPos] call A3A_fnc_availableBasesAir;
    };

    if (isNil "_base" || {_base == ""}) exitWith {
        [localize "STR_A3AU_player_context_qrf_no_bases"] remoteExec ["A3U_fnc_context_notification", _adminOwner];
    };

    // -----------------------------------------------------------------------------
    // SPAWN GENERATION
    // -----------------------------------------------------------------------------
    private _vehCount = 2;
    private _attackCount = if (_qrfType == "CAS") then {2} else {0};
    private _resPool = "attack";

    private _data = [];
    if (_qrfType == "LAND") then {
        _data = [_side, _base, _targPos, _resPool, _vehCount, _attackCount] call A3A_fnc_createAttackForceLand;
    } else {
        _data = [_side, _base, _targPos, _resPool, _vehCount, _attackCount] call A3A_fnc_createAttackForceAir;
    };

    if (isNil "_data" || {count _data < 4}) exitWith {
        [localize "STR_A3AU_player_context_qrf_no_assets"] remoteExec ["A3U_fnc_context_notification", _adminOwner];
    };

    _data params ["_resources", "_vehicles", "_crewGroups", "_cargoGroups"];

    if (count _vehicles == 0) exitWith {
        [localize "STR_A3AU_player_context_qrf_no_vehicles"] remoteExec ["A3U_fnc_context_notification", _adminOwner];
    };

    [localize "STR_A3AU_player_context_qrf_success"] remoteExec ["A3U_fnc_context_notification", _adminOwner];

    // -----------------------------------------------------------------------------
    // THE ACTIVE TRACKING LOOP
    // -----------------------------------------------------------------------------
    private _allGroups = _crewGroups + _cargoGroups;
    private _timeOut = time + 3600; 
    private _chaseInterval = 5; 

    while { time < _timeOut && alive _targetPlayer && isPlayer _targetPlayer } do {
        
        private _aliveCount = 0;
        {
            _aliveCount = _aliveCount + ({alive _x && [_x] call A3A_fnc_canFight} count units _x);
        } forEach _allGroups;

        if (_aliveCount == 0) exitWith {}; 

        private _targPos = getPosATL _targetPlayer;

        {
            if (isNull _x) then {continue};

            _x reveal [_targetPlayer, 4];

            private _ldr = leader _x;
            private _isCargo = _x in _cargoGroups;
            private _isCrew = _x in _crewGroups;

            if ((_isCargo && vehicle _ldr == _ldr) || (_isCrew && _attackCount > 0)) then {

                private _wps = waypoints _x;
                if (count _wps > 0) then {
                    private _lastWpIndex = (count _wps) - 1;
                    private _lastWp = [_x, _lastWpIndex];

                    if (waypointPosition _lastWp distance2D _targPos > 30) then {
                        _lastWp setWaypointPosition [_targPos, 0];
                        _lastWp setWaypointType "SAD";
                        _x setCombatMode "RED";
                    };
                } else {
                    private _wp = _x addWaypoint [_targPos, 0];
                    _wp setWaypointType "SAD";
                    _wp setWaypointBehaviour "COMBAT";
                    _x setCombatMode "RED";
                };
            };
        } forEach _allGroups;

        sleep _chaseInterval;
    };

    // -------------------------------------------------------------------------
    // CLEANUP & RETURN TO BASE
    // -------------------------------------------------------------------------
    { [_x] spawn A3A_fnc_VEHDespawner } forEach _vehicles;
    { [_x, _base] spawn A3A_fnc_enemyReturnToBase } forEach _crewGroups;
    
    {
        private _nearMrk = [outposts + airportsX + resourcesX + factories + seaports + milbases, getPosATL (leader _x)] call BIS_fnc_nearestPosition;
        [_x, _nearMrk] spawn A3A_fnc_enemyReturnToBase;
    } forEach _cargoGroups;
};
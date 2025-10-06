#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
//Mission: Logistics bank mission

params ["_bank"];
if (!isServer and hasInterface) exitWith {};

private _markerX = [citiesX, _bank] call BIS_fnc_nearestPosition;
private _difficultX = random 10 < tierWar;
private _positionX = getPosATL _bank;
private _posbase = getMarkerPos respawnTeamPlayer;
private _faction = Faction(Occupants);

private _timeLimit = [60, 120] select !_difficultX;
if (A3A_hasIFA) then {_timeLimit = _timeLimit * 2};
private _limit = _timeLimit call SCRT_fnc_misc_getTimeLimit;
_limit params ["_dateLimitNum", "_displayTime"];

private _city = [citiesX, _positionX] call BIS_fnc_nearestPosition;
private _mrkFinal = createMarker [format ["LOG%1", random 100], _positionX];
private _nameDest = [_city] call A3A_fnc_localizar;
_mrkFinal setMarkerShape "ICON";

// Creating the vehicle
private _civDisabled = (A3A_faction_civ getOrDefault ["attributeLowCiv", false] || {A3A_faction_civ getOrDefault ["attributeCivNonHuman", false]});
private _vehiclePool = if (_civDisabled) then { _faction get "vehiclesMilitiaTrucks" } else { A3A_faction_civ get "vehiclesCivIndustrial" } select { _x isEqualType "" }; // * convert weighted list to normal array 
private _bankVehicleClass = selectRandom (A3A_faction_reb getOrDefault ["vehiclesCivSupply", _vehiclePool]);
private _pos = _posbase findEmptyPosition [1, 50, _bankVehicleClass];
private _truckX = _bankVehicleClass createVehicle _pos;

{_x reveal _truckX} forEach (allPlayers - entities "HeadlessClient_F");
[_truckX, teamPlayer] call A3A_fnc_AIVEHinit;
_truckX setVariable ["destinationX", _nameDest, true];
_truckX addEventHandler ["GetIn", {
	if (_this select 1 == "driver") then {
		_textX = format [localize "STR_hints_LOG_objective",(_this select 0) getVariable "destinationX"];
		[localize "STR_hints_LOG_Bank_header", _textX] remoteExecCall ["A3A_fnc_customHint", _this select 2];
	};
}];

[_truckX, localize "STR_marker_mission_vehicle"] spawn A3A_fnc_inmuneConvoy;

// Creating the task
private _taskId = "LOG" + str A3A_taskCount;
[
    [teamPlayer, civilian], _taskId,
    [format [localize "STR_A3A_Missions_LOG_Bank_task_desc", _nameDest, _displayTime], 
    localize "STR_A3A_Missions_LOG_Bank_task_header", _mrkFinal],
    _positionX, false, 0, true, "Interact", true
] call BIS_fnc_taskCreate;
[_taskId, "LOG", "CREATED"] remoteExec ["A3A_fnc_taskUpdate", 2];

// Creating guards
private _groups = [];
private _soldiers = [];
for "_i" from 1 to 4 do {
    private _groupType = if (_difficultX) then { 
        selectRandom ([_faction get "groupsTierSmall"] call SCRT_fnc_unit_flattenTier) 
    } else { 
        _faction get "groupPolice" 
    };
    private _groupX = [_positionX, Occupants, _groupType] call A3A_fnc_spawnGroup;
    sleep 0.5;
    [_groupX, "Patrol_Area", 25, 50, 100, true, _positionX, true] call A3A_fnc_patrolLoop;
    { [_x, ""] call A3A_fnc_NATOinit; _soldiers pushBack _x } forEach units _groupX;
    _groups pushBack _groupX;
};

// Calculating safe approach distance
private _bb = flatten boundingBoxReal _bank apply { abs _x };
private _bankDistMax = (selectMin _bb) + 10;

waitUntil {
    sleep 1; 
    (dateToNumber date > _dateLimitNum) || 
    !alive _truckX || 
    (_truckX distance _positionX < _bankDistMax)
};

private _bonus = [1, 2] select _difficultX;
if (dateToNumber date > _dateLimitNum || !alive _truckX) then {
    [_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState;
    [-(1800 * _bonus), Occupants] remoteExec ["A3A_fnc_timingCA", 2];
    [-10 * _bonus, theBoss] call A3A_fnc_addScorePlayer;
} else {
    private _countX = 120 * _bonus;
    private _reveal = [_positionX, Occupants] call A3A_fnc_calculateSupportCallReveal;
    [Occupants, _truckX, _positionX, 4, _reveal] remoteExec ["A3A_fnc_requestSupport", 2];
    [10 * _bonus, -20 * _bonus, _markerX] remoteExec ["A3A_fnc_citySupportChange", 2];
    ["TaskFailed", ["", format [localize "STR_A3A_fn_mission_log_bank_alert", _nameDest]]] remoteExec ["BIS_fnc_showNotification", Occupants];

    // Removing disguise from players
    {
        if (_x distance _truckX < 300 && {captive _x} && {isPlayer _x}) then {
            [_x, false] remoteExec ["setCaptive", _x];
        };
    } forEach ([distanceSPWN, 0, _positionX, teamPlayer] call A3A_fnc_distanceUnits);

    private _exit = false;
    while {_countX > 0 || {_truckX distance _positionX < _bankDistMax && alive _truckX && dateToNumber date < _dateLimitNum}} do {
        while {_countX > 0 && _truckX distance _positionX < _bankDistMax && alive _truckX} do {
            private _formatX = format ["%1", _countX];
            {
                if (isPlayer _x) then {
                    [petros, "countdown", _formatX] remoteExec ["A3A_fnc_commsMP", _x]
                };
            } forEach ([80, 0, _truckX, teamPlayer] call A3A_fnc_distanceUnits);
            sleep 1;
            _countX = _countX - 1;
        };
        if (_countX > 0) then {
            if (_truckX distance _positionX > _bankDistMax) then {
                {
                    if (isPlayer _x) then {
                        [petros, "hint", localize "STR_A3A_Missions_LOG_Bank_task_tip_1", localize "STR_A3A_Missions_LOG_Bank_task_header"] remoteExec ["A3A_fnc_commsMP", _x]
                    };
                } forEach ([200, 0, _truckX, teamPlayer] call A3A_fnc_distanceUnits);
            };
            waitUntil {sleep 1; !alive _truckX || _truckX distance _positionX < _bankDistMax || dateToNumber date >= _dateLimitNum};
        } else {
            if (alive _truckX) then {
                {
                    if (isPlayer _x) then {
                        [petros, "hint", localize "STR_A3A_Missions_LOG_Bank_task_tip_2", localize "STR_A3A_Missions_LOG_Bank_task_header"] remoteExec ["A3A_fnc_commsMP", _x]
                    };
                } forEach ([80, 0, _truckX, teamPlayer] call A3A_fnc_distanceUnits);
                _exit = true;
            };
        };
        if (_exit) exitWith {};
    };
};

waitUntil {
    sleep 1; 
    (dateToNumber date > _dateLimitNum) || 
    !alive _truckX || 
    (_truckX distance _posbase < 50)
};

if (_truckX distance _posbase < 50 && dateToNumber date < _dateLimitNum) then {
    [_taskId, "LOG", "SUCCEEDED"] call A3A_fnc_taskSetState;
    [0, 5000 * _bonus] remoteExec ["A3A_fnc_resourcesFIA", 2];
    [Occupants, 20 * _bonus, 120] remoteExec ["A3A_fnc_addAggression", 2];
    [1800 * _bonus, Occupants] remoteExec ["A3A_fnc_timingCA", 2];
    
    {
        [20 * _bonus, _x] call A3A_fnc_addScorePlayer;
        [1000 * _bonus, _x] call A3A_fnc_addMoneyPlayer;
    } forEach (call SCRT_fnc_misc_getRebelPlayers);
    
    [5 * _bonus, theBoss] call A3A_fnc_addScorePlayer;
    [225 * _bonus, theBoss, true] call A3A_fnc_addMoneyPlayer;
    waitUntil {sleep 0.5; speed _truckX < 1};
    [_truckX] call A3A_fnc_empty;
} else {
    [_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState;
    [1800 * _bonus, Occupants] remoteExec ["A3A_fnc_timingCA", 2];
    [-25 * _bonus, theBoss] call A3A_fnc_addScorePlayer;
};


deleteVehicle _truckX;

[_taskId, "LOG", 1200] spawn A3A_fnc_taskDelete;

{ [_x] spawn A3A_fnc_groupDespawner } forEach _groups;

deleteMarker _mrkFinal;
if (isNil "rallyProps" || {rallyProps isEqualTo []}) exitWith {
    [localize "STR_A3AP_rally_header", localize "STR_A3AP_rally_does_not_exists"] call SCRT_fnc_misc_deniedHint;
};

if (vehicle player != player) exitWith {
    [localize "STR_A3AP_rally_header", localize "STR_A3AP_rally_occupied_veh"] call SCRT_fnc_misc_deniedHint;
};

if (player getVariable ["incapacitated",false] || {!alive player}) exitWith {
    [localize "STR_A3AP_rally_header", localize "STR_A3AP_rally_unconscious"] call SCRT_fnc_misc_deniedHint;
};

if !((vehicle player getVariable "SA_Tow_Ropes") isEqualTo objNull) exitWith {
    [localize "STR_A3AP_rally_header", localize "STR_A3AP_rally_tow_rope"] call SCRT_fnc_misc_deniedHint;
};

if (player != player getVariable ["owner",player]) exitWith {
    [localize "STR_A3AP_rally_header", localize "STR_A3AP_rally_no_aicontrol"] call SCRT_fnc_misc_deniedHint;
};

if (player distance2D (getMarkerPos "Synd_HQ") > 50) exitWith {
    [localize "STR_A3AP_rally_header", localize "STR_A3AP_rally_hq"] call SCRT_fnc_misc_deniedHint;
};

private _groupX = group player;
private _remainingTravels = rallyPointRoot getVariable ["remainingTravels", 0];

if (_remainingTravels < 1) exitWith {
    [localize "STR_A3AP_rally_header", localize "STR_A3AP_rally_not_enough_points"] call SCRT_fnc_misc_deniedHint;
    remoteExecCall ["SCRT_fnc_rally_deleteRallyPoint",2];
};

private _rallyPoint = rallyProps select 0;
private _rallyPosition = position _rallyPoint;

if ([position _rallyPoint, 50] call A3A_fnc_enemyNearCheck) exitWith {
    [localize "STR_A3AP_rally_header", localize "STR_A3AP_rally_enemy_surrounding"] call SCRT_fnc_misc_deniedHint;
};

private _positionX = [_rallyPosition, 10, random 360] call BIS_fnc_relPos;
private _distanceX = round (((player distance2D _positionX)/200)/2);

disableUserInput true; 
cutText [format [localize "STR_cut_RP_FT_timer", _distanceX],"BLACK",1]; 
sleep 1;

private _timePassed = 0;

while {_timePassed < _distanceX} do {
    cutText [format [localize "STR_cut_RP_FT_timer", (_distanceX - _timePassed)],"BLACK",0.0001];
    sleep 1;
    _timePassed = _timePassed + 1;
};

{
    _unit = _x;
    if ((!isPlayer _unit) || {_unit == player}) then {
        _unit allowDamage false;
        if (!(_unit getVariable ["incapacitated",false])) then {
            _positionX = _positionX findEmptyPosition [1,25,typeOf _unit];
            _unit setPosATL _positionX;
            if (isPlayer leader _unit) then {_unit setVariable ["rearming",false]};
            _unit doWatch objNull;
            _unit doFollow leader _unit;
        } else {
            _positionX = _positionX findEmptyPosition [1,50,typeOf _unit];
            _unit setPosATL _positionX;
        };
    };
} forEach units _groupX;

disableUserInput false;
cutText [localize "STR_cut_RP_FT_success", "BLACK IN", 1];

private _remainingTravels = _remainingTravels - 1;
rallyPointRoot setVariable ["remainingTravels", _remainingTravels, true];
rallyPointMarker setMarkerText (format [localize "STR_marker_RP", str _remainingTravels]);
[rallypointmarker] call A3A_fnc_mrkUpdate;

if (_remainingTravels < 1) then {
    remoteExecCall ["SCRT_fnc_rally_deleteRallyPoint",2];
};

sleep 5;
{_x allowDamage true} forEach units _groupX;
params [["_hours", 6]];

if (player != theBoss) exitWith {
	[
		localize "STR_notifiers_fail_type",
		localize "STR_params_rest_header",  
		parseText localize "STR_params_rest_commander_only", 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

private _rebelSpawners = units teamPlayer select { _x getVariable ["spawner",false] };
private _isEnemyNear = _rebelSpawners findIf { [getPosATL _x] call A3A_fnc_enemyNearCheck } != -1;

if (_isEnemyNear) exitWith {
	[
		localize "STR_notifiers_fail_type",
		localize "STR_params_rest_header",  
		parseText localize "STR_params_rest_enemies_near", 
		30
	] spawn SCRT_fnc_ui_showMessage;
};
if ("rebelAttack" in A3A_activeTasks) exitWith {
	[
		localize "STR_notifiers_fail_type",
		localize "STR_params_rest_header",  
		parseText localize "STR_params_rest_counterattack_in_progress", 
		30
	] spawn SCRT_fnc_ui_showMessage;
};
if ("invaderPunish" in A3A_activeTasks) exitWith {
	[
		localize "STR_notifiers_fail_type",
		localize "STR_params_rest_header",  
		parseText localize "STR_params_rest_punishment_in_progress", 
		30
	] spawn SCRT_fnc_ui_showMessage;
};
if ("DEF_HQ" in A3A_activeTasks) exitWith {
	[
		localize "STR_notifiers_fail_type",
		localize "STR_params_rest_header",  
		parseText localize "STR_params_rest_hq_under_attack", 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

if ("RIV_ENC" in A3A_activeTasks || {"RIV_ATT" in A3A_activeTasks}) exitWith {
	[
		localize "STR_notifiers_fail_type",
		localize "STR_params_rest_header",  
		parseText format [localize "STR_params_rest_rivals", A3A_faction_riv get "name", A3A_faction_reb get "name"], 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

//TODO: DEF Rivals tasks
private _posHQ = getMarkerPos respawnTeamPlayer;
private _allPlayersInRadius = (allPlayers - (entities "HeadlessClient_F")) findIf {(_x distance _posHQ > 100) && {side _x isEqualTo teamPlayer}} == -1;

if (!_allPlayersInRadius) exitWith {
	[
		localize "STR_notifiers_fail_type",
		localize "STR_params_rest_header",  
		parseText localize "STR_params_all_players_near", 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

_hours remoteExec ["A3A_fnc_resourcecheckSkipTime", 0];
closeDialog 0; 
closeDialog 0;
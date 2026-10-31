params ["_unit", "_caller", "_actionId", "_recruiting"];

[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];

if (!alive _unit) exitWith {};

private _group = group _unit;

_caller globalChat (selectRandom [
	localize "STR_imprison_action_request_one_text",
	localize "STR_imprison_action_request_two_text",
	localize "STR_imprison_action_request_three_text"
]);

//chance to run away
private _chance = if ("cellleader" in (toLowerANSI (_unit getVariable "unitType"))) then {(random [30,40,60])} else {(random [10,20,25])};

sleep 2;

if (random 100 < _chance) exitWith {
	_unit globalChat (selectRandom [
		localize "STR_imprison_action_response_failure_one_text",
		localize "STR_imprison_action_response_failure_two_text",
		format [localize "STR_imprison_action_response_failure_three_text", A3A_faction_riv get "name"]
	]);

	[_unit, Rivals, true] remoteExec ["A3A_fnc_fleeToSide", _unit];

	// Group should be surrender-specific now
	sleep 100;
	deleteVehicle _unit;
	deleteGroup _group;
};

_unit globalChat (selectRandom [
	localize "STR_imprison_action_response_success_one_text",
	localize "STR_imprison_action_response_success_two_text",
	localize "STR_imprison_action_response_success_three_text",
	localize "STR_imprison_action_response_success_four_text"
]);

[_unit, "amovpsitmstpsnonwnondnon_ground"] remoteExecCall ["playMoveNow", _unit];

private _timeOut = time + 120;
waitUntil {
	sleep 5; 
	isNil "_unit" || {!alive _unit || {time > _timeOut || {(call BIS_fnc_listPlayers) findIf {([objNull, "VIEW"] checkVisibility [eyePos _x, eyePos _unit]) > 0.3} == -1 || {(call BIS_fnc_listPlayers) findIf {(_x distance2D _unit < distanceSPWN)} == -1}}}}
};

if (alive _unit) then {
	[random [5,6,7], 100/baseRivalsDecay] remoteExec ["SCRT_fnc_rivals_reduceActivity",2];
	[random [5,6,7]] remoteExecCall ["SCRT_fnc_rivals_addProgressToRivalsLocationReveal", 2];
};

deleteVehicle _unit;
deleteGroup _group;

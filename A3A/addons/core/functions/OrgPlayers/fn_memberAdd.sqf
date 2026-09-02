params [
	["_action", "", [""]],
	["_target", cursorTarget, [objNull]]
];

if (!(serverCommandAvailable "#logout") and {!isServer}) exitWith {
	[localize "STR_A3A_OrgPlayers_membership_header", localize "STR_A3A_OrgPlayers_membership_only_admins"] call SCRT_fnc_misc_deniedHint;
};

if !(membershipEnabled) exitWith {
	[localize "STR_A3A_OrgPlayers_membership_header", localize "STR_A3A_OrgPlayers_membership_disabled"] call SCRT_fnc_misc_deniedHint;
};

if (isNil "membersX") exitWith {
	[localize "STR_A3A_OrgPlayers_membership_header", localize "STR_A3A_OrgPlayers_membership_noinit"] call SCRT_fnc_misc_deniedHint;
};

if (isNull _target || {!isPlayer _target}) exitWith {
	[localize "STR_A3A_OrgPlayers_membership_header", localize "STR_A3A_OrgPlayers_membership_notarget"] call SCRT_fnc_misc_deniedHint;
};

private _uid = getPlayerUID _target;

if ((_action == "add") and {[_target] call A3A_fnc_isMember}) exitWith {
	[localize "STR_A3A_OrgPlayers_membership_header", localize "STR_A3A_OrgPlayers_membership_alreadymember"] call SCRT_fnc_misc_deniedHint;
};
if ((_action == "remove") and  {!([_target] call A3A_fnc_isMember)}) exitWith {
	[localize "STR_A3A_OrgPlayers_membership_header", localize "STR_A3A_OrgPlayers_membership_nomember"] call SCRT_fnc_misc_deniedHint;
};

if (_action == "add") then {
	membersX pushBackUnique _uid;
	_target setVariable ["eligible", true, true];
	[localize "STR_A3A_OrgPlayers_membership_header", format [localize "STR_A3A_OrgPlayers_membership_success_add",name _target]] call A3A_fnc_customHint;
	[localize "STR_A3A_OrgPlayers_membership_header", localize "STR_A3A_OrgPlayers_membership_success_add_target"] remoteExec ["A3A_fnc_customHint", _target];
} else {
	membersX = membersX - [_uid];
	[localize "STR_A3A_OrgPlayers_membership_header", format [localize "STR_A3A_OrgPlayers_membership_success_remove",name _target]] call A3A_fnc_customHint;
	[localize "STR_A3A_OrgPlayers_membership_header", localize "STR_A3A_OrgPlayers_membership_success_remove_target"] remoteExec ["SCRT_fnc_misc_deniedHint", _target];
};

publicVariable "membersX";
playSound "A3AP_UiSuccess";
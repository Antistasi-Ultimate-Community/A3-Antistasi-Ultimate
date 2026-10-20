// SERVER: a smuggling run ends without delivery. The crate is gone, the
// holder is told, and - unless it wasn't the runner's doing (_quiet) -
// everyone hears it: chat (with announcements on) and the rumours.
// [runId, reason, quiet]
params [["_runId", -1, [0]], ["_reason", "", [""]], ["_quiet", false, [false]]];
private _i = ABZ_runs findIf { (_x select 0) == _runId };
if (_i < 0) exitWith {};
private _run = ABZ_runs deleteAt _i;
_run params ["", "_uid", "_owner", "", "_destId", "", "", "_crate", "_srcTown"];
if (!isNull _crate) then { [_crate] call ABZ_fnc_crateRemove };
call ABZ_fnc_runPublish;

private _d = [_destId] call ABZ_fnc_vendorEntry;
private _txt = format [localize "STR_A3U_Bazaar_Chat_RunFailed", _owner, _srcTown, _d param [1, localize "STR_A3U_Bazaar_Misc_Location_Coast"], _reason];
if (!_quiet) then {
	[_txt] call ABZ_fnc_runNews;
	if (missionNamespace getVariable ["ABZ_announce", true]) then {
		["ABZ_chat", ["[Bazaar] " + _txt]] call CBA_fnc_globalEvent;
	};
};
private _p = allPlayers findIf { getPlayerUID _x == _uid };
if (_p > -1) then {
	private _pl = allPlayers select _p;
	["ABZ_notify", [format ["RUN %1: %2.", ["FAILED", "CALLED OFF"] select _quiet, _reason]], _pl] call CBA_fnc_targetEvent;
	["ABZ_runMark", [[], ""], _pl] call CBA_fnc_targetEvent;
};
diag_log format ["[ABZ] Smuggling run #%1 (%2) ended: %3", _runId, _owner, _reason];
call ABZ_fnc_queueSave;

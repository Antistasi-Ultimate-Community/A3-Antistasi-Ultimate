// SERVER: the run holder hands the smuggled crate over at the destination
// stall. The crate must be within 30m of the stall - on the ground or
// still in the vehicle - and the destination trader must be willing to
// deal (the same undercover / patrol rules as trading).
if (!isServer) exitWith {};
call ABZ_fnc_syncCommit;	// Antistasi just saved? commit that state first
params [["_player", objNull, [objNull]]];
if (isNull _player) exitWith {};
private _fnc_say = { params ["_m"]; ["ABZ_notify", [_m], _player] call CBA_fnc_targetEvent };

private _ri = [getPlayerUID _player] call ABZ_fnc_runFind;
if (_ri < 0) exitWith { ["You don't have a smuggling run going."] call _fnc_say };
(ABZ_runs select _ri) params ["_runId", "_uid", "_owner", "_srcId", "_destId", "_pay", "_deadline", "_crate", "_srcTown"];

private _d = [_destId] call ABZ_fnc_vendorEntry;
// an open menu at the destination shows the run - refresh it with the outcome
private _fnc_refresh = { if (_d isNotEqualTo []) then { ["ABZ_shopData", [_d, _player] call ABZ_fnc_shopPayload, _player] call CBA_fnc_targetEvent } };
if (isNull _crate) exitWith { [_runId, "the crate was lost"] call ABZ_fnc_runFail; call _fnc_refresh };
if (time > _deadline) exitWith { [_runId, "the deadline passed"] call ABZ_fnc_runFail; call _fnc_refresh };
if (_d isEqualTo []) exitWith { ["Your contact isn't set up anywhere right now - Shift+K shows where they are."] call _fnc_say };
private _why = [_player, _d] call ABZ_fnc_serverCanTrade;
if (_why != "") exitWith { [_why] call _fnc_say };
private _carrier = attachedTo _crate;
if (!isNull _carrier && {!alive _carrier} && {!(_carrier isKindOf "CAManBase")}) exitWith {
	[_runId, "the crate went up with the vehicle carrying it"] call ABZ_fnc_runFail;
	call _fnc_refresh;
};
private _cpos = getPosATL ([_crate, _carrier] select (!isNull _carrier));
// the same jump test as fn_runWatch, right now - a fast-travelled crate can't
// be handed over in the second before the watch would have caught it
private _ls = _crate getVariable ["ABZ_lastSeen", []];
if (_ls isNotEqualTo [] && {(_cpos distance2D (_ls select 0)) > (50 + 350 * (0 max (time - (_ls select 1))))}) exitWith {
	[_runId, "the contact won't touch a crate that skipped the roads (fast travel)"] call ABZ_fnc_runFail;
	call _fnc_refresh;
};
if (_cpos distance2D (_d select 2) > 30) exitWith {
	[format ["Bring the crate to the stall - it has to be within 30m of %1 (on the ground or still in your vehicle). It's %2m away.", _d select 5, round (_cpos distance2D (_d select 2))]] call _fnc_say;
};
// faction mode: the war chest is paid in this same step (fn_serverPay)
if ((missionNamespace getVariable ["ABZ_funds", 0]) == 1 && {missionNamespace getVariable ["resourcesIsChanging", false]}) exitWith {
	["The war chest is being counted right now - try again in a moment."] call _fnc_say;
};

private _j = ABZ_runs findIf { (_x select 0) == _runId };	// by id, never a stale index
if (_j < 0) exitWith { call _fnc_refresh };
ABZ_runs deleteAt _j;
[_crate] call ABZ_fnc_crateRemove;
[_player, _pay] call ABZ_fnc_serverPay;
call ABZ_fnc_runPublish;
["ABZ_runMark", [[], ""], _player] call CBA_fnc_targetEvent;
call _fnc_refresh;

private _txt = format ["%1 smuggled a crate from %2 to %3 near %4.", _owner, _srcTown, _d select 5, _d select 1];
[_txt] call ABZ_fnc_runNews;
[format ["DELIVERED. %1 takes the crate off your hands - $%2.", _d select 5, _pay]] call _fnc_say;
if (missionNamespace getVariable ["ABZ_announce", true]) then {
	["ABZ_chat", ["[Bazaar] " + _txt]] call CBA_fnc_globalEvent;
};
diag_log format ["[ABZ] Smuggling run #%1 delivered by %2 at trader #%3 (%4): $%5", _runId, name _player, _destId, _d select 1, _pay];
call ABZ_fnc_queueSave;

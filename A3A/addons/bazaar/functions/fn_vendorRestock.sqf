// SERVER: the restock timer ran out - roll fresh stock, or move town when
// the "traders move every N restocks" setting says it's time.
params [["_id", -1, [0]]];
private _e = [_id] call ABZ_fnc_vendorEntry;
if (_e isEqualTo []) exitWith {};

private _n = (_e select 8) + 1;
private _every = round (missionNamespace getVariable ["ABZ_relocateEvery", 3]);
// (not while a smuggling run is headed his way - he waits for the crate)
if (_every > 0 && {(_n mod _every) == 0} && {(ABZ_runs findIf { (_x select 4) == _id }) < 0}) exitWith { [_id] call ABZ_fnc_vendorRelocate };

private _oldStock = _e select 6;
_e set [6, [_e] call ABZ_fnc_rollStock];
_e set [7, time + 60 * (missionNamespace getVariable ["ABZ_rotationMinutes", 90])];
_e set [8, _n];
[_e] call ABZ_fnc_entryPad;
_e set [12, [_e, _oldStock] call ABZ_fnc_rollJob];	// never a job for what was on the table a moment ago
_e set [13, []];	// a fresh smuggling contract is rolled by the next tick (fn_vendorTick)
_e set [14, -1];
_e set [15, false];
[_e, _e select 6, _e select 12] call ABZ_fnc_announceRoll;	// Wanted List alerts

if (missionNamespace getVariable ["ABZ_announce", true]) then {
	private _job = _e select 12;
	private _jobTxt = "";
	if (_job isNotEqualTo []) then {
		_jobTxt = format [localize "STR_A3U_Bazaar_Chat_AlsoLookingFor", _job select 1, [_job select 0] call ABZ_fnc_displayNameOf, _job select 3];
	};
	["ABZ_chat", [format [localize "STR_A3U_Bazaar_Chat_FreshStock", _e select 5, _e select 1, _jobTxt]]] call CBA_fnc_globalEvent;
};
diag_log format ["[ABZ] Trader %1 (#%2) restocked at %3 (%4 slots)", _e select 5, _id, _e select 1, count (_e select 6)];
call ABZ_fnc_queueSave;

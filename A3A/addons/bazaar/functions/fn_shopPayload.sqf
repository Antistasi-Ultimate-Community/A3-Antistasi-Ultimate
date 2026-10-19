// SERVER: everything a player's open menu shows for one trader - the single
// builder for every ABZ_shopData send (browse, buy, sell, run accept...),
// so the menu can never get a half-updated table.
// [entry, player] -> [id, trader name, town, stock, secs to restock, bulk
//   size, job, runInfo]
// runInfo = [offer, myRun]:
//   offer  [destId, destName, destTown, km, payout, minutes, enemy %] or []
//   myRun  [runId, destId, destName, destTown, secsLeft, payout, srcTown] or []
params [["_e", [], [[]]], ["_player", objNull, [objNull]]];
[_e] call ABZ_fnc_entryPad;

private _offer = [];
private _o = _e select 13;
if (_o isNotEqualTo [] && {missionNamespace getVariable ["ABZ_runsEnabled", true]} && {call ABZ_fnc_isAntistasi}) then {
	_o params ["_destId", "_pay", "_secs", "_km", "_enemy"];
	private _d = [_destId] call ABZ_fnc_vendorEntry;
	if (_d isNotEqualTo [] && {(_d select 9) == "ok"}) then {
		_offer = [_destId, _d select 5, _d select 1, _km, _pay, ceil (_secs / 60), round (100 * _enemy)];
	};
};

private _myRun = [];
private _ri = [getPlayerUID _player] call ABZ_fnc_runFind;
if (_ri > -1) then {
	(ABZ_runs select _ri) params ["_runId", "", "", "", "_destId", "_pay", "_deadline", "", "_srcTown"];
	private _d = [_destId] call ABZ_fnc_vendorEntry;
	_myRun = [_runId, _destId, _d param [5, "?"], _d param [1, "?"], ((_deadline - time) max 0), _pay, _srcTown];
};

[_e select 0, _e select 5, _e select 1, _e select 6, ((_e select 7) - time) max 0, call ABZ_fnc_bulkSize, _e select 12, [_offer, _myRun]]

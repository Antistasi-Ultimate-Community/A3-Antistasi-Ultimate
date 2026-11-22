// Client: returns [balance, isFaction] honoring the "Purchases paid from"
// setting. Faction mode reads the shared war chest; outside Antistasi (no
// readable war chest) it falls back to personal money.
// balance -1 = no money system at all (trading is free).
private _res = [-1, false];
if ((missionNamespace getVariable ["ABZ_funds", 0]) == 1) then {
	private _f = call ABZ_fnc_getFactionMoney;
	if (_f >= 0) then { _res = [_f, true] };
};
if !(_res select 1) then {
	_res = [[player] call ABZ_fnc_getMoney, false];
};
_res

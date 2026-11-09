// SERVER: rolls a trader's smuggling contract for this rotation: carry a
// sealed crate to another trader, at least 1.5km away (farther ones are
// likelier). Pays by distance, by how much enemy ground the straight line
// crosses, and by war tier, times the "Run payout" setting.
//   pay and time: fn_runPay
// [entry] -> [destId, payout, secs allowed, km, enemy share] or []
params [["_e", [], [[]]]];
if !(missionNamespace getVariable ["ABZ_runsEnabled", true]) exitWith { [] };
if !(call ABZ_fnc_isAntistasi) exitWith { [] };
if (_e isEqualTo [] || {(_e select 9) != "ok"}) exitWith { [] };
private _src = _e select 2;
private _cands = ABZ_vendors select {
	(_x select 0) != (_e select 0) && {(_x select 9) == "ok"} && {((_x select 2) distance2D _src) >= 1500}
};
if (_cands isEqualTo []) exitWith { [] };
private _d = _cands selectRandomWeighted (_cands apply { (_x select 2) distance2D _src });
([_src, _d select 2] call ABZ_fnc_runPay) params ["_pay", "_enemy", "_km", "_secs"];
[_d select 0, _pay, _secs, _km, _enemy]

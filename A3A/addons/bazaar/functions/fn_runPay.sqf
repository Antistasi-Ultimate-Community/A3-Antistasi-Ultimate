// SERVER: what a smuggling run between two points pays and allows - one
// rule for the offer (fn_runOffer) and for a destination that moves while
// the run is on (fn_vendorRelocate caps the pay at this).
//   pay  = ($300 + $300/km) x (1 + enemy share) x (1 + 8% per war tier above 1)
//          x "Run payout", rounded to $50
//   time = 15 min + 5 min/km (fn_runAllowance)
// [from, to] -> [pay, enemy share, km, secs allowed]
params [["_a", [0, 0, 0], [[]]], ["_b", [0, 0, 0], [[]]]];
private _dist = _a distance2D _b;
private _enemy = [_a, _b] call ABZ_fnc_runEnemyShare;
private _tier = missionNamespace getVariable ["tierWar", 1];
if !(_tier isEqualType 0) then { _tier = 1 };
_tier = (_tier max 1) min 10;
private _mult = missionNamespace getVariable ["ABZ_runPayout", 1];
if !(_mult isEqualType 0) then { _mult = 1 };
private _pay = (300 + 300 * _dist / 1000) * (1 + _enemy) * (1 + 0.08 * (_tier - 1)) * _mult;
_pay = 50 max (50 * round (_pay / 50));
[_pay, _enemy, (round (_dist / 100)) / 10, [_dist] call ABZ_fnc_runAllowance]

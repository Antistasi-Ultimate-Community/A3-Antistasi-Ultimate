// Client: what this trader pays for one (full) of a class right now, given
// the open shop's job: [price, isJobItem, buy-back qty, buy-back price].
// The class is matched as the trader deals it (fn_sellClass - e.g. a held
// disposable launcher counts as its carry class), exactly like the server
// does. Job items pay the bounty while the job still needs them; everything
// else pays the sell fraction. Items bought from THIS trader within the
// buy-back window (v1.1.0) come back at the full price paid, up to the
// number bought (the server decides again on the sale).
params [["_class", "", [""]]];
private _deal = [_class] call ABZ_fnc_sellClass;
if (_deal == "") exitWith { [0, false, 0, 0] };
private _shop = uiNamespace getVariable ["ABZ_shop", []];

private _bbN = 0;
private _bbPrice = 0;
{
	_x params ["_tid", "_cls", "_q", "_pr", "_ends"];
	if (_tid == (_shop param [0, -2]) && {_cls == _deal} && {_q > 0} && {time < _ends}) then {
		_bbN = _bbN + _q;
		_bbPrice = _bbPrice max _pr;
	};
} forEach ABZ_myReceipts;

private _job = _shop param [6, []];
if (_job isNotEqualTo [] && {(_job select 0) == _deal} && {(_job select 2) < (_job select 1)}) exitWith {
	[_job select 3, true, _bbN, _bbPrice]
};
[[_deal, _shop param [3, []]] call ABZ_fnc_sellPrice, false, _bbN, _bbPrice]

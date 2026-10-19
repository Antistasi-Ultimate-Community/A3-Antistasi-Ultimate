// Client: SELL pressed in the "Sell your gear" category. Takes the items
// off the player HERE (inventory is local), then asks the server to pay.
// The server re-checks everything and hands the items back on any refusal.
private _d = findDisplay 78800;
if (isNull _d) exitWith {};
private _shop = uiNamespace getVariable ["ABZ_shop", []];
private _lnb = _d displayCtrl 78802;
private _row = lnbCurSelRow _lnb;
private _map = uiNamespace getVariable ["ABZ_shopMap", []];
if (_shop isEqualTo [] || {_row < 0} || {_row >= count _map}) exitWith { ["Select something to sell first."] call ABZ_fnc_notify };

(_map select _row) params ["_class", "_have"];
([_class] call ABZ_fnc_jobPrice) params ["_price", "_isJob", ["_bbN", 0]];
if (_price <= 0 && {_bbN <= 0}) exitWith { ["The trader won't buy that."] call ABZ_fnc_notify };

private _qtyc = _d displayCtrl 78809;
private _n = round parseNumber (ctrlText _qtyc);
if (_n < 1) then { _n = 1 };
if (_n > _have) then { _n = _have };
// one weapon at a time - only the one in your hands is looked over
if ([_class] call ABZ_fnc_isWeaponType) then { _n = 1 };
// a trader who pays nothing for the rest only takes back what you bought
// from him (the buy-back window): hand over no more than that
if (_price <= 0 && {_bbN > 0} && {!_isJob}) then { _n = _n min _bbN };
// a job row on a server where traders pay nothing for the rest: hand over
// only what the job still needs
if (_isJob && {([_class, (uiNamespace getVariable ["ABZ_shop", []]) param [3, []]] call ABZ_fnc_sellPrice) <= 0}) then {
	private _sj = _shop param [6, []];
	_n = _n min ((((_sj param [1, 0]) - (_sj param [2, 0]))) max 1);
};

// a held weapon goes over bare and unloaded, exactly as its class comes
private _not = [_class] call ABZ_fnc_sellCheck;
if (_not != "") exitWith { [_not] call ABZ_fnc_notify };

([_class, _n] call ABZ_fnc_removeMine) params ["_removed", "_rounds", ["_whyNot", ""]];
if (_removed <= 0) exitWith {
	[["Couldn't hand that over - empty it first if it's a uniform, vest or backpack.", format ["The trader can't take it out: %1.", _whyNot]] select (_whyNot != "")] call ABZ_fnc_notify;
};
if (_removed < _n) then {
	systemChat format ["[Bazaar] Only %1 could be handed over (the rest is worn, or not empty).", _removed];
};

// tell the server what this menu promised for job items, so a job that
// changed meanwhile hands the items back instead of paying the sell fraction.
// Only whole items - for magazines, full ones - count toward a job.
private _expJobN = 0;
private _expReward = 0;
if (_isJob) then {
	private _sj = _shop param [6, []];
	private _whole = _removed;
	if (_rounds isNotEqualTo []) then {
		private _cap = 1 max getNumber (configFile >> "CfgMagazines" >> _class >> "count");
		_whole = { _x >= _cap } count _rounds;
	};
	_expJobN = _whole min (((_sj param [1, 0]) - (_sj param [2, 0])) max 0);
	_expReward = _sj param [3, 0];
};
["ABZ_sell", [player, _shop select 0, _class, _removed, _expJobN, _expReward, _rounds]] call CBA_fnc_serverEvent;
call ABZ_fnc_shopFillList;	// the list is my inventory - refresh it now

// Client: SELL pressed in "SELL from vehicle / crate" (v1.1.1). Nothing is
// taken here - the server takes the items out of the vehicle or crate itself
// (fn_serverSellCargo), so nothing has to be carried or drawn.
private _d = findDisplay 78800;
if (isNull _d) exitWith {};
private _shop = uiNamespace getVariable ["ABZ_shop", []];
private _row = lnbCurSelRow (_d displayCtrl 78802);
private _map = uiNamespace getVariable ["ABZ_shopMap", []];
private _box = uiNamespace getVariable ["ABZ_sellBox", objNull];
if (isNull _box || {!alive _box}) exitWith { [localize "STR_A3U_Bazaar_Notify_NoVehicleOrCrate"] call ABZ_fnc_notify };
if (_shop isEqualTo [] || {_row < 0} || {_row >= count _map}) exitWith { [localize "STR_A3U_Bazaar_Notify_SelectSomethingFirst"] call ABZ_fnc_notify };

(_map select _row) params ["_class", "_have"];
([_class] call ABZ_fnc_jobPrice) params ["_price", "_isJob", ["_bbN", 0]];
if (_price <= 0 && {_bbN <= 0}) exitWith { [localize "STR_A3U_Bazaar_Notify_TraderWontBuy"] call ABZ_fnc_notify };

private _n = round parseNumber (ctrlText (_d displayCtrl 78809));
if (_n < 1) then { _n = 1 };
if (_n > _have) then { _n = _have };
// a trader who pays nothing for the rest takes only what he must
if (_price <= 0 && {_bbN > 0} && {!_isJob}) then { _n = _n min _bbN };
if (_isJob && {([_class, _shop param [3, []]] call ABZ_fnc_sellPrice) <= 0}) then {
	private _sj = _shop param [6, []];
	_n = _n min ((((_sj param [1, 0]) - (_sj param [2, 0]))) max 1);
};

// what this menu promises for the job (only whole items / full magazines;
// the server takes full magazines first)
private _expJobN = 0;
private _expReward = 0;
if (_isJob) then {
	private _sj = _shop param [6, []];
	private _whole = _n;
	private _cm = configFile >> "CfgMagazines" >> _class;
	if (isClass _cm) then {
		private _cap = 1 max getNumber (_cm >> "count");
		_whole = _n min ({ (_x select 0) == _class && {(_x select 1) >= _cap} } count (magazinesAmmoCargo _box));
	};
	_expJobN = _whole min (((_sj param [1, 0]) - (_sj param [2, 0])) max 0);
	_expReward = _sj param [3, 0];
};
["ABZ_sellCargo", [player, _shop select 0, _box, _class, _n, _expJobN, _expReward]] call CBA_fnc_serverEvent;
// the cargo changes on the server - re-read it once that has reached us
[] spawn { sleep 0.75; if (!isNull (findDisplay 78800)) then { isNil { call ABZ_fnc_shopFillList } } };

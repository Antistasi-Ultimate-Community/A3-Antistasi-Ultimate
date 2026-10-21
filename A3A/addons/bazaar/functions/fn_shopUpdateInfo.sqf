// Client: preview / info / money / quantity choices for the selected row.
private _d = findDisplay 78800;
if (isNull _d) exitWith {};
private _shop = uiNamespace getVariable ["ABZ_shop", []];
private _lnb = _d displayCtrl 78802;
private _pic = _d displayCtrl 78803;
private _info = _d displayCtrl 78804;
private _money = _d displayCtrl 78805;
private _qtyc = _d displayCtrl 78809;
private _row = lnbCurSelRow _lnb;
private _map = uiNamespace getVariable ["ABZ_shopMap", []];

(call ABZ_fnc_getFunds) params ["_m", "_fac"];
_money ctrlSetText (switch (true) do {
	case (_m < 0): { localize "STR_A3U_Bazaar_Shop_MoneyNA" };
	case (_fac): { format [localize "STR_A3U_Bazaar_Shop_FactionMoney", _m] };
	default { format [localize "STR_A3U_Bazaar_Shop_YourMoney", _m] };
});

_qtyc ctrlSetText "1";
_qtyc ctrlEnable false;
private _sell = uiNamespace getVariable ["ABZ_shopSell", false];
private _mode = uiNamespace getVariable ["ABZ_shopMode", "stock"];
private _buyBtn = _d displayCtrl 78810;
_buyBtn ctrlEnable true;
(_d displayCtrl 78814) ctrlEnable true;	// PIN - only a vehicle row disables it again
if (_shop isEqualTo [] || {_row < 0} || {_row >= count _map}) exitWith {
	_pic ctrlSetText "";
	[(switch (_mode) do {
		case "sell": { localize "STR_A3U_Bazaar_Shop_NothingOnYou" };
		case "sellcargo": {
			if (isNull (uiNamespace getVariable ["ABZ_sellBox", objNull])) then {
				localize "STR_A3U_Bazaar_Shop_SellFromVehicleOrCrate"
			} else {
				localize "STR_A3U_Bazaar_Shop_NothingInThere"
			}
		};
		case "run": {
			if !(missionNamespace getVariable ["ABZ_runsEnabled", true]) then { localize "STR_A3U_Bazaar_Shop_SmugglingRunsOff" } else {
				localize "STR_A3U_Bazaar_Shop_SmugglingRuns"
			}
		};
		case "wanted": { format [localize "STR_A3U_Bazaar_Shop_WantedList", ABZ_wantedMax] };
		default { localize "STR_A3U_Bazaar_Shop_NothingToday" };
	}), _info] call ABZ_fnc_uiText;
	if (_mode in ["run", "wanted"]) then { _buyBtn ctrlEnable false };
};

// SMUGGLING RUN (v1.1.0): the row is "offer" | "deliver" | "mine"
if (_mode == "run") exitWith {
	_pic ctrlSetText "\A3\ui_f\data\map\markers\military\box_CA.paa";
	(_shop param [7, [[], []]]) params [["_offer", []], ["_myRun", []]];
	private _what = _map select _row;
	switch (_what) do {
		case "offer": {
			_offer params ["_destId", "_destName", "_destTown", "_km", "_pay", "_mins", "_enemy"];
			[format [
				localize "STR_A3U_Bazaar_Shop_SmugglingContract"
				_destName, _destTown, _km, _enemy, _mins, _pay, ["", localize "STR_A3U_Bazaar_Shop_AlreadyGoing"] select (_myRun isNotEqualTo [])
			], _info] call ABZ_fnc_uiText;
			_buyBtn ctrlSetText localize "STR_A3U_Bazaar_Shop_Accept";
			_buyBtn ctrlEnable (_myRun isEqualTo []);
		};
		case "deliver": {
			_myRun params ["", "", "", "", "_endsAt", "_pay", "_srcTown"];
			[format [
				localize "STR_A3U_Bazaar_Shop_YourSmuggledCrate",
				_srcTown, _pay, ceil (((_endsAt - time) max 0) / 60)
			], _info] call ABZ_fnc_uiText;
			_buyBtn ctrlSetText localize "STR_A3U_Bazaar_Shop_Deliver";
		};
		default {
			_myRun params ["", "", "_destName", "_destTown", "_endsAt", "_pay", "_srcTown"];
			[format [
				localize "STR_A3U_Bazaar_Shop_YourSmugglingRun",
				_srcTown, _destName, _destTown, ceil (((_endsAt - time) max 0) / 60), _pay
			], _info] call ABZ_fnc_uiText;
			_buyBtn ctrlSetText "-";
			_buyBtn ctrlEnable false;
		};
	};
};

// WANTED LIST (v1.1.0): the row is a pinned class
if (_mode == "wanted") exitWith {
	private _c = _map select _row;
	_pic ctrlSetText ([_c] call ABZ_fnc_pictureOf);
	[format [
		localize "STR_A3U_Bazaar_Shop_YourWantedList",
		[_c] call ABZ_fnc_displayNameOf, count _map, ABZ_wantedMax
	], _info] call ABZ_fnc_uiText;
	_buyBtn ctrlSetText localize "STR_A3U_Bazaar_Shop_Unpin";
};

// SELL side: the row is [class, how many you carry]
if (_sell) exitWith {
	(_map select _row) params ["_class", "_have"];
	([_class] call ABZ_fnc_jobPrice) params ["_p", "_isJob", ["_bbN", 0], ["_bbPrice", 0]];
	private _box = uiNamespace getVariable ["ABZ_sellBox", objNull];
	private _fromBox = _mode == "sellcargo";
	private _dealAs = [_class] call ABZ_fnc_sellClass;
	private _dealBase = [_dealAs] call ABZ_fnc_wantedBase;
	(_d displayCtrl 78814) ctrlSetText (localize ["STR_A3U_Bazaar_Shop_Pin", "STR_A3U_Bazaar_Shop_Unpin"] select (((call ABZ_fnc_wantedList) findIf { _x == _dealAs || {_x == _dealBase} }) > -1));
	([_class] call ABZ_fnc_itemKind) params ["_kind", "_sub"];
	private _tier = [[_class, _kind, _sub] call ABZ_fnc_itemPrice] call ABZ_fnc_tierOf;
	([_tier] call ABZ_fnc_rarityInfo) params ["_rName", "_rHex"];
	_pic ctrlSetText ([_class] call ABZ_fnc_pictureOf);
	private _note = if (_isJob) then {
		private _job = _shop param [6, []];
		format [localize "STR_A3U_Bazaar_Shop_JobItem", (_job select 1) - (_job select 2)]
	} else {
		[localize "STR_A3U_Bazaar_Shop_SellInfo",
		 format [localize "STR_A3U_Bazaar_Shop_SellInfoFromBox", [typeOf _box] call ABZ_fnc_displayNameOf, round (player distance _box)]] select _fromBox
	};
	if (_bbN > 0) then {
		private _secs = 0;
		{ if ((_x select 1) == _dealAs && {(_x select 0) == (_shop select 0)}) then { _secs = _secs max ((_x select 4) - time) } } forEach ABZ_myReceipts;
		_note = format [localize "STR_A3U_Bazaar_Shop_BuyBack", _bbN, _bbPrice, ceil (_secs max 0)] + _note;
		_p = _bbPrice;
	};
	[format [
		localize "STR_A3U_Bazaar_Shop_TraderPays",
		[_class] call ABZ_fnc_displayNameOf, _rHex, _rName, _p, _have, _note, [localize "STR_A3U_Bazaar_Misc_YouCarry", localize "STR_A3U_Bazaar_Misc_InThere"] select _fromBox
	], _info] call ABZ_fnc_uiText;
	_qtyc ctrlEnable (_have > 1);
	_qtyc ctrlSetTooltip format [localize "STR_A3U_Bazaar_Shop_HowManyToSell", _have];
};

private _slot = (_shop select 3) select (_map select _row);
_slot params ["_class", "_price", "_tier", "_qty", "_bulk", "_kind"];
([_tier] call ABZ_fnc_rarityInfo) params ["_rName", "_rHex"];
private _pinBtn = _d displayCtrl 78814;
_pinBtn ctrlEnable !(_kind isEqualTo "vehicle");
private _classBase = [_class] call ABZ_fnc_wantedBase;
_pinBtn ctrlSetText (localize ["STR_A3U_Bazaar_Shop_Pin", "STR_A3U_Bazaar_Shop_Unpin"] select (((call ABZ_fnc_wantedList) findIf { _x == _class || {_x == _classBase} }) > -1));

_pic ctrlSetText ([_class] call ABZ_fnc_pictureOf);
private _name = [_class] call ABZ_fnc_displayNameOf;

// military vehicle: what it is, what it needs, how it's delivered
if (_kind isEqualTo "vehicle") exitWith {
	private _vcat = _slot param [6, ""];
	private _catName = (ABZ_vehCats getOrDefault [_vcat, ["Vehicle"]]) select 0;
	([_vcat] call ABZ_fnc_vehReq) params ["_met", "_rich"];
	private _seats = getNumber (configFile >> "CfgVehicles" >> _class >> "transportSoldier");
	private _deliv = if ((missionNamespace getVariable ["ABZ_vehDelivery", 0]) == 1) then {
		localize "STR_A3U_Bazaar_Shop_VehDeliveredGarage"
	} else {
		[localize "STR_A3U_Bazaar_Shop_VehDeliveredLand", localize "STR_A3U_Bazaar_Shop_VehDeliveredWater"] select (_vcat == "BOAT")
	};
	[format [
		localize "STR_A3U_Bazaar_Shop_VehicleInfo",
		_name, _rHex, _catName, _seats, _price, [localize "STR_A3U_Bazaar_Shop_Sold", localize "STR_A3U_Bazaar_Shop_OneAvailable"] select (_qty > 0), _rich, _deliv
	], _info] call ABZ_fnc_uiText;
	_qtyc ctrlEnable false;
	_qtyc ctrlSetTooltip localize "STR_A3U_Bazaar_Shop_VehiclesOnePer";
};

private _kindTxt = localize switch (_kind) do {
	case "weapon": { "STR_A3U_Bazaar_Misc_Kind_Weapon" };
	case "ammo": { "STR_A3U_Bazaar_Misc_Kind_Ammo" };
	case "gear": { "STR_A3U_Bazaar_Misc_Kind_Gear" };
	case "clothing": { "STR_A3U_Bazaar_Misc_Kind_Clothing" };
	default { "STR_A3U_Bazaar_Misc_Kind_Item" };
};
private _txt = format ["<t size='1.15' color='#f1c27d'>%1</t><br/><t color='%2'>%3</t>  -  %4<br/>", _name, _rHex, _rName, _kindTxt];
if (_bulk) then {
	private _what = localize switch (true) do {
		case (call ABZ_fnc_unlocksEnabled): { "STR_A3U_Bazaar_Shop_UnlocksEnabled" };
		case (call ABZ_fnc_isAntistasi): { "STR_A3U_Bazaar_Shop_UnlocksDisabled" };
		default { "STR_A3U_Bazaar_Shop_NotAntistasi" };
	};
	_txt = _txt + format [localize "STR_A3U_Bazaar_Shop_SealedBulkCrate",
		_shop select 5, _name, _price, localize ["STR_A3U_Bazaar_Shop_SoldOut", "STR_A3U_Bazaar_Shop_OneAvailable"] select (_qty > 0), _what];
} else {
	_txt = _txt + format [localize "STR_A3U_Bazaar_Shop_PriceEach", _price, localize ["STR_A3U_Bazaar_Shop_SoldOut", format [localize "STR_A3U_Bazaar_Shop_AmountLeft", _qty]] select (_qty > 0)];
};
[_txt, _info] call ABZ_fnc_uiText;

// quantity: typed, any number up to what's left (bulk is always one crate)
_qtyc ctrlEnable (!_bulk && {_qty > 1});
_qtyc ctrlSetTooltip ([format [localize "STR_A3U_Bazaar_Shop_HowManyToBuy", _qty], localize "STR_A3U_Bazaar_Shop_BulkCratesOnePer"] select _bulk);

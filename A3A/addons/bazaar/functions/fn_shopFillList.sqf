// Client: fills the item list for the selected category, coloured by rarity.
// Category indices: see ABZ_shopCats in XEH_preInit. Modes:
//   stock  (0-6)        rows map to stock indices
//   run    (ABZ_catRun) smuggling contract / my run - rows map to "offer" | "deliver" | "mine"
//   wanted (ABZ_catWanted) my Wanted List - rows map to pinned classes
//   sell   (last)       my own inventory - rows map to [class, how many]
#include "..\dialogues\ids.inc"
private _d = findDisplay ABZ_IDD_SHOP;
if (isNull _d) exitWith {};
private _shop = uiNamespace getVariable ["ABZ_shop", []];
if (_shop isEqualTo []) exitWith {};

private _stock = _shop select 3;
private _combo = _d displayCtrl ABZ_IDC_CATEGORYCOMBO;
private _lnb = _d displayCtrl ABZ_IDC_ITEMLIST;
private _cat = lbCurSel _combo;
private _keepRow = lnbCurSelRow _lnb;

lnbClear _lnb;
private _map = [];
private _room = ["room", _lnb] call ABZ_fnc_uiFit;	// v1.1.2: cells cut to their columns

private _mode = switch (true) do {
	case (_cat == ((count ABZ_shopCats) - 1)): { "sell" };
	case (_cat == ABZ_catSellCargo): { "sellcargo" };
	case (_cat == ABZ_catRun): { "run" };
	case (_cat == ABZ_catWanted): { "wanted" };
	default { "stock" };
};
private _sell = _mode in ["sell", "sellcargo"];
uiNamespace setVariable ["ABZ_shopSell", _sell];
uiNamespace setVariable ["ABZ_shopMode", _mode];
(_d displayCtrl ABZ_IDC_BUTTONBUY) ctrlSetText (localize switch (_mode) do { case "sell"; case "sellcargo": { "STR_A3U_Bazaar_Shop_Sell" }; case "run": { "STR_A3U_Bazaar_Shop_Accept" }; case "wanted": { "STR_A3U_Bazaar_Shop_Unpin" }; default { "STR_A3U_Bazaar_Shop_Buy" } });
(_d displayCtrl ABZ_IDC_DESTCOMBO) ctrlEnable (_mode == "stock");
(_d displayCtrl ABZ_IDC_BUTTONPIN) ctrlShow (_mode in ["stock", "sell", "sellcargo"]);
{ (_d displayCtrl _x) ctrlShow (_mode == "wanted") } forEach [ABZ_IDC_WANTEDEDIT, ABZ_IDC_BUTTONWANTEDADD];
(_d displayCtrl ABZ_IDC_RESTOCKTEXT) ctrlShow (_mode != "wanted");

private _fnc_finish = {
	uiNamespace setVariable ["ABZ_shopMap", _map];
	private _rows = (lnbSize _lnb) select 0;
	if (_rows > 0) then {
		_lnb lnbSetCurSelRow ((_keepRow max 0) min (_rows - 1));	// triggers shopUpdateInfo
	} else {
		call ABZ_fnc_shopUpdateInfo;
	};
};

if (_sell) exitWith {
	// "SELL from vehicle / crate" (v1.1.1): the cargo of the vehicle or crate
	// beside the player; "SELL your gear": the player's own kit
	private _rows = if (_mode == "sellcargo") then {
		private _box = call ABZ_fnc_sellSource;
		uiNamespace setVariable ["ABZ_sellBox", _box];
		[_box] call ABZ_fnc_cargoInventory
	} else {
		call ABZ_fnc_myInventory
	};
	{
		_x params ["_class", "_have"];
		([_class] call ABZ_fnc_jobPrice) params ["_p", "_isJob", ["_bbN", 0], ["_bbPrice", 0]];
		if (_p <= 0 && {_bbN <= 0}) then { continue };
		private _label = [[[_class] call ABZ_fnc_displayNameOf, 0]];
		if (_isJob) then { _label = [[localize "STR_A3U_Bazaar_Shop_Job", 1]] + _label };
		if (_bbN > 0) then { _label = [[localize "STR_A3U_Bazaar_Shop_BuyBack", 1]] + _label };
		private _priceTxt = if (_bbN > 0) then { format ["$%1", _bbPrice] } else { format ["$%1", _p] };
		private _row = ["lnbRow", _lnb, [_label, _priceTxt, format ["x%1", _have]], _room] call ABZ_fnc_uiFit;
		([_class] call ABZ_fnc_itemKind) params ["_kind", "_sub"];
		private _tier = [[_class, _kind, _sub] call ABZ_fnc_itemPrice] call ABZ_fnc_tierOf;
		private _rgba = ([_tier] call ABZ_fnc_rarityInfo) select 4;
		if (_isJob) then { _rgba = [1, 0.8, 0.3, 1] };
		if (_bbN > 0) then { _rgba = [0.6, 1, 0.9, 1] };
		_lnb lnbSetColor [[_row, 0], _rgba];
		_lnb lnbSetColor [[_row, 1], [1, 0.85, 0.5, 1]];
		_lnb lnbSetColor [[_row, 2], _rgba];
		_map pushBack [_class, _have];
	} forEach _rows;
	call _fnc_finish;
};

if (_mode == "run") exitWith {
	(_shop param [7, [[], []]]) params [["_offer", []], ["_myRun", []]];
	if (_myRun isNotEqualTo []) then {
		_myRun params ["_runId", "_destId", "_destName", "_destTown", "_endsAt", "_pay", "_srcTown"];
		private _mins = ceil (((_endsAt - time) max 0) / 60);
		private _row = if (_destId == (_shop select 0)) then {
			_map pushBack "deliver";
			["lnbRow", _lnb, [[ [localize "STR_A3U_Bazaar_Shop_Deliver", 1], [format ["Smuggled crate from %1", _srcTown], 0]], format ["$%1", _pay], format ["%1 min", _mins]], _room] call ABZ_fnc_uiFit
		} else {
			_map pushBack "mine";
			["lnbRow", _lnb, [[ [localize "STR_A3U_Bazaar_Shop_YourRun", 1], [format ["To %1 near %2", _destName, _destTown], 0]], format ["$%1", _pay], format ["%1 min", _mins]], _room] call ABZ_fnc_uiFit
		};
		_lnb lnbSetColor [[_row, 0], [1, 0.69, 0.38, 1]];
		_lnb lnbSetColor [[_row, 1], [0.63, 1, 0.63, 1]];
		_lnb lnbSetColor [[_row, 2], [1, 0.85, 0.5, 1]];
	};
	if (_offer isNotEqualTo []) then {
		_offer params ["_destId", "_destName", "_destTown", "_km", "_pay", "_mins", "_enemy"];
		private _row = ["lnbRow", _lnb, [[ [localize "STR_A3U_Bazaar_Shop_Contract", 1], [format ["Crate to %1 near %2", _destName, _destTown], 0]], format ["$%1", _pay], format ["%1 km", _km]], _room] call ABZ_fnc_uiFit;
		_map pushBack "offer";
		_lnb lnbSetColor [[_row, 0], [[1, 0.8, 0.5, 1], [0.6, 0.6, 0.6, 1]] select (_myRun isNotEqualTo [])];
		_lnb lnbSetColor [[_row, 1], [0.63, 1, 0.63, 1]];
		_lnb lnbSetColor [[_row, 2], [1, 0.85, 0.5, 1]];
	};
	call _fnc_finish;
};

if (_mode == "wanted") exitWith {
	{
		private _c = _x;
		private _cb = [_c] call ABZ_fnc_wantedBase;	// an old preset pin matches the plain gun
		private _here = _stock findIf { private _sc = _x select 0; (_sc == _c || {_sc == _cb} || {([_sc] call ABZ_fnc_wantedBase) == _cb}) && {(_x select 3) > 0} };
		private _job = _shop param [6, []];
		private _status = switch (true) do {
			case (_here > -1): { localize ["STR_A3U_Bazaar_Shop_Here", "STR_A3U_Bazaar_Shop_CrateHere"] select ((_stock select _here) select 4) };
			case (_job isNotEqualTo [] && {(_job select 0) == _c || {(_job select 0) == _cb} || {([_job select 0] call ABZ_fnc_wantedBase) == _cb}} && {(_job select 2) < (_job select 1)}): { "his JOB" };
			default { "-" };
		};
		private _row = ["lnbRow", _lnb, [[_c] call ABZ_fnc_displayNameOf, "", _status], _room] call ABZ_fnc_uiFit;
		_lnb lnbSetColor [[_row, 0], [0.5, 0.83, 1, 1]];
		_lnb lnbSetColor [[_row, 2], [[0.6, 0.6, 0.6, 1], [0.63, 1, 0.63, 1]] select (_status != "-")];
		_map pushBack _c;
	} forEach (call ABZ_fnc_wantedList);
	call _fnc_finish;
};

{
	_x params ["_class", "_price", "_tier", "_qty", "_bulk", "_kind"];
	private _isVeh = _kind isEqualTo "vehicle";
	private _show = switch (_cat) do {
		case 1: { !_bulk && {_kind == "weapon"} };
		case 2: { !_bulk && {_kind == "ammo"} };
		case 3: { !_bulk && {_kind == "gear"} };
		case 4: { !_bulk && {_kind == "clothing"} };
		case 5: { _bulk };
		case 6: { _isVeh };
		default { true };
	};
	if (!_show) then { continue };
	private _name = [[[_class] call ABZ_fnc_displayNameOf, 0]];
	if (_bulk) then { _name = [[format ["[BULK x%1] ", _shop select 5], 1]] + _name };
	private _locked = false;
	if (_isVeh) then {
		_name = [[localize "STR_A3U_Bazaar_Shop_VEH", 1]] + _name;
		_locked = !(([_x param [6, ""]] call ABZ_fnc_vehReq) select 0);
	};
	private _qtyTxt = switch (true) do {
		case (_qty <= 0): { localize "STR_A3U_Bazaar_Shop_SoldOut" };
		case (_locked): { localize "STR_A3U_Bazaar_Shop_Locked" };
		default { format ["%1 left", _qty] };
	};
	private _row = ["lnbRow", _lnb, [_name, format ["$%1", _price], _qtyTxt], _room] call ABZ_fnc_uiFit;
	private _rgba = ([_tier] call ABZ_fnc_rarityInfo) select 4;
	if (_qty <= 0) then { _rgba = [0.5, 0.5, 0.5, 1] };
	_lnb lnbSetColor [[_row, 0], _rgba];
	_lnb lnbSetColor [[_row, 1], [0.63, 1, 0.63, 1]];
	_lnb lnbSetColor [[_row, 2], [_rgba, [1, 0.54, 0.42, 1]] select (_locked && {_qty > 0})];
	_map pushBack _forEachIndex;
} forEach _stock;
call _fnc_finish;

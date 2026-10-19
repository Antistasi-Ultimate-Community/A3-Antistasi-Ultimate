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
	case (_m < 0): { "Money: n/a - the Bazaar trades for free" };
	case (_fac): { format ["Faction war chest: $%1", _m] };
	default { format ["Your money: $%1", _m] };
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
		case "sell": { "<t color='#c8c8c8'>Nothing on you the trader would pay for.</t>" };
		case "sellcargo": {
			if (isNull (uiNamespace getVariable ["ABZ_sellBox", objNull])) then {
				"<t color='#f1c27d'>SELL FROM A VEHICLE OR CRATE</t><br/><t color='#c8c8c8'>Park a vehicle within 15m of you, or stand by a crate or box (6m), and the trader buys straight out of it - no need to carry anything, or draw a weapon and break cover. Weapons are stripped by him: fitted parts and loaded magazines go back in.</t>"
			} else {
				"<t color='#c8c8c8'>Nothing in there the trader would pay for.</t>"
			}
		};
		case "run": {
			if !(missionNamespace getVariable ["ABZ_runsEnabled", true]) then { "<t color='#c8c8c8'>Smuggling runs are switched off on this server.</t>" } else {
				"<t color='#ffb060'>SMUGGLING RUNS</t><br/><t color='#c8c8c8'>No contract here this rotation - the trader needs a partner at least 1.5km away. Ask around (RUMOURS), or come back after the restock.</t>"
			}
		};
		case "wanted": { format ["<t color='#7fd4ff'>WANTED LIST</t><br/>Empty. Pin an item with PIN in any category, or type part of its name below and press PIN IT. Up to %1 pins, kept in your profile between campaigns. You'll hear in chat the moment any trader has one - as a single, a sealed crate, or a job asking for it - and RUMOURS lists who has them.", ABZ_wantedMax] };
		default { "<t color='#c8c8c8'>Nothing in this category today. Try another, or wait for the restock.</t>" };
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
				"<t size='1.15' color='#ffb060'>SMUGGLING CONTRACT</t><br/>Carry a sealed crate to <t color='#f1c27d'>%1</t> near %2: %3 km as the crow flies, %4 percent of that line through enemy ground. %5 min from the moment you accept.<br/>Pays <t color='#a0ffa0'>$%6</t> on delivery.<br/><t size='0.85' color='#c8c8c8'>The crate appears beside the stall, tagged as yours. Load it, drive it, hand it over at the other stall (scroll menu there, within 30m). Spotted with it long enough, or the vehicle carrying it destroyed: the run fails and everyone hears about it. One run at a time.%7</t>",
				_destName, _destTown, _km, _enemy, _mins, _pay, ["", " You already have one going."] select (_myRun isNotEqualTo [])
			], _info] call ABZ_fnc_uiText;
			_buyBtn ctrlSetText "ACCEPT";
			_buyBtn ctrlEnable (_myRun isEqualTo []);
		};
		case "deliver": {
			_myRun params ["", "", "", "", "_endsAt", "_pay", "_srcTown"];
			[format [
				"<t size='1.15' color='#ffb060'>YOUR SMUGGLED CRATE</t><br/>From %1 - this is where it goes. Pays <t color='#a0ffa0'>$%2</t>.<br/>%3 min left.<br/><t size='0.85' color='#c8c8c8'>The crate has to be within 30m of the stall - on the ground or still in your vehicle.</t>",
				_srcTown, _pay, ceil (((_endsAt - time) max 0) / 60)
			], _info] call ABZ_fnc_uiText;
			_buyBtn ctrlSetText "DELIVER";
		};
		default {
			_myRun params ["", "", "_destName", "_destTown", "_endsAt", "_pay", "_srcTown"];
			[format [
				"<t size='1.15' color='#ffb060'>YOUR SMUGGLING RUN</t><br/>Crate from %1 to <t color='#f1c27d'>%2</t> near %3 (marked on your map). %4 min left. Pays <t color='#a0ffa0'>$%5</t>.<br/><t size='0.85' color='#c8c8c8'>One run at a time - finish this one before taking another contract.</t>",
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
		"<t size='1.15' color='#7fd4ff'>%1</t><br/>On your Wanted List (%2/%3).<br/><t size='0.85' color='#c8c8c8'>You'll hear in chat the moment any trader has it - as a single, a sealed crate, or a job asking for it. RUMOURS lists who has your pins right now. UNPIN takes it off.</t>",
		[_c] call ABZ_fnc_displayNameOf, count _map, ABZ_wantedMax
	], _info] call ABZ_fnc_uiText;
	_buyBtn ctrlSetText "UNPIN";
};

// SELL side: the row is [class, how many you carry]
if (_sell) exitWith {
	(_map select _row) params ["_class", "_have"];
	([_class] call ABZ_fnc_jobPrice) params ["_p", "_isJob", ["_bbN", 0], ["_bbPrice", 0]];
	private _box = uiNamespace getVariable ["ABZ_sellBox", objNull];
	private _fromBox = _mode == "sellcargo";
	private _dealAs = [_class] call ABZ_fnc_sellClass;
	private _dealBase = [_dealAs] call ABZ_fnc_wantedBase;
	(_d displayCtrl 78814) ctrlSetText (["PIN", "UNPIN"] select (((call ABZ_fnc_wantedList) findIf { _x == _dealAs || {_x == _dealBase} }) > -1));
	([_class] call ABZ_fnc_itemKind) params ["_kind", "_sub"];
	private _tier = [[_class, _kind, _sub] call ABZ_fnc_itemPrice] call ABZ_fnc_tierOf;
	([_tier] call ABZ_fnc_rarityInfo) params ["_rName", "_rHex"];
	_pic ctrlSetText ([_class] call ABZ_fnc_pictureOf);
	private _note = if (_isJob) then {
		private _job = _shop param [6, []];
		format ["<t color='#ffd080'>JOB ITEM</t> - the trader wants these: %1 more to go, then a bonus. Delivered pieces stay with him. Only full magazines count.", (_job select 1) - (_job select 2)]
	} else {
		["A weapon in your hands goes bare and unloaded; one in your uniform, vest or backpack is stripped by the trader - fitted parts and the loaded magazine go back in the pack. A worn uniform, vest or backpack must be empty. Part-used magazines are paid by the round. Gear your arsenal has unlimited isn't worth anything here. What you sell goes on the table.",
		 format ["Straight out of the %1 (%2m away). Weapons are stripped by the trader - fitted parts and loaded magazines go back in. Part-used magazines are paid by the round. Uniforms, vests and backpacks: take them out to sell them. What you sell goes on the table.", [typeOf _box] call ABZ_fnc_displayNameOf, round (player distance _box)]] select _fromBox
	};
	if (_bbN > 0) then {
		private _secs = 0;
		{ if ((_x select 1) == _dealAs && {(_x select 0) == (_shop select 0)}) then { _secs = _secs max ((_x select 4) - time) } } forEach ABZ_myReceipts;
		_note = format ["<t color='#9fffe6'>BUY-BACK: you bought %1 of these here moments ago - he takes them back at the full $%2 you paid (whole items / full magazines) for another %3s.</t> Any more than that sell at the normal price. ", _bbN, _bbPrice, ceil (_secs max 0)] + _note;
		_p = _bbPrice;
	};
	[format [
		"<t size='1.15' color='#f1c27d'>%1</t><br/><t color='%2'>%3</t><br/>The trader pays <t color='#ffd080'>$%4</t> each  -  %7 %5<br/><t size='0.85' color='#c8c8c8'>%6</t>",
		[_class] call ABZ_fnc_displayNameOf, _rHex, _rName, _p, _have, _note, ["you carry", "in there:"] select _fromBox
	], _info] call ABZ_fnc_uiText;
	_qtyc ctrlEnable (_have > 1);
	_qtyc ctrlSetTooltip format ["How many to sell - 1 to %1.", _have];
};

private _slot = (_shop select 3) select (_map select _row);
_slot params ["_class", "_price", "_tier", "_qty", "_bulk", "_kind"];
([_tier] call ABZ_fnc_rarityInfo) params ["_rName", "_rHex"];
private _pinBtn = _d displayCtrl 78814;
_pinBtn ctrlEnable !(_kind isEqualTo "vehicle");
private _classBase = [_class] call ABZ_fnc_wantedBase;
_pinBtn ctrlSetText (["PIN", "UNPIN"] select (((call ABZ_fnc_wantedList) findIf { _x == _class || {_x == _classBase} }) > -1));

_pic ctrlSetText ([_class] call ABZ_fnc_pictureOf);
private _name = [_class] call ABZ_fnc_displayNameOf;

// military vehicle: what it is, what it needs, how it's delivered
if (_kind isEqualTo "vehicle") exitWith {
	private _vcat = _slot param [6, ""];
	private _catName = (ABZ_vehCats getOrDefault [_vcat, ["Vehicle"]]) select 0;
	([_vcat] call ABZ_fnc_vehReq) params ["_met", "_rich"];
	private _seats = getNumber (configFile >> "CfgVehicles" >> _class >> "transportSoldier");
	private _deliv = if ((missionNamespace getVariable ["ABZ_vehDelivery", 0]) == 1) then {
		"Delivered into the HQ garage."
	} else {
		["Parked near the stall - you drive it home. It's military: getting in breaks your cover.", "Moored at the nearest deep water - you sail it home."] select (_vcat == "BOAT")
	};
	[format [
		"<t size='1.15' color='#f1c27d'>%1</t><br/><t color='%2'>%3</t>  -  %4 passenger seats<br/>Price: <t color='#a0ffa0'>$%5</t>  -  %6<br/>%7<br/><t size='0.85' color='#c8c8c8'>%8</t>",
		_name, _rHex, _catName, _seats, _price, ["SOLD", "1 available"] select (_qty > 0), _rich, _deliv
	], _info] call ABZ_fnc_uiText;
	_qtyc ctrlEnable false;
	_qtyc ctrlSetTooltip "Vehicles are one per buy.";
};

private _kindTxt = switch (_kind) do {
	case "weapon": { "Weapon" };
	case "ammo": { "Ammunition / explosives" };
	case "gear": { "Gear" };
	case "clothing": { "Clothing / carry" };
	default { "Item" };
};
private _txt = format ["<t size='1.15' color='#f1c27d'>%1</t><br/><t color='%2'>%3</t>  -  %4<br/>", _name, _rHex, _rName, _kindTxt];
if (_bulk) then {
	private _what = switch (true) do {
		case (call ABZ_fnc_unlocksEnabled): { "Unpack it at HQ and the item is UNLOCKED in the arsenal." };
		case (call ABZ_fnc_isAntistasi): { "No arsenal unlocks on this server: unpack it at HQ and the whole lot goes into the arsenal as stock, at a volume discount." };
		default { "Unpack it and the crate opens with the whole lot inside, at a volume discount." };
	};
	_txt = _txt + format ["<t color='#d98cff'>SEALED BULK CRATE: %1x %2</t><br/>Price: <t color='#a0ffa0'>$%3</t> per crate  -  %4<br/><t size='0.85'>%5 Hauling required - enemy eyes on you = seizure risk.</t>",
		_shop select 5, _name, _price, ["SOLD OUT", "1 available"] select (_qty > 0), _what];
} else {
	_txt = _txt + format ["Price: <t color='#a0ffa0'>$%1</t> each  -  %2", _price, ["SOLD OUT", format ["%1 left", _qty]] select (_qty > 0)];
};
[_txt, _info] call ABZ_fnc_uiText;

// quantity: typed, any number up to what's left (bulk is always one crate)
_qtyc ctrlEnable (!_bulk && {_qty > 1});
_qtyc ctrlSetTooltip ([format ["How many to buy - anything from 1 to %1 (what's left).", _qty], "Bulk crates are always one per buy."] select _bulk);

// Client: keeps the restock countdown and money readout live while the
// Bazaar dialog is open.
while { !isNull (findDisplay 78800) } do {
	// one unscheduled step (v1.1.2): a relabel and its font fit land in the same frame
	isNil {
	private _d = findDisplay 78800;
	private _shop = uiNamespace getVariable ["ABZ_shop", []];
	if (_shop isNotEqualTo []) then {
		private _left = ((_shop select 4) - time) max 0;
		private _s = floor (_left mod 60);
		private _ss = if (_s < 10) then { "0" + str _s } else { str _s };
		private _txt = format [localize "STR_A3U_Bazaar_Shop_RestockIn", floor (_left / 60), _ss];
		if (_left <= 0) then { _txt = localize "STR_A3U_Bazaar_Shop_Restocking" };
		(_d displayCtrl 78808) ctrlSetText _txt;

		// buy-back windows closing / opening: the SELL list shows them (v1.1.0)
		if ((uiNamespace getVariable ["ABZ_shopMode", "stock"]) in ["sell", "sellcargo"]) then {
			private _live = { time < (_x select 4) && {(_x select 2) > 0} } count ABZ_myReceipts;
			if (_live != (uiNamespace getVariable ["ABZ_rcLive", -1])) then {
				uiNamespace setVariable ["ABZ_rcLive", _live];
				// in one go (never interleaved with a refill from an event), keeping
				// the player's row and typed quantity when the same item is still there
				isNil {
					private _lnb = _d displayCtrl 78802;
					private _q = ctrlText (_d displayCtrl 78809);
					private _k = ((uiNamespace getVariable ["ABZ_shopMap", []]) param [lnbCurSelRow _lnb, []]) param [0, ""];
					call ABZ_fnc_shopFillList;
					private _m = uiNamespace getVariable ["ABZ_shopMap", []];
					private _i = _m findIf { _x isEqualType [] && {(_x select 0) == _k} };
					if (_k != "" && {_i > -1}) then {
						_lnb lnbSetCurSelRow _i;
						(_d displayCtrl 78809) ctrlSetText _q;
					};
				};
			};
		};

		(call ABZ_fnc_getFunds) params ["_m", "_fac"];
		(_d displayCtrl 78805) ctrlSetText (switch (true) do {
			case (_m < 0): { localize "STR_A3U_Bazaar_Shop_MoneyNA" };
			case (_fac): { format [localize "STR_A3U_Bazaar_Shop_FactionMoney", _m] };
			default { format [localize "STR_A3U_Bazaar_Shop_YourMoney", _m] };
		});
		[_d] call ABZ_fnc_uiScale;	// v1.1.2: relabelled texts that would be cut get a smaller font
	};
	};
	sleep 1;
};

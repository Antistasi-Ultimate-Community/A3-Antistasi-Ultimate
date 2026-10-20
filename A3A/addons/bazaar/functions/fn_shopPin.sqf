// Client: PIN button - pins (or unpins) the selected item on my Wanted List.
// On the SELL side it pins the item as the traders deal it.
private _d = findDisplay 78800;
if (isNull _d) exitWith {};
private _shop = uiNamespace getVariable ["ABZ_shop", []];
private _row = lnbCurSelRow (_d displayCtrl 78802);
private _map = uiNamespace getVariable ["ABZ_shopMap", []];
if (_shop isEqualTo [] || {_row < 0} || {_row >= count _map}) exitWith { [localize "STR_A3U_Bazaar_Notify_SelectItemFirst"] call ABZ_fnc_notify };
private _mode = uiNamespace getVariable ["ABZ_shopMode", "stock"];
private _class = switch (_mode) do {
	case "sell";
	case "sellcargo": { [(_map select _row) select 0] call ABZ_fnc_sellClass };
	case "stock": {
		private _slot = (_shop select 3) select (_map select _row);
		if ((_slot param [5, ""]) isEqualTo "vehicle") then { "" } else { _slot select 0 }
	};
	default { "" };
};
if (_class == "") exitWith { [localize "STR_A3U_Bazaar_Notify_CantAddWanted"] call ABZ_fnc_notify };
[_class] call ABZ_fnc_wantedToggle;
call ABZ_fnc_shopUpdateInfo;	// PIN / UNPIN label

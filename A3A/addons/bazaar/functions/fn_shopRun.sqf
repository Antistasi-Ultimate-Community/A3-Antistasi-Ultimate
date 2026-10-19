// Client: ACCEPT / DELIVER in the "Smuggling Run" category (v1.1.0). The
// server checks everything again (undercover, one run per player, the
// contract still being the one shown, the crate within 30m on delivery).
private _d = findDisplay 78800;
if (isNull _d) exitWith {};
private _shop = uiNamespace getVariable ["ABZ_shop", []];
private _row = lnbCurSelRow (_d displayCtrl 78802);
private _map = uiNamespace getVariable ["ABZ_shopMap", []];
if (_shop isEqualTo [] || {_row < 0} || {_row >= count _map}) exitWith {};
(_shop param [7, [[], []]]) params [["_offer", []], ["_myRun", []]];
switch (_map select _row) do {
	case "offer": {
		if (_myRun isNotEqualTo []) exitWith { ["You already have a run going - one at a time."] call ABZ_fnc_notify };
		if (_offer isEqualTo []) exitWith {};
		["ABZ_runAccept", [player, _shop select 0, _offer select 0, _offer select 4]] call CBA_fnc_serverEvent;
	};
	case "deliver": {
		["ABZ_runDeliver", [player]] call CBA_fnc_serverEvent;
	};
	default {
		["Your crate goes to the trader marked on your map - Shift+K away from a stall shows the clock."] call ABZ_fnc_notify;
	};
};

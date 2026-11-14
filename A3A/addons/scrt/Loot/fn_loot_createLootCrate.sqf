#include "..\defines.inc"
FIX_LINE_NUMBERS()

private _lootCrateType = FactionGet(reb,"lootCrate");
private _cost = lootCratePrice;
private _resourcesFIA = 0;

if (player != theBoss) then {
	_resourcesFIA = player getVariable "moneyX";
} else {
	private _factionMoney = server getVariable "resourcesFIA";
	if (_cost <= _factionMoney) then {
		_resourcesFIA = _factionMoney;
	} else {
		_resourcesFIA = player getVariable "moneyX";
	};
};

if (_resourcesFIA < _cost) exitWith {
    [localize "STR_scrt_stores_buy_item_not_enough_header", format [localize "STR_scrt_stores_buy_item_not_enough", _cost, A3A_faction_civ get "currencySymbol"]] call SCRT_fnc_misc_deniedHint;
};

private _extraMessage = format [localize "STR_veh_callback_placement_text", localize "STR_veh_callback_placement_text_additive_lootcrate", _cost, A3A_faction_civ get "currencySymbol"];
private _fnc_placed = {
	params ["_vehicle", "_cost"];

	private _factionMoney = server getVariable "resourcesFIA";
	if (player == theBoss && {_cost <= _factionMoney}) then {
		[0,(-1 * _cost)] remoteExec ["A3A_fnc_resourcesFIA",2];
	}
	else {
		[-1 * _cost] call A3A_fnc_resourcesPlayer;
		_vehicle setVariable ["ownerX",getPlayerUID player,true];
	};

	_vehicle addEventHandler ["Killed", { [_this#0] spawn { sleep 10; deleteVehicle (_this#0) } }];
};

[_lootCrateType, _fnc_placed, {false}, [_cost], nil, nil, nil, _extraMessage] call HR_GRG_fnc_confirmPlacement;

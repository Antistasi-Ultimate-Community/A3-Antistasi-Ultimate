#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!hasInterface) exitWith {};
#ifdef UseDoomGUI
    if (true) exitWith { ERROR("Disabled due to UseDoomGUI Switch.") };
#endif
disableSerialization;

if (isNull (uiNameSpace getVariable "H8erHUD")) exitWith {};

private _display = uiNameSpace getVariable "H8erHUD";
if (isNil "_display") exitWith {};

private _textX = nil;

private _setText = _display displayCtrl 1001;
_setText ctrlSetBackgroundColor [0,0,0,0];

private _player = player getVariable ["owner",player];		// different, if remote-controlling
private _rank = localize (rank _player);
private _ucovertxt = [(localize "STR_info_bar_off"), (localize "STR_info_bar_on")] select ((captive _player) and !(_player getVariable ["incapacitated",false]));
private _rallytxt = [(localize "STR_info_bar_absent"), (localize "STR_info_bar_deployed")] select (!isNil "isRallyPointPlaced" && {isRallyPointPlaced});
if (_player getVariable ["isAFK", false]) then { _rallytxt = _rallytxt + " | <t color='#A81D1D'>AFK</t>" };
private _rivalsActivityTxt = [
	"",
	(format [" " + (localize "STR_info_bar_rivals_activity"), A3A_faction_riv get "name", [inactivityLevelRivals] call SCRT_fnc_rivals_getActivityLevelString])
] select (areRivalsEnabled && {areRivalsDiscovered && {!areRivalsDefeated}});

private _aggrString = nil;

switch (gameMode) do {
	case 3: {
		if (!areOccupantsDefeated) then {
			_aggrString = format [localize "STR_info_bar_aggr", A3A_faction_occ get "name", [aggressionLevelOccupants] call A3A_fnc_getAggroLevelString];
		} else {
			_aggrString = "";
		};
	};
	case 4: {
		if (!areInvadersDefeated) then {
			_aggrString = format [localize "STR_info_bar_aggr", A3A_faction_inv get "name", [aggressionLevelInvaders] call A3A_fnc_getAggroLevelString];
		} else {
			_aggrString = "";
		};
	};
	default {
		switch (true) do {
			case (!areOccupantsDefeated && {!areInvadersDefeated}): {
				_aggrString = format [localize "STR_info_bar_aggr_double", A3A_faction_occ get "name", [aggressionLevelOccupants] call A3A_fnc_getAggroLevelString,  A3A_faction_inv get "name", [aggressionLevelInvaders] call A3A_fnc_getAggroLevelString];
			};
			case (!areOccupantsDefeated && {areInvadersDefeated}): {
				_aggrString = format [localize "STR_info_bar_aggr", A3A_faction_occ get "name", [aggressionLevelOccupants] call A3A_fnc_getAggroLevelString];
			};
			case (!areInvadersDefeated && {areOccupantsDefeated}): {
				_aggrString = format [localize "STR_info_bar_aggr", A3A_faction_inv get "name", [aggressionLevelInvaders] call A3A_fnc_getAggroLevelString];
			};
			case (areOccupantsDefeated && {areOccupantsDefeated}): {
				_aggrString = "";
			};
		};
	};
};

private _hrMax = "";
private _hrLimit = "";

if (limitHR != 0) then {
	_hrLimit = (((tierWar * 100) * (limitHR / 100)) + 100);
	_hrMax = format[" / %1",_hrLimit]; 
};

_aggrString = _aggrString + _rivalsActivityTxt;

if (isNil "theBoss") exitWith {
	_textX = format [
		"<t size='0.67' shadow='2'>" + (localize "STR_info_bar_final_string_2"), 
		_rank, 
		(server getVariable "hr") toFixed 0, 
		A3A_faction_reb get "name", 
		(server getVariable "resourcesFIA") toFixed 0, 
		(_player getVariable "moneyX") toFixed 0, 
		_aggrString, 
		tierWar, 
		_ucovertxt, 
		_rallytxt, 
		A3A_faction_civ get "currencySymbol"
	];

	_setText ctrlSetStructuredText (parseText format ["%1", _textX]);
	_setText ctrlCommit 0;
};

if (_player != theBoss) then {
	private _nameC = [
		localize "STR_generic_commander_none",
		name theBoss
	] select (!(isNull theBoss));
	_textX = format [
		"<t size='0.67' shadow='2'>" + (localize "STR_info_bar_final_string_1"), 
		(server getVariable "hr") toFixed 0, 
		_rank, 
		_nameC, 
		(_player getVariable "moneyX") toFixed 0, 
		_aggrString, 
		tierWar, 
		_ucovertxt, 
		_rallytxt, 
		A3A_faction_civ get "currencySymbol",
		_hrMax
	];
} else {
	_textX = format [
		"<t size='0.67' shadow='2'>" + (localize "STR_info_bar_final_string_2"), 
		_rank, 
		(server getVariable "hr") toFixed 0, 
		A3A_faction_reb get "name", 
		(server getVariable "resourcesFIA") toFixed 0, 
		(_player getVariable "moneyX") toFixed 0, 
		_aggrString, 
		tierWar, 
		_ucovertxt, 
		_rallytxt, 
		A3A_faction_civ get "currencySymbol",
		_hrMax
	];
};

_setText ctrlSetStructuredText (parseText format ["%1", _textX]);
_setText ctrlCommit 0;

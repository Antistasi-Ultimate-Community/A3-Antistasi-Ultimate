#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_typeX", "_site"];

private ["_garrison","_costs","_hr","_size"];

//Not sure if needed
//Checks that were added but I'm not sure if it could be applied to my way to add something
// _positionTel = positionTel;
// positionXGarr = "";

// _nearX = [markersX,_positionTel] call BIS_fnc_nearestPosition;
// _positionX = getMarkerPos _nearX;

// if (getMarkerPos _nearX distance _positionTel > 40) exitWith {
// 	["Garrison", "You must click near a marked zone."] call A3A_fnc_customHint;
// #ifdef UseDoomGUI
// 	ERROR("Disabled due to UseDoomGUI Switch.")
// #else
// 	_nul=CreateDialog "build_menu";
// #endif
// };

// if (not(sidesX getVariable [_nearX,sideUnknown] == teamPlayer)) exitWith {
// 	["Garrison", format ["That zone does not belong to %1.",FactionGet(reb,"name")]] call A3A_fnc_customHint;
// #ifdef UseDoomGUI
// 	ERROR("Disabled due to UseDoomGUI Switch.")
// #else
// 	_nul=CreateDialog "build_menu";
// #endif
// };
// if ([_positionX] call A3A_fnc_enemyNearCheck) exitWith {
// 	["Garrison", "You cannot manage this garrison while there are enemies nearby."] call A3A_fnc_customHint;
// #ifdef UseDoomGUI
// 	ERROR("Disabled due to UseDoomGUI Switch.")
// #else
// _nul=CreateDialog "build_menu";
// #endif
// };

// if (_nearX in forcedSpawn) exitWith {
// 	["Garrison", "You cannot manage this garrison when there's a major attack incoming."] call A3A_fnc_customHint;
// #ifdef UseDoomGUI
// 	ERROR("Disabled due to UseDoomGUI Switch.")
// #else
// _nul=CreateDialog "build_menu";
// #endif
// };


private _watchpostFIA = _site in watchpostsFIA;
private _roadblockFIA = _site in roadblocksFIA;
private _aapostFIA = _site in aapostsFIA;
private _atpostFIA = _site in atpostsFIA;
private _hmgpostFIA = _site in hmgpostsFIA;

_garrison = if (!_watchpostFIA) then {
	garrison getVariable [_site,[]]
} else {
	A3A_faction_reb get "unitSniper"
};

if (_typeX == "rem") then {
	if ((count _garrison == 0) and {!(_watchpostFIA) || !(_roadblockFIA) || !(_aapostFIA) || !(_atpostFIA)}) exitWith {
		[
			localize "STR_notifiers_fail_type",
			localize "STR_notifiers_disband_header",
			parseText (localize "STR_notifiers_disband_no_garrison"),
			30
		] spawn SCRT_fnc_ui_showMessage;
	};
	_costs = 0;
	_hr = 0;

	switch (true) do {
		case (_watchpostFIA): {
			_costs = 50;
			_hr = 0;
			{
				_costs = _costs + (server getVariable [_x,0]);
				_hr = _hr + 1;
			} forEach (A3A_faction_reb get "groupSniper");
			_costs = round (_costs * 0.75);
		};
		case (_roadblockFIA): {
			_costs = [(A3A_faction_reb get "vehiclesLightArmed") # 0] call A3A_fnc_vehiclePrice; //car with mg
			_hr = 1; //static gunner
			{
				_costs = _costs + (server getVariable [_x,0]);
				_hr = _hr + 1;
			} forEach (A3A_faction_reb get "groupSquad");
			_costs = round (_costs * 0.75);
		};
		case (_aapostFIA): {
			_costs = [(A3A_faction_reb get "staticAA") # 0] call A3A_fnc_vehiclePrice; //AA
			_hr = 1; //static gunner
			{
				_costs = _costs + (server getVariable [_x,0]);
				_hr = _hr +1;
			} forEach  (A3A_faction_reb get "groupAaEmpl");
			_costs = round (_costs * 0.75);
		};
		case (_atpostFIA): {
			_costs = [(A3A_faction_reb get "staticAT") # 0] call A3A_fnc_vehiclePrice; //AT
			_hr = 1; //static gunner
			{
				_costs = _costs + (server getVariable [_x,0]);
				_hr = _hr +1;
			} forEach (A3A_faction_reb get "groupAtEmpl");
			_costs = round (_costs * 0.75);
		};
		case (_hmgpostFIA): {
			_costs = [(A3A_faction_reb get "staticMGs") # 0] call A3A_fnc_vehiclePrice; //HMG
			_hr = 1; //static gunner
			{
				_costs = _costs + (server getVariable [_x,0]);
				_hr = _hr +1;
			} forEach (A3A_faction_reb get "groupHmgEmpl");
			_costs = round (_costs * 0.75);
		};
		default {
			{
				_hr = _hr + 1;
				_costs = _costs + (server getVariable [_x,0]);
			} forEach _garrison;
		};
	};

	[_hr,_costs] remoteExec ["A3A_fnc_resourcesFIA",2];

	switch (true) do {
		case (_watchpostFIA): {
			garrison setVariable [_site,nil,true];
			watchpostsFIA = watchpostsFIA - [_site]; publicVariable "watchpostsFIA";
			markersX = markersX - [_site]; publicVariable "markersX";
			deleteMarker _site;
			sidesX setVariable [_site,nil,true];
		};
		case (_roadblockFIA): {
			garrison setVariable [_site,nil,true];
			roadblocksFIA = roadblocksFIA - [_site]; publicVariable "roadblocksFIA";
			markersX = markersX - [_site]; publicVariable "markersX";
			deleteMarker _site;
			sidesX setVariable [_site,nil,true];
		};
		case (_aapostFIA): {
			garrison setVariable [_site,nil,true];
			aapostsFIA = aapostsFIA - [_site]; publicVariable "aapostsFIA";
			markersX = markersX - [_site]; publicVariable "markersX";
			deleteMarker _site;
			sidesX setVariable [_site,nil,true];
		};
		case (_atpostFIA): {
			garrison setVariable [_site,nil,true];
			atpostsFIA = atpostsFIA - [_site]; publicVariable "atpostsFIA";
			markersX = markersX - [_site]; publicVariable "markersX";
			deleteMarker _site;
			sidesX setVariable [_site,nil,true];
		};
		case (_hmgpostFIA): {
			garrison setVariable [_site,nil,true];
			hmgpostsFIA = hmgpostsFIA - [_site]; publicVariable "hmgpostsFIA";
			markersX = markersX - [_site]; publicVariable "markersX";
			deleteMarker _site;
			sidesX setVariable [_site,nil,true];
		};
		default {
			garrison setVariable [_site,[],true];
			{if (_x getVariable ["markerX",""] == _site) then {deleteVehicle _x}} forEach allUnits;
		};
	};

	[_site] call A3A_fnc_mrkUpdate;

	[
		localize "STR_notifiers_fail_type",
		localize "STR_notifiers_disband_header",
		parseText format [localize "STR_notifiers_disband_success", _costs, _hr, A3A_faction_civ get "currencySymbol"],
		30
	] spawn SCRT_fnc_ui_showMessage;
} else {
	positionXGarr = _site;
	[localize "STR_garrison_garrison_header", format ["Info%1",[_site] call A3A_fnc_garrisonInfo]] call A3A_fnc_customHint;
	createDialog "garrisonRecruit";
	sleep 1;
	disableSerialization;

	_display = findDisplay 100;

	if (str (_display) != "no display") then {
		_ChildControl = _display displayCtrl 104;
		_ChildControl  ctrlSetTooltip format [localize "STR_dialog_cost_hire_no_HR",rifle_hr_cost,server getVariable (A3A_faction_reb get "unitRifle"), A3A_faction_civ get "currencySymbol"];
		_ChildControl = _display displayCtrl 105;
		_ChildControl  ctrlSetTooltip format [localize "STR_dialog_cost_hire_no_HR",MG_hr_cost,server getVariable (A3A_faction_reb get "unitMG"), A3A_faction_civ get "currencySymbol"];
		_ChildControl = _display displayCtrl 126;
		_ChildControl  ctrlSetTooltip format [localize "STR_dialog_cost_hire_no_HR",MED_hr_cost,server getVariable (A3A_faction_reb get "unitMedic"), A3A_faction_civ get "currencySymbol"];
		_ChildControl = _display displayCtrl 107;
		_ChildControl  ctrlSetTooltip format [localize "STR_dialog_cost_hire_no_HR",SL_hr_cost,server getVariable (A3A_faction_reb get "unitSL"), A3A_faction_civ get "currencySymbol"];
		_ChildControl = _display displayCtrl 108;
		_ChildControl  ctrlSetTooltip format [localize "STR_dialog_cost_hire_no_HR",LAT_hr_cost,server getVariable (A3A_faction_reb get "unitLAT"), A3A_faction_civ get "currencySymbol"];
		_ChildControl = _display displayCtrl 109;
		_ChildControl  ctrlSetTooltip format [localize "STR_dialog_cost_hire_no_HR",GL_hr_cost,server getVariable (A3A_faction_reb get "unitGL"), A3A_faction_civ get "currencySymbol"];
		_ChildControl = _display displayCtrl 110;
		_ChildControl  ctrlSetTooltip format [localize "STR_dialog_cost_hire_no_HR",Sniper_hr_cost,server getVariable (A3A_faction_reb get "unitSniper"), A3A_faction_civ get "currencySymbol"];
		_ChildControl = _display displayCtrl 111;
		_ChildControl  ctrlSetTooltip format [localize "STR_dialog_cost_hire_no_HR",AT_hr_cost,server getVariable (A3A_faction_reb get "unitAT"), A3A_faction_civ get "currencySymbol"];
		_ChildControl = _display displayCtrl 112;
		_ChildControl  ctrlSetTooltip format [localize "STR_dialog_cost_hire_no_HR",AA_hr_cost,server getVariable (A3A_faction_reb get "unitAA"), A3A_faction_civ get "currencySymbol"];
	};
};
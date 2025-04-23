#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

positionTel = [];

private _popFIA = 0;
private _popAAF = 0;
private _popCSAT = 0;
private _pop = 0;

private _dataX = nil;
private _numCiv = nil;
private _prestigeOPFOR = nil;
private _prestigeBLUFOR = nil;

{
	_dataX = server getVariable _x;
	_numCiv = _dataX select 0;
	_prestigeOPFOR = _dataX select 2;
	_prestigeBLUFOR = _dataX select 3;
	_popFIA = _popFIA + (_numCiv * (_prestigeBLUFOR / 100));
	_popAAF = _popAAF + (_numCiv * (_prestigeOPFOR / 100));
	_pop = _pop + _numCiv;
	if (_x in destroyedSites) then {_popCSAT = _popCSAT + _numCIV};
} forEach citiesX;
_popFIA = round _popFIA;
_popAAF = round _popAAF;

[localize "STR_A3A_cityinfo_header", format [localize "STR_A3A_cityinfo_general_info",_pop, _popFIA, _popAAF, _popCSAT,FactionGet(occ,"name"),FactionGet(reb,"name"),getText (configfile >> "CfgWorlds" >> worldname >> "description")]] call A3A_fnc_customHint;

if (!visibleMap) then {openMap true};

onMapSingleClick "positionTel = _pos;";

private _textX = nil;
private _power = nil;
private _busy = nil;
private _siteX = nil;
private _positionTel = nil;
private _garrison = nil;

private _measureGarrison = {
	params ["_siteX", "_textX", "_thresholds"];
	_garrison = count (garrison getVariable [_siteX, []]);

	private _str = switch (true) do {
		case (_garrison >= (_thresholds select 0)): {
			localize "STR_A3A_cityinfo_garrison_good"
		};
		case (_garrison >= (_thresholds select 1)): {
			localize "STR_A3A_cityinfo_garrison_weakened"
		};
		default {
			localize "STR_A3A_cityinfo_garrison_decimated"
		};
	};

	format [_str, _textX]
};

while {visibleMap} do {
	sleep 1;
	if (count positionTel > 0) then {
		_positionTel = positionTel;
		_siteX = [markersX, _positionTel] call BIS_Fnc_nearestPosition;
		_textX = localize "STR_A3A_cityinfo_zone_click";
		private _side = sidesX getVariable [_siteX,sideUnknown];
        private _faction = Faction(_side);
		_nameFaction = _faction get "name";
		if (_siteX == "Synd_HQ") then {
			_textX = format ["%2 HQ%1",[_siteX] call A3A_fnc_garrisonInfo,FactionGet(reb,"name")];
		};
		if (_siteX in citiesX) then {
			_dataX = server getVariable _siteX;

			_numCiv = _dataX select 0;
			_prestigeOPFOR = round (_dataX select 2);
			_prestigeBLUFOR = round (_dataX select 3);
			_power = [_siteX] call A3A_fnc_getSideRadioTowerInfluence;
			_textX = format [localize "STR_A3A_cityinfo_text_1",_siteX,_numCiv,_prestigeOPFOR,_prestigeBLUFOR,"%",FactionGet(occ,"name"),FactionGet(reb,"name")];
			_positionX = getMarkerPos _siteX;
			_result = switch (_power) do {
				case teamPlayer: {FactionGet(reb,"name")};
				case Occupants: {FactionGet(occ,"name")};
				case Invaders: {FactionGet(inv,"name")};
                default {"NONE"};
			};

			_textX = format [localize "STR_A3A_cityinfo_influence",_textX,_result];
			if (_siteX in destroyedSites) then {_textX = format [localize "STR_A3A_cityinfo_destroyed",_textX]};
			if (sidesX getVariable [_siteX,sideUnknown] == teamPlayer) then {_textX = format ["%1<br/>%2",_textX,[_siteX] call A3A_fnc_garrisonInfo]};
		};
		if (_siteX in airportsX) then {
			if (not(sidesX getVariable [_siteX,sideUnknown] == teamPlayer)) then {
				_textX = format [localize "STR_A3A_cityinfo_airport",_nameFaction];
				_busy = [_siteX,true] call A3A_fnc_airportCanAttack;
				if (_busy) then {_textX = format [localize "STR_A3A_cityinfo_status_idle",_textX]} else {_textX = format [localize "STR_A3A_cityinfo_status_busy",_textX]};

				_textX = [_siteX, _textX, [40, 20]] call _measureGarrison;
			}
			else {
				_textX = format [localize "STR_A3A_cityinfo_airport_rebel",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
			};
		};
		if (_siteX in resourcesX) then {
			if (not(sidesX getVariable [_siteX,sideUnknown] == teamPlayer)) then {
				_textX = format [localize "STR_A3A_cityinfo_resources",_nameFaction];
				_textX = [_siteX, _textX, [30, 10]] call _measureGarrison;
			}
			else {
				_textX = format [localize "STR_A3A_cityinfo_resources_rebel",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
			};
			if (_siteX in destroyedSites) then {_textX = format [localize "STR_A3A_cityinfo_destroyed",_textX]};
		};
		if (_siteX in factories) then {
			if (not(sidesX getVariable [_siteX,sideUnknown] == teamPlayer)) then {
				_textX = format [localize "STR_A3A_cityinfo_factory",_nameFaction];
				_textX = [_siteX, _textX, [16, 8]] call _measureGarrison;
			}
			else {
				_textX = format [localize "STR_A3A_cityinfo_factory_rebel",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
			};
			if (_siteX in destroyedSites) then {_textX = format [localize "STR_A3A_cityinfo_destroyed",_textX]};
		};
		if (_siteX in outposts) then {
			if (not(sidesX getVariable [_siteX,sideUnknown] == teamPlayer)) then {
				_textX = format [localize "STR_A3A_cityinfo_outpost",_nameFaction];
				_busy = [_siteX,true] call A3A_fnc_airportCanAttack;
				if (_busy) then {_textX = format [localize "STR_A3A_cityinfo_status_idle",_textX]} else {_textX = format [localize "STR_A3A_cityinfo_status_busy",_textX]};
				_textX = [_siteX, _textX, [16, 8]] call _measureGarrison;
			}
			else {
				_textX = format [localize "STR_A3A_cityinfo_outpost_rebel",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
			};
		};
		if (_siteX in seaports) then {
			if (not(sidesX getVariable [_siteX,sideUnknown] == teamPlayer)) then {
				_textX = format [localize "STR_A3A_cityinfo_seaport",_nameFaction];
				_garrison = count (garrison getVariable [_siteX, []]);
				_textX = [_siteX, _textX, [20, 8]] call _measureGarrison;
			}
			else {
				_textX = format [localize "STR_A3A_cityinfo_seaport_rebel",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
			};
		};
		if (_siteX in milbases) then {
			if (not(sidesX getVariable [_siteX,sideUnknown] == teamPlayer)) then {
				_textX = format [localize "STR_A3A_cityinfo_milbase",_nameFaction];
				_busy = [_siteX,true] call A3A_fnc_airportCanAttack;
				if (_busy) then {_textX = format [localize "STR_A3A_cityinfo_status_idle",_textX]} else {_textX = format [localize "STR_A3A_cityinfo_status_busy",_textX]};
				_textX = [_siteX, _textX, [40, 20]] call _measureGarrison;
			}
			else {
				_textX = format [localize "STR_A3A_cityinfo_milbase_rebel",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
			};
		};
		if (_siteX in watchpostsFIA) then {
			_textX = format [localize "STR_A3A_cityinfo_watchpost",_nameFaction];
		};
		if (_siteX in roadblocksFIA) then {
			_textX = format [localize "STR_A3A_cityinfo_roadblock",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
		};
		if (_siteX in aapostsFIA) then {
			_textX = format [localize "STR_A3A_cityinfo_aaempl",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
		};
		if (_siteX in atpostsFIA) then {
			_textX = format [localize "STR_A3A_cityinfo_atempl",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
		};
		if (_siteX in hmgpostsFIA) then {
			_textX = format [localize "STR_A3A_cityinfo_hmgempl",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
		};
		if (hideEnemyMarkers) then {
			if (_siteX in markersImmune || {(sidesX getVariable [_siteX,sideUnknown]) == teamPlayer}) then {
				[localize "STR_A3A_cityinfo_header", _textX] call A3A_fnc_customHint;
			};
		} else {
			[localize "STR_A3A_cityinfo_header", _textX] call A3A_fnc_customHint;
		};
	};
	positionTel = [];
};
onMapSingleClick "";

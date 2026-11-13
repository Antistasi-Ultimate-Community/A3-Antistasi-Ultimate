#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {Error("Server-only function miscalled")};

waitUntil {!cityIsSupportChanging};
cityIsSupportChanging = true;

params ["_pos", "_isRebel"];

if (_pos isEqualTo "" || {_pos isEqualTo []}) exitWith {
	Error("Function was called incorrectly. _pos must be a city varname (STR) or coordinates (ARR).")
};

private _city = if (_pos isEqualType "") then {_pos} else {[citiesX, _pos] call BIS_fnc_nearestPosition};
private _cityData = A3A_townData get _city;
if (isNil "_cityData" || {!(_cityData isEqualType [])}) exitWith
{
	cityIsSupportChanging = false;
    Error_1("No data found for city %1", _city);
};
_cityData params ["_numCiv", "_numVeh", "_supportGov", "_supportReb"];

if (_isRebel) then {
	_supportGov = 0;
	_supportReb = 100;
} else {
	_supportGov = 100;
	_supportReb = 0;
};

private _cityData = [_numCiv, _numVeh, _supportGov, _supportReb];

A3A_townData set [_city, _cityData]; publicVariable "A3A_townData";
cityIsSupportChanging = false;
[_city] call A3A_fnc_mrkUpdate;
true
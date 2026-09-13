#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params [["_isInit", false]];

private _citiesX = [];
private _citiesXData = [];

private _mapInfo = call A3A_fnc_getMapInfo;
private _townPopulations = getArray (_mapInfo/"population");
private _disabledTowns = getArray (_mapInfo/"disabledTowns");
{server setVariable [_x select 0,_x select 1]} forEach _townPopulations;
private _hardCodedPopulation = _townPopulations isNotEqualTo [];

private _cityConfigs = "(toLower getText (_x >> ""type"") in [""namecitycapital"",""namecity"",""namevillage"",""citycenter""]) &&
!(getText (_x >> ""Name"") isEqualTo """") && !((configName _x) in _disabledTowns)"
configClasses (configfile >> "CfgWorlds" >> worldName >> "Names");
if (toLowerANSI worldName isEqualTo "blud_vidda") then {
	private _rv133 = ("configName _x == 'DefaultKeyPoint32'" configClasses (configfile >> "CfgWorlds" >> worldName >> "Names")) select 0;
	_cityConfigs pushBack _rv133; //RV-133, big city without city marker
};

_cityConfigs apply {
	private _nameX = getText (_x >> "Name");
	private _sizeX = getNumber (_x >> "radiusA");
	private _sizeY = getNumber (_x >> "radiusB");
	private _size = [_sizeY, _sizeX] select (_sizeX > _sizeY);
	private _pos = getArray (_x >> "position");
	private _size = [_size, 400] select (_size < 400);
	private _numCiv = 0;

	if (_hardCodedPopulation) then
	{
		_numCiv = server getVariable [_nameX, server getVariable (configName _x)]; //backwards compat to config name based pop defines
		if (isNil "_numCiv" || {!(_numCiv isEqualType 0)}) then
		{
            Error_1("Bad population count data for %1", _nameX);
			_numCiv = (count (nearestObjects [_pos, ["house"], _size]));
		};
	}
	else {
		_numCiv = (count (nearestObjects [_pos, ["house"], _size]));
	};

	_roads = nearestTerrainObjects [_pos, ["MAIN ROAD", "ROAD", "TRACK"], _size, true, true];
	if (count _roads > 0) then {
		// Move marker position to the nearest road, if any
		_pos = _roads select 0;
	};
	_numVeh = (count _roads) min (_numCiv / 3);

	private _info = [_numCiv, _numVeh, 75, 0];
    _citiesX pushBack _nameX;
    _citiesXData append [[_nameX, _info]]; // initial 75% gov, 0% rebel support
	server setVariable [_nameX, _info, true];

    if (_isInit) then {
        [_nameX, _pos, _size] call A3A_fnc_initCities;
    };
};

[_citiesX, _citiesXData];
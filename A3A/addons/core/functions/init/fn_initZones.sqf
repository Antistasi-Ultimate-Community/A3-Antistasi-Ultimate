//usage: place on the map markers covering the areas where you want the AAF operate, and put names depending on if they are powerplants,resources, bases etc.. The marker must cover the whole operative area, it's buildings etc.. (for example in an airport, you must cover more than just the runway, you have to cover the service buildings etc..)
//markers cannot have more than 500 mts size on any side or you may find "insta spawn in your nose" effects.
//do not do it on cities and hills, as the mission will do it automatically
//the naming convention must be as the following arrays, for example: first power plant is "power", second is "power_1" thir is "power_2" after you finish with whatever number.
//to test automatic zone creation, init the mission with debug = true in init.sqf
//of course all the editor placed objects (petros, flag, respawn marker etc..) have to be ported to the new island
//deletion of a marker in the array will require deletion of the corresponding marker in the editor
//only touch the commented arrays
scriptName "initZones.sqf";
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Info("initZones started");

forcedSpawn = [];
citiesX = [];
private _mapInfo = missionConfigFile/"A3A"/"mapInfo"/toLower worldName;
if (!isClass _mapInfo) then {_mapInfo = configFile/"A3A"/"mapInfo"/toLower worldName};

[] call A3A_fnc_prepareMarkerArrays;

private ["_name", "_sizeX", "_sizeY", "_size", "_pos", "_mrk"];

if ((toLower worldName) in ["altis", "chernarus_summer"]) then {
	"((getText (_x >> ""type"")) == ""Hill"") &&
	!((getText (_x >> ""name"")) isEqualTo """") &&
	!(configName _x isEqualTo ""Magos"")"
	configClasses (configfile >> "CfgWorlds" >> worldName >> "Names") apply {

		_name = configName _x;
		_sizeX = getNumber (_x >> "radiusA");
		_sizeY = getNumber (_x >> "radiusB");
		_size = [_sizeX, _sizeY] select (_sizeX <= _sizeY);
		_pos = getArray (_x >> "position");
		_size = [_size, 50] select (_size < 10);
		_mrk = createmarker [format ["%1", _name], _pos];
		_mrk setMarkerSizeLocal [_size, _size];
		_mrk setMarkerShapeLocal "ELLIPSE";
		_mrk setMarkerBrushLocal "SOLID";
		_mrk setMarkerColorLocal "ColorRed";
		_mrk setMarkerText _name;
		controlsX pushBack _name;
	};
};  //this only for Altis and Cherno
if (debug) then {
    Debug_1("Setting Spawn Points for %1.", worldname);
};
//We're doing it this way, because Dedicated servers world name changes case, depending on how the file is named.
//And weirdly, == is not case sensitive.
//this comments has not an information about the code

(seaMarkers + seaSpawn + seaAttackSpawn + spawnPoints + detectionAreas) apply {_x setMarkerAlpha 0};
defaultControlIndex = (count controlsX) - 1;
watchpostsFIA = [];
roadblocksFIA = [];
aapostsFIA = [];
hmgpostsFIA = [];
atpostsFIA = [];
destroyedSites = [];
garrison setVariable ["Synd_HQ", [], true];
markersX = airportsX + milbases + resourcesX + factories + outposts + seaports + controlsX + ["Synd_HQ"];
{
	_x setMarkerAlpha 0;
	spawner setVariable [_x, 2, true];
} forEach markersX;

// Set up dummy markers + autogen roadblocks
call A3A_fnc_initBases;


Info("Setting up towns");

//Disables Towns/Villages, Names can be found in configFile >> "CfgWorlds" >> "WORLDNAME" >> "Names"
private ["_nameX", "_roads", "_numCiv", "_roadsProv", "_roadcon", "_dmrk", "_info"];

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
	_nameX = getText (_x >> "Name");
	_sizeX = getNumber (_x >> "radiusA");
	_sizeY = getNumber (_x >> "radiusB");
	_size = [_sizeY, _sizeX] select (_sizeX > _sizeY);
	_pos = getArray (_x >> "position");
	_size = [_size, 400] select (_size < 400);
	_numCiv = 0;

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

	_mrk = createmarkerLocal [format ["%1", _nameX], _pos];
	_mrk setMarkerSizeLocal [_size, _size];
	_mrk setMarkerShapeLocal "RECTANGLE";
	_mrk setMarkerBrushLocal "SOLID";
	_mrk setMarkerColorLocal colorOccupants;
	_mrk setMarkerTextLocal _nameX;
	_mrk setMarkerAlpha 0;
	citiesX pushBack _nameX;
	spawner setVariable [_nameX, 2, true];

	_dmrk = createMarkerLocal [format ["Dum%1", _nameX], _pos];
	_dmrk setMarkerShapeLocal "ICON";
	_dmrk setMarkerTypeLocal "loc_Ruin";
	_dmrk setMarkerColor colorOccupants;

	sidesX setVariable [_mrk, Occupants, true];
	_info = [_numCiv, _numVeh, 75, 0];				// initial 75% gov, 0% rebel support
	server setVariable [_nameX, _info, true];
};	//find in congigs faster then find location in 25000 radius


markersX append citiesX;
sidesX setVariable ["Synd_HQ", teamPlayer, true];
sidesX setVariable ["NATO_carrier", Occupants, true];
sidesX setVariable ["CSAT_carrier", Invaders, true];


Info("Setting up zone-dependent objects - antennas and banks");

antennasDead = [];
banks = [];
mrkAntennas = [];
antennas = [];
private _banktypes = ["land_gm_euro_office_01", "Land_Offices_01_V1_F"];
private _antennatypes = ["Land_TTowerBig_1_F", "Land_TTowerBig_2_F", "Land_Communication_F",
"Land_Vysilac_FM","Land_A_TVTower_base","Land_Telek1", "Land_vn_tower_signal_01"];
private ["_antenna", "_mrkFinal", "_antennaProv"];
if (debug) then {
    Debug("Setting up Radio Towers.");
};

private _posAntennas = getArray (_mapInfo/"antennas");
private _blacklistIndex = getArray (_mapInfo/"antennasBlacklistIndex");
private _hardCodedAntennas = _posAntennas isNotEqualTo [];

private _posBank = getArray (_mapInfo/"banks");
if ( _posBank isEqualTo []) then {banks = nearestObjects [[worldSize/2, worldSize/2], _banktypes, worldSize]};

// Land_A_TVTower_base can't be destroyed, Land_Communication_F and Land_Vysilac_FM are not replaced with "Ruins" when destroyed.
// This causes issues with persistent load and rebuild scripts, so we replace those with antennas that work properly.
private _replaceBadAntenna = {
	params ["_antenna"];
	if ((typeof _antenna) in ["Land_Communication_F", "Land_Vysilac_FM", "Land_A_TVTower_Base"]) then {
		hideObjectGlobal _antenna;
		if (typeof _antenna == "Land_A_TVTower_Base") then {
			// The TV tower is composed of 3 sections - need to hide them all
			private _otherSections = nearestObjects [_antenna, ["Land_A_TVTower_Mid", "Land_A_TVTower_Top"], 200];
			{ hideObjectGlobal _x; } forEach _otherSections;
		};
		private _antennaPos = getPos _antenna;
		_antennaPos set [2, 0];
		private _antennaClass = if (worldName isEqualTo "chernarus_summer") then { "Land_Telek1" } else { "Land_TTowerBig_2_F" };
		_antenna = createVehicle [_antennaClass, _antennaPos, [], 0, "NONE"];
	};
	_antenna;
};

if (!_hardCodedAntennas) then {
    antennas = nearestObjects [[worldSize /2, worldSize/2], _antennatypes, worldSize];

    private _replacedAntennas = [];
    { _replacedAntennas pushBack ([_x] call _replaceBadAntenna); } forEach antennas;
    antennas = _replacedAntennas;

    antennas apply {
        _mrkFinal = createMarker [format ["Ant%1", mapGridPosition _x], position _x];
        _mrkFinal setMarkerShapeLocal "ICON";
        _mrkFinal setMarkerTypeLocal "loc_Transmitter";
        _mrkFinal setMarkerColorLocal "ColorBlack";
        _mrkFinal setMarkerText localize "STR_radiotower";
        mrkAntennas pushBack _mrkFinal;
        _x addEventHandler [
            "Killed",
            {
                _antenna = _this select 0;
                _antenna removeAllEventHandlers "Killed";

                citiesX apply {
                    if ([antennas,_x] call BIS_fnc_nearestPosition == _antenna) then {
                        [_x, false] spawn A3A_fnc_blackout;
                    };
                };

                _mrk = [mrkAntennas, _antenna] call BIS_fnc_nearestPosition;
                antennas = antennas - [_antenna];
                antennasDead pushBack _antenna;
                deleteMarker _mrk;
                publicVariable "antennas";
                publicVariable "antennasDead";
                ["TaskSucceeded", ["", localize "STR_notifiers_radiotower_destroyed"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
                ["TaskFailed", ["", localize "STR_notifiers_radiotower_destroyed"]] remoteExec ["BIS_fnc_showNotification", Occupants];
            }
        ];
    };
};

if (debug) then {
    Debug("Radio Tower built.");
    Debug("Finding broken Radio Towers.");
};
if (count _posAntennas > 0) then {
	for "_i" from 0 to (count _posAntennas - 1) do {
		_antennaProv = nearestObjects [_posAntennas select _i, _antennaTypes, 35];

		if (count _antennaProv > 0) then {
			_antenna = _antennaProv select 0;

			if (_i in _blacklistIndex) then {
				_antenna setdamage 1;
			} else {
				_antenna = ([_antenna] call _replaceBadAntenna);
				antennas pushBack _antenna;
				_mrkFinal = createMarker [format ["Ant%1", mapGridPosition _antenna], _posAntennas select _i];
				_mrkFinal setMarkerShapeLocal "ICON";
				_mrkFinal setMarkerTypeLocal "loc_Transmitter";
				_mrkFinal setMarkerColorLocal "ColorBlack";
				_mrkFinal setMarkerText localize "STR_radiotower";
				mrkAntennas pushBack _mrkFinal;

				_antenna addEventHandler [
					"Killed",
					{
						_antenna = _this select 0;
						_antenna removeAllEventHandlers "Killed";

						citiesX apply {
							if ([antennas, _x] call BIS_fnc_nearestPosition == _antenna) then {
								[_x, false] spawn A3A_fnc_blackout
							};
						};

						_mrk = [mrkAntennas, _antenna] call BIS_fnc_nearestPosition;
						antennas = antennas - [_antenna];
						antennasDead pushBack  _antenna;
						deleteMarker _mrk;
						publicVariable "antennas";
						publicVariable "antennasDead";
						["TaskSucceeded", ["", localize "STR_notifiers_radiotower_destroyed"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
						["TaskFailed", ["", localize "STR_notifiers_radiotower_destroyed"]] remoteExec ["BIS_fnc_showNotification", Occupants];
					}
				];
			};
		};
	};
};
if (debug) then {
	Error("Broken Radio Towers identified.");
};
if (count _posBank > 0) then {
	for "_i" from 0 to (count _posBank - 1) do {
		_bankProv = nearestObjects [_posBank select _i, _banktypes, 30];

		if (count _bankProv > 0) then {
			private _banco = _bankProv select 0;
			banks = banks + [_banco];
		};
	};
};

// Make list of markers that don't have a proper road nearby
// TODO: Nearly obsolete. Switch convoy code to road distance checks & markerNavPoint

blackListDest = (markersX - controlsX - ["Synd_HQ"] - citiesX) select {
	private _nearRoads = (getMarkerPos _x) nearRoads (([_x] call A3A_fnc_sizeMarker) * 1.5);
//	_nearRoads = _nearRoads inAreaArray _x;
	private _badSurfaces = ["#GdtForest", "#GdtRock", "#GdtGrassTall"];
	private _idx = _nearRoads findIf { !(surfaceType (position _x) in _badSurfaces) && { count roadsConnectedTo _x != 0 } };
	if (_idx == -1) then {true} else {false};
};


Info("Setting up fuel stations");

// fuel rework
private _fuelStationTypes = getArray (_mapInfo/"fuelStationTypes");
if( _fuelStationTypes isEqualTo [] ) then {_fuelStationTypes = ["Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F","Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell","Land_vn_b_prop_fueldrum_01","Land_vn_usaf_fueltank_75_01","Land_vn_fuelstation_feed_f","Land_vn_fuelstation_01_pump_f","Land_vn_fuelstation_02_pump_f"]};
A3A_fuelStationTypes = _fuelStationTypes;
A3A_fuelStations = nearestObjects [[worldSize/2, worldSize/2], _fuelStationTypes, worldSize];
A3A_fuelStations apply {
	_mrkFinalFuel = createMarker [format ["Ant%1", mapGridPosition _x], position _x];
	_mrkFinalFuel setMarkerShapeLocal "ICON";
	_mrkFinalFuel setMarkerTypeLocal "loc_Fuelstation";
	_mrkFinalFuel setMarkerColorLocal "ColorWhite";
	_mrkFinalFuel setMarkerTextLocal localize "STR_fuelstation";
	_mrkFinalFuel setMarkerAlpha 0.75;
	if(A3A_hasACE) then {
		[_x, 250] call ace_refuel_fnc_setFuel; // only call on fuels that are not blacklisted and first zone init.
	};
};

Info("Setting up military administrations");

milAdministrationsX = [];
A3A_milAdministrations = [];
A3A_destroyedMilAdministrations = [];

private _milAdministrationTypes = [
	"Land_zachytka_nov",
	"Land_zachytka",
	"Land_PoliceStation_01_F",
	"Land_i_Barracks_V1_F", 
	"Land_Barracks_01_dilapidated_F", 
	"Land_Barracks_01_grey_F", 
	"Land_Barracks_01_camo_F", 
	"Land_i_Barracks_V2_F", 
	"Land_u_Barracks_V2_F",
	"Land_vn_i_barracks_v1_f", 
	"Land_vn_barracks_01_dilapidated_f", 
	"Land_vn_barracks_01_grey_f", 
	"Land_vn_barracks_01_camo_f", 
	"Land_vn_i_barracks_v2_f",
	"land_gm_euro_office_02"
];
private _milAdminPositions = getArray (_mapInfo/"milAdministrations");

{
	private _milAdmins = (nearestObjects [_x, _milAdministrationTypes, 30]) select {!isObjectHidden _x && {alive _x}};
	if (_milAdmins isEqualTo []) then {
		continue;
	};

	private _administration = _milAdmins select 0;
	A3A_milAdministrations pushBack _administration;

	private _mrkAdm = createMarker [format ["MilAdm%1", mapGridPosition _administration], position _administration];
	_mrkAdm setMarkerShapeLocal "ICON";
	_mrkAdm setMarkerTypeLocal "loc_MilAdministration";
	_mrkAdm setMarkerColorLocal colorOccupants;
	_mrkAdm setMarkerTextLocal localize "STR_milAdministration";
	_mrkAdm setMarkerAlpha 0.75;

	sidesX setVariable [_mrkAdm, Occupants, true];

	spawner setVariable [_mrkAdm, 2, true];

	milAdministrationsX pushBack _mrkAdm;

	_administration addEventHandler ["Killed", {
		[(this select 0), "DESTROY"] call SCRT_fnc_location_removeMilAdmin;
	}];
} forEach _milAdminPositions;

// markersX append milAdministrationsX;

publicVariable "blackListDest";
publicVariable "markersX";
publicVariable "citiesX";
publicVariable "airportsX";
publicVariable "milbases";
publicVariable "resourcesX";
publicVariable "factories";
publicVariable "outposts";
publicVariable "controlsX";
publicVariable "seaports";
publicVariable "destroyedSites";
publicVariable "forcedSpawn";
publicVariable "watchpostsFIA";
publicVariable "roadblocksFIA";
publicVariable "aapostsFIA";
publicVariable "atpostsFIA";
publicVariable "hmgpostsFIA";
publicVariable "seaMarkers";
publicVariable "spawnPoints";
publicVariable "antennas";
publicVariable "antennasDead";
publicVariable "mrkAntennas";
publicVariable "banks";
publicVariable "seaSpawn";
publicVariable "seaAttackSpawn";
publicVariable "defaultControlIndex";
publicVariable "detectionAreas";
publicvariable "A3A_fuelStations";
publicvariable "A3A_fuelStationTypes";
publicVariable "milAdministrationsX";
publicvariable "A3A_milAdministrations";
publicvariable "A3A_destroyedMilAdministrations";

initZonesDone = true;				// signal headless clients that they can start nav init
publicVariable "initZonesDone";

Info("initZones completed");

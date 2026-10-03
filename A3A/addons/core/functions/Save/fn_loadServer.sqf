#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Info("loadServer Starting.");
if (isServer) then {
    Info("Starting Persistent Load.");
	petros allowdamage false;

	// Tell third party mods we're loading the game. Do this very early in case
	// they attempt to overwrite stuff we're loading later below.
	private _saveDataPlugins = ["saveDataPlugins"] call A3A_fnc_getStatVariable;
	if (isNil "_saveDataPlugins") then {
		_saveDataPlugins = createHashMap;
	} else {
		if (_saveDataPlugins isEqualType []) then {
			// Possible involuntary conversion from hashmap to array
			_saveDataPlugins = createHashMapFromArray _saveDataPlugins;
		};
	};

	if !assert(_saveDataPlugins isEqualType createHashMap) then {
		Error_1("Plugins save data has unexpected type ""%1""",typeName _saveDataPlugins);
		_saveDataPlugins = createHashMap;
	};

	[CBA_EVENT_SERVER_GAME_LOAD, [_saveDataPlugins]] call FUNCMAIN(triggerLocalEvent);

	// Set all main markers to occupant control by default, overridden by mrkSDK & mrkCSAT
	{
		if (sidesX getVariable _x != Occupants) then { sidesX setVariable [_x, Occupants, true] };
	} forEach (airportsX + resourcesX + factories + outposts + seaports + milbases);

	A3A_saveVersion = 0;
	{ [_x] call A3A_fnc_getStatVariable } forEach [
		"version",
		"mrkSDK",
		"mrkCSAT",
		"destroyedSites",
		"minesX",
		"antennas",
		"hr",
		"dateX",
		"weather",
		"prestigeOPFOR",
		"prestigeBLUFOR",
		"resourcesFIA",
		"garrison",
		"usesWurzelGarrison",
		"skillFIA",
		"membersX",
		"HR_Garage",
		"A3A_fuelAmountleftArray",
		"destroyedBuildings",
		"enemyResources",
		"HQKnowledge",
		"killZones",
		"controlsSDK",
		"bombRuns",
		"jna_dataList",
		"watchpostsFIA",
		"roadblocksFIA",
		"aapostsFIA",
		"hmgpostsFIA",
		"atpostsFIA",
		"supportPoints",
		"areOccupantsDefeated",
		"areInvadersDefeated",
		"isTraderQuestAssigned",
		"isTraderQuestCompleted",
		"traderPosition",
		"traderDiscount",
		"destroyedMilAdmins",
		"rebelLoadouts",
		"randomizeRebelLoadoutUniforms",
		"areRivalsDiscovered",
		"areRivalsDefeated",
		"rivalsLocationsMap",
		"rivalsExcludedLocations",
		"nextRivalsLocationReveal",
		"constructionsX",
		"isRivalsDiscoveryQuestAssigned",
		"revealedZones",
		"unlockedVehicleTypes",
		"occupantsRadioKeys",
		"invaderRadioKeys",
		"aggressionOccupants",
		"aggressionInvaders",
		"inactivityRivals",
		"chopForest",
		"posHQ",
		"nextTick",
		"staticsX",
		"wurzelGarrison",
		"testingTimerIsActive",
		"tasks"
	];

	{ publicVariable _x } forEach [
		"watchpostsFIA",
		"roadblocksFIA",
		"aapostsFIA",
		"hmgpostsFIA",
		"atpostsFIA",
		"revealedZones",
		"unlockedVehicleTypes",
		"occupantsRadioKeys",
		"invaderRadioKeys"
	];

	//===========================================================================

	//RESTORE THE STATE OF THE 'UNLOCKED' VARIABLES USING JNA_DATALIST
	private _categoriesToPublish = createHashMap;
	{
		private _arsenalTabDataArray = _x;
		private _unlockedItemsInTab = _arsenalTabDataArray select { _x select 1 == -1 } apply { _x select 0 };
		{
			private _categories = [_x, true, true] call A3A_fnc_unlockEquipment;
			_categoriesToPublish insert [true, _categories, []];
		} forEach _unlockedItemsInTab;
	} forEach jna_dataList;

	Info_1("Categories to publish: %1", keys _categoriesToPublish);

	// Publish the unlocked categories (once each)
	{ publicVariable ("unlocked" + _x) } forEach keys _categoriesToPublish;

	//Check if we have radios unlocked and update haveRadio.
	call A3A_fnc_checkRadiosUnlocked;

	// Set enemy roadblock allegiance to match nearest main marker
	private _mainMarkers = markersX - controlsX -  watchpostsFIA - roadblocksFIA - aapostsFIA - atpostsFIA - hmgpostsFIA;
    {
        if (sidesX getVariable [_x,sideUnknown] != teamPlayer) then {
            private _nearX = [_mainMarkers, markerPos _x] call BIS_fnc_nearestPosition;
            private _sideX = sidesX getVariable [_nearX,sideUnknown];
            sidesX setVariable [_x,_sideX,true];
        };
    } forEach controlsX;

    [markersX - controlsX] call A3U_fnc_mrkUpdateBulk;
    if !(milAdministrationsX isEqualTo []) then {[milAdministrationsX] call A3U_fnc_mrkUpdateBulk};
    if !(mrkAntennas isEqualTo []) then {[mrkAntennas] call A3U_fnc_mrkUpdateBulk};
    // ---------------------------

	markersX append (watchpostsFIA + roadblocksFIA + aapostsFIA + atpostsFIA + hmgpostsFIA);
	publicVariable "markersX";

	{
		if (_x in destroyedSites) then {
			sidesX setVariable [_x, Invaders, true];
			[_x] call A3A_fnc_destroyCity
		};
	} forEach citiesX;

    //Load aggro stacks and level and calculate current level
    [true] call A3A_fnc_calculateAggression;
	[true] call SCRT_fnc_rivals_calculateActivity;

	{_x setPos getMarkerPos respawnTeamPlayer} forEach ((call A3A_fnc_playableUnits) select {side _x == teamPlayer});
	_sites = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};

	// Move headless client logic objects near HQ so that firedNear EH etc. work more reliably
	private _hcpos = markerPos respawnTeamPlayer vectorAdd [-100, -100, 0];
	{ _x setPosATL _hcpos } forEach (entities "HeadlessClient_F");

	tierPreference = 1;
	publicVariable "tierPreference";
	// update war tier silently, calls updatePreference if changed
	[true] call A3A_fnc_tierCheck;

	if (isNil "usesWurzelGarrison") then {
		//Create the garrison new
        Info("No WurzelGarrison found, creating new!");
		[airportsX, "Airport", [0,0,0]] spawn A3A_fnc_createGarrison;	//New system
		[resourcesX, "Other", [0,0,0]] spawn A3A_fnc_createGarrison;	//New system
		[milbases, "MilitaryBase", [0,0,0]] spawn A3A_fnc_createGarrison;	//New system
		[factories, "Other", [0,0,0]] spawn A3A_fnc_createGarrison;
		[outposts, "Outpost", [1,1,0]] spawn A3A_fnc_createGarrison;
		[seaports, "Other", [1,0,0]] spawn A3A_fnc_createGarrison;

	};

    // Load all player data into A3A_playerSaveData hashmap. Works around issues with game copies
	_savedPlayers = "savedPlayers" call A3A_fnc_returnSavedStat;
	if (isNil "_savedPlayers") then { _savedPlayers = [] };
	{
		private _uid = _x;
		private _playerData = createHashMap;
		{
			_playerData set [_x, [_uid, _x] call A3A_fnc_retrievePlayerStat];
		} forEach ["moneyX", "loadoutPlayer", "scorePlayer", "rankPlayer", "personalGarage", "pluginsData"];

		if (isNil {_playerData get "moneyX"}) then { Error_1("Saved player %1 has no money var", _uid); continue };
		A3A_playerSaveData set [_uid, _playerData];
	} forEach _savedPlayers;

    Info("Persistent Load Completed.");

	[CBA_EVENT_SERVER_SPAWN_LOCATION, LINKFUNCMAIN(crewLocationStatics)] call FUNCMAIN(addEventHandler);

	statsLoaded = 0; publicVariable "statsLoaded";
	petros allowdamage true;

	{specialVarLoads deleteAt _x;} forEach (keys specialVarLoads);
	specialVarLoads = nil;
};
Info("loadServer Completed.");

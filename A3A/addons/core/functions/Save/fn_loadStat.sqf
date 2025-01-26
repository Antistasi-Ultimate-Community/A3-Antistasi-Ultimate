/*
Arguments:
	0.  <String>    variable name or identifier for subroutine to run
    1.  <any>       data that will be set
Return Value:
    nil

Scope: Server
Environment: unscheduled
Public: yes
Dependencies:

Example:
    [_varName,_varValue] call A3A_fnc_loadStat;
*/

params ["_varName", "_varValue"];
if (isNil '_varValue') exitWith {};

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

//===========================================================================
//ADD VARIABLES TO THIS ARRAY THAT NEED SPECIAL SCRIPTING TO LOAD


if (isNil "specialVarLoads") then {
    specialVarLoads = [
        "minesX","staticsX","antennas","mrkNATO","mrkSDK",
        "posHQ","hr","dateX","prestigeOPFOR",
        "prestigeBLUFOR","resourcesFIA","skillFIA","destroyedSites",
        "garrison","tasks","membersX","destroyedBuildings",
        "chopForest","weather","killZones","jna_dataList","controlsSDK","mrkCSAT","nextTick",
        "bombRuns","wurzelGarrison","aggressionOccupants", "aggressionInvaders", "enemyResources", "HQKnowledge",
        "testingTimerIsActive", "version", "HR_Garage", "A3A_fuelAmountleftArray",
        
        "supportPoints",
        "constructionsX",
        "watchpostsFIA", "roadblocksFIA", "aapostsFIA", "atpostsFIA", "hmgpostsFIA",
        "traderDiscount", "isTraderQuestAssigned", "isTraderQuestCompleted","traderPosition",
        "areOccupantsDefeated", "areInvadersDefeated",
        "destroyedMilAdmins",
        "rebelLoadouts", "randomizeRebelLoadoutUniforms",
        "areRivalsDefeated", "areRivalsDiscovered", "inactivityRivals", "rivalsLocationsMap", "rivalsExcludedLocations",
        "nextRivalsLocationReveal", "isRivalsDiscoveryQuestAssigned", "revealedZones"
    ] createHashMapFromArray [];
};

if (_varName in specialVarLoads) then {
    switch (_varName) do {
        case 'version': {
            _s = _varValue splitString ".";
            if (count _s < 2) exitWith {
                Error_1("Bad version string: %1", _varValue);
            };
            A3A_saveVersion = 10000*parsenumber(_s#0) + 100*parseNumber(_s#1);
            if (count _s == 3) then {
                A3A_saveVersion = A3A_saveVersion + parseNumber(_s#2);
            };
        };

        case 'bombRuns': {
            bombRuns = _varValue; 
            publicVariable "bombRuns";
        };
        
        case 'nextTick': {
            nextTick = time + _varValue;
        };

        case 'membersX': {
            membersX = +_varValue; 
            publicVariable "membersX";
        };

        case 'mrkNATO': {
            {sidesX setVariable [_x,Occupants,true]} forEach _varValue;
        };

        case 'mrkCSAT': {
            {sidesX setVariable [_x,Invaders,true]} forEach _varValue;
        };

        case 'mrkSDK': {
            {sidesX setVariable [_x,teamPlayer,true]} forEach _varValue;
        };

        case 'controlsSDK': {
            {sidesX setVariable [_x,teamPlayer,true]} forEach _varValue;
        };

        case 'chopForest': {
            chopForest = _varValue; 
            publicVariable "chopForest";
        };

        case 'jna_dataList': {
            jna_dataList = +_varValue;
        };

        case 'aggressionOccupants': {
            aggressionLevelOccupants = _varValue select 0;
            aggressionStackOccupants = +(_varValue select 1);
            [true] spawn A3A_fnc_calculateAggression;
        };

        case 'aggressionInvaders': {
            aggressionLevelInvaders = _varValue select 0;
            aggressionStackInvaders = +(_varValue select 1);
            [true] spawn A3A_fnc_calculateAggression;
        };

        case 'inactivityRivals': {
			inactivityLevelRivals = _varValue select 0;
            publicVariable "inactivityLevelRivals";
			inactivityStackRivals = +(_varValue select 1);
			[true] call SCRT_fnc_rivals_calculateActivity;
		};

        case 'hr': {
            server setVariable ["HR",_varValue,true];
        };

        case 'dateX': {
            setDate _varValue;
        };

        case 'weather': {
            // Avoid persisting potentially-broken fog values
            private _fogParams = _varValue select 0;
            0 setFog [_fogParams#0, (_fogParams#1) max 0, (_fogParams#2) max 0];
            0 setOvercast (_varValue select 1);

            // Ensure compatibility with < v10.7.0
            if(count _varValue == 12) then {
                0 setGusts (_varValue select 2);
                setHumidity (_varValue select 3);
                0 setLightnings (_varValue select 4);
                0 setRain (_varValue select 5);
                private _rainParams = _varValue select 6;
                0 setRainbow (_varValue select 7);
                0 setWaves (_varValue select 8);
                private _windParams = _varValue select 9;
                setWind [_windParams#0, _windParams#1, false];
                0 setWindDir (_varValue select 10);
                0 setWindStr (_varValue select 11);
                forceWeatherChange;
                _rainParams call BIS_fnc_setRain;
            } else {
                forceWeatherChange;
            };
        };

        case 'resourcesFIA': {
            server setVariable ["resourcesFIA",_varValue,true];
        };

        case 'destroyedSites': {
            destroyedSites = +_varValue; publicVariable "destroyedSites"
        };

        case 'skillFIA': {
            skillFIA = _varValue; 
            publicVariable "skillFIA";
            {
                _costs = server getVariable _x;
                for "_i" from 1 to _varValue do {
                    _costs = round (_costs + (_costs * (_i/840)));
                };
                server setVariable [_x,_costs,true];
            } forEach FactionGet(reb,"unitsSoldiers");
        };

        case 'HR_Garage': {
            [_varValue] call HR_GRG_fnc_loadSaveData;
        };

        case 'destroyedBuildings': {
            {
                // nearestObject sometimes picks the wrong building and is several times slower
                // Example: Livonia Land_Cargo_Tower_V2_F at [6366.63,3880.88,0] ATL

                private _building = nearestObjects [_x, ["House"], 1, true] select 0;
                call {
                    if (isNil "_building") exitWith { Error_1("No building found at %1", _x)};
                    if (_building in antennas) exitWith { Info("Antenna in destroyed building list, ignoring")};
                    if (_building in A3A_destroyedMilAdministrations) exitWith { Info("Military Administration in destroyed building list, ignoring") };

                    private _ruin = [_building] call BIS_fnc_createRuin;
                    if (isNull _ruin) exitWith {
                        Error_1("Loading Destroyed Buildings: Unable to create ruin for %1", typeOf _building);
                    };

                    destroyedBuildings pushBack _building;
                };
            } forEach _varValue;
        };

        case 'minesX': {
            for "_i" from 0 to (count _varvalue) - 1 do {
                (_varvalue select _i) params ["_typeMine", "_posMine", "_detected", "_dirMine"];
                private _mineX = createVehicle [_typeMine, _posMine, [], 0, "CAN_COLLIDE"];
                if !(isNil "_dirMine") then { _mineX setDir _dirMine };
                {_x revealMine _mineX} forEach _detected;
            };
        };

        case 'garrison': {
            private _loadoutNames = createHashMapFromArray ((
                keys FactionGetOrDefault(occ,"loadouts",createHashMap)
                + keys FactionGetOrDefault(inv,"loadouts",createHashMap)
                + keys FactionGetOrDefault(reb,"loadouts",createHashMap)
                + keys FactionGetOrDefault(civ,"loadouts",createHashMap)
            ) apply {[toLower _x, _x]} );

            {
                private _marker = _x select 0;
                private _garrison = [];
                private _replacements = switch (sidesX getVariable _marker) do {
                    case (Occupants): { A3A_faction_occ get "groupLoadStatReplacement"};
                    case (Invaders): { A3A_faction_inv get "groupLoadStatReplacement"};
                    default { A3A_faction_reb get "groupSquad" };
                };

                {
                    // skip garbage created by old bugs
                    if (isNil "_x") then { Debug("Garrison load | Removed nil entry"); continue };
                    if !(_x isEqualType "") then { Debug_2("Garrison load | Removed bad entry: %1 | Type %2", _x, typeName _x); continue };
                    if (_x isEqualTo "") then { Debug("Garrison load | Removed empty entry"); continue };

                    // fix for 2.4 -> 2.5 rebel garrison incompatibility
                    if (_x find "loadouts_rebel" == 0) then {
                        _x = ("loadouts_reb" + (_x select [14]));
                    };
                    //templates move to hashmap case compat
                    private _loadoutName = toLower (_x select [13]);
                    _x = ( (_x select [0,13]) + (_loadoutNames getOrDefault [_loadoutName, ""]) );
                    if ( (_x select [0,13]) isEqualTo _x ) then {
                        Debug_1("Garrison load | Replacing bad loadout name: %1", _x + _loadoutName);
                        _x = selectRandom _replacements;					// Fix for pre-2.4 garrisons
                    };
                    //loadout name valid, add to garrison
                    _garrison pushBack _x;
                } forEach (_x select 1);

                garrison setVariable [_marker, _garrison, true];
                if (count _x > 2) then { garrison setVariable [_marker + "_lootCD", _x select 2, true] };
                if (count _x > 3) then { garrison setVariable [_marker + "_powCD", _x select 3, true] };
                if (count _x > 4) then { garrison setVariable [_marker + "_samDestroyedCD", _x select 4, true] }; 
			} forEach _varvalue;
        };

        case 'wurzelGarrison': {
            {
                garrison setVariable [format ["%1_garrison", (_x select 0)], +(_x select 1), true];
                garrison setVariable [format ["%1_requested", (_x select 0)], +(_x select 2), true];
                garrison setVariable [format ["%1_over", (_x select 0)], +(_x select 3), true];
                [(_x select 0)] call A3A_fnc_updateReinfState;
            } forEach _varvalue;
        };

        case 'antennas': {
            antennasDead = [];
            for "_i" from 0 to (count _varvalue - 1) do {
                _posAnt = _varvalue select _i;
                _mrk = [mrkAntennas, _posAnt] call BIS_fnc_nearestPosition;
                _antenna = [antennas,_mrk] call BIS_fnc_nearestPosition;
                {if ([antennas,_x] call BIS_fnc_nearestPosition == _antenna) then {[_x,false] spawn A3A_fnc_blackout}} forEach citiesX;
                antennas = antennas - [_antenna];
                antennasDead pushBack _antenna;
                _antenna removeAllEventHandlers "Killed";

                private _ruin = [_antenna] call BIS_fnc_createRuin;

                if !(isNull _ruin) then {
                    //JIP on the _ruin, as repairRuinedBuilding will delete the ruin.
                    [_antenna, true] remoteExec ["hideObject", 0, _ruin];
                } else {
                    Error_1("Loading Antennas: Unable to create ruin for %1", typeOf _antenna);
                };

                deleteMarker _mrk;
            };
            publicVariable "antennas";
            publicVariable "antennasDead";
        };

        case 'prestigeOPFOR': {
            if (count citiesX != count _varValue) exitWith {};          // it'll be the same in the next one
            for "_i" from 0 to (count citiesX) - 1 do {
                _city = citiesX select _i;
                _dataX = server getVariable _city;
                _numCiv = _dataX select 0;
                _numVeh = _dataX select 1;
                _prestigeOPFOR = _varvalue select _i;
                _prestigeBLUFOR = _dataX select 3;
                _dataX = [_numCiv,_numVeh,_prestigeOPFOR,_prestigeBLUFOR];
                server setVariable [_city,_dataX,true];
            };
        };

        case 'prestigeBLUFOR': {
            if (count citiesX != count _varValue) exitWith {
                Error("City count changed, setting approx support");
                {
                    if (sidesX getVariable _x != teamPlayer) then { continue };                // sides should be loaded first
                    private _dataX = (server getVariable _x select [0,2]) + [0,75];             // 75% rebel support
                    server setVariable [_x, _dataX, true];
                } forEach citiesX;
            };
            for "_i" from 0 to (count citiesX) - 1 do {
                _city = citiesX select _i;
                _dataX = server getVariable _city;
                _numCiv = _dataX select 0;
                _numVeh = _dataX select 1;
                _prestigeOPFOR = _dataX select 2;
                _prestigeBLUFOR = _varvalue select _i;
                _dataX = [_numCiv,_numVeh,_prestigeOPFOR,_prestigeBLUFOR];
                server setVariable [_city,_dataX,true];
            };
        };

        case 'enemyResources': {
            A3A_resourcesDefenceOcc = _varValue#0;
            A3A_resourcesDefenceInv = _varValue#1;
            A3A_resourcesAttackOcc = _varValue#2;
            A3A_resourcesAttackInv = _varValue#3;
        };

        case 'HQKnowledge': {
            A3A_curHQInfoOcc = _varValue#0;
            A3A_curHQInfoInv = _varValue#1;
            A3A_oldHQInfoOcc = _varValue#2;
            A3A_oldHQInfoInv = _varValue#3;
        };

        case 'killZones': {
            {killZones setVariable [(_x select 0),(_x select 1),true]} forEach _varValue;
        };

        case 'posHQ': {
            _posHQ = if (count _varValue >3) then {_varValue select 0} else {_varValue};
            {
                if (getMarkerPos _x distance _posHQ < 1000) then {
                    sidesX setVariable [_x,teamPlayer,true];
                };
            } forEach controlsX;
            respawnTeamPlayer setMarkerPos _posHQ;
            posHQ = getMarkerPos respawnTeamPlayer;
            petros setPos _posHQ;
            "Synd_HQ" setMarkerPos _posHQ;
            if (chopForest) then {
                { _x hideObjectGlobal true } foreach (nearestTerrainObjects [position petros,["tree","bush"],70]);
            };
            if (count _varValue == 3) then {
                [] spawn A3A_fnc_buildHQ;
            } else {
                boxX setDir ((_varValue select 1) select 0);
                boxX setPos ((_varValue select 1) select 1);
                mapX setDir ((_varValue select 2) select 0);
                mapX setPos ((_varValue select 2) select 1);
                flagX setPos (_varValue select 3);
                vehicleBox setDir ((_varValue select 4) select 0);
                vehicleBox setPos ((_varValue select 4) select 1);
            };
            {_x setPos _posHQ} forEach ((call A3A_fnc_playableUnits) select {side _x == teamPlayer});
        };

        case 'staticsX': {
            for "_i" from 0 to (count _varvalue) - 1 do {
                (_varValue#_i) params ["_typeVehX", "_posVeh", "_xVectorUp", "_xVectorDir", "_state"];
                private _veh = createVehicle [_typeVehX,[0,0,1000],[],0,"CAN_COLLIDE"];
                // This is only here to handle old save states. Could be removed after a few version itterations. -Hazey
                if (_xVectorUp isEqualType 0) then { // We have to check number because old save state might still be using getDir. -Hazey
                    _veh setDir _xVectorUp; //is direction due to old save
                    _veh setVectorUp surfaceNormal (_posVeh);
                    _veh setPosATL _posVeh;
                } else {
                    _veh setPosWorld _posVeh;
                    _veh setVectorDirAndUp [_xVectorDir,_xVectorUp];
                };
                [_veh, teamPlayer] call A3A_fnc_AIVEHinit;                  // Calls initObject instead if it's a buyable item
                // TODO: Check whether various buyable items turn up as "Building"
                if (isNil {_veh getVariable "A3A_canGarage"}) then {        // Buyable items should set this
                    if (_veh isKindOf "StaticWeapon") exitWith { staticsToSave pushBack _veh };
                    if (_veh isKindOf "Building") exitWith {
                        _veh setVariable ["A3A_building", true, true];
                        A3A_buildingsToSave pushBack _veh;
                    };
                };
                if (!isNil "_state") then {
                    [_veh, _state] call HR_GRG_fnc_setState;
                };
            };
            publicVariable "staticsToSave";
        };

        case 'tasks': {
            [_varValue] spawn {
                params ["_varValue"];
                {
                    switch (_x) do {
                        //These are really dangerous. Disable for now.
                        //Should be done after all the other init is completed if we really want it
                        // case "rebelAttack": {
                        //     if(attackCountdownInvaders > attackCountdownOccupants) then {
                        //         [Invaders] spawn A3A_fnc_rebelAttack;
                        //     } else {
                        //         [Occupants] spawn A3A_fnc_rebelAttack;
                        //     };
                        // };
                        // case "DEF_HQ": {
                        //     [] spawn A3A_fnc_attackHQ;
                        // };
                        case "TRADER": {
                            [] remoteExec ["SCRT_fnc_trader_prepareTraderQuest", 2];
                        };
                        // default {
                        //     [_x,clientOwner,true] call A3A_fnc_missionRequest;
                        // };
                    };   
                } forEach _varValue;
            };
        };

        case 'A3A_fuelAmountleftArray': {
            //[position _x, [_x] call ace_refuel_fnc_getFuel]
            A3A_fuelAmountleftArray = _varValue;
            for "_i" from 0 to (count A3A_fuelAmountleftArray - 1) do {
                private _nearFuelStations = nearestObjects [A3A_fuelAmountleftArray # _i # 0, A3A_fuelStationTypes, 1];
                if (count _nearFuelStations == 0) then { continue };
                private _fuelStation = _nearFuelStations#0;
                if(A3A_hasACE) then {
                    [_fuelStation, A3A_fuelAmountleftArray # _i # 1] call ace_refuel_fnc_setFuel;
                } else {
                    _fuelStation setFuelCargo (A3A_fuelAmountleftArray # _i # 1);
                };
            };
        };

        case 'testingTimerIsActive': {
            if(_varValue) then {
                [] spawn A3A_fnc_startTestingTimer;
            };
            testingTimerIsActive = _varValue;
        };

        case 'isTraderQuestAssigned': {
            isTraderQuestAssigned = _varvalue;  
            publicVariable "isTraderQuestAssigned";
        };

        case 'isTraderQuestCompleted': {
            isTraderQuestCompleted = _varvalue;  
            publicVariable "isTraderQuestCompleted";
        };

        case 'traderDiscount': {
			if(_varValue > 0) then {
				[_varValue] call SCRT_fnc_trader_setTraderDiscount;
			};
			traderDiscount = _varValue;
			publicVariable "traderDiscount";
		};

		case 'randomizeRebelLoadoutUniforms': {
			randomizeRebelLoadoutUniforms = _varValue;
			publicVariable "randomizeRebelLoadoutUniforms";
		};

        case 'traderPosition': {
			if(count _varvalue > 0) then {
                traderX = [_varvalue] call SCRT_fnc_trader_createTrader; 
				publicVariable "traderX";
				[traderX] call SCRT_fnc_trader_setStockType;
				[traderX] remoteExecCall ["SCRT_fnc_trader_addVehicleMarketAction", 0, true];
				traderPosition = _varvalue; 
                publicVariable "traderPosition";
			};
		};

        case 'destroyedMilAdmins': {
            A3A_destroyedMilAdministrations = [];
            for "_i" from 0 to (count _varvalue - 1) do {
                _posAdmin = _varvalue select _i;
                _mrk = [milAdministrationsX, _posAdmin] call BIS_fnc_nearestPosition;
                private _milAdministration = [A3A_milAdministrations, _mrk] call BIS_fnc_nearestPosition;
                [_milAdministration, "LOADSTAT"] call SCRT_fnc_location_removeMilAdmin;
            };
            publicVariable "A3A_destroyedMilAdministrations";
        };

        case 'areOccupantsDefeated': {
            Info_1("Occupants defeated: %1", str _varvalue);
            areOccupantsDefeated = _varvalue;
            publicVariable "areOccupantsDefeated";
            if (areOccupantsDefeated) then {
                "NATO_carrier" setMarkerAlpha 0;
            };
        };

        case 'areInvadersDefeated': {
            Info_1("Invaders defeated: %1", str _varvalue);
            areInvadersDefeated = _varvalue;
            publicVariable "areInvadersDefeated";
            if (areInvadersDefeated) then {
                "CSAT_carrier" setMarkerAlpha 0;
            };
        };

        case 'areRivalsDefeated': {
            Info_1("Rivals defeated: %1", str _varvalue);
			areRivalsDefeated = _varvalue;
			publicVariable "areRivalsDefeated";
		};

		case 'areRivalsDiscovered': {
            Info_1("Is Rivals Faction Active: %1", str _varvalue);
			areRivalsDiscovered = _varvalue;  
			publicVariable "areRivalsDiscovered";
		};

        case 'supportPoints': {
			supportPoints = _varValue; 
			publicVariable "supportPoints";
		};

        case 'constructionsX': {
			for "_i" from 0 to (count _varvalue) - 1 do {
				_typeVehX = _varvalue select _i select 0;
				_posVeh = _varvalue select _i select 1;
				_xVectorUp = _varvalue select _i select 2;
				_xVectorDir = _varvalue select _i select 3;
				private _veh = createVehicle [_typeVehX,[0,0,1000],[],0,"CAN_COLLIDE"];
				_veh setPosWorld _posVeh;
				_veh setVectorDirAndUp [_xVectorDir,_xVectorUp];
				constructionsToSave pushBack _veh;
			};
			publicVariable "constructionsToSave";
		};

        case 'watchpostsFIA': {
			if (count (_varValue select 0) == 2) then {
			{
					_positionX = _x select 0;
					_garrison = _x select 1;
					_mrk = createMarker [format ["FIAWatchpost%1", random 1000], _positionX];
					_mrk setMarkerShape "ICON";
					_mrk setMarkerType "n_recon";
					_mrk setMarkerColor colorTeamPlayer;
					_mrk setMarkerText format [localize "STR_marker_watchpost",FactionGet(reb,"name")];
					spawner setVariable [_mrk,2,true];
					if (count _garrison > 0) then {garrison setVariable [_mrk,_garrison,true]};
					watchpostsFIA pushBack _mrk;
					sidesX setVariable [_mrk,teamPlayer,true];
				} forEach _varvalue;
			};
		};
		case 'roadblocksFIA': {
			if (count (_varValue select 0) == 2) then {
			{
					_positionX = _x select 0;
					_garrison = _x select 1;
					_mrk = createMarker [format ["FIARoadblock%1", random 1000], _positionX];
					_mrk setMarkerShape "ICON";
					_mrk setMarkerType "n_support";
					_mrk setMarkerColor colorTeamPlayer;
					_mrk setMarkerText format [localize "STR_marker_roadblock",FactionGet(reb,"name")];
					spawner setVariable [_mrk,2,true];
					if (count _garrison > 0) then {garrison setVariable [_mrk,_garrison,true]};
					roadblocksFIA pushBack _mrk;
					sidesX setVariable [_mrk,teamPlayer,true];
				} forEach _varvalue;
			};			
		};
		case 'aapostsFIA': {
			if (count (_varValue select 0) >= 2) then {
			{
					_positionX = _x select 0;
					_garrison = _x select 1;
					_staticPositions = _x select 2;
					_mrk = createMarker [format ["FIAAApost%1", random 1000], _positionX];
					_mrk setMarkerShape "ICON";
					_mrk setMarkerType "n_antiair";
					_mrk setMarkerColor colorTeamPlayer;
					_mrk setMarkerText format [localize "STR_marker_aa_empl",FactionGet(reb,"name")];
					spawner setVariable [_mrk,2,true];
					if (count _garrison > 0) then {garrison setVariable [_mrk,_garrison,true]};
					if (count _staticPositions > 0) then {staticPositions setVariable [_mrk,_staticPositions,true]};
					aapostsFIA pushBack _mrk;
					sidesX setVariable [_mrk,teamPlayer,true];
				} forEach _varvalue;
			};	
		};
		case 'atpostsFIA': {
			if (count (_varValue select 0) >= 2) then {
			{
					_positionX = _x select 0;
					_garrison = _x select 1;
					_staticPositions = _x select 2;
					_mrk = createMarker [format ["FIAATpost%1", random 1000], _positionX];
					_mrk setMarkerShape "ICON";
					_mrk setMarkerType "n_armor";
					_mrk setMarkerColor colorTeamPlayer;
					_mrk setMarkerText format [localize "STR_marker_at_empl", FactionGet(reb,"name")];
					spawner setVariable [_mrk,2,true];
					if (count _garrison > 0) then {garrison setVariable [_mrk,_garrison,true]};
					if (count _staticPositions > 0) then {staticPositions setVariable [_mrk,_staticPositions,true]};
					atpostsFIA pushBack _mrk;
					sidesX setVariable [_mrk,teamPlayer,true];
				} forEach _varvalue;
			};		
		};
		case 'hmgpostsFIA': {
			if (count (_varValue select 0) >= 2) then {
			{
					_positionX = _x select 0;
					_garrison = _x select 1;
					_staticPositions = _x select 2;
					_mrk = createMarker [format ["FIAHmgpost%1", random 1000], _positionX];
					_mrk setMarkerShape "ICON";
					_mrk setMarkerType "n_unknown";
					_mrk setMarkerColor colorTeamPlayer;
					_mrk setMarkerText format [localize "STR_marker_hmg_empl", FactionGet(reb,"name")];
					spawner setVariable [_mrk,2,true];
					if (count _garrison > 0) then {garrison setVariable [_mrk,_garrison,true]};
					if (count _staticPositions > 0) then {staticPositions setVariable [_mrk,_staticPositions,true]};
					hmgpostsFIA pushBack _mrk;
					sidesX setVariable [_mrk,teamPlayer,true];
				} forEach _varvalue;
			}	
		};

        case 'rebelLoadouts': {
			rebelLoadouts = _varvalue; 
			publicVariable "rebelLoadouts";
		};

        case 'randomizeRebelLoadoutUniforms': {
			randomizeRebelLoadoutUniforms = _varValue;
			publicVariable "randomizeRebelLoadoutUniforms";
		};

		case 'rivalsLocationsMap': {
            Info_1("Rivals Locations: %1", str _varValue);
			rivalsLocationsMap = _varValue;
			publicVariable "rivalsLocationsMap";
		};

		case 'rivalsExcludedLocations': {
            Info_1("Rivals Excluded Locations: %1", str _varValue);
			rivalsExcludedLocations = _varValue;
			publicVariable "rivalsExcludedLocations";
		};

		//TODO: maybe this shouldn't be a special variable
		case 'nextRivalsLocationReveal': {
			nextRivalsLocationReveal = _varValue;
			publicVariable "nextRivalsLocationReveal";
		};

        case 'isRivalsDiscoveryQuestAssigned': {
            isRivalsDiscoveryQuestAssigned = _varValue;  
            publicVariable "isRivalsDiscoveryQuestAssigned";
            if (isRivalsDiscoveryQuestAssigned && {!areRivalsDiscovered}) then {
                [] call SCRT_fnc_rivals_prepareQuest;
            };
        };

        case 'revealedZones': {
            revealedZones = _varValue;

            if (isNil "revealedZones") then {
                revealedZones = [];
            };

            publicVariable "revealedZones";
        };

        case 'unlockedVehicleTypes': {
            unlockedVehicleTypes = _varValue;

            if (isNil "unlockedVehicleTypes") then {
                unlockedVehicleTypes = [];
            };

            publicVariable "unlockedVehicleTypes";
        };
    };
} else {
    call compile format ["%1 = %2",_varName,_varValue];
};

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if(!isServer) exitWith { Error("Server-only function miscalled") };

params ["_type", ["_requester", clientOwner], ["_silent", false]];

waitUntil {isNil "A3A_missionRequestInProgress"};
A3A_missionRequestInProgress = true;

if(isNil "_type") then {
	private _types = ["CON","DES","LOG","SUPP","RES","CONVOY"];
	_type = selectRandom (_types - A3A_activeTasks);
	_silent = true;
};
if (isNil "_type" or leader group petros != petros) exitWith { A3A_missionRequestInProgress = nil };
if (_type in A3A_activeTasks) exitWith {
	if (!_silent) then {[petros, "globalChat", localize "STR_chats_mission_request_already_type"] remoteExec ["A3A_fnc_commsMP",_requester]};
	A3A_missionRequestInProgress = nil;
};

private _findIfNearAndHostile = {
	/*
	Input : single array of markers, do 'array + array' for multiple.
	Returns: array of markers within max mission distance and is not rebel.
	*/
	params ["_Markers"];
	_Markers = _Markers select {(getMarkerPos _x distance2D getMarkerPos respawnTeamPlayer < distanceMission) && (sidesX getVariable [_x,sideUnknown] != teamPlayer)};
	_Markers
};

private _checkRivalsTaskPossibility = {
	params ["_site"];
	_site in ([] call SCRT_fnc_rivals_getLocations) && {!("RIV_ATT" in A3A_activeTasks) && {([] call SCRT_fnc_rivals_rollProbability)}}
};

private _possibleMarkers = [];
switch (_type) do {
	case "AS": {
		//find apropriate sites
		_possibleMarkers = [airportsX + milbases + citiesX] call _findIfNearAndHostile;
		_possibleMarkers = _possibleMarkers select {spawner getVariable _x != 0};
		//add controlsX not on roads and on the 'frontier'
		private _controlsX = [controlsX] call _findIfNearAndHostile;
		private _nearbyFriendlyMarkers = markersX select {
			(getMarkerPos _x inArea [getMarkerPos respawnTeamPlayer, distanceMission+distanceSPWN, distanceMission+distanceSPWN, 0, false])
			and (sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer)
		};
		_nearbyFriendlyMarkers deleteAt (_nearbyFriendlyMarkers find "Synd_HQ");
		{
			private _pos = getmarkerPos _x;
			if !(isOnRoad _pos) then {
				if (_nearbyFriendlyMarkers findIf {getMarkerPos _x distance _pos < distanceSPWN} != -1) then {_possibleMarkers pushBack _x};
			};
		} forEach _controlsX;

		if (count _possibleMarkers == 0) then {
			if (!_silent) then {
				[petros,"globalChat", localize "STR_chats_mission_request_no_AS"] remoteExec ["A3A_fnc_commsMP",_requester];
				[petros,"hint", format [localize "STR_chats_mission_request_no_AS_hint_text", str distanceMission], localize "STR_chats_mission_request_header"] remoteExec ["A3A_fnc_commsMP",_requester];
			};
		} else {
			private _site = selectRandom _possibleMarkers;

			switch (true) do 
			{
				case ((random 100) < 15): 
				{
					[[_site],"A3A_fnc_AS_Ambush"] remoteExec ["A3A_fnc_scheduler",2];
				};
				case (_site in airportsX): 
				{
					[[_site],"A3A_fnc_AS_Official"] remoteExec ["A3A_fnc_scheduler",2];
				};
				case (_site in citiesX): 
				{
					if (([_site] call _checkRivalsTaskPossibility)) then {
						[[_site],"A3A_fnc_RIV_AS_Traitor"] remoteExec ["A3A_fnc_scheduler",2];
					} else {
						private _assassinationMissions = ["A3A_fnc_AS_Traitor", 0.5, "A3A_fnc_AS_Smasher", 0.3, "A3A_fnc_AS_Zombies", 0.3];
						private _assassinationMission = selectRandomWeighted _assassinationMissions;
						[[_site],_assassinationMission] remoteExec ["A3A_fnc_scheduler", 2];
					};
				};
				default 
				{
					[[_site],"A3A_fnc_AS_SpecOP"] remoteExec ["A3A_fnc_scheduler",2];
				};
			};
		};
	};

	case "CON": {
		//find apropriate sites
		_possibleMarkers = [outposts + milAdministrationsX + seaports + factories + resourcesX + (controlsX select {isOnRoad (getMarkerPos _x)})] call _findIfNearAndHostile;
		private _possibleMarkersForFrontline = [airportsX + milbases + outposts + seaports + factories + resourcesX] call _findIfNearAndHostile;
		private _possibleFrontlineMarker = selectRandom _possibleMarkersForFrontline;
		private _frontlineSite = [_possibleFrontlineMarker] call A3A_fnc_isFrontlineNoFIA;
		if (count _possibleMarkers == 0) then {
			if (!_silent) then {
				[petros, "globalChat", localize "STR_chats_mission_request_no_CON"] remoteExec ["A3A_fnc_commsMP",_requester];
				[petros,"hint",format [localize "STR_chats_mission_request_no_CON_hint_text", str distanceMission], localize "STR_chats_mission_request_header"] remoteExec ["A3A_fnc_commsMP",_requester];
			};
		} else {
			private _milAdmins = _possibleMarkers select {_x in milAdministrationsX };
			private _site = if (_milAdmins isNotEqualTo []) then {selectRandom _milAdmins} else {selectRandom _possibleMarkers};
			if (_site in milAdministrationsX) then {
				[[_site],"A3A_fnc_CON_MilAdmin"] remoteExec ["A3A_fnc_scheduler",2];
			} else {
				if (_frontlineSite) then {
					[[_possibleFrontlineMarker],"A3A_fnc_CON_Outpost_Compet"] remoteExec ["A3A_fnc_scheduler",2];
				} else {
					[[_site],"A3A_fnc_CON_Outpost"] remoteExec ["A3A_fnc_scheduler",2];
				};
			};
		};
	};

	case "DES": {
		//find apropriate sites
		_possibleMarkers = [airportsX] call _findIfNearAndHostile;
		_possibleMarkers = _possibleMarkers select {spawner getVariable _x != 0};

		private _controlsX = [controlsX select {!(isOnRoad (getMarkerPos _x))}] call _findIfNearAndHostile;
		private _nearbyFriendlyMarkers = markersX select {
			(getMarkerPos _x inArea [getMarkerPos respawnTeamPlayer, distanceMission+distanceSPWN, distanceMission+distanceSPWN, 0, false])
			and (sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer)
		};
		_nearbyFriendlyMarkers deleteAt (_nearbyFriendlyMarkers find "Synd_HQ");
		{
			private _pos = getmarkerPos _x;
			if (_nearbyFriendlyMarkers findIf {getMarkerPos _x distance _pos < distanceSPWN} != -1) then {
				_possibleMarkers pushBack _x
			};
		} forEach _controlsX;

		//append occupants antennas to list
		{
			private _nearbyMarker = [markersX, getPos _x] call BIS_fnc_nearestPosition;
			if (
				(sidesX getVariable [_nearbyMarker,sideUnknown] == Occupants)
				&& (getPos _x distance getMarkerPos respawnTeamPlayer < distanceMission)
				) then {_possibleMarkers pushBack _x};
		}forEach antennas;

		if (count _possibleMarkers == 0) then {
			if (!_silent) then {
				[petros, "globalChat", localize "STR_chats_mission_request_no_DES"] remoteExec ["A3A_fnc_commsMP",_requester];
				[petros,"hint",format [localize "STR_chats_mission_request_no_DES_hint_text", str distanceMission], localize "STR_chats_mission_request_header"] remoteExec ["A3A_fnc_commsMP",_requester];
			};
		} else {
			private _site = selectRandom _possibleMarkers;
			switch (true) do {
				case (_site in airportsX): {
					if (random 10 < 5) then {
						[[_site],"A3A_fnc_DES_Vehicle"] remoteExec ["A3A_fnc_scheduler",2];
					} else {
						[[_site],"A3A_fnc_DES_Heli"] remoteExec ["A3A_fnc_scheduler",2];
					};
				};
				case (_site in antennas): {
					[[_site],"A3A_fnc_DES_antenna"] remoteExec ["A3A_fnc_scheduler",2];
				};
				case (_site in controlsX): {
					[[_site],"A3A_fnc_DES_Artillery"] remoteExec ["A3A_fnc_scheduler",2];
				};
			};
		};
	};

	case "LOG": {
		//Add unspawned outposts for ammo trucks, and seaports for salvage
		_possibleMarkers = [seaports + outposts] call _findIfNearAndHostile;
		_possibleMarkers = _possibleMarkers select {(_x in seaports) or (spawner getVariable _x != 0)};

		private _controlsX = ([controlsX] call _findIfNearAndHostile) select {!isOnRoad (getMarkerPos _x)};
		_possibleMarkers append _controlsX;

		//append banks in hostile cities
		if (random 100 < 20) then {
			{
				private _nearbyMarker = [markersX, getPos _x] call BIS_fnc_nearestPosition;
				if (
					(sidesX getVariable [_nearbyMarker,sideUnknown] != teamPlayer)
					&& (getPos _x distance getMarkerPos respawnTeamPlayer < distanceMission)
					) then {_possibleMarkers pushBack _x};
			} forEach banks;
		};

		if (count _possibleMarkers == 0) then {
			if (!_silent) then {
				[petros, "globalChat", localize "STR_chats_mission_request_no_LOG"] remoteExec ["A3A_fnc_commsMP",_requester];
				[petros,"hint", format [localize "STR_chats_mission_request_no_LOG_hint_text", str distanceMission], localize "STR_chats_mission_request_header"] remoteExec ["A3A_fnc_commsMP",_requester];
			};
		} else {
			private _site = selectRandom _possibleMarkers;
			switch(true) do {
                case(_site in outposts): {
                    [[_site],"A3A_fnc_LOG_Ammo"] remoteExec ["A3A_fnc_scheduler", 2];
                };
                case(_site in banks): {
                    [[_site],"A3A_fnc_LOG_Bank"] remoteExec ["A3A_fnc_scheduler", 2];
                };
                case(_site in seaports): {
                    [[_site],"A3A_fnc_LOG_Salvage"] remoteExec ["A3A_fnc_scheduler", 2];
                };
                case(_site in controlsX): {
					private _logMissions = ["A3A_fnc_LOG_Airdrop", 0.35, "A3A_fnc_LOG_Helicrash", 0.35, "A3A_fnc_LOG_Crashsite", 0.5];
					private _logMission = selectRandomWeighted _logMissions;
					[[_site],_logMission] remoteExec ["A3A_fnc_scheduler", 2];
                };
                default {};
            };
		};
	};

	case "SUPP": {
		_possibleMarkers = [];
		private _weightedMarkers = [];
		{
			private _dist = getMarkerPos _x distance2D getMarkerPos respawnTeamPlayer;
			private _supportReb = (server getVariable _x) select 3;
			if (_dist < distanceMission && _supportReb < 90) then {
				private _weight = (100 - _supportReb) * ((distanceMission - _dist) ^ 2);
				_possibleMarkers pushBack _x;
				_weightedMarkers append [_x, _weight];
			};
		}forEach (citiesX - destroyedSites);

		if (count _possibleMarkers == 0) then {
			if (!_silent) then {
				[petros, "globalChat", localize "STR_chats_mission_request_no_SUPP"] remoteExec ["A3A_fnc_commsMP",_requester];
				[petros,"hint",format [localize "STR_chats_mission_request_no_SUPP_hint_text", str distanceMission], localize "STR_chats_mission_request_header"] remoteExec ["A3A_fnc_commsMP",_requester];
			};
		} else {
            Debug_1("City weights: %1", _weightedMarkers);
			private _site = selectRandomWeighted _weightedMarkers;

			if (([_site] call _checkRivalsTaskPossibility)) then {
				[[_site],"A3A_fnc_RIV_SUPP_Salvage"] remoteExec ["A3A_fnc_scheduler",2];	
			} else {
				[[_site],"A3A_fnc_SUPP_Supplies"] remoteExec ["A3A_fnc_scheduler",2];
			};
		};
	};

	case "RES": {
		_possibleMarkers = [citiesX] call _findIfNearAndHostile;
		{
			private _spawner = spawner getVariable _x;
			if (_spawner != 0) then {_possibleMarkers pushBack _x};
		} forEach ([airportsX + outposts + milbases] call _findIfNearAndHostile);

		if (count _possibleMarkers == 0) then {
			if (!_silent) then {
				[petros,"globalChat","I have no rescue missions for you. Move our HQ closer to the enemy."] remoteExec ["A3A_fnc_commsMP",_requester];
				[petros,"hint","Rescue Missions require Cities or Airports closer than 4Km from your HQ.", "Missions"] remoteExec ["A3A_fnc_commsMP",_requester];
			};
		} else {
			private _site = selectRandom _possibleMarkers;

			private _shipwreckPosition = [0,0,0];
			if (!(toLowerAnsi worldName in ["enoch", "vn_khe_sanh", "esseker", "sefrouramal", "takistan"]) && {random 100 < 20}) then {
				_shipwreckPosition = [
					(getMarkerPos _site),
					0,
					1500,
					0,
					0,
					1,
					1,
					[],
					[[0,0,0], [0,0,0]]
				] call BIS_fnc_findSafePos;
			};

			switch (true) do {
				case (_shipwreckPosition isNotEqualTo [0,0,0]): {
					[[_site],"A3A_fnc_RES_Shipwreck"] remoteExec ["A3A_fnc_scheduler",2];
				};
				case (_site in citiesX && {tierWar > 3 && {sunOrMoon < 1}}): {
					[[_site],"A3A_fnc_RES_Informer"] remoteExec ["A3A_fnc_scheduler",2];
				};
				case (_site in citiesX): {
					[[_site],"A3A_fnc_RES_Refugees"] remoteExec ["A3A_fnc_scheduler",2];
				};
				default {
					if ([_site] call _checkRivalsTaskPossibility) then {
						[[_site],"A3A_fnc_RIV_RES_Prisoners"] remoteExec ["A3A_fnc_scheduler",2];
					} else {
						if (tierWar >= 5) then {
							private _roll = round random 100;
							if(_roll < 50) then {
								[[_site],"A3A_fnc_RES_Deserters"] remoteExec ["A3A_fnc_scheduler",2];
							} else {
								[[_site],"A3A_fnc_RES_Prisoners"] remoteExec ["A3A_fnc_scheduler",2];
							};
						} else {
							[[_site],"A3A_fnc_RES_Prisoners"] remoteExec ["A3A_fnc_scheduler",2];
						};
					};
				};
			};
		};
	};

	case "CONVOY": {
		if (bigAttackInProgress) exitWith {
			if (!_silent) then {
				[petros,"globalChat",localize "STR_chats_mission_request_big_battle"] remoteExec ["A3A_fnc_commsMP",_requester];
				[petros,"hint", localize "STR_chats_mission_request_no_CONVOY_battack_hint_text", localize "STR_chats_mission_request_header"] remoteExec ["A3A_fnc_commsMP",_requester];
			};
		};
		// only do the city convoys on flip?
		private _markers = (airportsX + milbases + resourcesX + factories + seaports + outposts - blackListDest);
		// Pre-filter the possible source bases to make this less n-squared
		private _possibleBases = (airportsX + outposts + milbases) select { (getMarkerPos _x) distance (getMarkerPos respawnTeamPlayer) < distanceMission + 3000 };
		private _convoyPairs = [];
		{
			private _site = _x;
			if ((getMarkerPos _site) distance (getMarkerPos respawnTeamPlayer) > distanceMission) then {continue};
			if (sidesX getVariable [_site, teamPlayer] == teamPlayer) then {continue};
			private _base = [_site, _possibleBases] call A3A_fnc_findBasesForConvoy;
			if (_base != "") then {
				_possibleMarkers pushBack _site;
				_convoyPairs pushBack [_site, _base];
			};
		} forEach _markers;

		if (count _possibleMarkers == 0) then
		{
			if (!_silent) then {
				[petros, "globalChat", localize "STR_chats_mission_request_no_CONVOY"] remoteExec ["A3A_fnc_commsMP",_requester];
				[petros, "hint", localize "STR_chats_mission_request_no_CONVOY_hint_text", localize "STR_chats_mission_request_header"] remoteExec ["A3A_fnc_commsMP",_requester];
			};
		} else {
			private _convoyPair = selectRandom _convoyPairs;
			[_convoyPair,"A3A_fnc_convoy"] remoteExec ["A3A_fnc_scheduler",2];
		};
	};

	default {
        Error_1("%1 is not an accepted task type.", _type);
	};
};

if (count _possibleMarkers > 0) then {
	if (!_silent) then {
		[petros, "globalChat", localize "STR_chats_mission_request_success"] remoteExec ["A3A_fnc_commsMP",_requester]
	};
	sleep 3;			// delay lockout until the mission is registered
};
A3A_missionRequestInProgress = nil;

params ["_winner", "_markerX"];

if (!isServer) exitWith {};
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()


Debug_2("Changing side of %1 to %2", _markerX, _winner);
if ((_winner == teamPlayer) and (_markerX in airportsX) and (tierWar < 3)) exitWith {};
if ((_winner == teamPlayer) and (_markerX in milbases) and (tierWar < 3)) exitWith {};
if ((_winner == teamPlayer) and (sidesX getVariable [_markerX,sideUnknown] == teamPlayer)) exitWith {};
if ((_winner == Occupants) and (sidesX getVariable [_markerX,sideUnknown] == Occupants)) exitWith {};
if ((_winner == Invaders) and (sidesX getVariable [_markerX,sideUnknown] == Invaders)) exitWith {};
if (_markerX in markersChanging) exitWith {};
markersChanging pushBackUnique _markerX;
private _positionX = getMarkerPos _markerX;
private _loser = sidesX getVariable [_markerX,sideUnknown];
private _sides = [teamPlayer,Occupants,Invaders];
private _other = "";
private _textX = "";
private _prestigeOccupants = [0, 0];
private _prestigeInvaders = [0, 0];
private _flagX = objNull;
private _size = [_markerX] call A3A_fnc_sizeMarker;

if ((!(_markerX in citiesX)) and (spawner getVariable _markerX != 2)) then {
	private _flagsX = nearestObjects [_positionX, ["FlagCarrierCore"], _size];
	_flagX = _flagsX select 0;
};
if (isNil "_flagX") then {_flagX = objNull};

switch (_loser) do {
	case teamPlayer: {
		_textX = format ["%1 ",FactionGet(reb,"name")];
		[] call A3A_fnc_tierCheck;
	};
	case Occupants: {
		_textX = format ["%1 ",FactionGet(occ,"name")];
	};
	case Invaders: {
		_textX = format ["%1 ",FactionGet(inv,"name")];
	};
	default {
		Error_2("Not supported side of %1 marker - %2", _markerX, str _loser);
	};
};

garrison setVariable [_markerX,[],true];
sidesX setVariable [_markerX,_winner,true];

Debug_1("Side changed for %1", _markerX);

//New garrison update ==========================================================
garrison setVariable [format ["%1_garrison", _markerX], [], true];
garrison setVariable [format ["%1_other", _markerX], [], true];
garrison setVariable [format ["%1_requested", _markerX], [], true];
//This system is not yet implemented
//garrison setVariable [format ["%1_available", _markerX], [], true];
//New system end ===============================================================

if (_winner == teamPlayer) then
{
	// Old garrison surrender
	private _oldGarrison = units _loser select { _x getVariable ["markerX", ""] == _markerX };
	{ [_x] remoteExec ["A3A_fnc_surrenderAction", _x] } forEach _oldGarrison;

	// Cap to 0.6 max to reward captures without previous support calls
	private _resources = [_loser, teamPlayer, _markerX, 0.6] call A3A_fnc_maxDefenceSpend;

	// Don't send anything if it'd be too small
	private _minAttack = (1 + random 0.5) * A3A_balanceResourceRate;
	if (_resources < _minAttack) exitWith {
		Info_2("Available resources (%1) below minimum attack (%2), sending no counterattack", _resources, _minAttack);
	};

	private _vehCount = round (random 0.5 + _resources / A3A_balanceVehicleCost);
	private _reveal = [markerPos _markerX] call A3A_fnc_calculateSupportCallReveal;
	_reveal = [_loser, markerPos _markerX, _reveal] call A3A_fnc_useRadioKey;

	[[_markerX, _loser, _vehCount, _reveal], "A3A_fnc_singleAttack"] call A3A_fnc_scheduler;

	// just estimates here. 
	A3A_supportStrikes pushBack [_loser, "TROOPS", markerPos _markerX, time + 2700, 2700, _resources];
    A3A_supportSpends pushBack [_loser, markerPos _markerX, markerPos _markerX, _resources, time];
}
else
{
	//New system =================================================================
	private _type = "Other";
	switch (true) do
	{
	    case (_markerX in airportsX): {_type = "Airport"};
		case (_markerX in outposts): {_type = "Outpost"};
		case (_markerX in milbases): {_type = "MilitaryBase"};
		case (_markerX in citiesX): {_type = "City"};
	};
	private _preference = garrison getVariable (format ["%1_preference", _type]);
	// pre-fill most of the garrison, because otherwise we're spamming a lot of fake reinf 
	private _indexToReinf = floor (random count _preference);
	private _garrison = [];
	private _request = [];
	{
		private _line = [_x, _winner] call A3A_fnc_createGarrisonLine;
		if (_forEachIndex == _indexToReinf) then {
			_garrison pushBack ["", [], []];		// empty garrison line
			_request pushBack _line;
		} else {
			_garrison pushBack _line;
			_request pushBack ["", [], []];
		};
	} forEach _preference;
	garrison setVariable [format ["%1_garrison", _markerX], _garrison, true];
	garrison setVariable [format ["%1_requested", _markerX], _request, true];
	//End ========================================================================
};

[_markerX, [_loser, _winner]] call A3A_fnc_updateReinfState;
Debug_1("Garrison set for %1", _markerX);

if !(_markerX in airportsX) then
{
	// clear killzones from nearest friendly airfield to enable reinforcements
	private _friendlyAirports = airportsX select { _winner == sidesX getVariable [_x, sideUnknown] };
	if (count _friendlyAirports > 0) then
	{
		private _nearAirport = [_friendlyAirports, _markerX] call BIS_fnc_nearestPosition;
		private _kzlist = killZones getVariable [_nearAirport, []];
		_kzlist = _kzlist - [_markerX];
		killZones setVariable [_nearAirport, _kzlist, true];
	};
};

_nul = [_markerX] call A3A_fnc_mrkUpdate;
_sides = _sides - [_winner,_loser];
_other = _sides select 0;

switch (true) do {
	case (_markerX in airportsX): {
		if (_winner == teamPlayer) then {
			[0,10,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
			Debug("aggroEvent | Rebels took an airport");
			if (_loser == Occupants) then
			{
				_prestigeOccupants = [50, 150];
				_prestigeInvaders = [-25, 90];
			}
			else
			{
				_prestigeOccupants = [-25, 90];
				_prestigeInvaders = [50, 150];
			};
		} else {
			server setVariable [_markerX,dateToNumber date,true];
			[_markerX,60] call A3A_fnc_addTimeForIdle;
			if (_winner == Occupants) then
			{
				[10,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
			}
			else
			{
				[-10,-10,_positionX] remoteExec ["A3A_fnc_citySupportChange",2]
			};
			if (_loser == teamPlayer) then
			{
				Debug("aggroEvent | Rebels lost an airport");
				if(_winner == Occupants) then
				{
					_prestigeOccupants = [-40, 90];
					_prestigeInvaders = [-20, 90];
				}
				else
				{
					_prestigeOccupants = [-20, 90];
					_prestigeInvaders = [-40, 90];
				};
			};
		};
		["TaskSucceeded", ["", localize "STR_notifiers_airbase_taken"]] remoteExec ["BIS_fnc_showNotification",_winner];
		["TaskFailed", ["", localize "STR_notifiers_airbase_lost"]] remoteExec ["BIS_fnc_showNotification",_loser];
		["TaskUpdated",["",format [localize "STR_notifiers_airbase_lost_other",_textX]]] remoteExec ["BIS_fnc_showNotification",_other];
		killZones setVariable [_markerX,[],true];
	};
	case (_markerX in outposts): {
		if (_winner != teamPlayer) then {
			server setVariable [_markerX,dateToNumber date,true];
			[_markerX,30] call A3A_fnc_addTimeForIdle;
			if (_loser == teamPlayer) then
			{
				Debug("aggroEvent | Rebels lost an outpost");
				if (_winner == Occupants) then
				{
					_prestigeOccupants = [-10, 90];
				}
				else
				{
					_prestigeInvaders = [-10, 90];
				};
			};
		} else {
			Debug("aggroEvent | Rebels took an outpost");
			if (_loser == Occupants) then
			{
				_prestigeOccupants = [30, 150];
				_prestigeInvaders = [-15, 90];
			}
			else
			{
				_prestigeOccupants = [-15, 90];
				_prestigeInvaders = [30, 150];
			};
		};
		["TaskSucceeded", ["", localize "STR_notifiers_outpost_taken"]] remoteExec ["BIS_fnc_showNotification",_winner];
		["TaskFailed", ["", localize "STR_notifiers_outpost_lost"]] remoteExec ["BIS_fnc_showNotification",_loser];
		["TaskUpdated",["",format [localize "STR_notifiers_outpost_lost_other",_textX]]] remoteExec ["BIS_fnc_showNotification",_other];
		killZones setVariable [_markerX,[],true];
	};
	case (_markerX in seaports): {
		if (_winner == teamPlayer) then {
        	Debug("aggroEvent | Rebels took a seaport");
			if (_loser == Occupants) then
			{
				_prestigeOccupants = [20, 120];
			}
			else
			{
				_prestigeInvaders = [20, 120];
			};
		};

		if (toLowerANSI worldName in ["enoch", "vn_khe_sanh", "esseker", "sefrouramal"]) then {
			["TaskSucceeded", ["", localize "STR_notifiers_riverport_taken"]] remoteExec ["BIS_fnc_showNotification",_winner];
			["TaskFailed", ["", localize "STR_notifiers_riverport_lost"]] remoteExec ["BIS_fnc_showNotification",_loser];
			["TaskUpdated",["",format [localize "STR_notifiers_riverport_lost_other",_textX]]] remoteExec ["BIS_fnc_showNotification",_other];
		} else {
			["TaskSucceeded", ["", localize "STR_notifiers_seaport_taken"]] remoteExec ["BIS_fnc_showNotification",_winner];
			["TaskFailed", ["", localize "STR_notifiers_seaport_lost"]] remoteExec ["BIS_fnc_showNotification",_loser];
			["TaskUpdated",["",format [localize "STR_notifiers_seaport_lost_other",_textX]]] remoteExec ["BIS_fnc_showNotification",_other];
		};
	};
	case (_markerX in factories): {
		if (_winner == teamPlayer) then {
			Debug("aggroEvent | Rebels took a factory");
			if (_loser == Occupants) then {
				_prestigeOccupants = [20, 120];
			} else {
				_prestigeInvaders = [20, 120];
			};
		};
		["TaskSucceeded", ["", localize "STR_notifiers_factory_taken"]] remoteExec ["BIS_fnc_showNotification",_winner];
		["TaskFailed", ["", localize "STR_notifiers_factory_lost"]] remoteExec ["BIS_fnc_showNotification",_loser];
		["TaskUpdated",["",format [localize "STR_notifiers_factory_lost_other",_textX]]] remoteExec ["BIS_fnc_showNotification",_other];
	};
	case (_markerX in resourcesX): {
		if (_winner == teamPlayer) then {
			Debug("aggroEvent | Rebels took a resource");
			if (_loser == Occupants) then {
				_prestigeOccupants = [20, 120];
			} else {
				_prestigeInvaders = [20, 120];
			};
		};
		["TaskSucceeded", ["", localize "STR_notifiers_resource_taken"]] remoteExec ["BIS_fnc_showNotification",_winner];
		["TaskFailed", ["", localize "STR_notifiers_resource_lost"]] remoteExec ["BIS_fnc_showNotification",_loser];
		["TaskUpdated",["",format [localize "STR_notifiers_resource_lost_other",_textX]]] remoteExec ["BIS_fnc_showNotification",_other];
	};
	case (_markerX in milbases): {
		if (_winner == teamPlayer) then {
			[0,10,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
			Debug("aggroEvent | Rebels took a military base");

			if (_loser == Occupants) then {
				_prestigeOccupants = [40, 150];
				_prestigeInvaders = [-30, 90];
			}
			else {
				_prestigeOccupants = [-30, 90];
				_prestigeInvaders = [40, 150];
			};
		} else {
			server setVariable [_markerX,dateToNumber date,true];
			[_markerX,60] call A3A_fnc_addTimeForIdle;
			if (_winner == Occupants) then {
				[10,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
			}
			else {
				[-10,-10,_positionX] remoteExec ["A3A_fnc_citySupportChange",2]
			};

			if (_loser == teamPlayer) then {
				Debug("aggroEvent | Rebels lost a military base");
				if(_winner == Occupants) then
				{
					_prestigeOccupants = [-30, 90];
					_prestigeInvaders = [-20, 90];
				}
				else
				{
					_prestigeOccupants = [-20, 90];
					_prestigeInvaders = [-30, 90];
				};
			};
		};
		["TaskSucceeded", ["", localize "STR_notifiers_milbase_taken"]] remoteExec ["BIS_fnc_showNotification",_winner];
		["TaskFailed", ["", localize "STR_notifiers_milbase_lost"]] remoteExec ["BIS_fnc_showNotification",_loser];
		["TaskUpdated",["",format [localize "STR_notifiers_milbase_lost_other",_textX]]] remoteExec ["BIS_fnc_showNotification",_other];
		killZones setVariable [_markerX,[],true];
	};
};

Debug_1("Notification and points done for marker change at %1", _markerX);

{[_markerX,_x] spawn A3A_fnc_deleteControls} forEach controlsX;

if (_winner in [Invaders, teamPlayer] && {_markerX in citiesX}) then {
	private _closestAdminMarker = [milAdministrationsX, _markerX] call BIS_fnc_nearestPosition;
	if ((getMarkerPos _closestAdminMarker) distance2D (getMarkerPos _markerX) < 800) then {
		private _milAdministration = [A3A_milAdministrations, _closestAdminMarker] call BIS_fnc_nearestPosition;
        [_milAdministration, "SILENT"] call SCRT_fnc_location_removeMilAdmin;
	};
};

if (_winner == teamPlayer) then {
	[] call A3A_fnc_tierCheck;

	//Convert all of the static weapons to teamPlayer, essentially. Make them mannable by AI.
	//Make the size larger, as rarely does the marker cover the whole outpost.
	private _staticWeapons = nearestObjects [_positionX, ["LandVehicle", "Ship"], _size * 1.5, true];
	{
		[_x, teamPlayer, true] call A3A_fnc_vehKilledOrCaptured;
		if !(_x in staticsToSave) then {
			staticsToSave pushBack _x;
		};
	} forEach _staticWeapons;
	publicVariable "staticsToSave";

	if (!isNull _flagX) then
	{
		[_flagX,"SDKFlag"] remoteExec ["A3A_fnc_flagaction",0,_flagX];
		[_flagX,FactionGet(reb,"flagTexture")] remoteExec ["setFlagTexture",_flagX];
		sleep 2;
		if (_markerX in seaports) then {[_flagX,"seaport"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_flagX]};
	};
    [Occupants, _prestigeOccupants#0, _prestigeOccupants#1, true] spawn A3A_fnc_addAggression;
    [Invaders, _prestigeInvaders#0, _prestigeInvaders#1, true] spawn A3A_fnc_addAggression;
}
else 
	{
	//Remove static weapons near the marker from the saved statics array
	private _staticWeapons = nearestObjects [_positionX, ["LandVehicle", "Ship"], _size * 1.5, true];
	staticsToSave = staticsToSave - _staticWeapons;
	publicVariable "staticsToSave";
	{
		[_x, _winner, true] call A3A_fnc_vehKilledOrCaptured;
	} forEach _staticWeapons;

	// Clear out captured statics on marker despawn
	[_staticWeapons, _markerX] spawn {
		params ["_statics", "_markerX"];
		waitUntil { sleep 1; spawner getVariable _markerX == 2 };
		{ deleteVehicle _x } forEach (_statics - staticsToSave);
	};

	if (!isNull _flagX) then
	{
		//_flagX setVariable ["isGettingCaptured", nil, true];
		if (_loser == teamPlayer) then
		{
			[_flagX,"remove"] remoteExec ["A3A_fnc_flagaction",0,_flagX];
			sleep 2;
			[_flagX,"take"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_flagX];
		};
		if (_winner == Occupants) then
		{
			[_flagX,FactionGet(occ,"flagTexture")] remoteExec ["setFlagTexture",_flagX];
		}
		else
		{
			[_flagX,FactionGet(inv,"flagTexture")] remoteExec ["setFlagTexture",_flagX];
		};
	};
	if (_loser == teamPlayer) then {
        [Occupants, _prestigeOccupants#0, _prestigeOccupants#1, true] spawn A3A_fnc_addAggression;
        [Invaders, _prestigeInvaders#0, _prestigeInvaders#1, true] spawn A3A_fnc_addAggression;
	};

	//if side somehow manages to capture point after their defeat -
	//for example, attack that was started before last point capture and then succeeded after defeat,
	//they can revert their defeat
	if (areInvadersDefeated && {_winner == Invaders}) then {
		areInvadersDefeated = false;
		publicVariable "areInvadersDefeated";
		"CSAT_carrier" setMarkerAlpha 1;
	};
	if (areOccupantsDefeated && {_winner == Occupants}) then {
		areOccupantsDefeated = false;
		publicVariable "areOccupantsDefeated";
		"NATO_carrier" setMarkerAlpha 1;
	};
};

markersChanging = markersChanging - [_markerX];
["markerChange", [_markerX, _winner]] call EFUNC(Events,triggerEvent);

if (_winner == teamPlayer) then {
	[_loser] remoteExecCall ["SCRT_fnc_common_defeatFactionIfPossible", 2];
};

Debug_1("Finished marker change at %1", _markerX);

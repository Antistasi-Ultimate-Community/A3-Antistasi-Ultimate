/*
Maintainer: Socrates
    Finds position for encounter for encounter depending on Rivals activity level, random.

Return Value:
    <POSITION> Some position if position search succeded, empty array if not. 

Scope: Server
Environment: Any
Public: Yes
Dependencies:
    <NUMBER> inactivityLevelRivals
	<ARRAY<MARKER>> Player-controlled markers.

Example:
[] call SCRT_fnc_rivals_findSuitableEncounterPosition;
*/

#include "..\defines.inc"
FIX_LINE_NUMBERS()

#include "Constants.inc"

private _players = (call SCRT_fnc_misc_getRebelPlayers) select {
	private _playerVeh = vehicle _x;
	alive _x && {!(_playerVeh isKindOf "Helicopter") && {!(_playerVeh isKindOf "Plane")}}
};
if (_players isEqualTo []) exitWith {[]};

private _radius = call SCRT_fnc_rivals_getOperationRadius;

private _rivalsLocations = [] call SCRT_fnc_rivals_getLocations;
private _encounterPosition = [];

switch (inactivityLevelRivals) do {
	case INSIGNIFICANT_ACTIVITY: {
		//Rivals are not active, so no position at all
		_encounterPosition = [];
	};
	case MODERATE_ACTIVITY: {
		//situation starts heating up - players can be caught in the wild, but enemy still have not enough confidence to attack players on any type of outpost
		private _sites = (outposts + airportsX + resourcesX + factories + seaports + milbases + ["Synd_HQ"]) select {sidesX getVariable [_x, sideUnknown] == teamPlayer};
		private _offSitePlayers = _players select {
			private _player = _x; 
			_sites findIf {_player inArea _x} == -1 && {_rivalsLocations findIf {_player distance2D (getMarkerPos _x) < _radius} != -1} 
		};
		if (_offSitePlayers isNotEqualTo []) then {
			_encounterPosition = position (selectRandom _offSitePlayers);
		};
	};
    case CONSPICIOUS_ACTIVITY: {
		//situation continues to rise - players might caught in the wild and on outposts, resources and factories, but enemy still have not enough confidence to attack players on milbases, HQ and airbases
		private _blacklistedSites = (airportsX + milbases + ["Synd_HQ"]) select {sidesX getVariable [_x, sideUnknown] == teamPlayer};
		private _offSitePlayers = _players select {
			private _player = _x; 
			_blacklistedSites findIf {_player inArea _x} == -1 && {_rivalsLocations findIf {_player distance2D (getMarkerPos _x) < _radius} != -1} 
		};
		if (_offSitePlayers isNotEqualTo []) then {
			_encounterPosition = position (selectRandom _offSitePlayers);
		};
    };
	case INTRUSIVE_ACTIVITY: {
		//almost boiling point - players might caught offguard everywhere except HQ
		private _blacklistedSites = ["Synd_HQ"];
		private _offSitePlayers = _players select {
			private _player = _x; 
			_blacklistedSites findIf {_player inArea _x} == -1 && {_rivalsLocations findIf {_player distance2D (getMarkerPos _x) < _radius} != -1} 
		};
		if (_offSitePlayers isNotEqualTo []) then {
			_encounterPosition = position (selectRandom _offSitePlayers);
		};
    };
	case OMNIPRESENT_ACTIVITY: {
		//they're everywhere
		_encounterPosition = position (selectRandom _players);
    };
	default {
		Error_1("Bad level recieved, cannot generate string, was %1",inactivityLevelRivals);
		[]
	};
};

_encounterPosition;

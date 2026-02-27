// Repairs a radio tower.
// Parameter should be present in antennasDead array
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith { Error("Server-only function miscalled") };

params ["_antenna"];

if !(_antenna in antennasDead) exitWith { Error("Attempted to rebuild invalid radio tower") };
Info_1("Repairing Antenna %1", str _antenna);

antennasDead = antennasDead - [_antenna]; publicVariable "antennasDead";
[_antenna] call A3A_fnc_repairRuinedBuilding;
antennas pushBack _antenna; publicVariable "antennas";

{if ([antennas,_x] call BIS_fnc_nearestPosition == _antenna) then {[_x,true] spawn A3A_fnc_blackout}} forEach citiesX;

private _mrkFinal = createMarker [format ["Ant%1", mapGridPosition _antenna], getPos _antenna];
_mrkFinal setMarkerShape "ICON";
_mrkFinal setMarkerType "A3AU_radiotower_mrk";
_mrkFinal setMarkerColor "ColorBlack";
_mrkFinal setMarkerText (localize "STR_radiotower");
mrkAntennas pushBack _mrkFinal;
publicVariable "mrkAntennas";

_antenna addEventHandler ["Killed", {
	params ["_antenna"];
	_antenna removeAllEventHandlers "Killed";
	{if ([antennas,_x] call BIS_fnc_nearestPosition == _antenna) then {[_x,false] spawn A3A_fnc_blackout}} forEach citiesX;
	_mrk = [mrkAntennas, _antenna] call BIS_fnc_nearestPosition;
	mrkAntennas deleteAt(mrkAntennas find _mrk);
	antennas deleteAt(antennas find _antenna);
	deleteMarker _mrk;
	antennasDead pushBack _antenna;
	publicVariable "antennas"; 
	publicVariable "antennasDead"; 
	publicVariable "mrkAntennas";
	["TaskSucceeded",["", localize "STR_notifiers_radiotower_destroyed"]] remoteExec ["BIS_fnc_showNotification",teamPlayer];
	["TaskFailed",["", localize "STR_notifiers_radiotower_destroyed"]] remoteExec ["BIS_fnc_showNotification",Occupants];
}];


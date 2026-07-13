#include "..\defines.inc"
FIX_LINE_NUMBERS()

params["_markerX"];

if (!isServer and hasInterface) exitWith {};

private _positionX = getMarkerPos _markerX;
private _typeGroup = A3A_faction_reb get "groupSniper";

private _props = [];

private _groupX = [_positionX, teamPlayer, _typeGroup] call A3A_fnc_spawnGroup;
_groupX setBehaviour "STEALTH";
_groupX setCombatMode "GREEN";
{
	[_x,_markerX] spawn A3A_fnc_FIAinitBases;
} forEach units _groupX;

private _campfire = createVehicle ["Land_Campfire_F", _positionX];
private _tent = ["Land_TentDome_F", getPosWorld _campfire] call BIS_fnc_createSimpleObject;
_tent setDir (random 360);
_tent setPos [(getPos _tent select 0) + 4, (getPos _tent select 1) + 4, (getPos _tent select 2) - 0.2]; 

_props pushBack _campfire;
_props pushBack _tent;

{
	_x setVectorUp surfaceNormal position _x;
} forEach _props;

["locationSpawned", [_markerX, "RebelWatchpost", true]] spawn EFUNC(Events,triggerEvent);

waitUntil {
	sleep 1; 
	((spawner getVariable _markerX == 2)) or 
	({alive _x} count units _groupX == 0) or (!(_markerX in watchpostsFIA))
};

if ({alive _x} count units _groupX == 0) then {
	watchpostsFIA = watchpostsFIA - [_markerX]; publicVariable "watchpostsFIA";
	markersX = markersX - [_markerX]; publicVariable "markersX";
	sidesX setVariable [_markerX,nil,true];
	_nul = [5,-5,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
	deleteMarker _markerX;
	["TaskFailed", ["", (localize "STR_notifiers_watchpost_lost")]] remoteExec ["BIS_fnc_showNotification", 0];
};

waitUntil {sleep 1; (spawner getVariable _markerX == 2) or (!(_markerX in watchpostsFIA))};

{ 
    deleteVehicle _x 
} forEach units _groupX;
deleteGroup _groupX;

{
	deleteVehicle _x;
} forEach _props;

["locationSpawned", [_markerX, "RebelWatchpost", false]] spawn EFUNC(Events,triggerEvent);

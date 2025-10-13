#include "..\defines.inc"
FIX_LINE_NUMBERS()

params ["_markerX"];

if (!isServer and hasInterface) exitWith {};

private _positionX = getMarkerPos _markerX;
private _garrison = garrison getVariable [_markerX, []];

private _mgClass = (FactionGetTieredFT(A3A_faction_reb, "staticMGs", 0)) # 0;

private _props = [];

if (isNil "_garrison") then {
    _garrison = (A3A_faction_reb get "groupHmgEmpl");
    garrison setVariable [_markerX,_garrison,true];
};

{
    private _relativePosition = [_positionX, 4, _x] call BIS_Fnc_relPos;
    private _sandbag = createVehicle ["Land_BagFence_Round_F", _relativePosition, [], 0, "CAN_COLLIDE"];
    _sandbag setDir ([_sandbag, _positionX] call BIS_fnc_dirTo);
    _sandbag setVectorUp surfaceNormal position _sandbag;
    _props pushBack _sandbag;
} forEach [0, 90, 180, 270];

private _camonet = createVehicle ["CamoNet_BLUFOR_open_F", _positionX, [], 0, "CAN_COLLIDE"];
_props pushBack _camonet;

private _veh = objNull;

//overriden static position and direction
private _staticPositionInfo = staticPositions getVariable [_markerX, []];
if (!(_staticPositionInfo isEqualTo [])) then {
    private _staticPosition = _staticPositionInfo select 0;
    private _staticDirection = _staticPositionInfo select 1;
    _veh = createVehicle [_mgClass, _positionX, [], 0, "CAN_COLLIDE"];
    _veh setPosATL _staticPosition;
    _veh setDir _staticDirection;
} else {
    _veh = _mgClass createVehicle _positionX;
};

_veh lock 3;

sleep 1;

[_veh,"Move_Outpost_Static"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian], _veh];

private _groupX = [_positionX, teamPlayer, _garrison,true,false] call A3A_fnc_spawnGroup;
private _groupXUnits = units _groupX;
_groupXUnits apply { [_x,_markerX] spawn A3A_fnc_FIAinitBases; };

private _crewManIndex = _groupXUnits findIf  {(_x getVariable "unitType") == (A3A_faction_reb get "unitRifle")};
if (_crewManIndex != -1) then {
    private _crewMan = _groupXUnits select _crewManIndex;
    _crewMan moveInGunner _veh;
    [_crewMan, 300] spawn SCRT_fnc_common_scanHorizon;
};

_groupX setBehaviour "AWARE";
_groupX setCombatMode "YELLOW"; 

[_veh, teamPlayer] call A3A_fnc_AIVEHinit;

["locationSpawned", [_markerX, "RebelHmgEmpl", true]] call EFUNC(Events,triggerEvent);


waitUntil {
	sleep 1; 
	((spawner getVariable _markerX == 2)) or 
	({alive _x} count units _groupX == 0) or (!(_markerX in hmgpostsFIA))
};

if ({alive _x} count units _groupX == 0) then {
	hmgpostsFIA = hmgpostsFIA - [_markerX]; publicVariable "hmgpostsFIA";
	markersX = markersX - [_markerX]; publicVariable "markersX";
	sidesX setVariable [_markerX,nil,true];
	_nul = [5,-5,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
	deleteMarker _markerX;
	["TaskFailed", ["", (localize "STR_notifiers_emplacement_lost")]] remoteExec ["BIS_fnc_showNotification", 0];
};

waitUntil {sleep 1; (spawner getVariable _markerX == 2) or (!(_markerX in hmgpostsFIA))};

if (!isNull _veh) then { 
    deleteVehicle _veh;
};

{ 
    deleteVehicle _x 
} forEach units _groupX;
deleteGroup _groupX;

{
	deleteVehicle _x;
} forEach _props;

["locationSpawned", [_markerX, "RebelHmgEmpl", false]] call EFUNC(Events,triggerEvent);

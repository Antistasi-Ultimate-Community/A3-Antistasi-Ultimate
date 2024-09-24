#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_markerX"];

if (!isServer && hasInterface) exitWith{};

Info("Trader Mission Init.");

_positionX = getMarkerPos _markerX;

private _traderPosition = [
    _positionX, //center
    0, //minimal distance
    300, //maximumDistance
    0, //object distance
    0, //water mode
    0.3, //maximum terrain gradient
    0, //shore mode
    [], //blacklist positions
    [_positionX, _positionX] //default position
] call BIS_fnc_findSafePos;

_radGrad = [_traderPosition, 0] call BIS_fnc_terrainGradAngle;

private _outOfBounds = _traderPosition findIf { (_x < 0) || {_x > worldSize}} != -1;

private _enemyBases = (airportsX + milbases + outposts + seaports + factories + resourcesX) select {sidesX getVariable [_x, sideUnknown] != teamPlayer};
private _isTooCloseToOutposts = _enemyBases findIf { _traderPosition distance2d (getMarkerPos _x) < 300 || _traderPosition inArea _x } != -1;

//mitigation of negative terrain gradient
if(!(_radGrad > -0.25 && _radGrad < 0.25) || {isOnRoad _traderPosition || {surfaceIsWater _traderPosition || {_outOfBounds || {_isTooCloseToOutposts}}}}) then {
    private _radiusX = 100;
    while {true} do {
        _traderPosition = [
            _positionX, //center
            0, //minimal distance
            _radiusX, //maximumDistance
            0, //object distance
            0, //water mode
            0.3, //maximum terrain gradient
            0, //shore mode
            [], //blacklist positions
            [_positionX, _positionX] //default position
        ] call BIS_fnc_findSafePos;
        _radGrad = [_traderPosition, 0] call BIS_fnc_terrainGradAngle;
        _outOfBounds = _traderPosition findIf { (_x < 0) || {_x > worldSize}} != -1;
        _isTooCloseToOutposts = _enemyBases findIf { _traderPosition distance2d (getMarkerPos _x) < 300 || _traderPosition inArea _x } != -1;
        if ((_radGrad > -0.25 && _radGrad < 0.25) && {!(isOnRoad _traderPosition) && {!(surfaceIsWater _traderPosition) && {!_outOfBounds && {!_isTooCloseToOutposts}}}}) exitWith {};
        _radiusX = _radiusX + 5;
    };
};

Info("Trader position: " + str _traderPosition);
traderX = [_traderPosition] call SCRT_fnc_trader_createTrader;
publicVariable "traderX";

//due to esotheric BS which fn_scheduler is i have no other choice than sending setTraderStock 
//everywhere in hope that it will be delivered to heckin server (because clientId 2 does not work at all)
[traderX] remoteExecCall ["SCRT_fnc_trader_setStockType", 0];
[traderX] remoteExecCall ["SCRT_fnc_trader_addVehicleMarketAction", 0, true];

_worldName = [] call SCRT_fnc_misc_getWorldName;

private _taskId = "TRADER" + str A3A_taskCount;

[
    [teamPlayer,civilian],
    _taskId,
    [
        format [localize "STR_trader_quest_description", FactionGet(occ,"name"), _worldName, name traderX, FactionGet(occ,"name")],
        localize "STR_trader_quest_header",
        _markerX
    ],
    _traderPosition,
    false,
    0,
    true,
    "meet",
    true
] call BIS_fnc_taskCreate;
[_taskId, "TRADER", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

private _trigger = createTrigger ["EmptyDetector", _traderPosition];
_trigger setTriggerArea [30, 30, 0, false];


waitUntil { 
    sleep 1;
    private _conditionMet = false;

    (call BIS_fnc_listPlayers) findIf {(side _x) in [teamPlayer, civilian] && {_x inArea _trigger}} != -1
};

[_taskId, "TRADER", "SUCCEEDED"] call A3A_fnc_taskSetState;

{
    [5,_x] call A3A_fnc_addScorePlayer;
} forEach (call SCRT_fnc_misc_getRebelPlayers);
[10,theBoss] call A3A_fnc_addScorePlayer;

traderPosition = _traderPosition;
publicVariable "traderPosition";

isTraderQuestAssigned = false;
isTraderQuestCompleted = true;
publicVariable "isTraderQuestAssigned";
publicVariable "isTraderQuestCompleted";

deleteVehicle _trigger;

[_taskId, "TRADER", 5] spawn A3A_fnc_taskDelete;
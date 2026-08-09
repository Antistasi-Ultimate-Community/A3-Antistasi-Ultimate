#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!canSuspend) exitWith { _this spawn A3A_fnc_LOG_Stash; };

params [["_stashType", "random"]];

Info("Stash mission init");

if (!isServer and hasInterface) exitWith{};

if (_stashType == "random") then {
    _stashType = selectRandom ["money", "weapons", "gear", "explosives"];
};

private _difficultX = random 10 < tierWar;

// -----------------------------------------------------------------------------
// LOCATION FINDER
// -----------------------------------------------------------------------------
private _stashPos = [];
private _attempts = 0;

while {_attempts < 10000} do {
    _attempts = _attempts + 1;
    
    // Pick a random spot somewhere on the map
    private _testPos = [worldSize/2, worldSize/2, 0] getPos [random (worldSize * 0.45), random 360];
    
    // Rule 1: Must be on land
    if (surfaceIsWater _testPos) then { continue; };
    
    // Rule 2: Cannot be on a road
    if (isOnRoad _testPos) then { continue; };
    
    // Rule 3: Cannot be inside or clipping into a building/rock
    private _nearbyObstacles = nearestTerrainObjects [_testPos, ["House", "Building", "ROCK", "ROCKS", "WALL", "FENCE"], 15, false, true];
    if (count _nearbyObstacles > 0) then { continue; };
    
    // Rule 4: Must be > 500m away from any main marker
    private _tooClose = false;
    {
        if ((getMarkerPos _x) distance2D _testPos < 500) exitWith { _tooClose = true; };
    } forEach markersX;
    
    if (_tooClose) then { continue; };
    _stashPos = _testPos;
    break;
};

if (_stashPos isEqualTo []) exitWith {
    Error("Could not find a valid wilderness location for the Stash mission.");
};

private _searchCenter = _stashPos getPos [random 400, random 360];
private _nearestLocations = nearestLocations [_stashPos, ["NameCity", "NameCityCapital", "NameVillage", "NameLocal"], 4000];
private _nameDest = if (count _nearestLocations > 0) then { text (_nearestLocations select 0) } else { localize "STR_A3A_Missions_LOG_Stash_Wilderness" };


// -----------------------------------------------------------------------------
// DYNAMIC FACTION & LOADOUT SELECTION
// -----------------------------------------------------------------------------
private _guardSide = sidesX getVariable [[markersX select {sidesX getVariable [_x, sideUnknown] in [Occupants, Invaders]}, _stashPos] call BIS_fnc_nearestPosition, Occupants];
([["_militia",2], ["_militia",3], ["_militia",3], ["_military",4], ["_military",5], ["_military",6], ["_elite",5], ["_elite",5], ["_sf",5], ["_sf",6]] select ((tierWar-1) max 0 min 9)) params ["_unitType", "_unitAmount"];

private _isOcc = (_guardSide == Occupants);
private _factionName = [FactionGet(inv,"name"), FactionGet(occ,"name")] select _isOcc;
private _prefix = format ["loadouts_%1%2_", ["inv", "occ"] select _isOcc, _unitType];
(["Squadleader","AT","AA","LAT","Marksman","Sniper","MachineGunner","Medic","Engineer","ExplosivesExpert","Grenadier","Rifleman"] apply {_prefix + _x}) params ["_slClass", "_atClass", "_aaClass", "_latClass", "_mrkClass", "_snpClass", "_mgClass", "_medicClass", "_engClass", "_expClass", "_grnClass", "_riflemanClass"];


// -----------------------------------------------------------------------------
// TIMER & TASK SETUP
// -----------------------------------------------------------------------------
private _limit = if (_difficultX) then { 45 call SCRT_fnc_misc_getTimeLimit } else { 60 call SCRT_fnc_misc_getTimeLimit };
_limit params ["_dateLimitNum", "_displayTime"];

private _taskId = "LOG" + str A3A_taskCount;

private _searchMrkName = format ["StashSearchArea_%1", str(round(random 100000))];
private _searchMrk = createMarker [_searchMrkName, _searchCenter];
_searchMrk setMarkerShape "ELLIPSE";
_searchMrk setMarkerSize [500, 500];
_searchMrk setMarkerColor "ColorRed";
_searchMrk setMarkerBrush "SolidBorder"; 
_searchMrk setMarkerAlpha 0.5;

private _typeString = switch (_stashType) do {
    case "money": { localize "STR_A3A_Missions_LOG_Stash_Type_Money" };
    case "weapons": { localize "STR_A3A_Missions_LOG_Stash_Type_Weapons" };
    case "gear": { localize "STR_A3A_Missions_LOG_Stash_Type_Gear" };
    case "explosives": { localize "STR_A3A_Missions_LOG_Stash_Type_Explosives" };
    default { localize "STR_A3A_Missions_LOG_Stash_Type_Supplies" };
};

private _taskDesc = format [localize "STR_A3A_Missions_LOG_Stash_Task_Desc", _typeString, _nameDest, _displayTime, _factionName];
private _taskTitle = format [localize "STR_A3A_Missions_LOG_Stash_Task_Title", _typeString];

[
    [teamPlayer, civilian],
    _taskId,
    [
        _taskDesc,
        _taskTitle,
        _searchMrkName
    ],
    _searchCenter,
    false,
    0,
    true,
    "Search",
    true
] call BIS_fnc_taskCreate;

[_taskId, "LOG", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];


// -----------------------------------------------------------------------------
// STASH SPAWNING & LOOT
// -----------------------------------------------------------------------------
private _stashClass = "A3AU_Stash"; 
private _stash = _stashClass createVehicle _stashPos;

if (isNull _stash) exitWith {
    Error_1("Failed to spawn stash object. Invalid classname: %1", _stashClass);
    [_taskId, "LOG", "CANCELED"] call A3A_fnc_taskSetState;
    deleteMarker _searchMrkName;
    [_taskId, "LOG", 1200] spawn A3A_fnc_taskDelete;
};

_stash setPosATL [_stashPos select 0, _stashPos select 1, 0];
_stash allowDamage false;

switch (_stashType) do {
    case "weapons": {
        private _wepNum = 15 + round(random 25);
        [_stash, 5, _wepNum, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] call A3A_fnc_fillLootCrate;
    };
    case "gear": {
        private _itemNum = 10 + round(random 10);
        [_stash, 0, 0, 3, _itemNum, 0, 0, 0, 0, 0, 0, 3, _itemNum, 5, _itemNum, 5, _itemNum, 0, 0] call A3A_fnc_fillLootCrate;
    };
    case "explosives": {
        private _expNum = 20 + round(random 15);
        [_stash, 0, 0, 0, 0, 0, 0, 5, _expNum, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] call A3A_fnc_fillLootCrate;
    };
    case "money": {
        private _bunchCount = 30 + round (random 20);
        if (_bunchCount > 0) then { _stash addMagazineCargoGlobal ["Money_bunch", _bunchCount]; };
    };
};


// -----------------------------------------------------------------------------
// LIGHT SOURCE
// -----------------------------------------------------------------------------

private _nLight = "#lightpoint" createVehicle (getPosATL _stash);
_nLight lightAttachObject [_stash, [0, 0, 0]];

_nLight setLightColor [0, 2, 0];
_nLight setLightAmbient [0, 0.01, 0];
_nLight setLightDayLight false;
_nLight setLightBrightness 0.225;
_nLight setLightAttenuation [0, 0, 0, 4, 5, 5.5];


// -----------------------------------------------------------------------------
// SERVER-SIDE BEEPING AUDIO MECHANIC
// -----------------------------------------------------------------------------
_stash setVariable ["A3A_isBeepingStash", true, true];

[_stash] spawn {
    params ["_stash"];
    while {alive _stash && {(_stash getVariable ["A3A_isBeepingStash", false])}} do {
        playSound3D ["A3\Sounds_F\weapons\Mines\electron_trigger_1.wss", _stash, false, getPosASL _stash, 2.5, 1, 75];
        sleep 1.5;
    };
};


// -----------------------------------------------------------------------------
// GUARD GROUPS
// -----------------------------------------------------------------------------
private _groups = [];

for "_i" from 1 to 4 do {
    // Parameters: [Center, MinDist, MaxDist, ObjectProximity, WaterMode, MaxGradient, ShoreMode]
    private _spawnPos = [_searchCenter, 200, 400, 2, 0, 0.3, 0] call A3A_fnc_getSafePos;
    
    // 1. Build the unit composition array dynamically
    private _groupTypes = [_slClass]; // SL is always first
    private _specialists = [
        selectRandom [_atClass, _aaClass, _latClass],
        selectRandom [_medicClass, _engClass],
        selectRandom [_mrkClass, _mgClass, _snpClass],
        selectRandom [_expClass, _grnClass]
    ] call BIS_fnc_arrayShuffle;

    for "_j" from 2 to _unitAmount do {
        private _unitToSpawn = if (_j - 2 < count _specialists) then { _specialists select (_j - 2) } else { _riflemanClass };
        _groupTypes pushBack _unitToSpawn;
    };
    
    // 2. Spawn the entire group automatically using Antistasi's function
    private _groupX = [_spawnPos, _guardSide, _groupTypes] call A3A_fnc_spawnGroup;

    {
        [_x] call A3A_fnc_NATOinit;
    } forEach units _groupX;
    
    // 3. Hand the group over to PATCOM (Patrol Commander)
    [_groupX, "Patrol_Area", 50, 500, 600, true, _searchCenter, true] call A3A_fnc_patrolLoop;
    
    _groups pushBack _groupX;
};


// -----------------------------------------------------------------------------
// MAIN MISSION LOOP (PROXIMITY CHECK)
// -----------------------------------------------------------------------------
private _timeNear = 0;
private _missionSuccess = false;

while {dateToNumber date <= _dateLimitNum} do {
    sleep 1;
    
    if (isNull _stash) exitWith {}; 
    
    private _playerNear = false;
    private _rebelPlayers = call SCRT_fnc_misc_getRebelPlayers;
    
    {
        if (_x distance _stash <= 5 && {alive _x} && {!(_x getVariable ["incapacitated", false])}) exitWith {
            _playerNear = true;
        };
    } forEach _rebelPlayers;
    
    if (_playerNear) then {
        _timeNear = _timeNear + 1;
    } else {
        _timeNear = 0; 
    };
    
    if (_timeNear >= 5) exitWith {
        _missionSuccess = true;
    };
};


// -----------------------------------------------------------------------------
// SUCCESS / FAILURE EVALUATION
// -----------------------------------------------------------------------------
private _bonus = if (_difficultX) then {2} else {1};

_stash setVariable ["A3A_isBeepingStash", false, true];
deleteMarker _searchMrkName;

if (_missionSuccess) then {
    [_taskId, _stashPos] call BIS_fnc_taskSetDestination;
    
    private _successDesc = format [localize "STR_A3A_Missions_LOG_Stash_Task_Desc_Success", _typeString];
    private _successTitle = localize "STR_A3A_Missions_LOG_Stash_Task_Title_Success";
    [_taskId, [_successDesc, _successTitle, ""]] call BIS_fnc_taskSetDescription;
    [_taskId, "LOG", "SUCCEEDED"] call A3A_fnc_taskSetState;
    
    [localize "STR_A3A_Missions_LOG_Stash_Success", localize "STR_A3A_Missions_LOG_Stash_Hint_Body"] remoteExec ["A3A_fnc_customHint", [teamPlayer, civilian]];
    
    {
        [10 * _bonus, _x] call A3A_fnc_addScorePlayer;
        [250 * _bonus, _x] call A3A_fnc_addMoneyPlayer;
    } forEach (call SCRT_fnc_misc_getRebelPlayers);
    
    [5 * _bonus, theBoss] call A3A_fnc_addScorePlayer;
    [150 * _bonus, theBoss, true] call A3A_fnc_addMoneyPlayer;

    [_stashPos] spawn {
        params ["_pos"];
        private _markerXName = format ["StashFoundX_%1", str(round(random 100000))];
        private _mrkX = createMarker [_markerXName, _pos];
        _mrkX setMarkerShape "ICON";
        _mrkX setMarkerType "mil_destroy";
        _mrkX setMarkerColor colorTeamPlayer;
        _mrkX setMarkerText (localize "STR_A3A_Missions_LOG_Stash_Marker");
        
        sleep 600;
        deleteMarker _markerXName;
    };
    
} else {
    [_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState;
    [-10 * _bonus, theBoss] call A3A_fnc_addScorePlayer;
};


// -----------------------------------------------------------------------------
// CLEANUP
// -----------------------------------------------------------------------------
if (!isNull _nLight) then { [_nLight] spawn A3A_fnc_postmortem; };
if (!isNull _stash) then { [_stash] spawn A3A_fnc_postmortem; };

{
    private _grp = _x;
    { [_x] spawn A3A_fnc_postmortem } forEach units _grp;
} forEach _groups;

[_taskId, "LOG", 1200] spawn A3A_fnc_taskDelete;
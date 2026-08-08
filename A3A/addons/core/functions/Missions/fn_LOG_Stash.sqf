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
private _faction = Faction(Occupants);
private _side = Occupants;

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

// Get a local name just for flavor text in the task
private _nearestLocations = nearestLocations [_stashPos, ["NameCity", "NameCityCapital", "NameVillage", "NameLocal"], 4000];
private _nameDest = if (count _nearestLocations > 0) then { text (_nearestLocations select 0) } else { localize "STR_A3A_Missions_LOG_Stash_Wilderness" };

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

private _taskDesc = format [localize "STR_A3A_Missions_LOG_Stash_Task_Desc", _typeString, _nameDest, _displayTime];
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

private _faction = Faction(Occupants);

switch (_stashType) do {
    case "weapons": {
        private _wepNum = 15 + round(random 20);
        [_stash, 5, _wepNum, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] call A3A_fnc_fillLootCrate;
    };
    case "gear": {
        private _itemNum = 3 + round(random 3);
        private _backNum = 2 + round(random 3);
        private _helmNum = 10 + round(random 10);
        private _vestNum = 10 + round(random 10);
        [_stash, 0, 0, 3, _itemNum, 0, 0, 0, 0, 0, 0, 3, _backNum, 5, _helmNum, 5, _vestNum, 0, 0] call A3A_fnc_fillLootCrate;
    };
    case "explosives": {
        private _expNum = 10 + round(random 15);
        [_stash, 0, 0, 0, 0, 0, 0, 5, _expNum, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] call A3A_fnc_fillLootCrate;
    };
    case "money": {
        private _bunchCount = round (random 5);
        if (_bunchCount > 0) then { _stash addMagazineCargoGlobal ["Money_bunch", _bunchCount]; };
        
        private _rollCount = round (random 3);
        if (_rollCount > 0) then { _stash addMagazineCargoGlobal ["Money_roll", _rollCount]; };
        
        private _stackCount = 1 + round (random 2);
        _stash addMagazineCargoGlobal ["Money_stack", _stackCount];
        
        private _moneyCount = 1 + round (random 1);
        _stash addMagazineCargoGlobal ["Money", _moneyCount];
    };
};

// -----------------------------------------------------------------------------
// CLIENT-SIDE BEEPING AUDIO MECHANIC
// -----------------------------------------------------------------------------
_stash setVariable ["A3A_isBeepingStash", true, true];

[
    [_stash],
    {
        params ["_stash"];
        if (!hasInterface) exitWith {};
        
        [_stash] spawn {
            params ["_stash"];
            while {alive _stash && {(_stash getVariable ["A3A_isBeepingStash", false])}} do {
                if (alive player && {player distance _stash <= 75} && {"MineDetector" in (items player + assignedItems player)}) then {
                    playSound3D ["A3\Sounds_F\weapons\Mines\electron_trigger_1.wss", _stash, false, getPosASL _stash, 2.5, 1, 75];
                };
                
                sleep 1.5;
            };
        };
    }
] remoteExec ["call", 0, _taskId];


// -----------------------------------------------------------------------------
// RIVAL GUARD GROUPS & PATROL VEHICLE
// -----------------------------------------------------------------------------
private _groups = [];
private _vehicles = [];
private _numGroups = 3 + floor(random 3);

for "_i" from 1 to _numGroups do {
    private _spawnPos = _searchCenter getPos [random 400, random 360];
    _spawnPos = [_spawnPos, 0, 100, 2, 0, 0.3, 0, [], [_spawnPos, _spawnPos]] call BIS_fnc_findSafePos;
    private _groupX = createGroup Invaders; 

    [_groupX, "loadouts_riv_militia_Mercenary", _spawnPos, [], 5, "NONE"] call A3A_fnc_RivalsCreateUnit;
    [_groupX, "loadouts_riv_militia_Sharpshooter", _spawnPos, [], 5, "NONE"] call A3A_fnc_RivalsCreateUnit;
    [_groupX, "loadouts_riv_militia_Oppressor", _spawnPos, [], 5, "NONE"] call A3A_fnc_RivalsCreateUnit;

    {
        [_x] call A3A_fnc_NATOinit;
    } forEach units _groupX;
    
    [_groupX, "Patrol_Area", 25, 100, 500, true, _searchCenter, false] call A3A_fnc_patrolLoop;
    
    _groups pushBack _groupX;
};

private _vehPos = [_searchCenter, 10, 400, 5, 0, 0.3, 0, [], [_searchCenter, _searchCenter]] call BIS_fnc_findSafePos;
private _rivFaction = missionNamespace getVariable ["A3A_faction_riv", createHashMap];
private _vehPool = _rivFaction getOrDefault ["vehiclesLightArmed", ["I_G_Offroad_01_armed_F"]];
private _vehType = selectRandom _vehPool;

private _vehGroup = createGroup Invaders;
[_vehPos, random 360, _vehType, _vehGroup] call A3A_fnc_RivalsSpawnVehicle params ["_patrolVeh", "_patrolCrew", "_spawnedGroup"];

{ [_x] call A3A_fnc_NATOinit; } forEach units _spawnedGroup;
[_patrolVeh, Invaders] call A3A_fnc_AIVEHinit;
[_spawnedGroup, "Patrol_Area", 25, 150, 500, true, _searchCenter, false] call A3A_fnc_patrolLoop;

_groups pushBack _spawnedGroup;
_vehicles pushBack _patrolVeh;


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
        if (_x distance _stash <= 12 && {alive _x} && {!(_x getVariable ["incapacitated", false])}) exitWith {
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

    // --- SPAWN THE 10-MINUTE 'X' MARKER ---
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
    // -------------------------------------------
    
} else {
    [_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState;
    [-10 * _bonus, theBoss] call A3A_fnc_addScorePlayer;
};


// -----------------------------------------------------------------------------
// CLEANUP
// -----------------------------------------------------------------------------
remoteExec ["", _taskId]; 

if (!isNull _stash) then { [_stash] spawn A3A_fnc_postmortem; };

{
    private _grp = _x;
    { [_x] spawn A3A_fnc_postmortem } forEach units _grp;
} forEach _groups;

{ [_x] spawn A3A_fnc_postmortem } forEach _vehicles;

[_taskId, "LOG", 1200] spawn A3A_fnc_taskDelete;
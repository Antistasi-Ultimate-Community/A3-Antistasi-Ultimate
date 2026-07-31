#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_site", "_position"];

private _nameDest = [_site] call A3A_fnc_localizar;

// Prevent spamming multiple rebuild missions for the same site using a popup
if (missionNamespace getVariable [format ["A3U_rebuilding_%1", _site], false]) exitWith {
    [
        localize "STR_A3U_rebuild_already_active",
        localize "STR_notifiers_rebuild_assets_header",
        localize "STR_antistasi_dialogs_close",
        false,
        findDisplay 46
    ] spawn BIS_fnc_guiMessage;
};

private _leave = false;
private _antennaDead = objNull;
private _economyDead = "";
private _cost = 5000; // Default cost for generic locations (cities, milbases, outposts)

// Check for Radio Tower
if (_site in outposts || {_site in mrkAntennas}) then {
    private _antennasDead = antennasDead select {(_x inArea _site) || {(_x distance2D _position) < 100}};
    if (count _antennasDead > 0) then {
        _antennaDead = _antennasDead select 0;
        _cost = 3500; // Radio tower specific cost
    };
};

// Check for Economic Site
if ((_site in factories || _site in resourcesX) && _site in destroyedSites) then {
    _economyDead = _site;
    _cost = 5000; // Economy specific cost
    Debug_1("Rebuilding Economic Site %1", _economyDead);
};

// -----------------------------------------------------------------------------
// EARLY VALIDATION CHECK
// Prevent mission start if there are no destroyed assets at this location
// -----------------------------------------------------------------------------
private _nothingToRebuild = false;

switch (true) do {
    case (_site in citiesX): {
        if !(_site in destroyedSites) then { _nothingToRebuild = true; };
    };
    case (_economyDead != ""): {}; 
    case (!isNull _antennaDead): {}; 
    default {
        // Generic locations (milbases, outposts, etc.)
        private _militaryBuildings = (nearestObjects [_position, A3A_buildingWhitelist, 500, true]) select {_x in destroyedBuildings};
        if (_militaryBuildings isEqualTo []) then { _nothingToRebuild = true; };
    };
};

if (_nothingToRebuild) exitWith {
    [
        format [localize "STR_notifiers_rebuild_assets_nothing_to_rebuild", _nameDest],
        localize "STR_notifiers_rebuild_assets_header",
        localize "STR_antistasi_dialogs_close",
        false,
        findDisplay 46
    ] spawn BIS_fnc_guiMessage;
};

// Verify Faction Funds and throw a popup if insufficient
private _factionMoney = server getVariable ["resourcesFIA", 0];
if (_factionMoney < _cost) exitWith {
    [
        localize "STR_A3U_rebuild_insufficient_funds",
        localize "STR_notifiers_rebuild_assets_header",
        localize "STR_antistasi_dialogs_close",
        false,
        findDisplay 46
    ] spawn BIS_fnc_guiMessage;
};

// Deduct funds upfront to prevent purchasing other things while the mission is active
[0, -_cost] remoteExec ["A3A_fnc_resourcesFIA", 2];
missionNamespace setVariable [format ["A3U_rebuilding_%1", _site], true, true];


// -----------------------------------------------------------------------------
// TASK CREATION & LOGISTICS SETUP
// -----------------------------------------------------------------------------
private _taskId = "REBUILD_" + _site + str(round(random 10000));

[
    [teamPlayer, civilian],
    _taskId,
    [
        format [localize "STR_A3U_rebuild_task_desc", _nameDest],
        localize "STR_A3U_rebuild_task_header",
        _site
    ],
    _position,
    false,
    0,
    true,
    "Build",
    true
] call BIS_fnc_taskCreate;

[_taskId, "REBUILD", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

// Spawn the construction materials box at HQ
private _pos = (getMarkerPos respawnTeamPlayer) findEmptyPosition [1, 50, "C_IDAP_supplyCrate_F"];
private _box = "C_IDAP_supplyCrate_F" createVehicle _pos;

// Clear the box inventory and disable its interactive container capability
clearItemCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;

// Configure logistics properties
_box enableRopeAttach true;
_box allowDamage false;
[_box] call A3A_Logistics_fnc_addLoadAction;
[_box, teamPlayer] call A3A_fnc_AIVEHinit;
[_box, localize "STR_marker_supply_box"] spawn A3A_fnc_inmuneConvoy;

// -----------------------------------------------------------------------------
// QRF TRIGGER LOGIC
// -----------------------------------------------------------------------------
if (random 100 <= 75) then {
    private _enemyMarkers = (airportsX + milbases + outposts + seaports + factories + resourcesX) select {
        sidesX getVariable [_x, sideUnknown] in [Occupants, Invaders]
    };
    
    if (count _enemyMarkers > 0) then {
        private _nearestEnemyMarker = [_enemyMarkers, _position] call BIS_fnc_nearestPosition;
        private _qrfSide = sidesX getVariable [_nearestEnemyMarker, sideUnknown];
        
        private _suppName = format ["REBUILD_QRF_%1_%2", _site, round(time)];
        private _maxSpend = A3A_balanceVehicleCost * (2 + round (tierWar / 3));
        
        if (random 100 <= 75) then {
            [_suppName, _qrfSide, "attack", _maxSpend, false, _position, 1, -1] spawn A3A_fnc_SUP_QRFLand;
        } else {
            [_suppName, _qrfSide, "attack", _maxSpend, false, _position, 1, -1] spawn A3A_fnc_SUP_QRFAir;
        };
    };
};

// -----------------------------------------------------------------------------
// DELIVERY AND TIMER LOOP
// -----------------------------------------------------------------------------
[_box, _position, _taskId, _site, _cost, _antennaDead, _economyDead, _nameDest] spawn {
    params ["_box", "_position", "_taskId", "_site", "_cost", "_antennaDead", "_economyDead", "_nameDest"];

    waitUntil {
        sleep 1;
        (!alive _box) || {(_box distance _position < 50) && (isNull attachedTo _box) && (isNull ropeAttachedTo _box)}
    };

    if (!alive _box) exitWith {
        [_taskId, "REBUILD", "FAILED"] call A3A_fnc_taskSetState;
        missionNamespace setVariable [format ["A3U_rebuilding_%1", _site], false, true];
        [0, _cost] remoteExec ["A3A_fnc_resourcesFIA", 2];
        
        [
            localize "STR_notifiers_fail_type",
            localize "STR_notifiers_rebuild_assets_header",
            parseText localize "STR_A3U_rebuild_box_destroyed",
            30
        ] spawn SCRT_fnc_ui_showMessage;
        
        [_taskId, "REBUILD", 1200] spawn A3A_fnc_taskDelete;
    };

    private _timer = round (60 + random 120);
    [localize "STR_notifiers_rebuild_assets_header", localize "STR_A3U_rebuild_timer_started", false] remoteExec ["A3A_fnc_customHint", [teamPlayer, civilian]];

    while {_timer > 0 && alive _box} do {
        if ((_box distance _position >= 50) || (!isNull attachedTo _box) || (!isNull ropeAttachedTo _box)) then {
            
            [true] remoteExec ["A3A_fnc_customHintDismiss", [teamPlayer, civilian]];
            [localize "STR_notifiers_rebuild_assets_header", localize "STR_A3U_rebuild_moved_away", false] remoteExec ["A3A_fnc_customHint", [teamPlayer, civilian]];
            
        	waitUntil {
                sleep 1;
                (!alive _box) || {(_box distance _position < 50) && (isNull attachedTo _box) && (isNull ropeAttachedTo _box)}
            };
            if (alive _box) then {
                [localize "STR_notifiers_rebuild_assets_header", localize "STR_A3U_rebuild_timer_started", false] remoteExec ["A3A_fnc_customHint", [teamPlayer, civilian]];
            };
        } else {
            
            // --- NEW: Custom Hint Loop (In-Place Update) ---
            private _timerText = format ["<t size='1.25' align='center'>%1:<br/>%2s</t>", localize "STR_A3U_rebuild_time_remaining", _timer];
            [
                [localize "STR_notifiers_rebuild_assets_header", _timerText],
                {
                    params ["_header", "_text"];
                    if (isNil "A3A_customHint_MSGs") then { A3A_customHint_MSGs = []; };
                    private _topIndex = (count A3A_customHint_MSGs) - 1;
                    
                    if (_topIndex >= 0 && {(A3A_customHint_MSGs select _topIndex) select 0 == _header}) then {
                        (A3A_customHint_MSGs select _topIndex) set [1, parseText _text];
                        A3A_customHint_UpdateTime = serverTime;
                    } else {
                        [_header, _text, true] call A3A_fnc_customHint;
                    };
                }
            ] remoteExec ["call", [teamPlayer, civilian]];
            
            sleep 1;
            _timer = _timer - 1;
        };
    };

    [true] remoteExec ["A3A_fnc_customHintDismiss", [teamPlayer, civilian]];

    if (!alive _box) exitWith {
        [_taskId, "REBUILD", "FAILED"] call A3A_fnc_taskSetState;
        missionNamespace setVariable [format ["A3U_rebuilding_%1", _site], false, true];
        [0, _cost] remoteExec ["A3A_fnc_resourcesFIA", 2];
        
        [
            localize "STR_notifiers_fail_type",
            localize "STR_notifiers_rebuild_assets_header",
            parseText localize "STR_A3U_rebuild_box_destroyed",
            30
        ] spawn SCRT_fnc_ui_showMessage;
        
        [_taskId, "REBUILD", 1200] spawn A3A_fnc_taskDelete;
    };

    // -----------------------------------------------------------------------------
    // SUCCESS EXECUTION (Original Rebuild Logic)
    // -----------------------------------------------------------------------------
    [_taskId, "REBUILD", "SUCCEEDED"] call A3A_fnc_taskSetState;
    missionNamespace setVariable [format ["A3U_rebuilding_%1", _site], false, true];
    
    deleteVehicle _box;

    private _rebuildSuccess = {
        params ["_message", ["_name", _nameDest]];
        [
            localize "STR_notifiers_success_type",
            localize "STR_notifiers_rebuild_assets_header",
            parseText format [localize _message, _name],
            30
        ] spawn SCRT_fnc_ui_showMessage;
    };

    private _rebuildFail = {
        params ["_message", ["_name", _nameDest]];
        [
            localize "STR_notifiers_fail_type",
            localize "STR_notifiers_rebuild_assets_header",
            parsetext format [localize _message, _name],
            30
        ] spawn SCRT_fnc_ui_showMessage;
    };

    switch (true) do {
        case (_site in citiesX): {
            [0, 10, _position] remoteExec ["A3A_fnc_citySupportChange",2];
            [Occupants, 10, 30] remoteExec ["A3A_fnc_addAggression",2];
            [Invaders, 10, 30] remoteExec ["A3A_fnc_addAggression",2];

            private _destroyedSite = destroyedSites find _site;
            if (_destroyedSite == -1) exitWith {
                ["STR_notifiers_rebuild_assets_nothing_to_rebuild", _nameDest] call _rebuildFail;
                [0, _cost] remoteExec ["A3A_fnc_resourcesFIA", 2];
            };
            destroyedSites deleteAt(_destroyedSite);
            publicVariable "destroyedSites";

            ["STR_notifiers_rebuild_assets_success"] call _rebuildSuccess;
        };
        
        case (_economyDead != ""): {
            [_economyDead] remoteExec ["A3A_fnc_rebuildEconomicAssets", 2];
            ["STR_notifiers_rebuild_assets_success"] call _rebuildSuccess;
        };

        case (!isNull _antennaDead): {
            private _militaryBuildings = nearestObjects [_position, A3A_buildingWhitelist, 500, true];
            {
                [_x] remoteExec ["A3A_fnc_repairRuinedBuilding", 2];
            } forEach _militaryBuildings;

            [_antennaDead] remoteExec ["A3A_fnc_rebuildRadioTower", 2];
            ["STR_notifiers_rebuild_assets_radiotower_success"] call _rebuildSuccess;
        };

        default {
            [clientOwner, "destroyedBuildings"] remoteExecCall ["publicVariableClient", 2];

            private _militaryBuildings = (nearestObjects [_position, A3A_buildingWhitelist, 500, true]) select {_x in destroyedBuildings};
            if (_militaryBuildings isEqualTo []) exitWith {
                ["STR_notifiers_rebuild_assets_nothing_to_rebuild", _nameDest] call _rebuildFail;
                [0, _cost] remoteExec ["A3A_fnc_resourcesFIA", 2];
            };
            
            {
                [_x] remoteExec ["A3A_fnc_repairRuinedBuilding", 2];
            } forEach _militaryBuildings;
            
            ["STR_notifiers_rebuild_assets_success", _nameDest] call _rebuildSuccess;
            [clientOwner, "destroyedBuildings"] remoteExecCall ["publicVariableClient", 2];
        };
    };

    [_taskId, "REBUILD", 1200] spawn A3A_fnc_taskDelete;
};
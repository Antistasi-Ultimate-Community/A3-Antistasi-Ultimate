/*
    Author:
        Adapted from ABZ XEH_postInit and ABZ_fnc_load by FirewalkDev,
        modified to use AU server init done event by Creep'nCrunch / jwoodruff40        

    Description:
        Boots Antistasi Bazaar systems;
        Loads the state of vendors, crates, and smuggling runs from AU campaign save data hashmap.
    
    Params:
        None
    
    Dependencies:
        N/A
    
    Scope:
        Server
    
    Environment:
        Scheduled
    
    Usage:
        [] spawn ABZ_fnc_onEventServerInitDone;
    
    Return:
        None
*/

#include "..\script_component.hpp"
if (!isServer) exitWith {};

private _fnc_load = {
    // SERVER: restores traders and sealed crates from the profile save.
    if (ABZ_loaded) exitWith {};
    ABZ_loaded = true;
    if !(missionNamespace getVariable ["ABZ_persistence", true]) exitWith {};

    A3A_saveTarget params ["_serverID", "_campaignID", ""];
    private _namespace = [profileNamespace, missionProfileNamespace] select (_serverID isEqualTo false);
    private _campaignSaveData = _namespace getVariable [format ["A3A_saveData_%1", _campaignID], createHashMap];
    private _saveDataPlugins = _campaignSaveData getOrDefault ["saveDataPlugins", createHashMap];

    private _v = _saveDataPlugins getOrDefault ["ABZ_vendors", []];
    private _n = 0;
    {
        if !(_x isEqualType [] && {count _x >= 12}) then { continue };
        private _e = +_x;
        _e set [7, time + (_e select 7)];
        _e set [10, time + (_e select 10)];
        // drop stock from mods that are no longer loaded
        _e set [6, (_e select 6) select {
            _x isEqualType [] && {count _x >= 6} && {
                if ((_x select 5) isEqualTo "vehicle") then {
                    count _x >= 8 && {isClass (configFile >> "CfgVehicles" >> (_x select 0))}
                } else {
                    ([_x select 0] call ABZ_fnc_sellClass) isEqualTo (_x select 0)
                }
            }
        }];
        // saves from before jobs existed have 12 fields
        [_e] call ABZ_fnc_entryPad;
        // a saved smuggling offer: [destId, payout, secs, km, enemy share]
        private _o = _e select 13;
        if !(_o isEqualTo [] || {count _o >= 5 && {(_o select 0) isEqualType 0} && {(_o select 1) isEqualType 0}}) then { _e set [13, []]; _e set [14, -1] };
        if !((_e select 12) isEqualType [] && {(_e select 12) isEqualTo [] || {count (_e select 12) >= 4 && {(((_e select 12) select 0) isEqualType "") && {([(_e select 12) select 0] call ABZ_fnc_sellClass) isEqualTo ((_e select 12) select 0)}}}}) then { _e set [12, []] };
        ABZ_vendors pushBack _e;
        [_e] call ABZ_fnc_vendorMarker;
        _n = _n + 1;
    } forEach _v;

    // prices follow today's rules: a row saved under older prices (another
    // version, other settings) never sells below what it costs now
    call ABZ_fnc_repriceRows;

    // a restored job must pass today's job rules (fn_rollJob), under any name
    // things turn into (fn_turnsInto):
    //   - nothing the Arms Dealer sells: such a job is dropped (the next
    //     restock rolls a new one) - he has an endless supply
    //   - nothing on a trader's table: those rows come off the table instead
    //     (the trader keeps them for the job), so the job's progress is kept
    private _dealerReach = (call ABZ_fnc_dealerReach) select 0;
    private _jobNames = createHashMap;
    {
        private _j = _x select 12;
        if (_j isNotEqualTo []) then {
            if ((toLower (_j select 0)) in _dealerReach) then {
                Debug_2("[ABZ] Dropped trader #%1's saved job (%2): the Arms Dealer sells it",_x select 0,_j select 0);
                _x set [12, []];
            } else {
                if ((_j select 2) < (_j select 1)) then { _jobNames set [toLower (_j select 0), true] };
            };
        };
    } forEach ABZ_vendors;
    if (count _jobNames > 0) then {
        {
            private _keep = (_x select 6) select {
                !((_x select 0) isEqualType "") || {(([_x select 0] call ABZ_fnc_yields) findIf { _x in _jobNames }) == -1}
            };
            if (count _keep < count (_x select 6)) then {
                Debug_2("[ABZ] Trader #%1: %2 saved row(s) set aside for an open job",_x select 0,(count (_x select 6)) - (count _keep));
                _x set [6, _keep];
            };
        } forEach ABZ_vendors;
    };

    ABZ_nextId = _saveDataPlugins getOrDefault ["ABZ_nextId", 0];
    if !(ABZ_nextId isEqualType 0) then { ABZ_nextId = 0 };
    { if ((_x select 0) >= ABZ_nextId) then { ABZ_nextId = (_x select 0) + 1 } } forEach ABZ_vendors;

    private _c = _saveDataPlugins getOrDefault ["ABZ_crates", []];
    private _m = 0;
    {
        _x params [["_cls", "", [""]], ["_cnt", 0, [0]], ["_pos", [], [[]]]];
        if (_cls == "" || {_cnt <= 0} || {count _pos < 2}) then { continue };
        // the mod that made it is gone, or it's something traders no longer deal
        // in (a loose disposable rocket, a preset pack) - same rule as the stock
        if !(([_cls] call ABZ_fnc_sellClass) isEqualTo _cls) then { continue };
        [_pos, _cls, _cnt, objNull] call ABZ_fnc_serverDeliverCrate;
        _m = _m + 1;
    } forEach _c;

    // smuggling runs (v1.1.0): only those whose destination trader came back
    ABZ_nextRunId = _saveDataPlugins getOrDefault ["ABZ_nextRunId", 0];
    if !(ABZ_nextRunId isEqualType 0) then { ABZ_nextRunId = 0 };
    private _rs = _saveDataPlugins getOrDefault ["ABZ_runs", []];
    if !(_rs isEqualType []) then { _rs = [] };
    {
        if !(_x isEqualType [] && {count _x >= 10}) then { continue };
        _x params [["_runId", -1, [0]], ["_uid", "", [""]], ["_owner", "", [""]], ["_srcId", -1, [0]], ["_destId", -1, [0]], ["_pay", 0, [0]], ["_left", 0, [0]], ["_pos", [], [[]]], ["_srcTown", "", [""]], ["_srcName", "", [""]], ["_srcPos", [0, 0, 0], [[]]], ["_shot", false, [false]]];
        if (_runId < 0 || {_uid == ""} || {count _pos < 2} || {_left <= 0}) then { continue };
        if ((ABZ_runs findIf { (_x select 1) == _uid }) > -1) then { continue };	// one per player
        private _d = [_destId] call ABZ_fnc_vendorEntry;
        if (_d isEqualTo []) then { continue };
        private _crate = [_pos, _runId, _owner, _d select 5, _d select 1] call ABZ_fnc_runSpawnCrate;
        // saved out at sea (in a boat or a helicopter): it comes back ashore
        // (fn_makeCrate), with time to get from there
        if (surfaceIsWater _pos) then { _left = _left max ([_crate distance2D (_d select 2)] call ABZ_fnc_runAllowance) };
        ABZ_runs pushBack [_runId, _uid, _owner, _srcId, _destId, _pay, time + _left, _crate, _srcTown, _srcName, _srcPos, _shot];
        if (_runId >= ABZ_nextRunId) then { ABZ_nextRunId = _runId + 1 };
    } forEach _rs;
    call ABZ_fnc_runPublish;

    Info_5("[ABZ] Restored %1 trader(s), %2 sealed crate(s) and %3 smuggling run(s) on %4 (%5)",_n,_m,count ABZ_runs,worldName,_campaignID);
    if (_n > 0 || {_m > 0}) then {
        ["ABZ_chat", [format ["[Bazaar] Restored %1 trader(s) and %2 sealed crate(s).", _n, _m]]] call CBA_fnc_globalEvent;
    };
};

sleep 5;	// let Antistasi finish stamping its factions/arsenal
call ABZ_fnc_buildPool;
call ABZ_fnc_buildVehPool;
call ABZ_fnc_dealerReach;	// build the Arms Dealer lookup here, scheduled, not mid-restock
call _fnc_load;
call ABZ_fnc_publishStalls;
[] spawn ABZ_fnc_vendorLoop;
[] spawn ABZ_fnc_seizureLoop;

nil;

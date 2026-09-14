#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Info("Setup monitor started");

// Collect all CfgPatches dependencies so that client knows what's available on server
private _loadedPatches = [];
private _factions = "true" configClasses (configFile/"A3A"/"Templates");
private _addonVics = "true" configClasses (configFile/"A3A"/"AddonVics");
{
    {
        if (isClass (configFile/"CfgPatches"/_x)) then { _loadedPatches pushBackUnique _x };
    } forEach getArray (_x/"requiredAddons");
} forEach (_factions + _addonVics);

// Ignore DLC without equipment and vehicles
// Need the true names from here, so pass it all in
// Arma bug: Need to hardcode CDLC because arma3.cfg mod loading method doesn't register CDLC as "official"
private _loadedDLC = getLoadedModsInfo select { (_x#2) and !(_x#1 in ["A3","curator","argo","tacops"]) };
_loadedDLC append (getLoadedModsInfo select { tolower (_x#1) in ["ef", "gm", "rf", "spe", "vn", "ws", "csla"] });

// Get server OS / platform for new / old save file usage
private _platform = productVersion select 6;
private _saveData = nil;

private _autoLoadTime = "autoLoadLastGame" call BIS_fnc_getParamValue;

if (GVAR(extendersLoadedInvalid) isNotEqualTo []) then {
    GVAR(showExtendersWarningDialog) = true;

    if (_autoLoadTime >= 0) then {
        Error_1("Mission autoload disabled due to %1 invalid extenders.",count GVAR(extendersLoadedInvalid));
        _autoLoadTime = -1;
    };
};

private _autoLoadData = nil;
if (_autoLoadTime >= 0) then
{
    Info("Searching for suitable saves for automatic loading");

    private _validFactions = _factions select { getArray (_x/"requiredAddons") findIf { !(_x in _loadedPatches) } == -1 } apply { configName _x };
    private _validAddons = _addonVics select { getArray (_x/"requiredAddons") findIf { !(_x in _loadedPatches) } == -1 } apply { configName _x };
    private _validDLC = _loadedDLC apply {_x#1};

    private _fnc_isValidSave = {
        if (_this get "map" != worldName) exitWith {false};
        if (!isNil {_this get "ended"}) exitWith {false};
        if (isNil {_this get "factions"}) exitWith {false};
        if (_this get "factions" findIf { !(_x in _validFactions) } != -1) exitWith {false};
        if (_this get "addonVics" findIf { !(_x in _validAddons) } != -1) exitWith {false};
        if (_this get "DLC" findIf { !(_x in _validDLC) } != -1) exitWith {false};             // casing should be correct here
        true;
    };

    private _saveData = call A3A_fnc_collectSaveData;
    private _index = _saveData findIf { _x call _fnc_isValidSave };
    if (_index == -1) exitWith {
        Info("No usable saves found for automatic loading");
        _autoLoadTime = -1;
    };
    _autoLoadData = _saveData select _index;
    _autoLoadData set ["startType", "load"];
    Info_1("Save ID %1 selected for automatic loading", _autoLoadData get "gameID");
    _autoLoadTime = time + _autoLoadTime;
};


// startGame function needs to know setupPlayer for sanity-checking
A3A_setupPlayer = objNull;

private _fnc_validAdmin = {
    admin owner _this == 2 or						// non-voted admin on DS
    {_this isEqualTo player and hasInterface}		// localhost. returns admin owner _this = 0 for some reason
};

private _waitState = ["adminwait", "autostartwait"] select (_autoLoadTime != -1);
A3A_startupState = _waitState; publicVariable "A3A_startupState";

// Setup monitor loop
while {isNil "A3A_saveData"} do {
    sleep 1;

    if (isNull A3A_setupPlayer && {_autoLoadTime != -1 && time > _autoLoadTime}) then {
        [_autoLoadData] call A3A_fnc_startGame;
        _autoLoadTime = -1;
        continue;					// if autoload save wasn't valid then carry on
    };

    if (!isNull A3A_setupPlayer && { !(A3A_setupPlayer getVariable[QGVAR(seenExtenderWarnings), false]) }) then {
        // check that they're still admin?
        if (A3A_setupPlayer call _fnc_validAdmin) then { continue };

        Info_1("Player %1 is no longer admin, disabling their setup dialog", name A3A_setupPlayer);
        A3A_startupState = _waitState; publicVariable "A3A_startupState";

        ["serverClose"] remoteExec ["A3A_fnc_setupDialog", A3A_setupPlayer];
        A3A_setupPlayer = objNull;
    };

    // No-one currently in setup. Go find the admin.
    if (isNull A3A_setupPlayer) then {
        private _players = allPlayers - entities "HeadlessClient_F";
        private _adminIndex = _players findIf { _x call _fnc_validAdmin };
        if (_adminIndex == -1) then { continue };

        A3A_setupPlayer = _players select _adminIndex;
        Info_1("Player %1 is now admin, sending them the save data", name A3A_setupPlayer);
        A3A_startupState = "adminsetup"; publicVariable "A3A_startupState";
    };

    // This is a one-time-use check to allow for a fall-through further up in
    // the code. It must be reset so we a) don't run "sendData" multiple times
    // and b) to allow for the "is the player still an admin" check again.
    A3A_setupPlayer setVariable[QGVAR(seenExtenderWarnings), nil];

    // Collect save data. Do this each time so consistency is maintained with deletes
    _saveData = call A3A_fnc_collectSaveData;
    DebugArray("Save data found:", _saveData);

    // Check if we need to show the extenders warning dialog
    if (isNil QGVAR(showExtendersWarningDialog)) then {
        Info_1("Opening game setup dialog for ""%1""",name A3A_setupPlayer);

        ["sendData", [_saveData, _loadedPatches, _loadedDLC, _platform]] remoteExec ["A3A_fnc_setupDialog", owner A3A_setupPlayer];
    } else {
        Info_1("Opening extender warning dialog for ""%1""",name A3A_setupPlayer);

        missionNamespace setVariable[QGVAR(extendersLoaded), GVAR(extendersLoaded), owner A3A_setupPlayer];
        missionNamespace setVariable[QGVAR(extendersLoadedInvalid), GVAR(extendersLoadedInvalid), owner A3A_setupPlayer];

        [{ [] remoteExec[QFUNCMAIN(setupCheckExtenders), owner A3A_setupPlayer] }] call CBA_fnc_execNextFrame;
    };
};

Info("Setup monitor terminated");

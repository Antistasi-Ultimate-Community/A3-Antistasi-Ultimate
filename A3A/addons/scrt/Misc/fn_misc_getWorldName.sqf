private _cacheName = (_this isEqualTo []);

if (_cacheName && { !isNil("storedWorldName") }) exitWith { storedWorldName };

params[["_worldName", worldName, [""]]];

private _config = configFile >> "CfgWorlds" >> _worldName;

configProperties[_config, "configName _x isEqualTo 'description'", false] params[["_description", _worldName, [configNull]]];

// No description property; fallback to world name
if (_description isEqualType "") then {
    // Strip 20xx
    _description = toLowerANSI _worldName regexReplace["20[0-9]{2}$", ""];
    // Replace dashes, underscores w/ spaces and capitalize first letter of each word
    _description = _description splitString "_-" apply {
        toUpperANSI(_x select [0, 1]) + (_x select [1]);
    } joinString " ";
} else {
    _description = getText _description;
    // Only strip years names from map descriptions like "Malden 2035" or "Chernarus 2020"
    _description = trim _description regexReplace["[ ]*20[0-9]{2}$", ""];
    // Strip season names
    _description = _description regexReplace["[ ]+\(?(?:summer|winter|autumn|spring)\)?$/i", ""];
};

if (_cacheName && { isNil("storedWorldName") }) then {
    storedWorldName = _description;
};

_description;

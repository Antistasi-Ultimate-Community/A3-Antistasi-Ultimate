// Can re-enable if they are reset to the video settings default in initClient
// enableEnvironment false;
// showCinemaBorder false;
// setViewDistance 500;

private _displayName = "RscTitleDisplayEmpty";

#define IDC_HIDDENTEXT 11420919201199 // fun fact: spells antistasi if you assign each latter a number

private _id = ["A3AU_layer" + _displayName] call BIS_fnc_rscLayer;
_id cutRsc [_displayName, "PLAIN", 0, false, true];
private _display = uiNamespace getVariable _displayName;

private _displayImage = _display ctrlCreate ["RscPicture", IDC_HIDDENTEXT];

private _menuImage = menu_framework_image;

if (_menuImage isEqualTo "None") exitWith {
    ctrlDelete _displayImage;
};

if (_menuImage isEqualTo "Random") then {
    private _image = selectRandom [
        "intro_maps", "intro_rebellion", "intro_interaction", "intro_roadblock", "intro_garrison", "intro_victory", "intro_chase", // Modern
        "intro_merc", "intro_clearsky", "intro_zombies", // STALKER/Zombie
        "intro_vanguard", "intro_unsc", "intro_star_clone", "intro_star_empire" // Sci-Fi
    ];
    private _path = getText (configFile >> "A3AU_Images" >> _image >> "path");
    _menuImage = _path;
};

_displayImage ctrlEnable false;
_displayImage ctrlSetPosition [safeZoneX, safezoneY, safeZoneW, safeZoneH];
_displayImage ctrlSetText _menuImage;
_displayImage ctrlCommit 0;

if !([player] call A3U_fnc_isInMenu) exitWith {
    ctrlDelete _displayImage;
};
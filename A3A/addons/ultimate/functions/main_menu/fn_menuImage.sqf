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

if (menu_framework_image isEqualTo "None") exitwith {
    ctrlDelete _displayImage;
};

_displayImage ctrlEnable false;
_displayImage ctrlSetPosition [safeZoneX, safezoneY, safeZoneW, safeZoneH];
_displayImage ctrlSetText menu_framework_image;
_displayImage ctrlCommit 0;

if !([player] call A3U_fnc_isInMenu) exitWith {
    ctrlDelete _displayImage;
};
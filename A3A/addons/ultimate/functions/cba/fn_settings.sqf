[
    "A3U_setting_enableCosmetics", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable Cosmetic Items", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Antistasi Ultimate", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true,
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
		missionNamespace setVariable ["A3U_setting_enableCosmetics",_value,true];
    }
] call CBA_fnc_addSetting;

[
    "A3U_setting_enableAdvancedTowing", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable Advanced Towing", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Antistasi Ultimate", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true,
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
		missionNamespace setVariable ["A3U_setting_enableAdvancedTowing",_value,true];
    }
] call CBA_fnc_addSetting;

// [
//     "A3U_setting_hideEnemyMarkers", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
//     "CHECKBOX", // setting type
//     "Hide Enemy Markers (Takes effect on restart)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
//     "Antistasi Ultimate", // Pretty name of the category where the setting can be found. Can be stringtable entry.
//     true,
//     false, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
//     {  
//         params ["_value"];
// 		missionNamespace setVariable ["A3U_setting_hideEnemyMarkers",_value,true];
//         // hideEnemyMarkers = _value;
//     }
// ] call CBA_fnc_addSetting;

[
    "A3U_setting_tierWarMilitia", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "War Level For Militia", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Antistasi Ultimate", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [2, 7, 3, 0], // lowest, highest, default, idk what the last one does
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
		missionNamespace setVariable ["A3U_setting_tierWarMilitia",(round _value),true];
    }
] call CBA_fnc_addSetting;

[
    "A3U_setting_tierWarElite", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "War Level For Elite", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Antistasi Ultimate", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [2, 10, 8, 0],
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
		missionNamespace setVariable ["A3U_setting_tierWarElite",(round _value),true];
    }
] call CBA_fnc_addSetting;

[
    "A3U_setting_tierWarPunishments", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "War Level For Invader Punishments", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Antistasi Ultimate", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1, 8, 3, 0],
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
		missionNamespace setVariable ["A3U_setting_tierWarPunishments",(round _value),true];
    }
] call CBA_fnc_addSetting;

[
    "A3U_setting_tierWarHRLoss", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "War Level To Trigger HR Loss Condition Check", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Antistasi Ultimate", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1, 8, 2, 0],
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
		missionNamespace setVariable ["A3U_setting_tierWarHRLoss",(round _value),true];
    }
] call CBA_fnc_addSetting;

private _namesOfBlindness = ["Standard Vision","Protanopia","Deuteranopia","Tritanopia"];
private _blindnessColors = [
    "ColorBLUFOR|ColorOPFOR|ColorCIV|ColorGUER|ColorBrown",                                 // Standard
    "ColorBLUFOR|ColorOrange|A3AU_Color_Light_Gray|ColorYellow|A3AU_Color_Dark_Purple",     // Protanopia
    "ColorBLUFOR|ColorOrange|A3AU_Color_Light_Gray|ColorYellow|A3AU_Color_Tan",             // Deuteranopia
    "ColorOrange|ColorOPFOR|A3AU_Color_Light_Gray|ColorGUER|ColorCivilian"                  // Tritanopia
];
[
    "A3AU_setting_colorBlindness",
    "LIST",
    "Color Blindness Settings (Requires Restart!)",
    ["Antistasi Ultimate", "Accessibility Settings"],
    [_blindnessColors, _namesOfBlindness, 0],
    false,
    {  
        params ["_value"];
		missionNamespace setVariable ["A3AU_setting_colorBlindness",_value,true];
        
        private _factionColor = _value splitString "|";
        colorOccupants = _factionColor select 0;
        colorInvaders = _factionColor select 1;
        colorCivilian = _factionColor select 2;
        colorTeamPlayer = _factionColor select 3;
        colorRivals = _factionColor select 4;
    }
] call CBA_fnc_addSetting;

if (["tts_emission"] call A3U_fnc_hasAddon) then {
    [
        "A3U_setting_emissionMinimum", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
        "SLIDER", // setting type
        "Minimum Time Between Emissions", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Antistasi Ultimate - TTS Emission Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
        [0, 60, 30, 0],
        true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
        {  
            params ["_value"];
            missionNamespace setVariable ["A3U_setting_emissionMinimum",round(_value),true];
        }
    ] call CBA_fnc_addSetting;

    [
        "A3U_setting_emissionMaximum", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
        "SLIDER", // setting type
        "Maximum Time Between Emissions", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Antistasi Ultimate - TTS Emission Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
        [0, 180, 60, 0],
        true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
        {  
            params ["_value"];
            missionNamespace setVariable ["A3U_setting_emissionMaximum",round(_value),true];
        }
    ] call CBA_fnc_addSetting;

    [
        "A3U_setting_emissionSpeedMinimum", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
        "SLIDER", // setting type
        "Minimum Emission Speed", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Antistasi Ultimate - TTS Emission Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
        [100, 400, 125, 0],
        true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
        {  
            params ["_value"];
            missionNamespace setVariable ["A3U_setting_emissionSpeedMinimum",round(_value),true];
        }
    ] call CBA_fnc_addSetting;

    [
        "A3U_setting_emissionSpeedMaximum", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
        "SLIDER", // setting type
        "Maximum Emission Speed", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Antistasi Ultimate - TTS Emission Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
        [100, 400, 125, 0],
        true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
        {  
            params ["_value"];
            missionNamespace setVariable ["A3U_setting_emissionSpeedMaximum",round(_value),true];
        }
    ] call CBA_fnc_addSetting;

    #include "fn_emission_settings.sqf"
};

if (["diwako_anomalies_main"] call A3U_fnc_hasAddon) then {
    [
        "A3U_setting_anomalyDraw", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
        "CHECKBOX", // setting type
        "Draw Anomaly Markers", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Antistasi Ultimate - Diwako Anomaly Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
        false,
        true
    ] call CBA_fnc_addSetting;
    [
        "A3U_setting_anomalyAmount", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
        "SLIDER", // setting type
        "Anomaly Population (Lower = More)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Antistasi Ultimate - Diwako Anomaly Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
        [100, 1000, 200, 0],
        true
    ] call CBA_fnc_addSetting;
    [
        "A3U_setting_anomalyCap", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
        "SLIDER", // setting type
        "Anomaly Cap (Higher = Dangerous)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        "Antistasi Ultimate - Diwako Anomaly Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
        [50, 1000, 200, 0],
        true
    ] call CBA_fnc_addSetting;
};
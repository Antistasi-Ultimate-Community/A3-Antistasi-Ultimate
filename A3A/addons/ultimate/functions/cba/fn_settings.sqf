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
    [2, 15, 8, 0],
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

//Unit hr costs
[
    "rifle_hr_cost", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Rifleman HR Cost", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["Antistasi Ultimate", "Unit HR Cost"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1,5,1,0], // [default value], [name for default value], index for default value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        profileNamespace setVariable ["rifle_hr_cost", _value];
    }
] call CBA_fnc_addSetting;

[
    "GL_hr_cost", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Grenadier HR Cost", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["Antistasi Ultimate", "Unit HR Cost"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1,5,1,0], // [default value], [name for default value], index for default value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        profileNamespace setVariable ["GL_hr_cost", _value];
    }
] call CBA_fnc_addSetting;

[
    "EXP_hr_cost", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "ExplosivesExpert HR Cost", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["Antistasi Ultimate", "Unit HR Cost"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1,5,1,0], // [default value], [name for default value], index for default value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        profileNamespace setVariable ["EXP_hr_cost", _value];
    }
] call CBA_fnc_addSetting;

[
    "MG_hr_cost", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "MachineGunner HR Cost", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["Antistasi Ultimate", "Unit HR Cost"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1,5,1,0], // [default value], [name for default value], index for default value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        profileNamespace setVariable ["MG_hr_cost", _value];
    }
] call CBA_fnc_addSetting;

[
    "LAT_hr_cost", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Light Anti-Tank HR Cost", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["Antistasi Ultimate", "Unit HR Cost"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1,5,1,0], // [default value], [name for default value], index for default value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        profileNamespace setVariable ["LAT_hr_cost", _value];
    }
] call CBA_fnc_addSetting;

[
    "AT_hr_cost", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Anti-Tank HR Cost", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["Antistasi Ultimate", "Unit HR Cost"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1,5,1,0], // [default value], [name for default value], index for default value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        profileNamespace setVariable ["AT_hr_cost", _value];
    }
] call CBA_fnc_addSetting;

[
    "AA_hr_cost", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Anti-Air HR Cost", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["Antistasi Ultimate", "Unit HR Cost"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1,5,1,0], // [default value], [name for default value], index for default value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        profileNamespace setVariable ["AA_hr_cost", _value];
    }
] call CBA_fnc_addSetting;

[
    "MED_hr_cost", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Medic HR Cost", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["Antistasi Ultimate", "Unit HR Cost"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1,5,1,0], // [default value], [name for default value], index for default value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        profileNamespace setVariable ["MED_hr_cost", _value];
    }
] call CBA_fnc_addSetting;

[
    "ENG_hr_cost", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Engineer HR Cost", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["Antistasi Ultimate", "Unit HR Cost"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1,5,1,0], // [default value], [name for default value], index for default value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        profileNamespace setVariable ["ENG_hr_cost", _value];
    }
] call CBA_fnc_addSetting;

[
    "Sniper_hr_cost", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Sniper HR Cost", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["Antistasi Ultimate", "Unit HR Cost"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1,5,1,0], // [default value], [name for default value], index for default value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        profileNamespace setVariable ["Sniper_hr_cost", _value];
    }
] call CBA_fnc_addSetting;

[
    "SL_hr_cost", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Squad Leader HR Cost", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["Antistasi Ultimate", "Unit HR Cost"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1,5,1,0], // [default value], [name for default value], index for default value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        profileNamespace setVariable ["SL_hr_cost", _value];
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
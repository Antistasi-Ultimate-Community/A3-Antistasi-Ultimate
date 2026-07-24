    [
        "A3U_setting_emissionPlayerEffect", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
        "LIST", // setting type
        "Player Effect", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        ["[Antistasi Ultimate] - TTS Emission Settings", "Effects"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
        [[0, 1, 3, 4], ["Kill Unsheltered Players", "Knockout Unsheltered Players", "Knockout All Players", "Disabled"], 0],
        true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
        {  
            params ["_value"];
            missionNamespace setVariable ["A3U_setting_emissionPlayerEffect",_value,true];
            tts_emission_playerEffect = _value;
            publicVariable "tts_emission_playerEffect";
        }
    ] call CBA_fnc_addSetting;
    [
        "A3U_setting_emissionAIEffect", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
        "LIST", // setting type
        "AI Effect", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        ["[Antistasi Ultimate] - TTS Emission Settings", "Effects"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
        [[0, 4], ["Kill Unsheltered Units", "Disabled"], 1],
        true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
        {  
            params ["_value"];
            missionNamespace setVariable ["A3U_setting_emissionAIEffect",_value,true];
            tts_emission_aiEffect = _value;
            publicVariable "tts_emission_aiEffect";
        }
    ] call CBA_fnc_addSetting;
    [
        "A3U_setting_emissionVehicleEffect", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
        "LIST", // setting type
        "Vehicle Effect", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        ["[Antistasi Ultimate] - TTS Emission Settings", "Effects"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
        [[0, 1, 2, 3, 4], ["Bolt Vehicle", "Disable Engine", "Bolt Vehicle If Engine On", "Disable Engine", "Disabled"], 2],
        true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
        {  
            params ["_value"];
            missionNamespace setVariable ["A3U_setting_emissionVehicleEffect",_value,true];
            tts_emission_vehicleEffect = _value;
            publicVariable "tts_emission_vehicleEffect";
        }
    ] call CBA_fnc_addSetting;
    [
        "A3U_setting_emissionAircraftEffect", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
        "LIST", // setting type
        "Aircraft Effect", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        ["[Antistasi Ultimate] - TTS Emission Settings", "Effects"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
        [[0, 1, 2], ["Bolt Aircraft", "Disable Aircraft", "Disabled"], 1],
        true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
        {  
            params ["_value"];
            missionNamespace setVariable ["A3U_setting_emissionAircraftEffect",_value,true];
            tts_emission_aircraftEffect = _value;
            publicVariable "tts_emission_aircraftEffect";
        }
    ] call CBA_fnc_addSetting;
    [
        "A3U_setting_emissionShow", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
        "CHECKBOX", // setting type
        "Show Emission Position", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        ["[Antistasi Ultimate] - TTS Emission Settings", "Effects"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
        false,
        true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
        {  
            params ["_value"];
            missionNamespace setVariable ["A3U_setting_emissionShow",_value,true];
            tts_emission_showEmissionOnMap = _value;
            publicVariable "tts_emission_showEmissionOnMap";
        }
    ] call CBA_fnc_addSetting;
    [
        "A3U_setting_emissionRain", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
        "CHECKBOX", // setting type
        "Disable Rain Transition", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
        ["[Antistasi Ultimate] - TTS Emission Settings", "Effects"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
        false,
        true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
        {  
            params ["_value"];
            missionNamespace setVariable ["A3U_setting_emissionRain",_value,true];
            tts_emission_disableRain = _value;
            publicVariable "tts_emission_disableRain";
        }
    ] call CBA_fnc_addSetting;
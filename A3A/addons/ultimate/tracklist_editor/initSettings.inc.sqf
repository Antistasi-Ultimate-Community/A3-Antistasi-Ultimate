// Common
private _settingHeader = ["[Antistasi Ultimate]", "In-game music"]; // This ensures the main menu setting is at the top

[
    QGVAR(showNowPlaying), "CHECKBOX",
    [LSTRING(Settings_showNowPlaying_DisplayName), LSTRING(Settings_showNowPlaying_DisplayName)],
    _settingHeader,
    true, // default
    false, // global
    {}, // onchange
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(pause), "TIME",
    [LSTRING(Settings_pause_DisplayName), LSTRING(Settings_pause_Tooltip)],
    _settingHeader,
    [0, 3600, 90, 0], // min,max,default,decimals
    false, // global
    {}, // onchange
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(volume), "SLIDER",
    [LSTRING(Settings_Volume_DisplayName), LSTRING(Settings_Volume_Tooltip)],
    _settingHeader,
    [0, 5, 0.5, 2], // min,max,default,decimals
    false, // global
    {}, // onchange
    false // Needs mission restart
] call CBA_fnc_addSetting;

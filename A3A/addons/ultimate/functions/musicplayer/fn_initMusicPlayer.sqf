// fn_initMusicPlayer.sqf
/*  
    Author: wersal

    Description:
        Initializes the music/sound player.
        Creates the dialog, restores the state, and populates categories and tracks.

    Params:
        _mode : STRING : operation mode: "music" (default) or "sound"
        _targetObject : OBJECT : target object for sound mode (ignored in music mode)

    Returns:
        Nothing

    License: VPN-DPC
*/

#include "..\..\script_component.hpp"

params [
    ["_mode", "music", [""]],
    ["_targetObject", objNull, [objNull]]
];

// ========== GLOBAL MODE VARIABLES ==========
A3U_playbackMode = _mode;
uiNamespace setVariable ["A3U_soundTarget", _targetObject];

// ========== GLOBAL STATE INITIALIZATION ==========
if (isNil "A3U_playerState") then {
    A3U_playerState = [
        [],     // 0: currentTrack
        false,  // 1: isPlaying
        0,      // 2: trackProgress
        0.5,    // 3: volume
        0,      // 4: trackStartTime
        [],     // 5: currentTrackList
        -1,     // 6: currentTrackIndex
        "",     // 7: currentCategory
        false,  // 8: categoryMode
        false,  // 9: muted
        false,  //10: shuffleEnabled
        false,  //11: loopEnabled
        _mode,  //12: playbackMode
        false,  // 13: loudspeaker
        0       // 14: boostLevel (0-4)
    ];
} else {
    // If state already exists, update its mode (in case of reopening)
    A3U_playerState set [12, _mode];
};

// Save current state before opening the dialog
private _savedState = +A3U_playerState;

// ========== CREATE DIALOG ==========
if (!createDialog "RscDisplayMusicPlayer") exitWith {
    systemChat localize "STR_A3U_error_creating_player";
};

// Restore state
A3U_playerState = _savedState;

// Unpack state with protection against old saves
A3U_currentTrack = A3U_playerState param [0, []];
A3U_isPlaying = A3U_playerState param [1, false];
A3U_trackProgress = A3U_playerState param [2, 0];
A3U_volume = A3U_playerState param [3, 0.5];
A3U_trackStartTime = A3U_playerState param [4, 0];
A3U_currentTrackList = A3U_playerState param [5, []];
A3U_currentTrackIndex = A3U_playerState param [6, -1];
A3U_currentCategory = A3U_playerState param [7, ""];
A3U_categoryMode = A3U_playerState param [8, false];
A3U_muted = A3U_playerState param [9, false];
A3U_shuffleEnabled = A3U_playerState param [10, false];
A3U_loopEnabled = A3U_playerState param [11, false];
A3U_playbackMode = A3U_playerState param [12, _mode];
A3U_loudspeaker = A3U_playerState param [13, false];
A3U_boostLevel = A3U_playerState param [14, 0];

// Additional initializations
if (isNil "A3U_volumeBeforeMute") then { A3U_volumeBeforeMute = A3U_volume; };
if (isNil "A3U_cache_manualMusicCategories") then { call A3U_fnc_musicCache; };

// ========== GET DISPLAY ==========
private _display = findDisplay 85000;
if (isNull _display) exitWith {systemChat localize "STR_A3U_error_display_not_found"};
_display setVariable ["A3U_skipCategoryChange", false];
_display setVariable ["A3U_skipTrackChange", false];

// ========== PREPARE DATA DEPENDING ON MODE ==========
private _categories = [];
private _categoryType = "";

if (A3U_playbackMode == "music") then {
    private _allCategories = A3U_cache_allMusicCategories;

    if (A3U_categoryMode) then {
        _categories = _allCategories - A3U_cache_manualMusicCategories;
        _categoryType = "theme";
    } else {
        _categories = +A3U_cache_manualMusicCategories;
        _categoryType = "addon";
    };
} else {
    // Sound mode
    private _allSoundAddons = A3U_cache_allSoundCategories;

    if (A3U_categoryMode) then {
        // "All categories" mode – show all addons
        _categories = _allSoundAddons;
        _categoryType = "sound_all";
    } else {
        private _nonVanillaAddons = A3U_cache_nonVanillaSoundAddons;
        _categories = +A3U_cache_manualSoundCategories;
        {
            _categories pushBack _x;
        } forEach _nonVanillaAddons;
        _categoryType = "sound_filtered";
    };
};

_display setVariable ["A3U_categoryType", _categoryType];

// ========== GLOBAL MUSIC EVENT HANDLERS ==========
if (A3U_playbackMode == "music" && isNil "A3U_musicHandlersInitialized") then {
    if (!isNil "A3U_musicStartEH") then { removeMusicEventHandler ["MusicStart", A3U_musicStartEH]; };
    if (!isNil "A3U_musicStopEH") then { removeMusicEventHandler ["MusicStop", A3U_musicStopEH]; };

    A3U_musicStartEH = addMusicEventHandler ["MusicStart", {
        params ["_musicClass", "_ehID", "_currentPosition", "_totalLength"];
        A3U_isPlaying = true;
    }];

    A3U_musicStopEH = addMusicEventHandler ["MusicStop", {
        params ["_musicClass", "_ehID", "_currentPosition", "_totalLength"];
        A3U_trackProgress = _currentPosition;
        A3U_isPlaying = false;

        if (_currentPosition >= 0.99) then {
            if (A3U_loopEnabled) then {
                if (count A3U_currentTrack > 0) then {
                    A3U_trackProgress = 0;
                    playMusic (A3U_currentTrack#1);
                    A3U_trackStartTime = diag_tickTime;
                    A3U_isPlaying = true;
                };
            } else {
                [] call A3U_fnc_nextTrack;
                if (count A3U_currentTrack > 0) then {
                    [] call A3U_fnc_playTrack;
                };
            };
        };
    }];

    A3U_musicHandlersInitialized = true;
};

// ========== FILL CATEGORY LIST ==========
private _categoriesList = _display displayCtrl 85101;
lbClear _categoriesList;

private _fnc_capitalize = {
    params ["_str"];
    if (_str == "") exitWith {""};
    toUpper (_str select [0,1]) + toLower (_str select [1])
};

{
    private _displayName = if (_x == "unknown") then { localize "STR_A3U_unknown_category" } else { [_x] call _fnc_capitalize };
    private _idx = _categoriesList lbAdd _displayName;
    _categoriesList lbSetData [_idx, _x];
} forEach _categories;

// ========== DETERMINE CATEGORY TO RESTORE ==========
private _targetCategory = "";
private _targetCategoryFound = false;

if (A3U_currentCategory != "" && {A3U_currentCategory in _categories}) then {
    _targetCategory = A3U_currentCategory;
    _targetCategoryFound = true;
};

if (!_targetCategoryFound && count _categories > 0) then {
    _targetCategory = _categories select 0;
};

private _selectedCategoryIndex = _categories find _targetCategory;
if (_selectedCategoryIndex == -1) then { _selectedCategoryIndex = 0; };
_display setVariable ["A3U_skipCategoryChange", true];
_categoriesList lbSetCurSel _selectedCategoryIndex;
A3U_currentCategory = _targetCategory;

// ========== GET ITEMS FOR SELECTED CATEGORY ==========
private _items = [];

if (A3U_playbackMode == "music") then {
    if (_targetCategory in A3U_cache_manualMusicCategories) then {
        private _cacheName = format ["A3U_cache_%1Tracks", _targetCategory];
        _items = missionNamespace getVariable [_cacheName, []];
    } else {
        if (_categoryType == "addon") then {
            _items = A3U_cache_tracksByAddon getOrDefault [_targetCategory, []];
        } else {
            _items = A3U_cache_tracksByCategory getOrDefault [_targetCategory, []];
        };
    };
} else {
    if (_targetCategory in A3U_cache_manualSoundCategories) then {
        private _cacheName = format ["A3U_cache_%1Sounds", _targetCategory];
        _items = missionNamespace getVariable [_cacheName, []];
    } else {
        _items = A3U_cache_soundsByCategory getOrDefault [_targetCategory, []];
    };
};

// ========== FILL ITEMS LIST ==========
private _tracksList = _display displayCtrl 85102;
lbClear _tracksList;

private _selectedItemIndex = 0;
if (count _items > 0) then {
    {
        _x params ["_name", "_class"];
        private _idx = _tracksList lbAdd _name;
        _tracksList lbSetData [_idx, _class];
    } forEach _items;

    // Determine index of saved element
    if (count A3U_currentTrack > 0) then {
        private _savedClass = A3U_currentTrack#1;
        private _foundIndex = _items findIf { _x#1 == _savedClass };
        if (_foundIndex != -1) then { _selectedItemIndex = _foundIndex; };
    };

    // Set selection with event blocking
    _display setVariable ["A3U_skipTrackChange", true];
    _tracksList lbSetCurSel _selectedItemIndex;
    _display setVariable ["A3U_skipTrackChange", false];

    // Update global variables
    A3U_currentTrackList = _items;
    A3U_currentTrackIndex = _selectedItemIndex;
    A3U_currentTrack = _items select _selectedItemIndex;
} else {
    _tracksList lbAdd localize "STR_A3U_category_empty";
    A3U_currentTrackList = [];
    A3U_currentTrackIndex = -1;
    A3U_currentTrack = [];
};

// After everything is done, reset category flag
_display setVariable ["A3U_skipCategoryChange", false];

// ========== MANAGE TWO PROGRESS BARS ==========
private _musicProgress = _display displayCtrl 85106; // slider for music
private _soundProgress = _display displayCtrl 85117; // progress bar for sounds

if (A3U_playbackMode == "music") then {
    _musicProgress ctrlShow true;
    _soundProgress ctrlShow false;
} else {
    _musicProgress ctrlShow false;
    _soundProgress ctrlShow true;
};

// ========== VOLUME AND MUTE SETUP ==========
private _volumeSlider = _display displayCtrl 85107;
_volumeSlider sliderSetRange [0, 1];
_volumeSlider sliderSetPosition A3U_volume;

private _volOn = _display displayCtrl 85108;
private _volOff = _display displayCtrl 85109;

if (A3U_muted) then {
    _volOn ctrlShow false;
    _volOff ctrlShow true;
    _volOff ctrlSetTooltip localize "STR_A3U_mute_on";
    _volumeSlider sliderSetPosition 0;
    if (A3U_playbackMode == "music") then { 0 fadeMusic 0; };
} else {
    _volOn ctrlShow true;
    _volOff ctrlShow false;
    _volOn ctrlSetTooltip localize "STR_A3U_mute_off";
    _volumeSlider sliderSetPosition A3U_volume;
    if (A3U_playbackMode == "music") then { 0.5 fadeMusic A3U_volume; };
};

// In sound mode completely hide mute buttons
if (A3U_playbackMode == "sound") then {
    _volOn ctrlShow false;
    _volOff ctrlShow false;
};

// ========== INTERACTIVE PROGRESS SLIDER (MUSIC ONLY) ==========
if (A3U_playbackMode == "music") then {
    _display setVariable ["isDragging", false];
    _display setVariable ["wasPlaying", false];

    _musicProgress ctrlAddEventHandler ["MouseMoving", {
        params ["_ctrl", "_xPos", "_yPos"];
        private _disp = ctrlParent _ctrl;
        if (!(_disp getVariable ["isDragging", false]) || {count A3U_currentTrack == 0}) exitWith {};
        private _newPos = sliderPosition _ctrl;
        A3U_trackProgress = _newPos;
    }];

    _musicProgress ctrlAddEventHandler ["MouseButtonDown", {
        params ["_ctrl", "_button", "_xPos", "_yPos"];
        private _disp = ctrlParent _ctrl;
        if (_button != 0 || {count A3U_currentTrack == 0}) exitWith {};
        _disp setVariable ["wasPlaying", A3U_isPlaying];
        if (A3U_isPlaying) then {
            playMusic "";
            A3U_isPlaying = false;
        };
        _disp setVariable ["isDragging", true];
    }];

    _musicProgress ctrlAddEventHandler ["MouseButtonUp", {
        params ["_ctrl", "_button"];
        private _disp = ctrlParent _ctrl;
        if (_button != 0 || {count A3U_currentTrack == 0}) exitWith {};
        private _wasPlaying = _disp getVariable ["wasPlaying", false];
        _disp setVariable ["isDragging", false];
        private _newPos = sliderPosition _ctrl;
        if (abs(_newPos - A3U_trackProgress) < 0.001) exitWith {};
        A3U_trackProgress = _newPos;
        if (_wasPlaying) then {
            private _trackClass = A3U_currentTrack#1;
            private _config = configFile >> "CfgMusic" >> _trackClass;
            private _totalDuration = getNumber (_config >> "duration");
            if (_totalDuration > 0) then {
                private _startTime = _newPos * _totalDuration;
                A3U_trackStartTime = diag_tickTime - _startTime;
                playMusic [_trackClass, _startTime];
                A3U_isPlaying = true;
                if (A3U_muted) then { 0 fadeMusic 0; } else { 0.5 fadeMusic A3U_volume; };
            };
        };
    }];

    A3U_sliderEH = _musicProgress ctrlAddEventHandler ["SliderPosChanged", {
        params ["_ctrl", "_newPos"];
        private _disp = ctrlParent _ctrl;
        if (_disp getVariable ["isDragging", false]) exitWith {};
        if (count A3U_currentTrack == 0) exitWith {};
        if (abs(_newPos - A3U_trackProgress) < 0.001) exitWith {};
        A3U_trackProgress = _newPos;
        if (A3U_isPlaying) then {
            private _trackClass = A3U_currentTrack#1;
            private _config = configFile >> "CfgMusic" >> _trackClass;
            private _totalDuration = getNumber (_config >> "duration");
            if (_totalDuration > 0) then {
                private _startTime = _newPos * _totalDuration;
                A3U_trackStartTime = diag_tickTime - _startTime;
                playMusic [_trackClass, _startTime];
                if (A3U_muted) then { 0 fadeMusic 0; } else { 0.5 fadeMusic A3U_volume; };
            };
        };
    }];
};

// ========== CONTROL BUTTONS INITIALIZATION ==========
// Repeat button
private _loopBtn = _display displayCtrl 85113;
if (!isNull _loopBtn) then {
    if (A3U_loopEnabled) then {
        _loopBtn ctrlSetBackgroundColor [0.95,0.95,0.95,1];
        _loopBtn ctrlSetTooltip localize "STR_A3U_loop_off_tooltip";
    } else {
        _loopBtn ctrlSetBackgroundColor [1,1,1,1];
        _loopBtn ctrlSetTooltip localize "STR_A3U_loop_on_tooltip";
    };
};

// Shuffle button
private _shuffleBtn = _display displayCtrl 85114;
if (!isNull _shuffleBtn) then {
    if (A3U_shuffleEnabled) then {
        _shuffleBtn ctrlSetBackgroundColor [0.2,0.6,0.2,1];
        _shuffleBtn ctrlSetTooltip localize "STR_A3U_shuffle_on_tooltip";
    } else {
        _shuffleBtn ctrlSetBackgroundColor [0.2,0.2,0.2,1];
        _shuffleBtn ctrlSetTooltip localize "STR_A3U_shuffle_off_tooltip";
    };
};

// Category mode toggle button
private _categoryModeBtn = _display displayCtrl 85116;
if (!isNull _categoryModeBtn) then {
    if (A3U_categoryMode) then {
        _categoryModeBtn ctrlSetBackgroundColor [0.2,0.6,0.2,1];
        _categoryModeBtn ctrlSetTooltip localize "STR_A3U_category_mode_fav";
    } else {
        _categoryModeBtn ctrlSetBackgroundColor [1,1,1,1];
        _categoryModeBtn ctrlSetTooltip localize "STR_A3U_category_mode_all";
    };
};

// ========== DEBUG PANEL ==========
A3U_debugVisible = false;
private _debugBg = _display displayCtrl 85120;
private _debugText = _display displayCtrl 85121;
private _debugBtn = _display displayCtrl 85122;
private _debugCopyBtn = _display displayCtrl 85123;

private _showDebug = (call BIS_fnc_admin > 0) || (!isMultiplayer);
if (_showDebug) then {
    _debugBtn ctrlShow true;
    _debugBg ctrlShow false;
    _debugText ctrlShow false;
    _debugCopyBtn ctrlShow false;
} else {
    _debugBtn ctrlShow false;
    _debugBg ctrlShow false;
    _debugText ctrlShow false;
    _debugCopyBtn ctrlShow false;
};

// ========== LOUDSPEAKER BUTTON ==========
private _loudBtn = _display displayCtrl 85118;
if (!isNull _loudBtn) then {
    if (A3U_loudspeaker) then {
        _loudBtn ctrlSetBackgroundColor [0.2,0.6,0.2,1];
        _loudBtn ctrlSetTooltip localize "STR_A3U_loudspeaker_on";
    } else {
        _loudBtn ctrlSetBackgroundColor [1,1,1,1];
        _loudBtn ctrlSetTooltip localize "STR_A3U_loudspeaker_off";
    };
    if (A3U_playbackMode != "sound") then { _loudBtn ctrlShow false; };
};

// ========== BOOST SLIDER ==========
private _boostSlider = _display displayCtrl 85119;
if (!isNull _boostSlider) then {
    _boostSlider sliderSetRange [0, 4];
    _boostSlider sliderSetPosition A3U_boostLevel;
    _boostSlider sliderSetSpeed [1, 1];
    private _dbValues = [0,2,3,4,5];
    _boostSlider ctrlSetTooltip format [localize "STR_A3U_boost_tooltip_short", _dbValues select A3U_boostLevel];
};

// ========== SOUND CATEGORIES DEBUG ==========
if (A3U_playbackMode == "sound") then {
    {
        private _cat = _x;
        private _sounds = A3U_cache_soundsByCategory getOrDefault [_cat, []];
        private _count = count _sounds;
        private _sample = [];
        for "_i" from 0 to ((_count - 1) min 5) do {
            _sample pushBack (_sounds select _i select 0);
        };
    } forEach _categories;
};

// ========== UNLOAD EVENT HANDLER ==========
_display displayAddEventHandler ["Unload", {
    if (A3U_currentTrack isEqualTo []) exitWith {};
    private _currentPos = 0;
    private _duration = 0;
    if (A3U_playbackMode == "music") then {
        if (A3U_isPlaying) then {
            _currentPos = getMusicPlayedTime;
        } else {
            _currentPos = A3U_trackProgress * (getNumber (configFile >> "CfgMusic" >> (A3U_currentTrack#1) >> "duration"));
        };
        _duration = getNumber (configFile >> "CfgMusic" >> (A3U_currentTrack#1) >> "duration");
    } else {
        _currentPos = A3U_trackProgress;
        _duration = getNumber (configFile >> "CfgSounds" >> (A3U_currentTrack#1) >> "duration");
    };
    A3U_playerState = [
        A3U_currentTrack,
        A3U_isPlaying,
        if (_duration > 0) then { _currentPos / _duration } else { 0 },
        A3U_volume,
        A3U_trackStartTime,
        A3U_currentTrackList,
        A3U_currentTrackIndex,
        A3U_currentCategory,
        A3U_categoryMode,
        A3U_muted,
        A3U_shuffleEnabled,
        A3U_loopEnabled,
        A3U_playbackMode,
        A3U_loudspeaker,
        A3U_boostLevel
    ];
}];

// ========== START PROGRESS MONITOR ==========
terminate (missionNamespace getVariable ["A3U_progressMonitorScript", scriptNull]);
A3U_progressMonitorScript = [] spawn A3U_fnc_trackProgressMonitor;

// ========== UPDATE INTERFACE ==========
[] call A3U_fnc_updatePlayButton;
[] call A3U_fnc_updateTrackInfo;

// ========== SYNCHRONIZE WITH CURRENT PLAYBACK ==========
if (A3U_playbackMode == "music" && A3U_isPlaying && {count A3U_currentTrack > 0}) then {
    private _trackClass = A3U_currentTrack#1;
    private _config = configFile >> "CfgMusic" >> _trackClass;
    private _totalDuration = getNumber (_config >> "duration");
    if (_totalDuration > 0) then {
        private _currentPos = getMusicPlayedTime;
        A3U_trackProgress = (_currentPos / _totalDuration) min 1;
        A3U_trackStartTime = diag_tickTime - _currentPos;
    };
};

systemChat format [localize "STR_A3U_player_initialized", A3U_playbackMode];
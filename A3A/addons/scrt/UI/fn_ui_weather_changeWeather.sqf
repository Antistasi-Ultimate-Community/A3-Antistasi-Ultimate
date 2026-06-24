/*
    Author: wersal
    Description:
        Weather management loop. Runs continuously on the server, checking every 5 minutes
        whether it's time to change weather based on A3A_weatherInterval.
        Changes weather according to selected level (LOW, MEDIUM, HIGH, RANDOM) and map climate.
        Applies overcast, fog, rain/snow, wind, waves, lightning, humidity and rainbow.
        Snow probability depends on climate, time of day and weather level.

    Parameters:
        None (uses missionNamespace variables)

    Returns:
        Nothing (infinite loop)
*/

#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!isServer) exitWith {};

// Infinite loop for weather checks and updates
while {true} do {
    // Get current weather change interval (in hours)
    private _weatherInterval = missionNamespace getVariable ["A3A_weatherInterval", 3];
    
    // If interval > 0, check if it's time to change weather
    if (_weatherInterval > 0) then {
        // Get time of last change. If variable doesn't exist, initialize with current time and save.
        private _lastChange = server getVariable "A3A_lastWeatherChange";
        if (isNil "_lastChange") then {
            _lastChange = time;
            server setVariable ["A3A_lastWeatherChange", _lastChange, true];
        };
        
        if (time - _lastChange >= _weatherInterval * 3600) then {
            // --- TIME TO CHANGE WEATHER ---
            
            private _weatherLevel = missionNamespace getVariable ["A3A_weatherLevel", "LOW"];
            private _climate = missionNamespace getVariable ["A3A_climate", "temperate"];
            private _isNight = sunOrMoon < 1;
            private _isDay = !_isNight;

            // Climate modifiers
            private _climateMod = switch (_climate) do {
                case "tropical": {
                    [1.5, 1.3, 0.8, 1.2, 0.7, 0.05]  // 5% snow chance
                };
                case "arid": {
                    [0.4, 0.2, 0.6, 0.3, 1.5, 0.1]    // 10% snow chance (rare, but possible in mountains)
                };
                case "arctic": {
                    [0.7, 1.2, 1.3, 1.8, 1.2, 0.9]    // 90% snow chance (rain also possible)
                };
                default { // temperate
                    [1.0, 1.0, 1.0, 1.0, 1.0, 0.3]    // 30% snow chance
                };
            };

            _climateMod params ["_humidityMul", "_rainChanceMul", "_overcastMul", "_fogChanceMul", "_windMul", "_snowProbability"];

            // Result variables
            private _overcast = 0;
            private _fogValue = 0;
            private _fogDecay = 0.01;
            private _fogBase = 0;
            private _rain = 0;
            private _windStr = 0;
            private _gusts = 0;
            private _waves = 0;
            private _lightningsDensity = 0;
            private _humidity = 0.5;
            private _rainbow = 0;

            // Helper function to pick a random value in a range
            private _fnc_randomRange = {
                params ["_min", "_max"];
                _min + random (_max - _min);
            };

            switch (_weatherLevel) do {
                case "LOW": {
                    _overcast = [0, 0.5 * _overcastMul] call _fnc_randomRange;
                    _humidity = (0.3 + _overcast * 0.5) * _humidityMul;
                    if (_isNight) then { _humidity = _humidity + 0.2 };
                    _humidity = _humidity min 0.9;

                    // Fog for LOW
                    if (_humidity > 0.6 && random 1 < (0.3 + (_isNight * 0.3)) * _fogChanceMul) then {
                        _fogValue = [0.1, 0.3] call _fnc_randomRange;
                        // Fog type for LOW

                        if (_isNight && {random 1 < 0.5}) then {
                            _fogDecay = 1;
                            _fogBase = 1 + random 30;
                        };
                    } else {
                        _fogValue = [0, 0.1] call _fnc_randomRange;
                    };

                    // Rain possible only when overcast >= 0.5 (A3 limitation)
                    if (_overcast >= 0.5 && random 1 < _overcast * _rainChanceMul) then {
                        _rain = [0, 0.3] call _fnc_randomRange;
                    };

                    _windStr = [0, 3 * _windMul] call _fnc_randomRange;
                    _gusts = _windStr + ([0, 2] call _fnc_randomRange);
                    _waves = _windStr / random 10;

                    if (_rain > 0.1 && _overcast > 0.6 && random 1 < 0.1) then {
                        _lightningsDensity = [0, 0.2] call _fnc_randomRange;
                    };

                    if (_isDay && _rain > 0.1 && _overcast < 0.8 && random 1 < 0.3) then {
                        _rainbow = [0.3, 0.7] call _fnc_randomRange;
                    };
                };

                case "MEDIUM": {
                    _overcast = [0.2, 0.8 * _overcastMul] call _fnc_randomRange;
                    _humidity = (0.4 + _overcast * 0.5) * _humidityMul;
                    if (_isNight) then { _humidity = _humidity + 0.15 };
                    _humidity = _humidity min 1.0;

                    // Fog for MEDIUM
                    if (_humidity > 0.5 && random 1 < (0.4 + (_isNight * 0.3)) * _fogChanceMul) then {
                        _fogValue = [0.2, 0.5] call _fnc_randomRange;
                        // More likely valley fog at night
                        if (_isNight && {random 1 < 0.6}) then {
                            _fogDecay = 1;
                            _fogBase = 1 + random 35;
                        };
                        // Mountain fog sometimes in mountains
                        if (_climate in ["arctic", "temperate"] && {random 1 < 0.4}) then {
                            _fogDecay = -1;
                            _fogBase = 20 + random 70;
                        };
                    } else {
                        _fogValue = [0, 0.2] call _fnc_randomRange;
                    };

                    if (_overcast >= 0.5 && random 1 < _overcast * _rainChanceMul) then {
                        _rain = [0, 0.7] call _fnc_randomRange;
                    };

                    _windStr = [2, 7 * _windMul] call _fnc_randomRange;
                    _gusts = _windStr + ([0, 5] call _fnc_randomRange);
                    _waves = _windStr / random 8;

                    if (_rain > 0.2 && _overcast > 0.7 && random 1 < 0.3) then {
                        _lightningsDensity = [0.2, 0.6] call _fnc_randomRange;
                    };

                    if (_isDay && _rain > 0.15 && _overcast < 0.9 && random 1 < 0.4) then {
                        _rainbow = [0.4, 0.9] call _fnc_randomRange;
                    };
                };

                case "HIGH": {
                    // New HIGH – stronger but still realistic (like MEDIUM with higher maximums)
                    _overcast = [0.4, 1.0 * _overcastMul] call _fnc_randomRange;
                    _humidity = (0.5 + _overcast * 0.5) * _humidityMul;
                    if (_isNight) then { _humidity = _humidity + 0.1 };
                    _humidity = _humidity min 1.0;

                    // Fog for HIGH
                    if (_humidity > 0.5 && random 1 < (0.5 + (_isNight * 0.3)) * _fogChanceMul) then {
                        _fogValue = [0.3, 0.7] call _fnc_randomRange;
                        // Higher probability for special fog types
                        if (_isNight && {random 1 < 0.7}) then {
                            _fogDecay = 1;
                            _fogBase = 1 + random 40;
                        };
                        if (_climate == "tropical" && {random 1 < 0.5}) then {
                            _fogDecay = 1;
                        };
                        if (_climate in ["arctic", "temperate"] && {random 1 < 0.6}) then {
                            _fogDecay = -1;
                            _fogBase = 20 + random 80;
                        };
                    } else {
                        _fogValue = [0, 0.3] call _fnc_randomRange;
                    };

                    if (_overcast >= 0.5 && random 1 < _overcast * _rainChanceMul) then {
                        _rain = [0.2, 1.0] call _fnc_randomRange;
                    };

                    _windStr = [4, 12 * _windMul] call _fnc_randomRange;
                    _gusts = _windStr + ([0, 8] call _fnc_randomRange);
                    _waves = _windStr / random 7;

                    if (_rain > 0.2 && _overcast > 0.7 && random 1 < 0.4) then {
                        _lightningsDensity = [0.3, 0.8] call _fnc_randomRange;
                    };

                    if (_isDay && _rain > 0.2 && _overcast < 0.9 && random 1 < 0.5) then {
                        _rainbow = [0.5, 1.0] call _fnc_randomRange;
                    };
                };

                case "RANDOM": {
                    // Former HIGH – chaotic weather with weaker relationships
                    _overcast = [0, 1.0 * _overcastMul] call _fnc_randomRange;
                    _humidity = (0.3 + ([0, 0.7] call _fnc_randomRange)) * _humidityMul;
                    if (_isNight) then { _humidity = _humidity + 0.1 };
                    _humidity = _humidity min 1.0;

                    // Fog for RANDOM – maximum variety
                    _fogValue = [0, 0.9 * _fogChanceMul] call _fnc_randomRange;
                    if (_isNight && random 1 < 0.5) then { _fogValue = _fogValue + 0.2 };
                    _fogValue = _fogValue min 1.0;

                    if (_fogValue > 0.1) then {
                        private _rnd = random 1;
                        if (_rnd < 0.33) then {
                            _fogDecay = 1;      // valley fog
                            _fogBase = 1 + random 50;
                        } else {
                            if (_rnd < 0.66) then {
                                _fogDecay = -1; // mountain fog
                                _fogBase = 5 + random 100;
                            };
                        };
                    };

                    // Rain possible even with overcast < 0.5 (exception)
                    if (random 1 < _rainChanceMul) then {
                        _rain = [0, 1.0] call _fnc_randomRange;
                        if (_overcast < 0.5 && _rain > 0.5) then { _rain = _rain * 0.5 };
                    };

                    _windStr = [0, 15 * _windMul] call _fnc_randomRange;
                    _gusts = _windStr + ([0, 10] call _fnc_randomRange);
                    _waves = _windStr / random 6;

                    _lightningsDensity = [0, 0.8] call _fnc_randomRange;
                    if (_rain < 0.2) then { _lightningsDensity = _lightningsDensity * 0.3 };

                    if (_rain > 0.2 && _overcast < 0.9 && random 1 < 0.5) then {
                        _rainbow = [0, 0.8] call _fnc_randomRange;
                    };
                };
            };

            // Clamping
            _overcast = _overcast max 0 min 1;
            _fogValue = _fogValue max 0 min 1;
            _rain = _rain max 0 min 1;
            _windStr = _windStr max 0;
            _gusts = _gusts max 0;
            _waves = _waves max 0 min 1;
            _lightningsDensity = _lightningsDensity max 0 min 1;
            _humidity = _humidity max 0 min 1;
            _rainbow = _rainbow max 0 min 1;

            // Apply general parameters with smooth transitions
            private _transitionTime = 30 + random 60;  // base transition time 30-90 seconds

            [_transitionTime, _overcast] remoteExec ["setOvercast", 0];

            // Apply fog with smooth transition
            [_transitionTime, [_fogValue, _fogDecay, _fogBase]] remoteExec ["setFog", 0];

            // --- RAIN / SNOW SETUP ---
            // Determine if precipitation should be snow
            private _isSnow = false;
            if (_rain > 0.01) then {
                private _snowChance = _snowProbability;
                // Modifiers: snow more likely at night and on RANDOM level
                if (_weatherLevel == "RANDOM") then { _snowChance = 0.5 };
                if (_isNight) then { _snowChance = _snowChance + 0.1 };
                _isSnow = random 1 < _snowChance;
            };

            // Set precipitation intensity with smooth transition
            if (_rain > 0 && _overcast >= 0.5) then {
                (_transitionTime * 0.7) setRain _rain;  // slightly faster for rain
            } else {
                if (_weatherLevel != "RANDOM" || _overcast < 0.5) then {
                    _rain = 0;
                };
                (_transitionTime * 0.5) setRain 0;
            };

            // Rain/snow particle parameters (applied instantly, no transition time)
            private _rainParams = [];
            if (_rain > 0.01) then {
                private _dropTexture = "";
                private _dropColor = [1,1,1,0.6];
                private _dropSpeed = 2.5;
                private _dropWidth = 0.07;
                private _dropHeight = 0.07;
                private _windCoef = 0.05;

                if (_isSnow) then {
                    _dropTexture = "a3\data_f\snowflake4_ca.paa";
                    _dropColor = [1,1,1,0.8];
                    _dropSpeed = 1.2;
                    _dropWidth = 0.1;
                    _dropHeight = 0.1;
                    _windCoef = 0.1;
                } else {
                    _dropTexture = "";  // default raindrops
                };

                _rainParams = [
                    _dropTexture,
                    4,
                    _rain * 0.5,
                    25,
                    _windCoef,
                    _dropSpeed,
                    0.5,
                    0.5,
                    _dropWidth,
                    _dropHeight,
                    _dropColor,
                    0.0,
                    0.2,
                    0.5,
                    0.5,
                    _isSnow,
                    false
                ];
            };

            // Apply rain particle params instantly (BIS_fnc_setRain handles its own timing)
            _rainParams remoteExecCall ["BIS_fnc_setRain", 0];

            // --- WIND ---
            private _windDir = random 360;
            private _windX = _windStr * sin _windDir;
            private _windY = _windStr * cos _windDir;

            // setWind: instant, no transition time
            [_windX, _windY] remoteExec ["setWind", 0];

            // setGusts: smooth transition
            [_transitionTime, _gusts min 1] remoteExec ["setGusts", 0];

            // setWindStr: smooth transition (range 0..1)
            [_transitionTime * 1.2, _windStr min 1] remoteExec ["setWindStr", 0];

            // setWindForce: smooth transition (no upper limit)
            [_transitionTime * 1.5, _windStr] remoteExec ["setWindForce", 0];  // wind force changes slower

            // setWindDir: instant (direction change doesn't need smoothness)
            [0, _windDir] remoteExec ["setWindDir", 0];

            // setLocalWindParams: instant
            [
                _windStr,                           // strength
                random 10 + (_windStr * 2)          // diameter (meters)
            ] remoteExec ["setLocalWindParams", 0];

            // Waves: smooth transition
            [_transitionTime * 1.2, _waves] remoteExec ["setWaves", 0];

            // Lightning: smooth transition
            [_transitionTime, _lightningsDensity] remoteExec ["setLightnings", 0];

            // Humidity: instant (no transition time parameter)
            _humidity remoteExec ["setHumidity", 0];

            // Rainbow: smooth transition
            [_transitionTime * 0.8, _rainbow] remoteExec ["setRainbow", 0];

            // Optional: disable ambient life during heavy snow/rain
            /* if (_rain > 0.7) then {
                enableEnvironment [false, true] remoteExec ["enableEnvironment", 0];
            } else {
                enableEnvironment [true, true] remoteExec ["enableEnvironment", 0];
            }; */ //need an opinion on that

            forceWeatherChange; // probably don't need that

            // JIP sync trick (not required, but sometimes helps)
            /* if (isMultiplayer) then {
                [] remoteExec ["skipTime", 0, true]; // remoteExec with target 0 and JIP true? Better not.
                // skipTime trick may cause time desync, leave as is.
            }; */

            // Additional simulWeather sync possible (advanced cloud layers)
            // setSimulWeatherLayers and simulWeatherSync are used to control cloud layers,
            // but require careful configuration. Omitted for now.

            // Update last weather change time
            server setVariable ["A3A_lastWeatherChange", time, true];

            // --- DIAGNOSTIC MESSAGES ---
            private _msg = format ["Weather changed: Level=%1, Climate=%2, Overcast=%3, Fog=%4, Rain=%5, Snow=%6, Wind=%7, Waves=%8, Lightning=%9, Humidity=%10, Rainbow=%11",
                _weatherLevel, _climate, _overcast toFixed 2, _fogValue toFixed 2, _rain toFixed 2, _isSnow, _windStr toFixed 1, _waves toFixed 2, _lightningsDensity toFixed 2, _humidity toFixed 2, _rainbow toFixed 2];
            diag_log _msg;
            systemChat _msg;
        } else {
            // Not time yet
            private _timeLeft = (_weatherInterval * 3600) - (time - _lastChange);
            private _msg = format ["Weather change in %1 seconds (interval %2 hours)", _timeLeft toFixed 0, _weatherInterval];
            diag_log _msg;
            systemChat _msg;
        };
    } else {
        // Interval is 0 – automatic weather change disabled
        diag_log "Weather change disabled (interval = 0)";
        systemChat "Weather change disabled (interval = 0)";
    };

    // Wait 5 minutes before next check (for debugging; change to 300 for release)
    sleep 300;
};
// fn_petrosParty.sqf
params ["_petros"];
if (!local _petros) exitWith {};

// Wait for party time
waitUntil {
    sleep 10;
    (daytime >= 21.0 || daytime < 2.0)
};

// If party is already active, do not start a second instance
if (!isNil {_petros getVariable "A3A_Petros_partyActive"}) exitWith {};
_petros setVariable ["A3A_Petros_partyActive", true, true];

private _nearPlayers = allPlayers select { (_x distance _petros) < 50 && alive _x };
if (count _nearPlayers > 0) then {
    private _owners = _nearPlayers apply { owner _x };
    private _message = format ["Petros :)  %1", localize "STR_A3U_Petros_party_start"];
    [_message] remoteExec ["systemChat", _owners];
};

sleep 5;

// HELPER FUNCTIONS
private _stopCurrentSound = {
    private _soundObj = _petros getVariable ["A3A_Petros_currentSoundObj", objNull];
    if (!isNull _soundObj) then {
        deleteVehicle _soundObj;
        _petros setVariable ["A3A_Petros_currentSoundObj", nil, true];
    };
};

// Start a new track via say3D
private _playNextTrack = {
    call _stopCurrentSound;

    private _tracks = ["Track_D_01", "Track_D_02", "Track_D_03"];
    private _durations = [250, 388, 251]; // in seconds
    private _currentTrack = _petros getVariable ["A3A_Petros_currentTrack", ""];
    private _available = +_tracks;
    if (_currentTrack != "") then {
        _available = _available - [_currentTrack]; // avoid playing the same track twice in a row
    };
    if (count _available == 0) then { _available = +_tracks; };
    private _newTrack = selectRandom _available;
    _petros setVariable ["A3A_Petros_currentTrack", _newTrack, true];
    private _duration = _durations select (_tracks find _newTrack);
    _petros setVariable ["A3A_Petros_trackEndTime", time + _duration, true];

    private _soundSource = createVehicle ["Land_Can_V1_F", getPosASL _petros, [], 0, "CAN_COLLIDE"];
    _soundSource attachTo [_petros, [0, 0, -0.2]];

    [_soundSource, [_newTrack, 300, 1, 0, 0, true]] remoteExec ["say3D", 0];
    _petros setVariable ["A3A_Petros_currentSoundObj", _soundSource];
};

// LIGHT SETUP
private _whiteOffset = [0, 0, 4];
private _colorOffsets = [[2,0,3],[-1,2,3],[-1,-2,3]];
private _colorColors = [[1,0,0],[0,1,0],[0,0,1]];

private _lights = [];

// Create lights globally
private _whiteLight = "#lightpoint" createVehicle [0,0,0];
_lights pushBack _whiteLight;

{
    private _light = "#lightpoint" createVehicle [0,0,0];
    _lights pushBack _light;
} forEach _colorColors;

// Save lights variable globally for access if needed, but mainly we pass them to remoteExec
_petros setVariable ["A3A_Petros_partyLights", _lights, true];

// Setup lights LOCALLY on all clients
[[_lights, _colorColors], {
    params ["_lights", "_colorColors"];
    private _whiteLight = _lights select 0;
    _whiteLight setLightBrightness 0;
    _whiteLight setLightAmbient [1,1,1];
    _whiteLight setLightColor [1,1,1];
    _whiteLight setLightAttenuation [0, 0, 0, 0, 0, 0];
    _whiteLight setLightUseFlare true;
    _whiteLight setLightFlareSize 1;
    _whiteLight setLightFlareMaxDistance 100;

    {
        private _light = _lights select (_forEachIndex + 1);
        _light setLightBrightness 0;
        _light setLightAmbient _x;
        _light setLightColor _x;
        _light setLightAttenuation [0, 0, 0, 0, 0, 0];
        _light setLightUseFlare true;
        _light setLightFlareSize 1;
        _light setLightFlareMaxDistance 100;
    } forEach _colorColors;
}] remoteExec ["call", 0];

// PLAYER ACTIONS
private _addActions = {
    params ["_petros"];
    // Exit if not a player machine or object null
    if (isNull _petros) exitWith {}; 
    
    private _actionIDs = []; 
    _actionIDs pushBack (_petros addAction [
        "<t color='#FF69B4'>Dance with Petros</t>",
        {
            params ["_target", "_caller"];
            if (!alive _caller) exitWith {};
            private _danceAnims = ["Acts_Dance_01", "Acts_Dance_02"];
            _caller setVariable ["A3A_Petros_dancing", true, true];
            [_caller, selectRandom _danceAnims] remoteExec ["switchMove", 0];
        },
        nil,
        6,
        true,
        true,
        "",
        "(_this distance _target) < 10 && alive _this && !(_this getVariable ['A3A_Petros_dancing', false]) && _target getVariable ['A3A_Petros_partyActive', false]",
        5
    ]);
    _actionIDs pushBack (_petros addAction [
        "<t color='#FF69B4'>Stop dancing</t>",
        {
            params ["_target", "_caller"];
            [_caller, ""] remoteExec ["switchMove", 0];
            _caller setVariable ["A3A_Petros_dancing", false, true];
        },
        nil,
        6,
        true,
        true,
        "",
        "(_this distance _target) < 10 && alive _this && (_this getVariable ['A3A_Petros_dancing', false]) && _target getVariable ['A3A_Petros_partyActive', false]",
        5
    ]);
    _actionIDs pushBack (_petros addAction [
        "<t color='#FF69B4'>Enable strobe</t>",
        {
            params ["_target", "_caller"];
            _target setVariable ["A3A_Petros_strobeEnabled", true, true];
            private _nearPlayers = allPlayers select { (_x distance _target) < 50 && alive _x };
            if (count _nearPlayers > 0) then {
                private _owners = _nearPlayers apply { owner _x };
                ["Petros :) Strobe enabled! Let's party!"] remoteExec ["systemChat", _owners];
            };
        },
        nil,
        6,
        true,
        true,
        "",
        "(_this distance _target) < 10 && alive _this && _target getVariable ['A3A_Petros_partyActive', false] && !(_target getVariable ['A3A_Petros_strobeEnabled', false])",
        5
    ]);
    
    _actionIDs pushBack (_petros addAction [
        "<t color='#FF69B4'>Disable strobe</t>",
        {
            params ["_target", "_caller"];
            _target setVariable ["A3A_Petros_strobeEnabled", false, true];
            private _nearPlayers = allPlayers select { (_x distance _target) < 50 && alive _x };
            if (count _nearPlayers > 0) then {
                private _owners = _nearPlayers apply { owner _x };
                ["Petros :) Strobe disabled. Stay safe."] remoteExec ["systemChat", _owners];
            };
        },
        nil,
        6,
        true,
        true,
        "",
        "(_this distance _target) < 10 && alive _this && _target getVariable ['A3A_Petros_partyActive', false] && (_target getVariable ['A3A_Petros_strobeEnabled', false])",
        5
    ]);
    
    // Store IDs locally on the client so we can remove them later
    _petros setVariable ["A3A_Petros_partyActionIDs", _actionIDs];
};

private _removeActions = {
    params ["_petros"];
    private _actionIDs = _petros getVariable ["A3A_Petros_partyActionIDs", []];
    { _petros removeAction _x } forEach _actionIDs;
    _petros setVariable ["A3A_Petros_partyActionIDs", nil];
};

// Execute addActions on all clients (and JIP)
[[_petros], _addActions] remoteExec ["call", 0, true]; 
// Using JIP true (3rd argument) ensures joining players also get actions. 

// Store the logic to remove actions, so we can broadcast it later
_petros setVariable ["A3A_Petros_removeActions", _removeActions];

// PETROS DANCE ANIMATIONS
private _danceAnims = ["Acts_Dance_01", "Acts_Dance_02"];
private _danceAnimsLower = _danceAnims apply {toLower _x};
[_petros, selectRandom _danceAnims] remoteExec ["switchMove", 0];

// START MUSIC
call _playNextTrack;

// STROBE THREAD
[_petros, _whiteLight] spawn {
    params ["_petros", "_whiteLight"];
    private _strobeActive = false;
    private _strobeEndTime = 0;
    private _strobeNextStart = time + 10 + random 30;

    while {alive _petros} do {
        if (_petros getVariable ["A3A_Petros_partyStopRequested", false]) exitWith {};
        private _partyTime = (daytime >= 21.0 || daytime < 1.0);
        if (_partyTime) then {
            private _strobeEnabled = _petros getVariable ["A3A_Petros_strobeEnabled", false];
            if (_strobeEnabled && !_strobeActive && time >= _strobeNextStart) then {
                private _nearPlayers = allPlayers select { (_x distance _petros) < 50 && alive _x };
                if (count _nearPlayers > 0) then {
                    private _owners = _nearPlayers apply { owner _x };
                    ["Petros :) EPILEPSY WARNING, 10 seconds to look away."] remoteExec ["systemChat", _owners];
                    sleep 10;
                };

                _strobeActive = true;
                private _duration = 5 + random 5;
                _strobeEndTime = time + _duration;
                _strobeNextStart = _strobeEndTime + 20 + random 20;
            };
            if (_strobeActive && time >= _strobeEndTime) then {
                _strobeActive = false;
            };

            if (_strobeActive && _strobeEnabled) then {
                private _flash = floor(time * 15) % 2;
                private _brightness = if (_flash == 0) then { 1.0 } else { 0.2 };
                // Must remoteExec setLightBrightness
                [_whiteLight, _brightness] remoteExec ["setLightBrightness", 0];
            } else {
                [_whiteLight, 0] remoteExec ["setLightBrightness", 0];
            };
        } else {
            [_whiteLight, 0] remoteExec ["setLightBrightness", 0];
        };
        sleep 0.01;
    };
};

// MAIN LOOP
while {alive _petros} do {
    if (_petros getVariable ["A3A_Petros_partyStopRequested", false]) exitWith {};

    private _partyTime = (daytime >= 21.0 || daytime < 2.0);
    if (_partyTime) then {
        private _trackEndTime = _petros getVariable ["A3A_Petros_trackEndTime", 0];
        if (time >= _trackEndTime) then {
            call _playNextTrack;
        };

        // Update light positions (setPos is global for global objects, so server update is fine)
        _whiteLight setPos (_petros modelToWorld _whiteOffset);
        {
            private _offset = _colorOffsets select _forEachIndex;
            private _worldPos = _petros modelToWorld _offset;
            _x setPos _worldPos;
            private _intensity = 0.8 + 0.7 * sin (time * 10 + _forEachIndex * 120);
            // Must remoteExec brightness
            [_x, _intensity] remoteExec ["setLightBrightness", 0];
        } forEach (_lights select [1, count _colorColors]);

        private _currentAnim = toLower animationState _petros;
        if !(_currentAnim in _danceAnimsLower) then {
            [_petros, selectRandom _danceAnims] remoteExec ["switchMove", 0];
        };
    } else {
        // Party ended
        { [_x, 0] remoteExec ["setLightBrightness", 0]; } forEach _lights;

        // Stop Petros dance
        private _currentAnim = toLower animationState _petros;
        if (_currentAnim in _danceAnimsLower) then {
            [_petros, "AmovPercMstpSnonWnonDnon"] remoteExec ["playMoveNow", 0];
        };

        {
            if (_x getVariable ["A3A_Petros_dancing", false]) then {
                [_x, ""] remoteExec ["switchMove", 0];
                _x setVariable ["A3A_Petros_dancing", false];
            };
        } forEach (_petros nearEntities ["CAManBase", 30]);

        call _stopCurrentSound;
        
        // Remove actions on all clients
        [[_petros], _petros getVariable ["A3A_Petros_removeActions", {}]] remoteExec ["call", 0];

        waitUntil {
            sleep 30;
            (daytime >= 21.0 || daytime < 2.0)
        };

        // Restore actions
        [[_petros], _addActions] remoteExec ["call", 0];
        call _playNextTrack;
        [_petros, selectRandom _danceAnims] remoteExec ["switchMove", 0];
    };
    sleep 0.1;
};

// CLEANUP
{ deleteVehicle _x } forEach _lights;
_petros setVariable ["A3A_Petros_partyLights", nil, true];
call _stopCurrentSound;
[[_petros], _petros getVariable ["A3A_Petros_removeActions", {}]] remoteExec ["call", 0];
[_petros, "AmovPercMstpSnonWnonDnon"] remoteExec ["playMoveNow", 0];
_petros setVariable ["A3A_Petros_partyActive", nil, true];
_petros setVariable ["A3A_Petros_partyStopRequested", nil, true];
_petros setVariable ["A3A_Petros_strobeEnabled", nil, true];
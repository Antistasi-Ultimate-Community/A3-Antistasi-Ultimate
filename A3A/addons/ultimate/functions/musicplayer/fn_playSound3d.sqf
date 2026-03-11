/*  
    fn_playSound3d.sqf

    Author: wersal

    Description:
        Plays a positional sound on a target object with distance and boost settings.
        Saves the created sound object in the target's variable for later stopping.

    Params:
        _target : OBJECT : the source object
        _soundClass : STRING : sound class from CfgSounds
        _volume : NUMBER : volume (0-1)
        _pitch : NUMBER : sound pitch
        _loudspeaker : BOOLEAN : loudspeaker mode
        _boostLevel : NUMBER : boost level (0-4)

    Returns:
        Nothing

    License: VPN-DPC
*/

#include "..\..\script_component.hpp"

params ["_target", "_soundClass", "_volume", "_pitch", "_loudspeaker", "_boostLevel"];

// Stop previous sound if any
private _oldSound = _target getVariable ["A3U_currentSoundObj", objNull];
if (!isNull _oldSound) then {
    deleteVehicle _oldSound;
    _target setVariable ["A3U_currentSoundObj", nil];
};

// Get object type (default "car")
private _objectType = _target getVariable ["A3U_objectType", "car"];

// Determine base distance based on type
private _baseDist = switch (_objectType) do {
    case "helicopter": { 300 };
    case "plane":      { 400 };
    case "backpack":   { 50 };
    default            { 100 };
};

// Loudspeaker multiplier
private _loudMul = if (_loudspeaker) then { 2.0 } else { 1.0 };

// Boost multiplier (0..4 → +0, +2, +3, +4, +5 dB approx)
private _boostMul = [1.0, 1.26, 1.41, 1.58, 1.78] select _boostLevel;

// Final maximum distance
private _maxDist = _baseDist * _loudMul * _boostMul;

// Play the new sound with isSpeech = 2 (no interior muffling)
private _soundObj = _target say3D [_soundClass, _maxDist, _pitch, 2, 0, true];

// Save reference to the sound object
_target setVariable ["A3U_currentSoundObj", _soundObj];
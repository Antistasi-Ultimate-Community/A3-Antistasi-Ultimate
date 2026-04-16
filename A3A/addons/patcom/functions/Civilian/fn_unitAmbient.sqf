/*
    Author:
        MaxxLite
    
    Description:
        Adds idle sounds and animation to selected unit
    
    Params:
        _unit <Default: ObjNull>
    
    Usage:
        [_unit] call A3A_fnc_unitAmbient;
    
    Return:
        N/A
*/

params [["_unit", ObjNull]];

if (_unit isEqualTo ObjNull) exitWith {ObjNull};

[_unit] spawn {
    params ["_unit"];
    // name of the sound file in CfgSounds.hpp
    private _ambientSounds = 
    [
        ["A3A_Audio_Petros_Ambient_Sneeze", "Acts_Ambient_Gestures_Sneeze", 4.5],
        ["A3A_Audio_Petros_Ambient_Coughing1", "Acts_Rifle_Operations_Zeroing", 5.26],
        ["A3A_Audio_Petros_Ambient_Coughing2", "Acts_Rifle_Operations_Checking_Chamber", 4.633],
        ["A3A_Audio_Petros_Ambient_Scratching", "", 1],
        ["A3A_Audio_Petros_Ambient_Sneeze", "Acts_Ambient_Rifle_Drop", 4.533],
        ["A3A_Audio_Petros_Ambient_Whistle1", "Acts_Ambient_Picking_Up", 7.35],
        ["A3A_Audio_Petros_Ambient_Humming", "Acts_Ambient_Shoelaces", 10.154],
        ["A3A_Audio_Petros_Ambient_Whistle1", "Acts_Ambient_Relax_1", 7.821],
        ["A3A_Audio_Petros_Ambient_Whistle2", "Acts_Ambient_Relax_4", 9.354],
        ["A3A_Audio_Petros_Ambient_Yawn1", "Acts_Ambient_Gestures_Tired", 9.59],
        ["A3A_Audio_Petros_Ambient_Yawn2", "Acts_Ambient_Gestures_Yawn", 5.068],
        ["A3A_Audio_Petros_Ambient_Humming", "Acts_Ambient_Stretching", 5.8],
        ["A3A_Audio_Petros_Ambient_Sniffling", "Acts_Ambient_Cleaning_Nose", 3.197],
        ["A3A_Audio_Petros_Ambient_ThroatClearing","Acts_Ambient_Relax_2", 11.669]
	];  
	// the action and sound selected unit makes in the following order 
	// | Sound name as written in CfgSounds.hpp | Animation played when sound is selected | Duration of animation | 
 
	while { (alive _unit) } do {
		private _combo = selectRandom (_ambientSounds);

        [_unit, _combo#0, _combo#1, _combo#2] call A3A_fnc_unitAmbientPlay;
 
		sleep (15 + random 165);

        if !(alive _unit) exitWith {};
	}; 
};
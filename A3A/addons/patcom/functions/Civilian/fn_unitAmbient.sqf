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
        ["A3A_Audio_Petros_Ambient_Sneeze", "Acts_Ambient_Gestures_Sneeze", 5],
        ["A3A_Audio_Petros_Ambient_Coughing1", "Acts_Rifle_Operations_Zeroing", 7],
        ["A3A_Audio_Petros_Ambient_Coughing2", "Acts_Rifle_Operations_Checking_Chamber", 6],
        ["A3A_Audio_Petros_Ambient_Scratching", "", 0],
        ["A3A_Audio_Petros_Ambient_Whistle1", "Acts_Ambient_Relax_1", 9],
        ["A3A_Audio_Petros_Ambient_Whistle2", "Acts_Ambient_Relax_4", 10],
        ["A3A_Audio_Petros_Ambient_Yawn1", "Acts_Ambient_Gestures_Tired", 11],
        ["A3A_Audio_Petros_Ambient_Yawn2", "Acts_Ambient_Gestures_Yawn", 6],
        ["A3A_Audio_Petros_Ambient_Humming", "Acts_Ambient_Stretching", 7],
        ["A3A_Audio_Petros_Ambient_Sniffling", "Acts_Ambient_Cleaning_Nose", 4],
        ["A3A_Audio_Petros_Ambient_ThroatClearing","Acts_Ambient_Relax_2", 12],
        ["A3A_Audio_Petros_Ambient_Breathing", "Acts_Ambient_Rifle_Drop", 6]
	];  
	// the action and sound selected unit makes in the following order 
	// | Sound name as written in CfgSounds.hpp | Animation played when sound is selected | Duration of animation | 
 
	while { (alive _unit) } do {
		private _sound = selectRandom (_ambientSounds);
 
		private _animation = _sound # 1;
 
		[_unit, _sound # 0] remoteExec ["say3D", 0, true];
 
		[_unit, _animation] remoteExec ["playMoveNow",0,true];
 
		sleep (_sound # 2);
 
		[_unit,[""]] remoteExec ["switchMove"];
 
		sleep (random 1800); 
		sleep (random 10); 

        if !(alive _unit) exitWith {};
	}; 
};
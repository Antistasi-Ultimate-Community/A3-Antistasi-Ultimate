/*
    Author: Maxx
    Description:
        Creates a ambient sounds from Petros.

    Arguments:
        Nil.

    Return Value:
        Petros

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        call A3A_fnc_unitAmbient;

*/

private _musicSource = petros;

[_musicSource] spawn {
    params ["_musicSource"];
    // name of the sound file in CfgSounds.hpp
    private _ambientSounds = 
    [
        ["A3A_Audio_Petros_Ambient_Sneeze", "Acts_Ambient_Gestures_Sneeze"],
        ["A3A_Audio_Petros_Ambient_Coughing1", "Acts_Rifle_Operations_Zeroing"],
        ["A3A_Audio_Petros_Ambient_Coughing2", "Acts_Rifle_Operations_Checking_Chamber"],
        ["A3A_Audio_Petros_Ambient_Scratching", ""],
        ["A3A_Audio_Petros_Ambient_Whistle1", ""],
        ["A3A_Audio_Petros_Ambient_Whistle2", ""],
        ["A3A_Audio_Petros_Ambient_Yawn1", "Acts_Ambient_Gestures_Tired"],
        ["A3A_Audio_Petros_Ambient_Yawn2", "Acts_Ambient_Gestures_Yawn"],
        ["A3A_Audio_Petros_Ambient_Humming", ""],
        ["A3A_Audio_Petros_Ambient_Sniffling", "Acts_Ambient_Cleaning_Nose"],
        ["A3A_Audio_Petros_Ambient_ThroatClearing","Acts_Ambient_Relax_2"],
        ["A3A_Audio_Petros_Ambient_Breathing", "Acts_Ambient_Rifle_Drop"]
    ];

    while { (alive _musicSource) } do {
        private _sound = selectRandom (_ambientSounds);

        private _animation = _sound # 1;

        [_musicSource, _sound # 0] remoteExec ["say3D", [1, _musicSource], true];

        petros playMoveNow _animation;

        sleep (random 1800);

        if not (alive _musicSource) exitWith {};
        
        sleep (random 10);
    };
};

_musicSource
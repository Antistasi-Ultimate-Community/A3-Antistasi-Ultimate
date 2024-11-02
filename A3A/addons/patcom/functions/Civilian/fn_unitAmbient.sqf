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
        "A3A_Audio_Petros_Ambient_Coughing1",
        "A3A_Audio_Petros_Ambient_Coughing2",
        "A3A_Audio_Petros_Ambient_Scratching",
        "A3A_Audio_Petros_Ambient_Whistle1",
        "A3A_Audio_Petros_Ambient_Whistle2",
        "A3A_Audio_Petros_Ambient_Yawn1",
        "A3A_Audio_Petros_Ambient_Yawn2",
        "A3A_Audio_Petros_Ambient_Humming",
        "A3A_Audio_Petros_Ambient_Sniffling",
        "A3A_Audio_Petros_Ambient_ThroatClearing",
        "A3A_Audio_Petros_Ambient_Breathing"
    ];

    while { (alive _musicSource) } do {
        private _sound = selectRandom (_ambientSounds);

        [_musicSource, _sound] remoteExec ["say3D", [1, _musicSource], true];

        sleep (random 1800);

        if not (alive _musicSource) exitWith {};
        
        sleep (random 10);
    };
};

_musicSource
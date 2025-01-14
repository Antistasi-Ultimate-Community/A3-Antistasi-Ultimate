/*
    Author: [Hazey]
    Description:
      Creates a HashMap of playable tracks with their durations

    Arguments:
        N/A

    Return Value:
        No Return, but it does set a hashmap variable of A3A_Civilian_Amb_Tracks

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        [] call A3A_fnc_createCivilianTracks;

    License: MIT License
*/

// This really shouldn't be called again, also it really doesn't matter as if a key already exists
// It will just overwrite the current key, not create a new one.
if !(isNil "A3A_Civilian_Amb_Tracks") exitWith {};

// Create Public HashMap for Civilian Audio Tracks


A3A_Civilian_Amb_Tracks = createHashMapFromArray [
    ["Fear", 
        [
            ["A3A_Audio_Civ_Fear1", 3],
            ["A3A_Audio_Civ_Fear2", 6],
            ["A3A_Audio_Civ_Fear3", 8],
            ["A3A_Audio_Civ_Fear4", 8],
            ["A3A_Audio_Civ_Fear5", 6],
            ["A3A_Audio_Civ_Fear6", 7]
        ]
    ],
    ["Animals",
        [
            ["A3A_Audio_Civ_Dog1", 7],
            ["A3A_Audio_Civ_Dog2", 7],
            ["A3A_Audio_Civ_Dog3", 7],
            ["A3A_Audio_Civ_Dog4", 7],
            ["A3A_Audio_Civ_Dog5", 7],
            ["A3A_Audio_Civ_Dog6", 7],
            ["A3A_Audio_Civ_Dog7", 7],
            ["A3A_Audio_Civ_Dog8", 7],
            ["A3A_Audio_Civ_Dog9", 8],
            ["A3A_Audio_Civ_Dog10", 7],
            ["A3A_Audio_Civ_Dog11", 7],
            ["A3A_Audio_Civ_Dog12", 7],
            ["A3A_Audio_Civ_Dog13", 7],
            ["A3A_Audio_Civ_Dog14", 7],
            ["A3A_Audio_Civ_Dog15", 7],
            ["A3A_Audio_Civ_Dog16", 7],
            ["A3A_Audio_Civ_Dog17", 8],
            ["A3A_Audio_Civ_Dog18", 7],
            ["A3A_Audio_Civ_Dog19", 7],
            ["A3A_Audio_Civ_Dog20", 7]
        ]
    ]
];
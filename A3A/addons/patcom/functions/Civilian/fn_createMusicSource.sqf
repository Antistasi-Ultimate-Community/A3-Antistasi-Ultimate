/*
    Author: [Hazey]
    Description:
        Create a civilian sound source at a provided building.

    Arguments:
        <Object> Building you want to attach it to.

    Return Value:
        <Object> Sound Source

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        _musicSource = [_building] call A3A_fnc_createMusicSource;

    License: MIT License
*/

#include "..\..\script_component.hpp"
params ["_building"];

if (createAmbientSounds isEqualTo false) exitWith {};

private _lowCiv = Faction(civilian) getOrDefault ["attributeLowCiv", false];
private _civNonHuman = Faction(civilian) getOrDefault ["attributeCivNonHuman", false];

if (_lowCiv) exitWith {};
if (_civNonHuman) exitWith {};

// We add the music source to a radio item rather than the building itself.
// This is so we can delete the source later in a easier fashion.
private _radioItem = getPosATL _building;
_radioItem set [2, ((_radioItem select 2) + 1)];
private _musicSource = createVehicle ["Land_FMradio_F", _radioItem];

private _tableItem = getPosATL _building; 
_tableItem set [0, ((_tableItem select 0) + ([-1.0, 1.0] call BIS_fnc_randomNum))];
_tableItem set [1, ((_tableItem select 1) + ([-1.0, 1.0] call BIS_fnc_randomNum))];
_tableItem set [2, ((_tableItem select 2) + 0.5)];

private _civItems = selectRandom [
	"Item_Money", 
	"Item_Money_bunch", 
	"Item_Money_roll", 
	"Item_Money_stack"
];

if (5 >= random 10) then {
    private _randomCivItem = createVehicle [_civItems, _tableItem];
};

[_radioItem, _musicSource] spawn {
    params ["_radioItem", "_musicSource", "_locationType"];
    private _tracksPlayed = 1;
    // name of the sound file in CfgSounds.hpp and the duration (in sec)
    private _tracks = 
    [
        ["A3A_Audio_Civ_Song1", 127],
        ["A3A_Audio_Civ_Song2", 192],
        ["A3A_Audio_Civ_Song3", 180],
        ["A3A_Audio_Civ_Song4", 196],
        ["A3A_Audio_Civ_Song5", 357],
        ["A3A_Audio_Civ_Radio1", 240],
        ["A3A_Audio_Civ_Radio2", 411],
        ["A3A_Audio_Civ_Radio3", 246],
        ["A3A_Audio_Civ_Radio4", 292],
        ["A3A_Audio_Civ_Radio5", 189],
        ["A3A_Audio_Civ_Radio6", 203]
    ];

    private _totalTracks = count _tracks;

    [
        _musicSource,
        localize "STR_antistasi_actions_destroy_radio",
        "\a3\ui_f\data\igui\cfg\simpletasks\types\destroy_ca.paa", "\a3\ui_f\data\igui\cfg\simpletasks\types\destroy_ca.paa",
        "true", "true",
        {},
        {},
        {
            private _radioItem = _this select 0;
            deleteVehicle _radioItem;
        },
        {},
        [_musicSource], 2, nil, true, false
    ] call BIS_fnc_holdActionAdd; // hold interaction to destroy radio.

    while { (alive _musicSource) } do {
        while { _tracksPlayed < _totalTracks } do {
            private _track = selectRandom (_tracks);
            private _trackDuration = _track # 1;

            [_musicSource, _track # 0] remoteExec ["say3D", [0, _musicSource], true];

            sleep _trackDuration;

            _tracksPlayed = _tracksPlayed + 1;

            if not (alive _musicSource) exitWith {};
        };
        sleep (random 10);
    };
};

_musicSource
// fn_addRadioAction.sqf
/*  
    Author: wersal

    Description:
        Adds an action to an object to open the music or sound player.
        For sound mode, the action is visible only to the driver, commander, and copilot.

    Params:
        _object : OBJECT : the object to attach the action to
        _mode : STRING : "sound" (default) or "music"
        _objectType : STRING : object type for sound mode: "car", "helicopter", "plane", "backpack" (default "car")

    Returns:
        Nothing

    License: VPN-DPC
*/

#include "..\..\script_component.hpp"

params [
    ["_object", objNull, [objNull]],
    ["_mode", "sound", [""]],
    ["_objectType", "car", [""]]
];

if (isNull _object) exitWith {};

// Save object type in the object's variables for later use in the player
_object setVariable ["A3U_objectType", _objectType, true];

private _text = if (_mode == "music") then { localize "STR_A3U_action_open_player" } else { localize "STR_A3U_action_open_sound" };
private _icon = "\A3\ui_f\data\map\vehicleicons\iconSound_ca.paa";

// Determine condition and radius based on mode and object type
private _condition = "";
private _radius = 3;

if (_mode == "music") then {
    // For music, action is visible to everyone within 3 meters
    _condition = "true";
    _radius = 3;
} else {
    // For sound mode
    if (_objectType == "backpack") then {
        // Backpack radio is visible to everyone within 2 meters
        _condition = "true";
        _radius = 2;
    } else {
        // For vehicles, action is visible only to driver, commander, and copilot
        _condition = "driver _target == _this || commander _target == _this || ({getNumber ([_target, _x] call BIS_fnc_turretConfig >> 'isCopilot') > 0 && {_target turretUnit _x == _this}} count allTurrets _target) > 0";
        _radius = -1; // unlimited range (only condition determines visibility)
    };
};

_object addAction [
    format ["<img image='%1' size='1.6' shadow=2 /> <t>%2</t>", _icon, _text],
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _arguments params ["_mode", "_targetObj"];
        
        // For sound mode, check if the object is alive
        if (_mode == "sound" && {isNull _targetObj || {!alive _targetObj}}) exitWith {
            systemChat localize "STR_A3U_radio_damaged";
        };
        
        // Call player initialization with the required mode and object (for sound pass the object)
        [_mode, if (_mode == "sound") then { _targetObj } else { objNull }] call A3U_fnc_initMusicPlayer;
    },
    [_mode, _object],
    -99,
    false,
    true,
    "",   // shortcut
    _condition,
    _radius
];
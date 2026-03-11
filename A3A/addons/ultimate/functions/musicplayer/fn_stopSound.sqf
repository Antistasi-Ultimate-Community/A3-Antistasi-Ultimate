// fn_stopSound.sqf
/*  
    Author: wersal

    Description:
        Stops the sound currently playing on a target object.
        Deletes the sound object stored in the target's variable.

    Params:
        _target : OBJECT : the source object

    Returns:
        Nothing

    License: VPN-DPC
*/

#include "..\..\script_component.hpp"

params ["_target"];

private _soundObj = _target getVariable ["A3U_currentSoundObj", objNull];
if (!isNull _soundObj) then {
    deleteVehicle _soundObj;
    _target setVariable ["A3U_currentSoundObj", nil];
};
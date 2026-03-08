#include "..\..\script_component.hpp"
/*
    Останавливает воспроизведение звука на целевом объекте, используя сохранённую ссылку.
    Параметры:
        0: OBJECT - целевой объект
*/
params ["_target"];

private _soundObj = _target getVariable ["A3U_currentSoundObj", objNull];
if (!isNull _soundObj) then {
    deleteVehicle _soundObj;
    _target setVariable ["A3U_currentSoundObj", nil];
};
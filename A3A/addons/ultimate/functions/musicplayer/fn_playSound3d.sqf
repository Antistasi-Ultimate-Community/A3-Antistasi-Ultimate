// fn_playSound3D.sqf
#include "..\..\script_component.hpp"
/*
    Воспроизводит звук на целевом объекте с учётом настроек дальности и усиления.
    Сохраняет созданный звуковой объект в переменной объекта для последующей остановки.
    Параметры:
        0: OBJECT - целевой объект
        1: STRING - класс звука из CfgSounds
        2: NUMBER - громкость (0-1)
        3: NUMBER - питч
        4: BOOLEAN - режим loudspeaker
        5: NUMBER - уровень boost (0-4)
*/
params ["_target", "_soundClass", "_volume", "_pitch", "_loudspeaker", "_boostLevel"];

// Останавливаем предыдущий звук, если есть
private _oldSound = _target getVariable ["A3U_currentSoundObj", objNull];
if (!isNull _oldSound) then {
    deleteVehicle _oldSound;
    _target setVariable ["A3U_currentSoundObj", nil];
};

// Получаем тип объекта (по умолчанию "car")
private _objectType = _target getVariable ["A3U_objectType", "car"];

// Определяем базовую дальность в зависимости от типа
private _baseDist = switch (_objectType) do {
    case "helicopter": { 300 };
    case "plane":      { 400 };
    case "backpack":   { 50 };
    default            { 100 };
};

// Множитель от loudspeaker
private _loudMul = if (_loudspeaker) then { 2.0 } else { 1.0 };

// Множитель от boost (0..4 -> +0, +2, +3, +4, +5 дБ приблизительно)
private _boostMul = [1.0, 1.26, 1.41, 1.58, 1.78] select _boostLevel;

// Итоговая максимальная дистанция
private _maxDist = _baseDist * _loudMul * _boostMul;

// Воспроизводим новый звук с isSpeech = 2 (без муфлинга)
private _soundObj = _target say3D [_soundClass, _maxDist, _pitch, 2, 0, true];

// Сохраняем ссылку на звуковой объект
_target setVariable ["A3U_currentSoundObj", _soundObj];
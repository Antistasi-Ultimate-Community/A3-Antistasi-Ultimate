#include "..\..\script_component.hpp"
/*
    Устанавливает обработчики MusicStart и MusicStop для точного отслеживания состояния плеера.
    Вызывается один раз при первом открытии плеера или при старте миссии.
*/

// Удаляем старые обработчики, если они есть
if (!isNil "A3U_musicStartEH") then { removeMusicEventHandler ["MusicStart", A3U_musicStartEH]; };
if (!isNil "A3U_musicStopEH") then { removeMusicEventHandler ["MusicStop", A3U_musicStopEH]; };

// MusicStart – обновляем информацию о треке (может пригодиться)
A3U_musicStartEH = addMusicEventHandler ["MusicStart", {
    params ["_musicClassname", "_ehID", "_currentPosition", "_totalLength"];
    diag_log format ["[MusicPlayer] Music started: %1", _musicClassname];
    // Можно синхронизировать глобальные переменные, если нужно
}];

// MusicStop – автоматическое переключение на следующий трек (с учётом повтора)
A3U_musicStopEH = addMusicEventHandler ["MusicStop", {
    params ["_musicClassname", "_ehID", "_currentPosition", "_totalLength"];
    diag_log format ["[MusicPlayer] Music stopped: %1", _musicClassname];

    // Если плеер всё ещё должен играть (не был остановлен вручную)
    if (A3U_isPlaying) then {
        if (A3U_loopEnabled) then {
            // Повтор текущего трека
            [] call A3U_fnc_playTrack;
        } else {
            // Следующий трек
            call A3U_fnc_nextTrack;
        };
    };
}];
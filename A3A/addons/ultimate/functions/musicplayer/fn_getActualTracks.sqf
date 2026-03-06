//fn_getAtualTracks.sqf
#include "..\..\script_component.hpp"
/*
    Возвращает список треков для категории "actualmusic".
    Сформирован на основе предоставленных дебаг-логов.
    Каждый элемент: [название, класс]
    Если название пустое, оно будет сгенерировано автоматически из класса.
*/
private _tracks = [
    ["Underwater 2", "BackgroundTrack01_F"],
    ["On The Road", "BackgroundTrack02_F"],
    ["Epic Split", "LeadTrack03_F_Bootcamp"],
    ["Marksmen DLC: Lead Track 02 (Into the Sun)", "LeadTrack02_F_Mark"],
    ["C EA RadioMusic1", "C_EA_RadioMusic1"],
    ["C EA RadioMusic2", "C_EA_RadioMusic2"],
    ["Evolution", "LeadTrack02_F_Bootcamp"],
    ["Track D 01", "Track_D_01"],
    ["Track D 02", "Track_D_02"],
    ["Track D 03", "Track_D_03"],
    ["A2: Close Quarter Combat", "Track_M_01"],
    ["Track M 02", "Track_M_02"],
    ["Track M 03", "Track_M_03"],
    ["Track P 09", "Track_P_09"],
    ["Track P 11", "Track_P_11"],
    ["A2 OA: Revolver Jam", "Track_P_13"],
    ["A2 BAF: Through the Valley", "Track_P_18"],
    ["A2: Manhattan", "Track_R_01"],
    ["Track R 02", "Track_R_02"],
    ["Track R 03", "Track_R_03"],
    ["Track R 04", "Track_R_04"],
    ["Track R 06", "Track_R_06"],
    ["Track R 07", "Track_R_07"],
    ["Track R 08", "Track_R_08"],
    ["Track R 10", "Track_R_10"],
    ["Track R 13", "Track_R_13"],
    ["Track R 14", "Track_R_14"],
    ["Track R 15", "Track_R_15"],
    ["Track R 16", "Track_R_16"],
    ["A2: Insertion", "Track_R_17"],
    ["Track R 18", "Track_R_18"],
    ["Track R 19", "Track_R_19"],
    ["Track R 20", "Track_R_20"],
    ["Track R 22", "Track_R_22"],
    ["Track R 23", "Track_R_23"],
    ["Track R 24", "Track_R_24"]
];

diag_log format ["[getActualTracks] count: %1", count _tracks];
_tracks
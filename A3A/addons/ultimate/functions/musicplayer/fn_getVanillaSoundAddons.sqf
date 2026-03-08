#include "..\..\script_component.hpp"
/*
    Возвращает список аддонов, которые считаются "ванильными" (из самой Arma 3 и официальных DLC)
    для звукового режима. Используется для фильтрации категорий.
    Основан на предоставленном списке ванильных аддонов для музыки, но адаптирован под CfgSounds.
*/
private _vanillaAddons = [
    // Звуки из базовой игры и DLC
	"A3A_ultimate",
	"A3A_core",
	"A3A_patcom",
	"A3_Dubbing_F_Warlords",
    "A3_Sounds_F",
    "A3_Sounds_F_EPB",
    "A3_Sounds_F_EPC",
    "A3_Sounds_F_Bootcamp",
    "A3_Sounds_F_Exp_A",
    "A3_Sounds_F_Jets",
    "A3_Sounds_F_Patrol",
    "A3_Sounds_F_Orange",
    "A3_Sounds_F_Enoch",
    "A3_Sounds_F_AoW",
    "A3_Sounds_F_Decade",
    "A3_Ui_F",
    "A3_Ui_F_Curator",
    "A3_Missions_F",
    "A3_Missions_F_Beta",
    "A3_Missions_F_Gamma",
    "A3_Missions_F_EPA",
    "A3_Missions_F_EPC",
    "A3_Missions_F_EPB",
    "A3_Missions_F_Curator",
    "A3_Missions_F_Bootcamp",
    "A3_Missions_F_Exp",
    "A3_Missions_F_Tacops",
    "A3_Missions_F_Oldman",
    "A3_Missions_F_AoW",
    "A3_Data_F_Curator",
    "A3_3DEN",
    "A3_Modules_F_MP_Mark_Objectives",
    "A3_Animals_F_Beta_Sheep",
    "A3_Air_F_Beta_Parachute_01",
    "structures_f_vietnam_c",
    "sounds_f_vietnam_c",
    "sounds_f_vietnam_02_c",
    "sounds_f_vietnam_03_c",
    "sounds_f_vietnam_04_c"
    // При необходимости можно дополнить
];

_vanillaAddons
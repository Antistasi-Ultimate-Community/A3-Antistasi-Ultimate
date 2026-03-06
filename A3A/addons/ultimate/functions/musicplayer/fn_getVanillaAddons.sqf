//fn_getVanillaAddons.sqf
#include "..\..\script_component.hpp"
/*
    Возвращает список аддонов, которые считаются "ванильными" (из самой Arma 3 и её официальных DLC).
    Используется для фильтрации категорий.
*/
private _vanillaAddons = [
    // Базовая игра и основные DLC
    "A3_Music_F",
    "A3_Music_F_Bootcamp",
    "A3_Music_F_EPC",
    "A3_Music_F_EPB",
    "A3_Music_F_Heli",
    "A3_Music_F_Jets",
    "A3_Music_F_Mark",
    "A3_Music_F_Orange",
    "A3_Music_F_Tacops",
    "A3_Music_F_Tank",
    "A3_Music_F_Warlords",
    "A3_Music_F_Enoch",
    "A3_Music_F_Exp",
    "A3_Music_F_EPA",
	"A3_Music_F_Argo",
    "A3_Missions_F_Oldman",
    "A3_Missions_F_Exp",
    "A3_Missions_F_EPA",
    "A3_Missions_F_EPC",
    "A3_Missions_F_EPB",
    "A3_Missions_F_Curator",
    "A3_Missions_F_Gamma",
	"A3_Data_F_Curator",
    "A3_Sounds_F"              // Базовые звуки
];

_vanillaAddons
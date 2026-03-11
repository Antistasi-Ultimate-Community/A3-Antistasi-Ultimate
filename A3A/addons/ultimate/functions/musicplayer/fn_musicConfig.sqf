/*
	fn_MusicConfig

    Author: wersal

    Description:
        Configuration file for manual categories.
        Each category is an array: [key, display name, [classes], [types], era]

        Era values:
            1 = WW2
            2 = Vietnam
            3 = Cold War
            4 = Modern
            5 = Sci-Fi
        Categories with era ≤ selected era are shown.

    Params:
        None

    Returns:
        ARRAY : list of category definitions

    License: VPN-DPC
*/

#include "..\..\script_component.hpp"

private _categories = [
    // ===== VANILLA MUSIC (by genre) =====
    // Vanilla Rock
    [
        "vanillarock_sounds",
        localize "STR_A3U_cat_vanillarock_sounds",
        [
            "Track_R_01", "Track_R_02", "Track_R_03", "Track_R_04", "Track_R_05",
            "Track_R_06", "Track_R_07", "Track_R_08", "Track_R_09", "Track_R_10",
            "Track_R_11", "Track_R_12", "Track_R_13", "Track_R_14", "Track_R_15",
            "Track_R_16", "Track_R_17", "Track_R_18", "Track_R_19", "Track_R_20",
            "Track_R_21", "Track_R_22", "Track_R_23", "Track_R_24"
        ],
        ["music", "sound"],
        4
    ],

    // Vanilla Pop
    [
        "vanillapop_sounds",
        localize "STR_A3U_cat_vanillapop_sounds",
        [
            "Track_P_01", "Track_P_02", "Track_P_03", "Track_P_04", "Track_P_05",
            "Track_P_06", "Track_P_07", "Track_P_08", "Track_P_09", "Track_P_10",
            "Track_P_11", "Track_P_12", "Track_P_13", "Track_P_14", "Track_P_15",
            "Track_P_16", "Track_P_17", "Track_P_18"
        ],
        ["music", "sound"],
        4
    ],

    // Vanilla Metal
    [
        "vanillametal",
        localize "STR_A3U_cat_vanillametal",
        ["Track_M_01", "Track_M_02", "Track_M_03"],
        ["music", "sound"],
        4
    ],

    // Vanilla Dance
    [
        "vanilladance",
        localize "STR_A3U_cat_vanilladance",
        ["Track_D_01", "Track_D_02", "Track_D_03"],
        ["music", "sound"],
        4
    ],

    // Vanilla Ambient
    [
        "vanillaambient_sounds",
        localize "STR_A3U_cat_vanillaambient_sounds",
        [
            "BackgroundTrack01_F", "BackgroundTrack02_F", "LeadTrack03_F_Bootcamp",
            "LeadTrack02_F_Mark", "C_EA_RadioMusic1", "C_EA_RadioMusic2",
            "LeadTrack02_F_Bootcamp", "Track_O_01"
        ],
        ["music", "sound"],
        4
    ],

    // Vanilla Chillout – only sounds category
    [
        "vanillachillout",
        localize "STR_A3U_cat_vanillachillout",
        [
            "Track_C_01", "Track_C_02", "Track_C_03", "Track_C_04", "Track_C_05",
            "Track_C_06", "Track_C_07", "Track_C_08", "Track_C_09", "Track_C_10",
            "Track_C_11", "Track_C_12", "Track_C_13", "Track_C_14", "Track_C_15",
            "Track_C_16", "Track_C_17", "Track_C_18", "Track_C_19", "Track_C_20"
        ],
        ["music", "sound"],
        4
    ],

    // ===== CDLC CATEGORIES =====
    // vnradio – different class sets for music and sounds
    [
        "vnradio_tracks",
        localize "STR_A3U_cat_vnradio_tracks",
        [
            "vn_trippin", "vn_drafted", "vn_unsung_heroes", "vn_route9",
            "vn_blues_for_suzy", "vn_voodoo_girl", "vn_tequila_highway", "vn_there_it_is",
            "vn_kitty_bar_blues", "vn_fire_in_the_sky", "vn_freedom_bird", "vn_dont_cry_baby",
            "vn_up_here_looking_down", "vn_jungle_boots"
        ],
        ["music"],
        2
    ],
    [
        "vnradio_sounds",
        localize "STR_A3U_cat_vnradio_sounds",
        [
            "vn_drmm_song_os_01", "vn_drmm_song_os_02", "vn_drmm_song_os_03", "vn_drmm_song_os_04",
            "vn_drmm_song_os_05", "vn_drmm_song_os_06", "vn_drmm_song_os_07", "vn_drmm_song_os_08",
            "vn_drmm_song_os_09", "vn_drmm_song_os_10", "vn_drmm_song_os_11", "vn_drmm_song_os_12",
            "vn_drmm_song_os_13", "vn_drmm_song_os_14"
        ],
        ["sound"],
        2
    ],

    // gmradio – identical lists
    [
        "gmradio",
        localize "STR_A3U_cat_gmradio",
        [
            "gm_preprations", "gm_medley", "gm_limits", "gm_note",
            "gm_intermezzo", "gm_1983", "gm_longplay", "gm_warmup",
            "gm_uncertain", "gm_panzerkraft", "gm_leopards", "gm_remaining",
            "gm_longstrides", "gm_response", "gm_scatter", "gm_death",
            "gm_motschuetzen", "gm_instigators", "gm_armyaviation", "gm_1993",
            "gm_redacted", "gm_hopper", "gm_forcerecon", "gm_lasers"
        ],
        ["music", "sound"],
        3
    ],

    // rfmusic – identical lists
    [
        "rfmusic",
        localize "STR_A3U_cat_rfmusic",
        [
            "music_action_full_RF",
            "music_combat_full_RF",
            "music_epic_full_RF",
            "music_darkaction_full_RF",
            "TitleTrack01_RF",
            "AmbientTrack01_RF",
            "AmbientTrack02a_RF",
            "AmbientTrack02b_RF",
            "AmbientTrack02c_RF",
            "music_atmospheric_full_RF",
            "music_hero_full_RF",
            "music_night_full_RF",
            "music_calm_full_RF"
        ],
        ["music", "sound"],
        4
    ],

    // rfost – identical lists
    [
        "rfost",
        localize "STR_A3U_cat_rfost",
        [
            "OST_01_RF",
            "OST_02_RF",
            "OST_03_RF",
            "OST_04_RF",
            "OST_05_RF",
            "OST_06_RF",
            "OST_07_RF",
            "OST_08_RF",
            "OST_09_RF",
            "OST_10_RF",
            "OST_11_RF"
        ],
        ["music", "sound"],
        4
    ],

    // SPE Jazz – identical lists
    [
        "spejazz",
        localize "STR_A3U_cat_spejazz",
        [
            "SPE_HoW_40s_Jazz_SRA_Arsenal_Blues",
            "SPE_HoW_40s_Jazz_SRA_Everybody_Loves_My_Baby",
            "SPE_HoW_40s_Jazz_SRA_Indianna",
            "SPE_HoW_40s_Jazz_SRA_Nobody_Knows_You_When_You_Re_Down_And_Out",
            "SPE_HoW_40s_Jazz_FX_ArsenalBlues_RadioLoudspeaker_01",
            "SPE_HoW_40s_Jazz_FX_ArsenalBlues_Radio_01",
            "SPE_HoW_40s_Jazz_FX_EverybodyLovesMyBaby_RadioLoudspeaker_01",
            "SPE_HoW_40s_Jazz_FX_EverybodyLovesMyBaby_Radio_03",
            "SPE_HoW_40s_Jazz_FX_Indianna_Radio_01",
            "SPE_HoW_40s_Jazz_FX_Indianna_RadioLoudspeaker_01",
            "SPE_HoW_40s_Jazz_FX_NobodyKnowsYou_RadioLoudspeaker_01",
            "SPE_HoW_40s_Jazz_FX_NobodyKnowsYou_Radio_01"
        ],
        ["music", "sound"],
        1
    ],

    // SPE OST – identical lists
    [
        "speost",
        localize "STR_A3U_cat_speost",
        [
            "SPE_HoW_Original_Game_Soundtrack_1_Operation_Luttich_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_2_Mortain_1944_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_3_Morte_Exitium_Virtus_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_4_Situational_Briefing_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_5_On_the_Offensive_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_6_Drawing_the_Map_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_7_No_Matter_How_Great_the_Odds_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_8_Infiltration_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_9_The_Hedgerows_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_10_Dawn_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_11_Honor_List_of_Dead_and_Missing_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_12_Major_Howie_and_Finding_the_Lost_Battalion_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_13_Piano_Jazz_Radio_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_14_Swing_Radio_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_15_Organ_Fugue_Radio_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_16_Boy_Soloist_Radio_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_17_German_Classical_Singer_Radio_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_18_Abbaye_Blanche_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_19_Spearhead_1944_Main_Theme_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_20_Under_Heavy_Fire_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_21_Allied_Counterattack_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_22_Air_Support_Arrives_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_23_Objective_Victory_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_24_Mission_End_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_25_Heavy_Ordnance_Works_Broadcast_Seal_Newsreel_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_26_Allied_Forces_Newsreel_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_27_Victory_March_Newsreel_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_28_Resilience_Newsreel_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_29_Dirge_Newsreel_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_30_Honor_Newsreel_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_31_End_Credits_Suite_Luke_Nemitz",
            "SPE_HoW_Original_Game_Soundtrack_32_Spearhead_1944_Alternate_Main_Theme_Luke_Nemitz"
        ],
        ["music", "sound"],
        1
    ],

    // SPE Cinematic – identical lists
    [
        "specinematic",
        localize "STR_A3U_cat_specinematic",
        [
            "SPE_HoW_Animated_Briefing_Cinematic_Patriotic_Cadence_and_Fanfare",
            "SPE_HoW_Animated_Briefing_Cinematic_Patriotic_Cadence_and_Fanfare_BRASS_ONLY",
            "SPE_HoW_Animated_Briefing_Cinematic_Patriotic_Cadence_and_Fanfare_DRUMS_and_BRASS",
            "SPE_HoW_Animated_Briefing_Cinematic_Patriotic_Cadence_and_Fanfare_NO_DRUMS",
            "SPE_HoW_Animated_Briefing_Emotional_Orchestra",
            "SPE_HoW_Animated_Briefing_Emotional_Orchestra_1",
            "SPE_HoW_Animated_Briefing_Emotional_Orchestra_100",
            "SPE_HoW_Animated_Briefing_Emotional_Orchestra_100_1",
            "SPE_HoW_Animated_Briefing_Emotional_Orchestra_Underscore",
            "SPE_HoW_Animated_Briefing_Emotional_Orchestra_Underscore_1",
            "SPE_HoW_Animated_Briefing_Patriotic_Military_Army_Fanfare",
            "SPE_HoW_Animated_Briefing_Patriotic_Military_Army_Fanfare_Brass_and_Drums",
            "SPE_HoW_Animated_Briefing_Patriotic_Military_Army_Fanfare_No_Drums",
            "SPE_HoW_Animated_Briefing_Patriotic_Military_Theme",
            "SPE_HoW_Animated_Briefing_Patriotic_Military_Theme_NO_PERCUSSION",
            "SPE_HoW_Credits_For_Honor_and_Glory_by_Rafael_Krux",
            "SPE_HoW_Credits_Spearhead_1944_End_Credits_Suite_Luke_Nemitz",
            "SPE_HoW_Ingame_Music_Emotional_Orchestra_40",
            "SPE_HoW_Ingame_Music_Emotional_Orchestra_40_1",
            "SPE_HoW_Ingame_Music_Alex_Under_The_Sky_The_War",
            "SPE_HoW_Ingame_Music_Military_Soundtrack",
            "SPE_HoW_Ingame_Music_Military_Soundtrack_No_Orchestra",
            "SPE_HoW_Ingame_Music_Military_Soundtrack_No_Percussion",
            "SPE_HoW_Ingame_Music_Military_Soundtrack_Underscore",
            "SPE_HoW_Ingame_Music_Dark_Action_War_Underscore",
            "SPE_HoW_Ingame_Music_Dark_Action_War_Underscore_No_Brass",
            "SPE_HoW_Ingame_Music_Dark_Action_War_Underscore_No_Melody",
            "SPE_HoW_Ingame_Music_Dark_Action_War_Underscore_No_Percussion",
            "SPE_HoW_Ingame_Music_Dark_Action_War_Underscore_No_Strings",
            "SPE_HoW_Ingame_Music_Evil_Empire_March",
            "SPE_HoW_Ingame_Music_Evil_Empire_March_NO_PERCUSSION",
            "SPE_HoW_Ingame_Music_Evil_Empire_March_VERSION_2",
            "SPE_HoW_Ingame_Music_Patriotic_Military_Army_Fanfare_Drums_Only",
            "SPE_HoW_Longer_Mix_Tracks_Soundtrack_Long_Variations_DarkWarAction_01",
            "SPE_HoW_Longer_Mix_Tracks_Soundtrack_Long_Variations_EvilEmpireMarch_01",
            "SPE_HoW_Longer_Mix_Tracks_Soundtrack_Long_Variations_MilitarySoundtrack_01",
            "SPE_HoW_Longer_Mix_Tracks_Soundtrack_Long_Variations_PatrioticMilitaryArmyFanfare_01",
            "SPE_HoW_Longer_Mix_Tracks_Soundtrack_Long_Variations_PatrioticMilitaryTheme_01",
            "SPE_HoW_Main_Theme_Calm_Patriotic_Orchestra_Soundtrack_THEME",
            "SPE_HoW_Main_Theme_Spearhead_1944_Main_Theme_Luke_Nemitz",
            "SPE_HoW_Mission_Failed_Female_Choir",
            "SPE_HoW_Mission_Failed_Slow_Emotional_Strings_30",
            "SPE_HoW_Outro_Music_Calm_Patriotic_Orchestra_Soundtrack",
            "SPE_HoW_Outro_Music_Slow_Cinematic_Strings",
            "SPE_HoW_Outro_Music_Slow_Cinematic_Strings_1",
            "SPE_HoW_Misc_Daniel_Patras_Theme",
            "SPE_HoW_Parallax_Music_Colonel_Bogey_Military_March_Percussion_Only",
            "SPE_HoW_Parallax_Music_Marching_Military_Army_Drums",
            "SPE_HoW_Parallax_Music_Marching_Military_Army_Drums_No_Cymbals",
            "SPE_HoW_Parallax_Music_Marching_Military_Army_Drums_Snares",
            "SPE_HoW_Parallax_Music_When_Johnny_Comes_Marching_Home_Military_March_Percussion_Only",
            "SPE_HoW_VocumPrimitiva_DarkHeroes",
            "SPE_HoW_VocumPrimitiva_NoTurningBack"
        ],
        ["music", "sound"],
        1
    ],

    // wsradio – identical lists
    [
        "wsradio",
        localize "STR_A3U_cat_wsradio",
        [
            "jukebox_e1_lxWS",
            "jukebox_e2_lxWS",
            "jukebox_e3_lxWS",
            "LeadTrack01_lxWS",
            "AmbientTrack04_lxWS",
            "jukebox_t1_lxWS",
            "jukebox_t2_lxWS",
            "jukebox_t3a_lxWS",
            "jukebox_t3b_lxWS",
            "jukebox_t4a_lxWS",
            "jukebox_t4b_lxWS",
            "jukebox_t4c_lxWS",
            "jukebox_t5a_lxWS",
            "jukebox_t5b_lxWS",
            "alchemist_action1_lxWS",
            "alchemist_action2_lxWS",
            "alchemist_action3_lxWS",
            "alchemist_action4_lxWS",
            "alchemist_01v2_lxWS",
            "alchemist_02v2_lxWS",
            "AmbientTrack01_lxWS",
            "AmbientTrack03a_lxWS",
            "AmbientTrack03b_lxWS",
            "AmbientTrack03c_lxWS",
            "jukebox_a1_lxWS",
            "jukebox_a2_lxWS",
            "jukebox_b1_lxWS",
            "jukebox_b2_lxWS",
            "jukebox_b3_lxWS",
            "jukebox_c1_lxWS",
            "jukebox_c2_lxWS",
            "jukebox_d1_lxWS",
            "jukebox_d2_lxWS",
            "jukebox_d3_lxWS",
            "jukebox_d4_lxWS",
            "jukebox_d5_lxWS"
        ],
        ["music", "sound"],
        1 //tecnically it sound pretty anciet
    ]
];

// ========== READ EXTENSIONS FROM CfgA3UMusicClasses (mods) ==========
/* private _extConfig = configFile >> "CfgA3UMusicCategories";
if (isClass _extConfig) then {
    private _extClasses = configClasses _extConfig;
    {
        private _cfg = _x;
        private _key = getText (_cfg >> "key");
        if (_key == "") then { _key = configName _cfg; };
        private _displayName = getText (_cfg >> "displayName");
        if (_displayName == "") then { _displayName = _key; };
        
        private _classes = getArray (_cfg >> "classes");
        private _types = getArray (_cfg >> "types");
        if (_types isEqualTo []) then { _types = ["music", "sound"]; };
        private _era = getNumber (_cfg >> "era");
        if (_era == 0) then { _era = 5; }; // default Modern
        
        if (_classes isNotEqualTo []) then {
            _categories pushBack [_key, _displayName, _classes, _types, _era];
        };
    } forEach _extClasses;
};
 */ ///not working atm
_categories // must return the array
//Remmember to update the list @ A3A\addons\scrt\UI\fn_ui_setAvailableBuildingTypes.sqf
//Era Modifiers (Depends on map not modset)

#define BUILDABLES_MODERN_GREEN {"Land_GuardTower_01_F", 300}, {"Land_HBarrier_01_line_3_green_F", 100}, {"Land_HBarrier_01_line_5_green_F", 150}, {"Land_HBarrier_01_line_1_green_F", 50}, {"Land_HBarrier_01_big_4_green_F", 300}, {"Land_HBarrier_01_wall_corridor_green_F", 250}, {"Land_HBarrier_01_wall_corner_green_F", 250}, {"Land_HBarrier_01_wall_6_green_F", 450}, {"Land_HBarrier_01_wall_4_green_F", 400}, {"Land_HBarrier_01_big_tower_green_F", 500}, {"Land_Cargo_House_V1_F", 1500}, {"Land_Cargo_HQ_V1_F", 2500}, {"Land_Cargo_Patrol_V1_F", 2000}, {"Land_Cargo_Tower_V1_F", 3000}

#define BUILDABLES_MODERN_SAND {"Land_GuardTower_01_F", 300}, {"Land_HBarrier_3_F", 100}, {"Land_HBarrier_5_F", 150}, {"Land_HBarrier_1_F", 50}, {"Land_HBarrier_Big_F", 300}, {"Land_HBarrierWall_corridor_F", 250}, {"Land_HBarrierWall_corner_F", 250}, {"Land_HBarrierWall6_F", 450}, {"Land_HBarrierWall4_F", 400}, {"Land_HBarrierTower_F", 500}, {"Land_Cargo_House_V3_F", 1500}, {"Land_Cargo_HQ_V3_F", 2500}, {"Land_Cargo_Patrol_V3_F", 2000}, {"Land_Cargo_Tower_V3_F", 3000}

#define BUILDABLES_HISTORIC {"Land_Tyres_F", 20}, {"Land_Barricade_01_10m_F", 50}, {"Land_Barricade_01_4m_F", 30}, {"Land_DeerStand_01_F", 100}

#define BUILDABLES_SCIFI {"Land_Cargo_Patrol_V2_F", 1000}, {"Land_Cargo_Tower_V2_F", 2000}, {"Land_Cargo_HQ_V2_F", 1500}, {"Land_Cargo_House_V2_F", 500}

//Map Climate Modifiers (What type of terrain is the biggest area of the map)
#define BUILDABLES_ARID {"Land_BagFence_Corner_F", 10}, {"Land_BagFence_End_F", 10}, {"Land_BagFence_Long_F", 30}, {"Land_BagFence_Round_F", 30}, {"Land_BagFence_Short_F", 20}

#define BUILDABLES_TEMPERATE {"Land_BagFence_01_corner_green_F", 10}, {"Land_BagFence_01_end_green_F", 10}, {"Land_BagFence_01_long_green_F", 30}, {"Land_BagFence_01_round_green_F", 30}, {"Land_BagFence_01_short_green_F", 20}

#define BUILDABLES_ARCTIC {"Land_BagFence_Corner_F", 10}, {"Land_BagFence_End_F", 10}, {"Land_BagFence_Long_F", 30}, {"Land_BagFence_Round_F", 30}, {"Land_BagFence_Short_F", 20}

#define BUILDABLES_TROPIC {"Land_BagFence_01_corner_green_F", 10}, {"Land_BagFence_01_end_green_F", 10}, {"Land_BagFence_01_long_green_F", 30}, {"Land_BagFence_01_round_green_F", 30}, {"Land_BagFence_01_short_green_F", 20}

//Modlist Modifiers (Only for maps that have dependency mods with usable items in them)
#define BUILDABLES_CUP {"TK_GUE_WarfareBBarrier5x_EP1", 600}, {"TK_GUE_WarfareBBarrier10xTall_EP1", 700}, {"TK_WarfareBBarrier10x_EP1", 650}, {"Land_Misc_deerstand", 60}, {"Land_Hlaska", 120}

#define BUILDABLES_JBAD {"jbad_Wall_L_2m5", 100}, {"jbad_Wall_L_2m5_corner", 75}, {"jbad_Wall_L_2m5_gate", 75}, {"jbad_wall_l_5m", 150}, {"jbad_wall_L_5m_hole_big", 125}

//cDLC Modifiers (For cDLC dependent maps)
#define BUILDABLES_SPE {"Land_SPE_Sandbag_Curve", 235}, {"Land_SPE_Sandbag_Long", 100}, {"Land_SPE_Sandbag_Long_Line", 50}, {"Land_SPE_Sandbag_Long_Thick", 200}, {"Land_SPE_Sandbag_Nest", 150}, {"Land_SPE_Sandbag_Short", 50}, {"Land_SPE_Sandbag_Short_Low", 35}, {"Land_SPE_Covered_Pallets_02", 20}, {"Land_SPE_Wood_TrenchLogWall_01_4m_v2", 50}, {"Land_SPE_Wood_TrenchLogWall_01_4m_v1", 30}, {"Land_SPE_Tent_02", 250}, {"Land_SPE_Straw_Bale_Stack_02", 425}, {"Land_SPE_Straw_Bale_Stack_01", 105}

#define BUILDABLES_SOGPF {"Land_vn_tent_02_04", 100}, {"Land_vn_b_trench_bunker_05_01", 50}, {"Land_vn_b_trench_bunker_06_02", 75}, {"Land_vn_b_tower_01", 150}, {"Land_vn_b_trench_45_02", 300}, {"Land_vn_b_trench_90_02", 300}, {"Land_vn_b_trench_20_02", 500}, {"Land_vn_b_trench_cross_02", 500}, {"Land_vn_b_trench_firing_04", 200}, {"Land_vn_b_trench_firing_01", 400}, {"Land_vn_b_mortarpit_01", 200}

#define BUILDABLES_GM {"land_gm_sandbags_01_wall_02", 150}, {"land_gm_sandbags_02_bunker_high", 300}, {"land_gm_sandbags_01_round_01", 100}, {"land_gm_woodbunker_01_bags", 400}, {"land_gm_sandbags_01_wall_01", 100}

#define BUILDABLES_WS {"Land_HBarrier_3_lxWS", 100}, {"Land_HBarrier_5_lxWS", 150}, {"Land_HBarrier_1_lxWS", 50}, {"Land_HBarrier_Big_lxWS", 300}, {"Land_HBarrierWall_corridor_lxWS", 250}, {"Land_HBarrierWall_corner_lxWS", 250}, {"Land_HBarrierWall6_lxWS", 450}, {"Land_HBarrierWall4_lxWS", 400}, {"Land_HBarrierTower_lxWS", 500}, {"Land_Mil_WallBig_4m_lxWS", 250}, {"Land_Mil_WallBig_Corner_lxWS", 200}, {"CamoNet_Sand_big_lxWS", 400}, {"CamoNet_Sand_lxWS", 250}

//Ending Build List. (Universal Items)
#define BUILDABLES_UNIVERSAL {"Land_GuardTower_02_F", 150}, {"Land_PortableLight_double_F", 50}, {"Land_LampShabby_F", 75}, {"Land_LampHarbour_F", 100}, {"Land_BarGate_F", 100}, {"Land_SandbagBarricade_01_half_F", 40}, {"Land_SandbagBarricade_01_hole_F", 40}, {"Land_SandbagBarricade_01_F", 40}, {"A3AU_RebHelipad_Square_F", 100}, {"A3AU_RebHelipad_Circle_F", 100}, {"Land_BagBunker_Large_F", 250}, {"Land_BagBunker_Small_F", 150}, {"Land_Bunker_02_light_double_F", 500}, {"Land_GuardBox_01_brown_F", 100}, {"Land_CzechHedgehog_01_new_F", 15}, {"Land_Razorwire_F", 15}

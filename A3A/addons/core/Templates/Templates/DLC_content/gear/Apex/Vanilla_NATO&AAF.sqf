_sfLoadoutData set ["goggles", ["G_Balaclava_Skull1", "G_Balaclava_blk","G_Bandanna_aviator","G_Bandanna_sport","G_Bandanna_shades","G_Combat","G_Goggles_VR","G_Tactical_Clear","G_Tactical_Black","G_Balaclava_TI_blk_F","G_Balaclava_TI_G_blk_F"]];
_sfLoadoutData set ["glasses", ["G_Balaclava_Skull1", "G_Balaclava_blk","G_Bandanna_aviator","G_Bandanna_sport","G_Bandanna_shades","G_Combat","G_Goggles_VR","G_Tactical_Clear","G_Tactical_Black","G_Balaclava_TI_blk_F","G_Balaclava_TI_G_blk_F"]];

_sfLoadoutData set ["NVGs", ["NVGogglesB_gry_F","NVGogglesB_blk_F"]];
(_sfLoadoutData get "helmets") pushBack "H_HelmetB_TI_arid_F";
(_sfLoadoutData get "vests") pushBack "V_PlateCarrier1_rgr_noflag_F";
(_sfLoadoutData get "Hvests") pushBack "V_PlateCarrier2_rgr_noflag_F";
(_sfLoadoutData get "uniforms") append ["U_B_CTRG_Soldier_3_Arid_F", "U_B_CTRG_Soldier_Arid_F", "U_B_CTRG_Soldier_2_Arid_F"];

_eliteLoadoutData set ["goggles", ["G_Balaclava_Skull1", "G_Balaclava_blk","G_Bandanna_aviator","G_Bandanna_sport","G_Bandanna_shades","G_Combat","G_Goggles_VR","G_Tactical_Clear","G_Tactical_Black","G_Balaclava_TI_blk_F","G_Balaclava_TI_G_blk_F"]];
_eliteLoadoutData set ["glasses", ["G_Balaclava_Skull1", "G_Balaclava_blk","G_Bandanna_aviator","G_Bandanna_sport","G_Bandanna_shades","G_Combat","G_Goggles_VR","G_Tactical_Clear","G_Tactical_Black","G_Balaclava_TI_blk_F","G_Balaclava_TI_G_blk_F"]];

_eliteLoadoutData set ["NVGs", ["NVGogglesB_gry_F","NVGogglesB_blk_F"]];
(_eliteLoadoutData get "helmets") pushBack "H_HelmetB_TI_arid_F";
(_eliteLoadoutData get "vests") pushBack "V_PlateCarrier1_rgr_noflag_F";
(_eliteLoadoutData get "Hvests") pushBack "V_PlateCarrier2_rgr_noflag_F";
(_eliteLoadoutData get "uniforms") append ["U_B_CTRG_Soldier_3_Arid_F", "U_B_CTRG_Soldier_Arid_F", "U_B_CTRG_Soldier_2_Arid_F"];


(_militaryLoadoutData get "vests") append ["V_TacChestrig_oli_F", "V_PlateCarrier1_rgr_noflag_F"];
(_militaryLoadoutData get "Hvests") pushBack "V_PlateCarrier2_rgr_noflag_F";
(_militaryLoadoutData get "glVests") pushBack "V_PlateCarrier2_rgr_noflag_F";

(_militiaLoadoutData get "backpacks") append ["B_ViperLightHarness_oli_F","B_ViperHarness_oli_F"];

_helmets append ["H_MilCap_gen_F","H_Beret_gen_F"];
(_policeLoadoutData get "vests") pushBack "V_TacVest_gen_F";
(_policeLoadoutData get "uniforms") append ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"];
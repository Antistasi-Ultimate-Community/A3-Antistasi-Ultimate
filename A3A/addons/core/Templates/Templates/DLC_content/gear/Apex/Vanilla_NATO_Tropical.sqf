_sfLoadoutData set ["NVGs", ["NVGogglesB_gry_F","NVGogglesB_blk_F"]];
(_sfLoadoutData get "uniforms") append ["U_B_CTRG_Soldier_urb_1_F", "U_B_CTRG_Soldier_urb_3_F", "U_B_CTRG_Soldier_urb_2_F"];

_eliteLoadoutData set ["NVGs", ["NVGogglesB_gry_F","NVGogglesB_blk_F"]];
(_eliteLoadoutData get "helmets") pushBack "H_HelmetB_TI_tna_F";
(_eliteLoadoutData get "vests") pushBack "V_PlateCarrier1_rgr_noflag_F";
(_eliteLoadoutData get "Hvests") pushBack "V_PlateCarrier2_rgr_noflag_F";
(_eliteLoadoutData get "uniforms") append ["U_B_CTRG_Soldier_urb_1_F", "U_B_CTRG_Soldier_urb_3_F", "U_B_CTRG_Soldier_urb_2_F","U_B_CTRG_Soldier_F","U_B_CTRG_Soldier_3_F","U_B_CTRG_Soldier_2_F"];

_helmets append ["H_MilCap_gen_F","H_Beret_gen_F"];
(_policeLoadoutData get "vests") pushBack "V_TacVest_gen_F";
(_policeLoadoutData get "uniforms") append ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"];

(_militiaLoadoutData get "vests") pushBack "V_TacChestrig_oli_F";
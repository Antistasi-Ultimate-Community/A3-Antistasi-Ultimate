_sfLoadoutData set ["uniforms", ["U_O_V_Soldier_Viper_hex_F"]];
_sfLoadoutData set ["vests", ["V_Chestrig_khk","V_HarnessO_brn"]];
_sfLoadoutData set ["glVests", ["V_HarnessOGL_brn"]];
_sfLoadoutData set ["Hvests", ["V_TacVest_brn","V_TacVest_khk","V_TacVestIR_blk"]];
_sfLoadoutData set ["backpacks", ["B_ViperHarness_hex_F","B_ViperLightHarness_hex_F"]];
_sfLoadoutData set ["helmets", ["H_HelmetO_ViperSP_hex_F"]];
_sfLoadoutData set ["NVGs", []];
_sfLoadoutData set ["glasses", ["G_Balaclava_TI_blk_F"]];
_sfLoadoutData set ["goggles", ["G_Balaclava_TI_blk_F"]];

_eliteLoadoutData set ["NVGs", ["O_NVGoggles_hex_F","O_NVGoggles_urb_F"]];
(_eliteLoadoutData get "uniforms") pushBack "U_O_V_Soldier_Viper_hex_F";
(_eliteLoadoutData get "backpacks") append ["B_ViperHarness_hex_F","B_ViperLightHarness_hex_F"];
(_eliteLoadoutData get "glasses") append ["G_Balaclava_TI_blk_F"];
(_eliteLoadoutData get "goggles") append ["G_Balaclava_TI_blk_F"];
(_eliteLoadoutData  get "vests") pushBack "V_TacChestrig_cbr_F";


(_militaryLoadoutData  get "vests") pushBack "V_TacChestrig_cbr_F";

_helmets append ["H_MilCap_gen_F","H_Beret_gen_F"];

(_militiaLoadoutData get "backpacks") append ["B_ViperLightHarness_oli_F","B_ViperHarness_oli_F"];

_helmets append ["H_MilCap_gen_F","H_Beret_gen_F"];
(_policeLoadoutData get "vests") pushBack "V_TacVest_gen_F";
(_policeLoadoutData get "uniforms") append ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"];
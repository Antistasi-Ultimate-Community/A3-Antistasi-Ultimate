(_loadoutData get "goggles") append [
	"G_AirPurifyingRespirator_02_olive_F", 1,
	"G_RegulatorMask_F", 1
];
//////////////////////////////////////////////////////
(_sfLoadoutData get "uniforms") append [
	"U_O_R_Gorka_01_F", 3,
	"U_I_CBRN_Suit_01_AAF_F", 1
];
(_sfLoadoutData get "vests") append [
	"V_CarrierRigKBT_01_light_Olive_F", 2,
	"V_CarrierRigKBT_01_Olive_F", 2,
	"V_SmershVest_01_F", 0.5, // The smersh vests have no armor so making them uncommon.
	"V_SmershVest_01_radio_F", 0.5
];
(_sfLoadoutData get "Hvests") append [
	"V_CarrierRigKBT_01_heavy_Olive_F", 6
];
(_sfLoadoutData get "helmets") append [
	"H_HelmetHBK_F", 4, 
	"H_HelmetHBK_ear_F", 0.25, 
	"H_HelmetHBK_headset_F", 0.25, 
	"H_HelmetHBK_chops_F", 0.25, 
	"H_HelmetAggressor_F", 1.25, 
	"H_HelmetAggressor_cover_F", 1.25
];
//////////////////////////////////////////////////////
(_eliteLoadoutData get "uniforms") append [
	"U_O_R_Gorka_01_F", 2
];
(_eliteLoadoutData get "vests") append [
	"V_CarrierRigKBT_01_light_Olive_F", 3, 
	"V_CarrierRigKBT_01_Olive_F", 3
];
(_eliteLoadoutData get "Hvests") append [
	"V_CarrierRigKBT_01_heavy_Olive_F", 4
];
(_eliteLoadoutData get "helmets") append [
	"H_HelmetHBK_F", 4.5,
	"H_HelmetHBK_ear_F", 0.5,
	"H_HelmetHBK_headset_F", 0.5,
	"H_HelmetHBK_chops_F", 0.5,
	"H_HelmetAggressor_F", 1.5,
	"H_HelmetAggressor_cover_F", 1.5
];
//////////////////////////////////////////////////////
(_militaryLoadoutData get "vests") append [
	"V_CarrierRigKBT_01_light_Olive_F", 3,
	"V_CarrierRigKBT_01_Olive_F", 3
];
(_militaryLoadoutData get "helmets") append [
	"H_HelmetHBK_F", 3, 
	"H_HelmetHBK_headset_F", 0.5
];

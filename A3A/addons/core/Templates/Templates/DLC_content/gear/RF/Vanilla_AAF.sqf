(_sfLoadoutData get "backpacks") append [
	"B_DuffleBag_Olive_NoLogo_RF", 1.5
];
(_sfLoadoutData get "helmets") append [
	"H_HelmetIA_sb_digital_RF", 5,
	"H_HelmetHeavy_Olive_RF", 2,
	"H_HelmetHeavy_Simple_Olive_RF", 1.25,
	"H_HelmetHeavy_VisorUp_Olive_RF", 1.25
];
//////////////////////////////////////////////////////
(_eliteLoadoutData get "backpacks") append ["B_DuffleBag_Olive_NoLogo_RF", 1.5,"I_CommandoMortar_weapon_RF", 0.25];
(_eliteLoadoutData get "helmets") append [
	"H_HelmetIA_sb_digital_RF", 5,
	"H_HelmetHeavy_Olive_RF", 1.34,
	"H_HelmetHeavy_Simple_Olive_RF", 1.33,
	"H_HelmetHeavy_VisorUp_Olive_RF", 1.33
];
//////////////////////////////////////////////////////
(_militaryLoadoutData get "vests") append [
	"V_TacVest_rig_oli_RF", 1
];
(_militaryLoadoutData get "helmets") append [
	"H_HelmetIA_sb_digital_RF", 4.5
];
//////////////////////////////////////////////////////
(_militiaLoadoutData get "vests") append [
	"V_TacVest_rig_oli_RF", 1.75
];
(_militiaLoadoutData get "Hvests") append [
	"V_TacVest_rig_oli_RF", 7.5
];
(_militiaLoadoutData get "helmets") append [
	"H_HelmetIA_sb_digital_RF", 0.5
];
//////////////////////////////////////////////////////
(_pilotLoadoutData get "uniforms") append [
	"U_C_HeliPilotCoveralls_Green_RF", 2.5
];

//Gendarmerie vest w/holster only makes sense to add if Apex also enabled
if (_hasApex) then {
	(_policeLoadoutData get "vests") append [
		"V_TacVest_gen_holster_RF", 4
	];
};


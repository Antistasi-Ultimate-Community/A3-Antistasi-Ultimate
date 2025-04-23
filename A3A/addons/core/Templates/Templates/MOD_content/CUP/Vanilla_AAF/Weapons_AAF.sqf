_cupRPGOptics = ["CUP_optic_PGO7V", 3, "CUP_optic_PGO7V2", 2, "CUP_optic_PGO7V3", 1];

(_loadoutData get "lightATLaunchers") append [
    ["CUP_launch_BF3", "", "", "", [], [], ""], 0.5,
    ["CUP_launch_M136", "", "", "", [], [], ""], 2.5,
    ["CUP_launch_M72A6", "", "", "", [""], [], ""], 5,
	["CUP_launch_HCPF3", "", "", "", [], [], ""], 0.5,
	["CUP_launch_PzF3", "", "", "", [], [], ""], 1,
	["CUP_launch_RPG7V", "", "", _cupRPGOptics, ["CUP_OG7_M","CUP_PG7V_M","CUP_PG7VL_M"], [], ""], 1.75,
	["CUP_launch_RPG7V", "", "", _cupRPGOptics, ["CUP_PG7VM_M","RPG7_F","CUP_PG7VR_M"], [], ""], 0.5,
	["CUP_launch_RPG7V", "", "", _cupRPGOptics, ["CUP_TBG7V_M","CUP_TBG7V_M","CUP_OG7_M"], [], ""], 0.25
];

_cupMAAAWSOptics = ["CUP_optic_MAAWS_Scope", 2, "", 1];
_cupSMAWOptics = ["CUP_optic_ACOG_TA01NSN_RMR_OD", 2, "", 1];

(_loadoutData get "ATLaunchers") append [
    ["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M", "CUP_Javelin_M"], [], ""], 0.5,
    ["CUP_launch_M47", "", "", "", ["CUP_Dragon_EP1_M", "CUP_Dragon_EP1_M"], [], ""], 2,
	["CUP_launch_APILAS", "", "", "", ["CUP_APILAS_M", "CUP_APILAS_M"], [], ""], 1,
	["CUP_launch_MAAWS", "", "", _cupMAAAWSOptics, ["CUP_MAAWS_HEDP_M", "CUP_MAAWS_HEAT_M"], [], ""], 2.5,
	["CUP_launch_Mk153Mod0", "", "", _cupSMAWOptics, ["CUP_SMAW_HEDP_M", "CUP_SMAW_HEAA_M", "CUP_SMAW_NE_M"], [], ""], 1.75,
	["CUP_launch_Mk153Mod0_blk", "", "", _cupSMAWOptics, ["CUP_SMAW_HEDP_M", "CUP_SMAW_HEAA_M", "CUP_SMAW_NE_M"], [], ""], 0.75
];

(_loadoutData get "AALaunchers") append [
    ["CUP_launch_9K32Strela", "", "", "", [], [], ""], 1,
	["CUP_launch_Igla", "", "", "", [], [], ""], 1,
	["CUP_launch_FIM92Stinger", "", "", "", [], [], ""], 5
];

////////////////////////////////////

_cupSFSlRifleOptics = ["CUP_optic_Elcan_SpecterDR_KF_RMR_od", 7, "CUP_optic_Elcan_SpecterDR_RMR_od", 3];
_cupSFSlRifleOptics_XM8 = ["CUP_optic_AMO_PCAP_green", 4, "CUP_optic_ISM_PCAP_green", 6];

_cupSFXM8Attachments = ["CUP_acc_ANPEQ_15_Flashlight_OD_L", 6, "CUP_acc_ANPEQ_15_OD", 4];


(_sfLoadoutData get "slRifles") append [
    ["CUP_arifle_XM8_Carbine_GL_Rail_Green", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments, _cupSFSlRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 3,
	["CUP_arifle_XM8_Carbine_GL_Rail", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments, _cupSFSlRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 3,

	["CUP_arifle_XM8_Carbine_GL_Green", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments, _cupSFSlRifleOptics_XM8,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 1.5,
	["CUP_arifle_XM8_Carbine_GL", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFSlRifleOptics_XM8 ,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 1.5,

	["CUP_arifle_xm29_olive", "CUP_muzzle_snds_G36_black",_cupSFXM8Attachments,"",["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green"], ["CUP_6Rnd_HE_Grenade_M","CUP_6Rnd_HE_Grenade_M"], ""], 2.25,
	["CUP_arifle_xm29_blk", "UP_muzzle_snds_G36_black",_cupSFXM8Attachments,"",["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green"], ["CUP_6Rnd_HE_Grenade_M","CUP_6Rnd_HE_Grenade_M"], ""], 2.25

];

_cupSFRifleOptics = ["CUP_optic_Elcan_SpecterDR_KF_RMR_od", 6, "CUP_optic_Elcan_SpecterDR_RMR_od", 2, "CUP_optic_HensoldtZO_low_RDS_od", 4];
_cupSFRifleOptics_XM8 = ["CUP_optic_AMO_PCAP_green", 6, "CUP_optic_ISM_PCAP_green", 2];

(_sfLoadoutData get "rifles") append [
    ["CUP_arifle_XM8_Sharpshooter_FG_Rail_Green", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,
	["CUP_arifle_XM8_Sharpshooter_FG_Rail", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,
	["CUP_arifle_XM8_Sharpshooter_Rail_Green", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,
	["CUP_arifle_XM8_Sharpshooter_Rail", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,

	["CUP_arifle_XM8_Sharpshooter_FG_Green", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics_XM8,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,
	["CUP_arifle_XM8_Sharpshooter_FG", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics_XM8,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,
	["CUP_arifle_XM8_Sharpshooter_Green", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics_XM8,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,
	["CUP_arifle_XM8_Sharpshooter", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics_XM8,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 1
];

(_sfLoadoutData get "machineGuns") append [
    ["CUP_arifle_XM8_SAW_FG_Rail_Green", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,
	["CUP_arifle_XM8_SAW_FG_Rail", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,
	["CUP_arifle_XM8_SAW_Rail_Green", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,
	["CUP_arifle_XM8_SAW_Rail", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,

	["CUP_arifle_XM8_SAW_FG_Green", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics_XM8,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,
	["CUP_arifle_XM8_SAW_Green", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics_XM8,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,
	["CUP_arifle_XM8_SAW_FG", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics_XM8,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,
	["CUP_arifle_XM8_SAW", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics_XM8,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_od"], 1
];
(_sfLoadoutData get "carbines") append [
	["CUP_arifle_XM8_Carbine_FG_Rail_Green","CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], ""], 2,
	["CUP_arifle_XM8_Carbine_FG_Rail","CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], ""], 2,
	["CUP_arifle_XM8_Carbine_Rail_Green","CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,
	["CUP_arifle_XM8_Railed","CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,

	["CUP_arifle_XM8_Carbine_FG_Green","CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics_XM8 ,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,
	["CUP_arifle_XM8_Carbine_FG","CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics_XM8 ,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,
	["CUP_arifle_XM8_Carbine_Green","CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics_XM8 ,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,
	["CUP_arifle_XM8_Carbine","CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics_XM8 ,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,

	["CUP_arifle_xm29_ke_rail_olive","CUP_muzzle_snds_G36_black",_cupSFXM8Attachments,_cupSFRifleOptics_XM8 ,["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"], [], ""], 0.75,
	["CUP_arifle_xm29_ke_rail_blk","CUP_muzzle_snds_G36_black",_cupSFXM8Attachments,_cupSFRifleOptics_XM8 ,["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"], [], ""], 0.75,
	["CUP_arifle_xm29_ke_olive","CUP_muzzle_snds_G36_black",_cupSFXM8Attachments,"CUP_optic_G36Optics_RDS_3D",["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"], [], ""], 0.5,
	["CUP_arifle_xm29_ke_blk","CUP_muzzle_snds_G36_black",_cupSFXM8Attachments,"CUP_optic_G36Optics_RDS_3D",["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"], [], ""], 0.5
];
(_sfLoadoutData get "grenadeLaunchers") append [
    ["CUP_arifle_XM8_Carbine_GL_Rail_Green", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 3,
	["CUP_arifle_XM8_Carbine_GL_Rail", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 3,

	["CUP_arifle_XM8_Carbine_GL_Green", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics_XM8 ,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 1.5,
	["CUP_arifle_XM8_Carbine_GL", "CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics_XM8 ,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 1.5,

	["CUP_arifle_xm29_olive", "CUP_muzzle_snds_G36_black",_cupSFXM8Attachments,"",["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green"], ["CUP_6Rnd_HE_Grenade_M","CUP_6Rnd_HE_Grenade_M"], ""], 1,
	["CUP_arifle_xm29_blk", "CUP_muzzle_snds_G36_black",_cupSFXM8Attachments,"",["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green"], ["CUP_6Rnd_HE_Grenade_M","CUP_6Rnd_HE_Grenade_M"], ""], 1
];

_cupSFBlackAttachments = ["CUP_acc_ANPEQ_15_Top_Flashlight_Black_L", 2, "CUP_acc_ANPEQ_15_Flashlight_Black_L", 1];

(_sfLoadoutData get "marksmanRifles") append [
    ["CUP_srifle_RSASS_Jungle","CUP_muzzle_snds_socom762rc",_cupSFXM8Attachments,"CUP_optic_SB_11_4x20_PM_od",["CUP_20Rnd_762x51_B_M110","CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_762x51_B_M110","CUP_20Rnd_TE1_Green_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_od"], 3,
	["CUP_srifle_RSASS_Black","CUP_muzzle_snds_socom762rc",_cupSFXM8Attachments,"CUP_optic_SB_11_4x20_PM_od",["CUP_20Rnd_762x51_B_M110","CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_762x51_B_M110","CUP_20Rnd_TE1_Green_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,

	["CUP_srifle_Mk12SPR","CUP_muzzle_snds_Mk12",_cupSFBlackAttachments,"CUP_optic_SB_11_4x20_PM",["CUP_20Rnd_556x45_Stanag","CUP_20Rnd_556x45_Stanag_Tracer_Green","CUP_20Rnd_556x45_Stanag","CUP_20Rnd_556x45_Stanag_Tracer_Green"], [], "CUP_bipod_VLTOR_Modpod_black"], 0.5,

	["CUP_srifle_M110_black","CUP_muzzle_snds_M110_black",_cupSFBlackAttachments,"CUP_optic_SB_11_4x20_PM",["CUP_20Rnd_762x51_B_M110","CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_762x51_B_M110","CUP_20Rnd_TE1_Green_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"], 4,
	["CUP_srifle_m110_kac_black","CUP_muzzle_snds_M110_black",_cupSFBlackAttachments,"CUP_optic_SB_11_4x20_PM",["CUP_20Rnd_762x51_B_M110","CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_762x51_B_M110","CUP_20Rnd_TE1_Green_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"], 2.5
];

_cupSFSniperOptics = ["CUP_optic_LeupoldMk4_20x40_LRT", 5, "CUP_optic_LeupoldMk4", 1, "CUP_optic_LeupoldM3LR", 2];

(_sfLoadoutData get "sniperRifles") append [
    ["CUP_srifle_M2010_blk","muzzle_snds_B","acc_pointer_IR",_cupSFSniperOptics,["CUP_5Rnd_762x67_M2010_M","CUP_5Rnd_762x67_M2010_M","CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"], 3,

	["CUP_srifle_M107_Pristine","CUP_muzzle_mfsup_Suppressor_M107_Black","",_cupSFSniperOptics,["CUP_10Rnd_127x99_M107","CUP_10Rnd_127x99_M107","CUP_10Rnd_127x99_M107"], [], "CUP_bipod_VLTOR_Modpod_black"], 2.5,
	["CUP_srifle_M107_Base","CUP_muzzle_mfsup_Suppressor_M107_Black","",_cupSFSniperOptics,["CUP_10Rnd_127x99_M107","CUP_10Rnd_127x99_M107","CUP_10Rnd_127x99_M107"], [], "CUP_bipod_VLTOR_Modpod_black"], 2.5,

	["CUP_srifle_AWM_blk","CUP_muzzle_snds_AWM","",_cupSFSniperOptics,["CUP_5Rnd_86x70_L115A1","CUP_5Rnd_86x70_L115A1","CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"], 2,
	["CUP_srifle_AWM_wdl","CUP_muzzle_snds_AWM","",_cupSFSniperOptics,["CUP_5Rnd_86x70_L115A1","CUP_5Rnd_86x70_L115A1","CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"], 2,

	["CUP_srifle_G22_blk","CUP_muzzle_snds_AWM","",_cupSFSniperOptics,["CUP_5Rnd_762x67_G22","CUP_5Rnd_762x67_G22", "CUP_5Rnd_762x67_G22","CUP_5Rnd_762x67_G22"], [], "CUP_bipod_VLTOR_Modpod_black"], 0.75,
	["CUP_srifle_G22_wdl","CUP_muzzle_snds_AWM","",_cupSFSniperOptics,["CUP_5Rnd_762x67_G22","CUP_5Rnd_762x67_G22", "CUP_5Rnd_762x67_G22","CUP_5Rnd_762x67_G22"], [], "CUP_bipod_VLTOR_Modpod_black"], 0.75,

	["CUP_srifle_AS50","","CUP_acc_ANPEQ_15_Black",_cupSFSniperOptics,["CUP_5Rnd_127x99_as50_M","CUP_5Rnd_127x99_as50_M", "CUP_5Rnd_127x99_as50_M","CUP_5Rnd_127x99_as50_M"], [], ""], 4
];
(_sfLoadoutData get "designatedGrenadeLaunchers") append [
    ["CUP_glaunch_6G30", "", "", "", ["CUP_6Rnd_HE_GP25_M"], [], ""], 2
];

(_sfLoadoutData get "SMGs") append [
    ["CUP_arifle_XM8_Compact_FG_Rail_Green","CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], ""], 2,
	["CUP_arifle_XM8_Compact_FG_Rail","CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], ""], 2,
	["CUP_arifle_XM8_Compact_Rail_Green","CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,
	["CUP_arifle_XM8_Compact_Rail","CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,

	["CUP_arifle_XM8_Compact_FG_Green","CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics_XM8,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], ""], 1.25,
	["CUP_arifle_XM8_Compact_FG","CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics_XM8,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], ""], 1.25,
	["CUP_arifle_XM8_Compact_Green","CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics_XM8,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 0.75,
	["CUP_arifle_XM8_Compact","CUP_muzzle_snds_XM8",_cupSFXM8Attachments,_cupSFRifleOptics_XM8,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 0.75,

	["CUP_smg_PS90_olive","muzzle_snds_570","CUP_acc_ANPEQ_15_Top_Flashlight_OD_L","CUP_optic_Eotech553_OD",["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","CUP_50Rnd_570x28_Green_Tracer_P90_M","CUP_50Rnd_570x28_Green_Tracer_P90_M"], [], ""], 1,
	["CUP_smg_EVO","CUP_muzzle_snds_MP5","CUP_acc_ANPEQ_15_Flashlight_Black_L","CUP_optic_HoloBlack",["CUP_30Rnd_9x19_EVO","CUP_30Rnd_9x19_EVO","CUP_30Rnd_9x19_EVO","CUP_30Rnd_9x19_EVO"], [], ""], 3
];
////////////////////////////////////////////////
_cupEliteGreenAttachments = ["CUP_acc_ANPEQ_15_Flashlight_OD_L", 3, "CUP_acc_ANPEQ_15_OD", 2];
_cupEliteAttachments = ["CUP_acc_ANPEQ_2_grey", 2, "CUP_acc_ANPEQ_15_black", 1.5, "CUP_acc_ANPEQ_15_Flashlight_Black_L", 3];

_cupEliteGreenSlOptics = ["CUP_optic_Elcan_SpecterDR_KF_RMR_od", 1, "CUP_optic_Elcan_SpecterDR_RMR_od", 1.5, "CUP_optic_Elcan_SpecterDR_od", 3, "CUP_optic_Elcan_SpecterDR_KF_od", 0.5];
_cupEliteSlOptics = ["CUP_optic_HensoldtZO_RDS", 2.5, "CUP_optic_Elcan_SpecterDR_KF_RMR_black", 0.75, "CUP_optic_Elcan_SpecterDR_RMR_black", 2, "CUP_optic_Elcan_SpecterDR_black", 4, "CUP_optic_Elcan_SpecterDR_KF_black", 0.5];
_cupEliteXM8SlOptics = ["CUP_optic_AMO_PCAP", 5, "CUP_optic_ISM_PCAP", 2];

(_eliteLoadoutData get "slRifles") append [
    ["CUP_arifle_XM8_Carbine_GL_Rail_Green", "",_cupEliteGreenAttachments,_cupEliteGreenSlOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 3,
	["CUP_arifle_XM8_Carbine_GL_Rail", "",_cupEliteAttachments,_cupEliteSlOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 1.5,
	["CUP_arifle_XM8_Carbine_GL_Green", "",_cupEliteGreenAttachments,_cupEliteXM8SlOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 1.5,
	["CUP_arifle_XM8_Carbine_GL", "",_cupEliteAttachments,_cupEliteXM8SlOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 0.75,

	["CUP_arifle_xm29_olive", "",_cupEliteGreenAttachments,"",["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green"], ["CUP_6Rnd_HE_Grenade_M","CUP_6Rnd_HE_Grenade_M"], ""], 0.75,
	["CUP_arifle_xm29_blk", "",_cupEliteAttachments,"",["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green"], ["CUP_6Rnd_HE_Grenade_M","CUP_6Rnd_HE_Grenade_M"], ""], 0.25,

	["CUP_arifle_Mk17_STD_EGLM_woodland", "",_cupEliteGreenAttachments,_cupEliteGreenSlOptics,["CUP_50Rnd_762x51_B_SCAR","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 0.25,
	["CUP_arifle_Mk17_STD_EGLM_black", "",_cupEliteAttachments,_cupEliteSlOptics,["CUP_50Rnd_762x51_B_SCAR","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 0.1,

	["CUP_arifle_Mk17_CQC_EGLM_woodland", "",_cupEliteGreenAttachments,_cupEliteGreenSlOptics,["CUP_50Rnd_762x51_B_SCAR","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 0.75,
	["CUP_arifle_Mk17_CQC_EGLM_black", "",_cupEliteAttachments,_cupEliteSlOptics,["CUP_50Rnd_762x51_B_SCAR","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 0.25,
	
	["CUP_arifle_Mk16_STD_EGLM_woodland", "",_cupEliteGreenAttachments,_cupEliteGreenSlOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_60Rnd_556x45_SureFire"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 1,
	["CUP_arifle_Mk16_STD_EGLM_black", "",_cupEliteAttachments,_cupEliteSlOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_60Rnd_556x45_SureFire"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 0.5,
	
	["CUP_arifle_Mk16_CQC_EGLM_woodland", "",_cupEliteGreenAttachments,_cupEliteGreenSlOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_60Rnd_556x45_SureFire"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 1.5,
	["CUP_arifle_Mk16_CQC_EGLM_black", "",_cupEliteAttachments,_cupEliteSlOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_60Rnd_556x45_SureFire"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 0.75,
	
	["CUP_arifle_HK_M27_AG36", "",_cupEliteAttachments,_cupEliteSlOptics,["CUP_30Rnd_556x45_Emag","CUP_30Rnd_556x45_Emag","CUP_30Rnd_556x45_Emag_Tracer_Green","CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 1,
	
	["CUP_CZ_BREN2_556_14_GL_Grn", "",_cupEliteGreenAttachments,_cupEliteSlOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 1,
	["CUP_CZ_BREN2_556_14_GL", "",_cupEliteAttachments,_cupEliteSlOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 0.5,

	["CUP_CZ_BREN2_556_11_GL_Grn", "",_cupEliteGreenAttachments,_cupEliteSlOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 0.75,
	["CUP_CZ_BREN2_556_11_GL", "",_cupEliteAttachments,_cupEliteSlOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 0.25,

	["CUP_CZ_BREN2_762_14_GL_Grn", "",_cupEliteGreenAttachments,_cupEliteSlOptics,["CUP_30Rnd_762x39_CZ807","CUP_30Rnd_762x39_CZ807","CUP_30Rnd_TE1_Green_Tracer_762x39_CZ807"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 0.5,
	["CUP_CZ_BREN2_762_14_GL", "",_cupEliteAttachments,_cupEliteSlOptics,["CUP_30Rnd_762x39_CZ807","CUP_30Rnd_762x39_CZ807","CUP_30Rnd_TE1_Green_Tracer_762x39_CZ807"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 0.25,

	["CUP_arifle_CZ805_GL_blk", "",_cupEliteAttachments,_cupEliteSlOptics,["CUP_30Rnd_556x45_CZ805","CUP_30Rnd_556x45_CZ805","CUP_30Rnd_TE1_Green_Tracer_556x45_CZ805","CUP_30Rnd_TE1_Green_Tracer_556x45_CZ805"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 1,

	["CUP_arifle_ACRC_EGLM_blk_68", "",_cupEliteAttachments,_cupEliteSlOptics,["CUP_30Rnd_680x43_Stanag","CUP_30Rnd_680x43_Stanag","CUP_30Rnd_680x43_Stanag","CUP_30Rnd_680x43_Stanag_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 2,
	["CUP_arifle_ACRC_EGLM_blk_556", "",_cupEliteAttachments,_cupEliteSlOptics,["CUP_30Rnd_556x45_PMAG_BLACK_PULL","CUP_30Rnd_556x45_PMAG_BLACK_PULL","CUP_30Rnd_556x45_PMAG_BLACK_PULL_Tracer_Green","CUP_30Rnd_556x45_PMAG_BLACK_PULL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 0.75,

	["CUP_arifle_ACR_EGLM_blk_68", "",_cupEliteAttachments,_cupEliteSlOptics,["CUP_30Rnd_680x43_Stanag","CUP_30Rnd_680x43_Stanag","CUP_30Rnd_680x43_Stanag","CUP_30Rnd_680x43_Stanag_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 1.5,
	["CUP_arifle_ACR_EGLM_blk_556", "",_cupEliteAttachments,_cupEliteSlOptics,["CUP_30Rnd_556x45_PMAG_BLACK_PULL","CUP_30Rnd_556x45_PMAG_BLACK_PULL","CUP_30Rnd_556x45_PMAG_BLACK_PULL_Tracer_Green","CUP_30Rnd_556x45_PMAG_BLACK_PULL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 0.5
];

_cupEliteRifleOptics = ["CUP_optic_HensoldtZO_RDS", 0.75, "CUP_optic_HensoldtZO_", 1.25, "CUP_optic_Elcan_SpecterDR_KF_RMR_black", 0.75, "CUP_optic_Elcan_SpecterDR_RMR_black", 1.5, "CUP_optic_Elcan_SpecterDR_black", 2, "CUP_optic_Elcan_SpecterDR_KF_black", 0.5, "CUP_optic_ACOG_TA01B_RMR_Black", 1, "CUP_optic_ACOG_TA01B_Black", 2, "CUP_optic_AIMM_M68_BLK", 1, "CUP_optic_CompM2_low", 3.5, "CUP_optic_G33_HWS_BLK", 0.75, "CUP_optic_Eotech553_Black", 3];
_cupEliteGreenRifleOptics = ["CUP_optic_HensoldtZO_RDS_OD", 0.75, "CUP_optic_HensoldtZO_OD", 1.25,"CUP_optic_Elcan_SpecterDR_KF_RMR_od", 0.75, "CUP_optic_Elcan_SpecterDR_RMR_od", 1.25, "CUP_optic_Elcan_SpecterDR_od", 2.5, "CUP_optic_Elcan_SpecterDR_KF_od", 0.5, "CUP_optic_ACOG_TA01B_RMR_OD", 1, "CUP_optic_ACOG_TA01B_OD", 2, "CUP_optic_AIMM_M68_OD", 1, "CUP_optic_CompM2_low_OD", 3];
_cupEliteXM8Optics = ["CUP_optic_AMO_PCAP", 3, "CUP_optic_ISM_PCAP", 2, "CUP_optic_RCO_PCAP", 0.5];

_eliteRifleOptics append ["CUP_optic_HensoldtZO_RDS", 0.5, "CUP_optic_HensoldtZO_", 1, "CUP_optic_Elcan_SpecterDR_KF_RMR_black", 0.75, "CUP_optic_Elcan_SpecterDR_RMR_black", 1.5, "CUP_optic_Elcan_SpecterDR_black", 2.5, "CUP_optic_Elcan_SpecterDR_KF_black", 0.5, "CUP_optic_ACOG_TA01B_RMR_Black", 0.75, "CUP_optic_ACOG_TA01B_Black", 2, "CUP_optic_AIMM_M68_BLK", 1, "CUP_optic_CompM2_low", 3.5, "CUP_optic_G33_HWS_BLK", 0.75, "CUP_optic_Eotech553_Black", 2.5];

_cupEliteRifleBipods = ["CUP_bipod_VLTOR_Modpod_black", 1, "", 2];
_cupEliteGreenRifleBipods = ["CUP_bipod_VLTOR_Modpod_od", 1, "", 2];

(_eliteLoadoutData get "rifles") append [
    ["CUP_arifle_XM8_Sharpshooter_FG_Rail_Green", "",_cupEliteGreenAttachments ,_cupEliteGreenRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], _cupEliteGreenRifleBipods], 1,
	["CUP_arifle_XM8_Sharpshooter_Rail_Green", "",_cupEliteGreenAttachments ,_cupEliteGreenRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], _cupEliteGreenRifleBipods], 3,
	["CUP_arifle_XM8_Sharpshooter_FG_Rail", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], _cupEliteRifleBipods], 0.75,
	["CUP_arifle_XM8_Sharpshooter_Rail", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], _cupEliteRifleBipods], 1.5,
	["CUP_arifle_XM8_Sharpshooter_FG_Green", "",_cupEliteGreenAttachments ,_cupEliteXM8Optics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], _cupEliteGreenRifleBipods], 0.25,
	["CUP_arifle_XM8_Sharpshooter_FG", "",_cupEliteAttachments,_cupEliteXM8Optics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], _cupEliteRifleBipods], 0.5,
	["CUP_arifle_XM8_Sharpshooter_Green", "",_cupEliteGreenAttachments ,_cupEliteXM8Optics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], _cupEliteGreenRifleBipods], 0.75,
	["CUP_arifle_XM8_Sharpshooter", "",_cupEliteAttachments,_cupEliteXM8Optics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], _cupEliteRifleBipods], 1.5,

	["CUP_arifle_Mk20_woodland", "",_cupEliteGreenAttachments ,_cupEliteGreenRifleOptics ,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], "CUP_bipod_VLTOR_Modpod_od"], 0.2,
	["CUP_arifle_Mk20_black", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], "CUP_bipod_VLTOR_Modpod_black"], 0.1,

	["CUP_arifle_Mk17_STD_SFG_woodland", "",_cupEliteGreenAttachments ,_cupEliteGreenRifleOptics ,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], ""], 0.2,
	["CUP_arifle_Mk17_STD_SFG_black", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], ""], 0.1,

	["CUP_arifle_Mk17_STD_FG_woodland", "",_cupEliteGreenAttachments ,_cupEliteGreenRifleOptics ,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], _cupEliteGreenRifleBipods], 0.2,
	["CUP_arifle_Mk17_STD_FG_black", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], _cupEliteRifleBipods], 0.1,

	["CUP_arifle_Mk17_STD_woodland", "",_cupEliteGreenAttachments ,_cupEliteGreenRifleOptics ,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], _cupEliteGreenRifleBipods], 0.75,
	["CUP_arifle_Mk17_STD_black", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], _cupEliteRifleBipods], 0.25,
	
	["CUP_arifle_Mk17_STD_AFG_woodland", "",_cupEliteGreenAttachments ,_cupEliteGreenRifleOptics ,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], _cupEliteGreenRifleBipods], 0.2,
	["CUP_arifle_Mk17_STD_AFG_black", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], _cupEliteRifleBipods], 0.1,

	["CUP_arifle_Mk16_SV_woodland", "",_cupEliteGreenAttachments ,_cupEliteGreenRifleOptics ,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], [], _cupEliteGreenRifleBipods], 0.5,
	["CUP_arifle_Mk16_SV_black", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], [], _cupEliteRifleBipods], 0.25,

	["CUP_arifle_Mk16_STD_SFG_woodland", "",_cupEliteGreenAttachments ,_cupEliteGreenRifleOptics ,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], [], ""], 0.5,
	["CUP_arifle_Mk16_STD_SFG_black", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], [], ""], 0.25,

	["CUP_arifle_Mk16_STD_FG_woodland", "",_cupEliteGreenAttachments ,_cupEliteGreenRifleOptics ,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], [], _cupEliteGreenRifleBipods], 0.5,
	["CUP_arifle_Mk16_STD_FG_black", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], [], _cupEliteRifleBipods], 0.25,

	["CUP_arifle_Mk16_STD_woodland", "",_cupEliteGreenAttachments ,_cupEliteGreenRifleOptics ,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], [], _cupEliteGreenRifleBipods], 1.75,
	["CUP_arifle_Mk16_STD_black", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], [], _cupEliteRifleBipods], 0.75,

	["CUP_arifle_Mk16_STD_AFG_woodland", "",_cupEliteGreenAttachments ,_cupEliteGreenRifleOptics ,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], [], ""], 0.5,
	["CUP_arifle_Mk16_STD_AFG_black", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], [], ""], 0.25,
	
	["CUP_arifle_HK_M27_VFG", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_Emag","CUP_30Rnd_556x45_Emag","CUP_30Rnd_556x45_Emag_Tracer_Green","CUP_30Rnd_556x45_Emag_Tracer_Green"], [], _cupEliteRifleBipods], 0.25,
	["CUP_arifle_HK_M27", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_Emag","CUP_30Rnd_556x45_Emag","CUP_30Rnd_556x45_Emag_Tracer_Green","CUP_30Rnd_556x45_Emag_Tracer_Green"], [], _cupEliteRifleBipods], 1,

	["CUP_CZ_BREN2_556_14_Grn", "",_cupEliteGreenAttachments ,_cupEliteRifleOptics ,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], [], _cupEliteGreenRifleBipods], 1,
	["CUP_CZ_BREN2_556_14", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], [], _cupEliteRifleBipods], 0.5,

	["CUP_CZ_BREN2_556_11_Grn", "",_cupEliteGreenAttachments ,_cupEliteRifleOptics ,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], [], _cupEliteGreenRifleBipods], 0.75,
	["CUP_CZ_BREN2_556_11", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], [], _cupEliteRifleBipods], 0.25,

	["CUP_CZ_BREN2_762_14_Grn", "",_cupEliteGreenAttachments ,_cupEliteRifleOptics ,["CUP_30Rnd_762x39_CZ807","CUP_30Rnd_762x39_CZ807","CUP_30Rnd_TE1_Green_Tracer_762x39_CZ807","CUP_30Rnd_TE1_Green_Tracer_762x39_CZ807"], [], _cupEliteGreenRifleBipods], 0.5,
	["CUP_CZ_BREN2_762_14", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_762x39_CZ807","CUP_30Rnd_762x39_CZ807","CUP_30Rnd_TE1_Green_Tracer_762x39_CZ807","CUP_30Rnd_TE1_Green_Tracer_762x39_CZ807"], [], _cupEliteRifleBipods], 0.25,

	["CUP_arifle_CZ805_A2_blk", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_CZ805","CUP_30Rnd_556x45_CZ805","CUP_30Rnd_TE1_Green_Tracer_556x45_CZ805","CUP_30Rnd_TE1_Green_Tracer_556x45_CZ805"], [], _cupEliteRifleBipods], 0.75,

	["CUP_arifle_CZ805_A1_blk", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_CZ805","CUP_30Rnd_556x45_CZ805","CUP_30Rnd_TE1_Green_Tracer_556x45_CZ805","CUP_30Rnd_TE1_Green_Tracer_556x45_CZ805"], [], _cupEliteRifleBipods], 0.75,

	["CUP_arifle_ACR_DMR_blk_68", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_680x43_Stanag","CUP_30Rnd_680x43_Stanag","CUP_30Rnd_680x43_Stanag","CUP_30Rnd_680x43_Stanag_Tracer_Green"], [], _cupEliteRifleBipods], 1.5,
	["CUP_arifle_ACR_DMR_blk_556", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_PMAG_BLACK_PULL","CUP_30Rnd_556x45_PMAG_BLACK_PULL","CUP_30Rnd_556x45_PMAG_BLACK_PULL_Tracer_Green","CUP_30Rnd_556x45_PMAG_BLACK_PULL_Tracer_Green"], [], _cupEliteRifleBipods], 0.5,

	["CUP_arifle_ACR_blk_68", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_680x43_Stanag","CUP_30Rnd_680x43_Stanag","CUP_30Rnd_680x43_Stanag","CUP_30Rnd_680x43_Stanag_Tracer_Green"], [], ""], 3,
	["CUP_arifle_ACR_blk_556", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_PMAG_BLACK_PULL","CUP_30Rnd_556x45_PMAG_BLACK_PULL","CUP_30Rnd_556x45_PMAG_BLACK_PULL_Tracer_Green","CUP_30Rnd_556x45_PMAG_BLACK_PULL_Tracer_Green"], [], ""], 1,

	["CUP_sgun_AA12", "",_cupEliteAttachments,"",["CUP_20Rnd_B_AA12_Buck_4","CUP_20Rnd_B_AA12_Buck_00","CUP_20Rnd_B_AA12_Slug","CUP_20Rnd_B_AA12_HE"], [], ""], 0.5
];

_cupEliteMGOptics = ["CUP_optic_ElcanM145", 5, "CUP_optic_G33_HWS_BLK", 2, "CUP_optic_Eotech553_Black", 0.5, "CUP_optic_Elcan_SpecterDR_KF_RMR_black", 0.75, "CUP_optic_Elcan_SpecterDR_RMR_black", 1.5, "CUP_optic_Elcan_SpecterDR_black", 2.5, "CUP_optic_Elcan_SpecterDR_KF_black", 0.5];
_cupEliteMGOptics762 = ["CUP_optic_ACOG_TA648_308_Black", 4, "CUP_optic_ACOG_TA648_308_RDS_Black", 1.5, "CUP_optic_G33_HWS_BLK", 2, "CUP_optic_Eotech553_Black", 0.75];
_eliteMGOptics append ["CUP_optic_G33_HWS_BLK", 1.5, "CUP_optic_Eotech553_Black", 0.5, "CUP_optic_Elcan_SpecterDR_KF_RMR_black", 0.75, "CUP_optic_Elcan_SpecterDR_RMR_black", 1.5, "CUP_optic_Elcan_SpecterDR_black", 3, "CUP_optic_Elcan_SpecterDR_KF_black", 0.5];

(_eliteLoadoutData get "machineGuns") append [
    ["CUP_arifle_XM8_SAW_FG_Rail_Green", "",_cupEliteGreenAttachments,_cupEliteGreenRifleOptics,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_od"], 0.5,
	["CUP_arifle_XM8_SAW_FG_Rail", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_black"], 0.1,
	["CUP_arifle_XM8_SAW_Rail_Green", "",_cupEliteGreenAttachments,_cupEliteGreenRifleOptics,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,
	["CUP_arifle_XM8_SAW_Rail", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_black"], 1,
	["CUP_arifle_XM8_SAW_FG_Green", "",_cupEliteGreenAttachments,_cupEliteXM8Optics,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_od"], 0.5,
	["CUP_arifle_XM8_SAW_FG", "",_cupEliteAttachments,_cupEliteXM8Optics,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_black"], 0.25,
	["CUP_arifle_XM8_SAW_Green", "",_cupEliteGreenAttachments,_cupEliteXM8Optics,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,
	["CUP_arifle_XM8_SAW", "",_cupEliteAttachments,_cupEliteXM8Optics,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_black"], 0.5,

	["CUP_lmg_Mk48_nohg_wdl", "",_cupEliteGreenAttachments,_cupEliteMGOptics762,["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""], 0.75,
	["CUP_lmg_Mk48_nohg_od", "",_cupEliteGreenAttachments,_cupEliteMGOptics762,["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""], 0.75,
	["CUP_lmg_Mk48_nohg", "",_cupEliteAttachments,_cupEliteMGOptics762,["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""], 0.25,

	["CUP_lmg_Mk48_wdl", "",_cupEliteGreenAttachments,_cupEliteMGOptics762,["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""], 3,
	["CUP_lmg_Mk48_od", "",_cupEliteGreenAttachments,_cupEliteMGOptics762,["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""], 1.5,
	["CUP_lmg_Mk48", "",_cupEliteAttachments,_cupEliteMGOptics762,["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""], 1.5,

	//["CUP_M60A4_EP1", "","CUP_acc_ANPEQ_15_Flashlight_Black_L","CUP_optic_ACOG_TA01B_RMR_Black",["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""], //no idea why this is here
	["CUP_lmg_M60E4", "",_cupEliteAttachments,_cupEliteMGOptics762,["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""], 0.1,

	["CUP_lmg_m249_para_gl", "",_cupEliteAttachments,"",["CUP_200Rnd_TE4_Green_Tracer_556x45_M249_Pouch","CUP_200Rnd_TE4_Green_Tracer_556x45_M249","CUP_200Rnd_TE4_Green_Tracer_556x45_M249"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 0.1,

	["CUP_lmg_m249_pip4", "",_cupEliteAttachments,_cupEliteMGOptics,["CUP_200Rnd_TE4_Green_Tracer_556x45_M249_Pouch","CUP_200Rnd_TE4_Green_Tracer_556x45_M249","CUP_200Rnd_TE4_Green_Tracer_556x45_M249"], [], ""], 1.5,

	["CUP_lmg_M240_B", "",_cupEliteAttachments,_cupEliteMGOptics,["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""], 1,

	["CUP_lmg_L110A1", "",_cupEliteAttachments,_cupEliteMGOptics,["CUP_200Rnd_TE4_Green_Tracer_556x45_M249_Pouch","CUP_200Rnd_TE4_Green_Tracer_556x45_M249","CUP_200Rnd_TE4_Green_Tracer_556x45_M249"], [], ""], 0.5
];
_cupEliteCarbineBipods = ["CUP_bipod_VLTOR_Modpod_black", 1, "", 6];
_cupEliteGreenCarbineBipods = ["CUP_bipod_VLTOR_Modpod_od", 1, "", 6];

_cupEliteCarbineOptics = ["CUP_optic_Eotech553_Black", 0.5, "CUP_optic_VortexRazor_UH1_black", 1, "CUP_optic_AC11704_black", 1, "CUP_optic_CompM4", 1];
_cupEliteXM8CarbineOptics = ["CUP_optic_RCO_PCAP", 1, "CUP_optic_ISM_PCAP", 4];

(_eliteLoadoutData get "carbines") append [
	["CUP_arifle_XM8_Carbine_FG_Rail_Green","",_cupEliteGreenAttachments,_cupEliteCarbineOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], ""], 0.5,
	["CUP_arifle_XM8_Carbine_FG_Rail","",_cupEliteAttachments,_cupEliteCarbineOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], ""], 0.25,
	["CUP_arifle_XM8_Carbine_Rail_Green","",_cupEliteGreenAttachments,_cupEliteCarbineOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], _cupEliteGreenCarbineBipods], 3,
	["CUP_arifle_XM8_Railed","",_cupEliteAttachments,_cupEliteCarbineOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [],  _cupEliteCarbineBipods], 1.5,

	["CUP_arifle_XM8_Carbine_FG_Green","",_cupEliteGreenAttachments,_cupEliteXM8CarbineOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], _cupEliteGreenCarbineBipods], 0.5,
	["CUP_arifle_XM8_Carbine_FG","",_cupEliteAttachments,_cupEliteXM8CarbineOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], _cupEliteCarbineBipods], 0.25,
	["CUP_arifle_XM8_Carbine_Green","",_cupEliteGreenAttachments,_cupEliteXM8CarbineOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], _cupEliteGreenCarbineBipods], 2,
	["CUP_arifle_XM8_Carbine","",_cupEliteAttachments,_cupEliteXM8CarbineOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], _cupEliteCarbineBipods], 1,

	["CUP_arifle_xm29_ke_rail_olive","",_cupEliteGreenAttachments,_cupEliteCarbineOptics,["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"], [], ""], 0.5,
	["CUP_arifle_xm29_ke_rail_blk","",_cupEliteAttachments,_cupEliteCarbineOptics,["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"], [], ""], 0.25,
	["CUP_arifle_xm29_ke_olive","",_cupEliteGreenAttachments,"CUP_optic_G36Optics_RDS_3D",["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"], [], ""], 0.2,
	["CUP_arifle_xm29_ke_blk","",_cupEliteAttachments,"CUP_optic_G36Optics_RDS_3D",["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag"], [], ""], 0.1,

	["CUP_arifle_Mk17_CQC_woodland", "",_cupEliteGreenAttachments,_cupEliteCarbineOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], _cupEliteGreenCarbineBipods], 1,
	["CUP_arifle_Mk17_CQC_Black", "",_cupEliteAttachments,_cupEliteCarbineOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], _cupEliteCarbineBipods], 0.5,
	["CUP_arifle_Mk17_CQC_FG_woodland", "",_cupEliteGreenAttachments,_cupEliteCarbineOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], _cupEliteGreenCarbineBipods], 0.25,
	["CUP_arifle_Mk17_CQC_FG_black", "",_cupEliteAttachments,_cupEliteCarbineOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], _cupEliteCarbineBipods], 0.1,
	["CUP_arifle_Mk17_CQC_SFG_woodland", "",_cupEliteGreenAttachments,_cupEliteCarbineOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], ""], 0.2,
	["CUP_arifle_Mk17_CQC_SFG_black", "",_cupEliteAttachments,_cupEliteCarbineOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], ""], 0.1,

	["CUP_arifle_Mk17_CQC_AFG_woodland", "",_cupEliteGreenAttachments,_cupEliteCarbineOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], ""], 0.2,
	["CUP_arifle_Mk17_CQC_AFG_black", "",_cupEliteAttachments,_cupEliteCarbineOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], ""], 0.1,

	["CUP_arifle_Mk16_CQC_woodland", "",_cupEliteGreenAttachments,_cupEliteCarbineOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], _cupEliteGreenCarbineBipods], 2,
	["CUP_arifle_Mk16_CQC_black", "",_cupEliteAttachments,_cupEliteCarbineOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], _cupEliteCarbineBipods], 1,
	["CUP_arifle_Mk16_CQC_FG_woodland", "",_cupEliteGreenAttachments,_cupEliteCarbineOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], _cupEliteGreenCarbineBipods], 0.5,
	["CUP_arifle_Mk16_CQC_FG_black", "",_cupEliteAttachments,_cupEliteCarbineOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], _cupEliteCarbineBipods], 0.25,
	["CUP_arifle_Mk16_CQC_SFG_woodland", "",_cupEliteGreenAttachments,_cupEliteCarbineOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], ""], 0.2,
	["CUP_arifle_Mk16_CQC_SFG_black", "",_cupEliteAttachments,_cupEliteCarbineOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], ""], 0.1,

	["CUP_arifle_Mk16_CQC_AFG_woodland", "",_cupEliteGreenAttachments,_cupEliteCarbineOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], _cupEliteGreenCarbineBipods], 0.2,
	["CUP_arifle_Mk16_CQC_AFG_black", "",_cupEliteAttachments,_cupEliteCarbineOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], _cupEliteCarbineBipods], 0.1,

	["CUP_arifle_SBR_od", "",_cupEliteGreenAttachments,_cupEliteCarbineOptics,["CUP_30Rnd_556x45_PMAG_OD_RPL","CUP_30Rnd_556x45_PMAG_OD_RPL","CUP_30Rnd_556x45_PMAG_OD_RPL","CUP_30Rnd_556x45_PMAG_OD_RPL_Tracer_Green"], [], ""], 0.5,
	["CUP_arifle_SBR_black", "",_cupEliteAttachments,_cupEliteCarbineOptics,["CUP_30Rnd_556x45_PMAG_OD_RPL","CUP_30Rnd_556x45_PMAG_OD_RPL","CUP_30Rnd_556x45_PMAG_OD_RPL","CUP_30Rnd_556x45_PMAG_OD_RPL_Tracer_Green"], [], ""], 0.25,

	["CUP_CZ_BREN2_556_8_Grn", "",_cupEliteGreenAttachments,_cupEliteCarbineOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland"], [], _cupEliteCarbineBipods], 1,
	["CUP_CZ_BREN2_556_8", "",_cupEliteAttachments,_cupEliteCarbineOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland"], [], _cupEliteCarbineBipods], 0.5,

	["CUP_CZ_BREN2_762_8", "",_cupEliteAttachments,_cupEliteCarbineOptics,["CUP_30Rnd_762x39_CZ807","CUP_30Rnd_762x39_CZ807","CUP_30Rnd_TE1_Green_Tracer_762x39_CZ807"], [], _cupEliteCarbineBipods], 0.25,
	["CUP_CZ_BREN2_762_8_Grn", "",_cupEliteGreenAttachments,_cupEliteCarbineOptics,["CUP_30Rnd_762x39_CZ807","CUP_30Rnd_762x39_CZ807","CUP_30Rnd_TE1_Green_Tracer_762x39_CZ807"], [], _cupEliteCarbineBipods], 0.75,

	["CUP_arifle_ACRC_blk_68", "",_cupEliteAttachments,_cupEliteCarbineOptics,["CUP_30Rnd_680x43_Stanag","CUP_30Rnd_680x43_Stanag","CUP_30Rnd_680x43_Stanag","CUP_30Rnd_680x43_Stanag_Tracer_Green"], [], ""], 3,
	["CUP_arifle_ACRC_blk_556", "",_cupEliteAttachments,_cupEliteCarbineOptics,["CUP_30Rnd_556x45_PMAG_BLACK_PULL","CUP_30Rnd_556x45_PMAG_BLACK_PULL","CUP_30Rnd_556x45_PMAG_BLACK_PULL_Tracer_Green","CUP_30Rnd_556x45_PMAG_BLACK_PULL_Tracer_Green"], [], ""], 1
];
(_eliteLoadoutData get "grenadeLaunchers") append [
   	["CUP_arifle_XM8_Carbine_GL_Rail_Green", "",_cupEliteGreenAttachments,_cupEliteGreenRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 4,
	["CUP_arifle_XM8_Carbine_GL_Rail", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 2,
	["CUP_arifle_XM8_Carbine_GL_Green", "",_cupEliteGreenAttachments,_cupEliteXM8Optics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 2,
	["CUP_arifle_XM8_Carbine_GL", "",_cupEliteAttachments,_cupEliteXM8Optics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 1,

	["CUP_arifle_xm29_olive", "",_cupEliteGreenAttachments,"",["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green"], ["CUP_6Rnd_HE_Grenade_M","CUP_6Rnd_HE_Grenade_M"], ""], 0.75,
	["CUP_arifle_xm29_blk", "",_cupEliteAttachments,"",["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green"], ["CUP_6Rnd_HE_Grenade_M","CUP_6Rnd_HE_Grenade_M"], ""], 0.25,

	["CUP_arifle_Mk17_STD_EGLM_woodland", "",_cupEliteGreenAttachments,_cupEliteGreenRifleOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 0.5,
	["CUP_arifle_Mk17_STD_EGLM_black", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 0.25,

	["CUP_arifle_Mk17_CQC_EGLM_woodland", "",_cupEliteGreenAttachments,_cupEliteGreenRifleOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 0.5,
	["CUP_arifle_Mk17_CQC_EGLM_black", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 0.25,
	
	["CUP_arifle_Mk16_STD_EGLM_woodland", "",_cupEliteGreenAttachments,_cupEliteGreenRifleOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_60Rnd_556x45_SureFire"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 2,
	["CUP_arifle_Mk16_STD_EGLM_black", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_60Rnd_556x45_SureFire"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 1,
	
	["CUP_arifle_Mk16_CQC_EGLM_woodland", "",_cupEliteGreenAttachments,_cupEliteGreenRifleOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_60Rnd_556x45_SureFire"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 2,
	["CUP_arifle_Mk16_CQC_EGLM_black", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_60Rnd_556x45_SureFire"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 1,
	
	["CUP_arifle_HK_M27_AG36", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_Emag","CUP_30Rnd_556x45_Emag","CUP_30Rnd_556x45_Emag_Tracer_Green","CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 0.5,
	
	["CUP_CZ_BREN2_556_14_GL_Grn", "",_cupEliteGreenAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 0.5,
	["CUP_CZ_BREN2_556_14_GL", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 0.25,

	["CUP_CZ_BREN2_556_11_GL_Grn", "",_cupEliteGreenAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 0.5,
	["CUP_CZ_BREN2_556_11_GL", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 0.25,

	["CUP_CZ_BREN2_762_14_GL_Grn", "",_cupEliteGreenAttachments,_cupEliteRifleOptics,["CUP_30Rnd_762x39_CZ807","CUP_30Rnd_762x39_CZ807","CUP_30Rnd_TE1_Green_Tracer_762x39_CZ807"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 0.2,
	["CUP_CZ_BREN2_762_14_GL", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_762x39_CZ807","CUP_30Rnd_762x39_CZ807","CUP_30Rnd_TE1_Green_Tracer_762x39_CZ807"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 0.1,

	["CUP_arifle_CZ805_GL_blk", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_CZ805","CUP_30Rnd_556x45_CZ805","CUP_30Rnd_TE1_Green_Tracer_556x45_CZ805","CUP_30Rnd_TE1_Green_Tracer_556x45_CZ805"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 0.5,

	["CUP_arifle_ACRC_EGLM_blk_68", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_680x43_Stanag","CUP_30Rnd_680x43_Stanag","CUP_30Rnd_680x43_Stanag","CUP_30Rnd_680x43_Stanag_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 2,
	["CUP_arifle_ACRC_EGLM_blk_556", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_PMAG_BLACK_PULL","CUP_30Rnd_556x45_PMAG_BLACK_PULL","CUP_30Rnd_556x45_PMAG_BLACK_PULL_Tracer_Green","CUP_30Rnd_556x45_PMAG_BLACK_PULL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 0.75,

	["CUP_arifle_ACR_EGLM_blk_68", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_680x43_Stanag","CUP_30Rnd_680x43_Stanag","CUP_30Rnd_680x43_Stanag","CUP_30Rnd_680x43_Stanag_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 2,
	["CUP_arifle_ACR_EGLM_blk_556", "",_cupEliteAttachments,_cupEliteRifleOptics,["CUP_30Rnd_556x45_PMAG_BLACK_PULL","CUP_30Rnd_556x45_PMAG_BLACK_PULL","CUP_30Rnd_556x45_PMAG_BLACK_PULL_Tracer_Green","CUP_30Rnd_556x45_PMAG_BLACK_PULL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 0.75
	
];
_eliteMarksmanOptics append ["CUP_optic_SB_11_4x20_PM", 5, "CUP_optic_AN_PVS_10_black", 0.5];
(_eliteLoadoutData get "marksmanRifles") append [
	["CUP_arifle_Mk20_woodland", "",_cupEliteGreenAttachments ,_eliteMarksmanOptics ,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], "CUP_bipod_VLTOR_Modpod_od"], 4,
	["CUP_arifle_Mk20_black", "",_cupEliteAttachments,_eliteMarksmanOptics,["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], "CUP_bipod_VLTOR_Modpod_black"], 2,

	["CUP_arifle_Mk16_SV_woodland", "",_cupEliteGreenAttachments , _eliteMarksmanOptics ,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,
	["CUP_arifle_Mk16_SV_black", "",_cupEliteAttachments, _eliteMarksmanOptics,["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green"], [], "CUP_bipod_VLTOR_Modpod_black"], 1,

    ["CUP_srifle_RSASS_Jungle","",_cupEliteGreenAttachments,_eliteMarksmanOptics,["CUP_20Rnd_762x51_B_M110","CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_762x51_B_M110","CUP_20Rnd_TE1_Green_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,
	["CUP_srifle_RSASS_Black","",_cupEliteAttachments,_eliteMarksmanOptics,["CUP_20Rnd_762x51_B_M110","CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_762x51_B_M110","CUP_20Rnd_TE1_Green_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,

	["CUP_srifle_Mk12SPR","",_cupEliteAttachments,_eliteMarksmanOptics,["CUP_20Rnd_556x45_Stanag","CUP_20Rnd_556x45_Stanag_Tracer_Green","CUP_20Rnd_556x45_Stanag","CUP_20Rnd_556x45_Stanag_Tracer_Green"], [], "CUP_bipod_VLTOR_Modpod_black"], 0.5,

	["CUP_srifle_M110_black","",_cupEliteAttachments,_eliteMarksmanOptics,["CUP_20Rnd_762x51_B_M110","CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_762x51_B_M110","CUP_20Rnd_TE1_Green_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"], 2,
	["CUP_srifle_m110_kac_black","",_cupEliteAttachments,_eliteMarksmanOptics,["CUP_20Rnd_762x51_B_M110","CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_762x51_B_M110","CUP_20Rnd_TE1_Green_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"], 0.75
];
_eliteSniperOptics append ["CUP_optic_LeupoldMk4", 5, "CUP_optic_LeupoldMk4_20x40_LRT", 3, "CUP_optic_LeupoldM3LR", 2, "CUP_optic_AN_PVS_10_black", 0.75, "CUP_optic_CWS", 0.5];
(_eliteLoadoutData get "sniperRifles") append [
    ["CUP_srifle_M2010_blk","","acc_pointer_IR",_eliteSniperOptics,["CUP_5Rnd_762x67_M2010_M","CUP_5Rnd_762x67_M2010_M","CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"], 3,

	["CUP_srifle_M107_Pristine","","",_eliteSniperOptics,["CUP_10Rnd_127x99_M107","CUP_10Rnd_127x99_M107","CUP_10Rnd_127x99_M107"], [], ""], 4,
	["CUP_srifle_M107_Base","","",_eliteSniperOptics,["CUP_10Rnd_127x99_M107","CUP_10Rnd_127x99_M107","CUP_10Rnd_127x99_M107"], [], ""], 2,
	["CUP_srifle_M107_Woodland","","",_eliteSniperOptics,["CUP_10Rnd_127x99_M107","CUP_10Rnd_127x99_M107","CUP_10Rnd_127x99_M107"], [], ""], 0.5,

	["CUP_srifle_AWM_blk","","",_eliteSniperOptics,["CUP_5Rnd_86x70_L115A1","CUP_5Rnd_86x70_L115A1","CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"], 0.5,
	["CUP_srifle_AWM_wdl","","",_eliteSniperOptics,["CUP_5Rnd_86x70_L115A1","CUP_5Rnd_86x70_L115A1","CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"], 1,

	["CUP_srifle_G22_blk","","",_eliteSniperOptics,["CUP_5Rnd_762x67_G22","CUP_5Rnd_762x67_G22", "CUP_5Rnd_762x67_G22","CUP_5Rnd_762x67_G22"], [], "CUP_bipod_VLTOR_Modpod_black"], 0.1,
	["CUP_srifle_G22_wdl","","",_eliteSniperOptics,["CUP_5Rnd_762x67_G22","CUP_5Rnd_762x67_G22", "CUP_5Rnd_762x67_G22","CUP_5Rnd_762x67_G22"], [], "CUP_bipod_VLTOR_Modpod_black"], 0.2,

	["CUP_srifle_AS50","","",_eliteSniperOptics,["CUP_5Rnd_127x99_as50_M","CUP_5Rnd_127x99_as50_M", "CUP_5Rnd_127x99_as50_M","CUP_5Rnd_127x99_as50_M"], [], ""], 1.5
];   
(_eliteLoadoutData get "designatedGrenadeLaunchers") append [
    ["CUP_glaunch_6G30", "", "", "", ["CUP_6Rnd_HE_GP25_M"], [], ""], 5
];

_cupEliteSMGXM8Optics = ["CUP_optic_ISM_PCAP", 10];
(_eliteLoadoutData get "SMGs") append [
    ["CUP_arifle_XM8_Compact_FG_Rail_Green","",_cupEliteGreenAttachments,_cupEliteCarbineOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], ""], 0.5,
	["CUP_arifle_XM8_Compact_FG_Rail","",_cupEliteAttachments,_cupEliteCarbineOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], ""], 0.25,
	["CUP_arifle_XM8_Compact_Rail_Green","",_cupEliteGreenAttachments,_cupEliteCarbineOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 3,
	["CUP_arifle_XM8_Compact_Rail","",_cupEliteAttachments,_cupEliteCarbineOptics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 1.5,

	["CUP_arifle_XM8_Compact_FG_Green","",_cupEliteGreenAttachments,_cupEliteSMGXM8Optics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], ""], 0.2,
	["CUP_arifle_XM8_Compact_FG","",_cupEliteAttachments,_cupEliteSMGXM8Optics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], ""], 0.1,
	["CUP_arifle_XM8_Compact_Green","",_cupEliteGreenAttachments,_cupEliteSMGXM8Optics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,
	["CUP_arifle_XM8_Compact","",_cupEliteAttachments,_cupEliteSMGXM8Optics,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,

	["CUP_smg_PS90_olive","",_cupEliteGreenAttachments,_cupEliteCarbineOptics,["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","CUP_50Rnd_570x28_Green_Tracer_P90_M","CUP_50Rnd_570x28_Green_Tracer_P90_M"], [], ""], 1,
	["CUP_smg_EVO","",_cupEliteAttachments,_cupEliteCarbineOptics,["CUP_30Rnd_9x19_EVO","CUP_30Rnd_9x19_EVO","CUP_30Rnd_9x19_EVO","CUP_30Rnd_9x19_EVO"], [], ""], 0.5
];
//////////////////////////////////////////////////////
_militarySlRifleOptics append ["CUP_optic_RCO", 6, "CUP_optic_Eotech553_Black", 2];
_cupMilitarySlRifleOptics = ["CUP_optic_RCO", 6, "CUP_optic_Eotech553_Black", 2];
_cupMilitarySlG36Optics = ["CUP_optic_Eotech553_Black", 1, "CUP_optic_HensoldtZO_low", 2];

_cupMilitaryG36Optics = ["CUP_optic_G36DualOptics_3D", 4, "CUP_optic_G36Optics_3D", 2, "CUP_optic_G36Optics_Holo_3D", 1];
_cupMilitaryL85Optics = ["CUP_optic_SUSAT", 2, "CUP_optic_HoloBlack", 1];

_cupMilitaryAttachments = ["CUP_acc_Flashlight", 6, "CUP_acc_ANPEQ_2_grey", 2, "CUP_acc_ANPEQ_15_Flashlight_Black_L", 1];

(_militaryLoadoutData get "slRifles") append [
    ["CUP_arifle_DSA_SA58_OSW_M203", "",_cupMilitaryAttachments,_cupMilitarySlRifleOptics,["CUP_30Rnd_762x51_FNFAL_M","CUP_30Rnd_762x51_FNFAL_M","CUP_30Rnd_762x51_FNFAL_M","CUP_30Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 1,

	["CUP_arifle_M4A1_GL_carryhandle", "",_cupMilitaryAttachments,_cupMilitarySlRifleOptics,["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 2,
	["CUP_arifle_M4A1_BUIS_GL", "",_cupMilitaryAttachments,_cupMilitarySlRifleOptics,["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 1,

	["CUP_arifle_M16A4_GL", "",_cupMilitaryAttachments,_cupMilitarySlRifleOptics,["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 2,
	
	["CUP_arifle_L85A2_GL", "",_cupMilitaryAttachments, _cupMilitaryL85Optics ,["CUP_30Rnd_556x45_Stanag_L85","CUP_30Rnd_556x45_Stanag_L85","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 0.75,

	["CUP_arifle_G36K_RIS_AG36", "",_cupMilitaryAttachments,_cupMilitarySlG36Optics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 1.5,
	["CUP_arifle_G36K_AG36", "",_cupMilitaryAttachments,_cupMilitaryG36Optics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 1,

	["CUP_arifle_G36A3_AG36", "",_cupMilitaryAttachments,_cupMilitarySlG36Optics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 0.75,
	
	["CUP_arifle_G36A_AG36_RIS", "",_cupMilitaryAttachments,_cupMilitarySlG36Optics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 0.5,

	["CUP_arifle_AG36", "",_cupMilitaryAttachments,_cupMilitaryG36Optics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 0.75
];
_militaryRifleOptics append ["CUP_optic_RCO", 1.5, "CUP_optic_Eotech553_Black", 2.5, "CUP_optic_HoloBlack", 5];
_cupMilitaryRifleOptics = ["CUP_optic_RCO", 1.5, "CUP_optic_Eotech553_Black", 2.5, "CUP_optic_HoloBlack", 5];
_cupMilitaryG36RISOptics = ["CUP_optic_HoloBlack", 4, "CUP_optic_Eotech553_Black", 2, "CUP_optic_HensoldtZO_low", 1];

(_militaryLoadoutData get "rifles") append [
   	["CUP_arifle_DSA_SA58_OSW_VFG", "",_cupMilitaryAttachments,_cupMilitaryRifleOptics,["CUP_30Rnd_762x51_FNFAL_M","CUP_30Rnd_762x51_FNFAL_M","CUP_30Rnd_762x51_FNFAL_M","CUP_30Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], ""], 0.75,
   	["CUP_arifle_DSA_SA58_OSW", "",_cupMilitaryAttachments,_cupMilitaryRifleOptics,["CUP_30Rnd_762x51_FNFAL_M","CUP_30Rnd_762x51_FNFAL_M","CUP_30Rnd_762x51_FNFAL_M","CUP_30Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], ""], 1.5,
   	["CUP_arifle_DSA_SA58_DMR", "",_cupMilitaryAttachments,_cupMilitaryRifleOptics,["CUP_30Rnd_762x51_FNFAL_M","CUP_30Rnd_762x51_FNFAL_M","CUP_30Rnd_762x51_FNFAL_M","CUP_30Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], ""], 0.25,
   	["CUP_arifle_DSA_SA58", "",_cupMilitaryAttachments,_cupMilitaryRifleOptics,["CUP_30Rnd_762x51_FNFAL_M","CUP_30Rnd_762x51_FNFAL_M","CUP_30Rnd_762x51_FNFAL_M","CUP_30Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], ""], 1,

	["CUP_arifle_M4A3_black", "",_cupMilitaryAttachments,_cupMilitaryRifleOptics,["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""], 0.75,
	["CUP_arifle_M4A1", "",_cupMilitaryAttachments,_cupMilitaryRifleOptics,["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""], 2,
	["CUP_arifle_M4A1_standard_black", "",_cupMilitaryAttachments,_cupMilitaryRifleOptics,["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""], 0.75,
	["CUP_arifle_M4A1_black", "",_cupMilitaryAttachments,_cupMilitaryRifleOptics,["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""], 1,

	["CUP_arifle_M16A4_Grip", "",_cupMilitaryAttachments,_cupMilitaryRifleOptics,["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""], 0.75,
	["CUP_arifle_M16A4_Base", "",_cupMilitaryAttachments,_cupMilitaryRifleOptics,["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""], 2,

	["CUP_arifle_M16A2", "",_cupMilitaryAttachments,_cupMilitaryRifleOptics,["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""], 2,
	["CUP_arifle_M16A1E1", "",_cupMilitaryAttachments,_cupMilitaryRifleOptics,["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""], 0.5,

	["CUP_arifle_L85A2_G", "",_cupMilitaryAttachments,_cupMilitaryL85Optics ,["CUP_30Rnd_556x45_Stanag_L85","CUP_30Rnd_556x45_Stanag_L85","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green"], [], ""], 1,
	["CUP_arifle_L85A2_NG", "",_cupMilitaryAttachments,_cupMilitaryL85Optics ,["CUP_30Rnd_556x45_Stanag_L85","CUP_30Rnd_556x45_Stanag_L85","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green"], [], ""], 0.75,
	["CUP_arifle_L85A2", "",_cupMilitaryAttachments,_cupMilitaryL85Optics ,["CUP_30Rnd_556x45_Stanag_L85","CUP_30Rnd_556x45_Stanag_L85","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green"], [], ""], 0.75,

	["CUP_arifle_G36KA3_grip", "",_cupMilitaryAttachments,_cupMilitaryG36RISOptics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""], 0.75,
	["CUP_arifle_G36KA3_afg", "",_cupMilitaryAttachments,_cupMilitaryG36RISOptics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""], 0.75,
	["CUP_arifle_G36KA3", "",_cupMilitaryAttachments,_cupMilitaryG36RISOptics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""], 2,

	["CUP_arifle_G36K_KSK_VFG", "",_cupMilitaryAttachments,_cupMilitaryG36RISOptics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""], 0.5,
	["CUP_arifle_G36K_KSK_AFG", "",_cupMilitaryAttachments,_cupMilitaryG36RISOptics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""], 0.5,
	["CUP_arifle_G36K_KSK", "",_cupMilitaryAttachments,_cupMilitaryG36RISOptics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""], 0.5,

	["CUP_arifle_G36K_RIS", "",_cupMilitaryAttachments,_cupMilitaryG36RISOptics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""], 2,
	["CUP_arifle_G36A_RIS", "",_cupMilitaryAttachments,_cupMilitaryG36RISOptics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""], 2,

	["CUP_arifle_G36K", "",_cupMilitaryAttachments,_cupMilitaryG36Optics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""], 1,
	["CUP_arifle_G36E", "",_cupMilitaryAttachments,_cupMilitaryG36Optics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""], 1.25,
	["CUP_arifle_G36A", "",_cupMilitaryAttachments,_cupMilitaryG36Optics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""], 0.75,

	["CUP_arifle_G36A3_grip", "",_cupMilitaryAttachments,_cupMilitaryG36RISOptics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""], 1.25,
	["CUP_arifle_G36A3", "",_cupMilitaryAttachments,_cupMilitaryG36RISOptics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""], 2

];
(_militaryLoadoutData get "carbines") append [
	["CUP_arifle_Colt727", "",_cupMilitaryAttachments,_cupMilitaryRifleOptics,["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""], 2,

	["CUP_arifle_G36CA3_grip", "",_cupMilitaryAttachments,_cupMilitaryG36RISOptics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""], 0.5,
	["CUP_arifle_G36CA3_afg", "",_cupMilitaryAttachments,_cupMilitaryG36RISOptics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""], 0.5,
	["CUP_arifle_G36CA3", "",_cupMilitaryAttachments,_cupMilitaryG36RISOptics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""], 1.25,

	["CUP_arifle_G36C_VFG", "",_cupMilitaryAttachments,_cupMilitaryG36RISOptics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""], 0.5,
	["CUP_arifle_G36C_VFG_Carry", "",_cupMilitaryAttachments,_cupMilitaryG36RISOptics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""], 0.5,
	["CUP_arifle_G36C", "",_cupMilitaryAttachments,_cupMilitaryG36RISOptics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""], 2
];
_cupMilitaryMGOptics = ["CUP_optic_ACOG2", 4, "CUP_optic_ACOG_TA31_KF", 1];

(_militaryLoadoutData get "machineGuns") append [
    ["CUP_lmg_m249_pip4", "",_cupMilitaryAttachments,_cupMilitaryMGOptics,["CUP_200Rnd_TE4_Green_Tracer_556x45_M249_Pouch","CUP_200Rnd_TE4_Green_Tracer_556x45_M249","CUP_200Rnd_TE4_Green_Tracer_556x45_M249"], [], ""], 3,

	["CUP_lmg_M240_B", "",_cupMilitaryAttachments,_cupMilitaryMGOptics,["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""], 0.5,

	["CUP_lmg_L110A1", "",_cupMilitaryAttachments,_cupMilitaryMGOptics,["CUP_200Rnd_TE4_Green_Tracer_556x45_M249_Pouch","CUP_200Rnd_TE4_Green_Tracer_556x45_M249","CUP_200Rnd_TE4_Green_Tracer_556x45_M249"], [], ""], 1,

	["CUP_arifle_MG36", "",_cupMilitaryAttachments,_cupMilitaryG36RISOptics,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag"], [], ""], 1.5,

	["CUP_lmg_MG3_rail", "",_cupMilitaryAttachments,_cupMilitaryMGOptics,["CUP_120Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_120Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_120Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""], 0.5,

	["CUP_M60A4_EP1", "",_cupMilitaryAttachments,_cupMilitaryMGOptics,["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""], 1
];

(_militaryLoadoutData get "grenadeLaunchers") append [
    ["CUP_arifle_DSA_SA58_OSW_M203", "",_cupMilitaryAttachments,_cupMilitaryRifleOptics,["CUP_30Rnd_762x51_FNFAL_M","CUP_30Rnd_762x51_FNFAL_M","CUP_30Rnd_762x51_FNFAL_M","CUP_30Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 1,

	["CUP_arifle_M4A1_GL_carryhandle", "",_cupMilitaryAttachments,_cupMilitaryRifleOptics,["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 2,
	["CUP_arifle_M4A1_BUIS_GL", "",_cupMilitaryAttachments,_cupMilitaryRifleOptics,["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 0.75,

	["CUP_arifle_M16A4_GL", "",_cupMilitaryAttachments,_cupMilitaryRifleOptics,["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 2,
	
	["CUP_arifle_L85A2_GL", "",_cupMilitaryAttachments,_cupMilitaryL85Optics,["CUP_30Rnd_556x45_Stanag_L85","CUP_30Rnd_556x45_Stanag_L85","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green","CUP_30Rnd_556x45_Stanag_L85_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 0.5,

	["CUP_arifle_G36K_RIS_AG36", "",_cupMilitaryAttachments,_cupMilitaryG36RISOptics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 1.5,
	["CUP_arifle_G36K_AG36", "",_cupMilitaryAttachments,_cupMilitaryG36Optics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 1,

	["CUP_arifle_G36A3_AG36", "",_cupMilitaryAttachments,_cupMilitaryG36RISOptics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 0.75,
	
	["CUP_arifle_G36A_AG36_RIS", "",_cupMilitaryAttachments,_cupMilitaryG36RISOptics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 0.75,

	["CUP_arifle_AG36", "",_cupMilitaryAttachments,_cupMilitaryG36Optics,["CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36_wdl","CUP_30Rnd_556x45_G36","CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 1
];
_militaryMarksmanOptics append ["CUP_optic_LeupoldMk4", 3, "CUP_optic_LeupoldM3LR", 1];

(_militaryLoadoutData get "marksmanRifles") append [
    ["CUP_srifle_M14_DMR", "",_cupMilitaryAttachments, _militaryMarksmanOptics ,["CUP_20Rnd_762x51_DMR","CUP_20Rnd_762x51_DMR","CUP_20Rnd_762x51_DMR","CUP_20Rnd_TE1_Green_Tracer_762x51_DMR"], [], "CUP_bipod_Harris_1A2_L_BLK"], 5
];
_cupMilitarySniperCamo = ["CUP_Mxx_camo", 1, "CUP_Mxx_camo_half", 1.5, "", 1];
_militarySniperOptics append ["CUP_optic_LeupoldMk4_20x40_LRT", 3];
(_militaryLoadoutData get "sniperRifles") append [
	["CUP_srifle_M40A3","",_cupMilitarySniperCamo, _militarySniperOptics,["CUP_5Rnd_762x51_M24","CUP_5Rnd_762x51_M24","CUP_5Rnd_762x51_M24"], [], "CUP_bipod_Harris_1A2_L_BLK"], 5
];
_militarySMGOptics append ["CUP_optic_HoloBlack", 7, "CUP_optic_Eotech553_black", 3];
_cupMilitarySMGOptics = ["CUP_optic_HoloBlack", 7, "CUP_optic_Eotech553_black", 3];
(_militaryLoadoutData get "SMGs") append [
    ["CUP_smg_MP7","",_cupMilitaryAttachments,_cupMilitarySMGOptics,["CUP_40Rnd_46x30_MP7","CUP_40Rnd_46x30_MP7","CUP_40Rnd_46x30_MP7_Green_Tracer","CUP_40Rnd_46x30_MP7_Green_Tracer"], [], ""], 2,

	["CUP_smg_MP5SD6","",_cupMilitaryAttachments,_cupMilitarySMGOptics,["CUP_30Rnd_Subsonic_9x19_MP5","CUP_30Rnd_Subsonic_9x19_MP5","CUP_30Rnd_Subsonic_9x19_MP5","CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""], 0.5,

	["CUP_smg_MP5A5_Rail_VFG","",_cupMilitaryAttachments,_cupMilitarySMGOptics,["CUP_30Rnd_9x19_MP5","CUP_30Rnd_9x19_MP5","CUP_30Rnd_9x19_MP5","CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""], 1,
	["CUP_smg_MP5A5_Rail_AFG","",_cupMilitaryAttachments,_cupMilitarySMGOptics,["CUP_30Rnd_9x19_MP5","CUP_30Rnd_9x19_MP5","CUP_30Rnd_9x19_MP5","CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""], 1,
	["CUP_smg_MP5A5_Rail","",_cupMilitaryAttachments,_cupMilitarySMGOptics,["CUP_30Rnd_9x19_MP5","CUP_30Rnd_9x19_MP5","CUP_30Rnd_9x19_MP5","CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""], 5
];
/////////////
_militiaSlRifleOptics append ["CUP_optic_Aimpoint_5000", 2.5, "CUP_optic_AC11704_Black", 0.75, "CUP_optic_HoloBlack", 0.75];
_militiaRifleOptics append ["CUP_optic_Aimpoint_5000", 0.5, "CUP_optic_AC11704_Black", 0.2, "CUP_optic_HoloBlack", 0.2];
(_militiaLoadoutData get "slRifles") append [
    ["CUP_arifle_M16A1GL", "","","",["CUP_20Rnd_556x45_Stanag","CUP_20Rnd_556x45_Stanag","CUP_20Rnd_556x45_Stanag","CUP_20Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 5 // No optic since it uses a barrel mounted leaf sight for grenade launcher aiming.
];
_cupFALbipods = [ "CUP_bipod_FNFAL", 1, "", 5];
(_militiaLoadoutData get "rifles") append [
    ["CUP_arifle_G3A3_modern_ris_black", "",_militiaAttachments,_militiaRifleOptics,["CUP_20Rnd_762x51_G3","CUP_20Rnd_762x51_G3","CUP_20Rnd_762x51_G3","CUP_20Rnd_TE1_Green_Tracer_762x51_G3"], [], ""], 0.75,
	["CUP_arifle_G3A3_modern_ris", "",_militiaAttachments,_militiaRifleOptics,["CUP_20Rnd_762x51_G3","CUP_20Rnd_762x51_G3","CUP_20Rnd_762x51_G3","CUP_20Rnd_TE1_Green_Tracer_762x51_G3"], [], ""], 1.75,
	
	["CUP_arifle_G3A3_ris_vfg_black", "",_militiaAttachments,_militiaRifleOptics,["CUP_20Rnd_762x51_G3","CUP_20Rnd_762x51_G3","CUP_20Rnd_762x51_G3","CUP_20Rnd_TE1_Green_Tracer_762x51_G3"], [], ""], 0.1,
	["CUP_arifle_G3A3_ris_vfg", "",_militiaAttachments,_militiaRifleOptics,["CUP_20Rnd_762x51_G3","CUP_20Rnd_762x51_G3","CUP_20Rnd_762x51_G3","CUP_20Rnd_TE1_Green_Tracer_762x51_G3"], [], ""], 0.2,

	["CUP_arifle_G3A3_ris_black", "",_militiaAttachments,_militiaRifleOptics,["CUP_20Rnd_762x51_G3","CUP_20Rnd_762x51_G3","CUP_20Rnd_762x51_G3","CUP_20Rnd_TE1_Green_Tracer_762x51_G3"], [], ""], 0.5,
	["CUP_arifle_G3A3_ris", "",_militiaAttachments,_militiaRifleOptics,["CUP_20Rnd_762x51_G3","CUP_20Rnd_762x51_G3","CUP_20Rnd_762x51_G3","CUP_20Rnd_TE1_Green_Tracer_762x51_G3"], [], ""], 1,

	["CUP_arifle_Steyr_Stg58_railed", "",_militiaAttachments,_militiaRifleOptics,["CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], ""], 0.1,
	["CUP_arifle_Steyr_Stg58", "",_militiaAttachments,"",["CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], ""], 0.1,

	["CUP_arifle_IMI_Romat", "",_militiaAttachments,"",["CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], ""], 0.25,

	["CUP_arifle_Gewehr1_railed", "",_militiaAttachments,_militiaRifleOptics,["CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], _cupFALbipods], 0.1,
	["CUP_arifle_Gewehr1", "",_militiaAttachments,"",["CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], _cupFALbipods], 0.1,

	["CUP_arifle_Fort222", "",_militiaAttachments,_militiaRifleOptics,["CUP_30Rnd_545x39_Fort224_M","CUP_30Rnd_545x39_Fort224_M","CUP_30Rnd_Subsonic_545x39_Fort224_M","CUP_30Rnd_TE1_Green_Tracer_545x39_Fort224_M"], [], ""], 0.2,

	["CUP_Famas_F1_Rail", "",_militiaAttachments,_militiaRifleOptics,["CUP_25Rnd_556x45_Famas","CUP_25Rnd_556x45_Famas","CUP_25Rnd_556x45_Famas","CUP_25Rnd_556x45_Famas_Tracer_Green"], [], ""], 0.25,
	["CUP_Famas_F1", "","","",["CUP_25Rnd_556x45_Famas","CUP_25Rnd_556x45_Famas","CUP_25Rnd_556x45_Famas","CUP_25Rnd_556x45_Famas_Tracer_Green"], [], ""], 0.1,

	["CUP_arifle_FNFAL_OSW_railed", "",_militiaAttachments,_militiaRifleOptics,["CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], _cupFALbipods], 1,
	["CUP_arifle_FNFAL_OSW", "",_militiaAttachments,"",["CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], _cupFALbipods], 0.25,
	["CUP_arifle_FNFAL5061_wooden_railed", "",_militiaAttachments,_militiaRifleOptics,["CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], _cupFALbipods], 0.1,
	["CUP_arifle_FNFAL5061_wooden", "",_militiaAttachments,"",["CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], _cupFALbipods], 0.1,

	["CUP_arifle_FNFAL_railed", "",_militiaAttachments,_militiaRifleOptics,["CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], _cupFALbipods], 1,
	["CUP_arifle_FNFAL", "",_militiaAttachments,"",["CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], _cupFALbipods], 0.25,
	["CUP_arifle_FNFAL5062_railed", "",_militiaAttachments,_militiaRifleOptics,["CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], _cupFALbipods], 0.25,
	["CUP_arifle_FNFAL5062", "",_militiaAttachments,"",["CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], _cupFALbipods], 0.1,
	["CUP_arifle_FNFAL5061_railed", "",_militiaAttachments,_militiaRifleOptics,["CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], _cupFALbipods], 0.75,
	["CUP_arifle_FNFAL5061", "",_militiaAttachments,"",["CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], _cupFALbipods], 0.15,
	["CUP_arifle_FNFAL5060_railed", "",_militiaAttachments,_militiaRifleOptics,["CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], _cupFALbipods], 1.5,
	["CUP_arifle_FNFAL5060", "",_militiaAttachments,"",["CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], _cupFALbipods], 0.25,

	["CUP_arifle_AUG_A1", "","","",["CUP_30Rnd_556x45_AUG","CUP_30Rnd_556x45_AUG","CUP_30Rnd_556x45_AUG","CUP_30Rnd_TE1_Green_Tracer_556x45_AUG"], [], ""], 0.25,

	["CUP_arifle_M16A1", "",_militiaAttachments,_militiaRifleOptics,["CUP_20Rnd_556x45_Stanag","CUP_20Rnd_556x45_Stanag","CUP_20Rnd_556x45_Stanag","CUP_20Rnd_556x45_Stanag_Tracer_Green"], [], ""], 5, //relatively high because this is one of the only non-battle rifles

	["CUP_srifle_M14", "",_militiaAttachments,_militiaRifleOptics,["CUP_20Rnd_762x51_DMR","CUP_20Rnd_TE1_Green_Tracer_762x51_DMR","CUP_20Rnd_TE1_Green_Tracer_762x51_DMR","CUP_20Rnd_TE1_Green_Tracer_762x51_DMR"], [], ""], 1.5
];
(_militiaLoadoutData get "carbines") append [
	["CUP_arifle_Fort224_Grippod","",_militiaAttachments,_militiaRifleOptics,["CUP_30Rnd_545x39_Fort224_M","CUP_30Rnd_545x39_Fort224_M","CUP_30Rnd_Subsonic_545x39_Fort224_M","CUP_30Rnd_TE1_Green_Tracer_545x39_Fort224_M"], [], ""], 0.1,
	["CUP_arifle_Fort224","",_militiaAttachments,_militiaRifleOptics,["CUP_30Rnd_545x39_Fort224_M","CUP_30Rnd_545x39_Fort224_M","CUP_30Rnd_Subsonic_545x39_Fort224_M","CUP_30Rnd_TE1_Green_Tracer_545x39_Fort224_M"], [], ""], 0.25,
	["CUP_arifle_Fort221","",_militiaAttachments,_militiaRifleOptics,["CUP_30Rnd_545x39_Fort224_M","CUP_30Rnd_545x39_Fort224_M","CUP_30Rnd_Subsonic_545x39_Fort224_M","CUP_30Rnd_TE1_Green_Tracer_545x39_Fort224_M"], [], ""], 0.5,

	["CUP_arifle_X95_Grippod","",_militiaAttachments,_militiaRifleOptics,["CUP_30Rnd_556x45_X95","CUP_30Rnd_556x45_X95","CUP_30Rnd_556x45_X95","CUP_30Rnd_556x45_X95_Tracer_Green"], [], ""], 0.5,
	["CUP_arifle_X95","",_militiaAttachments,_militiaRifleOptics,["CUP_30Rnd_556x45_X95","CUP_30Rnd_556x45_X95","CUP_30Rnd_556x45_X95","CUP_30Rnd_556x45_X95_Tracer_Green"], [], ""], 1,

	["CUP_arifle_M4A1","",_militiaAttachments,_militiaRifleOptics,["CUP_20Rnd_556x45_Stanag","CUP_20Rnd_556x45_Stanag","CUP_20Rnd_556x45_Stanag","CUP_20Rnd_556x45_Stanag_Tracer_Green"], [], ""], 2
];
(_militiaLoadoutData get "grenadeLaunchers") append [
    ["CUP_arifle_M16A1GL", "","","",["CUP_20Rnd_556x45_Stanag","CUP_20Rnd_556x45_Stanag","CUP_20Rnd_556x45_Stanag","CUP_20Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 8
];
(_militiaLoadoutData get "SMGs") append [
    ["CUP_smg_MP5A5","","","",["CUP_30Rnd_9x19_MP5","CUP_30Rnd_9x19_MP5","CUP_30Rnd_9x19_MP5","CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""], 8
];
(_militiaLoadoutData get "designatedGrenadeLaunchers") append [
    ["CUP_glaunch_M79", "", "", "", ["CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203"], [], ""], 5
];
_militiaMGOptics = ["CUP_optic_Aimpoint_5000", 0.25, "CUP_optic_AC11704_Black", 0.25, "CUP_optic_HoloBlack", 0.25];
(_militiaLoadoutData get "machineGuns") append [
    ["CUP_lmg_Mk48_nohg_wdl", "", _militiaAttachments, _militiaMGOptics, ["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""], 0.25,

	["CUP_lmg_minimipara", "", "", "", ["CUP_100Rnd_TE4_Green_Tracer_556x45_M249","CUP_100Rnd_TE4_Green_Tracer_556x45_M249"], [], ""], 1.5,
	["CUP_lmg_minimi_railed", "", "", _militiaMGOptics, ["CUP_100Rnd_TE4_Green_Tracer_556x45_M249","CUP_100Rnd_TE4_Green_Tracer_556x45_M249"], [], ""], 1.5,
	["CUP_lmg_minimi", "", "", "", ["CUP_60Rnd_556x45_SureFire_Tracer_Green","CUP_60Rnd_556x45_SureFire_Tracer_Green","CUP_60Rnd_556x45_SureFire_Tracer_Green"], [], ""], 6,

	["CUP_lmg_MG3", "", "", "", ["CUP_120Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_120Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_120Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""], 0.5,

	["CUP_lmg_FNMAG", "", "", "", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""], 1.5,

	["CUP_lmg_M60", "", "", "", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""], 3,

	["CUP_lmg_M249_E2", "", "", "", ["CUP_100Rnd_TE4_Green_Tracer_556x45_M249","CUP_100Rnd_TE4_Green_Tracer_556x45_M249"], [], ""], 1,
	["CUP_lmg_M249_E1", "", "", "", ["CUP_100Rnd_TE4_Green_Tracer_556x45_M249","CUP_100Rnd_TE4_Green_Tracer_556x45_M249"], [], ""], 1.5,

	["CUP_lmg_M240", "", "", _militiaMGOptics, ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""], 0.75,
	["CUP_lmg_M240_norail", "", "", "", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""], 1
];

_militiaMarksmanOptics append ["CUP_optic_SB_11_4x20_PM", 0.5, "CUP_optic_LeupoldMk4_CQ_T", 7.5]; // Shortdot is pretty good for early game DMR scopes, so make it pretty rare.
(_militiaLoadoutData get "marksmanRifles") append [
    ["CUP_arifle_IMI_Romat_railed", "","",_militiaMarksmanOptics,["CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_M"], [], ""], 0.2,

	["CUP_srifle_M21", "","","CUP_optic_artel_m14",["CUP_20Rnd_762x51_DMR","CUP_20Rnd_762x51_DMR","CUP_20Rnd_762x51_DMR","CUP_20Rnd_TE1_Green_Tracer_762x51_DMR"], [], ""], 4,
	["CUP_srifle_M21_ris", "","",_militiaMarksmanOptics,["CUP_20Rnd_762x51_DMR","CUP_20Rnd_762x51_DMR","CUP_20Rnd_762x51_DMR","CUP_20Rnd_TE1_Green_Tracer_762x51_DMR"], [], ""], 2

];
_militiaSniperOptics append ["CUP_optic_SB_11_4x20_PM", 7.5];
(_militiaLoadoutData get "sniperRifles") append [
    ["CUP_srifle_Remington700","","","CUP_optic_Remington",["CUP_6Rnd_762x51_R700","CUP_6Rnd_762x51_R700","CUP_6Rnd_762x51_R700"], [], ""], 1,
	["CUP_srifle_LeeEnfield_rail","","",_militiaSniperOptics,["CUP_10x_303_M","CUP_10x_303_M","CUP_10x_303_M"], [], "CUP_bipod_Harris_1A2_L_BLK"], 0.25,
	["CUP_srifle_M24_blk","","",_militiaSniperOptics,["CUP_5Rnd_762x51_M24","CUP_5Rnd_762x51_M24","CUP_5Rnd_762x51_M24"], [], "CUP_bipod_Harris_1A2_L_BLK"], 2
];
///////////

(_policeLoadoutData get "sidearms") append [
    ["CUP_hgun_Browning_HP", "", "", "", ["CUP_13Rnd_9x19_Browning_HP","CUP_13Rnd_9x19_Browning_HP"], [], ""], 1,

	["CUP_hgun_CZ75", "", "", "", ["CUP_16Rnd_9x19_cz75","CUP_16Rnd_9x19_cz75"], [], ""], 1.5,
	["CUP_hgun_Compact", "", "", "", ["CUP_18Rnd_9x19_Phantom","CUP_10Rnd_9x19_Compact"], [], ""], 2,
	["CUP_hgun_Duty", "", "", "", ["16Rnd_9x21_Mag","16Rnd_9x21_green_Mag"], [], ""], 3,
	["CUP_hgun_Phantom", "", "", "", ["CUP_18Rnd_9x19_Phantom","CUP_18Rnd_9x19_Phantom"], [], ""], 2,
	["CUP_hgun_Colt1911", "", "", "", ["CUP_7Rnd_45ACP_1911","CUP_7Rnd_45ACP_1911"], [], ""], 0.5,

	["CUP_hgun_M9", "", "", "", ["CUP_15Rnd_9x19_M9","CUP_15Rnd_9x19_M9"], [], ""], 1.25,
	["CUP_hgun_M9A1", "", "", "", ["CUP_15Rnd_9x19_M9","CUP_15Rnd_9x19_M9"], [], ""], 0.75,

	["CUP_hgun_Mk23", "", "", "", ["CUP_12Rnd_45ACP_mk23","CUP_12Rnd_45ACP_mk23"], [], ""], 0.1,

	["CUP_hgun_P30L_blk", "", "", "", ["CUP_17Rnd_9x19_P30L","CUP_17Rnd_9x19_P30L"], [], ""], 0.25,
	["CUP_hgun_P30L_Match_blk", "", "", "", ["CUP_17Rnd_9x19_P30L","CUP_17Rnd_9x19_P30L"], [], ""], 0.1,

	["CUP_hgun_M17_Black", "", "", "", ["CUP_hgun_M17_Black","CUP_17Rnd_9x19_M17_Green"], [], ""], 1,

	["CUP_hgun_Glock17_blk", "", "", "", ["CUP_17Rnd_9x19_glock17","CUP_17Rnd_9x19_glock17"], [], ""], 1.5
];

(_policeLoadoutData get "SMGs") append [
    ["CUP_smg_MP5A5","","","",["CUP_30Rnd_9x19_MP5","CUP_30Rnd_9x19_MP5","CUP_30Rnd_9x19_MP5","CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""], 6,

	["CUP_sgun_SPAS12","","","",["CUP_8Rnd_12Gauge_Pellets_No00_Buck","CUP_8Rnd_12Gauge_Pellets_No4_Buck","CUP_8Rnd_12Gauge_Slug","CUP_8Rnd_12Gauge_Slug"], [], ""], 1,

	["CUP_sgun_M1014_Entry_vfg","","","",["CUP_6Rnd_12Gauge_Pellets_No00_Buck","CUP_6Rnd_12Gauge_Pellets_No4_Buck","CUP_6Rnd_12Gauge_Pellets_No4_Bird","CUP_6Rnd_12Gauge_Slug"], [], ""], 0.25,
	["CUP_sgun_M1014_Entry","","","",["CUP_6Rnd_12Gauge_Pellets_No00_Buck","CUP_6Rnd_12Gauge_Pellets_No4_Buck","CUP_6Rnd_12Gauge_Pellets_No4_Bird","CUP_6Rnd_12Gauge_Slug"], [], ""], 0.75,
	["CUP_sgun_M1014_solidstock","","","",["CUP_8Rnd_12Gauge_Pellets_No00_Buck","CUP_8Rnd_12Gauge_Pellets_No4_Buck","CUP_8Rnd_12Gauge_Slug","CUP_8Rnd_12Gauge_Slug"], [], ""], 0.75,
	["CUP_sgun_M1014_vfg","","","",["CUP_8Rnd_12Gauge_Pellets_No00_Buck","CUP_8Rnd_12Gauge_Pellets_No4_Buck","CUP_8Rnd_12Gauge_Slug","CUP_8Rnd_12Gauge_Slug"], [], ""], 0.5,
	["CUP_sgun_M1014","","","",["CUP_8Rnd_12Gauge_Pellets_No00_Buck","CUP_8Rnd_12Gauge_Pellets_No4_Buck","CUP_8Rnd_12Gauge_Slug","CUP_8Rnd_12Gauge_Slug"], [], ""], 1.5,

	["CUP_sgun_CZ584_RIS","","","",["CUP_1Rnd_12Gauge_Pellets_No00_Buck","CUP_1Rnd_12Gauge_Pellets_No4_Buck","CUP_1Rnd_12Gauge_Pellets_No4_Bird","CUP_1Rnd_12Gauge_Slug"], ["CUP_1Rnd_762x51_CZ584","CUP_1Rnd_762x51_CZ584"], ""], 0.2,
	["CUP_sgun_CZ584","","","",["CUP_1Rnd_12Gauge_Pellets_No00_Buck","CUP_1Rnd_12Gauge_Pellets_No4_Buck","CUP_1Rnd_12Gauge_Pellets_No4_Bird","CUP_1Rnd_12Gauge_Slug"], ["CUP_1Rnd_762x51_CZ584","CUP_1Rnd_762x51_CZ584"], ""], 0.2,

	["CUP_smg_BallisticShield_Sa61","","CUP_acc_SF_XC1","",["CUP_50Rnd_B_765x17_Ball_M","CUP_20Rnd_B_765x17_Ball_M","CUP_20Rnd_B_765x17_Ball_M","CUP_10Rnd_B_765x17_Ball_M"], [], "CUP_decal_BallisticShield_Police_worn"], 0.2,
	["CUP_smg_BallisticShield_PP19","","CUP_acc_Flashlight","",["CUP_30Rnd_9x19_Vityaz","CUP_30Rnd_9x19AP_Vityaz","CUP_10Rnd_9x19_Saiga9","CUP_10Rnd_9x19_Saiga9"], [], "CUP_decal_BallisticShield_Police_worn"], 0.2,
	["CUP_hgun_BallisticShield_PMM","","CUP_acc_LCU_PM_Laser","",["CUP_12Rnd_9x18_PMM_M","CUP_12Rnd_9x18_PMM_M","CUP_12Rnd_9x18_PMM_M","CUP_12Rnd_9x18_PMM_M"], [], "CUP_decal_BallisticShield_Police_worn"], 0.2,
	["CUP_smg_BallisticShield_MP7","","CUP_acc_Flashlight","",["CUP_40Rnd_46x30_MP7","CUP_40Rnd_46x30_MP7","CUP_40Rnd_46x30_MP7_Green_Tracer","CUP_20Rnd_46x30_MP7"], [], "CUP_decal_BallisticShield_Police_worn"], 0.5,
	["CUP_hgun_BallisticShield_Armed_M9","","CUP_acc_Glock17_Flashlight","",["CUP_15Rnd_9x19_M9","CUP_15Rnd_9x19_M9","CUP_15Rnd_9x19_M9","CUP_15Rnd_9x19_M9"], [], "CUP_decal_BallisticShield_Police_worn"], 0.5
];

_aa pushBack "gm_ge_army_gepard1a1_noinsignia";
_basic append ["gm_ge_army_k125","gm_dk_army_bibera0_noinsignia"];
_lightTanks append ["gm_dk_army_Leopard1a3_noinsignia","gm_ge_army_Leopard1a1_noinsignia","gm_ge_army_Leopard1a1a2_noinsignia","gm_ge_army_Leopard1a3a1_noinsignia","gm_ge_army_Leopard1a5_noinsignia"];
_militiaAPCs append ["gm_ge_army_fuchsa0_reconnaissance_noinsignia","gm_ge_army_fuchsa0_engineer_noinsignia","gm_ge_army_fuchsa0_command_noinsignia","gm_ge_army_luchsa2_noinsignia","gm_ge_army_luchsa1_noinsignia","gm_dk_army_m113a1dk_apc_noinsignia","gm_dk_army_m113a1dk_command_noinsignia","gm_dk_army_m113a1dk_engineer_noinsignia","gm_dk_army_m113a2dk_noinsignia","gm_ge_army_m113a1g_apc_noinsignia","gm_ge_army_m113a1g_apc_milan_noinsignia","gm_ge_army_m113a1g_command_noinsignia"];
_IFVs append ["gm_dk_army_m113a2dk_noinsignia","gm_ge_army_marder1a1plus_noinsignia","gm_ge_army_marder1a1a_noinsignia","gm_ge_army_marder1a2_noinsignia"];
_militiaTrucks append ["gm_pl_army_ural4320_cargo","gm_ge_army_u1300l_cargo"];
_militiaCars append ["gm_ge_army_iltis_cargo","gm_pl_army_uaz469_cargo","gm_dk_army_typ253_cargo","gm_dk_army_typ247_cargo","gm_dk_army_typ1200_cargo"];
_militiaLightArmed append ["gm_ge_army_iltis_milan","gm_ge_army_iltis_mg3"];
_policeVehs append ["gm_gc_pol_p601","gm_ge_pol_typ1200","gm_ge_pol_typ253","gm_ge_pol_w123"];
_airborneVehicles pushBack "gm_dk_army_m113a2dk_noinsignia";
_Trucks append ["gm_ge_army_u1300l_cargo","gm_ge_army_kat1_451_cargo"];
_cargoTrucks append ["gm_dk_army_u1300l_container","gm_ge_army_kat1_454_cargo","gm_ge_army_kat1_451_container","gm_ge_army_kat1_452_container"];
_ammoTrucks append ["gm_ge_army_kat1_451_reammo","gm_ge_army_kat1_454_reammo"];
_repairTrucks append ["gm_ge_army_u1300l_repair","gm_dk_army_bpz2a0_noinsignia"];
_fuelTrucks pushBack "gm_ge_army_kat1_451_refuel";
_medicalTrucks append ["gm_ge_army_m113a1g_medic_noinsignia","gm_ge_army_u1300l_medic"];
_helisLight append ["gm_ge_army_bo105m_vbh_noinsignia","gm_ge_army_bo105p1m_vbh_noinsignia","gm_ge_army_bo105p1m_vbh_swooper_noinsignia"];
_transportHelicopters append ["gm_ge_army_ch53g_noinsignia","gm_ge_army_ch53gs_noinsignia"];
_helisAttack append ["gm_ge_army_bo105p_pah1_noinsignia"];

_airPatrol append ["gm_ge_army_bo105m_vbh_noinsignia","gm_ge_army_bo105p1m_vbh_noinsignia","gm_ge_army_bo105p1m_vbh_swooper_noinsignia"];


if (isClass (configFile >> "cfgVehicles" >> "gmx_aaf_m113a2dk_wdl")) then {
_staticMG pushBack "gmx_aaf_mg3_aatripod";
_staticAT pushBack "gmx_aaf_milan_launcher_tripod";
_basic append ["gm_ge_army_k125","gmx_aaf_brpz1_wdl","gm_gc_army_ural44202_noinsignia"];
_planesTransport append ["gmx_aaf_do28d2_wdl","gm_gc_airforce_l410t_noinsignia"];
_helisLight append ["gmx_aaf_bo105m_vbh_wdl","gmx_aaf_bo105p1m_vbh_wdl","gmx_aaf_bo105p1m_vbh_swooper_wdl","gm_gc_airforce_mi2p_noinsignia","gm_gc_bgs_mi2p_noinsignia","gm_gc_airforce_mi2t_noinsignia"];
_helisLightAttack append ["gmx_aaf_bo105p_pah1_wdl","gm_gc_airforce_mi2us_noinsignia","gm_gc_airforce_mi2urn_noinsignia","gm_gc_bgs_mi2us_noinsignia"];
_helisAttack append ["gmx_aaf_bo105p_pah1a1_wdl","gm_pl_airforce_mi2urpg_noinsignia","gm_pl_airforce_mi2urs_noinsignia","gm_pl_airforce_mi2urp_noinsignia","gm_ge_army_bo105p_pah1a1_noinsignia"];
_transportHelicopters append ["gmx_aaf_ch53g_wdl","gmx_aaf_ch53gs_wdl"];
_artillery append ["gm_pl_army_2s1","gm_pl_army_ural375d_mlrs","gmx_aaf_m109_wdl","gmx_aaf_kat1_463_mlrs_wdl"];
_militiaAPCs append ["gm_gc_army_btr60pa_noinsignia","gm_gc_army_btr60pa_dshkm_noinsignia","gm_gc_army_btr60pb_noinsignia","gm_gc_army_btr60pu12_noinsignia","gm_pl_army_ot64a_noinsignia",
"gmx_aaf_luchsa1_wdl","gmx_aaf_luchsa2_wdl","gm_pl_army_brdm2","gm_gc_army_brdm2rkh",
"gmx_aaf_m113a1g_apc_wdl","gmx_aaf_m113a1g_apc_milan_wdl","gmx_aaf_m113a1g_command_wdl","gmx_aaf_marder1a1plus_wdl","gmx_aaf_marder1a1a_wdl","gmx_aaf_marder1a2_wdl","gmx_aaf_m113a2dk_wdl",
"gmx_aaf_fuchsa0_command_wdl","gmx_aaf_fuchsa0_engineer_wdl","gmx_aaf_fuchsa0_reconnaissance_wdl"
];
_militiaTrucks append ["gmx_aaf_kat1_451_cargo_wdl","gmx_aaf_u1300l_cargo_wdl","gm_gc_bgs_ural4320_cargo_noinsignia"];
_militiaCars append ["gm_dk_army_typ1200_cargo","gm_dk_army_typ253_cargo","gm_dk_army_typ253_mp","gm_gc_bgs_p601_noinsignia","gm_gc_bgs_uaz469_cargo_noinsignia","gm_gc_army_brdm2um_noinsignia","gmx_aaf_iltis_cargo_wdl"];
_militiaLightArmed append ["gmx_aaf_iltis_milan_wdl","gm_ge_army_iltis_mg3","gm_gc_army_brdm2_noinsignia","gm_gc_army_uaz469_spg9_noinsignia","gm_gc_army_uaz469_dshkm_noinsignia"];
_policeVehs append ["gm_gc_pol_p601","gm_ge_pol_typ1200","gm_ge_pol_typ253","gm_ge_pol_w123"];
_lightTanks append ["gm_gc_army_bmp1sp2_noinsignia","gm_gc_army_pt76b_noinsignia",
"gmx_aaf_leopard1a1a1_wdl","gm_ge_army_Leopard1a1a2_noinsignia","gmx_aaf_leopard1a3_wdl","gm_ge_army_Leopard1a3a1_noinsignia","gmx_aaf_leopard1a5_wdl","gm_gc_army_t55_noinsignia",
"gm_gc_army_t55a_noinsignia","gm_gc_army_t55ak_noinsignia","gm_gc_army_t55am2_noinsignia","gm_gc_army_t55am2b_noinsignia","gm_pl_army_t55ak_noinsignia"
];
_airborneVehicles append ["gmx_aaf_luchsa1_wdl","gmx_aaf_luchsa2_wdl","gmx_aaf_fuchsa0_reconnaissance_wdl","gmx_aaf_fuchsa0_command_wdl"];
_aa append ["gmx_aaf_gepard1a1_wdl","gm_gc_army_zsu234v1_noinsignia"];
_cargoTrucks append ["gmx_aaf_kat1_451_container_wdl","gmx_aaf_kat1_454_cargo_wdl","gmx_aaf_u1300l_container_wdl","gm_dk_army_typ247_cargo","gm_gc_bgs_ural4320_cargo_noinsignia"];
_ammoTrucks append ["gmx_aaf_kat1_451_reammo_wdl","gmx_aaf_kat1_454_reammo_wdl","gm_gc_bgs_ural4320_reammo_noinsignia"];
_repairTrucks append ["gmx_aaf_u1300l_repair_wdl","gmx_aaf_bpz2a0_wdl","gm_gc_bgs_ural4320_repair_noinsignia"];
_fuelTrucks append ["gmx_aaf_kat1_451_refuel_wdl","gm_gc_bgs_ural375d_refuel_noinsignia"];
_medicalTrucks append ["gmx_aaf_u1300l_medic_wdl","gmx_aaf_m113a1g_medic_wdl","ggm_gc_bgs_ural375d_medic_noinsignia"];

_airPatrol append ["gmx_aaf_bo105m_vbh_wdl","gmx_aaf_bo105p1m_vbh_wdl","gmx_aaf_bo105p1m_vbh_swooper_wdl","gm_gc_airforce_mi2p_noinsignia","gm_gc_bgs_mi2p_noinsignia","gm_gc_airforce_mi2t_noinsignia","gmx_aaf_bo105p_pah1_wdl","gm_gc_airforce_mi2us_noinsignia","gm_gc_airforce_mi2urn_noinsignia","gm_gc_bgs_mi2us_noinsignia"];
};

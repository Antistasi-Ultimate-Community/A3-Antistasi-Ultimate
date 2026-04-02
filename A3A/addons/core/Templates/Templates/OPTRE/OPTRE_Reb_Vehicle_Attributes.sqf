["attributesVehicles", [
    ["OPTRE_M12_VBIED_Big", ["rebCost", 5000]],
    ["OPTRE_M12_VBIED", ["rebCost", 3000]],
    ["a3a_OPTRE_M411_APC_INS", ["rebCost", 900]],
    ["OPTRE_M12_ins_APC", ["rebCost", 500]],
    ["OPTRE_M12_FAV_APC_CMA", ["rebCost", 500]],
    ["OPTRE_M813_TT_CMA", ["rebCost", 400]],
    ["OPTRE_M12A1_LRV_ins", ["rebCost", 1500]],
    ["OPTRE_M12A1_LRV_CMA", ["rebCost", 1500]],
    ["OPTRE_M12G1_LRV_CMA", ["rebCost", 15000]],
    ["OPTRE_M12R_AA_ins", ["rebCost", 2000]],
    ["OPTRE_M12R_AA_CMA", ["rebCost", 2000]],
    ["optre_catfish_ins_mg_f", ["rebCost", 750]],
    ["optre_catfish_cma_mg_f", ["rebCost", 750]],
    ["OPTRE_M247a1_Low_Static_Innie_MMG", ["rebCost", 400]],
    ["OPTRE_M247a1_Static_Innie_MMG", ["rebCost", 400]],
    ["OPTRE_AIE_486H_Low_Static_HMG_Innie", ["rebCost", 600]],
    ["OPTRE_AIE_486H_Static_HMG_Innie", ["rebCost", 650]],
    ["OPTRE_Static_M41_Ins", ["rebCost", 900]],
    ["OPTRE_Static_M41_CMA", ["rebCost", 900]],
    ["OPTRE_Static_ATGM_Ins", ["rebCost", 1400]],
    ["OPTRE_Static_ATGM_CMA", ["rebCost", 1400]],
    ["OPTRE_M460AGL_Low_Static_GMG_innie", ["rebCost", 900]],
    ["OPTRE_M460AGL_Static_GMG_innie", ["rebCost", 950]],
    ["OPTRE_M460AGL_Static_GMG_DME", ["rebCost", 950]],
    ["OPTRE_Scythe_INS", ["rebCost", 6000]],
    ["OPTRE_Scythe_AA_INS", ["rebCost", 7000]],
    ["OPTRE_Static_AA_Ins", ["rebCost", 2000]],
    ["OPTRE_Static_AA_CMA", ["rebCost", 2000]],
    ["OPTRE_Lance_INS", ["rebCost", 15000]],
    ["OPTRE_Static_Gauss_CMA", ["rebCost", 13000]]
]] call _fnc_saveToTemplate;

/* if (isClass (configFile >> "CfgPatches" >> "RF_Vehicles")) then {
    (["attributesVehicles"] call _fnc_getFromTemplate) append [
        
    ];
}; */ //leave it here in case there is some sub mod
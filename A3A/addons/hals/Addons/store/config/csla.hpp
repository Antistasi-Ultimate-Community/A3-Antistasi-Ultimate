	class riflesCSLA 
	{
		displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_CSLA", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";	
			ITEM(CSLA_rSa61, 600, RIFLE_STOCK);	
			ITEM(CSLA_Sa24, 600, RIFLE_STOCK);	
			ITEM(CSLA_Sa26, 600, RIFLE_STOCK);	
			ITEM(CSLA_Sa58P, 600, RIFLE_STOCK);	
			ITEM(CSLA_Sa58V, 600, RIFLE_STOCK);	
			ITEM(CSLA_VG70, 600, RIFLE_STOCK);	
			ITEM(US85_MPVN, 600, RIFLE_STOCK);	
			ITEM(US85_MPVSD, 600, RIFLE_STOCK);	
			ITEM(US85_M16A2, 600, RIFLE_STOCK);	
			ITEM(US85_M16A1, 600, RIFLE_STOCK);	
			ITEM(US85_M16A2CAR, 600, RIFLE_STOCK);	
			ITEM(US85_M16A2GL, 600, RIFLE_STOCK);	
			ITEM(US85_M16A2CARGL, 600, RIFLE_STOCK);	
			ITEM(US85_FAL, 600, RIFLE_STOCK);	
			ITEM(US85_FALf, 600, RIFLE_STOCK);
			ITEM(CSLA_Pu57, 600, RIFLE_STOCK);	
			ITEM(CSLA_Pu52, 600, RIFLE_STOCK);

			ITEM(US85_ANPAQ1, 1000, RIFLE_STOCK);		
	}; 

///mg
	class mgCSLA 
	{
		displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_CSLA", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
			ITEM(CSLA_UK59L, 1000, RIFLE_STOCK);	
			ITEM(US85_M249, 1000, RIFLE_STOCK);	
			ITEM(US85_M60, 1000, RIFLE_STOCK);	
			ITEM(US85_M60E3SB, 1000, RIFLE_STOCK);
			ITEM(US85_M60E3LB, 1000, RIFLE_STOCK);	
			ITEM(CSLA_LK57_50, 1000, RIFLE_STOCK);
			ITEM(CSLA_LK52_25, 800, RIFLE_STOCK);
	}; 

////sniperRifles
	class sniperRiflesCSLA 
	{
	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_CSLA", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";	
			ITEM(CSLA_OP63, 1000, RIFLE_STOCK);	
			ITEM(CSLA_HuntingRifle, 1000, RIFLE_STOCK);	
			ITEM(US85_M21, 1000, RIFLE_STOCK);	
			ITEM(US85_M14, 1000, RIFLE_STOCK);	
			ITEM(CSLA_OP54, 1000, RIFLE_STOCK);
	}; 

///launchers
	class launchersCSLA
	{
		displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_CSLA", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";
			ITEM(CSLA_RPG75, 1250, RIFLE_STOCK);	
			ITEM(CSLA_9K32, 1250, RIFLE_STOCK);	
			ITEM(US85_LAW72, 1250, RIFLE_STOCK);	
			ITEM(US85_M136, 1250, RIFLE_STOCK);	
			ITEM(US85_SMAW, 1250, RIFLE_STOCK);	
			ITEM(US85_M47, 1250, RIFLE_STOCK);	
			ITEM(US85_FIM92, 1250, RIFLE_STOCK);	
			ITEM(CSLA_P27, 1000, RIFLE_STOCK);	
	}; 

	class magazineslaunchersCSLA
	{
		displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_CSLA", localize "STR_A3AU_launcherAmmo"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";	
            ITEM(CSLA_RPG75_Mag, 200, MAGAZINE_STOCK);	
            ITEM(CSLA_PG7M110, 200, MAGAZINE_STOCK);	
            ITEM(CSLA_9M32M, 200, MAGAZINE_STOCK);	
            ITEM(US85_LAW72_Mag, 200, MAGAZINE_STOCK);	
            ITEM(US85_M136_Mag, 200, MAGAZINE_STOCK);	
            ITEM(US85_SMAW_HEAA, 200, MAGAZINE_STOCK);	
            ITEM(US85_M47_Mag, 200, MAGAZINE_STOCK);	
            ITEM(US85_FIM92_Mag, 200, MAGAZINE_STOCK);
			ITEM(CSLA_NbP27, 200, MAGAZINE_STOCK);
    };
////handguns
	class handgunsCSLA 
	{
		displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_CSLA", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(CSLA_Pi52, 200, RIFLE_STOCK);	
			ITEM(CSLA_Pi75sr, 200, RIFLE_STOCK);	
			ITEM(CSLA_Pi75lr, 200, RIFLE_STOCK);	
			ITEM(CSLA_Pi82, 200, RIFLE_STOCK);	
			ITEM(CSLA_Sa61, 200, RIFLE_STOCK);	
			ITEM(US85_1911, 200, RIFLE_STOCK);	
			ITEM(US85_M9, 200, RIFLE_STOCK);
			ITEM(US85_Mk23, 250, RIFLE_STOCK);		
		}; 

	class magazinesCSLA
	{
		displayName = __EVAL(formatText["%1 %2", localize "STR_A3AU_CSLA", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

            ITEM(CSLA_Pi52_8rnd_7_62Pi52, 20, MAGAZINE_STOCK);	
            ITEM(CSLA_Pi75_15Rnd_9Luger, 20, MAGAZINE_STOCK);	
            ITEM(CSLA_Pi82_12rnd_9Pi82, 20, MAGAZINE_STOCK);	
            ITEM(CSLA_Sa61_10rnd_7_65Pi27, 20, MAGAZINE_STOCK);	
            ITEM(US85_1911_7Rnd_045ACP, 20, MAGAZINE_STOCK);	
            ITEM(US85_M9_15Rnd_9Luger, 20, MAGAZINE_STOCK);
			ITEM(US85_Mk23_12Rnd_045ACP, 20, MAGAZINE_STOCK);

            ITEM(CSLA_Sa61_20rnd_7_65Pi27, 50, MAGAZINE_STOCK);	
            ITEM(CSLA_Sa24_32rnd_7_62Pi52, 50, MAGAZINE_STOCK);	
            ITEM(CSLA_Sa58_30rnd_7_62vz43, 50, MAGAZINE_STOCK);	
            ITEM(US85_MPV_30Rnd_9Luger, 50, MAGAZINE_STOCK);	
            ITEM(US85_30Rnd_556x45, 50, MAGAZINE_STOCK);	
            ITEM(US85_20Rnd_556x45, 50, MAGAZINE_STOCK);

            ITEM(CSLA_UK59_50rnd_7_62vz59, 50, MAGAZINE_STOCK);	
            ITEM(US85_200Rnd_556x45, 50, MAGAZINE_STOCK);	
            ITEM(US85_100Rnd_762x51, 50, MAGAZINE_STOCK);

            ITEM(CSLA_OP63_10rnd_7_62Odst59, 50, MAGAZINE_STOCK);	
            ITEM(CSLA_10Rnd_762hunt, 50, MAGAZINE_STOCK);	
            ITEM(US85_20Rnd_762x51, 50, MAGAZINE_STOCK);

			ITEM(CSLA_Pu57_10rnd_7_62vz43, 50, MAGAZINE_STOCK);
			ITEM(CSLA_Pu57_10rnd_7_62Sv43, 50, MAGAZINE_STOCK);
			ITEM(CSLA_Pu57_10rnd_7_62Cv43, 5, MAGAZINE_STOCK);

			ITEM(CSLA_Pu52_10rnd_7_62vz52, 50, MAGAZINE_STOCK);
			ITEM(CSLA_Pu52_10rnd_7_62Sv52, 50, MAGAZINE_STOCK);
			ITEM(CSLA_Pu52_10rnd_7_62Cv52, 5, MAGAZINE_STOCK);

			ITEM(CSLA_OP54_5rnd_7_62PZ59, 50, MAGAZINE_STOCK);
			ITEM(CSLA_OP54_5rnd_7_62TzOdst59, 50, MAGAZINE_STOCK);
			ITEM(CSLA_OP54_5rnd_7_62Odst59, 50, MAGAZINE_STOCK);
			ITEM(CSLA_OP54_5rnd_7_62Cv59, 5, MAGAZINE_STOCK);

			ITEM(CSLA_OP54_5rnd_7_62PZ59, 50, MAGAZINE_STOCK);
			ITEM(CSLA_OP54_5rnd_7_62TzOdst59, 50, MAGAZINE_STOCK);
			ITEM(CSLA_OP54_5rnd_7_62Odst59, 50, MAGAZINE_STOCK);
			ITEM(CSLA_OP54_5rnd_7_62Cv59, 5, MAGAZINE_STOCK);

			ITEM(US85_ANPAQ1_battery, 100, MAGAZINE_STOCK);

			ITEM(CSLA_LK57_50rnd_7_62vz43, 50, MAGAZINE_STOCK);
			ITEM(CSLA_LK57_50rnd_7_62PZ43, 50, MAGAZINE_STOCK);
			ITEM(CSLA_LK57_50rnd_7_62Sv43, 50, MAGAZINE_STOCK);
			ITEM(CSLA_LK57_50rnd_7_62Cv43, 5, MAGAZINE_STOCK);

			ITEM(CSLA_LK52_25rnd_7_62vz52, 50, MAGAZINE_STOCK);
			ITEM(CSLA_LK52_25rnd_7_62PZ52, 50, MAGAZINE_STOCK);
			ITEM(CSLA_LK52_25rnd_7_62Sv52, 50, MAGAZINE_STOCK);
			ITEM(CSLA_LK52_25rnd_7_62Cv52, 5, MAGAZINE_STOCK);
    };
////attachments
		class attachmentsCSLA
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_CSLA", localize "STR_A3AU_muzzles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa";

			ITEM(CSLA_ZD4x8, 150, MZ_STOCK);

			ITEM(CSLA_NSPU, 150, MZ_STOCK);

			ITEM(CSLA_Sa58bnt, 200, MZ_STOCK);

			ITEM(CSLA_Sa58bpd, 200, MZ_STOCK);

			ITEM(CSLA_PSO1_OP63, 200, MZ_STOCK);

			ITEM(CSLA_NSPU_OP63, 200, MZ_STOCK);

			ITEM(CSLA_UK59_ZD4x8, 200, MZ_STOCK);

			ITEM(CSLA_PGO7, 150, MZ_STOCK);

			ITEM(US85_M9tlm, 150, MZ_STOCK);

			ITEM(US85_sc4x20_M16, 200, MZ_STOCK);

			ITEM(US85_sc2000_M16, 200, MZ_STOCK);

			ITEM(US85_ANPVS4_M16, 200, MZ_STOCK);

			ITEM(US85_M16fl, 200, MZ_STOCK);

			ITEM(US85_M16tlm, 200, MZ_STOCK);

			ITEM(US85_ANPVS4_M21, 150, MZ_STOCK);

			ITEM(US85_M21tlm, 150, MZ_STOCK);

			ITEM(US85_M14bpd, 200, MZ_STOCK);

			ITEM(US85_scFAL, 200, MZ_STOCK);

			ITEM(US85_ANPVS4_FAL, 200, MZ_STOCK);

			ITEM(US85_FALbpd, 200, MZ_STOCK);

			ITEM(US85_sc4x20M249, 200, MZ_STOCK);

			ITEM(US85_sc2000M249, 200, MZ_STOCK);

			ITEM(US85_ANPVS4_M60, 200, MZ_STOCK);

			ITEM(CSLA_ZD4x8_Pu52, 200, MZ_STOCK);

			ITEM(CSLA_PD54, 200, MZ_STOCK);

			ITEM(US85_MPVtlm, 200, MZ_STOCK);

		};

		class navigationCSLA
		{
			displayName = __EVAL(formatText ["%1 %2, %3 %4 %5", localize "STR_A3AU_CSLA", localize "STR_A3AU_gps", localize "STR_A3AU_binoculars", localize "STR_A3AU_and", localize "STR_A3AU_nvgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\compass_ca.paa";

			ITEM(US85_ANPVS5_Goggles, 1000, NN_STOCK);
			ITEM(CSLA_nokto, 1000, NN_STOCK);

		};

		class miscCSLA 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_CSLA", localize "STR_A3AU_misc"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			ITEM(CSLA_helmet53, 500, MISC_STOCK);
			ITEM(CSLA_helmet53d, 750, MISC_STOCK);
			ITEM(CSLA_helmet53m, 500, MISC_STOCK);
			ITEM(CSLA_helmet53j, 1000, MISC_STOCK);
			ITEM(CSLA_helmet53G, 500, MISC_STOCK);
			ITEM(CSLA_helmet53G_on, 750, MISC_STOCK);
			ITEM(US85_helmetPASGT, 500, MISC_STOCK);
			ITEM(US85_helmetPASGTr, 1000, MISC_STOCK);
			ITEM(US85_helmetPASGTG, 500, MISC_STOCK);
			ITEM(US85_helmetM1g, 750, MISC_STOCK);
			ITEM(US85_helmetM1c, 500, MISC_STOCK);
			ITEM(US85_helmetDH132 1000, MISC_STOCK);
			ITEM(US85_helmetDH132G, 500, MISC_STOCK);
			ITEM(US85_helmetDH132G_on, 750, MISC_STOCK);
			ITEM(US85_helmetPlt, 500, MISC_STOCK);
			ITEM(US85_helmetPltC, 1000, MISC_STOCK);
			ITEM(US85_helmetPltAttack 1000, MISC_STOCK);
			ITEM(US85_helmetPltAttackC, 500, MISC_STOCK);
			ITEM(US85_helmetSFL, 750, MISC_STOCK);
			ITEM(US85_helmetSFLG, 500, MISC_STOCK);
			ITEM(US85_helmetSFLG_on, 1000, MISC_STOCK);
			ITEM(AFMC_helmetMk6 1000, MISC_STOCK);
			ITEM(AFMC_helmetMk6para, 500, MISC_STOCK);
			ITEM(AFMC_helmetMk6r, 750, MISC_STOCK);
			ITEM(AFMC_helmetM1c, 500, MISC_STOCK);

			ITEM(FIA_Budajka, 100, MISC_STOCK);
			ITEM(CSLA_BudajkaGy, 100, MISC_STOCK);
			ITEM(CSLA_BudajkaBk, 100, MISC_STOCK);
			ITEM(CSLA_policeCap, 500, MISC_STOCK);
			ITEM(CSLA_helmetPara, 200, MISC_STOCK);
			ITEM(FIA_Hairs_Silver, 1000, MISC_STOCK);
			ITEM(FIA_Hairs_Brown, 1000, MISC_STOCK);
			ITEM(FIA_Radiovka, 200, MISC_STOCK);
			ITEM(CSLA_RadiovkaGy, 200, MISC_STOCK);
			ITEM(CSLA_RadiovkaBk, 200, MISC_STOCK);
			ITEM(FIA_Usanka, 200, MISC_STOCK);

			ITEM(CSLA_capMlok, 200, MISC_STOCK);
			ITEM(FIA_capMlok, 200, MISC_STOCK);
			ITEM(CSLA_cap, 200, MISC_STOCK);
			ITEM(FIA_cap, 200, MISC_STOCK);
			ITEM(CSLA_capGn, 200, MISC_STOCK);
			ITEM(FIA_capGn, 200, MISC_STOCK);
			ITEM(CSLA_capDes, 200, MISC_STOCK);
			ITEM(CSLA_capClds, 200, MISC_STOCK);
			ITEM(FIA_capClds, 200, MISC_STOCK);
			ITEM(CSLA_capBk, 200, MISC_STOCK);
			ITEM(FIA_capBk, 200, MISC_STOCK);
			ITEM(US85_marineCap_d, 200, MISC_STOCK);
			ITEM(US85_patrolCap, 200, MISC_STOCK);
			ITEM(US85_marineCap, 200, MISC_STOCK);
			ITEM(US85_patrolCap_d, 200, MISC_STOCK);
			ITEM(US85_ptCap, 200, MISC_STOCK);

			ITEM(CSLA_hat85Mlok, 200, MISC_STOCK);
			ITEM(FIA_hat85Mlok, 200, MISC_STOCK);
			ITEM(CSLA_hat85bMlok, 200, MISC_STOCK);
			ITEM(FIA_hat85bMlok, 200, MISC_STOCK);
			ITEM(CSLA_hat85bGn, 200, MISC_STOCK);
			ITEM(FIA_hat85bGn, 200, MISC_STOCK);
			ITEM(CSLA_hat85Gn, 200, MISC_STOCK);
			ITEM(FIA_hat85Gn, 200, MISC_STOCK);
			ITEM(CSLA_hat85bDes, 200, MISC_STOCK);
			ITEM(CSLA_hat85Des, 200, MISC_STOCK);
			ITEM(CSLA_hat85bClds, 200, MISC_STOCK);
			ITEM(FIA_hat85bClds, 200, MISC_STOCK);
			ITEM(CSLA_hat85Clds, 200, MISC_STOCK);
			
			ITEM(FIA_hat85Clds, 200, MISC_STOCK);
			ITEM(US85_hat_d, 200, MISC_STOCK);
			ITEM(US85_hat, 200, MISC_STOCK);
			ITEM(AFMC_booniehatLizard, 200, MISC_STOCK);
			ITEM(FIA_hat85bDes, 200, MISC_STOCK);
			ITEM(FIA_hat85Des, 200, MISC_STOCK);

			ITEM(CSLA_beretR, 200, MISC_STOCK);
			ITEM(CSLA_beretM, 200, MISC_STOCK);
			ITEM(AFMC_beretRd, 200, MISC_STOCK);
			ITEM(AFMC_beretCo, 200, MISC_STOCK);
			ITEM(AFMC_beretGn, 200, MISC_STOCK);
			ITEM(AFMC_beretBe, 200, MISC_STOCK);
			ITEM(AFMC_beretBk, 200, MISC_STOCK);
			
			ITEM(US85_beanie, 200, MISC_STOCK);

			ITEM(CSLA_helmetZSh5Ho, 500, MISC_STOCK);
			ITEM(CSLA_helmetZSh5Hc, 500, MISC_STOCK);
			ITEM(CSLA_helmetZSh5o, 500, MISC_STOCK);
			ITEM(CSLA_helmetZSh5c, 500, MISC_STOCK);
			ITEM(CSLA_helmet53jG, 500, MISC_STOCK);
			ITEM(CSLA_helmet53dG, 500, MISC_STOCK);
			
			ITEM(US85_helmetPASGTG_d, 500, MISC_STOCK);
			ITEM(US85_helmetPASGT_d, 500, MISC_STOCK);
			
			ITEM(CSLA_helmet53mG, 500, MISC_STOCK);
			ITEM(CSLA_helmet53G_on, 500, MISC_STOCK);

			ITEM(US85_helmetHGU55P, 500, MISC_STOCK);
			ITEM(US85_helmetHGU55PC, 500, MISC_STOCK);
			ITEM(CSLA_helmetPOP6, 500, MISC_STOCK);
			ITEM(CSLA_helmetT28DesG_mask, 500, MISC_STOCK);
			ITEM(CSLA_helmetT28G_on, 500, MISC_STOCK);
			ITEM(CSLA_helmetT28G, 500, MISC_STOCK);
			ITEM(CSLA_helmetT28DesG_on_mask, 500, MISC_STOCK);
			ITEM(CSLA_helmetT28, 500, MISC_STOCK);

			ITEM(FIA_helmet53DesG, 500, MISC_STOCK);
			ITEM(FIA_helmet53Des, 500, MISC_STOCK);

			///vests
			ITEM(US85_grVest, 1000, MISC_STOCK);
			ITEM(US85_grV_ofc, 1000, MISC_STOCK);
			ITEM(US85_grVm_M16GL, 1000, MISC_STOCK);
			ITEM(US85_grV_M16GL, 1000, MISC_STOCK);
			ITEM(US85_grV_M9, 1000, MISC_STOCK);
			ITEM(US85_grV_MG, 1000, MISC_STOCK);
			ITEM(US85_grV_MPV, 1000, MISC_STOCK);
			ITEM(US85_grSF_M16, 1000, MISC_STOCK);
			ITEM(US85_grSF_M16GL, 1000, MISC_STOCK);
			ITEM(US85_grSF_M24, 1000, MISC_STOCK);
			ITEM(US85_grSF_M9, 1000, MISC_STOCK);
			ITEM(US85_grSF_MG, 1000, MISC_STOCK);
			ITEM(US85_grSF_TLBV, 1000, MISC_STOCK);
			ITEM(AFMC_grVest, 1000, MISC_STOCK);
			ITEM(AFMC_grV_M16, 1000, MISC_STOCK);
			ITEM(AFMC_grV_ofc, 1000, MISC_STOCK);
			ITEM(AFMC_grV_M24, 1000, MISC_STOCK);
			ITEM(AFMC_grV_MG, 1000, MISC_STOCK);

			///backpacks
			ITEM(US85_bpSf, 1000, MISC_STOCK);
			ITEM(CSLA_bpRPG7, 1000, MISC_STOCK);
			ITEM(CSLA_bp85msn, 1000, MISC_STOCK);
			ITEM(CSLA_bp85RF10, 1000, MISC_STOCK);
			ITEM(CSLA_bp85, 1000, MISC_STOCK);
			ITEM(CSLA_bp61, 1000, MISC_STOCK);
			ITEM(CSLA_bp85Lrr, 1000, MISC_STOCK);
			ITEM(US85_bpMedi, 1000, MISC_STOCK);
			ITEM(CSLA_bpCorcJacket, 1000, MISC_STOCK);
			ITEM(CSLA_bpKnapsack, 1000, MISC_STOCK);
			ITEM(FIA_bpAlice, 1000, MISC_STOCK);
			ITEM(US85_bpAlice, 1000, MISC_STOCK);
			ITEM(FIA_bpPack, 1000, MISC_STOCK);

			ITEM(CSLA_RG4o, 500, MISC_STOCK);
			ITEM(CSLA_RG4u, 500, MISC_STOCK);
			ITEM(CSLA_URG86o, 750, MISC_STOCK);
			ITEM(CSLA_URG86u, 750, MISC_STOCK);
			ITEM(US85_M87A1Mine_mag, 750, MISC_STOCK);

			ITEM(CSLA_PPMiSr2_mag, 300, MISC_STOCK);
			ITEM(CSLA_PtMiBa3_mag, 300, MISC_STOCK);
			ITEM(CSLA_PPMiNa_mag, 250, MISC_STOCK);
			ITEM(CSLA_RG4m_mag, 500, MISC_STOCK);
			ITEM(CSLA_URG86m_mag, 400, MISC_STOCK);
			ITEM(CSLA_F1m_mag, 200, MISC_STOCK);
			ITEM(CSLA_NO2, 200, MISC_STOCK);
			ITEM(CSLA_TNT0100g, 150, MISC_STOCK);
			ITEM(US85_M67m_mag, 100, MISC_STOCK);

		};
		class riflesWRS 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_wrs", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(WRS_Weapon_AR, 500, RIFLE_STOCK)
			ITEM(WRS_Weapon_AR_2, 300, RIFLE_STOCK)
			ITEM(WRS_Weapon_AUG, 600, RIFLE_STOCK)
		}; 

		class magazinesriflesWRS
		{
            displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_wrs", localize "STR_A3AU_magazines"]);
            picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

            ITEM(WRS_Ar_Magazine, 200, MAGAZINE_STOCK)	
            ITEM(WRS_Ar2_Magazine, 200, MAGAZINE_STOCK)	
            ITEM(WRS_Ar1_Magazine, 200, MAGAZINE_STOCK)
        };

		class sniperRiflesWRS
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_wrs", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(WRS_Weapon_ShockGun, 1500, RIFLE_STOCK)	
			ITEM(WRS_Weapon_Sniper, 1500, RIFLE_STOCK)	
			ITEM(WRS_Weapon_Sniper_Bolt, 1500, RIFLE_STOCK)		
		}; 

		class magazinessniperRiflesWRS
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_wrs", localize "STR_A3AU_srMagazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

            ITEM(WRS_Shockgun_Magazine, 500, MAGAZINE_STOCK)	
            ITEM(WRS_Sniper_Magazine, 250, MAGAZINE_STOCK)	
            ITEM(WRS_Boomslang_Magazine, 250, MAGAZINE_STOCK)
        };

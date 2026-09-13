class handgunsQDI
{
	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_QDI", localize "STR_A3AU_handguns"]);
	picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

	ITEM(qdi_g17, 150, PISTOL_STOCK);
	ITEM(qdi_g22, 150, PISTOL_STOCK);
	ITEM(qdi_g26, 150, PISTOL_STOCK);
	ITEM(qdi_g27, 150, PISTOL_STOCK);
};

class riflesQDI
{
	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_QDI", localize "STR_A3AU_rifles"]);
	picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

	ITEM(qav_amb17, 1100, RIFLE_STOCK);
	ITEM(qav_amb17_lush, 1100, RIFLE_STOCK);
	ITEM(qav_amb17_taiga, 1100, RIFLE_STOCK);

	ITEM(qdi_rfb, 1250, RIFLE_STOCK);
	ITEM(qdi_rfb_afg, 1250, RIFLE_STOCK);
	ITEM(qdi_rfb_rvg, 1250, RIFLE_STOCK);
	ITEM(qdi_rfb_h, 1450, RIFLE_STOCK); //Has more range
};

class mgQDI
{
	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_QDI", localize "STR_A3AU_mgs"]);
	picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

	ITEM(qdi_ameli, 1500, RIFLE_STOCK); //5.56 Variant
	ITEM(qdi_ameli_green, 1500, RIFLE_STOCK);
	ITEM(qdi_ameli_tan, 1500, RIFLE_STOCK);

	ITEM(qdi_ameli_65, 1750, RIFLE_STOCK); //6.5 Variant
	ITEM(qdi_ameli_65_green, 1750, RIFLE_STOCK);
	ITEM(qdi_ameli_65_tan, 1750, RIFLE_STOCK);
};

class sniperRiflesQDI
{
	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_QDI", localize "STR_A3AU_sniperRifles"]);
	picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

	ITEM(qdi_amr25, 6000, 3);
	ITEM(qdi_amr25_arid, 6000, 3);
	ITEM(qdi_amr25_ctrg, 6000, 3);
	ITEM(qdi_amr25_ghex, 6000, 3);
	ITEM(qdi_amr25_hex, 6000, 3);
	ITEM(qdi_amr25_lush, 6000, 3);
};

class opticsQDI
{
	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_QDI", localize "STR_A3AU_sights"]);
	picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";

	class optic_qdi_okp7 { price = 250; stock = 100; };
	class optic_glock_tridium { price = 80; stock = 100; };
	class optic_glock_tridium_short { price = 80; stock = 100; };
};

class magazinesQDI
{
	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_QDI", localize "STR_A3AU_magazines"]);
	picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
	
	///////////////////////////////////////////////////////
	// Pistols, SMGs
	///////////////////////////////////////////////////////
	class qdi_10Rnd_40sw_Mag {
		price = 35;
		stock = MAGAZINE_STOCK;
	};
	class qdi_15Rnd_40sw_Mag {
		price = 50;
		stock = MAGAZINE_STOCK;
	};
	class qdi_9Rnd_40sw_Mag {
		price = 30;
		stock = MAGAZINE_STOCK;
	};
	class qdi_10Rnd_9x19_Mag_sml {
		price = 35;
		stock = MAGAZINE_STOCK;
	};
	class qdi_17Rnd_9x19_Mag {
		price = 50;
		stock = MAGAZINE_STOCK;
	};
	class qdi_10Rnd_9x19_Mag_reg {
		price = 35;
		stock = MAGAZINE_STOCK;
	};
	///////////////////////////////////////////////////////
	// RIFLES
	///////////////////////////////////////////////////////
	class qdi_10rnd_9x39_mag {
		price = 75;
		stock = MAGAZINE_STOCK;
	};
	class qdi_10rnd_9x39_mag_reload_t {
		price = 75;
		stock = MAGAZINE_STOCK;
	};
	class qdi_10rnd_9x39_mag_t {
		price = 75;
		stock = MAGAZINE_STOCK;
	};
	class qdi_20rnd_9x39_mag {
		price = 100;
		stock = MAGAZINE_STOCK;
	};
	class qdi_20rnd_9x39_mag_reload_t {
		price = 100;
		stock = MAGAZINE_STOCK;
	};
	class qdi_20rnd_9x39_mag_t {
		price = 100;
		stock = MAGAZINE_STOCK;
	};
	class qdi_30rnd_9x39_mag {
		price = 120;
		stock = MAGAZINE_STOCK;
	};
	class qdi_30rnd_9x39_mag_reload_t {
		price = 120;
		stock = MAGAZINE_STOCK;
	};
	class qdi_30rnd_9x39_mag_t {
		price = 120;
		stock = MAGAZINE_STOCK;
	};
	class qdi_100rnd_556_ameli_mag {
		price = 150;
		stock = MAGAZINE_STOCK;
	};
	class qdi_100rnd_556_ameli_mag_reload_t {
		price = 150;
		stock = MAGAZINE_STOCK;
	};
	class qdi_100rnd_556_ameli_mag_t {
		price = 150;
		stock = MAGAZINE_STOCK;
	};
	class qdi_100rnd_65x39_ameli_mag_ap {
		price = 200;
		stock = MAGAZINE_STOCK;
	};
	class qdi_100rnd_65x39_ameli_mag {
		price = 150;
		stock = MAGAZINE_STOCK;
	};
	class qdi_100rnd_65x39_ameli_mag_reload_t {
		price = 150;
		stock = MAGAZINE_STOCK;
	};
	class qdi_100rnd_65x39_ameli_mag_t {
		price = 150;
		stock = MAGAZINE_STOCK;
	};
	///////////////////////////////////////////////////////
	// DMRs, Sniper Rifles
	///////////////////////////////////////////////////////
	class qdi_4rnd_25x137_AP_mag {
		price = 350;
		stock = 25;
	};
	class qdi_4rnd_25x137_APAH_mag {
		price = 350;
		stock = 35;
	};
	class qdi_4rnd_25x137_APDS_mag {
		price = 350;
		stock = 25;
	};
	class qdi_4rnd_25x137_HE_mag {
		price = 350;
		stock = 35;
	};
};

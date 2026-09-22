class riflesReArma_CN
{
	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ReArma_CN", localize "STR_A3AU_rifles"]);
	picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

	ITEM(QBZ191, 1500, RIFLE_STOCK);
	ITEM(QBZ191_FG, 1500, RIFLE_STOCK);
	ITEM(QBZ191_GL, 1650, RIFLE_STOCK);

	ITEM(QBZ192, 1400, RIFLE_STOCK);
	ITEM(QBZ192_FG, 1400, RIFLE_STOCK);
	ITEM(QBZ192_GL, 1550, RIFLE_STOCK);

	ITEM(QBW201, 1400, RIFLE_STOCK);
	ITEM(QBW201_FG, 1400, RIFLE_STOCK);
};

class sniperRiflesReArma_CN
{
	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ReArma_CN", localize "STR_A3AU_sniperRifles"]);
	picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

	ITEM(QBU191, 1750, RIFLE_STOCK);

	ITEM(QBU201, 2500, 5);

	ITEM(QBU202, 2500, 5);
};

class smgsReArma_CN
{
	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ReArma_CN", localize "STR_A3AU_smgs"]);
	picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

	ITEM(QCQ171_F, 1200, RIFLE_STOCK);
	ITEM(QCQ171_FG_F, 1200, RIFLE_STOCK);
};

class mgsReArma_CN
{
	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ReArma_CN", localize "STR_A3AU_mgs"]);
	picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

	ITEM(QJS201, 1750, RIFLE_STOCK);
};

class specialReArma_CN
{
	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ReArma_CN", localize "STR_A3AU_specialWeapons"]);
	picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

	ITEM(QBS09, 800, RIFLE_STOCK);

	ITEM(QLU_11, 2500, 5); //This is a thing
};

class handgunsReArma_CN
{
	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ReArma_CN", localize "STR_A3AU_handguns"]);
	picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";

	ITEM(QSZ92A_F, 400, PISTOL_STOCK);
	ITEM(QSZ92B_F, 400, PISTOL_STOCK);
};

class launchersReArma_CN
{
	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ReArma_CN", localize "STR_A3AU_launchers"]);
	picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";

	ITEM(launch_PF89, 900, LAUNCHER_STOCK);
	ITEM(launch_WPF89, 900, LAUNCHER_STOCK);

	ITEM(launch_QN205_Des, 3500, LAUNCHER_STOCK);
	ITEM(launch_QN205, 3500, LAUNCHER_STOCK);

	ITEM(launch_CNDES_Titan_short_F, 3500, LAUNCHER_STOCK);
	ITEM(launch_CNWDL_Titan_short_F, 3500, LAUNCHER_STOCK);
};

class opticsReArma_CN
{
	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ReArma_CN", localize "STR_A3AU_sights"]);
	picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";

	ITEM(OPTIC_QMK171_FMJ_BLK, 400, 100);
	ITEM(QMK191_BLK, 650, 100);
	ITEM(QMK201, 800, 100);
	ITEM(QMQ171_BLK, 250, 100);
	ITEM(optic_Godzilla, 1000, 100);
};

class pointersReArma_CN
{
	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ReArma_CN", localize "STR_A3AU_pointers"]);
	picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemAcc_ca.paa";

	ITEM(XLM6_AL, 150, 100);
	ITEM(XLM6_LIGHT_AL, 200, 100);
};

class muzzlesReArma_CN
{
	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ReArma_CN", localize "STR_A3AU_muzzles"]);
	picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa";

	ITEM(SND_171, 250, 100);
	ITEM(SND_191, 350, 100);
	ITEM(SND_QBW201, 250, 100);
};

class magazinesReArma_CN
{
	displayName = __EVAL(formatText["%1 %2", localize "STR_A3AU_ReArma_CN", localize "STR_A3AU_magazines"]);
	picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

	ITEM(5Rnd_338_SN_Tracer_Mag, 200, MZ_STOCK);
	ITEM(5Rnd_338_SN_Mag, 200, MZ_STOCK);
	ITEM(5Rnd_338_APDS_Tracer_Mag, 300, MZ_STOCK);
	ITEM(5Rnd_338_APDS_Mag, 300, MZ_STOCK);

	ITEM(30Rnd_58x42_Mag_F, 50, MZ_STOCK);
	ITEM(30Rnd_58x42_Mag_Tracer_F, 50, MZ_STOCK);

	ITEM(30Rnd_58x42_AP_Mag_F, 100, MZ_STOCK);
	ITEM(30Rnd_58x42_AP_Mag_Tracer_F, 100, MZ_STOCK);

	ITEM(30Rnd_58x42_TP_Mag_F, 50, MZ_STOCK);
	ITEM(30Rnd_58x42_TP_Mag_Tracer_F, 50, MZ_STOCK);

	ITEM(30Rnd_58x42_AP_TP_Mag_F, 100, MZ_STOCK);
	ITEM(30Rnd_58x42_AP_TP_Mag_Tracer_F, 100, MZ_STOCK);

	ITEM(30Rnd_58x42SG_Mag_F, 75, MZ_STOCK);
	ITEM(30Rnd_58x42SG_Mag_Tracer_F, 75, MZ_STOCK);
	ITEM(30Rnd_58x42SG_TP_Mag_F, 75, MZ_STOCK);
	ITEM(30Rnd_58x42SG_TP_Mag_Tracer_F, 75, MZ_STOCK);

	ITEM(20Rnd_86x39_Mag_F, 50, MZ_STOCK);
	ITEM(20Rnd_86x39_Mag_Tracer_F, 50, MZ_STOCK);

	ITEM(6Rnd_W12Gauge_Pellets, 50, MZ_STOCK);
	ITEM(6Rnd_W12Gauge_Slug, 50, MZ_STOCK);

	ITEM(150Rnd_58x42_Mag_F, 150, MZ_STOCK);
	ITEM(150Rnd_58x42_Mag_Tracer_F, 150, MZ_STOCK);

	ITEM(7Rnd_HE_35mm, 350, MZ_STOCK);
	ITEM(7Rnd_HEDP_35mm, 400, MZ_STOCK);

	ITEM(30Rnd_9x21_QCQ171_Mag, 35, MZ_STOCK);
	ITEM(30Rnd_9x21_QCQ171_Tracer_Mag, 35, MZ_STOCK);

	ITEM(15Rnd_9x21_Mag, 25, MZ_STOCK);
	ITEM(15Rnd_9x21_Tracer_Mag, 25, MZ_STOCK);
};

class launcherMagazinesReArma_CN
{
	displayName = __EVAL(formatText["%1 %2", localize "STR_A3AU_ReArma_CN", localize "STR_A3AU_launcherAmmo"]);
	picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

	ITEM(QN205_HEAT, 600, MZ_STOCK);
	ITEM(QN205_Cluster, 600, MZ_STOCK);
};
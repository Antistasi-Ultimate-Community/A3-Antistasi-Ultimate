#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3A_core"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class A3A {
    #include "mapInfo.hpp"
    #include "NavGrid.hpp"
};


#define A3A_Mission(MAPNAME, BRIEFINGLOCSTRING) class Antistasi_##MAPNAME { briefingName = BRIEFINGLOCSTRING; directory = x\A3A\addons\maps\Antistasi_##MAPNAME##.##MAPNAME; };

class CfgMissions
{
    class MPMissions
    { // mission folder names need to be `Antistasi_{Map name}.{Map name}`
    A3A_Mission(Altis, "Antistasi Ultimate - Altis")
    A3A_Mission(Malden, "Antistasi Ultimate - Malden")
    A3A_Mission(SefrouRamal, "Antistasi Ultimate - Sefrou-Ramal")
		A3A_Mission(chernarus, "Antistasi Ultimate - Chernarus Autumn")
		A3A_Mission(chernarus_summer, "Antistasi Ultimate - Chernarus Summer")
		A3A_Mission(Chernarus_Winter, "Antistasi Ultimate - Chernarus Winter")
    A3A_Mission(cup_chernarus_A3, "Antistasi Ultimate - Chernarus 2020")
    A3A_Mission(Enoch, "Antistasi Ultimate - Livonia")
    A3A_Mission(Esseker, "Antistasi Ultimate - Esseker")
    A3A_Mission(Napf, "Antistasi Ultimate - Napf")
		A3A_Mission(NapfWinter, "Antistasi Ultimate - Napf Winter")
    A3A_Mission(blud_vidda, "Antistasi Ultimate - Vidda")
    A3A_Mission(vt7, "Antistasi Ultimate - Virolahti")
    A3A_Mission(takistan, "Antistasi Ultimate - Takistan")
    A3A_Mission(Tanoa, "Antistasi Ultimate - Tanoa")
    A3A_Mission(cam_lao_nam, "Antistasi Ultimate - Cam Lao Nam")
    A3A_Mission(vn_khe_sanh, "Antistasi Ultimate - Khe Sanh")
    A3A_Mission(Sehreno, "Antistasi Ultimate - Sehreno")
		A3A_Mission(sara, "Antistasi Ultimate - Sahrani")
		A3A_Mission(Kunduz, "Antistasi Ultimate - Kunduz")
		A3A_Mission(Tembelan, "Antistasi Ultimate - Tembelan Island")
		A3A_Mission(tem_anizay, "Antistasi Ultimate - Anizay")
		A3A_Mission(SPE_Normandy, "Antistasi Ultimate - Normandy")
		A3A_Mission(lingor3, "Antistasi Ultimate - Lingor")
		A3A_Mission(lythium, "Antistasi Ultimate - Lythium")
		A3A_Mission(Panthera3, "Antistasi Ultimate - Panthera")
		A3A_Mission(Winthera3, "Antistasi Ultimate - Panthera Winter")
		A3A_Mission(abramia, "Antistasi Ultimate - Isla Abramia")
		A3A_Mission(OPTRE_Madrigal, "Antistasi Ultimate - Madrigal")
		A3A_Mission(rhspkl, "Antistasi Ultimate - Prei Khmaoch Luong")
		A3A_Mission(Kapaulio, "Antistasi Ultimate - Saint Kapaulio")
		A3A_Mission(Staszow, "Antistasi Ultimate - Staszow")
		A3A_Mission(StaszowWinter, "Antistasi Ultimate - Staszow Winter")
		A3A_Mission(iron_excelsior_Tobruk, "Antistasi Ultimate - Tobruk")
		A3A_Mission(ruha, "Antistasi Ultimate - Ruha")
		A3A_Mission(gm_weferlingen_winter, "Antistasi Ultimate - Weferlingen Winter")
    A3A_Mission(gm_weferlingen_summer, "Antistasi Ultimate - Weferlingen Summer")
    A3A_Mission(green_sea, "Antistasi Ultimate - Green Sea")
		A3A_Mission(brf_sumava, "Antistasi Ultimate - Sumava")
		A3A_Mission(spex_utah_beach, "Antistasi Ultimate - Utah Beach")
		A3A_Mission(pja310, "Antistasi Ultimate - GOS Al Rayak")
		A3A_Mission(namalsk, "Antistasi Ultimate - Namalsk")
		A3A_Mission(WW2_Omaha_Beach, "Antistasi Ultimate - Omaha Beach")
		A3A_Mission(UMB_Colombia, "Antistasi Ultimate - Colombia")
		A3A_Mission(tem_kujari, "Antistasi Ultimate - Kujari")
		A3A_Mission(stozec, "Antistasi Ultimate - Gabreta")
		A3A_Mission(psyfx_pht, "Antistasi Ultimate - Phuoc Tuy")
		A3A_Mission(yulakia, "Antistasi Ultimate - Yulakia")
    A3A_Mission(Gulfcoast, "Antistasi Ultimate - Gulfcoast Islands")
	A3A_Mission(SPE_Mortain, "Antistasi Ultimate - Mortain")
	A3A_Mission(tem_chernarus, "Antistasi Ultimate - Svartmarka")
	A3A_Mission(tem_chernarusw, "Antistasi Ultimate - Svartmarka Winter")
	A3A_Mission(mehland, "Antistasi Ultimate - Mehland")
	A3A_Mission(pulau, "Antistasi Ultimate - Pulau")
	A3A_Mission(chernarusredux, "Antistasi Ultimate - Redux")
	A3A_Mission(stubbhult, "Antistasi Ultimate - Stubbhult")
#if __A3_DEBUG__
        A3A_Mission(Stratis, $STR_antistasi_mission_info_Stratis_mapname_text)
#endif
    };
};

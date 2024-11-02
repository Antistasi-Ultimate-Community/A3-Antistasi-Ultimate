/*
	Macro: ERROR_WITH_TITLE()

	Parameters:
	0: CLASSNAME - Classname of item
	1: PRICE - Default item price
	2: STOCK - Default item stock
__________________________________________________________________*/
#define ITEM(CLASSNAME, PRICE, STOCK)\
	class CLASSNAME {\
		price = PRICE;\
		stock = STOCK;\
	};

#define MAGAZINE_STOCK 200
#define LAUNCHER_STOCK 15
#define PISTOL_STOCK 50
#define RIFLE_STOCK 20
#define MZ_STOCK 50
#define NN_STOCK 50
#define PN_STOCK 25
#define MISC_STOCK 50

class cfgHALsStore 
{
	containerTypes[] = {"LandVehicle", "Air", "Ship", "ReammoBox_F"};
	containerRadius = 30;
	sellFactor = 0.5;
	debug = 0;

	class categories 
	{
		#include "config\3cbbaf.hpp"
		#include "config\3cbf.hpp"
		#include "config\3cbfcw.hpp"
		#include "config\aegis.hpp"
		#include "config\bwa.hpp"
		#include "config\csa38.hpp"
		#include "config\csla.hpp"
		#include "config\cup.hpp"
		#include "config\cw.hpp"
		#include "config\empire.hpp"
		#include "config\ffaa.hpp"
		#include "config\fwa.hpp"
		#include "config\gm.hpp"
		#include "config\ifa.hpp"
		#include "config\italy.hpp"
		#include "config\niarms.hpp"
		#include "config\optre.hpp"
		#include "config\pla.hpp"
		#include "config\rf.hpp"
		#include "config\rhs.hpp"
		#include "config\scion.hpp"
		#include "config\sfp.hpp"
		#include "config\sma.hpp"
		#include "config\spearhead.hpp"
		#include "config\tow.hpp"
		#include "config\unsung.hpp"
		#include "config\vanilla.hpp"
		#include "config\apex.hpp"
		#include "config\lawsofwar.hpp"
		#include "config\contact.hpp"
		#include "config\marksmen.hpp"
		#include "config\jets.hpp"
		#include "config\kart.hpp"
		#include "config\tanks.hpp"
		#include "config\artofwar.hpp"
		#include "config\kkiv2035.hpp"
		#include "config\vn.hpp"
		#include "config\wrs.hpp"
		#include "config\ws.hpp"
		#include "config\braf.hpp"
		#include "config\nfts.hpp"
		#include "config\fow.hpp"
		#include "config\eaw.hpp"
		#include "config\cwr.hpp"
	};

	class stores 
	{
		class vanilla 
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handgunsVanilla",
				"riflesVanilla", 
				"sniperRiflesVanilla", 
				"mgVanilla",
				"smgVanilla",
				"launchersVanilla",
				"launcherMagazinesVanilla",
				"navigationVanilla",
				"pointersVanilla",
				"muzzlesVanilla",
				"opticsVanilla",
				"magazinesVanilla",  
				"miscVanilla"
			};
		};
    
		class apex 
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handgunsApex",
				"riflesApex", 
				"sniperRiflesApex", 
				"mgApex",
				"smgApex",
				"launchersApex",
				"launcherMagazinesApex",
				"opticsApex", 
				"muzzlesApex", 
				"underbarrelApex", 
				"navigationApex", 
				"magazinesApex", 
				"miscApex"
			};
		};

		class lawsofwar 
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = { 
				"miscLawsofwar"
			};
		};

		class contact
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handgunsContact",
				"riflesContact", 
				"sniperRiflesContact", 
				"mgContact",
				"launchersContact", 
				"opticsContact", 
				"muzzlesContact", 
				"underbarrelContact", 
				"pointersContact", 
				"navigationContact", 
				"magazinesContact", 
				"miscContact"
			};
		};

		class marksmen
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"sniperRiflesMarksmen",
				"mgMarksmen", 
				"opticsMarksmen", 
				"muzzlesMarksmen", 
				"underbarrelMarksmen", 
				"navigationMarksmen",
				"magazinesMarksmen"
			};
		};

		class jets 
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"miscJets"
			};
		};

		class kart
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handgunsKart", 
				"magazinesKart"
			};
		};

		class tanks
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"launchersTanks",
				"launcherMagazinesTanks",
				"miscTanks"
			};
		};

		class artofwar
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"miscArtofwar"
			};
		};

		class kkiv2035
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"sniperRifleskkiv2035",
				"magazineskkiv2035"
			};
		};
    
		class rf 
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"riflesRF", 
				"sniperRiflesRF", 
				"smgRF", 
				"handgunsRF", 
				"magazinesRF", 
				"navigationRF", 
				"pointersRF", 
				"muzzlesRF", 
				"opticsRF", 
				"miscRF"
			};
		};
    
		class ws 
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"riflesWs",
				"launchersWs",
				"sniperRiflesWs",
				"mgWs",
				"magazinesWs",
				"navigationWs",
				"pointersWs",
				"muzzlesWs",
				"opticsWs",
				"miscWs"
			};
		};

		class csla 
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"riflesCSLA",
				"sniperRiflesCSLA",
				"mgCSLA",
				"launchersCSLA",
				"magazineslaunchersCSLA",
				"handgunsCSLA",
				"magazinesCSLA",
				"navigationCSLA",
				"attachmentsCSLA",
				"miscCSLA"
			};
		};
		class aegis 
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handgunsAegis", 
				"launchersAegis",
				"launcherMagazinesAegis",  
				"riflesAegis", 
				"sniperRiflesAegis", 
				"mgAegis",
				"smgAegis", 
				"magazinesAegis"
			};
		};

		class rhs 
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handgunsRhs", 
				"launchersRhs", 
				"riflesRhs", 
				"sniperRiflesRhs", 
				"specialWeaponsRhs",
				"mgRhs", 
				"smgRhs", 
				"launcherMagazinesRhs", 
				"magazinesRhs", 
				"opticsRhs", 
				"muzzlesRhs", 
				"underbarrelRhs", 
				"pointersRhs", 
				"navigationRhs", 
				"miscRhs"
			};
		};

		class 3cbf 
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handguns3cbf", 
				"launchers3cbf", 
				"rifles3cbf", 
				"sniperRifles3cbf", 
				"mg3cbf", 
				"smg3cbf", 
				"additionalMuzzles3cbf",
				"additionalScopes3cbf",
				"additionalMagazines3cbf"
			};
		};

		class 3cbfcw
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handguns3cbfcw",
				"smg3cbfcw",
				"rifles3cbfcw",
				"sniperRifles3cbfcw",
				"mg3cbfcw",
				"specialWeapons3cbfcw",
				"launchers3cbf",
				"launcherMagazines3cbfcw",
				"navigation3cbfcw",
				"underbarrel3cbfcw",
				"pointers3cbfcw",
				"muzzles3cbfcw",
				"optics3cbfcw",
				"magazines3cbfcw",
				"misc3cbfcw"
			};
		};
		
		class cw
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handgunscw",
				"smgcw",
				"mgcw",
				"riflescw",
				"sniperriflescw",
				"launcherscw",
				"launchermagazinescw",
				"riflegrenadescw",
				"muzzlescw",
				"magazinescw", 
				"pointerscw",
				"specialweaponscw",
				"misccw",
				"opticscw",
				"underbarrelcw"
			};
		};
		
		class emp
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handgunsemp",
				"smgemp",
				"mgemp",
				"riflesemp",
				"sniperriflesemp",
				"launchersemp",
				"launchermagazinesemp",
				"magazinesemp",
				"opticsemp"

			};
		};

		class wmemp
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handgunswmemp",
				"rifleswmemp",
				"launcherswmemp",
				"magazineswmemp",
				"opticswmemp"

			};
		};

		class vn
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handgunsvn",
				"smgvn",
				"mgvn",
				"riflesvn",
				"sniperriflesvn",
				"launchersvn",
				"specialWeaponsvn",
				"launchermagazinesvn",
				"riflegrenadesvn",
				"muzzlesvn",
				"pointersvn",
				"opticsvn",
				"underbarrelvn",
				"magazinesvn",
				"miscvn",
				"helmetsvn",
				"uniformsvn",
				"backpacksvn",
				"vestsvn",
				"facewearvn",
				"untilityvn"
			};
		};
		
		class cup		
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
			"handgunsCup", 
			"launchersCup", 
			"riflesCup", 
			"sniperRiflesCup",
			"specialWeaponsCup", 
			"mgCup", 
			"smgCup", 
			"launcherMagazinesCup", 
			"magazinesCup", 
			"opticsCup", 
			"muzzlesCup", 
			"underbarrelCup", 
			"pointersCup", 
			"navigationCup", 
			"miscCup"
			};
		};

		class fowstore
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handgunsfow",
				"smgfow",
				"mgfow",
				"riflesfow",
				"sniperriflesfow",
				"launchersfow",
				"muzzlesfow",
				"magazinesfow", 
				"pointersfow",
				"underbarrelfow"
			};
		};

		class ww2mod
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handgunsifaa",
				"smgifaa",
				"mgifaa",
				"riflesifaa",
				"sniperriflesifaa",
				"launchersifaa",
				"launchermagazinesifaa",
				"riflegrenadesifaa",
				"muzzlesifaa",
				"magazinesifaa", 
				"pointersifaa",
				"specialweaponsifaa",
				"miscifaa",
				"opticsifaa",
				"underbarrelifaa"
			};
		};

		class ww2cdlc
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handgunsspe",
				"smgspe",
				"mgspe",
				"riflesspe",
				"sniperriflesspe",
				"launchersspe",
				"launchermagazinesspe",
				"riflegrenadesspe",
				"muzzlesspe",
				"magazinesspe", 
				"specialweaponsspe",
				"pointersspe",
				"navigationspe",
				"miscspe",
				"underbarrelspe",
				"helmetsspe",
				"uniformsspe",
				"backpacksspe",
				"vestsspe",
				"facewearspe"
			};
		};
		
		class unsstore
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handgunsuns",
				"smguns",
				"mguns",
				"riflesuns",
				"sniperriflesuns",
				"launchersuns",
				"launchermagazinesuns",
				"riflegrenadesuns",
				"muzzlesuns",
				"magazinesuns", 
				"pointersuns",
				"specialweaponsuns",
				"miscuns",
				"opticsuns",
				"underbarreluns"
			};
		};
		
		class optre
		{
		  displayName = $STR_ARMS_DEALER_STORE;
		  categories[] = {
			      "handgunshalo",
			      "smghalo",
			      "mghalo",
			      "rifleshalo",
			      "sniperrifleshalo",
			      "launchershalo",
			      "launchermagazineshalo",
			      "riflegrenadeshalo",
			      "muzzleshalo",
			      "magazineshalo", 
			      "pointershalo",
			      "specialweaponshalo",
			      "mischalo",
			      "opticshalo",
			      "underbarrelhalo"
			};
		};
		
		class ffaastock
		{
		  displayName = $STR_ARMS_DEALER_STORE;
		  categories[] = {
			      "handgunsffaa",
			      "smgffaa",
			      "mgffaa",
			      "riflesffaa",
			      "sniperriflesffaa",
			      "launchersffaa",
			      "muzzlesffaa",
			      "magazinesffaa", 
			      "pointersffaa",
			      "opticsffaa",
			      "underbarrelffaa"
			};
		};
		
		class italystock
		{
		  displayName = $STR_ARMS_DEALER_STORE;
		  categories[] = {
			      "handgunsitaly",
			      "mgitaly",
			      "riflesitaly",
			      "sniperriflesitaly",
			      "launchersitaly",
			      "launchermagazinesitaly",
			      "muzzlesitaly",
			      "magazinesitaly", 
			      "pointersitaly",
			      "specialweaponsitaly",
			      "opticsitaly",
			      "underbarrelitaly"
			};
		};
		
		class sfpstock
		{
		  displayName = $STR_ARMS_DEALER_STORE;
		  categories[] = {
			      "handgunsswe",
			      "smgswe",
			      "mgswe",
			      "riflesswe",
			      "sniperriflesswe",
			      "launchersswe",
			      "launchermagazinesswe",
			      "magazinesswe", 
			      "pointersswe",
			      "specialweaponsswe",
			      "opticsswe",
			      "underbarrelswe"
			};
		};
		
		class plastock
		{
		  displayName = $STR_ARMS_DEALER_STORE;
		  categories[] = {
			      "mgpla",
			      "riflespla",
			      "sniperriflespla",
			      "launcherspla",
			      "launchermagazinespla",
			      "magazinespla"
			};
		};
		
		class bwastock
		{
		  displayName = $STR_ARMS_DEALER_STORE;
		  categories[] = {
			      "handgunsbwa",
			      "smgbwa",
			      "mgbwa",
			      "riflesbwa",
			      "sniperriflesbwa",
			      "launchersbwa",
			      "launchermagazinesbwa",
			      "muzzlesbwa",
			      "magazinesbwa", 
			      "pointersbwa",
			      "opticsbwa",
			      "underbarrelbwa"
			};
		};
		
		class 3cbbafstock
		{
		  displayName = $STR_ARMS_DEALER_STORE;
		  categories[] = {
			      "handguns3cbbaf",
			      "smg3cbbaf",
			      "mg3cbbaf",
			      "rifles3cbbaf",
			      "sniperrifles3cbbaf",
			      "launchers3cbbaf",
			      "riflegrenades3cbbaf",
			      "muzzles3cbbaf",
			      "magazines3cbbaf", 
			      "pointers3cbbaf",
			      "specialweapons3cbbaf",
			      "optics3cbbaf",
			      "underbarrel3cbbaf"
			};
		};
		
		class globmob 
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handgunsgm", 
				"riflesgm", 
				"mggm",
				"sniperRiflesgm", 
				"smggm", 
				"launchersgm", 
				"launcherMagazinesgm", 
				"opticsgm", 
				"pointersgm", 
				"muzzlesgm", 
				"magazinesgm",
				"underbarrelgm",
				"navigationgm", 
				"miscgm",
				"helmetsgm",
				"uniformsgm",
				"backpacksgm",
				"vestsgm",
				"faceweargm"
			};
		};
		
		class niarms 
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"riflesniarms", 
				"mgniarms",
				"sniperRiflesniarms", 
				"smgniarms", 
				"opticsniarms", 
				"pointersniarms", 
				"muzzlesniarms", 
				"magazinesniarms",
				"underbarrelniarms"
			};
		};
		
		class fwa 
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"riflesfwa", 
				"mgfwa",
				"sniperRiflesfwa", 
				"smgfwa", 
				"opticsfwa", 
				"muzzlesfwa", 
				"magazinesfwa",
				"underbarrelfwa"
			};
		};
		
		class tow 
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"riflestow", 
				"mgtow",
				"opticstow", 
				"muzzlestow", 
				"magazinestow",
				"underbarreltow"
			};
		};
		
		class sma 
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"riflessma", 
				"mgsma",
				"opticssma", 
				"muzzlessma", 
				"magazinessma",
				"underbarrelsma"
			};
		};
		
		class csa38
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handgunscsa", 
				"smgcsa",
				"mgcsa", 
				"riflescsa", 
				"sniperriflescsa",
				"muzzlescsa",
				"magazinescsa", 
				"launcherscsa"
			};
		};
		class scion
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"riflesScion", 
				"magazinesriflesScion",
				"sniperRiflesScion", 
				"magazinessniperRiflesScion", 
				"opticsScion"
			};
		};
		class wrs
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"riflesWRS", 
				"magazinesriflesWRS",
				"sniperRiflesWRS", 
				"magazinessniperRiflesWRS"
			};
		};
		class brafstock		
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handgunsBraf", 
				"launchersBraf", 
				"riflesBraf", 
				"sniperRiflesBraf",
				"specialWeaponsBraf", 
				"mgBraf", 
				"smgBraf", 
				"launcherMagazinesBraf", 
				"magazinesBraf", 
				"opticsBraf", 
				"muzzlesBraf",  
				"pointersBraf", 
				"navigationBraf"
			};
		};
		class nftsstock
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handgunsnfts",
				"smgnfts",
				"mgnfts",
				"riflesnfts",
				"sniperriflesnfts",
				"launchersnfts",
				"launchermagazinesnfts",
				"magazinesnfts", 
				"underbarrelnfts"
			};
		};
		class ww2eaw
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handgunseaw",
				"smgeaw",
				"mgeaw",
				"rifleseaw",
				"muzzleseaw",
				"magazineseaw", 
				"specialweaponseaw",
				"opticseaw",
			};
		};		
		class cwrstock		
		{
			displayName = $STR_ARMS_DEALER_STORE;
			categories[] = {
				"handgunsCWR", 
				"launchersCWR", 
				"riflesCWR", 
				"sniperRiflesCWR",
				"specialWeaponsCWR", 
				"mgCWR", 
				"smgCWR", 
				"launcherMagazinesCWR", 
				"magazinesCWR", 
				"opticsCWR"
			};
		};
	};
};

class CfgFunctions {
	class SCRT {
		class Arsenal {
			file = QPATHTOFOLDER(Arsenal);
			class arsenal_getSimilarWeapons {};
			class arsenal_loadoutArsenal {}; 
			class arsenal_clearLoadout {};
		};

		class Common {
			file = QPATHTOFOLDER(Common);
			class common_attachLightSource {};
			class common_addRandomMoneyCargo {};
        	class common_addRandomMoneyMagazine {};
			class common_getNearPlayers {};
			class common_addActionMove {};
        	class common_removeActionMove {};
			class common_moveStatic {};
        	class common_moveObject {};
			class common_set3dIcons {};
			class common_fixCupRhsLaunchers {};
			class common_getMilAdminGarrisonPositions {};
			class common_selectAndApplyLeaderIntel {};
			class common_defeatFactionIfPossible {};
			class common_getPromotionThreshold {};
			class common_rebelSalary {};
			class common_givePrisonerReleasePaycheck {};
			class common_unflipVehicle {};
			class common_shareFactionMoneyWithMembers {};
			class common_sinkShip {};
			class common_panicFlee {};
			class common_scanHorizon {};
			class common_hcTransfer {};
			class common_chemicalDamage {};
			class common_recon {};
        	class common_reveal {};
			class common_moveOutpostStatic {};
			class common_findSafePositionForVehicle {};
			class common_fillSupplyDrop {};
			class common_supplyDrop {};
			class common_paradropVehicle {};
			class common_unconsciousEventHandler {};
			class common_airdropCargo {};
			class common_triggerArtilleryResponseEH {};
			class common_buyReviveKitBox {};
			class common_revive {};
			class common_updateArsenal {};
		};

		class Effect {
			file = QPATHTOFOLDER(Effect);
      class effect_crashingEffects {};
			class effect_createBurningDebrisEffect {};
			class effect_createGasEffect {};
			class effect_createSmallExplosionEffect {};
			class effect_orbitalDropEffect {};
		};

		class Rally {
			file = QPATHTOFOLDER(Rally);
			class rally_toggleRallyPoint {};
			class rally_placeRallyPoint {};
			class rally_travelToRallyPoint {};
			class rally_deleteRallyPoint {};
		};

		class Trader {
			file = QPATHTOFOLDER(Trader);
			class trader_prepareTraderQuest {};
			class trader_createTrader {};
			class trader_setStockType {};
			class trader_addVehicleMarketAction {};
			class trader_removeUnlockedItemsFromStock {};
			class trader_rerollTrader {};
			class trader_setTraderDiscount {};
		};

		class Loot {
			file = QPATHTOFOLDER(Loot);
			class loot_gatherLoot {};
        	class loot_addActionLoot {};
        	class loot_removeActionLoot {};
        	class loot_createLootCrate {};
		};

		class Misc {
			file = QPATHTOFOLDER(Misc);
			class misc_getMissionTitle {};
			class misc_getWorldName {};
			class misc_getWorldPlaces {};
			class misc_deniedHint {};
			class misc_orbitingCamera {};
			class misc_followCamera {};
			class misc_updateRichPresence {};
			class misc_getAccentColor {};
			class misc_createBelonging {};
			class misc_extendPosition {};
			class misc_isInHouse {};
			class misc_getLoadoutName {};
			class misc_tryInitVehicle {};
			class misc_getRebelPlayers {};
			class misc_getTimeLimit {};
    	};

		class Paradrop {
			file = QPATHTOFOLDER(Paradrop);
			class paradrop_getPlayersToParadrop {};
			class paradrop_prepare {};
			class paradrop_movePlayerToPlane {};
			class paradrop_jump {};
		};

		class Unit {
			file = QPATHTOFOLDER(Unit);
			class unit_getUnitMap {};
			class unit_getTiered {};
			class unit_flattenTier {};
		};

		class Garrison {
			file = QPATHTOFOLDER(Garrison);
			class garrison_rollOversizeGarrison {};
			class garrison_rollOversizeVehicle {};
		};

		class Build {
			file = QPATHTOFOLDER(Build);
			class build_prepareAndStartConstruction {};
			class build_addConstruction {};
			class build_saveConstruction {};
			class build_updateConstruction {};
			class build_removeConstruction {};
		};

		class Location {
			file = QPATHTOFOLDER(Location);
			class location_createPatrols {};
			class location_removeMilAdmin {};
		};

		class Outpost {
			file = QPATHTOFOLDER(Outpost);
			class outpost_createWatchpost {};
			class outpost_createWatchpostDistance {};
			class outpost_createRoadblock {};
			class outpost_createRoadblockDistance {};
			class outpost_createAa {};
			class outpost_createAaDistance {};
			class outpost_createAt {};
			class outpost_createAtDistance {};
			class outpost_createHmg {};
			class outpost_createHmgDistance {};
			class outpost_cancelOutpostTask {};
		};

		class UI {
			file = QPATHTOFOLDER(UI);
			class ui_dispose {};
			class ui_showMessage {};
			class ui_switchButton {};
			class ui_toggleMenuBlur {};
			class ui_getSwitchLookup {};
			class ui_updateSupportMenu {};
			class ui_toggleCommanderMenu {};
			class ui_showDynamicTextMessage {};
			class ui_changeTab {};

			class ui_clearSupport {};
        	class ui_clearOutpost {};
        	class ui_clearRivals {};

			class ui_setDisbandMode {};
			class ui_setRecruitMode {};
			class ui_setMinefieldMode {};
			class ui_setRebuildAssetMode {};
			class ui_setEstablishOutpostMode {};
			class ui_setAssignRivalsAttackLocationMode {};

			class ui_setOutpostCost {};
			class ui_setMinefieldCost {};
			class ui_setSupportCostText {};
			class ui_setBuildTypeCostText {};

			class ui_hqTabEventHandler {};
			class ui_minefieldEventHandler {};
			class ui_establishOutpostEventHandler {};
			class ui_disbandGarrisonEventHandler {};
			class ui_manageSupportTabEventHandler {};
			class ui_recruitGarrisonEventHandler {};
			class ui_assignRivalsAttackLocationEventHandler {};
			
			class ui_populateRebelMenu {};
			class ui_populateCommanderMenu {};
			class ui_populateGameOptionsMenu {};

			class ui_setAvailableBuildingTypes {};
			
			class ui_createConstructionMenu {};
			class ui_prepareConstructionBuild {};
        	class ui_prepareConstructionRemoval {};

			class ui_populateVehicleBox {};
			class ui_populateBlackMarket {};

			class ui_createRebelLoadoutMenu {};

			class ui_launchSupport {};

			class ui_showRivalsActivity {};
		};

		class Encounter  {
			file = QPATHTOFOLDER(Encounter);
			class encounter_gameEventLoop {};
			class encounter_selectAndExecuteEvent {};
			class encounter_civHeli {};
			class encounter_civPlane {};
			class encounter_police {};
			class encounter_vehicleMove {};
			class encounter_vehiclePatrol {};
			class encounter_postAmbush {};
			class encounter_fleeingCivConvoy {};
			class encounter_HeliSlingloadCargo {};
			class encounter_frontlineSkirmish {};
		};

		class Support {
			file = QPATHTOFOLDER(Support);
			class support_planePayloadedRun {};
			class support_planeReconRun {};
			class support_chemicalBomb {};
			class support_flareBarrage {};
			class support_smokeBarrage {};
			class support_planeParadropRun {};
			class support_lootHeli {};
		};

		class Composition {
			file = QPATHTOFOLDER(Composition);
			class composition_rivals1 {};
			class composition_rivals2 {};
			class composition_rivals3 {};
		};

		class Rivals {
			file = QPATHTOFOLDER(Rivals);
			class rivals_activate {};
			class rivals_defeat {};
			class rivals_calculateActivity {};
			class rivals_reduceActivity {};
        	class rivals_activityUpdateLoop {};
			class rivals_rollProbability {};
			class rivals_getOperationRadius {};
			class rivals_getActivityLevelString {}; 

			class rivals_imprison {};

			class rivals_trySpawnCarDemo {};
			class rivals_plantCarDemoCharge {};
			class rivals_mortarRoutine {};
			
			class rivals_prepareQuest {};
			class rivals_searchDataOnLaptopTask {};

			class rivals_selectIntel {};
			class rivals_createLaptop {};
        	class rivals_searchDataOnLaptop {};

			class rivals_chooseGroupToSpawn {};
			class rivals_trySpawnWanderingGroup {};

			class rivals_eventLoop {};
			class rivals_getEventCooldown {};
			class rivals_selectAndExecuteEvent {};
			class rivals_findSuitableEncounterPosition {};

			class rivals_encounter_carDemo {};
			class rivals_encounter_uavFlyby {};
			class rivals_encounter_rovingMortar {};
			class rivals_encounter_heliRaid {};
			class rivals_encounter_OccVsRivalsskirmish {};
			
			class rivals_addProgressToRivalsLocationReveal {};
			class rivals_revealLocation {};
			class rivals_getLocations {};
			class rivals_excludeLocation {};
			class rivals_destroyLocation {};
		};
		
		class AI {
			file = QPATHTOFOLDER(AI);
			class ai_getNearFriendlyUnits {}; 
			class ai_possessFriendlyUnit {};
		};
	};
};
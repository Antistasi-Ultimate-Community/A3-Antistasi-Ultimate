// note use of preInit & postInit will run for EVERY mission, use sparingly or with non a3a mission aborts in place, example check if the class (missionConfigFile >> "A3A") exists
class CfgFunctions
{
    class A3A
    {
        class AI {
            file = QPATHTOFOLDER(functions\AI);
            class AIdrag {};
            class airbomb {};
            class AIreactOnKill {};
            class artySupport {};
            class askHelp {};
            class assaultBuilding {};
            class attackDrillAI {};
            class attackHeli {};
            class autoLoot {};
            class autoRearm {};
            class callForSupport {};
            class callForSupportInfantry {};
            class canConquer {};
            class canFight {};
            class captureX {};
            class chargeWithSmoke {};
            class combatLanding {};
            class coverage {};
            class destroyBuilding {};
            class doFlank {};
            class enemyList {};
            class enemyGarrison {};
            class enemyReturnToBase {};
            class fastrope {};
            class fastropeVTOL {};
            class findSafeRoadToUnload {};
            class fleeToSide {};
            class guardDog {};
            class hasRadio {};
            class HeliDoors {};
            class PodsDoors {};
            class help {};
            class hideInBuilding {};
            class inmuneConvoy {};
            class interrogate {};
            class isBuildingPosition {};
            class landThreatEval {};
            class liberateDeserter {};
            class liberaterefugee {};
            class liberatePOW {};
            class liberateFlee {};
            class mineSweep {};
            class mortyAI {};
            class napalm {};
            class napalmDamage {};
            class napalmParticles {};
            class nearEnemy {};
            class orbitalLanding {};
            class orbitalLandingSinglePod {};
            class paradrop {};
            class rearmCall {};
            class recallGroup {};
            class smokeCoverAuto {};
            class staticMGDrill {};
            class suppressingFire {};
            class surrenderAction {};
            class typeOfSoldier {};
            class undercoverAI {};
            class unitGetToCover {};
            class useFlares {};
            class VANTinfo {};
            class vehicleConvoyTravel {};
            class vehicleMarkers {};
        };

        class Ammunition {
            file = QPATHTOFOLDER(functions\Ammunition);
            class ACEpvpReDress {};
            class allMagazines {};
            class ammunitionTransfer {};
            class arsenalManage {};
            class categoryOverrides {};
            class checkRadiosUnlocked {};
            class configSort {};
            class compatibleMagazinesWithExceptions {};
            class dress {};
            class empty {};
            class equipmentClassToCategories {};
            class equipmentIsValidForCurrentModset {};
            class equipmentSort {};
            class fetchRebelGear {};
            class fillLootCrate {};
            class generateRebelGear {};
            class getRadio {};
            class hasARadio {};
            class itemArrayWeight {};
            class itemConfig {};
            class itemConfigMass {};
            class itemSort {};
            class itemType {};
            class launcherInfo {};
            class loot {};
            class randomRifle {};
            class randomHandgun {};
            class transfer {};
            class unlockEquipment {};
            class vehicleSort {};
        };

        class Base {
            file = QPATHTOFOLDER(functions\Base);
            class addActionBreachVehicle {};
            class addAggression {};
            class addEnemyResources {};
            class addHC {};
            class addRecentDamage {};
            class addTimeForIdle {};
            class aggressionUpdateLoop {};
            class AILoadInfo {};
            class airspaceControl {};
            class blackout {};
            class buildHQ {};
            class calculateAggression {};
            class canMoveHQ {};
            class chooseAttack {};
            class citiesToCivPatrol {};
            class citySupportChange {};
            class commsMP {};
            class createBreachChargeText {};
            class createPetros {};
            class deleteControls {};
            class destroyCity {};
            class distance {};
            class distanceUnits {};
            class FIAradio {};
            class findAttackTargets {};
            class findBasesForConvoy {};
            class findNearestGoodRoad {};
            class flagaction {};
            class fogCheck {};
            class garbageCleaner {};
            class garbageCleanerTracker {};
            class garrisonInfo {};
            class getAggroLevelString {};
            class getRecentDamage {};
            class getVehiclesAirSupport {};
            class getVehiclesGroundSupport {};
            class getVehiclesGroundTransport {};
            class vehicleBoxRestore {};
            class initPetros {};
            class isFrontline {};
            class isFrontlineNoFIA {};
            class arePositionsConnected {};
            class joinMultipleGroups {};
            class localizar {};
            class lockStatic {};
            class logPerformance {};
            class markerChange {};
            class moveHQ {};
            class mrkUpdate {};
            class mrkWIN {};
            class numericRank {};
            class onHeadlessClientDisconnect {};
            class onPlayerDisconnect {};
            class patrolDestinations {};
            class petrosDeathMonitor {};
            class placementSelection {};
            class playableUnits {};
            class getSideRadioTowerInfluence {};
            class rebuildAssets {};
            class rebuildRadioTower {};
            class relocateHQObjects {};
            class repairRuinedBuilding {};
            class resourceCheckSkipTime {};
            class resourcesFIA {};
            class returnMuzzle {};
            class revealToPlayer {};
            class scheduler {};
            class moveOutCrew {};
            class sellVehicle {};
            class setMarkerAlphaForSide {};
            class setPlaneLoadout {};
            class sizeMarker {};
            class splitVehicleCrewIntoOwnGroups {};
            class startBreachVehicle {};
            class startTestingTimer {};
            class statistics {};
            class stripGearFromLoadout {};
            class teleportVehicleToBase {};
            class timingCA {};
            class unlockStatic {};
            class unlockVehicle {};
            class updateRebelStatics {};
            class zoneCheck {};
            class checkWinCondition {};
            class checkLossCondition {};
        };

        class Builder {
            file = QPATHTOFOLDER(functions\Builder);
            class addBuildingActions {};
            class buildingComplete {};
            class buildingPlacer {};
            class buildingPlacerStart {};
            class initBuildableObjects {};
            class initBuilderMonitors {};
            class initPlacerDB {};
            class lockBuilderBox {};
            class placeBuilderObjects {};
            class processBuildingTimeouts {};
        };

        class Collections {
            file = QPATHTOFOLDER(functions\Collections);
            class getNestedObject {};
            class remNestedObject {};
            class setNestedObject {};
        };

        class Convoy {
            file = QPATHTOFOLDER(functions\Convoy);
            class cleanConvoyMarker {};
            class convoyDebug {};
            class convoyMovement {};
            class createConvoy {};
            class despawnConvoy {};
            class findAirportForAirstrike {};
            class followVehicle {};
            class onConvoyArrival {};
            class roadblockFight {};
            class spawnConvoy {};
            class spawnConvoyLine {};
        };

        class CREATE {
            file = QPATHTOFOLDER(functions\CREATE);
            class AAFroadPatrol {};
            class airportCanAttack {};
            class AIVEHinit {};
            class attackHQ {};
            class availableBasesAir {};
            class availableBasesLand {};
            class calculateMarkerArea {};
            class cargoSeats {};
            class civVEHinit {};
            class cleanserVeh {};
            class countFreeSpawnPositions {};
            class createAIAirplane {};
            class createAICities {};
            class createAIcontrols {};
            class createAIOutposts {};
            class createAIResources {};
            class createAIMilbase {};
            class createAIMilAdmin {};
            class createAttackForceAir {};
            class createAttackForceLand {};
            class createAttackForceMixed {};
            class createAttackForceOrbital {};
            class createAttackVehicle {};
            class createAttackVehicleOrbital {};
            class createSDKGarrisons {};
            class createSDKgarrisonsTemp {};
            class createUnit {};
            class createVehicleCrew {};
            class createVehicleQRFBehaviour {};
            class crewTypeForVehicle {};
            class cycleSpawn {};
            class FIAinitBases {};
            class findSpawnPosition {};
            class freeSpawnPositions {};
            class garrisonReorg {};
            class garrisonSize {};
            class garrisonUpdate {};
            class groupDespawner {};
            class invaderPunish {};
            class milBuildings {};
            class minefieldAAF {};
            class mortarPos {};
            class NATOinit {};
            class patrolReinf {};
            class reinforcementsAI {};
            class registerUnitType {};
            class remoteBattle {};
            class safeVehicleSpawn {};
            class singleAttack {};
            class spawnGroup {};
            class spawnVehicle {};
            class spawnVehicleAtMarker {};
            class spawnVehiclePrecise {};
            class RivalsCargoSeats {};
            class RivalsCreateUnit {};
            class RivalsCreateVehicleCrew {};
            class RivalsCrewTypeForVehicle {};
            class RivalsSpawnGroup {};
            class RivalsSpawnVehicle {};
            class VEHdespawner {};
            class vehKilledOrCaptured {};
            class wavedAttack {};
            class WPCreate {};
        };

        class debug {
            file = QPATHTOFOLDER(functions\debug);
            class deleteEmptyGroupsOnSide {};
            class installSchrodingersBuildingFix {};
            class prepFunctions {};
            class spawnDebuggingLoop {};
        };

        class Dialogs {
            file = QPATHTOFOLDER(functions\Dialogs);
            class clearForest {};
            class createDialog_shouldLoadPersonalSave {};
            class fastTravelRadio {};
            class mineDialog {};
            class moveHQObject {};
            class persistentSave {};
            class skiptime {};
            class squadOptions {};
            class squadRecruit {};
            class unit_recruit {};
        };

        class EventHandler {
            file = QPATHTOFOLDER(functions\EventHandler);
            class addArtilleryTrailEH {};
            class enemyUnitDeletedEH {};
            class enemyUnitKilledEH {};
            class vehicleDeletedEH {};
        };

        class Garrison {
            file = QPATHTOFOLDER(functions\Garrison);
            class addGarrison {};
            class addRequested {};
            class checkGroupType {};
            class checkVehicleType {};
            class countGarrison {};
            class createGarrison {};
            class createGarrisonLine {};
            class getGarrison {};
            class getGarrisonRatio {};
            class getGarrisonStatus {};
            class getRequested {};
            class getVehicleCrew {};
            class initPreference {};
            class replenishGarrison {};
            class selectGroupType {};
            class selectReinfUnits {};
            class selectVehicleType {};
            class shouldReinforce {};
            class updateGarrison {};
            class updatePreference {};
            class updateReinfState {};
            class updateVehicles {};
            class getGarrisonLimit {};
        };

        class init {
            file = QPATHTOFOLDER(functions\init);
            //Main initialisation functions.
            class initServer {};
            class initClient {};
            class setupMonitor {};
            class startGame {};

            //Other initialisation functions (generally called by the above)
            class briefing {};
            class cityinfo {};
            class clientIdleChecker {};
            class credits {};
            class initACE {};
            class initACEUnconsciousHandler {};
            class initBases {};
            class initUtilityItems {};
            class initGarrisons {};
            class initPreJIP { preInit = 1; };
            class initSpawnPlaces {};
            class generateRoadblock {};

            class initVarCommon {};
            class initVarServer {};

            class initVehClassToCrew {};
            class initRivalsVehClassToCrew {};
            class initZones {};
            class initZeusLogging {};
            class modBlacklist {};
            class playerMarkers {};
            class prepareMarkerArrays {};
            class resourcecheck {};
            class tags {};
        };

        class Intel {
            file = QPATHTOFOLDER(functions\Intel);
            class placeIntel {};
            class searchEncryptedIntel {};
            class searchIntelOnDocument {};
            class searchIntelOnLaptop {};
            class searchIntelOnLeader {};
            class selectIntel {};
            class showIntel {};
        };

        class keybinds {
            file = QPATHTOFOLDER(keybinds);
            class keyActions {};
        };

        class Missions {
            file = QPATHTOFOLDER(functions\Missions);
            class AS_Ambush {};
            class AS_Official {};
            class AS_Smasher {};
            class AS_specOP {};
            class AS_Traitor {};
            class AS_Zombies {};
            class CON_Outpost_Zombies {};
            class CON_Outpost {};
            class CON_Outpost_Compet {};
            class CON_MilAdmin {};
            class convoy {};
            class DES_Antenna {};
            class DES_Heli {};
            class DES_Artillery {};
            class DES_Vehicle {};
            class LOG_Ammo {};
            class LOG_Bank {};
            class SUPP_Supplies {};
            class LOG_Salvage {};
            class LOG_Airdrop {};
            class LOG_Crashsite {};
            class LOG_Crashsite_Satellite{};
            class LOG_Helicrash {};;
            class missionRequest {};
            class REP_Antenna {};
            class RES_Deserters {};
            class RES_Prisoners {};
            class RES_Refugees {};
            class RES_Informer {};
            class RES_Shipwreck {};
            class ENC_Trader {};
            class RIV_ENC_Rivals {};
            class RIV_ATT_Cell {};
            class RIV_ATT_Hideout {};
            class RIV_ATT_Transfer {};
            class RIV_AS_Traitor {};
            class RIV_SUPP_Salvage {};
            class RIV_RES_Prisoners {};
            class taskDelete {};
            class taskSetState {};
            class taskUpdate {};
            class underAttack {};
        };

        class ModsAndDLC {
            file = QPATHTOFOLDER(functions\ModsAndDLC);
            class darkMapFix {};
            class getModOfConfigClass {};
        };

        class OrgPlayers {
            file = QPATHTOFOLDER(functions\OrgPlayers);
            class addScorePlayer {};
            class addMoneyPlayer {};
            class donateMoney {};
            class donateMoneyPercentage {};
            class isMember {};
            class makePlayerBossIfEligible {};
            class memberAdd {};
            class membersList {};
            class music {};
            class promotePlayer {};
            class radioJam {};
            class ranksMP {};
            class resourcesPlayer {};
            class theBossToggleEligibility {};
            class theBossTransfer {};
            class theBossSteal {};
            class assignBossIfNone {};
            class tierCheck {};
            class unitTraits {};
        };

        class Pathfinding {
            file = QPATHTOFOLDER(functions\Pathfinding);
            class addToNavCells {};
            class addNodesNearMarkers {};
            class areNodesConnected {};
            class calculateH {};
            class convoyTest {};
            class drawGrid {};
            class drawLine {};
            class drawPath {};
            class findLandSupportMarkers {};
            class findNavDistance {};
            class findNodesInDistance {};
            class findPath {};
            class findPathPrecheck {};
            class findPosOnRoute {};
            class getMarkerNavPoint {};
            class getNearestNavPoint {};
            class listInsert {};
            class loadNavGrid {};
            class markNode {};
            class roadAStar {};
            class roadConnPoint {};
            class trimPath {};
        };

        class proxy {
            file = QPATHTOFOLDER(functions\proxy);
            class onPlayerRespawn {};
        };

        class Punishment {
            file = QPATHTOFOLDER(functions\Punishment);
            class outOfBounds {};
            class punishment {};
            class punishment_addActionForgive {};
            class punishment_checkStatus {};
            class punishment_evaluateEvent {};
            class punishment_FF_checkNearHQ {};
            class punishment_FF_addEH {};
            class punishment_oceanGulag {};
            class punishment_release {};
            class punishment_removeActionForgive {};
            class punishment_sentence_client {};
            class punishment_sentence_server {};
        };

        class REINF {
            file = QPATHTOFOLDER(functions\REINF);
            class addBombRun {};
            class addFIAsquadHC {};
            class addFIAveh {};
            class addBlackMarketVeh {};
            class addSquadVeh {};
            class addToGarrison {};
            class buildCreateVehicleCallback {};
            class buildMinefield {};
            class controlHCsquad {};
            class controlunit {};
            class dismissPlayerGroup {};
            class dismissSquad {};
            class enemyNearCheck {};
            class equipRebel {};
            class FIAinit {};
            class FIAskillAdd {};
            class garrisonAdd {};
            class garrisonDialog {};
            class postmortem {};
            class reDress {};
            class reDressFaction {};
            class reinfPlayer {};
            class spawnHCGroup {};
            class vehiclePrice {};
            class vehStats {};
        };

        class Revive {
            file = QPATHTOFOLDER(functions\Revive);
            class actionRevive {};
            class carry {};
            class handleDamage {};
            class handleDamageAAF {};
            class initRevive {};
            class isMedic {};
            class selfRevive {};
            class selfReviveReset {};
            class respawn {};
            class unconscious {};
            class unconsciousAAF {};
        };

        class Runways {
            file = QPATHTOFOLDER(functions\Runways);
            class getRunwayTakeoffForAirportMarker {};
            class runwayInfo {};
        };

        class SalvageRope {
            file = QPATHTOFOLDER(functions\SalvageRope);
            class SalvageRope {};
        };

        class Save {
            file = QPATHTOFOLDER(functions\Save);
            class collectSaveData {};
            class deleteSave {};
            class loadPlayer {};
            class loadServer {};
            class savePlayer {};
            class getStatVariable {};
            class loadStat {};
            class resetPlayer {};
            class retrievePlayerStat {};
            class returnSavedStat {};
            class savePlayerStat {};
            class setStatVariable {};
            class saveLoop {};
            class writebackSaveVar {};
        };

        class String {
            file = QPATHTOFOLDER(functions\String);
            class pad_2Digits {};
            class pad_3Digits {};
        };

        class ShortID {
        file = QPATHTOFOLDER(functions\Utility\ShortID);
        class shortID_create {};
        class shortID_format {};
        class shortID_init {};
        };

        class Supports {
            file = QPATHTOFOLDER(functions\Supports);
            class addSupportTarget {};
            class calculateSupportCallReveal {};
            class clearTargetArea {};
            class createSupport {};
            class getArtilleryRanges {};
            class initSupports {};
            class maxDefenceSpend {};
            class requestArtillery {};
            class requestSupport {};
            class showInterceptedSetupCall {};
            class showInterceptedSupportCall {};
            class useRadioKey {};
            class SUP_airstrike {};
            class SUP_airstrikeAvailable {};
            class SUP_airstrikeRoutine {};
            class SUP_artillery {};
            class SUP_artilleryAvailable {};
            class SUP_ASF {};
            class SUP_ASFAvailable {};
            class SUP_ASFRoutine {};
            class SUP_carpetBombs {};
            class SUP_carpetBombsAvailable {};
            class SUP_carpetBombsRoutine {};
            class SUP_CAS {};
            class SUP_CASDive {};
            class SUP_CASAvailable {};
            class SUP_CASDiveAvailable {};
            class SUP_CASApproach {};
            class SUP_CASDiveBomb {};
            class SUP_CASDiveBombRun {};
            class SUP_CASDiveRoutine {};
            class SUP_CASRoutine {};
            class SUP_CASRun {};
            class SUP_CASDiveRun {};
            class SUP_cruiseMissile {};
            class SUP_cruiseMissileAvailable {};
            class SUP_cruiseMissileRoutine {};
            class SUP_gunship {};
            class SUP_gunshipAvailable {};
            class SUP_gunshipRoutineDefault {};
            class SUP_gunshipRoutineV44 {};
            class SUP_gunshipRoutineNickelSteel {};
            class SUP_gunshipRoutineUSAF {};
            class SUP_gunshipRoutinePelican {};
            class SUP_gunshipRoutineStarWarsHMP {};
            class SUP_gunshipRoutineStarWarsLAAT {};
            class SUP_gunshipRoutine3CBAC47 {};
            class SUP_gunshipSpawn {};
            class SUP_mortar {};
            class SUP_mortarAvailable {};
            class SUP_mortarRoutine {};
            class SUP_orbitalStrike {};
            class SUP_orbitalStrikeAvailable {};
            class SUP_orbitalStrikeImpactEffects {};
            class SUP_orbitalStrikeBeamEffects {};
            class SUP_orbitalStrikeRoutine {};
            class SUP_QRFAir {};
            class SUP_QRFAirAvailable {};
            class SUP_QRFLand {};
            class SUP_QRFLandAvailable {};
            class SUP_QRFOrbital {};
            class SUP_QRFOrbitalAvailable {};
            class SUP_QRFRoutine {};
            class SUP_SAM {};
            class SUP_SAMAvailable {};
            class SUP_SAMRoutine {};
            class SUP_tank {};
            class SUP_tankAvailable {};
            class SUP_tankRoutine {};
            class SUP_UAV {};
            class SUP_UAVRoutine {};
            class SUP_UAVAvailable {};
            class SUP_QRFVehAirdrop {};
            class SUP_QRFVehAirdropAvailable {};
            class SUP_howitzer {};
            class SUP_howitzerAvailable {};
        };

        class FunctionsTemplates {
            file = QPATHTOFOLDER(functions\Templates);
            class aceModCompat {};
            class compatibilityLoadFaction {};
            class compileGroups {};
            class compileMissionAssets {};
            class getLoadout {};
            class loadFaction {};
            class loadRivals {};
            class loadAddon {};
            class rhsModCompat {};
        };

        class InitTemplates {
            file = QPATHTOFOLDER(Templates);
        };

        class ItemSets {
            file = QPATHTOFOLDER(functions\Templates\Itemsets);
            class itemset_medicalSupplies {};
            class itemset_miscEssentials {};
        };

        class Loadouts {
            file = QPATHTOFOLDER(functions\Templates\Loadouts);
            class loadout_setBackpack {};
            class loadout_addEquipment {};
            class loadout_setHelmet {};
            class loadout_setFacewear {};
            class loadout_addItems {};
            class loadout_additionalMuzzleMags {};
            class loadout_setUniform {};
            class loadout_setVest {};
            class loadout_setWeapon {};
            class loadout_builder {};
            class loadout_createBase {};
            class loadout_defaultWeaponMag {};
            class loadout_itemLoad {};
        };

        class TemplateVerification {
            file = QPATHTOFOLDER(functions\Templates\Verification);
            class TV_verifyLoadout {};
            class TV_verifyLoadoutsData {};
            class TV_verifyAssets {};
        };

        class Time {
            file = QPATHTOFOLDER(functions\Time);
            class dateToTimeString {};
            class secondsToTimeSpan {};
            class systemTime_format_S {};
            class timeSpan_format {};
        };

        class UI {
            file = QPATHTOFOLDER(functions\UI);
            class customHint {};
            class customHintDismiss {};
            class customHintInit {};
            class customHintRender {};
            class shader_ratioToHex {};
            class updateInfoBarShown {};
            class disableInfoBar {};
        };

        class uintToHex {
            file = QPATHTOFOLDER(functions\Utility\uintToHex);
            class uint12ToHex {};
            class uint16ToHex {};
            class uint20ToHex {};
            class uint24ToHex {};
            class uintToHexGenTables {};
        };

        class Undercover {
            file = QPATHTOFOLDER(functions\Undercover);
            class canGoUndercover {};
            class goUndercover {};
            class initUndercover {};
        };

        class Utility {
            file = QPATHTOFOLDER(functions\Utility);
            class basicBackpack {};
            class classNameToModel {};
            class countAttachedObjects {};
            class createDataObject {};
            class createNamespace {};
            class createRandomIdentity {};
            class deleteNamespace {};
            class getAdmin {};
            class isEngineer {};
            class localLog {};
            class log {};
            class setIdentity {};
            class setIdentityLocal {};
            class setPos {};
            class vehicleTextureSync {};
            class vehicleWillCollideAtPosition {};
            class getRoadDirection {};
            class getItemListFromDLC {};
        };

        class UtilityItems {
            file = QPATHTOFOLDER(functions\UtilityItems);
            class attachedObjects {};
            class buyItem {};
            class carryItem {};
            class dropObject {};
            class initMovableObject {};
            class initObject {};
            class initObjectRemote {};
            class remainingFuel {};
            class rotateItem {};
        };
        
        class reload_repack_turret_magazines {
            file = QPATHTOFOLDER(Scripts\RRTurretMagazines\scripts);
            //class postInit {};
            class reloadTurret {};
            class monitorMagazines {};
        };
    };
};

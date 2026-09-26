class CfgFunctions
{
    class A3U
    {
        class Ammunition
        {
            file = QPATHTOFOLDER(functions\Ammunition);
            class grabForbiddenItems {};
            class removeForbiddenItems {};
            class grabBlackMarketVehicles {};
            class removeUnlockedItems {};
        };
        class blackmarket
        {
            file = QPATHTOFOLDER(functions\blackmarket);
            class hasRequirements {};
            class sidesX {};
        };
        class cba
        {
            file = QPATHTOFOLDER(functions\cba);
            class settings {};
        };
        class effects
        {
            file = QPATHTOFOLDER(functions\effects);
            class createCrashedVehicle {};
            class createDeadSoldier {};
            class createDeadSoldiers {};
            class createFire {};
            class createFires {};
            class damageBuilding {};
        };
        class init
        {
            file = QPATHTOFOLDER(functions\init);
            class checkMods {};
            class init {};
            class initZones {};
            class popup {};
            class postInit {};
        };
        class main_menu
        {
            file = QPATHTOFOLDER(functions\main_menu);
            class isInMenu {};
            class menuImage {};
        };
        class map
        {
            file = QPATHTOFOLDER(functions\map);
            class mapHoverEH {};
            class handleMrkUpdate {};
            class isMarkerHidden {};
            class mapHover {};
            class mapTooltip {};
            class tooltipCreate {};
            class markerBrowser {};
            class markerContextMenu {};
            class mrkUpdateBulk {};
        };
        class player_context 
        {
            file = QPATHTOFOLDER(functions\player_context);
            class playerContextMenu {};
            class QRF_chasePlayer {};
            class context_buildPanel {};
            class context_panelActions {};
            class context_notification {};
        };
        class REINF
        {
            file = QPATHTOFOLDER(functions\REINF);
            class blackMarketVehiclePrice {};
            class invaderComeback {};
            class setInvaderState {};
            class simpleAttack {};
        };
        class patches
        {
            file = QPATHTOFOLDER(functions\patches);
            class getTierModifier {};
            class IMS_stealthKill {};
        };
        class STALKER
        {
            file = QPATHTOFOLDER(functions\STALKER);
            class createAnomalyField {};
            class emission {};
            class fillMapAnomalies {};
        };
        class Utility
        {
            file = QPATHTOFOLDER(functions\Utility);
            class addInteractionCondition {};
            class canInteract {};
            class exportCrate {};
            class exportPylons {};
            class exportTowns {};
            class hasAddon {};
            class log {};
            class logisticsGrabSeats {};
            class useMagazineItem {};
            class weightTest {};
        };
        class vehicles
        {
            file = QPATHTOFOLDER(functions\vehicles);
            class addLockpickAction {};
            class canLockpick {};
            class isLocked {};
            class lockpick {};
            class lockpickCleanup {};
            class lockpickGetPlayerItem {};
            class lockpickOnFail {};
            class lockpickOnProgress {};
            class lockpickOnStart {};
            class lockpickOnSuccess {};
            class lockpickZones {};
            class setLock {};
        };
        class zombie
        {
            file = QPATHTOFOLDER(functions\zombie);
            class attackHeli {};
            class handleZombieDeath {};
            class spawnZombie {};
            class spawnZombieCrater {};
            class spawnZombieRoar {};
            class spawnZombieWave {};
            class spawnZombieWaves {};
        };
        class zones
        {
            file = QPATHTOFOLDER(functions\zones);
            class revealRandomZones {};
            class revealZone {};
            class revealZones {};
            class revealZonesDistance {};
        };
    };
};

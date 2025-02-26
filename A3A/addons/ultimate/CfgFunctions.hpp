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
        class init
        {
            file = QPATHTOFOLDER(functions\init);
            class checkMods {};
            class init {};
            class initZones {};
            class popup {};
        };
        class main_menu
        {
            file = QPATHTOFOLDER(functions\main_menu);
            class isInMenu {};
            class menuImage {};
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
            class exportCrate {};
            class exportPylons {};
            class exportTowns {};
            class hasAddon {};
            class log {};
            class logisticsGrabSeats {};
            class weightTest {};
        };
        class zombie
        {
            file = QPATHTOFOLDER(functions\zombie);
            class attackHeli {};
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

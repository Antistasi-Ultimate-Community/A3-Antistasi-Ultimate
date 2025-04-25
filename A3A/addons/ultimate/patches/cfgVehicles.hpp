class Item_TFAR_SCR536: Item_Base_F 
{
    scope = 2;
    scopeCurator = 2;
    displayName = "SCR-536";
    author = AUTHOR;
    vehicleClass = "Items";
    class TransportItems
    {
        class _xx_TFAR_SCR536
        {
            name="TFAR_SCR536";
            count=1;
        };
    };
};

class Prop_TFAR_SCR536 : Thing
{
    destrType = "DestructNo";
    scope = 2;
    scopeCurator = 2;
    model = QPATHTOFOLDER(patches\scr536);
    displayName = "SCR-536 Handie Talkie";
    // editorCategory = "";
    // vehicleClass="";
};
class Land_HelipadCircle_F;
class Land_HelipadSquare_F;
class A3AU_RebHelipad_Circle_F: Land_HelipadCircle_F {};
class A3AU_RebHelipad_Square_F: Land_HelipadSquare_F {};
class Land_Shovel_F;
class Land_Axe_F;

class A3AU_TerrainSmoother_VerySmall_F: Land_Shovel_F {
    displayName = Terrain Smoother (4 m); ////needs to be localized
};
class A3AU_TerrainSmoother_Small_F: Land_Shovel_F {
    displayName = Terrain Smoother (8 m); ////needs to be localized
};
class A3AU_TerrainSmoother_Medium_F: Land_Shovel_F {
    displayName = Terrain Smoother (15 m); ////needs to be localized
};
class A3AU_TerrainSmoother_Large_F: Land_Shovel_F {
    displayName = Terrain Smoother (30 m); ////needs to be localized
};

class A3AU_TerrainCleaner_VerySmall_F: Land_Axe_F {
    displayName = Terrain Cleaner (4 m); ////needs to be localized
};
class A3AU_TerrainCleaner_Small_F: Land_Axe_F {
    displayName = Terrain Cleaner (8 m); ////needs to be localized
};
class A3AU_TerrainCleaner_Medium_F: Land_Axe_F {
    displayName = Terrain Cleaner (15 m); ////needs to be localized
};
class A3AU_TerrainCleaner_Large_F: Land_Axe_F {
    displayName = Terrain Cleaner (30 m); ////needs to be localized
};
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

class UserTexture10m_F;
class OverObject_HelipadCircle_F: UserTexture10m_F {
    /* hiddenSelections[] = {"camo", "decals"};
    hiddenSelectionsTextures[] = {
        "\A3\Structures_F\Mil\Helipads\Data\HelipadCircle_F_CO.paa",
        "\A3\Structures_F\Mil\Helipads\Data\HelipadDecal_F_CO.paa"
    }; */
};
class OverObject_HelipadSquare_F: UserTexture10m_F {
    /* hiddenSelections[] = {"camo", "decals"};
    hiddenSelectionsTextures[] = {
        "\A3\Structures_F\Mil\Helipads\Data\HelipadSquare_F_CO.paa",
        "\A3\Structures_F\Mil\Helipads\Data\HelipadDecal_F_CO.paa"
    }; */
};
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
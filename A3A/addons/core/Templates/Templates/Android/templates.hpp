    class Android_Base
    {
        requiredAddons[] = {"SSV_Android", "SSV_Vanguard", "OPTRE_Core", "ExoMod_Universality_Uniforms"};
        basepath = QPATHTOFOLDER(Templates\Templates\Android);
        logo = QPATHTOFOLDER(Pictures\antistasi_ultimate_logo.paa);
        flagTexture = QPATHTOFOLDER(Templates\Templates\Android\images\flag_android_ca.paa);
        priority = 90;
        climate[] = {"temperate","tropical","arid","arctic"};
    };

    class Android_Army : Android_Base
    {
        side = "Occ";
        name = "Android";
        file = "Android_AI_Army";
        description = "Androids are designed with one simple function: Serve the Higher Society.";
    };
    class Vanguard_Army : Android_Army
    {
        side = "Inv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\Android\images\flag_vanguard_ca.paa);
        name = "Vanguard";
        file = "Vanguard_AI_Army";
        description = "The Vanguard is a unique faction, accepting any androids into their ranks. They are an industrial empire, with a mercenary division.";
    };
    class Vanguard_Expeditionary : Vanguard_Army
    {
        name = "Vanguard Expeditionary";
        file = "Vanguard_AI_Expeditionary";
        description = "THIS FACTION USES SF INSTEAD OF MILITIA/MILITARY/ELITE.\n\nThe Vanguard Expeditonary is a sub faction of the Vanguard. Dedicated to pretty much anything that Vanguard needs doing on the low. From security detail to infiltration, they are well suited to the task with many vehicles and special exo-suits.";
    };

    class Replika_Riv : Android_Base
    {
        side = "Riv";
        name = "Replikas";
        file = "Vanguard_Riv_Replika";
        description = "Replikas are rogue androids. On the surface, they can look like any other android. Replikas have formed an insurgency, sporting red colours instead of blue. Their only goal is to create chaos.";
    };

    class Corrupted_Civ_Zombie : Android_Base
    {
        requiredAddons[] = {"SSV_Android", "SSV_Vanguard", "OPTRE_Core", "ExoMod_Universality_Uniforms", "WBK_ZombieCreatures"};
        flagTexture = QPATHTOFOLDER(Templates\Templates\Android\images\flag_vanguard_ca.paa);
        priority = 10;
        side = "Civ";
        name = "Corrupted";
        file = "Corrupted_Civ_Zombie";
        description = "All android life was wiped out, being replaced by Corrupted. Corrupted are android shells, stripped down to their onboard programming.";
    };
    class Xerthans_Civ_Zombie : Corrupted_Civ_Zombie
    {
        name = "Xerthans";
        file = "Xerthans_Civ_Zombie";
        description = "All android life was wiped out, being replaced by Xerthans. Xerthans belong to a species known as Yashers, who resurrect once death occurs.";
    };
    class Android_Civ : Android_Base
    {
        name = "Android Population";
        file = "Android_Civ";
        side = "Civ";
        priority = 11;
        description = "";
    };

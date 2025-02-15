    class Vanilla_Civ_Empty
    {
        requiredAddons[] = {};
        basepath = QPATHTOFOLDER(Templates\Templates\Misc);
        priority = 0;
        side = "Civ";
        logo = "a3\ui_f\data\logos\arma3_expansion_ca.paa";
        flagTexture = "a3\data_f\flags\flag_white_co.paa";
        name = "No Civs";
        file = "Vanilla_Civ_Empty";
        description = "All civilian life was wiped out. (This is an experimental template, disabling traffic and all civ presence)";
        climate[] = {"temperate","tropical","arid","arctic"};
    };
    class Vanilla_Civ_Zombie : Vanilla_Civ_Empty
    {
        requiredAddons[] = {"WBK_ZombieCreatures"};
        logo = "a3\data_f\Images\Mod_Base_logo_ca.paa";
        flagTexture = "a3\data_f\flags\flag_white_dmg_co.paa";
        name = "Zombies";
        file = "Vanilla_Civ_Zombie";
        description = "All civilian life was wiped out, being replaced by zombies. (This is an experimental template, disabling traffic and replacing civs with zombies)";
    };
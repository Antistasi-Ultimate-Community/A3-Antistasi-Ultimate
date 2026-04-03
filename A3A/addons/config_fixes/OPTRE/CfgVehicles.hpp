//OPTRE - CfgVehicles.hpp

class CfgVehicles
{
    #include "falcons.hpp"
    #include "covenant_support.hpp"
    class OPTRE_M411_APC_UNSC;
    class a3a_OPTRE_M411_APC_INS : OPTRE_M411_APC_UNSC
    {
        displayName = "M411 Bison APC [ins]";
        faction = "OPTRE_Ins";
        side = 0;
        class TextureSources
        {
            class Guerrilla
            {
                author = "Article 2 Studios";
                displayName = "Guerrilla";
                factions[] = {"OPTRE_INS"};
                textures[] = {"OPTRE_Vehicles\Bison\data\Bison_Body_ins2_CO.paa","OPTRE_Vehicles\Bison\data\Bison_Misc_ins2_CO.paa","OPTRE_Vehicles\Bison\data\Bison_WheelsCannon_CO.paa","OPTRE_Vehicles\Bison\data\Bison_Seats_CO.paa","OPTRE_Vehicles\Bison\data\Bison_Interior_CO.paa","OPTRE_Vehicles\Bison\data\Bison_MFCDScreens_CO.paa"};
            };
            class Innie
            {
                author = "Article 2 Studios";
                displayName = "Innie";
                factions[] = {"OPTRE_INS"};
                textures[] = {"OPTRE_Vehicles\Bison\data\Bison_Body_ins_CO.paa","OPTRE_Vehicles\Bison\data\Bison_Misc_ins_CO.paa","OPTRE_Vehicles\Bison\data\Bison_WheelsCannon_CO.paa","OPTRE_Vehicles\Bison\data\Bison_Seats_CO.paa","OPTRE_Vehicles\Bison\data\Bison_Interior_CO.paa","OPTRE_Vehicles\Bison\data\Bison_MFCDScreens_CO.paa"};
            };
            class InnieDes
            {
                author = "Article 2 Studios";
                displayName = "Innie Desert #1";
                factions[] = {"OPTRE_INS"};
                textures[] = {"OPTRE_Vehicles\Bison\data\innie\Bison_Body_desert_CO.paa","OPTRE_Vehicles\Bison\data\innie\Bison_Misc_desert_CO.paa","OPTRE_Vehicles\Bison\data\Bison_WheelsCannon_CO.paa","OPTRE_Vehicles\Bison\data\Bison_Seats_CO.paa","OPTRE_Vehicles\Bison\data\Bison_Interior_CO.paa","OPTRE_Vehicles\Bison\data\Bison_MFCDScreens_CO.paa"};
            };
            class InnieDes2
            {
                author = "Article 2 Studios";
                displayName = "Innie Desert #2";
                factions[] = {"OPTRE_INS"};
                textures[] = {"OPTRE_Vehicles\Bison\data\innie\Bison_Body_desert2_CO.paa","OPTRE_Vehicles\Bison\data\innie\Bison_Misc_desert2_CO.paa","OPTRE_Vehicles\Bison\data\Bison_WheelsCannon_CO.paa","OPTRE_Vehicles\Bison\data\Bison_Seats_CO.paa","OPTRE_Vehicles\Bison\data\Bison_Interior_CO.paa","OPTRE_Vehicles\Bison\data\Bison_MFCDScreens_CO.paa"};
            };
            class InnieSnow
            {
                author = "Article 2 Studios";
                displayName = "Innie Snow #1";
                factions[] = {"OPTRE_INS"};
                textures[] = {"OPTRE_Vehicles\Bison\data\innie\Bison_Body_snow_CO.paa","OPTRE_Vehicles\Bison\data\innie\Bison_Misc_snow_CO.paa","OPTRE_Vehicles\Bison\data\Bison_WheelsCannon_CO.paa","OPTRE_Vehicles\Bison\data\Bison_Seats_CO.paa","OPTRE_Vehicles\Bison\data\Bison_Interior_CO.paa","OPTRE_Vehicles\Bison\data\Bison_MFCDScreens_CO.paa"};
            };
            class InnieSnow2
            {
                author = "Article 2 Studios";
                displayName = "Innie Snow #2";
                factions[] = {"OPTRE_INS"};
                textures[] = {"OPTRE_Vehicles\Bison\data\innie\Bison_Body_snow2_CO.paa","OPTRE_Vehicles\Bison\data\innie\Bison_Misc_snow2_CO.paa","OPTRE_Vehicles\Bison\data\Bison_WheelsCannon_CO.paa","OPTRE_Vehicles\Bison\data\Bison_Seats_CO.paa","OPTRE_Vehicles\Bison\data\Bison_Interior_CO.paa","OPTRE_Vehicles\Bison\data\Bison_MFCDScreens_CO.paa"};
            };
            class InnieWdl
            {
                author = "Article 2 Studios";
                displayName = "Innie Woodland #1";
                factions[] = {"OPTRE_INS"};
                textures[] = {"OPTRE_Vehicles\Bison\data\innie\Bison_Body_woodland_CO.paa","OPTRE_Vehicles\Bison\data\innie\Bison_Misc_woodland_CO.paa","OPTRE_Vehicles\Bison\data\Bison_WheelsCannon_CO.paa","OPTRE_Vehicles\Bison\data\Bison_Seats_CO.paa","OPTRE_Vehicles\Bison\data\Bison_Interior_CO.paa","OPTRE_Vehicles\Bison\data\Bison_MFCDScreens_CO.paa"};
            };
            class InnieWdl2
            {
                author = "Article 2 Studios";
                displayName = "Innie Woodland #2";
                factions[] = {"OPTRE_INS"};
                textures[] = {"OPTRE_Vehicles\Bison\data\innie\Bison_Body_woodland2_CO.paa","OPTRE_Vehicles\Bison\data\innie\Bison_Misc_woodland2_CO.paa","OPTRE_Vehicles\Bison\data\Bison_WheelsCannon_CO.paa","OPTRE_Vehicles\Bison\data\Bison_Seats_CO.paa","OPTRE_Vehicles\Bison\data\Bison_Interior_CO.paa","OPTRE_Vehicles\Bison\data\Bison_MFCDScreens_CO.paa"};
            };
        };
        textureList[] = {"Innie", 1,"Guerrilla", 0,"InnieDes", 0,"InnieDes2", 0,"InnieSnow", 0,"InnieSnow2", 0,"InnieWdl", 0,"InnieWdl2", 0};
        hiddenSelectionsTextures[] = {"OPTRE_Vehicles\Bison\data\Bison_Body_ins_CO.paa","OPTRE_Vehicles\Bison\data\Bison_Misc_ins_CO.paa","OPTRE_Vehicles\Bison\data\Bison_WheelsCannon_CO.paa","OPTRE_Vehicles\Bison\data\Bison_Seats_CO.paa","OPTRE_Vehicles\Bison\data\Bison_Interior_CO.paa","OPTRE_Vehicles\Bison\data\Bison_MFCDScreens_CO.paa"};
    };
    class optre_catfish_unarmed_f;
    class optre_catfish_civ_f : optre_catfish_unarmed_f 
    {
        displayName = "C112 Boat";
        faction = "OPTRE_UEG_Civ";
        side = 3;
        threat[] = {0,0,0};
        class TextureSources
        {
            class texCheese
            {
                author = "Article 2 Studios";
                Displayname = "Cheese";
                factions[] = {"OPTRE_UEG_Civ"};
                textures[] = {"\OPTRE_Vehicles\catfish\data\cheese_boat_co.paa","\OPTRE_Vehicles\catfish\data\optre_catfish_interior_co.paa","\OPTRE_Vehicles\catfish\data\optre_catfish_seats_co.paa","\OPTRE_Vehicles\catfish\data\optre_catfish_windscreen_ca.paa"};
            };
        };
        textureList[] = {"texCheese",1};
    };
};
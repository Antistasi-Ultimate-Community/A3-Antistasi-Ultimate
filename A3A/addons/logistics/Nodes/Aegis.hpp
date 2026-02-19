class A3_Aegis_Soft_F_Aegis_Truck_02_Truck_02_flatbed_F_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,1.14,-0.79};
            seats[] = {};
        };
        class Node2
        {
            offset[] = {0,0.34,-0.79};
            seats[] = {};
        };
        class Node3
        {
            offset[] = {0,-0.46,-0.79};
            seats[] = {};
        };
        class Node4
        {
            offset[] = {0,-1.26,-0.79};
            seats[] = {};
        };
        class Node5
        {
            offset[] = {0,-2.06,-0.79};
            seats[] = {};
        };
        class Node6
        {
            offset[] = {0,-2.86,-0.79};
            seats[] = {};
        };
    };
};
class A3_Aegis_Boat_F_Aegis_Boat_Civil_02_Boat_Civil_02_F_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.8,-0.92};
            seats[] = {2,3};
        };
        class Node2
        {
            offset[] = {0,-1.6,-0.92};
            seats[] = {0,1};
        };
    };
};
class A3_Aegis_Air_F_Aegis_Heli_Transport_02_Heli_Transport_02_F_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,3.93,-1.74};
        };
        class Node2
        {
            offset[] = {0,3.13,-1.74};
        };
        class Node3
        {
            offset[] = {0,2.33,-1.74};
        };
        class Node4
        {
            offset[] = {0,1.53,-1.74};
        };
        class Node5
        {
            offset[] = {0,0.73,-1.74};
        };
        class Node6
        {
            offset[] = {0,-0.0700001,-1.74};
        };
        class Node7
        {
            offset[] = {0,-0.87,-1.74};
        };
        class Node8
        {
            offset[] = {0,-1.67,-1.74};
        };
    };
};
class A3_Aegis_Air_F_Aegis_Heli_Transport_02_Heli_Transport_02_VIP_F_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0.39,2.8,-1.74};
        };
        class Node2
        {
            offset[] = {0.39,2,-1.74};
        };
    };
};

class A3_Aegis_air_f_Aegis_Heli_Attack_04_Heli_Attack_04_F_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0.59,3.95,-2};
        };
    };
};
class A3_Aegis_Air_F_Aegis_Plane_Transport_01_Plane_Transport_01_F_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-1.85,-4.55};
        };
        class Node2
        {
            offset[] = {0,-2.65,-4.55};
        };
    };
};
///////////NATO AFV 1
class B_AFV_Wheeled_01_unarmed_F : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.1,-0.233};
        };
        class Node2
        {
            offset[] = {0,-0.9,-0.233};
        };
        class Node3
        {
            offset[] = {0,-1.7,-0.233};
        };
        class Node4
        {
            offset[] = {0,-2.5,-0.233};
        };
        class Node5
        {
            offset[] = {0,-3.3,-0.099};
        };
        class Node6
        {
            offset[] = {0,-4.1,-0.0992999};
        };
    };
};
class B_T_AFV_Wheeled_01_unarmed_F : B_AFV_Wheeled_01_unarmed_F {};
class B_W_AFV_Wheeled_01_unarmed_F : B_AFV_Wheeled_01_unarmed_F {};
class O_SFIA_AFV_Wheeled_01_unarmed_F : B_AFV_Wheeled_01_unarmed_F {};
/////NATO AFV 1 up
class B_AFV_Wheeled_01_up_unarmed_F : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.08,-0.348};
        };
        class Node2
        {
            offset[] = {0,-0.88,-0.348};
        };
        class Node3
        {
            offset[] = {0,-1.68,-0.348};
        };
        class Node4
        {
            offset[] = {0,-2.48,-0.348};
        };
        class Node5
        {
            offset[] = {0,-3.28,-0.2335};
        };
        class Node6
        {
            offset[] = {0,-4.08019,-0.2286};
        };
    };
};
class B_T_AFV_Wheeled_01_up_unarmed_F : B_AFV_Wheeled_01_up_unarmed_F {};
class B_W_AFV_Wheeled_01_up_unarmed_F : B_AFV_Wheeled_01_up_unarmed_F {};
class O_SFIA_AFV_Wheeled_01_up_unarmed_F : B_AFV_Wheeled_01_up_unarmed_F {};
///apcs
class Aegis_I_E_APC_Wheeled_01_medical_F : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0.688898,0.3217,-0.169};
        };
        class Node2
        {
            offset[] = {0,-0.477901,-0.1693};
        };
        class Node3
        {
            offset[] = {0,-1.2784,-0.169};
        };
        class Node4
        {
            offset[] = {0.0014,-2.0779,-0.1693};
        };
        class Node5
        {
            offset[] = {0,-2.87849,-0.169};
        };
        class Node6
        {
            offset[] = {0,-3.67789,-0.1693};
        };
        class Node7
        {
            offset[] = {0,-4.47809,-0.201799};
        };
    };
};
class a3a_ION_APC_Wheeled_01_unarmed_lxWS : Aegis_I_E_APC_Wheeled_01_medical_F {};
class Atlas_B_M_APC_Wheeled_01_unarmed_v2_F : Aegis_I_E_APC_Wheeled_01_medical_F {};
class B_UN_APC_Wheeled_01_unarmed_lxWS : Aegis_I_E_APC_Wheeled_01_medical_F {};
class B_APC_Wheeled_01_unarmed_F : Aegis_I_E_APC_Wheeled_01_medical_F {};
class B_D_APC_Wheeled_01_unarmed_lxWS_v2 : Aegis_I_E_APC_Wheeled_01_medical_F {};
class B_T_APC_Wheeled_01_unarmed_F : Aegis_I_E_APC_Wheeled_01_medical_F {};
class B_W_APC_Wheeled_01_unarmed_v2_F : Aegis_I_E_APC_Wheeled_01_medical_F {};
class Aegis_B_E_APC_Wheeled_01_unarmed_v2_F : Aegis_I_E_APC_Wheeled_01_medical_F {};
class Aegis_B_E_APC_Wheeled_01_unarmed_v2_ard_F : Aegis_I_E_APC_Wheeled_01_medical_F {};
class Aegis_I_E_APC_Wheeled_01_medical_ard_F : Aegis_I_E_APC_Wheeled_01_medical_F {};
class Aegis_B_E_APC_Wheeled_01_medical_F : Aegis_I_E_APC_Wheeled_01_medical_F {};
class Aegis_B_E_APC_Wheeled_01_medical_ard_F : Aegis_I_E_APC_Wheeled_01_medical_F {};
class B_APC_Wheeled_01_medical_F : Aegis_I_E_APC_Wheeled_01_medical_F {};
class B_T_APC_Wheeled_01_medical_F : Aegis_I_E_APC_Wheeled_01_medical_F {};
class B_W_APC_Wheeled_01_medical_F : Aegis_I_E_APC_Wheeled_01_medical_F {};

class O_APC_Tracked_02_unarmed_F : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,0.1243,-0.5182};
        };
        class Node2
        {
            offset[] = {0.0313,-1.0919,-0.4988};
            canCouple = 0;
        };
        class Node3
        {
            offset[] = {0.0312,-2.0741,-0.4392};
        };
        class Node4
        {
            offset[] = {0.0313,-3.16199,-0.2559};
            canCouple = 0;
        };
        class Node5
        {
            offset[] = {0.0312,-4.27209,-0.2743};
        };
    };
};
class O_R_APC_Tracked_02_medical_F : O_APC_Tracked_02_unarmed_F {};
class Atlas_O_W_APC_Tracked_02_medical_F : O_APC_Tracked_02_unarmed_F {};
class O_APC_Tracked_02_medical_F : O_APC_Tracked_02_unarmed_F {};
class O_T_APC_Tracked_02_medical_F : O_APC_Tracked_02_unarmed_F {};
class O_T_APC_Tracked_02_unarmed_F : O_APC_Tracked_02_unarmed_F {};
class Aegis_O_R_APC_Tracked_02_unarmed_lxWS : O_APC_Tracked_02_unarmed_F {};

///aaf apc wheeled 3 unarmed
class I_APC_Wheeled_03_med_F : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0.4,-0.7,-0.319};
        };
        class Node2
        {
            offset[] = {0.4,-1.5,-0.319};
        };
        class Node3
        {
            offset[] = {0.4,-2.3,-0.319};
        };
        class Node4
        {
            offset[] = {0.4,-3.1,-0.319};
        };
        class Node5
        {
            offset[] = {0.4,-3.9,-0.319};
        };
        class Node6
        {
            offset[] = {0.4,-4.7,-0.319};
            canCouple = 0;
        };
    };
};
class B_APC_Wheeled_03_unarmed_F : I_APC_Wheeled_03_med_F {};
class B_T_APC_Wheeled_03_unarmed_F : I_APC_Wheeled_03_med_F {};
class B_G_APC_Wheeled_03_unarmed_F : I_APC_Wheeled_03_med_F {};
class Atlas_BLU_G_APC_Wheeled_03_unarmed_F : I_APC_Wheeled_03_med_F {};
class Atlas_BLU_G_ard_APC_Wheeled_03_unarmed_F : I_APC_Wheeled_03_med_F {};
class B_APC_Wheeled_03_med_F : I_APC_Wheeled_03_med_F {};
class B_T_APC_Wheeled_03_med_F : I_APC_Wheeled_03_med_F {};
class Atlas_BLU_G_APC_Wheeled_03_med_F : I_APC_Wheeled_03_med_F {};
class Atlas_BLU_G_ard_APC_Wheeled_03_med_F : I_APC_Wheeled_03_med_F {};

///apc wheeled 04 unarmed
class Aegis_I_APC_Wheeled_04_export_med_F : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,1.0332,-0.3349};
            seats[] = {};
        };

        class Node2
        {
            offset[] = {0,-0.0327999,-0.317299};
            seats[] = {};
        };

        class Node3
        {
            offset[] = {0,-1.0327,-0.3349};
            seats[] = {};
        };

        class Node4
        {
            offset[] = {0,-2.033,-0.317299};
            seats[] = {};
        };

        class Node5
        {
            offset[] = {0,-3.03299,-0.3349};
            seats[] = {};
        };

        class Node6
        {
            offset[] = {0,-4.03469,-0.317299};
            seats[] = {};
        };
    };
};
class Aegis_I_APC_Wheeled_04_export_unarmed_F : Aegis_I_APC_Wheeled_04_export_med_F {};
class Aegis_O_T_APC_Wheeled_04_unarmed_F : Aegis_I_APC_Wheeled_04_export_med_F {};
class Aegis_I_UNO_APC_Wheeled_04_unarmed_F : Aegis_I_APC_Wheeled_04_export_med_F {};
class Aegis_B_G_APC_Wheeled_04_unarmed_F : Aegis_I_APC_Wheeled_04_export_med_F {};
class Aegis_O_APC_Wheeled_04_unarmed_F : Aegis_I_APC_Wheeled_04_export_med_F {};
class Aegis_O_SFIA_APC_Wheeled_04_unarmed_F : Aegis_I_APC_Wheeled_04_export_med_F {};
class O_R_APC_Wheeled_04_unarmed_F : Aegis_I_APC_Wheeled_04_export_med_F {};
class Aegis_O_T_APC_Wheeled_04_med_F : Aegis_I_APC_Wheeled_04_export_med_F {};
class Aegis_I_UNO_APC_Wheeled_04_med_F : Aegis_I_APC_Wheeled_04_export_med_F {};
class Aegis_O_APC_Wheeled_04_med_F : Aegis_I_APC_Wheeled_04_export_med_F {};
class Aegis_O_SFIA_APC_Wheeled_04_med_F : Aegis_I_APC_Wheeled_04_export_med_F {};
class O_R_APC_Wheeled_04_med_F : Aegis_I_APC_Wheeled_04_export_med_F {};

class A3_Aegis_Armor_F_Aegis_APC_Wheeled_04_APC_Wheeled_04_cannon_F_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-4.0099,-0.1576};
        };
        class Node2
        {
            offset[] = {0,-3.2096,-0.1579};
        };
        class Node3
        {
            offset[] = {0,-2.41,-0.1577};
        };
        class Node4
        {
            offset[] = {0,-1.61021,-0.1579};
            canCouple = 0;
        };
    };
};
class A3_Aegis_Armor_F_Aegis_APC_Wheeled_04_APC_Wheeled_04_export_F_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-3.9782,-0.313099};
        };
        class Node2
        {
            offset[] = {0,-3.1776,-0.3049};
        };
        class Node3
        {
            offset[] = {0,-2.3776,-0.313099};
            canCouple = 0;
        };
        class Node4
        {
            offset[] = {0,-1.5777,-0.3049};
            seats[] = {};
            canCouple = 0;
        };
    };
};
class A3_Aegis_Armor_F_Aegis_APC_Wheeled_04_APC_Wheeled_04_cannon_v2_F_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-4.70429,-0.0909001};
            seats[] = {};
        };
    };
};

//////////////////NATO APC 1
class B_APC_Tracked_01_unarmed_F : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0.710001,-1.8205,-0.157};
            seats[] = {};
        };
        class Node2
        {
            offset[] = {0.711701,-3.1,-0.157};
            seats[] = {};
        };
        class Node3
        {
            offset[] = {-0.720801,-1.9365,-0.157};
            seats[] = {};
            canCouple = 0;
        };
        class Node4
        {
            offset[] = {-0.7403,-3.1,-0.157};
            seats[] = {};
        };
        class Node5
        {
            offset[] = {1.1321,-4.2151,-0.1986};
            seats[] = {};
            canCouple = 0;
        };
        class Node6
        {
            offset[] = {0.462,-1.0166,-0.1485};
            seats[] = {};
            canCouple = 0;
        };
    };
};
class B_APC_Tracked_01_med_F : B_APC_Tracked_01_unarmed_F {};
class B_T_APC_Tracked_01_unarmed_F : B_APC_Tracked_01_unarmed_F {};
class B_W_APC_Tracked_01_unarmed_F : B_APC_Tracked_01_unarmed_F {};
class B_T_APC_Tracked_01_med_F : B_APC_Tracked_01_unarmed_F {};
class B_W_APC_Tracked_01_med_F : B_APC_Tracked_01_unarmed_F {};

class B_APC_Tracked_01_CRV_unarmed_F : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {-0.031,-2.0211,-0.1311};
            seats[] = {};
        };
        class Node2
        {
            offset[] = {-0.0311,-2.971,-0.1306};
            seats[] = {};
        };
        class Node3
        {
            offset[] = {-1.2158,-4.20609,-0.1846};
            seats[] = {};
            canCouple = 0;
        };
    };
};
class B_T_APC_Tracked_01_CRV_unarmed_F : B_APC_Tracked_01_CRV_unarmed_F {};
class B_W_APC_Tracked_01_CRV_unarmed_F : B_APC_Tracked_01_CRV_unarmed_F {};
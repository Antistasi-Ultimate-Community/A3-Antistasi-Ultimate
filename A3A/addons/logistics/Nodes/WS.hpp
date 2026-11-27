/////////////Truck (ZAMAK)
class lxws_vehicles_f_lxws_Truck_02_Truck_02_flatbed_lxWS_p3d : TRIPLES(ADDON,Nodes,Base)
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
class lxws_vehicles_f_lxws_Truck_02_Truck_02_AA_lxws_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0.032,1.2,-1.2};
        };
        class Node2
        {
            offset[] = {0.032,0.4,-1.2};
        };
    };
};
class lxws_vehicles_f_lxws_Truck_02_Truck_02_cargo_lxWS_p3d : TRIPLES(ADDON,Nodes,Base)
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
///////////APC
//////CSAT APC 1
class lxws_vehicles_1_f_lxws_APC_Wheeled_02_APC_Wheeled_02_unarmed_lxws_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0.215,-1.6,-0.1};
        };
        class Node2
        {
            offset[] = {0.215,-2.4,-0.1};
        };
        class Node3
        {
            offset[] = {0.215,-3.2,-0.1};
        };
        class Node4
        {
            offset[] = {0.215,-4,-0.1};
        };
    };
};
class lxws_vehicles_1_f_lxws_APC_Wheeled_02_APC_Wheeled_02_HMG_lxws_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0.22,-3.2,-0.13};
        };
        class Node2
        {
            offset[] = {0.22,-4,-0.13};
        };
    };
};
///////CSAT APC 2
class lxWS_vehicles_1_f_lxws_APC_Tracked_02_APC_Tracked_02_30mm_lxws_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0.032,-4,-0.11};
        };
    };
};

///////////Offroad armed armored
class lxws_vehicles_f_lxws_Offroad_01_Offroad_01_armor_AT_lxWS_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {-0.05,-1,-1.09};
        };
    };
};
class lxws_vehicles_f_lxws_Offroad_01_Offroad_01_armor_hmg_lxWS_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {-0.05,-0.83,-1.26};
        };
    };
};

///////////Offroad armored ZU-23
class lxws_vehicles_f_lxws_Offroad_01_Offroad_01_armor_aa_lxWS_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {-0.05,-1.2,-1.73};
        };
    };
};

///////////Offroad ZU-23
class lxws_vehicles_f_lxws_Offroad_01_Offroad_01_aa_lxWS_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {-0.04,-1.2,-1.73};
        };
    };
};


///////////Offroad unarmed armored
class lxws_vehicles_f_lxws_offroad_01_offroad_01_armor_unarmed_lxws_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {-0.05,-1.3,-1.15};
            seats[] = {3,4};
        };
        class Node2
        {
            offset[] = {-0.05,-2.3,-1.15};
            seats[] = {1,2};
        };
    };
};

class lxws_vehicles_f_lxws_offroad_01_offroad_01_unarmed_lxws_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {-0.05,-1.3,-0.683};
            seats[] = {3,4};
        };
        class Node2
        {
            offset[] = {-0.05,-2.3,-0.683};
            seats[] = {1,2};
        };
    };
};
/////////Heli
class lxWS_air_f_lxWS_Heli_Light_02_Heli_Light_02_lxWS_p3d : TRIPLES(ADDON,Nodes,Base)
{   canLoadWeapon = 0;
    class Nodes
    {
        class Node1
        {
            offset[] = {-0,2.05,-1.5};
        };
    };
};

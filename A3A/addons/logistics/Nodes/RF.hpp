// RF.hpp - Vehicle Logistic Nodes

// https://github.com/official-antistasi-community/A3-Antistasi/pull/3185

//Default open pickup
class a3a_civ_Pickup_fuel_rf : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,0.4,0.03};
        };
        class Node2
        {
            offset[] = {0,-0.4,0.03};
        };
    };
};

class C_Pickup_repair_rf : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.4,0};
        };
    };
};
class lxRF_vehicles_rf_pickup_01_pickup_01_service_ig_rf_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.4,0};
        };
    };
};

class lxRF_vehicles_rf_pickup_01_pickup_01_hmg_rf_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {-0.03,-1.2,-1.24};
        };
    };
};

class lxRF_vehicles_rf_pickup_01_pickup_01_aat_rf_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {-0.05,-2.1,-1.503};
        };
    };
};

class lxRF_vehicles_rf_pickup_01_pickup_01_mrl_rf_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {-0.04,-0.3,-1};
            seats[] = {5,6};
        };
    };
};


class lxRF_vehicles_rf_pickup_01_pickup_01_unarmed_rf_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-1.5,-1};
            seats[] = {5,6};
        };
        class Node2
        {
            offset[] = {0,-2.3,-1};
            seats[] = {3,4};
        };
    };
};

class lxRF_vehicles_rf_pickup_01_pickup_01_rcws_rf_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-2,-1.02};
        };
    };
};

class lxRF_vehicles_rf_pickup_01_pickup_01_minigun_rf_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {-0.035,-1.4,-0.511};
            seats[] = {4,3};
        };
        class Node2
        {
            offset[] = {-0.035,-2.2,-0.511};
            seats[] = {2,1};
        };
    };
};


class lxRF_vehicles_rf_pickup_01_pickup_01_mmg_rf_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-1.5,-1.1};
            seats[] = {5,6};
        };
        class Node2
        {
            offset[] = {0,-2.3,-1.1};
            seats[] = {3,4};
        };
    };
};
class lxRF_vehicles_rf_pickup_01_pickup_01_service_rf_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-1.5,-1};
            seats[] = {5,6};
        };
        class Node2
        {
            offset[] = {0,-2.3,-1};
            seats[] = {3,4};
        };
    };
};

class lxRF_vehicles_rf_pickup_01_pickup_01_comms_rf_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-1.5,-1};
            seats[] = {5,6};
        };
        class Node2
        {
            offset[] = {0,-2.3,-1};
            seats[] = {3,4};
        };
    };
};

class lxRF_vehicles_rf_pickup_01_pickup_01_rocket_rf_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-2,-1.02};
            seats[] = {1,2};
        };
    };
};



class lxRF_air_rf_Heli_Light_03_Heli_Light_03_Unarmed_RF_p3d : TRIPLES(ADDON,Nodes,Base)
{   canLoadWeapon = 0;
    class Nodes
    {
        class Node1
        {
            offset[] = {0,1.3,-0.91};
        };
    };
};

class lxRF_air_rf_Heli_Light_03_Heli_Light_03_RF_p3d : TRIPLES(ADDON,Nodes,Base)
{   canLoadWeapon = 0;
    class Nodes
    {
        class Node1
        {
            offset[] = {0,1.3,-0.91};
        };
    };
};

class lxRF_air_rf_heli_medium_ec_Heli_EC_02_RF_p3d : TRIPLES(ADDON,Nodes,Base)
{   canLoadWeapon = 0;
    class Nodes
    {
        class Node1
        {
            offset[] = {0,2.29,-1.61};
        };
    };
};

class lxRF_air_rf_heli_medium_ec_Heli_EC_01A_RF_p3d : TRIPLES(ADDON,Nodes,Base)
{   canLoadWeapon = 0;
    class Nodes
    {
        class Node1
        {
            offset[] = {0,3.4,-1.61};
        };
    };
};

class lxRF_air_rf_heli_medium_ec_Heli_EC_01A_civ_RF_p3d : TRIPLES(ADDON,Nodes,Base)
{   canLoadWeapon = 0;
    class Nodes
    {
        class Node1
        {
            offset[] = {-0.4,2.3,-1.61};
        };
        class Node2
        {
            offset[] = {-0.4,1.5,-1.61};
        };
    };
};

class lxRF_air_rf_heli_medium_ec_Heli_EC_01_civ_RF_p3d : TRIPLES(ADDON,Nodes,Base)
{   canLoadWeapon = 0;
    class Nodes
    {
        class Node1
        {
            offset[] = {-0.4,2.3,-1.61};
        };
        class Node2
        {
            offset[] = {-0.4,1.5,-1.61};
        };
    };
};

class lxRF_air_rf_heli_medium_ec_Heli_EC_04_rescue_RF_p3d : TRIPLES(ADDON,Nodes,Base)
{   canLoadWeapon = 0;
    class Nodes
    {
        class Node1
        {
            offset[] = {0.38,2.3,-1.61};
        };
        class Node2
        {
            offset[] = {0.38,1.5,-1.61};
        };
    };
};

class lxRF_air_rf_heli_medium_ec_Heli_EC_01_RF_p3d : TRIPLES(ADDON,Nodes,Base)
{   canLoadWeapon = 0;
    class Nodes
    {
        class Node1
        {
            offset[] = {0,3.4,-1.61};
        };
    };
};

class lxRF_air_rf_heli_medium_ec_Heli_EC_03_RF_p3d : TRIPLES(ADDON,Nodes,Base)
{   canLoadWeapon = 0;
    class Nodes
    {
        class Node1
        {
            offset[] = {0,3.4,-1.61};
        };
    };
};

class lxRF_air_rf_heli_medium_ec_Heli_EC_04_RF_p3d : TRIPLES(ADDON,Nodes,Base)
{   canLoadWeapon = 0;
    class Nodes
    {
        class Node1
        {
            offset[] = {0,3.4,-1.61};
        };
    };
};

class A3_Soft_F_EPC_Truck_03_Truck_03_fuel_F_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {-0.9,-2.8,0.94};
        };
    };
};

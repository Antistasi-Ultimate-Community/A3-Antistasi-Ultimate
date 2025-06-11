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

class lxRF_vehicles_rf_pickup_01_pickup_01_rcws_rf_p3d : lxRF_vehicles_rf_pickup_01_pickup_01_unarmed_rf_p3d {};

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
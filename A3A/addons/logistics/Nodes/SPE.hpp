class SPE_ST_OpelBlitz : TRIPLES(ADDON,Nodes,Base) //Removable Canopy on both Covered and Open variant.
{
        class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.8,-0.77};
            seats[] = {1,2,7,10};
        };
        class Node2
        {
            offset[] = {0,-1.6,-0.77};
            seats[] = {5,6,7};
        };
        class Node3
        {
            offset[] = {0,-2.4,-0.77};
            seats[] = {3,4,5,6};
        };
        class Node4
        {
            offset[] = {0,-3.2,-0.77};
            seats[] = {8,9};
        };
    };
};
class WW2_SPE_Assets_m_Vehicles_WheeledAPC_m_SPE_M16_Halftrack_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-1,-1};
            seats[] = {2,3};
        };
    };
};
class WW2_SPE_Assets_m_Vehicles_WheeledAPC_m_SPE_M3_Halftrack_Ambulance_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.9,-0.42};
            seats[] = {1,2};
        };
        class Node2
        {
            offset[] = {0,-1.7,-0.42};
        };
    };
};

class WW2_SPE_Assets_m_Vehicles_WheeledAPC_m_SPE_M3_Halftrack_Unarmed_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.5,-0.42};
            seats[] = {0,1,2,3};
        };
        class Node2
        {
            offset[] = {0,-1.3,-0.42};
            seats[] = {5,4};
        };
        class Node3
        {
            offset[] = {0,-2.1,-0.42};
            seats[] = {6,7,8,9};
        };
    };
};

class WW2_SPE_Assets_m_Vehicles_WheeledAPC_m_SPE_M3A1_Halftrack_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.65,-1.025};
            seats[] = {2,3};
        };
        class Node2
        {
            offset[] = {0,-1.45,-1.025};
            seats[] = {4,5,6,7};
        };
        class Node3
        {
            offset[] = {0,-2.25,-1.025};
            seats[] = {8,9};
        };
    };
};

class WW2_SPE_Assets_m_Vehicles_WheeledAPC_m_SPE_SdKfz_250_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-1.09,-1};
            seats[] = {1,2,3};
        };
    };
};

class SPE_OpelBlitz : SPE_ST_OpelBlitz {};
class SPE_OpelBlitz_Open : SPE_ST_OpelBlitz {};
class SPE_ST_OpelBlitz_Open : SPE_ST_OpelBlitz {};
class SPE_FFI_OpelBlitz : SPE_ST_OpelBlitz {};
class SPE_FFI_OpelBlitz_Open : SPE_ST_OpelBlitz {};

class SPE_US_M3_Halftrack_Unarmed : TRIPLES(ADDON,Nodes,Base)
{
        class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.4,-1.02};
            seats[] = {0,1,2,3,4,11};
        };
        class Node2
        {
            offset[] = {0,-1.2,-1.02};
            seats[] = {3,4,5,6}; //3,4 cause overlap
        };
        class Node3
        {
            offset[] = {0,-2,-1.02};
            seats[] = {7,8,9,10};
        };
    };
};

class WW2_SPE_Assets_m_Vehicles_Trucks_m_SPE_Opel_Blitz_Transport_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.7,-0.745};
            seats[] = {1,10,11};
        };
        class Node2
        {
            offset[] = {0,-1.5,-0.745};
            seats[] = {2,5,6,7};
        };
        class Node3
        {
            offset[] = {0,-2.3,-0.745};
            seats[] = {3,4};
        };
        class Node4
        {
            offset[] = {0,-3.1,-0.745};
            seats[] = {8,9};
        };
    };
};

class SPE_FR_M3_Halftrack_Unarmed : SPE_US_M3_Halftrack_Unarmed {};

class SPE_US_M3_Halftrack : TRIPLES(ADDON,Nodes,Base)
{
        class Nodes
    {
        class Node1
        {
            offset[] = {0,-1.1,-1.01};
            seats[] = {3,4,5,6};
        };
        class Node2
        {
            offset[] = {0,-1.9,-1.01};
            seats[] = {1,7,8,9};
        };
    };
};
class SPE_FR_M3_Halftrack : SPE_US_M3_Halftrack {};

class SPE_CCKW_353_Open : TRIPLES(ADDON,Nodes,Base)
{
        class Nodes
    {
        class Node1
        {
            offset[] = {0,0.35,-0.7};
			seats[] = {1,2,7,10};
        };
        class Node2
        {
            offset[] = {0,-0.45,-0.7};
			seats[] = {5,6};
        };
        class Node3
        {
            offset[] = {0,-1.25,-0.7};
			seats[] = {3,4};
        };
        class Node4
        {
            offset[] = {0,-2.05,-0.7};
			seats[] = {8,9};
        };
    };
};
class SPE_CCKW_353 : SPE_CCKW_353_Open {};
class SPE_CCKW_353_M2 : SPE_CCKW_353_Open {};

class SPE_US_G503_MB_Ambulance : TRIPLES(ADDON,Nodes,Base)
{
        class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.7,-0.37};
			seats[] = {1,2,3,4,5};
        };
        class Node2
        {
            offset[] = {0,-1.5,-0.37};
        };
    };
};

class SPE_US_G503_MB_Open : TRIPLES(ADDON,Nodes,Base)
{
        class Nodes
    {
        class Node1
        {
            offset[] = {0,-1.03,-0.775};
			seats[] = {1,2};
        };
    };
};
class SPE_US_G503_MB_Armoured : SPE_US_G503_MB_Open {};
class SPE_US_G503_MB : SPE_US_G503_MB_Open {};
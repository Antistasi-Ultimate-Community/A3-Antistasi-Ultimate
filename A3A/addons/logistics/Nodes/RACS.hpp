class PRACS_M250 : TRIPLES(ADDON,Nodes,Base)
{
    canLoadWeapon = 0;
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.9,1.6};
        };
        class Node2
        {
            offset[] = {0,-1.7,1.6};
        };
        class Node3
        {
            offset[] = {0,-2.5,1.6};
        };
        class Node4
        {
            offset[] = {0,-3.3,1.6};
        };
        class Node5
        {
            offset[] = {0,-4.1,1.6};
        };
    };
};

class PRACS_M250_flat_bed : PRACS_M250 {canLoadWeapon = 1;};
class PRACS_M250_open : PRACS_M250 {canLoadWeapon = 1;};

class PRACS_SLA_URAL : TRIPLES(ADDON,Nodes,Base)
{
    canLoadWeapon = 0;
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.4,-0.15};
        };
        class Node2
        {
            offset[] = {0,-1.2,-0.15};
        };
        class Node3
        {
            offset[] = {0,-2,-0.15};
        };
        class Node4
        {
            offset[] = {0,-2.8,-0.15};
        };
    };
};

class PRACS_SLA_Ural_flat_bed : PRACS_SLA_URAL {canLoadWeapon = 1;};

//class PRACS_SLA_Missile_MAZ_Ьн?вЭяџЧо_rtm : TRIPLES(ADDON,Nodes,Base)
class PRACS_SLA_MAZ_Transport : TRIPLES(ADDON,Nodes,Base)
{
    canLoadWeapon = 1;
    class Nodes
    {
        class Node1
        {
            offset[] = {0,1.1,1.71};
        };
        class Node2
        {
            offset[] = {0,0.3,1.71};
        };
        class Node3
        {
            offset[] = {0,-0.5,1.71};
        };
        class Node4
        {
            offset[] = {0,-1.3,1.71};
        };
        class Node5
        {
            offset[] = {0,-2.1,1.71};
        };
        class Node6
        {
            offset[] = {0,-2.9,1.71};
        };
        class Node7
        {
            offset[] = {0,-3.7,1.71};
        };
        class Node8
        {
            offset[] = {0,-4.5,1.71};
        };
        class Node9
        {
            offset[] = {0,-5.3,1.71};
        };
    };
};

//class PRACS_Truck_M450_кцм*њ_p3d : TRIPLES(ADDON,Nodes,Base)
class PRACS_M450 : TRIPLES(ADDON,Nodes,Base)
{
    canLoadWeapon = 1;
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.6,1.6};
        };
        class Node2
        {
            offset[] = {0,-1.4,1.6};
        };
        class Node3
        {
            offset[] = {0,-2.2,1.6};
        };
        class Node4
        {
            offset[] = {0,-3,1.6};
        };
        class Node5
        {
            offset[] = {0,-3.8,1.6};
        };
        class Node6
        {
            offset[] = {0,-4.6,1.6};
        };
        class Node7
        {
            offset[] = {0,-5.4,1.6};
        };
        class Node8
        {
            offset[] = {0,-6.2,1.6};
        };
        class Node9
        {
            offset[] = {0,-7,1.6};
        };
    };
};

//class pracs_tracked_M548_Цѐ*лм_wss : TRIPLES(ADDON,Nodes,Base)
class PRACS_m548 : TRIPLES(ADDON,Nodes,Base)
{
    canLoadWeapon = 1;
    class Nodes
    {
        class Node1
        {
            offset[] = {0.2,0.1,-0.88};
            seats[] = {3,7};
        };
        class Node2
        {
            offset[] = {0.2,-0.7,-0.88};
            seats[] = {4,5,6,8};
        };
        class Node3
        {
            offset[] = {0.2,-1.5,-0.88};
            seats[] = {2,9};
        };
    };
};
//class pracs_tracked_M548_?еСѝѐкд_rtm : pracs_tracked_M548_Цѐ*лм_wss {};
class PRACS_m548_open : PRACS_m548 {};

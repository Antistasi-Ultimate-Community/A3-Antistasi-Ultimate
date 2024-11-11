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

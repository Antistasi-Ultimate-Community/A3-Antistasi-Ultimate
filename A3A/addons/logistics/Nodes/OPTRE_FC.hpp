// Type-46 Spectre (AA)
class OPTRE_FC_Vehicles_Spectre_Spectre_AA_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {1.75749,0,-0.910003};
            seats[] = {1};
        };

        class Node2
        {
            offset[] = {-1.6845,0,-0.921002};
            seats[] = {0};
            canCouple = 0;
        };
    };
};
// Type-46 Spectre (AI)
class OPTRE_FC_Vehicles_Spectre_Spectre_AI_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {1.73829,0.437399,-0.873102};
            seats[] = {1};
        };
        class Node2
        {
            offset[] = {-1.713,0.366,-0.863};
            seats[] = {0};
            canCouple = 0;
        };
    };
};
// Type-46 Spectre (AT)
class OPTRE_FC_Vehicles_Spectre_Spectre_AT_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {1.7684,0.304,-0.893702};
            seats[] = {1};
        };

        class Node2
        {
            offset[] = {-1.736,0.3343,-0.870502};
            seats[] = {0};
            canCouple = 0;
        };
    };
};
// Type-46E Spectre
class OPTRE_FC_Vehicles_Spectre_Spectre_empty_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0.0718001,-0.609104,-0.3762};
        };
        class Node2
        {
            offset[] = {0.0707,-1.42269,-0.4237};
        };
        class Node3
        {
            offset[] = {0.0718001,-2.0977,-0.3762};
        };
    };
};
// Type-46R Recovery
class OPTRE_FC_Vehicles_Spectre_Spectre_Fuel_p3d : TRIPLES(ADDON,Nodes,Base)
{
    canLoadWeapon = 0;

    class Nodes
    {
        class Node1
        {
            offset[] = {0.0498,-2.99132,0.496};
        };
        class Node2
        {
            offset[] = {0.0561,-3.92023,0.433299};
        };
    };
};
// Type-46R Transport
class OPTRE_FC_Vehicles_Spectre_Spectre_Transport_p3d : TRIPLES(ADDON,Nodes,Base)
{
    canLoadWeapon = 0;

    class Nodes
    {
        class Node1
        {
            offset[] = {0.0261,-0.1363,0.0451};
            seats[] = {1,2};
        };
        class Node2
        {
            offset[] = {0.0269,-1.351,0.0377};
            seats[] = {3,4};
        };
        class Node3
        {
            offset[] = {0.0284,-2.40001,0.0451};
            seats[] = {4,5};
        };
        class Node4
        {
            offset[] = {0.0305,-3.58902,0.1426};
            seats[] = {6,7};
        };
    };
};
// Type-32 AA Ghost
class OPTRE_FC_Vehicles_Ghost_ghost_AA_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {-0.0653,-1.35191,0.3908};
        };
    };
};
// Type-32 Ghost
class OPTRE_FC_Vehicles_Ghost_ghost_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {-0.069,-1.19151,0.886};
        };
    };
};
// Type-32 Zealot Ghost
class OPTRE_FC_Vehicles_Ghost_ghost_zealot_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {-0.081,-1.385,0.701201};
            seats[] = {};
        };
    };
};
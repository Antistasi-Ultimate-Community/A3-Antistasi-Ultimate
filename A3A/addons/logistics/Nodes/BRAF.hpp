class BRAF_AM21_Covered : TRIPLES(ADDON,Nodes,Base)
{
	canLoadWeapon = 0;
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.6,-0.7};
			seats[] = {0,1,2,3};
        };
        class Node2
        {
            offset[] = {0,-1.4,-0.7};
			seats[] = {4,5};
        };
    };
};

class BRAF_AM21_Cargo : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.6,-0.7};
        };
        class Node2
        {
            offset[] = {0,-1.4,-0.7};
        };
    };
};

class BRAF_Worker_Covered : TRIPLES(ADDON,Nodes,Base)
{
	canLoadWeapon = 0;
    class Nodes
    {
        class Node1
        {
            offset[] = {0,0.05,1.64};
			seats[] = {2,3,4,5};
        };
        class Node2
        {
            offset[] = {0,-0.75,1.64};
			seats[] = {6,7};
        };
        class Node3
        {
            offset[] = {0,-1.55,1.64};
			seats[] = {8,9};
        };
        class Node4
        {
            offset[] = {0,-2.35,1.64};
			seats[] = {10,11};
        };
        class Node5
        {
            offset[] = {0,-3.15,1.64};
			seats[] = {12,13};
        };
    };
};

class BRAF_Worker_Cargo : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,0.05,1.64};
        };
        class Node2
        {
            offset[] = {0,-0.75,1.64};
        };
        class Node3
        {
            offset[] = {0,-1.55,1.64};
        };
        class Node4
        {
            offset[] = {0,-2.35,1.64};
        };
        class Node5
        {
            offset[] = {0,-3.15,1.64};
        };
    };
};

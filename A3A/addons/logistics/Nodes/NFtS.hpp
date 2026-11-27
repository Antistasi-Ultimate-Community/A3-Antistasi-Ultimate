class NORTH_FIN_FordV8 : TRIPLES(ADDON,Nodes,Base)
{
		canLoadWeapon = 0;
        class Nodes
    {
        class Node1
        {
            offset[] = {0,0.05,-0.705};
			seats[] = {1,3,12};
        };
        class Node2
        {
            offset[] = {0,-0.75,-0.705};
			seats[] = {5,8,10};
        };
        class Node3
        {
            offset[] = {0,-1.55,-0.705};
			seats[] = {4,6,7,9};
        };
        class Node4
        {
            offset[] = {0,-2.35,-0.705};
			seats[] = {2,11};
        };
    };
};

class NORTH_FIN_W_FordV8 : NORTH_FIN_FordV8 {};

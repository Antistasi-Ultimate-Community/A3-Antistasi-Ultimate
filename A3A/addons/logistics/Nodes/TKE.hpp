class TKE_Ext_APC_data_apc_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,0.4,-0.7};
        };
        class Node2
        {
            offset[] = {0,-0.4,-0.7};
        };
        class Node3
        {
            offset[] = {0,-1.2,-0.7};
        };
        class Node4
        {
            offset[] = {0,-2,-0.7};
        };
        class Node5
        {
            offset[] = {0,-2.8,-0.7};
        };
    };
};

class TKE_Kuiper_Engagements_TKE_Wheeled_data_tke_apc_ucn_unarmed_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {0,2.7,1};
        };
        class Node2
        {
            offset[] = {0,1.9,1};
        };
        class Node3
        {
            offset[] = {0,1.1,1};
        };
        class Node4
        {
            offset[] = {0,0.3,1};
        };
        class Node5
        {
            offset[] = {0,-0.5,1};
        };
        class Node6
        {
            offset[] = {0,-1.3,1};
        };
        class Node7
        {
            offset[] = {0,-2.1,1};
        };
        class Node8
        {
            offset[] = {0,-2.9,1};
        };
    };
};

class TKE_Kuiper_Engagements_TKE_Wheeled_data_tke_apc_ucn_armed_p3d : TKE_Kuiper_Engagements_TKE_Wheeled_data_tke_apc_ucn_unarmed_p3d {};
class TKE_Kuiper_Engagements_TKE_Wheeled_data_tke_apc_ucn_aa_p3d : TKE_Kuiper_Engagements_TKE_Wheeled_data_tke_apc_ucn_unarmed_p3d {};
class TKE_Kuiper_Engagements_TKE_Wheeled_data_tke_apc_ucn_arty_p3d : TKE_Kuiper_Engagements_TKE_Wheeled_data_tke_apc_ucn_unarmed_p3d {};

class QAV_MV35_qav_mv35_p3d : TRIPLES(ADDON,Nodes,Base)
{
    class Nodes
    {
        class Node1
        {
            offset[] = {-0.29,3.6,-3.32};
        };
        class Node2
        {
            offset[] = {-0.29,2.8,-3.32};
        };
        class Node3
        {
            offset[] = {-0.29,2,-3.32};
        };
        class Node4
        {
            offset[] = {-0.29,1.2,-3.32};
        };
        class Node5
        {
            offset[] = {-0.29,0.4,-3.32};
        };
        class Node6
        {
            offset[] = {-0.29,-0.4,-3.32};
        };
        class Node7
        {
            offset[] = {-0.29,-1.2,-3.32};
        };
        class Node8
        {
            offset[] = {-0.29,-2,-3.32};
        };
    };
};

class VVE_VTOL_03_unarmed_QAV : QAV_MV35_qav_mv35_p3d {};
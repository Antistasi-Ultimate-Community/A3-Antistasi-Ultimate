/* class OPTRE_falcon_base;
class OPTRE_falcon_base_unarmed : OPTRE_falcon_base 
{
    class Components;
};
class OPTRE_UNSC_falcon : OPTRE_falcon_base_unarmed
{
    class Components;
};
class OPTRE_UNSC_MH_144_Falcon : OPTRE_UNSC_falcon
{
    class Components 
    {
        TransportPylonsComponent;
    };
};
class OPTRE_INS_MH_144_Falcon : OPTRE_UNSC_MH_144_Falcon
{
    class Components 
    {
        TransportPylonsComponent;
    };
};
    

class a3a_OPTRE_UNSC_MH_144_Falcon_unarmed : OPTRE_UNSC_MH_144_Falcon
{
    class Components : Components
    {
        class TransportPylonsComponent : TransportPylonsComponent
        {
            UIPicture = "\optre_vehicles_air\falcon\FalconPylonPic.paa";
            {
                class Presets;
                class pylons : pylons
                {
                    class Nose : Nose
                    {
                        attachment = "";
                    };
                };
            };
        };
    };
};
class a3a_OPTRE_UNSC_MH_144_Falcon_searchlight : OPTRE_UNSC_MH_144_Falcon
{
    class Components : Components
    {
        class TransportPylonsComponent : TransportPylonsComponent
        {
            UIPicture = "\optre_vehicles_air\falcon\FalconPylonPic.paa";
            {
                class Presets;
                class pylons : pylons
                {
                    class Nose : Nose
                    {
                        attachment = "";
                    };
                };
            };
        };
    };
};
class a3a_OPTRE_INS_MH_144_Falcon_unarmed : OPTRE_INS_MH_144_Falcon //need to make more armed variants
{
    class Components : Components
    {
        class TransportPylonsComponent : TransportPylonsComponent
        {
            UIPicture = "\optre_vehicles_air\falcon\FalconPylonPic.paa";
            {
                class Presets;
                class pylons : pylons
                {
                    class Nose : Nose
                    {
                        attachment = "";
                    };
                };
            };
        };
    };
};
class a3a_OPTRE_INS_MH_144_Falcon_searchlight : OPTRE_INS_MH_144_Falcon //need to make more armed variants
{
    class Components : Components
    {
        class TransportPylonsComponent : TransportPylonsComponent
        {
            UIPicture = "\optre_vehicles_air\falcon\FalconPylonPic.paa";
            {
                class Presets;
                class pylons : pylons
                {
                    class Nose : Nose
                    {
                        attachment = "";
                    };
                };
            };
        };
    };
}; */
///also add civ falcon
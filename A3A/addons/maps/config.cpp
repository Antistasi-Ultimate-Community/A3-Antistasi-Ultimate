#include "script_component.hpp"

class CfgPatches 
{
    class ADDON 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {QDOUBLES(PREFIX,core)};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class A3A 
{ //global overwrite or inclussion of new navGrids or map info
    #include "mapInfo.hpp"
    #include "NavGrid.hpp"
};

class CfgMissions
{
    class MPMissions
    {
        class Antistasi_126map
        {
            briefingName = $STR_A3UE_maps_126map_mapname;
            directory = QCPATHTO(Antistasi_126map.126map);
        };
    };
};

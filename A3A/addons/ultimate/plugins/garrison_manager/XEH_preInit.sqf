#include "script_component.hpp"

ADDON = false;
#include "XEH_PREP.hpp"
ADDON = true;

[
    {
        INFO("adding advanced garrison management to map");
        [] spawn FUNC(onClientInitDone);
    }
] call FUNCMAIN(utilOnA3UClientInitDone);

GVAR(markerColors) = createHashMapFromArray(
    "true" configClasses(configFile >> "CfgMarkerColors") apply {
        private _color = getArray(_x >> "color") apply {
            if !(_x isEqualType "") then {
                _x;
            } else {
                [] call compile _x;
            };
        };

        [configName _x, _color];
    }
);

#define LB_ITEM(NAME,TYPE) [LLSTRING(TRIPLES(RscA3USPCMGarrisonManagerDialog_ListOverview_Column,NAME,Caption)), LLSTRING(TRIPLES(RscA3USPCMGarrisonManagerDialog_ListOverview_Column,NAME,Tooltip)), TYPE]
GVAR(lbColumns) = [
    LB_ITEM(Name,""),
    LB_ITEM(Current,""),
    LB_ITEM(Capacity,""),
    LB_ITEM(SquadLdr,"unitSL"),
    LB_ITEM(Medic,"unitMedic"),
    LB_ITEM(Marksman,"unitSniper"),
    LB_ITEM(Rifleman,"unitRifle"),
    LB_ITEM(Grenadier,"unitGL"),
    LB_ITEM(Autorifleman,"unitMG"),
    LB_ITEM(AT,"unitLAT"),
    LB_ITEM(AASpecialist,"unitAA"),
    LB_ITEM(ATSpecialist,"unitAT"),
    LB_ITEM(Crew,"unitCrew"),
    LB_ITEM(Sapper,"unitExp"),
    LB_ITEM(Engineer,"unitEng")
];
#undef LB_ITEM

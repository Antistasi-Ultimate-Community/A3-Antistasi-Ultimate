#define VEHICLE_CONDITION_AA (["seaports_2"] call A3U_fnc_hasRequirements || ["milbases_1"] call A3U_fnc_hasRequirements) && ["factories_2"] call A3U_fnc_hasRequirements
condition_AA = VEHICLE_CONDITION_AA;

#define VEHICLE_CONDITION_APC (["seaports_2"] call A3U_fnc_hasRequirements || ["milbases_1"] call A3U_fnc_hasRequirements) && ["factories_2"] call A3U_fnc_hasRequirements
condition_APC = VEHICLE_CONDITION_APC;

#define VEHICLE_CONDITION_ARMEDCAR ["resources_1"] call A3U_fnc_hasRequirements && ["factories_2"] call A3U_fnc_hasRequirements
condition_ARMEDCAR = VEHICLE_CONDITION_ARMEDCAR;

#define VEHICLE_CONDITION_ARTILLERY ["resources_3"] call A3U_fnc_hasRequirements && ["factories_3"] call A3U_fnc_hasRequirements
condition_ARTILLERY = VEHICLE_CONDITION_ARTILLERY;

#define VEHICLE_CONDITION_BOAT ["seaports_1"] call A3U_fnc_hasRequirements
condition_BOAT = VEHICLE_CONDITION_BOAT;

#define VEHICLE_CONDITION_HELI (["airports_1"] call A3U_fnc_hasRequirements || ["milbases_1"] call A3U_fnc_hasRequirements) && ["factories_2"] call A3U_fnc_hasRequirements
condition_HELI = VEHICLE_CONDITION_HELI;

#define VEHICLE_CONDITION_PLANE ["airports_1"] call A3U_fnc_hasRequirements && ["factories_3"] call A3U_fnc_hasRequirements
condition_PLANE = VEHICLE_CONDITION_PLANE;

#define VEHICLE_CONDITION_STATICAA ["warlevel_3"] call A3U_fnc_hasRequirements && ["factories_1"] call A3U_fnc_hasRequirements
condition_STATICAA = VEHICLE_CONDITION_STATICAA;

#define VEHICLE_CONDITION_STATICAT ["factories_1"] call A3U_fnc_hasRequirements
condition_STATICAT = VEHICLE_CONDITION_STATICAT;

#define VEHICLE_CONDITION_STATICMG ["factories_1"] call A3U_fnc_hasRequirements
condition_STATICMG = VEHICLE_CONDITION_STATICMG;

#define VEHICLE_CONDITION_STATICMORTAR ["warlevel_3"] call A3U_fnc_hasRequirements && ["factories_2"] call A3U_fnc_hasRequirements
condition_STATICMORTAR = VEHICLE_CONDITION_STATICMORTAR;

#define VEHICLE_CONDITION_TANK ["milbases_1"] call A3U_fnc_hasRequirements && ["factories_3"] call A3U_fnc_hasRequirements
condition_TANK = VEHICLE_CONDITION_TANK;

#define VEHICLE_CONDITION_UAV ["airports_1"] call A3U_fnc_hasRequirements && ["factories_1"] call A3U_fnc_hasRequirements
condition_UAV = VEHICLE_CONDITION_UAV;

#define VEHICLE_CONDITION_UNARMEDCAR ["resources_1"] call A3U_fnc_hasRequirements && ["factories_1"] call A3U_fnc_hasRequirements
condition_UNARMEDCAR = VEHICLE_CONDITION_UNARMEDCAR;


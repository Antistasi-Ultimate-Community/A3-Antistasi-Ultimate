from conditions import *

def match_category(category=[]):
    match category:
        case "AA":
            condition = f"{CONDITION_COMMON_OR_START}{CONDITION_SEAPORT_MEDIUM} {CONDITION_COMMON_OR} {CONDITION_MILBASE_LIGHT}{CONDITION_COMMON_OR_END} {CONDITION_COMMON_AND} {CONDITION_FACTORY_MEDIUM}"

        case "APC":
            condition = f"{CONDITION_COMMON_OR_START}{CONDITION_SEAPORT_MEDIUM} {CONDITION_COMMON_OR} {CONDITION_MILBASE_LIGHT}{CONDITION_COMMON_OR_END} {CONDITION_COMMON_AND} {CONDITION_FACTORY_MEDIUM}"

        case "UNARMEDCAR":
            condition = f"{CONDITION_RESOURCE_LIGHT} {CONDITION_COMMON_AND} {CONDITION_FACTORY_LIGHT}"

        case "ARMEDCAR":
            condition = f"{CONDITION_RESOURCE_LIGHT} {CONDITION_COMMON_AND} {CONDITION_FACTORY_MEDIUM}"

        case "ARTILLERY":
            condition = f"{CONDITION_RESOURCE_HEAVY} {CONDITION_COMMON_AND} {CONDITION_FACTORY_HEAVY}"

        case "BOAT":
            condition = f"{CONDITION_SEAPORT_LIGHT}"
            
        case "HELI":
            condition = f"{CONDITION_COMMON_OR_START}{CONDITION_AIRPORT_LIGHT} {CONDITION_COMMON_OR} {CONDITION_MILBASE_LIGHT}{CONDITION_COMMON_OR_END} {CONDITION_COMMON_AND} {CONDITION_FACTORY_MEDIUM}"

        case "PLANE":
            condition = f"{CONDITION_AIRPORT_LIGHT} {CONDITION_COMMON_AND} {CONDITION_FACTORY_HEAVY}"

        case "STATICAA":
            condition = f"{CONDITION_TIER_LIGHT} {CONDITION_COMMON_AND} {CONDITION_FACTORY_LIGHT}"

        case "STATICAT":
            condition = f"{CONDITION_FACTORY_LIGHT}"

        case "STATICMG":
            condition = f"{CONDITION_FACTORY_LIGHT}"

        case "STATICMORTAR":
            condition = f"{CONDITION_TIER_LIGHT} {CONDITION_COMMON_AND} {CONDITION_FACTORY_MEDIUM}"

        case "TANK":
            condition = f"{CONDITION_MILBASE_LIGHT} {CONDITION_COMMON_AND} {CONDITION_FACTORY_HEAVY}"

        case "UAV":
            condition = f"{CONDITION_AIRPORT_LIGHT} {CONDITION_COMMON_AND} {CONDITION_FACTORY_LIGHT}"
    
    return condition

def match_category_macro(category=[]):
    condition = f"[[VEHICLE_CONDITION_{category}]]" # needs to be a common variable
    
    return condition
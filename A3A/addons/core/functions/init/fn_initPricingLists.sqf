#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_initPricingLists

Description:
    Initializes the pricing lists for various vehicles and items in the game.

Parameters:

Optional:

Example:
    Called by fn_initVarServer.sqf

Returns:
    <HASHMAP> of vehicle class names to their respective prices

Environment:
    Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(initPricingLists),_this);

private _prices = createHashMap;

// Find validly scoped direct descendants of the Vehicle class in the Pricing config
QUOTE(getNumber(_x >> 'scope') > 0) configClasses(configFile >> "A3A" >> "Pricing" >> "Vehicle") apply {
    private _config = _x;
    private _moniker = getText(_x >> "moniker");

    Trace_2(QFUNCMAIN(initPricingLists),_config,_moniker);

    private _map = missionNamespace getVariable format["A3A_faction_%1", _moniker];

    if (isNil "_map") then {
        Warning_1("No such faction: '%1'",_moniker);
        continue;
    };

    // Iterate over each group's properties in the config and set the
    // corresponding server variables for the faction's vehicles
    configProperties[_config >> "Groups"] apply {
        private _group = configName _x;
        private _price = getNumber _x;

        Trace_2(QFUNCMAIN(initPricingLists),_group,_price);

        private _vehicles = _map get _group;
        if (isNil "_vehicles") then {
            Warning_2("No vehicles found for faction %1 group: '%2'",_moniker,_group);
            continue;
        };

        // Convert string entries to single item list
        if !(_vehicles isEqualType []) then {
            _vehicles = [_vehicles];
        };

        _vehicles apply {
            Trace_4(QFUNCMAIN(initPricingLists),_moniker,_group,_x,_price);
            _prices set[_x, _price];
        };
    };

    // Iterate over each group's individual vehicle configs and apply
    configProperties[_config >> "Vehicles"] apply {
        private _vehicle = configName _x;
        private _price = getNumber _x;

        Trace_3(QFUNCMAIN(initPricingLists),_vehicle,_price);

        _prices set[_vehicle, _price];
    };
};

// Now everything's collected. See if there are undefined vehicle classes
// and drop them.
_prices apply {
    if !(isClass(configFile >> "CfgVehicles" >> _x)) then {
        _prices deleteAt _x;
        Warning_2("Undefined class in vehicle/price combo: '%1'/'%2'", _x, _y);
    };
};

_prices;

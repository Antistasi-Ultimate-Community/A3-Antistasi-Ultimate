#include "script_component.hpp"

/**
 * Clients request jna_datalist at some point and expect it to be written back
 * to their missionNamespace under a specific UUID.
 */
[CBA_EVENT_SERVER_TRADER_RETURN_ARSENAL, {
    if !assert(params[
        ["_uuid", nil, [""]],
        ["_owner", nil, [0]]
    ]) exitWith {};

    Info_2("Sending arsenal data to client ID %1 as response UUID %2",_owner,_uuid);
    missionNamespace setVariable[_uuid, jna_datalist, _owner];
}] call FUNCMAIN(addEventHandler);

nil;

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_isRiverportMap

Description:
    Whether ports on water are to be considered riverports on this map

Parameters:

Optional:
    0: _mapName - name of the map <STRING> (default: worldName)

Example:
    (begin example)
    [] call A3A_fnc_isRiverportMap; // --> true/false
    ["enoch"] call A3A_fnc_isRiverportMap; // --> true
    (end example)

Returns:
    <BOOL> true if ports on water are to be considered riverports on this map, false otherwise

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
private _map = param[0, worldName, [""]];

getNumber(configFile >> "A3A" >> "mapInfo" >> _map >> "hasRiverPorts") != 0;


#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_isSeaportMap

Description:
    Whether ports on water are to be considered seaports on this map

Parameters:

Optional:
    0: _mapName - name of the map <STRING> (default: worldName)

Example:
    (begin example)
    [] call A3A_fnc_isSeaportMap; // --> true/false
    ["enoch"] call A3A_fnc_isSeaportMap; // --> false
    (end example)

Returns:
    <BOOL> true if ports on water are to be considered seaports on this map, false otherwise

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
!(call A3A_fnc_isRiverportMap);

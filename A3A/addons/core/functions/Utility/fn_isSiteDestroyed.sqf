#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_isSiteDestroyed

Description:
    Checks if a given site is destroyed.

Parameters:
    0: _marker - the site marker <STRING>

Optional:

Example:
    (begin example)
    ["miladmin_1"] call A3A_fnc_isSiteDestroyed;
    (end example)

Returns:
    <BOOL> indicating whether the site is destroyed

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
if !assert(params[
    ["_marker", nil, [""]]
]) exitWith { false };

if !(MARKER_EXISTS(_marker)) exitWith { false };

(_marker in destroyedSites) ||
{_marker in mrkAntennas && { markerType _marker == "A3AU_radiotower_dead_mrk" }} ||
{_marker in milAdministrationsX && {
    private _markerPos = markerPos _marker;
    private _destroyedAdmins = missionNamespace getVariable["A3A_destroyedMilAdministrations", []];
    _destroyedAdmins findIf { !isNull _x && {_markerPos distance2D _x < 30} } != -1;
}};

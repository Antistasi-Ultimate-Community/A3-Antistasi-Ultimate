// Repairs the destroyed factory or resource site.
// Parameter should be a factory or resource site marker that is present in destroyedSites array
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith { Error("Server-only function miscalled") };

params ["_economicSite"];

Debug_1("Entered A3A_fnc_rebuildEconomicAssets for %1", str _economicSite);

if !(_economicSite in destroyedSites) exitWith { Error("Attempted to rebuild invalid economic site") };

Info_2("Repairing %1 Site %2", 
    if (_economicSite in factories) then {"Factory"} else {"Resource"}, 
    str _economicSite);

// Remove from destroyed sites
destroyedSites = destroyedSites - [_economicSite];
publicVariable "destroyedSites";

// Repair factory or resource buildings at the site
private _economicSitePosition = getMarkerPos _economicSite;
private _economicBuildings = nearestObjects [_economicSitePosition, A3A_buildingWhitelist, 500, true];
{
    [_x] call A3A_fnc_repairRuinedBuilding;
} forEach _economicBuildings;

// Notify players about successful rebuild
private _nameX = [_economicSite] call A3A_fnc_localizar;
["TaskSucceeded", ["", format [localize "STR_notifiers_rebuild_assets_success", _nameX]]] remoteExec ["BIS_fnc_showNotification",[teamPlayer, civilian]];

Info_2("%1 Site %2 has been rebuilt.", 
    if (_economicSite in factories) then {"Factory"} else {"Resource"}, 
    str _economicSite);
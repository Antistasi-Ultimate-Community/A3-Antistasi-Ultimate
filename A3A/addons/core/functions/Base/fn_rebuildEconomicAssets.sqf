// Repairs the destroyed factory or resource site.
// Parameter should be a factory or resource site marker that is present in destroyedSites array
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith { Error("Server-only function miscalled") };

params ["_economicSite"];

Debug_1("Entered A3A_fnc_rebuildEconomicAssets for %1", _economicSite);

if !(_economicSite in destroyedSites) exitWith { Error("Attempted to rebuild invalid economic site") };

Info_1("Rebuilding %1", _economicSite);

// Remove from destroyed sites
destroyedSites = destroyedSites - [_economicSite];
publicVariable "destroyedSites";

// Repair factory or resource buildings at the site
private _repairTypes = ["Building", "House"]; // So depots and such in resources and factories can be rebuilt, could be too loose
private _economicSitePosition = getMarkerPos _economicSite;
private _economicBuildings = nearestObjects [_economicSitePosition, _repairTypes, 250];
{
    [_x] remoteExec ["A3A_fnc_repairRuinedBuilding", 2];
} forEach _economicBuildings;

// Notify players about successful rebuild
private _nameX = [_economicSite] call A3A_fnc_localizar;
["TaskSucceeded", ["", format [localize "STR_notifiers_rebuild_assets_success", _nameX]]] remoteExec ["BIS_fnc_showNotification",[teamPlayer, civilian]];

Info_1("%1 has been Rebuilt.", _economicSite);
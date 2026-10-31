/*
Maintainer: Socrates
    Activates rivals and setups their initial activities.


Return Value:
    <NIL>

Scope: Server
Environment: Any
Public: Yes
Dependencies:
    <ARRAY> inactivityStackRivals

Example:
[] remoteExecCall ["SCRT_fnc_rivals_activate", 2];
*/
#include "..\defines.inc"
FIX_LINE_NUMBERS()


#include "Constants.inc"

Info_1("Activateing %1",A3A_faction_riv get "name");

areRivalsDiscovered = true;
publicVariable "areRivalsDiscovered";

//initial handicap so players won't be immediately at max rivals activity (ahem, "inactivity")
[85, (100/baseRivalsDecay), true] call SCRT_fnc_rivals_reduceActivity;
[] spawn A3A_fnc_statistics;

Info_1("Setting up %1 hideout and cell locations in non-friendly cities and controls...",A3A_faction_riv get "name");

private _nearSites = outposts + milbases + airportsX + resourcesX + factories + citiesX;

private _locations = [];

private _radius = (sqrt 2 / 2 * worldSize) / (3 + 2);

private _frontLineCities = citiesX select {([_x] call A3A_fnc_isFrontline && {sidesX getVariable [_x,sideUnknown] != teamPlayer})}; ///look here on how fn_frontline works
private _cities = (citiesX select {!(_x in _frontLineCities) && {sidesX getVariable [_x,sideUnknown] != teamPlayer}}) call BIS_fnc_arrayShuffle;
private _controls = (controlsX select {
    private _control = _x;
    private _controlPos = getMarkerPos _control;
    !(isOnRoad _controlPos) && {((_controlPos) distance2D (getMarkerPos respawnTeamPlayer) >= 1000) && {_nearSites findIf {(getMarkerPos _x) distance2D _controlPos < _radius} != -1}}
}) call BIS_fnc_arrayShuffle;

Info_4("Overall count for possible %1 locations. Frontilne cities: %2, other cities: %3, controls: %4",A3A_faction_riv get "name",str (count _frontLineCities),str (count _cities),str (count _controls));

private _rivalsCityCount = round ((count _cities) * RIVALS_CITY_PART);
private _rivalsControlCount = round (count _controls * RIVALS_CONTROL_PART);

Info_3("%1 will use %2 non-frontline cities and %3 control points.",A3A_faction_riv get "name",str _rivalsCityCount,str _rivalsControlCount);

for "_i" from 1 to _rivalsCityCount do {
    private _cityArray = _cities select {!(_x in _locations)};
    if (_cityArray isEqualTo []) exitWith {
        Error("Location parsing error - no city outside of locations pool left.");
    };
    _locations pushBack (_cityArray#0);
};

for "_i" from 1 to _rivalsControlCount do {
    private _controlArray = _controls select {!(_x in _locations)};
    if (_controlArray isEqualTo []) exitWith {
        Error("Location parsing error - no control point outside of locations pool left.");
    };
    _locations pushBack (_controlArray#0);
};

Info_1("Total used locations after putting them into location pool: %1.",str _locations);

//all frontline cities will have Rivals Cell intially
_locations append _frontLineCities;

//[marker, isKnown]
rivalsLocationsMap = createHashMapFromArray (_locations apply {[_x, false]});
publicVariable "rivalsLocationsMap";

Info_1("Total used locations after adding frontline cities to location pool (final): %1.",str rivalsLocationsMap);

[ 
    format [(localize "STR_antistasi_rivals_hint_header"), A3A_faction_riv get "name"], 
    format [(localize "STR_antistasi_rivals_hint_text"), A3A_faction_riv get "name", ([] call SCRT_fnc_misc_getWorldName)]
] remoteExecCall ["A3A_fnc_customHint", [teamPlayer, civilian]];

Info_1("Total used locations after adding frontline cities to location pool (final): %1.",A3A_faction_riv get "name");

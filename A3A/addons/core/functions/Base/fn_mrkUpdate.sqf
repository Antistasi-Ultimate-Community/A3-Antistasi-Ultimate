#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_mrkUpdate

Description:
    Refreshes marker visuals and hover metadata so the strategic map shows the
    correct icon, color, text, and tooltip information for a location.

    Marker commands are kept local on purpose to avoid unnecessary network
    traffic and JIP queue growth, except the last one that broadcasts it globally.

Parameters:
    0: _markerName - Marker name to refresh <STRING>

Optional:
    None.

Example:
    (begin example)
    ["marker_1"] call A3A_fnc_mrkUpdate;
    (end example)

Returns:
    Nothing <NONE>

Environment:
    Client, Unscheduled, last setMarkerText broadcasts changes globally

Author:
    ?
    Maxx
---------------------------------------------------------------------------- */
FIX_LINE_NUMBERS()

params [["_markerName", "", [""]]];
if (_markerName == "") exitWith {};

private _originalName = _markerName;
private _dummyName = format ["Dum%1", _markerName];

if ((_markerName find "Dum") == 0) then {
    _originalName = _markerName select [3, (count _markerName) - 3];
};

private _managedMarkers = (
    milAdministrationsX + destroyedSites + watchpostsFIA + roadblocksFIA + 
    hmgpostsFIA + mrkAntennas + resourcesX + aapostsFIA + atpostsFIA + 
    airportsX + factories + outposts + seaports + milbases + citiesX
) - controlsX;

private _markerNameLower = toLowerANSI _originalName;
private _specialMarkers = ["synd_hq", "tradermarker", "rallypointmarker"];

if (!(_originalName in _managedMarkers) && {!(_markerNameLower in _specialMarkers)}) exitWith {};

private _visibleMarkerName = if (markerShape _dummyName != "") then { _dummyName } else { _originalName };
private _markerPosition = getMarkerPos _visibleMarkerName;

private _isSyndicateHeadquarters = (_markerNameLower == "synd_hq");
private _isTraderMarker = (_markerNameLower == "tradermarker");
private _isRallyPointMarker = (_markerNameLower == "rallypointmarker");
private _isMilAdmin = (_originalName in milAdministrationsX);

private _isDestroyed = false;

if (_originalName in destroyedSites && {
    _originalName in citiesX || _originalName in factories || 
    _originalName in resourcesX || _isMilAdmin
}) then { _isDestroyed = true; };

if (!_isDestroyed && _isMilAdmin) then {
    private _destroyedAdmins = missionNamespace getVariable ["A3A_destroyedMilAdministrations", []];
    if (_destroyedAdmins findIf { !isNull _x && {_markerPosition distance2D _x < 30} } != -1) then { _isDestroyed = true; };
};

if (!_isDestroyed && _originalName in mrkAntennas && {markerType _originalName == "A3AU_radiotower_dead_mrk"}) then { 
    _isDestroyed = true; 
};

private _markerSide = sidesX getVariable [_originalName, if (_isSyndicateHeadquarters || _isRallyPointMarker) then {teamPlayer} else {civilian}];

private _markerFaction = switch (_markerSide) do {
    case Occupants: { missionNamespace getVariable ["A3A_faction_occ", createHashMap] };
    case Invaders: { missionNamespace getVariable ["A3A_faction_inv", createHashMap] };
    case teamPlayer; case resistance: { missionNamespace getVariable ["A3A_faction_reb", createHashMap] };
    case civilian: { missionNamespace getVariable ["A3A_faction_civ", createHashMap] };
    default { createHashMap };
};
private _factionName = _markerFaction getOrDefault ["name", ""];

private _markerType = "";
private _markerColor = "";

if (_originalName in airportsX) then {
    _markerType = _markerFaction getOrDefault ["flagMarkerType", ""];
    _markerColor = "Default";
} else {
    if (_isDestroyed) then {
        _markerColor = "ColorBlack";
        if (_isMilAdmin) then { _markerType = "A3AU_Miladmin_dead_mrk"; }
        else { if (_originalName in citiesX) then { _markerType = "A3AU_city_mrk"; }; };
    } else {
        _markerColor = if (_markerSide == teamPlayer) then {colorTeamPlayer} else {[colorOccupants, colorInvaders] select (_markerSide == Invaders)};
        
        call {
            if (_isMilAdmin) exitWith { _markerType = "A3AU_miladmin_mrk"; };
            if (_originalName in citiesX) exitWith { _markerType = "A3AU_city_mrk"; };
            if (_originalName in milbases) exitWith { _markerType = "A3AU_milbase_mrk"; };
            if (_originalName in seaports) exitWith { _markerType = "A3AU_seaport_mrk"; };
            if (_originalName in watchpostsFIA) exitWith { _markerType = "A3AU_watchpost_mrk"; };
            if (_originalName in roadblocksFIA) exitWith { _markerType = "A3AU_roadblock_mrk"; };
            if (_originalName in aapostsFIA) exitWith { _markerType = "A3AU_antiair_mrk"; };
            if (_originalName in atpostsFIA) exitWith { _markerType = "A3AU_antitank_mrk"; };
            if (_originalName in hmgpostsFIA) exitWith { _markerType = "A3AU_hmg_mrk"; };
            if (_isSyndicateHeadquarters) exitWith { _markerType = "A3AU_RebalHQ_mrk"; };
        };
    };
};

if (_markerType != "") then {_visibleMarkerName setMarkerTypeLocal _markerType;};
if (_markerColor != "") then {_visibleMarkerName setMarkerColorLocal _markerColor;};

private _nearestCityName = "";
if (_isMilAdmin || _originalName in mrkAntennas || _originalName in resourcesX || _originalName in factories) then {
    private _nearestCityMarkerName = [citiesX, _markerPosition] call BIS_fnc_nearestPosition;
    _nearestCityName = markerText _nearestCityMarkerName;
    if (_nearestCityName == "") then { _nearestCityName = _nearestCityMarkerName; };
    
    private _categoryArray = call {
        if (_isMilAdmin) exitWith { milAdministrationsX };
        if (_originalName in mrkAntennas) exitWith { mrkAntennas };
        if (_originalName in resourcesX) exitWith { resourcesX };
        if (_originalName in factories) exitWith { factories };
        []
    };

    private _sharedCityCount = {
        ([citiesX, getMarkerPos _x] call BIS_fnc_nearestPosition) == _nearestCityMarkerName
    } count _categoryArray;

    if (_sharedCityCount > 1) then {
        private _cityPos = getMarkerPos _nearestCityMarkerName;
        private _dir = _cityPos getDir _markerPosition;
        
        private _dirSuffix = call {
            if (_dir >= 315 || _dir < 45) exitWith {localize "STR_A3AU_North" + " " };
            if (_dir >= 45 && _dir < 135) exitWith {localize "STR_A3AU_East" + " " };
            if (_dir >= 135 && _dir < 225) exitWith {localize "STR_A3AU_South" + " " };
            localize "STR_A3AU_West" + " "
        };
        
        _nearestCityName = _dirSuffix + _nearestCityName;
    };
};

private _getLocName = {
    params ["_array", "_locKey"];
    private _idx = _array find _originalName;
    if (_idx < 0) exitWith {""};
    private _names = (localize _locKey) splitString "|";
    if (_idx < count _names) then { _names select _idx } else { "" };
};

private _markerTitle = call {
    if (_isSyndicateHeadquarters) exitWith { format [localize "STR_A3U_HOVER_RESISTANCE_HQ", _factionName] };
    if (_isTraderMarker) exitWith { localize "STR_A3U_HOVER_BLACK_MARKET" };
    if (_originalName in citiesX) exitWith { markerText _originalName };
    
    if (_isRallyPointMarker) exitWith { format [localize "STR_marker_RP", str RETDEF(rallyPointSpawnCount,0)] };
    
    if (_isMilAdmin) exitWith { format [localize "STR_milAdministration", _nearestCityName] };
    if (_originalName in mrkAntennas) exitWith { format [localize "STR_radiotower", _nearestCityName] };
    if (_originalName in resourcesX) exitWith { format [localize "STR_resources", _nearestCityName] };
    if (_originalName in factories) exitWith { format [localize "STR_factory", _nearestCityName] };

    if (_originalName in airportsX) exitWith { format [localize "STR_airbase", [airportsX, "STR_A3AU_airfieldNames"] call _getLocName] };
    if (_originalName in outposts) exitWith { format [localize "STR_outpost", [outposts, "STR_A3AU_outpostNames"] call _getLocName] };
    if (_originalName in milbases) exitWith { format [localize "STR_milbase", [milbases, "STR_A3AU_milbaseNames"] call _getLocName] };
    
    if (_originalName in seaports) exitWith {
        private _portName = [seaports, "STR_A3AU_seaportNames"] call _getLocName;
        format [localize (if (toLowerANSI worldName in ["enoch", "vn_khe_sanh", "esseker"]) then {"STR_port_river"} else {"STR_port_sea"}), _portName]
    };

    if (_originalName in watchpostsFIA) exitWith { format [localize "STR_marker_watchpost", _factionName] };
    if (_originalName in roadblocksFIA) exitWith { format [localize "STR_marker_roadblock", _factionName] };
    if (_originalName in aapostsFIA) exitWith { format [localize "STR_marker_aa_empl", _factionName] };
    if (_originalName in atpostsFIA) exitWith { format [localize "STR_marker_at_empl", _factionName] };
    if (_originalName in hmgpostsFIA) exitWith { format [localize "STR_marker_hmg_empl", _factionName] };

    ""
};

if (_isDestroyed) then { _markerTitle = format ["%1 %2", _markerTitle, localize "STR_destroyed"]; };
private _markerLabelOnly = _markerTitle;

private _civilianCurrencySymbol = (missionNamespace getVariable ["A3A_faction_civ", createHashMap]) getOrDefault ["currencySymbol", ""];

private _additionalDescription = call {
    if (_isDestroyed) exitWith { localize "STR_site_destroyed" };

    if (_isMilAdmin) exitWith { localize "STR_A3U_HOVER_MILADMIN_DESC" };
    if (_isSyndicateHeadquarters) exitWith { localize "STR_A3U_HOVER_RESISTANCE_HQ_DESC" };
    if (_isTraderMarker) exitWith { localize "STR_A3U_HOVER_BLACK_MARKET_DESC" };
    if (_isRallyPointMarker) exitWith { localize "STR_A3U_HOVER_RALLY_DESC" };
    
    if (_originalName in mrkAntennas) exitWith {
        private _mainMarkers = (resourcesX + airportsX + factories + outposts + seaports + milbases) - controlsX;
        private _nearestTerritory = [_mainMarkers, _markerPosition] call BIS_fnc_nearestPosition;
        if (sidesX getVariable [_nearestTerritory, sideUnknown] == teamPlayer) then { localize "STR_A3U_HOVER_RADIOTOWER_REBAL_DESC" } 
        else { localize "STR_A3U_HOVER_RADIOTOWER_DESC" };
    };

    if (_originalName in watchpostsFIA) exitWith { localize "STR_A3U_HOVER_WATCHPOST_DESC" };
    if (_originalName in roadblocksFIA) exitWith { localize "STR_A3U_HOVER_ROADBLOCK_DESC" };
    if (_originalName in aapostsFIA) exitWith { localize "STR_A3U_HOVER_ANTIAIR_DESC" };
    if (_originalName in atpostsFIA) exitWith { localize "STR_A3U_HOVER_ANTITANK_DESC" };
    if (_originalName in hmgpostsFIA) exitWith { localize "STR_A3U_HOVER_HMG_DESC" };
    
    if (_originalName in outposts) exitWith { if (_markerSide == teamPlayer) then {_markerTitle} else {localize "STR_A3U_HOVER_OUTPOST_DESC"} };
    if (_originalName in resourcesX) exitWith { format [localize "STR_A3U_HOVER_RESOURCE_SITE", _civilianCurrencySymbol] };
    if (_originalName in factories) exitWith { localize "STR_A3U_HOVER_FACTORY_SITE" };
    if (_originalName in seaports) exitWith { localize "STR_A3U_HOVER_SEAPORT_DESC" };
    if (_originalName in milbases) exitWith { localize "STR_A3U_HOVER_MILBASE_DESC" };
    if (_originalName in airportsX) exitWith { localize "STR_A3U_HOVER_AIRPORT_CAPTURED" };
    
    if (_originalName in citiesX) exitWith {
        private _cityData = server getVariable [_originalName, [0, 0, 0, 0]];
        _cityData params ["_numberOfCivilians", "", "_governmentSupport", "_rebelSupport"];
        
        _governmentSupport = _governmentSupport max 0 min 100;
        _rebelSupport = _rebelSupport max 0 min 100;
        
        format [
            localize "STR_A3U_HOVER_CITY_SUPPORT",
            _numberOfCivilians,
            round _rebelSupport,
            round (_numberOfCivilians * (_rebelSupport / 100)),
            round _governmentSupport,
            round (_numberOfCivilians * (_governmentSupport / 100))
        ]
    };
    ""
};

if (_markerSide == teamPlayer && !(_originalName in milAdministrationsX)) then {
    private _numberOfTroops = count (garrison getVariable [_originalName, []]);
    private _garrisonLimit = [_originalName] call A3A_fnc_getGarrisonLimit;
    private _limitStr = if (_garrisonLimit != -1) then {format ["/%1", _garrisonLimit]} else {""};
    
    _additionalDescription = _additionalDescription + format [localize "STR_A3U_HOVER_GARRISON", _numberOfTroops, _limitStr];
};

if (_additionalDescription != "") then {
    _markerTitle = format ["%1<br/><t size='0.85' color='#CFCFCF'>%2</t>", _markerTitle, _additionalDescription];
};

private _flagMarkerType = _markerFaction getOrDefault ["flagMarkerType", ""];
private _hoverMetaMap = missionNamespace getVariable ["A3U_mrkHoverMetaMap", createHashMap];
private _hoverMarkers = missionNamespace getVariable ["A3U_hoverMarkers", []];

if ([_originalName] call A3U_fnc_isMarkerHidden) then {
    _hoverMetaMap deleteAt _dummyName;
    _hoverMetaMap deleteAt _originalName;
    _hoverMarkers = _hoverMarkers - [_dummyName, _originalName];
} else {
    _hoverMetaMap set [_dummyName, [_markerTitle, _flagMarkerType]];
    _hoverMetaMap set [_originalName, [_markerTitle, _flagMarkerType]];
    _hoverMarkers pushBackUnique _dummyName;
    _hoverMarkers pushBackUnique _originalName;
};

private _specialDefinitions = [
    ["Synd_HQ", teamPlayer, "STR_A3U_HOVER_RESISTANCE_HQ", "STR_A3U_HOVER_RESISTANCE_HQ_DESC", ""],
    ["synd_hq", teamPlayer, "STR_A3U_HOVER_RESISTANCE_HQ", "STR_A3U_HOVER_RESISTANCE_HQ_DESC", ""],
    ["TraderMarker", civilian, "STR_A3U_HOVER_BLACK_MARKET", "STR_A3U_HOVER_BLACK_MARKET_DESC", "A3AU_dealer_flag"],
    ["tradermarker", civilian, "STR_A3U_HOVER_BLACK_MARKET", "STR_A3U_HOVER_BLACK_MARKET_DESC", "A3AU_dealer_flag"],
    ["RallyPointMarker", teamPlayer, "STR_marker_RP", "STR_A3U_HOVER_RALLY_DESC", ""],
    ["rallypointmarker", teamPlayer, "STR_marker_RP", "STR_A3U_HOVER_RALLY_DESC", ""]
];

{
    _x params ["_specName", "_specSide", "_specTitleLoc", "_specDescLoc", "_specFlagOverride"];
    if !(_specName in allMapMarkers) then { continue };
    
    private _specFaction = switch (_specSide) do {
        case Occupants: { missionNamespace getVariable ["A3A_faction_occ", createHashMap] };
        case Invaders: { missionNamespace getVariable ["A3A_faction_inv", createHashMap] };
        case teamPlayer; case resistance: { missionNamespace getVariable ["A3A_faction_reb", createHashMap] };
        case civilian: { missionNamespace getVariable ["A3A_faction_civ", createHashMap] };
        default { createHashMap };
    };
    
    private _specFlag = if (_specFlagOverride != "") then {_specFlagOverride} else {_specFaction getOrDefault ["flagMarkerType", ""]};
    private _specTitle = if (_specTitleLoc == "STR_marker_RP") then {
        format [localize _specTitleLoc, if (isNil "rallyPointSpawnCount") then {"0"} else {str rallyPointSpawnCount}]
    } else {
        format [localize _specTitleLoc, _specFaction getOrDefault ["name", ""]]
    };
    
    private _specDesc = localize _specDescLoc;
    private _specText = if (_specDesc != "") then { format ["%1<br/><t size='0.85' color='#CFCFCF'>%2</t>", _specTitle, _specDesc] } else { _specTitle };
    
    _hoverMetaMap set [_specName, [_specText, _specFlag]];
    _hoverMarkers pushBackUnique _specName;
} forEach _specialDefinitions;

missionNamespace setVariable ["A3U_mrkHoverMetaMap", _hoverMetaMap];
[_hoverMarkers] remoteExecCall ["A3U_fnc_handleMrkUpdate", 2]; 

if (A3AU_setting_alwaysShowMarkerName || {_originalName in (airportsX + milbases)}) then {
    _visibleMarkerName setMarkerText _markerLabelOnly;
} else {
    _visibleMarkerName setMarkerText "";
};
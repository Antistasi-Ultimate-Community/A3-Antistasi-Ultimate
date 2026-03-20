#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_mrkUpdate

Description:
    Refreshes marker visuals and hover metadata so the strategic map shows the
    correct icon, color, text, and tooltip information for a location.

    Marker commands are kept local on purpose to avoid unnecessary network
    traffic and JIP queue growth. This function should therefore run on each
    client that needs the updated marker state.

Parameters:
    0: _markerName - Marker name to refresh <STRING>

Optional:
    None.

Example:
    ["marker_1"] call A3A_fnc_mrkUpdate;

Returns:
    Nothing <NONE>

Environment:
    Client, Unscheduled

Author:
    ?
    Maxx
---------------------------------------------------------------------------- */
FIX_LINE_NUMBERS()

// Existing A3U_* missionNamespace keys are kept for compatibility with the
// current hover/browser/context-menu integration and existing runtime state.

if !assert(params [
    ["_markerName", nil, [""]]
]) exitWith {};

private _managedMarkers = (
    milAdministrationsX
    + destroyedSites
    + watchpostsFIA
    + roadblocksFIA
    + hmgpostsFIA
    + resourcesX
    + aapostsFIA
    + atpostsFIA
    + airportsX
    + factories
    + outposts
    + seaports
    + milbases
    + citiesX
) - controlsX;

private _markerNameLower = toLowerANSI _markerName;
private _specialMarkers = ["synd_hq", "tradermarker", "rallypointmarker"];

private _isManagedMarker = (_markerName in _managedMarkers)|| {_markerNameLower in _specialMarkers};

if (!_isManagedMarker) exitWith {
    Warning_1("Marker %1 is not in the allowed list. (Skipping)", _markerName);
};

private _dummyMarkerName = format ["Dum%1", _markerName];
private _hasDummyMarker = markerShape _dummyMarkerName isNotEqualTo "";
private _visibleMarkerName = [_markerName, _dummyMarkerName] select _hasDummyMarker;

private _getOriginalMarkerName = {
    if !assert(params [["_name", nil, [""]]]) exitWith {""};

    if ((_name find "Dum") == 0) exitWith {[_name, 3] call CBA_fnc_substr;};

    _name;
};

private _ensureHashMap = {
    param [0, createHashMap, [createHashMap]];
};

private _getHashMapValue = {
    params ["_hashMap", "_key", "_defaultValue"];

    if !(_hashMap isEqualType createHashMap) exitWith {_defaultValue};

    _hashMap getOrDefault [_key, _defaultValue]
};

private _findNearestMarkerName = {
    params ["_markerNames", "_position"];

    if (_markerNames isEqualTo []) exitWith {""};

    private _nearestMarker = [_markerNames, _position] call BIS_fnc_nearestPosition;

    if !assert(_nearestMarker isEqualType "") exitWith {""};

    _nearestMarker;
};

private _occupantFaction = [missionNamespace getVariable ["A3A_faction_occ", createHashMap]] call _ensureHashMap;
private _invaderFaction = [missionNamespace getVariable ["A3A_faction_inv", createHashMap]] call _ensureHashMap;
private _rebelFaction = [missionNamespace getVariable ["A3A_faction_reb", createHashMap]] call _ensureHashMap;
private _civilianFaction = [missionNamespace getVariable ["A3A_faction_civ", createHashMap]] call _ensureHashMap;

private _getFactionBySide = {
    params ["_markerSide"];

    switch (_markerSide) do {
        case Occupants: {_occupantFaction};
        case Invaders: {_invaderFaction};
        case teamPlayer;
        case resistance: {_rebelFaction};
        case civilian: {_civilianFaction};
        default {createHashMap};
    };
};

private _isMarkerHidden = {
    params ["_name"];

    if !(_name isEqualType "") exitWith {false};

    private _originalMarkerName = [_name] call _getOriginalMarkerName;
    private _revealedZones = if (isNil "revealedZones") then {[]} else {revealedZones};
    private _immuneMarkers = if (isNil "markersImmune") then {[]} else {markersImmune};
    private _hideEnemyMarkers = if (isNil "hideEnemyMarkers") then {false} else {hideEnemyMarkers};

    if (_originalMarkerName == "") exitWith {false};
    if (!_hideEnemyMarkers) exitWith {false};
    if (_originalMarkerName in _revealedZones) exitWith {false};
    if (_originalMarkerName in _immuneMarkers) exitWith {false};
    if ("cont" in _originalMarkerName) exitWith {false};
    if (_originalMarkerName in citiesX|| {_originalMarkerName in airportsX}) exitWith {false};

    private _markerSide = sidesX getVariable [_originalMarkerName, sideUnknown];
    _markerSide isNotEqualTo sideUnknown
        && {_markerSide isNotEqualTo resistance}
};

private _isSyndicateHeadquarters = _markerNameLower == "synd_hq";
private _isTraderMarker = _markerNameLower == "tradermarker";
private _isRallyPointMarker = _markerNameLower == "rallypointmarker";
private _isMilitaryAdministration = _markerName in milAdministrationsX;
private _markerPosition = getMarkerPos _visibleMarkerName;

private _markerSide = sidesX getVariable [
    _markerName,
    if (_isSyndicateHeadquarters || {_isRallyPointMarker}) then {teamPlayer} else {civilian}];

private _markerFaction = [_markerSide] call _getFactionBySide;
private _factionName = [_markerFaction, "name", ""] call _getHashMapValue;

private _destroyedMilitaryAdministrations = RETDEF(A3A_destroyedMilAdministrations,[]);
private _isMilitaryAdministrationDestroyed = _isMilitaryAdministration && {
    _destroyedMilitaryAdministrations findIf {
        !isNull _x && {_markerPosition distance2D _x < 30}
    } != -1
};

private _markerType = "";
private _markerColor = "";

if (_markerName in airportsX) then {
    _markerType = if (_markerSide == teamPlayer) then {
        [_rebelFaction, "flagMarkerType", ""] call _getHashMapValue
    } else {
        if (_markerSide == Invaders) then {
            [_invaderFaction, "flagMarkerType", ""] call _getHashMapValue
        } else {
            [_occupantFaction, "flagMarkerType", ""] call _getHashMapValue
        };
    };
} else {
    if (_isMilitaryAdministration && {_isMilitaryAdministrationDestroyed}) then {
        _markerType = "A3AU_Miladmin_dead_mrk";
        _markerColor = "ColorGrey";
    } else {
        if (_isMilitaryAdministration) then {_markerType = "A3AU_miladmin_mrk";};
        if (_markerName in citiesX) then {_markerType = "A3AU_city_mrk";};
        if (_markerSide == teamPlayer) then {
            if (_isSyndicateHeadquarters) then {_markerType = "A3AU_RebalHQ_mrk";};
            if (_markerName in milbases) then {_markerType = "A3AU_milbase_mrk";};
            if (_markerName in seaports) then {_markerType = "A3AU_seaport_mrk";};
            if (_markerName in watchpostsFIA) then {_markerType = "A3AU_watchpost_mrk";};
            if (_markerName in roadblocksFIA) then {_markerType = "A3AU_roadblock_mrk";};
            if (_markerName in aapostsFIA) then {_markerType = "A3AU_antiair_mrk";};
            if (_markerName in atpostsFIA) then {_markerType = "A3AU_antitank_mrk";};
            if (_markerName in hmgpostsFIA) then {_markerType = "A3AU_hmg_mrk";};

            _markerColor = colorTeamPlayer;
        } else {
            if (_markerName in milbases) then {_markerType = "A3AU_milbase_mrk";};
            if (_markerName in seaports) then {
                _markerType = "A3AU_seaport_mrk";
            };
            if (_markerName in destroyedSites && {_markerName in citiesX}) then {
                _markerColor = "ColorBlack";
            } else {
                _markerColor = [colorOccupants,colorInvaders] select (_markerSide == Invaders);
            };
        };
    };
};

if (_markerType != "") then {_visibleMarkerName setMarkerTypeLocal _markerType;};
if (_markerColor != "") then {_visibleMarkerName setMarkerColorLocal _markerColor;};

private _markerTitle = call {
    if (_isSyndicateHeadquarters) exitWith {format [localize "STR_A3U_HOVER_RESISTANCE_HQ", _factionName]};
    if (_isTraderMarker) exitWith {localize "STR_A3U_HOVER_BLACK_MARKET"};
    if (_markerName in citiesX) exitWith {markerText _markerName};

    if (_isRallyPointMarker) exitWith {
        private _rallyCount = if (isNil "rallyPointSpawnCount") then {
            "0"
        } else {
            str rallyPointSpawnCount
        };

        format [localize "STR_marker_RP", _rallyCount]
    };

    if (_isMilitaryAdministration) exitWith {
        private _nearestCityMarkerName =
            [citiesX, _markerPosition] call _findNearestMarkerName;
        format [localize "STR_milAdministration", _nearestCityMarkerName]
    };

    if (_markerName in airportsX) exitWith {
        private _airfieldNames =
            (localize "STR_A3AU_airfieldNames") splitString "|";
        private _markerIndex = airportsX find _markerName;
        private _airfieldName = if (
            _markerIndex >= 0
            && {_markerIndex < count _airfieldNames}
        ) then {
            _airfieldNames select _markerIndex
        } else {
            ""
        };

        format [localize "STR_airbase", _factionName, _airfieldName]
    };

    if (_markerName in outposts) exitWith {
        private _outpostNames =
            (localize "STR_A3AU_outpostNames") splitString "|";
        private _markerIndex = outposts find _markerName;
        private _outpostName = if (
            _markerIndex >= 0
            && {_markerIndex < count _outpostNames}
        ) then {
            _outpostNames select _markerIndex
        } else {
            ""
        };

        format [localize "STR_outpost", _outpostName]
    };

    if (_markerName in resourcesX) exitWith {
        private _nearestCityMarkerName =
            [citiesX, _markerPosition] call _findNearestMarkerName;
        format [localize "STR_resources", _nearestCityMarkerName]
    };

    if (_markerName in factories) exitWith {
        private _nearestCityMarkerName =
            [citiesX, _markerPosition] call _findNearestMarkerName;
        format [localize "STR_factory", _nearestCityMarkerName]
    };

    if (_markerName in milbases) exitWith {
        private _militaryBaseNames =
            (localize "STR_A3AU_milbaseNames") splitString "|";
        private _markerIndex = milbases find _markerName;
        private _militaryBaseName = if (
            _markerIndex >= 0
            && {_markerIndex < count _militaryBaseNames}
        ) then {
            _militaryBaseNames select _markerIndex
        } else {
            ""
        };

        format [localize "STR_milbase", _militaryBaseName]
    };

    if (_markerName in seaports) exitWith {
        private _seaportNames =
            (localize "STR_A3AU_seaportNames") splitString "|";
        private _markerIndex = seaports find _markerName;
        private _seaportName = if (
            _markerIndex >= 0
            && {_markerIndex < count _seaportNames}
        ) then {
            _seaportNames select _markerIndex
        } else {
            ""
        };

        if (toLowerANSI worldName in ["enoch", "vn_khe_sanh", "esseker"]) then {
            format [localize "STR_port_river", _seaportName]
        } else {
            format [localize "STR_port_sea", _seaportName]
        };
    };

    if (_markerName in watchpostsFIA) exitWith {format [localize "STR_marker_watchpost", _factionName]};
    if (_markerName in roadblocksFIA) exitWith {format [localize "STR_marker_roadblock", _factionName]};
    if (_markerName in aapostsFIA) exitWith {format [localize "STR_marker_aa_empl", _factionName]};
    if (_markerName in atpostsFIA) exitWith {format [localize "STR_marker_at_empl", _factionName]};
    if (_markerName in hmgpostsFIA) exitWith {format [localize "STR_marker_hmg_empl", _factionName]};

    ""
};

private _markerLabelOnly = _markerTitle;
private _civilianCurrencySymbol =
    [_civilianFaction, "currencySymbol", ""] call _getHashMapValue;

private _additionalDescription = call {
    if (_isMilitaryAdministration) exitWith {
        if (_isMilitaryAdministrationDestroyed) then {localize "STR_A3U_HOVER_DESTROYED_SITE"} else {localize "STR_A3U_HOVER_MILADMIN_DESC"};
    };
    if (_isSyndicateHeadquarters) exitWith {localize "STR_A3U_HOVER_RESISTANCE_HQ_DESC"};
    if (_isTraderMarker) exitWith {localize "STR_A3U_HOVER_BLACK_MARKET_DESC"};
    if (_isRallyPointMarker) exitWith {localize "STR_A3U_HOVER_RALLY_DESC"};
    if (_markerName in watchpostsFIA) exitWith {localize "STR_A3U_HOVER_WATCHPOST_DESC"};
    if (_markerName in roadblocksFIA) exitWith {localize "STR_A3U_HOVER_ROADBLOCK_DESC"};
    if (_markerName in aapostsFIA) exitWith {localize "STR_A3U_HOVER_ANTIAIR_DESC"};
    if (_markerName in atpostsFIA) exitWith {localize "STR_A3U_HOVER_ANTITANK_DESC"};
    if (_markerName in hmgpostsFIA) exitWith {localize "STR_A3U_HOVER_HMG_DESC"};
    if (_markerName in outposts) exitWith {
        if (_markerSide == teamPlayer) then { _markerTitle} else {localize "STR_A3U_HOVER_OUTPOST_DESC"};
    };
    if (_markerName in resourcesX) exitWith {format [localize "STR_A3U_HOVER_RESOURCE_SITE",_civilianCurrencySymbol]};
    if (_markerName in factories) exitWith {localize "STR_A3U_HOVER_FACTORY_SITE"};
    if (_markerName in seaports) exitWith {localize "STR_A3U_HOVER_SEAPORT_DESC"};
    if (_markerName in milbases) exitWith {localize "STR_A3U_HOVER_MILBASE_DESC"};
    if (_markerName in airportsX) exitWith {localize "STR_A3U_HOVER_AIRPORT_CAPTURED"};
    if (_markerName in citiesX) exitWith {
        if (_markerName in destroyedSites) exitWith {localize "STR_A3U_HOVER_DESTROYED_SITE"};

        private _cityData = server getVariable [_markerName, [0, 0, 0, 0]];
        _cityData params ["_numberOfCivilians", "_numberOfVehicles", "_governmentSupport", "_rebelSupport"];

        _governmentSupport = _governmentSupport max 0 min 100;
        _rebelSupport = _rebelSupport max 0 min 100;

        private _rebelPopulation = _numberOfCivilians * (_rebelSupport / 100);
        private _governmentPopulation = _numberOfCivilians * (_governmentSupport / 100);

        format [
            localize "STR_A3U_HOVER_CITY_SUPPORT",
            _numberOfCivilians,
            round _rebelSupport,
            round _rebelPopulation,
            round _governmentSupport,
            round _governmentPopulation
        ]
    };

    ""
};

if (_markerSide == teamPlayer) then {
    private _numberOfTroops = count (garrison getVariable [_markerName, []]);
    private _garrisonLimit = [_markerName] call A3A_fnc_getGarrisonLimit;

    private _garrisonDescription = format [localize "STR_A3U_HOVER_GARRISON", _numberOfTroops,
        if (_garrisonLimit != -1) then {format ["/%1", _garrisonLimit]} else {""}
    ];

    _additionalDescription = _additionalDescription + _garrisonDescription;
};

if (_additionalDescription != "") then {
    _markerTitle = format ["%1<br/><t size='0.85' color='#CFCFCF'>%2</t>", _markerTitle, _additionalDescription];
};

private _flagMarkerType = [_markerFaction, "flagMarkerType", ""] call _getHashMapValue;

private _hoverMetaMap = missionNamespace getVariable ["A3U_mrkHoverMetaMap",createHashMap];
private _hoverMarkers = missionNamespace getVariable ["A3U_hoverMarkers", []];

if ([_markerName] call _isMarkerHidden) then {
    _hoverMetaMap deleteAt _dummyMarkerName;
    _hoverMetaMap deleteAt _markerName;
    _hoverMarkers = _hoverMarkers - [_dummyMarkerName, _markerName];
} else {
    _hoverMetaMap set [_dummyMarkerName, [_markerTitle, _flagMarkerType]];
    _hoverMetaMap set [_markerName, [_markerTitle, _flagMarkerType]];
    _hoverMarkers pushBackUnique _dummyMarkerName;
    _hoverMarkers pushBackUnique _markerName;
};

missionNamespace setVariable ["A3U_mrkHoverMetaMap", _hoverMetaMap];

private _ensureSpecialHoverMetadata = {
    params ["_name", "_side"];

    if !(_name in allMapMarkers) exitWith {};

    private _nameLower = toLowerANSI _name;
    private _dummyName = format ["Dum%1", _name];
    private _specialFaction = [_side] call _getFactionBySide;
    private _specialFactionName =
        [_specialFaction, "name", ""] call _getHashMapValue;

    private _specialFlagMarkerType =
        [_specialFaction, "flagMarkerType", ""] call _getHashMapValue;
    if !(_specialFlagMarkerType isEqualType "") then {_specialFlagMarkerType = "";};

    if (_nameLower == "tradermarker") then {_specialFlagMarkerType = "A3AU_dealer_flag";};

    private _specialTitle = switch (_nameLower) do {
        case "synd_hq": {format [localize "STR_A3U_HOVER_RESISTANCE_HQ",_specialFactionName]};
        case "tradermarker": {localize "STR_A3U_HOVER_BLACK_MARKET"};
        case "rallypointmarker": {
            private _rallyCount = if (isNil "rallyPointSpawnCount") then {"0"} else {str rallyPointSpawnCount};
            format [localize "STR_marker_RP", _rallyCount]
        };
        default {_name};
    };

    private _specialDescription = switch (_nameLower) do {
        case "synd_hq": {localize "STR_A3U_HOVER_RESISTANCE_HQ_DESC"};
        case "tradermarker": {localize "STR_A3U_HOVER_BLACK_MARKET_DESC"};
        case "rallypointmarker": {localize "STR_A3U_HOVER_RALLY_DESC"};
        default {""};
    };

    private _specialText = if (_specialDescription != "") then {
        format [
            "%1<br/><t size='0.85' color='#CFCFCF'>%2</t>",
            _specialTitle,
            _specialDescription
        ]
    } else {
        _specialTitle
    };

    _hoverMetaMap set [_name, [_specialText, _specialFlagMarkerType]];
    _hoverMarkers pushBackUnique _name;

    if (_dummyName in allMapMarkers) then {
        _hoverMetaMap set [_dummyName, [_specialText, _specialFlagMarkerType]];
        _hoverMarkers pushBackUnique _dummyName;
    };
};

["Synd_HQ", teamPlayer] call _ensureSpecialHoverMetadata;
["synd_hq", teamPlayer] call _ensureSpecialHoverMetadata;
["TraderMarker", civilian] call _ensureSpecialHoverMetadata;
["tradermarker", civilian] call _ensureSpecialHoverMetadata;
["RallyPointMarker", teamPlayer] call _ensureSpecialHoverMetadata;
["rallypointmarker", teamPlayer] call _ensureSpecialHoverMetadata;

missionNamespace setVariable ["A3U_mrkHoverMetaMap", _hoverMetaMap];
missionNamespace setVariable ["A3U_hoverMarkers", _hoverMarkers];

if (A3AU_setting_alwaysShowMarkerName || {_markerName in (airportsX + milbases)}) then {
    _visibleMarkerName setMarkerTextLocal _markerLabelOnly;
} else {
    _visibleMarkerName setMarkerTextLocal "";
};

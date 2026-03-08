#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_markerBrowser

Description:
    Toggles the location browser UI, lets the player filter known map markers,
    and animates the map to the selected location.

Parameters:
    None.

Optional:
    0: _toggle - Whether to open or close the browser <BOOL> (default: true)
    1: _zoom - Target zoom level used when jumping to a marker <NUMBER>
        (default: 0.04)
    2: _animationTime - Map animation duration in seconds <NUMBER>
        (default: 1)
    3: _selectedCategoryKey - Preselected category key <STRING>
        (default: "__ALL__")
    4: _selectedFactionKey - Preselected faction key <STRING>
        (default: "__ALL__")
    5: _searchFilterText - Preselected search text <STRING>
        (default: "")
    6: _refreshOnly - Whether to refresh the existing list only <BOOL>
        (default: false)

Example:
    [true, 0.04, 1] call A3U_fnc_markerBrowser;

Returns:
    Nothing <NONE>

Environment:
    Client, Unscheduled

Author:
    Maxx
---------------------------------------------------------------------------- */

// Existing A3U_fnc_* public function name kept for backwards compatibility.

if !assert(_this isEqualType []) exitWith {};

private _toggle = param [0, true, [true]];
private _zoom = param [1, 0.04, [0]];
private _animationTime = param [2, 1, [0]];
private _selectedCategoryKey = param [3, "__ALL__", [""]];
private _selectedFactionKey = param [4, "__ALL__", [""]];
private _searchFilterText = param [5, "", [""]];
private _refreshOnly = param [6, false, [true]];

private _mapDisplay = findDisplay 12;
if (isNull _mapDisplay) exitWith {};

private _searchPlaceholderText = "Search locations...";

// Legacy A3U_* browser keys are kept for compatibility with the existing
// browser/hover code that shares state through display variables.

private _getOriginalMarkerName = {
    params ["_markerName"];

    if !(_markerName isEqualType "") exitWith {
        ""
    };

    private _originalMarkerName = _markerName;
    while {
        (count _originalMarkerName) >= 3
        && {(_originalMarkerName select [0, 3]) == "Dum"}
    } do {
        _originalMarkerName = _originalMarkerName select
            [3, (count _originalMarkerName) - 3];
    };

    _originalMarkerName
};

private _toDummyMarkerName = {
    params ["_markerName"];

    if !(_markerName isEqualType "") exitWith {
        ""
    };

    if (
        (count _markerName) >= 3
        && {(_markerName select [0, 3]) == "Dum"}
    ) exitWith {
        _markerName
    };

    format ["Dum%1", _markerName]
};

private _asHashMap = {
    params ["_value"];

    if (_value isEqualType createHashMap) exitWith {
        _value
    };

    createHashMap
};

private _getMapValue = {
    params ["_hashMap", "_key", "_defaultValue"];

    if !(_hashMap isEqualType createHashMap) exitWith {
        _defaultValue
    };

    _hashMap getOrDefault [_key, _defaultValue]
};

private _occupierFaction = [
    missionNamespace getVariable ["A3A_faction_occ", createHashMap]
] call _asHashMap;

private _invaderFaction = [
    missionNamespace getVariable ["A3A_faction_inv", createHashMap]
] call _asHashMap;

private _rebelFaction = [
    missionNamespace getVariable ["A3A_faction_reb", createHashMap]
] call _asHashMap;

private _readHoverMetadata = {
    params ["_markerName"];

    if !(_markerName isEqualType "") exitWith {
        []
    };

    private _hoverMetaMap = missionNamespace getVariable
        ["A3U_mrkHoverMetaMap", createHashMap];

    private _markerMetadata = _hoverMetaMap getOrDefault [_markerName, []];
    if !(_markerMetadata isEqualTo []) exitWith {
        _markerMetadata
    };

    private _originalMarkerName = [_markerName] call _getOriginalMarkerName;
    if (_originalMarkerName == "") exitWith {
        []
    };

    _markerMetadata = _hoverMetaMap getOrDefault [_originalMarkerName, []];
    if !(_markerMetadata isEqualTo []) exitWith {
        _markerMetadata
    };

    private _dummyMarkerName = [_originalMarkerName] call _toDummyMarkerName;
    _hoverMetaMap getOrDefault [_dummyMarkerName, []]
};

private _readSideFromStore = {
    params ["_markerName"];

    if !(_markerName isEqualType "") exitWith {
        nil
    };

    if (_markerName == "") exitWith {
        nil
    };

    private _sidesVariableSource = missionNamespace getVariable
        ["sidesX", objNull];

    if (isNull _sidesVariableSource) exitWith {
        nil
    };

    _sidesVariableSource getVariable [_markerName, nil]
};

private _getMarkerSideFromColor = {
    params ["_markerName"];

    if !(_markerName isEqualType "") exitWith {
        sideUnknown
    };

    if !(_markerName in allMapMarkers) exitWith {
        sideUnknown
    };

    private _markerColor = markerColor _markerName;

    if (_markerColor == colorTeamPlayer) exitWith {
        teamPlayer
    };

    if (_markerColor == colorOccupants) exitWith {
        Occupants
    };

    if (_markerColor == colorInvaders) exitWith {
        Invaders
    };

    sideUnknown
};

private _getMarkerSideFromMetadata = {
    params ["_markerName"];

    private _markerMetadata = [_markerName] call _readHoverMetadata;
    if (_markerMetadata isEqualTo [] || {count _markerMetadata < 2}) exitWith {
        sideUnknown
    };

    private _flagMarkerType = _markerMetadata # 1;
    if !(_flagMarkerType isEqualType "") exitWith {
        sideUnknown
    };

    if (_flagMarkerType == "") exitWith {
        sideUnknown
    };

    private _rebelFlagMarkerType =
        [_rebelFaction, "flagMarkerType", ""] call _getMapValue;
    private _occupierFlagMarkerType =
        [_occupierFaction, "flagMarkerType", ""] call _getMapValue;
    private _invaderFlagMarkerType =
        [_invaderFaction, "flagMarkerType", ""] call _getMapValue;

    if (_flagMarkerType == _rebelFlagMarkerType) exitWith {
        teamPlayer
    };

    if (_flagMarkerType == _occupierFlagMarkerType) exitWith {
        Occupants
    };

    if (_flagMarkerType == _invaderFlagMarkerType) exitWith {
        Invaders
    };

    sideUnknown
};

private _getMarkerSide = {
    params ["_markerName"];

    if !(_markerName isEqualType "") exitWith {
        sideUnknown
    };

    private _originalMarkerName = [_markerName] call _getOriginalMarkerName;
    if (_originalMarkerName == "") then {
        _originalMarkerName = _markerName;
    };

    if (_originalMarkerName in milAdministrationsX) exitWith {
        Occupants
    };

    private _markerNameLower = toLowerANSI _originalMarkerName;
    if (
        _markerNameLower == "synd_hq"
        || {_markerNameLower == "rallypointmarker"}
    ) exitWith {
        teamPlayer
    };

    private _markerSide = [_markerName] call _readSideFromStore;
    if (!isNil "_markerSide") exitWith {
        _markerSide
    };

    _markerSide = [_originalMarkerName] call _readSideFromStore;
    if (!isNil "_markerSide") exitWith {
        _markerSide
    };

    private _dummyMarkerName = [_originalMarkerName] call _toDummyMarkerName;
    _markerSide = [_dummyMarkerName] call _readSideFromStore;
    if (!isNil "_markerSide") exitWith {
        _markerSide
    };

    _markerSide = [_markerName] call _getMarkerSideFromMetadata;
    if (_markerSide isNotEqualTo sideUnknown) exitWith {
        _markerSide
    };

    _markerSide = [_originalMarkerName] call _getMarkerSideFromMetadata;
    if (_markerSide isNotEqualTo sideUnknown) exitWith {
        _markerSide
    };

    _markerSide = [_dummyMarkerName] call _getMarkerSideFromMetadata;
    if (_markerSide isNotEqualTo sideUnknown) exitWith {
        _markerSide
    };

    _markerSide = [_markerName] call _getMarkerSideFromColor;
    if (_markerSide isNotEqualTo sideUnknown) exitWith {
        _markerSide
    };

    _markerSide = [_originalMarkerName] call _getMarkerSideFromColor;
    if (_markerSide isNotEqualTo sideUnknown) exitWith {
        _markerSide
    };

    _markerSide = [_dummyMarkerName] call _getMarkerSideFromColor;
    if (_markerSide isNotEqualTo sideUnknown) exitWith {
        _markerSide
    };

    sideUnknown
};

private _isMarkerHidden = {
    params ["_markerName"];

    if !(_markerName isEqualType "") exitWith {
        false
    };

    private _originalMarkerName = [_markerName] call _getOriginalMarkerName;
    if (_originalMarkerName == "") exitWith {
        false
    };

    private _hideEnemyMarkers = if (isNil "hideEnemyMarkers") then {
        false
    } else {
        hideEnemyMarkers
    };

    if (!_hideEnemyMarkers) exitWith {
        false
    };

    private _revealedZones = if (isNil "revealedZones") then {
        []
    } else {
        revealedZones
    };

    private _immuneMarkers = if (isNil "markersImmune") then {
        []
    } else {
        markersImmune
    };

    if (_originalMarkerName in _revealedZones) exitWith {
        false
    };

    if (_originalMarkerName in _immuneMarkers) exitWith {
        false
    };

    if ("cont" in _originalMarkerName) exitWith {
        false
    };

    if (
        _originalMarkerName in citiesX
        || {_originalMarkerName in airportsX}
    ) exitWith {
        false
    };

    private _markerSide = [_originalMarkerName] call _getMarkerSide;
    _markerSide isNotEqualTo sideUnknown
        && {_markerSide isNotEqualTo resistance}
};

private _getFactionDisplayNameBySide = {
    params ["_markerSide"];

    private _factionData = switch (_markerSide) do {
        case Occupants: {
            _occupierFaction
        };
        case Invaders: {
            _invaderFaction
        };
        case teamPlayer;
        case resistance: {
            _rebelFaction
        };
        default {
            createHashMap
        };
    };

    private _factionName = [_factionData, "name", ""] call _getMapValue;
    if (_factionName == "") then {
        _factionName = [_factionData, "shortName", ""] call _getMapValue;
    };

    if (_factionName == "") then {
        _factionName = [_factionData, "displayName", ""] call _getMapValue;
    };

    _factionName
};

private _getFactionName = {
    params ["_markerName"];

    private _markerSide = [_markerName] call _getMarkerSide;
    private _factionName = [_markerSide] call _getFactionDisplayNameBySide;

    switch (_markerSide) do {
        case teamPlayer;
        case resistance: {
            if (_factionName == "") then {
                _factionName = "Rebels";
            };

            format ["%1 (reb)", _factionName]
        };
        case Occupants: {
            if (_factionName == "") then {
                _factionName = "Occupiers";
            };

            format ["%1 (occ)", _factionName]
        };
        case Invaders: {
            if (_factionName == "") then {
                _factionName = "Invaders";
            };

            format ["%1 (inv)", _factionName]
        };
        default {
            "Unknown"
        };
    };
};

private _getMarkerLabelFromMetadata = {
    params ["_markerName"];

    private _hoverMetaMap = missionNamespace getVariable
        ["A3U_mrkHoverMetaMap", createHashMap];

    private _markerMetadata = _hoverMetaMap getOrDefault [_markerName, []];
    if (_markerMetadata isEqualTo [] || {count _markerMetadata < 1}) then {
        private _originalMarkerName = [_markerName] call _getOriginalMarkerName;
        private _dummyMarkerName = [_originalMarkerName] call _toDummyMarkerName;

        _markerMetadata = _hoverMetaMap getOrDefault [_originalMarkerName, []];
        if (_markerMetadata isEqualTo [] || {count _markerMetadata < 1}) then {
            _markerMetadata = _hoverMetaMap getOrDefault [_dummyMarkerName, []];
        };
    };

    if !(_markerMetadata isEqualTo [] || {count _markerMetadata < 1}) then {
        private _markerText = _markerMetadata # 0;
        private _lineBreakIndex = _markerText find "<br";
        if (_lineBreakIndex >= 0) then {
            _markerText = _markerText select [0, _lineBreakIndex];
        };

        _markerText
    } else {
        private _originalMarkerName = [_markerName] call _getOriginalMarkerName;
        private _markerText = markerText _originalMarkerName;
        if (_markerText != "") exitWith {
            _markerText
        };

        _originalMarkerName
    };
};

private _getMarkerIconFromMetadata = {
    params ["_markerName"];

    private _hoverMetaMap = missionNamespace getVariable
        ["A3U_mrkHoverMetaMap", createHashMap];
    private _markerMetadata = _hoverMetaMap getOrDefault [_markerName, []];

    if (_markerMetadata isEqualTo [] || {count _markerMetadata < 2}) exitWith {
        ""
    };

    private _flagMarkerType = _markerMetadata # 1;
    if (_flagMarkerType == "") exitWith {
        ""
    };

    getText (configFile >> "CfgMarkers" >> _flagMarkerType >> "icon")
};

private _getPlainMarkerLabel = {
    params ["_markerName"];

    private _markerLabel = [_markerName] call _getMarkerLabelFromMetadata;
    if !(_markerLabel isEqualType "") then {
        _markerLabel = str _markerLabel;
    };

    private _originalMarkerName = [_markerName] call _getOriginalMarkerName;

    if (_markerLabel == "" || {_markerLabel find "<" >= 0}) then {
        private _fallbackLabel = markerText _originalMarkerName;
        if (_fallbackLabel != "") exitWith {
            _fallbackLabel
        };

        _originalMarkerName
    };

    _markerLabel
};

private _getSearchFilterText = {
    params ["_editControl"];

    if (isNull _editControl) exitWith {
        ""
    };

    if (_editControl getVariable ["A3U_markerBrowser_placeholderActive", false]) exitWith {
        ""
    };

    ctrlText _editControl
};

private _applySearchPlaceholder = {
    params ["_editControl", "_searchText"];

    _editControl setVariable
        ["A3U_markerBrowser_placeholderText", _searchPlaceholderText];

    if (_searchText == "") exitWith {
        _editControl ctrlSetText _searchPlaceholderText;
        _editControl ctrlSetTextColor [0.65, 0.65, 0.65, 1];
        _editControl setVariable ["A3U_markerBrowser_placeholderActive", true];
    };

    _editControl ctrlSetText _searchText;
    _editControl ctrlSetTextColor [1, 1, 1, 1];
    _editControl setVariable ["A3U_markerBrowser_placeholderActive", false];
};

private _setComboSelectionByData = {
    params ["_comboControl", "_wantedData"];

    private _selectedIndex = 0;
    for "_index" from 0 to ((lbSize _comboControl) - 1) do {
        if ((_comboControl lbData _index) == _wantedData) exitWith {
            _selectedIndex = _index;
        };
    };

    _comboControl lbSetCurSel _selectedIndex;
};

private _markerBuckets = [
    ["Cities", "Cities", citiesX apply { [_x] call _toDummyMarkerName }],
    ["Resources", "Resources", resourcesX apply { [_x] call _toDummyMarkerName }],
    ["Factories", "Factories", factories apply { [_x] call _toDummyMarkerName }],
    ["Outposts", "Outpost", outposts apply { [_x] call _toDummyMarkerName }],
    ["Seaports", "Seaports", seaports apply { [_x] call _toDummyMarkerName }],
    ["Military Bases", "Military Bases", milbases apply {
        [_x] call _toDummyMarkerName
    }],
    ["Air Bases", "Air Bases", airportsX apply { [_x] call _toDummyMarkerName }],
    ["Military Administrations", "Military Administrations", +milAdministrationsX]
];

private _refreshList = {
    private _listControl = _mapDisplay getVariable
        ["A3U_markerBrowser_lnb", controlNull];
    private _searchEdit = _mapDisplay getVariable
        ["A3U_markerBrowser_search", controlNull];
    private _categoryCombo = _mapDisplay getVariable
        ["A3U_markerBrowser_cbCat", controlNull];
    private _factionCombo = _mapDisplay getVariable
        ["A3U_markerBrowser_cbFac", controlNull];

    if (
        isNull _listControl
        || {isNull _searchEdit}
        || {isNull _categoryCombo}
        || {isNull _factionCombo}
    ) exitWith {};

    lnbClear _listControl;

    private _searchText = toLowerANSI ([_searchEdit] call _getSearchFilterText);
    private _currentCategoryKey = _categoryCombo lbData (lbCurSel _categoryCombo);
    private _currentFactionKey = _factionCombo lbData (lbCurSel _factionCombo);

    _mapDisplay setVariable ["A3U_markerBrowser_selCat", _currentCategoryKey];
    _mapDisplay setVariable ["A3U_markerBrowser_selFac", _currentFactionKey];
    _mapDisplay setVariable
        ["A3U_markerBrowser_searchText", [_searchEdit] call _getSearchFilterText];

    private _addHeaderRow = {
        params ["_headerTitle"];

        private _rowIndex = _listControl lnbAddRow
            [format ["— %1 —", _headerTitle], ""];
        _listControl lnbSetData [[_rowIndex, 0], ""];
        _listControl lnbSetColor [[_rowIndex, 0], [0.85, 0.85, 0.85, 1]];
        _listControl lnbSetColor [[_rowIndex, 1], [0.85, 0.85, 0.85, 1]];
    };

    private _passesFactionFilter = {
        params ["_markerName"];

        if (_currentFactionKey == "__ALL__") exitWith {
            true
        };

        private _markerSide = [_markerName] call _getMarkerSide;
        if (_markerSide isEqualTo sideUnknown) exitWith {
            false
        };

        switch (_currentFactionKey) do {
            case "__REB__": {
                _markerSide isEqualTo teamPlayer
            };
            case "__OCC__": {
                _markerSide isEqualTo Occupants
            };
            case "__INV__": {
                _markerSide isEqualTo Invaders
            };
            default {
                true
            };
        };
    };

    private _addMarkerRow = {
        params ["_markerName"];

        if ([_markerName] call _isMarkerHidden) exitWith {};

        if !([_markerName] call _passesFactionFilter) exitWith {};

        private _markerLabel = [_markerName] call _getPlainMarkerLabel;
        if !(_markerLabel isEqualType "") then {
            _markerLabel = str _markerLabel;
        };

        if (_markerLabel == "") exitWith {};

        if (
            _searchText != ""
            && {(toLowerANSI _markerLabel) find _searchText < 0}
        ) exitWith {};

        private _factionName = [_markerName] call _getFactionName;
        private _rowIndex = _listControl lnbAddRow [_markerLabel, _factionName];

        _listControl lnbSetData [[_rowIndex, 0], _markerName];
        _listControl lnbSetColor [[_rowIndex, 0], [1, 1, 1, 1]];
        _listControl lnbSetColor [[_rowIndex, 1], [1, 1, 1, 1]];

        private _iconPath = [_markerName] call _getMarkerIconFromMetadata;
        if (_iconPath != "") then {
            _listControl lnbSetPicture [[_rowIndex, 0], _iconPath];
        };
    };

    if (_currentCategoryKey != "__ALL__") then {
        {
            _x params ["_headerTitle", "_bucketKey", "_markerNames"];

            if (_bucketKey == _currentCategoryKey) exitWith {
                [_headerTitle] call _addHeaderRow;
                _markerNames apply {
                    [_x] call _addMarkerRow;
                };
            };
        } forEach _markerBuckets;
    } else {
        {
            _x params ["_headerTitle", "_bucketKey", "_markerNames"];

            private _bucketHasVisibleEntries = false;
            {
                private _markerName = _x;

                if ([_markerName] call _isMarkerHidden) then {
                    continue;
                };

                if !([_markerName] call _passesFactionFilter) then {
                    continue;
                };

                private _markerLabel = [_markerName] call _getPlainMarkerLabel;
                if !(_markerLabel isEqualType "") then {
                    _markerLabel = str _markerLabel;
                };

                if (_markerLabel == "") then {
                    continue;
                };

                if (
                    _searchText != ""
                    && {(toLowerANSI _markerLabel) find _searchText < 0}
                ) then {
                    continue;
                };

                _bucketHasVisibleEntries = true;
                break;
            } forEach _markerNames;

            if (_bucketHasVisibleEntries) then {
                [_headerTitle] call _addHeaderRow;
                _markerNames apply {
                    [_x] call _addMarkerRow;
                };
            };
        } forEach _markerBuckets;
    };
};

private _browserButton = _mapDisplay getVariable
    ["A3U_markerBrowser_btn", controlNull];

if (isNull _browserButton) then {
    _browserButton = _mapDisplay ctrlCreate ["RscStructuredText", 88011];
    if (!isNull _browserButton) then {
        private _iconPath =
            "\x\A3A\addons\ultimate\data\A3AU_search_icon.paa";
        private _buttonText = format [
            "<t size='0.92' valign='middle' leading='0.9'>"
            + "<img image='%1' size='0.95'/>  Location Browser</t>",
            _iconPath
        ];

        _browserButton ctrlSetStructuredText (parseText _buttonText);
        _browserButton ctrlSetPosition [0, 0, 0.5, 0.1];
        _browserButton ctrlCommit 0;

        private _horizontalPadding = 0.008;
        private _verticalPadding = 4 * pixelH;
        private _buttonWidth =
            (ctrlTextWidth _browserButton) + _horizontalPadding;
        private _buttonHeight =
            (ctrlTextHeight _browserButton) + _verticalPadding;
        private _buttonPositionX =
            safeZoneX + (safeZoneW / 2) - (_buttonWidth / 2);
        private _buttonPositionY = safeZoneY + (2 * pixelH);

        _browserButton ctrlSetPosition [
            _buttonPositionX,
            _buttonPositionY,
            _buttonWidth,
            _buttonHeight
        ];
        _browserButton ctrlSetBackgroundColor [0, 0, 0, 0.45];
        _browserButton ctrlCommit 0;

        _browserButton setVariable ["A3U_btn_colNormal", [0, 0, 0, 0.45]];
        _browserButton setVariable ["A3U_btn_colHover", [0.10, 0.60, 1.00, 0.60]];

        _browserButton ctrlAddEventHandler ["MouseEnter", {
            params ["_control"];

            _control ctrlSetBackgroundColor (
                _control getVariable ["A3U_btn_colHover", [0.10, 0.60, 1.00, 0.60]]
            );
        }];

        _browserButton ctrlAddEventHandler ["MouseExit", {
            params ["_control"];

            _control ctrlSetBackgroundColor (
                _control getVariable ["A3U_btn_colNormal", [0, 0, 0, 0.45]]
            );
        }];

        _browserButton ctrlAddEventHandler ["MouseButtonDown", {
            params ["_control", "_button"];

            if (_button != 0) exitWith {};

            private _display = ctrlParent _control;
            if (isNull _display) exitWith {};

            private _existingBrowserGroup = _display getVariable
                ["A3U_markerBrowser_grp", controlNull];

            private _zoom = _display getVariable ["A3U_markerBrowser_zoom", 0.04];
            private _animationTime = _display getVariable
                ["A3U_markerBrowser_anim", 1];
            private _storedCategoryKey = _display getVariable
                ["A3U_markerBrowser_selCat", "__ALL__"];
            private _storedFactionKey = _display getVariable
                ["A3U_markerBrowser_selFac", "__ALL__"];
            private _storedSearchText = _display getVariable
                ["A3U_markerBrowser_searchText", ""];

            if (isNull _existingBrowserGroup) then {
                [
                    true,
                    _zoom,
                    _animationTime,
                    _storedCategoryKey,
                    _storedFactionKey,
                    _storedSearchText,
                    false
                ] call A3U_fnc_markerBrowser;
            } else {
                [false] call A3U_fnc_markerBrowser;
            };
        }];

        _mapDisplay setVariable ["A3U_markerBrowser_btn", _browserButton];
    };
};

private _existingBrowserGroup = _mapDisplay getVariable
    ["A3U_markerBrowser_grp", controlNull];

if (!_toggle) exitWith {
    if (!isNull _existingBrowserGroup) then {
        ctrlDelete _existingBrowserGroup;
        _mapDisplay setVariable ["A3U_markerBrowser_grp", controlNull];
        _mapDisplay setVariable ["A3U_markerBrowser_cbCat", controlNull];
        _mapDisplay setVariable ["A3U_markerBrowser_cbFac", controlNull];
        _mapDisplay setVariable ["A3U_markerBrowser_search", controlNull];
        _mapDisplay setVariable ["A3U_markerBrowser_lnb", controlNull];
    };
};

_mapDisplay setVariable ["A3U_markerBrowser_zoom", _zoom];
_mapDisplay setVariable ["A3U_markerBrowser_anim", _animationTime];

if (_refreshOnly && {!isNull _existingBrowserGroup}) exitWith {
    call _refreshList;
};

if (!isNull _existingBrowserGroup) then {
    ctrlDelete _existingBrowserGroup;
    _mapDisplay setVariable ["A3U_markerBrowser_grp", controlNull];
    _mapDisplay setVariable ["A3U_markerBrowser_cbCat", controlNull];
    _mapDisplay setVariable ["A3U_markerBrowser_cbFac", controlNull];
    _mapDisplay setVariable ["A3U_markerBrowser_search", controlNull];
    _mapDisplay setVariable ["A3U_markerBrowser_lnb", controlNull];
};

private _groupWidth = 0.36 * safeZoneW;
private _groupHeight = 0.34 * safeZoneH;
private _currentBrowserButton = _mapDisplay getVariable
    ["A3U_markerBrowser_btn", controlNull];
private _groupPositionY = safeZoneY + (0.02 * safeZoneH);

if (!isNull _currentBrowserButton) then {
    private _buttonPosition = ctrlPosition _currentBrowserButton;
    _groupPositionY =
        (_buttonPosition # 1) + (_buttonPosition # 3) + (4 * pixelH);
};

private _groupPositionX = safeZoneX + (safeZoneW / 2) - (_groupWidth / 2);

private _browserGroup = _mapDisplay ctrlCreate
    ["RscControlsGroupNoScrollbars", -1];
_browserGroup ctrlSetPosition [
    _groupPositionX,
    _groupPositionY,
    _groupWidth,
    _groupHeight
];
_browserGroup ctrlCommit 0;
_mapDisplay setVariable ["A3U_markerBrowser_grp", _browserGroup];

private _backgroundControl = _mapDisplay ctrlCreate
    ["RscText", -1, _browserGroup];
_backgroundControl ctrlSetPosition [0, 0, _groupWidth, _groupHeight];
_backgroundControl ctrlSetBackgroundColor [0, 0, 0, 0.40];
_backgroundControl ctrlCommit 0;

private _titleHeight = 0.035 * safeZoneH;
private _titleControl = _mapDisplay ctrlCreate
    ["RscText", -1, _browserGroup];
_titleControl ctrlSetPosition [0, 0, _groupWidth, _titleHeight];
_titleControl ctrlSetText "Location Browser";
_titleControl ctrlSetBackgroundColor [0.05, 0.05, 0.05, 1];
_titleControl ctrlCommit 0;

private _rowHeight = 0.028 * safeZoneH;
private _paddingX = 0.010 * safeZoneW;
private _dropdownPositionY = _titleHeight + 0.008 * safeZoneH;

private _categoryCombo = _mapDisplay ctrlCreate
    ["RscCombo", -1, _browserGroup];
_categoryCombo ctrlSetPosition [
    _paddingX,
    _dropdownPositionY,
    0.16 * safeZoneW,
    _rowHeight
];
_categoryCombo ctrlCommit 0;
_mapDisplay setVariable ["A3U_markerBrowser_cbCat", _categoryCombo];

private _factionCombo = _mapDisplay ctrlCreate
    ["RscCombo", -1, _browserGroup];
_factionCombo ctrlSetPosition [
    _paddingX + (0.18 * safeZoneW),
    _dropdownPositionY,
    0.16 * safeZoneW,
    _rowHeight
];
_factionCombo ctrlCommit 0;
_mapDisplay setVariable ["A3U_markerBrowser_cbFac", _factionCombo];

private _searchPositionY = _dropdownPositionY + _rowHeight + (0.006 * safeZoneH);
private _searchHeight = 0.028 * safeZoneH;

private _searchEdit = _mapDisplay ctrlCreate ["RscEdit", -1, _browserGroup];
_searchEdit ctrlSetPosition [
    _paddingX,
    _searchPositionY,
    _groupWidth - (2 * _paddingX),
    _searchHeight
];
_searchEdit ctrlCommit 0;
[_searchEdit, _searchFilterText] call _applySearchPlaceholder;
_mapDisplay setVariable ["A3U_markerBrowser_search", _searchEdit];

_searchEdit ctrlAddEventHandler ["SetFocus", {
    params ["_control"];

    if (_control getVariable ["A3U_markerBrowser_placeholderActive", false]) then {
        _control ctrlSetText "";
        _control ctrlSetTextColor [1, 1, 1, 1];
        _control setVariable ["A3U_markerBrowser_placeholderActive", false];
    };
}];

_searchEdit ctrlAddEventHandler ["KillFocus", {
    params ["_control"];

    if ((ctrlText _control) == "") then {
        private _placeholderText = _control getVariable
            ["A3U_markerBrowser_placeholderText", "Search locations..."];

        _control ctrlSetText _placeholderText;
        _control ctrlSetTextColor [0.65, 0.65, 0.65, 1];
        _control setVariable ["A3U_markerBrowser_placeholderActive", true];
    };
}];

private _listControl = _mapDisplay ctrlCreate
    ["RscListNBox", -1, _browserGroup];
_listControl ctrlSetPosition [
    _paddingX,
    _searchPositionY + _searchHeight + (0.008 * safeZoneH),
    _groupWidth - (2 * _paddingX),
    _groupHeight - (_searchPositionY + _searchHeight + (0.018 * safeZoneH))
];
_listControl ctrlCommit 0;
_listControl lnbSetColumnsPos [0.00, 0.70];
_mapDisplay setVariable ["A3U_markerBrowser_lnb", _listControl];

lbClear _categoryCombo;
[
    ["All", "__ALL__"],
    ["Cities", "Cities"],
    ["Resources", "Resources"],
    ["Factories", "Factories"],
    ["Outposts", "Outpost"],
    ["Seaports", "Seaports"],
    ["Military Bases", "Military Bases"],
    ["Air Bases", "Air Bases"],
    ["Military Administrations", "Military Administrations"]
] apply {
    _x params ["_label", "_categoryKey"];

    private _rowIndex = _categoryCombo lbAdd _label;
    _categoryCombo lbSetData [_rowIndex, _categoryKey];
};

lbClear _factionCombo;

private _allFactionIndex = _factionCombo lbAdd "All";
_factionCombo lbSetData [_allFactionIndex, "__ALL__"];

private _rebelFactionLabel = [teamPlayer] call _getFactionDisplayNameBySide;
if (_rebelFactionLabel == "") then {
    _rebelFactionLabel = "Rebels";
};
_rebelFactionLabel = format ["%1 (reb)", _rebelFactionLabel];

private _occupierFactionLabel = [Occupants] call _getFactionDisplayNameBySide;
if (_occupierFactionLabel == "") then {
    _occupierFactionLabel = "Occupiers";
};
_occupierFactionLabel = format ["%1 (occ)", _occupierFactionLabel];

private _invaderFactionLabel = [Invaders] call _getFactionDisplayNameBySide;
if (_invaderFactionLabel == "") then {
    _invaderFactionLabel = "Invaders";
};
_invaderFactionLabel = format ["%1 (inv)", _invaderFactionLabel];

private _rebelsFactionIndex = _factionCombo lbAdd _rebelFactionLabel;
_factionCombo lbSetData [_rebelsFactionIndex, "__REB__"];

private _occupiersFactionIndex = _factionCombo lbAdd _occupierFactionLabel;
_factionCombo lbSetData [_occupiersFactionIndex, "__OCC__"];

private _invadersFactionIndex = _factionCombo lbAdd _invaderFactionLabel;
_factionCombo lbSetData [_invadersFactionIndex, "__INV__"];

[_categoryCombo, _selectedCategoryKey] call _setComboSelectionByData;
[_factionCombo, _selectedFactionKey] call _setComboSelectionByData;

call _refreshList;

_categoryCombo ctrlAddEventHandler ["LBSelChanged", {
    params ["_control", "_selectedIndex"];

    private _display = findDisplay 12;
    if (isNull _display) exitWith {};

    private _factionCombo = _display getVariable
        ["A3U_markerBrowser_cbFac", controlNull];
    private _searchEdit = _display getVariable
        ["A3U_markerBrowser_search", controlNull];

    private _categoryKey = _control lbData _selectedIndex;
    private _factionKey = if (isNull _factionCombo) then {
        "__ALL__"
    } else {
        _factionCombo lbData (lbCurSel _factionCombo)
    };
    private _searchText = if (isNull _searchEdit) then {
        ""
    } else {
        if (_searchEdit getVariable ["A3U_markerBrowser_placeholderActive", false]) then {
            ""
        } else {
            ctrlText _searchEdit
        }
    };

    private _zoom = _display getVariable ["A3U_markerBrowser_zoom", 0.04];
    private _animationTime = _display getVariable
        ["A3U_markerBrowser_anim", 1];

    [
        true,
        _zoom,
        _animationTime,
        _categoryKey,
        _factionKey,
        _searchText,
        true
    ] call A3U_fnc_markerBrowser;
}];

_factionCombo ctrlAddEventHandler ["LBSelChanged", {
    params ["_control", "_selectedIndex"];

    private _display = findDisplay 12;
    if (isNull _display) exitWith {};

    private _categoryCombo = _display getVariable
        ["A3U_markerBrowser_cbCat", controlNull];
    private _searchEdit = _display getVariable
        ["A3U_markerBrowser_search", controlNull];

    private _categoryKey = if (isNull _categoryCombo) then {
        "__ALL__"
    } else {
        _categoryCombo lbData (lbCurSel _categoryCombo)
    };
    private _factionKey = _control lbData _selectedIndex;
    private _searchText = if (isNull _searchEdit) then {
        ""
    } else {
        if (_searchEdit getVariable ["A3U_markerBrowser_placeholderActive", false]) then {
            ""
        } else {
            ctrlText _searchEdit
        }
    };

    private _zoom = _display getVariable ["A3U_markerBrowser_zoom", 0.04];
    private _animationTime = _display getVariable
        ["A3U_markerBrowser_anim", 1];

    [
        true,
        _zoom,
        _animationTime,
        _categoryKey,
        _factionKey,
        _searchText,
        true
    ] call A3U_fnc_markerBrowser;
}];

_searchEdit ctrlAddEventHandler ["KeyUp", {
    params ["_control"];

    private _display = findDisplay 12;
    if (isNull _display) exitWith {};

    private _categoryCombo = _display getVariable
        ["A3U_markerBrowser_cbCat", controlNull];
    private _factionCombo = _display getVariable
        ["A3U_markerBrowser_cbFac", controlNull];

    private _categoryKey = if (isNull _categoryCombo) then {
        "__ALL__"
    } else {
        _categoryCombo lbData (lbCurSel _categoryCombo)
    };
    private _factionKey = if (isNull _factionCombo) then {
        "__ALL__"
    } else {
        _factionCombo lbData (lbCurSel _factionCombo)
    };
    private _searchText = if (
        _control getVariable ["A3U_markerBrowser_placeholderActive", false]
    ) then {
        ""
    } else {
        ctrlText _control
    };

    private _zoom = _display getVariable ["A3U_markerBrowser_zoom", 0.04];
    private _animationTime = _display getVariable
        ["A3U_markerBrowser_anim", 1];

    [
        true,
        _zoom,
        _animationTime,
        _categoryKey,
        _factionKey,
        _searchText,
        true
    ] call A3U_fnc_markerBrowser;
}];

_listControl ctrlAddEventHandler ["LBSelChanged", {
    params ["_control", "_rowIndex"];

    if (_rowIndex < 0) exitWith {};

    private _markerName = _control lnbData [_rowIndex, 0];
    if (_markerName == "") exitWith {};

    private _display = ctrlParent _control;
    private _mapControl = _display displayCtrl 51;
    if (isNull _mapControl) exitWith {};

    private _zoom = _display getVariable ["A3U_markerBrowser_zoom", 0.04];
    private _animationTime = _display getVariable
        ["A3U_markerBrowser_anim", 1];

    private _targetMarkerName = _markerName;
    if !(_targetMarkerName in allMapMarkers) then {
        private _originalMarkerName = _targetMarkerName;
        while {
            (count _originalMarkerName) >= 3
            && {(_originalMarkerName select [0, 3]) == "Dum"}
        } do {
            _originalMarkerName = _originalMarkerName select
                [3, (count _originalMarkerName) - 3];
        };

        _targetMarkerName = _originalMarkerName;
    };

    if !(_targetMarkerName in allMapMarkers) exitWith {};

    _mapControl ctrlMapAnimAdd
        [_animationTime, _zoom, getMarkerPos _targetMarkerName];
    ctrlMapAnimCommit _mapControl;
}];
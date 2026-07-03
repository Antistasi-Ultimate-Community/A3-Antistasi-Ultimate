#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_markerBrowser

Description:
    Toggles the location browser UI, lets the player filter known map markers,
    and animates the map to the selected location.

Parameters:
    0: _toggle - Whether to open or close the browser <BOOL>
        (default: true)
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
    (begin example)
    [true, 0.04, 1] call A3U_fnc_markerBrowser;
    (end example)

Returns:
    Nothing <NONE>

Environment:
    Client, Unscheduled

Author:
    Maxx
---------------------------------------------------------------------------- */

if !assert(_this isEqualType []) exitWith {};

params [
    ["_toggle", true, [true]],
    ["_zoom", 0.04, [0]],
    ["_animationTime", 1, [0]],
    ["_selectedCategoryKey", "__ALL__", [""]],
    ["_selectedFactionKey", "__ALL__", [""]],
    ["_searchFilterText", "", [""]],
    ["_refreshOnly", false, [true]]
];

private _mapDisplay = findDisplay 12;
if (isNull _mapDisplay) exitWith {};

private _searchPlaceholderText = "Search locations...";

private _getOriginalMarkerName = {
    params ["_markerName"];
    if !(_markerName isEqualType "") exitWith {""};
    if ((_markerName find "Dum") == 0) exitWith { _markerName select [3, (count _markerName) - 3] };
    _markerName
};

private _toDummyMarkerName = {
    params ["_markerName"];
    if !(_markerName isEqualType "") exitWith {""};
    if ((_markerName find "Dum") == 0) exitWith { _markerName };
    format ["Dum%1", _markerName]
};

private _isMarkerDestroyed = {
    params ["_markerName"];
    if !(_markerName isEqualType "") exitWith { false };
    
    private _originalName = [_markerName] call _getOriginalMarkerName;
    
    if (_originalName in destroyedSites) exitWith { true };
    if (_originalName in mrkAntennas && {markerType _originalName == "A3AU_radiotower_dead_mrk"}) exitWith { true };
    
    if (_originalName in milAdministrationsX) exitWith {
        private _destroyedAdmins = missionNamespace getVariable ["A3A_destroyedMilAdministrations", []];
        private _markerPos = getMarkerPos _originalName;
        
        (_destroyedAdmins findIf { !isNull _x && {_markerPos distance2D _x < 30} }) != -1
    };
    
    false
};

private _occupierFaction = missionNamespace getVariable ["A3A_faction_occ", createHashMap];
private _invaderFaction = missionNamespace getVariable ["A3A_faction_inv", createHashMap];
private _rebelFaction = missionNamespace getVariable ["A3A_faction_reb", createHashMap];

private _readHoverMetadata = {
    params ["_markerName"];
    if !(_markerName isEqualType "") exitWith { [] };

    private _hoverMetaMap = missionNamespace getVariable ["A3U_mrkHoverMetaMap", createHashMap];
    private _original = [_markerName] call _getOriginalMarkerName;
    private _dummy = [_original] call _toDummyMarkerName;

    private _meta = _hoverMetaMap getOrDefault [_original, []];
    if !(_meta isEqualTo []) exitWith { _meta };
    
    _hoverMetaMap getOrDefault [_dummy, []]
};

private _getMarkerSideFromMetadata = {
    params ["_markerName"];
    private _markerMetadata = [_markerName] call _readHoverMetadata;
    
    if (_markerMetadata isEqualTo [] || {count _markerMetadata < 2}) exitWith { sideUnknown };
    
    private _flagMarkerType = _markerMetadata # 1;
    if (_flagMarkerType == "") exitWith { sideUnknown };

    if (_flagMarkerType == (_rebelFaction getOrDefault ["flagMarkerType", ""])) exitWith { teamPlayer };
    if (_flagMarkerType == (_occupierFaction getOrDefault ["flagMarkerType", ""])) exitWith { Occupants };
    if (_flagMarkerType == (_invaderFaction getOrDefault ["flagMarkerType", ""])) exitWith { Invaders };

    sideUnknown
};

private _getMarkerSideFromColor = {
    params ["_markerName"];
    if !(_markerName in allMapMarkers) exitWith { sideUnknown };
    
    private _markerColor = markerColor _markerName;
    if (_markerColor == colorTeamPlayer) exitWith { teamPlayer };
    if (_markerColor == colorOccupants) exitWith { Occupants };
    if (_markerColor == colorInvaders) exitWith { Invaders };

    sideUnknown
};

private _getMarkerSide = {
    params ["_markerName"];
    if !(_markerName isEqualType "") exitWith { sideUnknown };

    private _originalName = [_markerName] call _getOriginalMarkerName;

    if (_originalName in milAdministrationsX) exitWith { Occupants };
    private _lowerName = toLowerANSI _originalName;
    if (_lowerName == "synd_hq" || _lowerName == "rallypointmarker") exitWith { teamPlayer };

    private _side = sidesX getVariable [_originalName, sideUnknown];
    if (_side isNotEqualTo sideUnknown) exitWith { _side };

    _side = [_originalName] call _getMarkerSideFromMetadata;
    if (_side isNotEqualTo sideUnknown) exitWith { _side };

    [_originalName] call _getMarkerSideFromColor
};

private _getFactionDisplayNameBySide = {
    params ["_markerSide"];
    private _factionData = switch (_markerSide) do {
        case Occupants: { _occupierFaction };
        case Invaders: { _invaderFaction };
        case teamPlayer; case resistance: { _rebelFaction };
        default { createHashMap };
    };

    private _name = _factionData getOrDefault ["name", ""];
    if (_name == "") then { _name = _factionData getOrDefault ["shortName", ""] };
    if (_name == "") then { _name = _factionData getOrDefault ["displayName", ""] };
    _name
};

private _getFactionName = {
    params ["_markerName"];
    
    if ([_markerName] call _isMarkerDestroyed) exitWith { "Destroyed" };
    
    private _markerSide = [_markerName] call _getMarkerSide;
    private _factionName = [_markerSide] call _getFactionDisplayNameBySide;

    switch (_markerSide) do {
        case teamPlayer; case resistance: { format ["%1 (reb)", if (_factionName == "") then {"Rebels"} else {_factionName}] };
        case Occupants: { format ["%1 (occ)", if (_factionName == "") then {"Occupiers"} else {_factionName}] };
        case Invaders: { format ["%1 (inv)", if (_factionName == "") then {"Invaders"} else {_factionName}] };
        default { "Unknown" };
    };
};

private _getMarkerLabelFromMetadata = {
    params ["_markerName"];
    private _markerMetadata = [_markerName] call _readHoverMetadata;

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
        if (_markerText != "") exitWith { _markerText };
        _originalMarkerName
    };
};

private _getMarkerIconFromMetadata = {
    params ["_markerName"];
    
    if ([_markerName] call _isMarkerDestroyed) exitWith { 
        getText (configFile >> "CfgMarkers" >> "A3AU_destroyed_mrk" >> "icon") 
    };
    
    private _markerMetadata = [_markerName] call _readHoverMetadata;
    if (_markerMetadata isEqualTo [] || {count _markerMetadata < 2}) exitWith { "" };
    
    private _flagMarkerType = _markerMetadata # 1;
    if (_flagMarkerType == "") exitWith { "" };
    
    getText (configFile >> "CfgMarkers" >> _flagMarkerType >> "icon")
};

private _getPlainMarkerLabel = {
    params ["_markerName"];
    private _markerLabel = [_markerName] call _getMarkerLabelFromMetadata;
    if !(_markerLabel isEqualType "") then { _markerLabel = str _markerLabel; };

    if (_markerLabel == "" || {_markerLabel find "<" >= 0}) then {
        private _originalMarkerName = [_markerName] call _getOriginalMarkerName;
        private _fallbackLabel = markerText _originalMarkerName;
        if (_fallbackLabel != "") exitWith { _fallbackLabel };
        _originalMarkerName
    } else {
        _markerLabel
    };
};

private _applySearchPlaceholder = {
    params ["_editControl", "_searchText"];
    _editControl setVariable ["A3U_markerBrowser_placeholderText", _searchPlaceholderText];
    
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
        if ((_comboControl lbData _index) == _wantedData) exitWith { _selectedIndex = _index; };
    };
    _comboControl lbSetCurSel _selectedIndex;
};

private _markerBuckets = [
    ["Headquarters", "Headquarters", ["Synd_HQ"] apply { [_x] call _toDummyMarkerName }],
    ["Cities", "Cities", citiesX apply { [_x] call _toDummyMarkerName }],
    ["Resources", "Resources", resourcesX apply { [_x] call _toDummyMarkerName }],
    ["Factories", "Factories", factories apply { [_x] call _toDummyMarkerName }],
    ["Outposts", "Outpost", outposts apply { [_x] call _toDummyMarkerName }],
    ["Seaports", "Seaports", seaports apply { [_x] call _toDummyMarkerName }],
    ["Military Bases", "Military Bases", milbases apply {[_x] call _toDummyMarkerName}],
    ["Air Bases", "Air Bases", airportsX apply { [_x] call _toDummyMarkerName }],
    ["Military Administrations", "Military Administrations", +milAdministrationsX],
    ["Radio Towers", "Radio Towers", mrkAntennas apply { [_x] call _toDummyMarkerName }]
];

private _refreshList = {
    private _listControl = _mapDisplay getVariable ["A3U_markerBrowser_lnb", controlNull];
    private _searchEdit = _mapDisplay getVariable ["A3U_markerBrowser_search", controlNull];
    private _categoryCombo = _mapDisplay getVariable ["A3U_markerBrowser_cbCat", controlNull];
    private _factionCombo = _mapDisplay getVariable ["A3U_markerBrowser_cbFac", controlNull];

    if (isNull _listControl || {isNull _searchEdit} || {isNull _categoryCombo} || {isNull _factionCombo}) exitWith {};
    
    lnbClear _listControl;

    private _searchText = "";
    if (!(_searchEdit getVariable ["A3U_markerBrowser_placeholderActive", false])) then {
        _searchText = toLowerANSI (ctrlText _searchEdit);
    };

    private _currentCategoryKey = _categoryCombo lbData (lbCurSel _categoryCombo);
    private _currentFactionKey = _factionCombo lbData (lbCurSel _factionCombo);

    _mapDisplay setVariable ["A3U_markerBrowser_selCat", _currentCategoryKey];
    _mapDisplay setVariable ["A3U_markerBrowser_selFac", _currentFactionKey];
    _mapDisplay setVariable ["A3U_markerBrowser_searchText", _searchText];

    private _passesFactionFilter = {
        params ["_markerName"];
        if (_currentFactionKey == "__ALL__") exitWith { true };
        
        private _isDestroyed = [_markerName] call _isMarkerDestroyed;
        if (_currentFactionKey == "__DES__") exitWith { _isDestroyed };
        if (_isDestroyed) exitWith { false }; 

        private _markerSide = [_markerName] call _getMarkerSide;
        if (_markerSide isEqualTo sideUnknown) exitWith { false };

        switch (_currentFactionKey) do {
            case "__REB__": { _markerSide isEqualTo teamPlayer };
            case "__OCC__": { _markerSide isEqualTo Occupants };
            case "__INV__": { _markerSide isEqualTo Invaders };
            default { true };
        };
    };

    {
        _x params ["_headerTitle", "_bucketKey", "_markerNames"];
        
        if (_currentCategoryKey != "__ALL__" && {_bucketKey != _currentCategoryKey}) then { continue };

        private _validMarkers = [];
        
        {
            private _markerName = _x;
            if !([_markerName] call _passesFactionFilter) then { continue };

            private _originalMarker = [_markerName] call _getOriginalMarkerName;
            if ([_originalMarker] call A3U_fnc_isMarkerHidden) then { continue };

            private _markerLabel = [_markerName] call _getPlainMarkerLabel;
            if !(_markerLabel isEqualType "") then { _markerLabel = str _markerLabel; };
            if (_markerLabel == "") then { continue };

            if (_searchText != "" && {(toLowerANSI _markerLabel) find _searchText < 0}) then { continue };

            // Place _markerLabel at index 0 so Arma can sort the nested array alphabetically
            _validMarkers pushBack [
                _markerLabel,
                _markerName, 
                [_markerName] call _getFactionName, 
                [_markerName] call _getMarkerIconFromMetadata
            ];
        } forEach _markerNames;

        if !(_validMarkers isEqualTo []) then {
            
            // Sort the markers alphabetically by their label
            _validMarkers sort true; 
            
            private _headerIndex = _listControl lnbAddRow [format ["— %1 —", _headerTitle], ""];
            _listControl lnbSetData [[_headerIndex, 0], ""];
            _listControl lnbSetColor [[_headerIndex, 0], [0.85, 0.85, 0.85, 1]];
            _listControl lnbSetColor [[_headerIndex, 1], [0.85, 0.85, 0.85, 1]];

            {
                _x params ["_mLabel", "_mName", "_mFaction", "_mIcon"];
                private _rowIndex = _listControl lnbAddRow [_mLabel, _mFaction];
                _listControl lnbSetData [[_rowIndex, 0], _mName];
                
                // Hardcoded text color overrides removed here to fix the lost-focus unreadable text bug
                
                if (_mIcon != "") then { _listControl lnbSetPicture [[_rowIndex, 0], _mIcon]; };
            } forEach _validMarkers;
        };
    } forEach _markerBuckets;
};

private _onFilterChanged = {
    private _display = findDisplay 12;
    if (isNull _display) exitWith {};

    private _categoryCombo = _display getVariable ["A3U_markerBrowser_cbCat", controlNull];
    private _factionCombo = _display getVariable ["A3U_markerBrowser_cbFac", controlNull];
    private _searchEdit = _display getVariable ["A3U_markerBrowser_search", controlNull];

    private _categoryKey = if (isNull _categoryCombo) then {"__ALL__"} else {_categoryCombo lbData (lbCurSel _categoryCombo)};
    private _factionKey = if (isNull _factionCombo) then {"__ALL__"} else {_factionCombo lbData (lbCurSel _factionCombo)};
    
    private _searchText = "";
    if (!isNull _searchEdit && {!(_searchEdit getVariable ["A3U_markerBrowser_placeholderActive", false])}) then {
        _searchText = ctrlText _searchEdit;
    };

    private _zoom = _display getVariable ["A3U_markerBrowser_zoom", 0.04];
    private _animationTime = _display getVariable ["A3U_markerBrowser_anim", 1];

    [true, _zoom, _animationTime, _categoryKey, _factionKey, _searchText, true] call A3U_fnc_markerBrowser;
};


// -----------------------------------------------------------------------------
// UI INITIALIZATION
// -----------------------------------------------------------------------------
private _browserButton = _mapDisplay getVariable ["A3U_markerBrowser_btn", controlNull];
if (isNull _browserButton) then {
    _browserButton = _mapDisplay ctrlCreate ["RscStructuredText", 88011];
    if (!isNull _browserButton) then {
        private _iconPath = "\x\A3A\addons\ultimate\data\A3AU_search_icon.paa";
        private _buttonText = format [
            "<t size='0.92' valign='middle' leading='0.9'><img image='%1' size='0.95'/>  Location Browser</t>", _iconPath
        ];
        
        _browserButton ctrlSetStructuredText (parseText _buttonText);
        _browserButton ctrlSetPosition [0, 0, 0.5, 0.1];
        _browserButton ctrlCommit 0;

        private _buttonWidth = (ctrlTextWidth _browserButton) + 0.008;
        private _buttonHeight = (ctrlTextHeight _browserButton) + (4 * pixelH);
        private _buttonPositionX = safeZoneX + (safeZoneW / 2) - (_buttonWidth / 2);
        private _buttonPositionY = safeZoneY + (2 * pixelH);

        _browserButton ctrlSetPosition [_buttonPositionX, _buttonPositionY, _buttonWidth, _buttonHeight];
        _browserButton ctrlSetBackgroundColor [0, 0, 0, 0.45];
        _browserButton ctrlCommit 0;

        _browserButton setVariable ["A3U_btn_colNormal", [0, 0, 0, 0.45]];
        _browserButton setVariable ["A3U_btn_colHover", [0.10, 0.60, 1.00, 0.60]];

        _browserButton ctrlAddEventHandler ["MouseEnter", { params ["_control"]; _control ctrlSetBackgroundColor (_control getVariable ["A3U_btn_colHover", [0.10, 0.60, 1.00, 0.60]]); }];
        _browserButton ctrlAddEventHandler ["MouseExit", { params ["_control"]; _control ctrlSetBackgroundColor (_control getVariable ["A3U_btn_colNormal", [0, 0, 0, 0.45]]); }];
        _browserButton ctrlAddEventHandler ["MouseButtonDown", {
            params ["_control", "_button"];
            if (_button != 0) exitWith {};

            private _display = ctrlParent _control;
            if (isNull _display) exitWith {};

            private _existingBrowserGroup = _display getVariable ["A3U_markerBrowser_grp", controlNull];
            if (isNull _existingBrowserGroup) then {
                [
                    true,
                    _display getVariable ["A3U_markerBrowser_zoom", 0.04],
                    _display getVariable ["A3U_markerBrowser_anim", 1],
                    _display getVariable ["A3U_markerBrowser_selCat", "__ALL__"],
                    _display getVariable ["A3U_markerBrowser_selFac", "__ALL__"],
                    _display getVariable ["A3U_markerBrowser_searchText", ""],
                    false
                ] call A3U_fnc_markerBrowser;
            } else {
                [false] call A3U_fnc_markerBrowser;
            };
        }];

        _mapDisplay setVariable ["A3U_markerBrowser_btn", _browserButton];
    };
};

private _existingBrowserGroup = _mapDisplay getVariable ["A3U_markerBrowser_grp", controlNull];
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

if (_refreshOnly && {!isNull _existingBrowserGroup}) exitWith { call _refreshList; };

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
private _currentBrowserButton = _mapDisplay getVariable ["A3U_markerBrowser_btn", controlNull];
private _groupPositionY = safeZoneY + (0.02 * safeZoneH);

if (!isNull _currentBrowserButton) then {
    private _buttonPosition = ctrlPosition _currentBrowserButton;
    _groupPositionY = (_buttonPosition # 1) + (_buttonPosition # 3) + (4 * pixelH);
};

private _groupPositionX = safeZoneX + (safeZoneW / 2) - (_groupWidth / 2);

private _browserGroup = _mapDisplay ctrlCreate ["RscControlsGroupNoScrollbars", -1];
_browserGroup ctrlSetPosition [_groupPositionX, _groupPositionY, _groupWidth, _groupHeight];
_browserGroup ctrlCommit 0;
_mapDisplay setVariable ["A3U_markerBrowser_grp", _browserGroup];

private _backgroundControl = _mapDisplay ctrlCreate ["RscText", -1, _browserGroup];
_backgroundControl ctrlSetPosition [0, 0, _groupWidth, _groupHeight];
_backgroundControl ctrlSetBackgroundColor [0, 0, 0, 0.40];
_backgroundControl ctrlCommit 0;

private _titleHeight = 0.035 * safeZoneH;
private _titleControl = _mapDisplay ctrlCreate ["RscText", -1, _browserGroup];
_titleControl ctrlSetPosition [0, 0, _groupWidth, _titleHeight];
_titleControl ctrlSetText "Location Browser";
_titleControl ctrlSetBackgroundColor [0.05, 0.05, 0.05, 1];
_titleControl ctrlCommit 0;

private _rowHeight = 0.028 * safeZoneH;
private _paddingX = 0.010 * safeZoneW;
private _dropdownPositionY = _titleHeight + 0.008 * safeZoneH;

private _categoryCombo = _mapDisplay ctrlCreate ["RscCombo", -1, _browserGroup];
_categoryCombo ctrlSetPosition [_paddingX, _dropdownPositionY, 0.16 * safeZoneW, _rowHeight];
_categoryCombo ctrlCommit 0;
_mapDisplay setVariable ["A3U_markerBrowser_cbCat", _categoryCombo];

private _factionCombo = _mapDisplay ctrlCreate ["RscCombo", -1, _browserGroup];
_factionCombo ctrlSetPosition [_paddingX + (0.18 * safeZoneW), _dropdownPositionY, 0.16 * safeZoneW, _rowHeight];
_factionCombo ctrlCommit 0;
_mapDisplay setVariable ["A3U_markerBrowser_cbFac", _factionCombo];

private _searchHeight = 0.028 * safeZoneH;
private _searchPositionY = _dropdownPositionY + _rowHeight + (0.006 * safeZoneH);

private _searchEdit = _mapDisplay ctrlCreate ["RscEdit", -1, _browserGroup];
_searchEdit ctrlSetPosition [_paddingX, _searchPositionY, _groupWidth - (2 * _paddingX), _searchHeight];
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
        private _placeholderText = _control getVariable ["A3U_markerBrowser_placeholderText", "Search locations..."];
        _control ctrlSetText _placeholderText;
        _control ctrlSetTextColor [0.65, 0.65, 0.65, 1];
        _control setVariable ["A3U_markerBrowser_placeholderActive", true];
    };
}];

private _listControl = _mapDisplay ctrlCreate ["RscListNBox", -1, _browserGroup];
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
    ["All", "__ALL__"], ["Headquarters", "Headquarters"], ["Cities", "Cities"], ["Resources", "Resources"],
    ["Factories", "Factories"], ["Outposts", "Outpost"], ["Seaports", "Seaports"],
    ["Military Bases", "Military Bases"], ["Air Bases", "Air Bases"],
    ["Military Administrations", "Military Administrations"], ["Radio Towers", "Radio Towers"]
] apply {
    _x params ["_label", "_categoryKey"];
    private _rowIndex = _categoryCombo lbAdd _label;
    _categoryCombo lbSetData [_rowIndex, _categoryKey];
};

lbClear _factionCombo;
private _allFactionIndex = _factionCombo lbAdd "All";
_factionCombo lbSetData [_allFactionIndex, "__ALL__"];

private _rebLabel = format ["%1 (reb)", if (([teamPlayer] call _getFactionDisplayNameBySide) == "") then {"Rebels"} else {[teamPlayer] call _getFactionDisplayNameBySide}];
private _occLabel = format ["%1 (occ)", if (([Occupants] call _getFactionDisplayNameBySide) == "") then {"Occupiers"} else {[Occupants] call _getFactionDisplayNameBySide}];
private _invLabel = format ["%1 (inv)", if (([Invaders] call _getFactionDisplayNameBySide) == "") then {"Invaders"} else {[Invaders] call _getFactionDisplayNameBySide}];

_factionCombo lbSetData [_factionCombo lbAdd _rebLabel, "__REB__"];
_factionCombo lbSetData [_factionCombo lbAdd _occLabel, "__OCC__"];
_factionCombo lbSetData [_factionCombo lbAdd _invLabel, "__INV__"];

_factionCombo lbSetData [_factionCombo lbAdd "Destroyed", "__DES__"];

[_categoryCombo, _selectedCategoryKey] call _setComboSelectionByData;
[_factionCombo, _selectedFactionKey] call _setComboSelectionByData;

call _refreshList;

_categoryCombo ctrlAddEventHandler ["LBSelChanged", _onFilterChanged];
_factionCombo ctrlAddEventHandler ["LBSelChanged", _onFilterChanged];
_searchEdit ctrlAddEventHandler ["KeyUp", _onFilterChanged];

_listControl ctrlAddEventHandler ["LBSelChanged", {
    params ["_control", "_rowIndex"];
    if (_rowIndex < 0) exitWith {};

    private _markerName = _control lnbData [_rowIndex, 0];
    if (_markerName == "") exitWith {};

    private _display = ctrlParent _control;
    private _mapControl = _display displayCtrl 51;
    if (isNull _mapControl) exitWith {};

    private _targetMarkerName = _markerName;
    if ((_targetMarkerName find "Dum") == 0) then {
        _targetMarkerName = _targetMarkerName select [3, (count _targetMarkerName) - 3];
    };

    if !(_targetMarkerName in allMapMarkers) exitWith {};

    _mapControl ctrlMapAnimAdd [
        _display getVariable ["A3U_markerBrowser_anim", 1], 
        _display getVariable ["A3U_markerBrowser_zoom", 0.04], 
        getMarkerPos _targetMarkerName
    ];
    ctrlMapAnimCommit _mapControl;
}];
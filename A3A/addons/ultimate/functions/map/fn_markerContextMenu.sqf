#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_markerContextMenu

Description:
    Builds and toggles the contextual action menu for a hovered strategic map
    marker, including optional marker info and garrison details.

Parameters:
    0: _markerName - Marker name or dummy marker name to open the menu for
        <STRING>

Optional:
    1: _screenPosition - Screen position used to anchor the menu <ARRAY>
        (default: [])

Example:
    ["marker_1", getMousePosition] call A3U_fnc_markerContextMenu;

Returns:
    Nothing <NONE>

Environment:
    Client, Unscheduled

Author:
    Maxx
---------------------------------------------------------------------------- */

// Existing A3U_fnc_* public function name kept for backwards compatibility.

if !assert(params [
    ["_markerName", nil, [""]]
]) exitWith {};

private _screenPosition = param [1, [], [[]]];

private _mapDisplay = findDisplay 12;
if (isNull _mapDisplay || {_markerName == ""}) exitWith {};

private _mapControl = _mapDisplay displayCtrl 51;
if (isNull _mapControl) exitWith {};

// Legacy A3U_* display-variable keys are kept for compatibility with the
// existing hover/menu code that already shares these values across files.

private _getOriginalMarkerName = {
    params ["_name"];

    private _originalMarkerName = _name;
    while {
        (count _originalMarkerName) >= 3
        && {(_originalMarkerName select [0, 3]) == "Dum"}
    } do {
        _originalMarkerName = _originalMarkerName select
            [3, (count _originalMarkerName) - 3];
    };

    _originalMarkerName
};

private _findSubstringIndex = {
    params ["_text", "_substring"];

    private _textLength = count _text;
    private _substringLength = count _substring;
    if (_substringLength == 0 || {_textLength < _substringLength}) exitWith {
        -1
    };

    private _substringIndex = -1;
    for "_index" from 0 to (_textLength - _substringLength) do {
        if ((_text select [_index, _substringLength]) == _substring) exitWith {
            _substringIndex = _index;
        };
    };

    _substringIndex
};

private _setButtonState = {
    params [
        "_buttonControl",
        "_enabled",
        ["_tooltipText", "", [""]]
    ];

    _buttonControl ctrlEnable _enabled;

    if (_enabled) then {
        _buttonControl ctrlSetTextColor [1, 1, 1, 1];
        _buttonControl ctrlSetTooltip "";
    } else {
        _buttonControl ctrlSetTextColor [1, 1, 1, 0.35];
        if (_tooltipText != "") then {
            _buttonControl ctrlSetTooltip _tooltipText;
        };
    };
};

private _deleteGarrisonPanel = {
    params ["_display"];

    if (isNull _display) exitWith {};

    private _garrisonGroup = _display getVariable
        ["A3U_mrkMenu_garrGrp", controlNull];
    if (!isNull _garrisonGroup) then {
        ctrlDelete _garrisonGroup;
    };

    _display setVariable ["A3U_mrkMenu_garrGrp", controlNull];
};

private _originalMarkerName = [_markerName] call _getOriginalMarkerName;
private _markerSide = sidesX getVariable [_originalMarkerName, sideUnknown];
private _isPlayerControlled = _markerSide == teamPlayer;

private _isRallyPoint = (toLowerANSI _originalMarkerName) isEqualTo "rallypointmarker";
private _isMilitaryAdministration = _originalMarkerName in milAdministrationsX;

private _destroyedMilitaryAdministrations =
    if (isNil "A3A_destroyedMilAdministrations") then {
        []
    } else {
        A3A_destroyedMilAdministrations
    };

    private _originalMarkerPosition = getMarkerPos _originalMarkerName;

    private _isMilitaryAdministrationDestroyed = _isMilitaryAdministration && {
        _destroyedMilitaryAdministrations findIf {
            !isNull _x && {_originalMarkerPosition distance2D _x < 30}
        } != -1
};

private _hiddenCheckSide = sidesX getVariable [_originalMarkerName, sideUnknown];

private _hoverMetaMap = missionNamespace getVariable ["A3U_mrkHoverMetaMap", createHashMap];
private _markerMetadata = _hoverMetaMap getOrDefault [
    _markerName,
    (_hoverMetaMap getOrDefault [_originalMarkerName, []])
];

private _bodyText = if (
    _markerMetadata isEqualTo [] || {count _markerMetadata < 1}
) then {
    private _markerLabel = markerText _originalMarkerName;
    if (_markerLabel == "") then {
        format ["%1", _originalMarkerName]
    } else {
        _markerLabel
    }
} else {
    _markerMetadata # 0
};

private _flagMarkerType = if (
    _markerMetadata isEqualTo []
    || {count _markerMetadata < 2}
) then {
    ""
} else {
    _markerMetadata # 1
};

private _flagIconPath = "";
if (_flagMarkerType != "") then {
    _flagIconPath = getText
        (configFile >> "CfgMarkers" >> _flagMarkerType >> "icon");
};

private _lineBreakToken = "<br/>";
private _firstLineBreakIndex =
    [_bodyText, _lineBreakToken] call _findSubstringIndex;

private _titleLabel = if (_firstLineBreakIndex >= 0) then {
    _bodyText select [0, _firstLineBreakIndex]
} else {
    _bodyText
};

if (_titleLabel == "") then {
    _titleLabel = markerText _originalMarkerName;

    if (_titleLabel == "") then {
        _titleLabel = _originalMarkerName;
    };

    if (_titleLabel == _originalMarkerName) then {
        private _markerLabel = markerText _markerName;
        if (_markerLabel != "") then {
            _titleLabel = _markerLabel;
        };
    };

    if (_titleLabel == "" || {_titleLabel == _originalMarkerName}) then {
        _titleLabel = _markerName;
    };
};

private _informationText = "";
if (_firstLineBreakIndex >= 0) then {
    _informationText = _bodyText select [
        _firstLineBreakIndex + (count _lineBreakToken),
        (count _bodyText) - (_firstLineBreakIndex + (count _lineBreakToken))
    ];
};

if (_informationText == "") then {
    _informationText = "<t size='0.9'>No additional info.</t>";
};

private _existingMenuGroup = _mapDisplay getVariable
    ["A3U_mrkMenu_grp", controlNull];
private _openMarkerName = _mapDisplay getVariable ["A3U_mrkMenu_marker", ""];

if (!isNull _existingMenuGroup && {_openMarkerName == _markerName}) exitWith {
    ctrlDelete _existingMenuGroup;
    [_mapDisplay] call _deleteGarrisonPanel;
    _mapDisplay setVariable ["A3U_mrkMenu_grp", controlNull];
    _mapDisplay setVariable ["A3U_mrkMenu_marker", ""];
};

if (!isNull _existingMenuGroup) then {
    ctrlDelete _existingMenuGroup;
    [_mapDisplay] call _deleteGarrisonPanel;
    _mapDisplay setVariable ["A3U_mrkMenu_grp", controlNull];
};

private _resolvedScreenPosition = _screenPosition;
if (_resolvedScreenPosition isEqualTo []) then {
    _resolvedScreenPosition =
        _mapControl ctrlMapWorldToScreen (getMarkerPos _markerName);
};

if (_resolvedScreenPosition isEqualTo []) then {
    _resolvedScreenPosition = getMousePosition;
};

private _groupWidth = 0.22 * safeZoneW;
private _groupHeight = 0.16 * safeZoneH;
private _titleBarHeight = 0.028 * safeZoneH;

private _groupPositionX = (_resolvedScreenPosition # 0) + 0.012;
private _groupPositionY = (_resolvedScreenPosition # 1) + 0.018;

private _maximumPositionX =
    safeZoneX + safeZoneW - _groupWidth - (2 * pixelW);
private _maximumPositionY =
    safeZoneY + safeZoneH - _groupHeight - (2 * pixelH);

_groupPositionX =
    (_groupPositionX max (safeZoneX + (2 * pixelW))) min _maximumPositionX;
_groupPositionY =
    (_groupPositionY max (safeZoneY + (2 * pixelH))) min _maximumPositionY;

private _menuGroup = _mapDisplay ctrlCreate ["RscControlsGroupNoScrollbars", -1];
_menuGroup ctrlSetPosition [
    _groupPositionX,
    _groupPositionY,
    _groupWidth,
    _groupHeight
];
_menuGroup ctrlCommit 0;

_mapDisplay setVariable ["A3U_mrkMenu_grp", _menuGroup];
_mapDisplay setVariable ["A3U_mrkMenu_marker", _markerName];
_mapDisplay setVariable ["A3U_mrkMenu_markerOrig", _originalMarkerName];

private _backgroundControl = _mapDisplay ctrlCreate ["RscText", -1, _menuGroup];
_backgroundControl ctrlSetPosition [0, 0, _groupWidth, _groupHeight];
_backgroundControl ctrlSetBackgroundColor [0, 0, 0, 0.55];
_backgroundControl ctrlCommit 0;

private _profileBackgroundColor = [
    profileNamespace getVariable ["GUI_BCG_RGB_R", 0.376],
    profileNamespace getVariable ["GUI_BCG_RGB_G", 0.125],
    profileNamespace getVariable ["GUI_BCG_RGB_B", 0.043],
    1
];

private _titleBarControl = _mapDisplay ctrlCreate ["RscText", -1, _menuGroup];
_titleBarControl ctrlSetPosition [0, 0, _groupWidth, _titleBarHeight];
_titleBarControl ctrlSetBackgroundColor _profileBackgroundColor;
_titleBarControl ctrlCommit 0;

private _titleControl = _mapDisplay ctrlCreate
    ["RscStructuredText", -1, _menuGroup];

private _titleStructuredText = if (_flagIconPath != "") then {
    format [
        "<t size='0.95' valign='middle'><img image='%1' size='1.0'/>  %2</t>",
        _flagIconPath,
        _titleLabel
    ]
} else {
    format [
        "<t size='0.95' valign='middle'>%1</t>",
        _titleLabel
    ]
};

_titleControl ctrlSetStructuredText (parseText _titleStructuredText);

private _titlePositionX = 0.006 * safeZoneW;
private _titleWidth = _groupWidth - (0.012 * safeZoneW);
_titleControl ctrlSetPosition [_titlePositionX, 0, _titleWidth, _titleBarHeight];
_titleControl ctrlCommit 0;

private _titleTextHeight = ctrlTextHeight _titleControl;
if (_titleTextHeight <= 0) then {
    _titleTextHeight = _titleBarHeight;
};

_titleTextHeight = _titleTextHeight min _titleBarHeight;

private _titlePositionY = (_titleBarHeight - _titleTextHeight) / 2;
_titleControl ctrlSetPosition [
    _titlePositionX,
    _titlePositionY,
    _titleWidth,
    _titleTextHeight
];
_titleControl ctrlCommit 0;

private _paddingX = 0.006 * safeZoneW;
private _paddingY = 0.006 * safeZoneH;

private _contentPositionY = _titleBarHeight + _paddingY;
private _contentHeight = _groupHeight - _titleBarHeight - (2 * _paddingY);

private _leftColumnWidth = (_groupWidth - (3 * _paddingX)) / 3;
private _rightColumnWidth = (_groupWidth - (3 * _paddingX)) - _leftColumnWidth;

private _leftColumnPositionX = _paddingX;
private _rightColumnPositionX =
    _paddingX + _leftColumnWidth + _paddingX;

private _leftColumnBackground = _mapDisplay ctrlCreate
    ["RscText", -1, _menuGroup];
_leftColumnBackground ctrlSetPosition [
    _leftColumnPositionX,
    _contentPositionY,
    _leftColumnWidth,
    _contentHeight
];
_leftColumnBackground ctrlSetBackgroundColor [0, 0, 0, 0.25];
_leftColumnBackground ctrlCommit 0;

private _rightColumnBackground = _mapDisplay ctrlCreate
    ["RscText", -1, _menuGroup];
_rightColumnBackground ctrlSetPosition [
    _rightColumnPositionX,
    _contentPositionY,
    _rightColumnWidth,
    _contentHeight
];
_rightColumnBackground ctrlSetBackgroundColor [0, 0, 0, 0.10];
_rightColumnBackground ctrlCommit 0;

private _informationControl = _mapDisplay ctrlCreate
    ["RscStructuredText", -1, _menuGroup];
_informationControl ctrlSetPosition [
    _rightColumnPositionX + (_paddingX * 0.5),
    _contentPositionY + (_paddingY * 0.5),
    _rightColumnWidth - _paddingX,
    _contentHeight - _paddingY
];
_informationControl ctrlSetStructuredText (parseText _informationText);
_informationControl ctrlCommit 0;

[_mapDisplay] call _deleteGarrisonPanel;

private _garrisonCount =
    count (garrison getVariable [_originalMarkerName, []]);
if (
    !_isRallyPoint
    && {!_isMilitaryAdministration}
    && {_isPlayerControlled}
    && {_garrisonCount > 0}
) then {
    private _garrisonInfoRaw =
        [_originalMarkerName] call A3A_fnc_garrisonInfo;
    private _garrisonInfoText = _garrisonInfoRaw;

    private _garrisonStartIndex =
        [_garrisonInfoRaw, "Squad Leaders:"] call _findSubstringIndex;
    if (_garrisonStartIndex >= 0) then {
        _garrisonInfoText = _garrisonInfoRaw select [
            _garrisonStartIndex,
            (count _garrisonInfoRaw) - _garrisonStartIndex
        ];
    };

    if (_garrisonInfoText != "") then {
        private _garrisonGap = 0.003 * safeZoneW;
        private _garrisonGroupWidth = 0.10 * safeZoneW;
        private _garrisonGroupHeight = 0.31 * safeZoneH;
        private _garrisonTitleHeight = _titleBarHeight;

        private _garrisonPositionX =
            _groupPositionX + _groupWidth + _garrisonGap;
        if (
            (_garrisonPositionX + _garrisonGroupWidth)
            > (safeZoneX + safeZoneW - (2 * pixelW))
        ) then {
            _garrisonPositionX =
                _groupPositionX - _garrisonGap - _garrisonGroupWidth;
        };

        private _garrisonPositionY = _groupPositionY;
        private _garrisonMaximumX =
            safeZoneX + safeZoneW - _garrisonGroupWidth - (2 * pixelW);
        private _garrisonMaximumY =
            safeZoneY + safeZoneH - _garrisonGroupHeight - (2 * pixelH);

        _garrisonPositionX =
            (_garrisonPositionX max (safeZoneX + (2 * pixelW)))
            min _garrisonMaximumX;
        _garrisonPositionY =
            (_garrisonPositionY max (safeZoneY + (2 * pixelH)))
            min _garrisonMaximumY;

        private _garrisonGroup = _mapDisplay ctrlCreate
            ["RscControlsGroupNoScrollbars", -1];
        _garrisonGroup ctrlSetPosition [
            _garrisonPositionX,
            _garrisonPositionY,
            _garrisonGroupWidth,
            _garrisonGroupHeight
        ];
        _garrisonGroup ctrlCommit 0;

        private _garrisonBackground = _mapDisplay ctrlCreate
            ["RscText", -1, _garrisonGroup];
        _garrisonBackground ctrlSetPosition
            [0, 0, _garrisonGroupWidth, _garrisonGroupHeight];
        _garrisonBackground ctrlSetBackgroundColor [0, 0, 0, 0.55];
        _garrisonBackground ctrlCommit 0;

        private _garrisonTitleBar = _mapDisplay ctrlCreate
            ["RscText", -1, _garrisonGroup];
        _garrisonTitleBar ctrlSetPosition
            [0, 0, _garrisonGroupWidth, _garrisonTitleHeight];
        _garrisonTitleBar ctrlSetBackgroundColor _profileBackgroundColor;
        _garrisonTitleBar ctrlCommit 0;

        private _garrisonTitleControl = _mapDisplay ctrlCreate
            ["RscStructuredText", -1, _garrisonGroup];
        private _garrisonTitleText = format [
            "<t size='0.95' valign='middle'>%1</t>",
            localize "STR_A3A_garrison_header"
        ];
        _garrisonTitleControl ctrlSetStructuredText
            (parseText _garrisonTitleText);

        private _garrisonTitlePositionX = 0.006 * safeZoneW;
        private _garrisonTitleWidth =
            _garrisonGroupWidth - (0.012 * safeZoneW);
        _garrisonTitleControl ctrlSetPosition [
            _garrisonTitlePositionX,
            0,
            _garrisonTitleWidth,
            _garrisonTitleHeight
        ];
        _garrisonTitleControl ctrlCommit 0;

        private _garrisonTitleTextHeight =
            ctrlTextHeight _garrisonTitleControl;
        if (_garrisonTitleTextHeight <= 0) then {
            _garrisonTitleTextHeight = _garrisonTitleHeight;
        };

        _garrisonTitleTextHeight =
            _garrisonTitleTextHeight min _garrisonTitleHeight;

        private _garrisonTitlePositionY =
            (_garrisonTitleHeight - _garrisonTitleTextHeight) / 2;
        _garrisonTitleControl ctrlSetPosition [
            _garrisonTitlePositionX,
            _garrisonTitlePositionY,
            _garrisonTitleWidth,
            _garrisonTitleTextHeight
        ];
        _garrisonTitleControl ctrlCommit 0;

        private _garrisonPaddingX = 0.006 * safeZoneW;
        private _garrisonPaddingY = 0.006 * safeZoneH;

        private _garrisonInfoControl = _mapDisplay ctrlCreate
            ["RscStructuredText", -1, _garrisonGroup];
        _garrisonInfoControl ctrlSetPosition [
            _garrisonPaddingX,
            _garrisonTitleHeight + _garrisonPaddingY,
            _garrisonGroupWidth - (2 * _garrisonPaddingX),
            _garrisonGroupHeight - _garrisonTitleHeight
                - (2 * _garrisonPaddingY)
        ];
        _garrisonInfoControl ctrlSetStructuredText
            (parseText _garrisonInfoText);
        _garrisonInfoControl ctrlCommit 0;

        _mapDisplay setVariable ["A3U_mrkMenu_garrGrp", _garrisonGroup];
    };
};

private _isCommander = player isEqualTo theBoss;

private _buttonCount = 4;
private _buttonGap = 0.004 * safeZoneH;

private _buttonHeight =
    (_contentHeight - (_buttonGap * (_buttonCount - 1))) / _buttonCount;
private _buttonWidth = _leftColumnWidth - _paddingX;
private _buttonPositionX = _leftColumnPositionX + (_paddingX * 0.5);

private _topBottomPadding = _paddingY * 0.5;
private _buttonPositionY = _contentPositionY + _topBottomPadding;

private _fastTravelButton = _mapDisplay ctrlCreate
    ["A3U_RscContextButton", -1, _menuGroup];
_fastTravelButton ctrlSetPosition [
    _buttonPositionX,
    _buttonPositionY,
    _buttonWidth,
    _buttonHeight
];
_fastTravelButton ctrlSetText
    localize "STR_antistasi_dialogs_main_fast_travel";
_fastTravelButton ctrlCommit 0;

_fastTravelButton ctrlAddEventHandler ["ButtonClick", {
    params ["_control"];

    private _display = ctrlParent _control;
    private _markerName = _display getVariable ["A3U_mrkMenu_markerOrig", ""];
    if (_markerName == "") exitWith {};

    [_markerName] spawn A3A_fnc_fastTravelRadio;
}];

private _fastTravelAllowed =
    _isPlayerControlled && {!_isMilitaryAdministrationDestroyed};

private _fastTravelTooltip = if (_isMilitaryAdministrationDestroyed) then {
    localize "STR_A3U_HOVER_DESTROYED_MILADMIN"
} else {
    localize "STR_A3U_CONTEXT_FASTTRAVEL_PLAYER_ONLY"
};

[_fastTravelButton, _fastTravelAllowed, _fastTravelTooltip]
    call _setButtonState;

_buttonPositionY = _buttonPositionY + _buttonHeight + _buttonGap;

private _garrisonButton = _mapDisplay ctrlCreate
    ["A3U_RscContextButton", -1, _menuGroup];
_garrisonButton ctrlSetPosition [
    _buttonPositionX,
    _buttonPositionY,
    _buttonWidth,
    _buttonHeight
];
_garrisonButton ctrlSetText localize "STR_A3A_garrison_header";
_garrisonButton ctrlCommit 0;

_garrisonButton ctrlAddEventHandler ["ButtonClick", {
    params ["_control"];

    private _display = ctrlParent _control;
    private _markerName = _display getVariable ["A3U_mrkMenu_markerOrig", ""];
    if (_markerName == "") exitWith {};

    ["add", _markerName] spawn A3A_fnc_garrisonDialog;
    ["off"] call SCRT_fnc_ui_toggleMenuBlur;
}];

private _isBlackMarketTrader =
    (toLowerANSI _originalMarkerName) isEqualTo "tradermarker";

private _isFiaBuildZone = _originalMarkerName in (
    watchpostsFIA
    + roadblocksFIA
    + aapostsFIA
    + atpostsFIA
    + hmgpostsFIA
);

private _garrisonAllowed = _isPlayerControlled
    && {_isCommander}
    && {!_isRallyPoint}
    && {!_isBlackMarketTrader}
    && {!_isFiaBuildZone}
    && {!_isMilitaryAdministration};

private _garrisonTooltip = localize (switch true do {
    case _isRallyPoint: {
        "STR_A3U_CONTEXT_GARRISON_RALLYPOINT_BLOCKED"
    };
    case _isBlackMarketTrader: {
        "STR_A3U_CONTEXT_GARRISON_TRADER_BLOCKED"
    };
    case _isFiaBuildZone: {
        "STR_A3U_CONTEXT_GARRISON_FIA_BLOCKED"
    };
    default {
        "STR_A3U_CONTEXT_GARRISON_REQUIREMENTS"
    };
});

[_garrisonButton, _garrisonAllowed, _garrisonTooltip]
    call _setButtonState;

private _closeButtonPositionY =
    _contentPositionY + _contentHeight - _topBottomPadding - _buttonHeight;

private _closeButton = _mapDisplay ctrlCreate
    ["A3U_RscContextButton", -1, _menuGroup];
_closeButton ctrlSetPosition [
    _buttonPositionX,
    _closeButtonPositionY,
    _buttonWidth,
    _buttonHeight
];
_closeButton ctrlSetText "Close";
_closeButton ctrlCommit 0;

_closeButton ctrlAddEventHandler ["ButtonClick", {
    params ["_control"];

    private _display = ctrlParent _control;
    private _menuGroup = _display getVariable ["A3U_mrkMenu_grp", controlNull];
    private _garrisonGroup = _display getVariable
        ["A3U_mrkMenu_garrGrp", controlNull];

    if (!isNull _menuGroup) then {
        ctrlDelete _menuGroup;
    };

    if (!isNull _garrisonGroup) then {
        ctrlDelete _garrisonGroup;
    };

    _display setVariable ["A3U_mrkMenu_grp", controlNull];
    _display setVariable ["A3U_mrkMenu_garrGrp", controlNull];
    _display setVariable ["A3U_mrkMenu_marker", ""];
}];

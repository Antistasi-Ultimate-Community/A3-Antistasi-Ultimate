#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_dynamic_hover_menu_fnc_collectMapContextMenuItems

Description:
    Collect entries to be displayed in dynamic map context menu.

Parameters:
    0: _marker - Marker for which to display context menu <STRING>
    1: _player - Player for which to display context menu <OBJECT>

Optional:

Example:

Returns:
    <ARRAY> Array of context menu entries.

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(collectMapContextMenuItems),_this);

if !assert(params[
    ["_marker", nil, [""]],
    ["_player", nil, [objNull]]
]) exitWith {};

private _isBlackMarketTrader = toLowerANSI _marker isEqualTo "tradermarker";
private _isCommander = _player isEqualTo theBoss;
private _isDestroyed = [_marker] call A3A_fnc_isSiteDestroyed;
private _isRallyPoint = toLowerANSI _marker isEqualTo "rallypointmarker";
private _isMilitaryAdministration = _marker in milAdministrationsX;
private _isPlayerControlled = sidesX getVariable[_marker, sideUnknown] isEqualTo teamPlayer;

private _activeItems = createHashMap;
private _index = -1;
private _items = QUOTE(getText(_x >> 'statement') isNotEqualTo '') configClasses(configFile >> "A3U" >> "CfgMapContextMenu" >> "Location") select {
    private _condition = getText(_x >> "condition");
    private _active = (_condition isEqualTo "true") || { [_marker, _player] call compile _condition };

    _activeItems set[configName _x, _active];

    _active || { getNumber(_x >> "showIfDisabled") != 0 };
} apply {
    INC(_index);
    [
        getNumber(_x >> "priority"), _index,
        createHashMapFromArray[
            ["active", _activeItems get configName _x],
            ["closeContextMenu", getNumber(_x >> "closeContextMenu") != 0],
            ["closeMap", getNumber(_x >> "closeMap") != 0],
            ["config", _x],
            ["icon", getText(_x >> "icon")],
            ["parameters", getArray(_x >> "parameters")],
            ["showIfDisabled", getNumber(_x >> "showIfDisabled") != 0],
            ["statement", compile getText(_x >> "statement")],
            ["title", getText(_x >> "title")],
            ["tooltip", getText(_x >> "tooltip")],
            ["tooltipDisabled", getText(_x >> "tooltipDisabled")]
        ]
    ];
};

_items sort true;
_items apply { _x select -1 };

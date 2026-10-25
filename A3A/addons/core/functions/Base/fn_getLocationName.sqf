#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_getLocationName

Description:
    Return location marker name based on location type

Parameters:
    0: _marker - Location marker name <STRING>

Optional:
    1: _wrap - Wrap location name with location type <BOOL> (default: false)

Example:
    (begin example)
    ["outpost_3"] call A3A_fnc_getLocationName; // --> Thunder Ridge
    ["outpost_3", true] call A3A_fnc_getLocationName; // --> Thunder Ridge Outpost
    (end example)

Returns:
    Location marker name <STRING> or nil, if marker not associable

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
if !assert(params[
    ["_marker", nil, [""]]
]) exitWith {};

private _wrap = param[1, false, [true]];

if (isNil QGVAR(locationNamesCache)) then {
    GVAR(locationNamesCache) = createHashMap;
    GVAR(locationNamesRepository) = [
        // nsArray, fallbackStr, wrapStr, locationNamesStr, condition
        ["airportsX", "STR_localizar_airbase", "STR_airbase", "STR_A3AU_airfieldNames"],
        ["controlsX", "STR_localizar_roadblock", "", nil, {isOnRoad markerPos _this}],
        ["controlsX", "STR_localizar_outskirts"],
        ["factories", "STR_factory"],
        ["milbases", "STR_localizar_milbase", "STR_milbase", "STR_A3AU_milbaseNames"],
        ["milAdministrationsX", "STR_milAdministration"],
        ["mrkAntennas", "STR_radiotower"],
        ["outposts", "STR_localizar_outpost", "STR_outpost", "STR_A3AU_outpostNames"],
        ["resourcesX", "STR_resources"],
        ["seaports", "STR_localizar_riverport", "STR_port_river", "STR_A3AU_seaportNames", {[] call A3A_fnc_isRiverportMap}],
        ["seaports", "STR_localizar_seaport", "STR_port_sea", "STR_A3AU_seaportNames"]
    ] apply {
        _x params["_key", "_fallback", ["_wrapStr", ""], ["_namesLocalization", nil], ["_condition", {true}, [{}]]];

        if (isNil "_namesLocalization") then {
            [_key, _fallback, _wrapStr, [], _condition];
        } else {
            [_key, _fallback, _wrapStr, localize _namesLocalization splitString "|", _condition];
        };
    };
};

private _markerKey = format["%1:%2", ["norm", "wrap"] select _wrap, _marker];
private _name = GVAR(locationNamesCache) get _markerKey;

if (isNil "_name") then {
    private _index = GVAR(locationNamesRepository) findIf {
        _x params["_key","","","","_condition"];

        (_marker in (missionNamespace getVariable _key)) &&
        {_marker call _condition};
    };

    if !assert(_index >= 0) exitWith { Error_1("Location marker '%1' not found in any location type.",_marker) };

    (GVAR(locationNamesRepository) select _index) params["_key", "_fallback", "_wrapStr", "_names"];

    _index = (missionNamespace getVariable _key) find _marker;

    if !assert(_index >= 0) exitWith { Error_2("Location marker '%1' not found in location type '%2'.",_marker,_key) };

    if (_index < count _names) then {
        _name = _names select _index;
        if (_wrap && { _wrapStr isNotEqualTo "" }) then {
            _name = format[localize _wrapStr, _name];
        };
    } else {
    	private _city = [citiesX, markerPos _marker] call BIS_fnc_nearestPosition;
        _name = format[localize _fallback, _city];
    };

    GVAR(locationNamesCache) set[_markerKey, _name];
};

RETNIL(_name);

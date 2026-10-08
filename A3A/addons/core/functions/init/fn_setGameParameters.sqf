#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_setGameParameters

Description:
    Apply game parameters from input hashmap

Parameters:
    0: _parameters - Parameter hashmap <HASHMAP>

Optional:
    1: _propagateAll - whether to propagate all parameters to clients or only
        changes from input parameters (default: false) <BOOL>

Example:
    (begin example)
    [_parameters] call A3A_fnc_setGameParameters;
    (end example)

Returns:
    Nothing

Environment:
    Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(setGameParameters),_this);

if !assert(params[
    ["_parameters", nil, [createHashMap]]
]) exitWith {};

if !assert(isServer) exitWith {};
if !assert(!isNil "A3A_saveData") exitWith {};

private _propagateAll = param[1, false, [true]];

if (isNil QGVAR(gameParameters)) then {
    GVAR(gameParameters) = createHashMapFromArray(
        "true" configClasses(configFile >> "A3A" >> "Params") select {
            getArray(_x >> "values") isNotEqualTo [""];
        } apply {
            [configName _x, [getNumber(_x >> "default"), getArray(_x >> "values") isEqualTo [0, 1]]];
        };
    );
};

private _updates = createHashMap;
private _updateParams = keys([_parameters, GVAR(gameParameters)] select _propagateAll);

_updateParams apply {
    private _key = _x;

    if !(_key in GVAR(gameParameters)) then {
        Error_1("skipping unknown game parameter ""%1""",_key);
    } else {
        GVAR(gameParameters) get _key params["_defaultValue", "_boolConvert"];

        private _value = _parameters getOrDefault[_key, _defaultValue];

        if (_boolConvert && { !(_value isEqualType true) }) then { _value = _value isNotEqualTo 0 };
        if (!_boolConvert && { _value isEqualType true }) then { _value = parseNumber _value };

        Trace_3(QFUNCMAIN(setGameParameters),_key,_value,_boolConvert);

        _updates set[_key, _value];
    };
};

// WHY do we keep parameters as an array
private _savedParams = createHashMapFromArray(A3A_saveData get "params");
_savedParams merge[_updates, true];
A3A_saveData set["params", _savedParams toArray false];

_updates apply {
    missionNamespace setVariable[_x, _y, true];
};

nil;

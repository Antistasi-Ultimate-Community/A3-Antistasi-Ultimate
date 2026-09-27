#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_validateExtenderCompat

Description:
    Validates the compatibility of the extender with the current version

Parameters:
    0: _config - some mod's CfgPatches entry <CONFIG>

Optional:

Example:

Returns:
    <HASHMAP> containing the compatibility status of the extender

Environment:
    Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(validateExtenderCompat),_this);

if !assert(params[
    ["_config", nil, [configNull]]
]) exitWith {};

#define AUGMENT_PROPERTY(type,name,defaultValue) (if (is##type(_config >> QUOTE(name))) then { \
    _extender set[QUOTE(name), get##type(_config >> QUOTE(name))]; \
} else { \
    if (!isNil "_addonRootConfig" && { is##type(_addonRootConfig >> QUOTE(name)) }) then { \
        _extender set[QUOTE(name), get##type(_addonRootConfig >> QUOTE(name))]; \
    } else { \
        _extender set[QUOTE(name), defaultValue]; \
    }; \
})

private _ourVersion = parseNumber([VERSION_AR_FULL] select[0, 2] joinString ".");
private _extender = createHashMapFromArray[
    ["compatDeclared", 0],
    ["compatReason", "compatible"],
    ["compatStatus", 0], // 0=all good, 1=incompatible, 2=might be compatible
    ["extender", configName _config]
];

private _addonRootConfig = if !(isText(_config >> "addonRootClass")) then {
    nil;
} else {
    configFile >> "CfgPatches" >> getText(_config >> "addonRootClass");
};

AUGMENT_PROPERTY(Text,author,"Unknown");
AUGMENT_PROPERTY(Text,name,configName _config);
AUGMENT_PROPERTY(Number,version,0);
AUGMENT_PROPERTY(Array,A3A_compatibility,configNull);

try {
    if !(_extender get "A3A_compatibility" isEqualType []) then {
        throw ["missing A3A_compatibility information or it's not an array", 1];
    };

    private _compatVersion = _extender get "A3A_compatibility";

    if !assert(_compatVersion params[
        ["_major", nil, [0]],
        ["_minor", nil, [0]]
    ]) then {
        throw ["A3A_compatibility needs to be an array with two integer elements", 1];
    };

    _compatVersion = parseNumber format["%1.%2", _major, _minor];
    _extender set["compatDeclared", _compatVersion];

    if (_major > MAJOR) then {
        throw ["can't declare compatibility for a higher major version", 1];
    };

    if (_minor > MINOR) then {
        throw ["can't declare compatibility for a higher minor version", 1];
    };

    if (MINOR > 0 && {_minor isEqualTo 0}) then {
        throw ["only declared compatibility for major versions", 2];
    };

    if (_compatVersion < _ourVersion) then {
        throw ["compatibility version is lower than our version", 1];
    };
} catch {
    _exception params["_reason","_status"];
    _extender set["compatReason", _reason];
    _extender set["compatStatus", _status];
};

_extender;

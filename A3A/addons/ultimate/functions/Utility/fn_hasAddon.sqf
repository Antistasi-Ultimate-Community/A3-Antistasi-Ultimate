#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_class", ""]];

if (_class isEqualTo "") exitWith {false};

private _check = [];

if (_class isEqualType []) exitWith {
    {
        if (isClass (configFile >> "cfgPatches" >> _x)) then {
            Verbose_1("CfgPatches class %1 does exist.", _x);
            _check pushBack true;
        } else {
            Verbose_1("CfgPatches class %1 does not exist.", _x);
            _check pushBack false;
        };
    } forEach _class;
    if (false in _check) exitWith {false};
    true
};

if (isClass (configFile >> "cfgPatches" >> _class)) then {
    true
} else {
    false
};
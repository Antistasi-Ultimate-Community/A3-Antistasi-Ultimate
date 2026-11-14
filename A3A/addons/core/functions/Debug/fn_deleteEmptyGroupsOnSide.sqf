#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_side"];

if (isNil "_side" || {typeName _side != "SIDE"}) exitWith {Error("Cannot empty groups on bad side")};

(allGroups select {side _x == _side && units _x isEqualTo [] && local _x}) apply {deleteGroup _x};

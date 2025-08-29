#include "..\..\script_component.hpp"

[{
    params["_unit"];
    alive _unit;
}, "isNotDeadPlayer"] call A3A_fnc_addInteractionCondition;

[{
    params["","_target"];
    alive _target;
}, "isNotDeadTarget"] call A3A_fnc_addInteractionCondition;

[{
    params["_unit","_target"];
    _unit distance _target < 10;
}, "isNotOutOfRange"] call A3A_fnc_addInteractionCondition;

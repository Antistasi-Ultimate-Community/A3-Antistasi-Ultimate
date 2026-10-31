params ["_level"];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if(_level == 1) exitWith {localize "STR_info_bar_aggr_1"};
if(_level == 2) exitWith {localize "STR_info_bar_aggr_2"};
if(_level == 3) exitWith {localize "STR_info_bar_aggr_3"};
if(_level == 4) exitWith {localize "STR_info_bar_aggr_4"};
if(_level == 5) exitWith {localize "STR_info_bar_aggr_5"};

Error_1("Bad level recieved, cannot generate string, was %1",_level);


"None"

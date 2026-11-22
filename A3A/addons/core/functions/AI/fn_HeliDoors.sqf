#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_helicopter", "_state"];

private _helicopter = _this#0;
private _state = _this#1;

switch _state do
{
    case "open": { _state = 1; };
    case "close": { _state = 0; };
};
_helicopter animateDoor ["Door_Cargo", _state];        // Mi-24V (CSLA) cargo doors
_helicopter animateDoor ["door_2_2_source", _state];   // VBH 1 (GM) right door
_helicopter animateDoor ["door_2_1_source", _state];   // VBH 1 (GM) left door
_helicopter animateDoor ["Door_Back_L", _state];       // Mohawk back door Left
_helicopter animateDoor ["Door_Back_R", _state];       // Mohawk back door Right
_helicopter animateDoor ["door_cargo_left", _state];   // Cougar
_helicopter animateDoor ["Door_L", _state];            // Ghosthawk
_helicopter animateDoor ["Door_L_source", _state];     // Huron front door
_helicopter animateDoor ["Door_rear_source", _state];  // Huron rear door
_helicopter animateDoor ["door_1", _state];            // Wildcat
_helicopter animateDoor ["Door_4_source", _state];     // Taru right door
_helicopter animateDoor ["Door_5_source", _state];     // Taru left door
_helicopter animate ["dvere1_posunZ",_state];          // Orca
_helicopter animate ["side_door", _state];             // Mi-17 (CSLA) side door
sleep 0.3; 
_helicopter animateDoor ["Door_1_source", _state];     // Y-32 Xi'an/V-44X
_helicopter animateDoor ["cargoramp_source", _state];  // CH-53G (GM) ramp
_helicopter animateDoor ["CargoRamp_Open", _state];    // Cougar
_helicopter animateDoor ["door_cargo_right", _state];  // Cougar
_helicopter animateDoor ["Door_R", _state];            // Ghosthawk
_helicopter animateDoor ["Door_R_source", _state];     // Huron front door
_helicopter animateDoor ["door_2", _state];            // Wildcat
_helicopter animateDoor ["Door_6_source", _state];     // Taru ramp
_helicopter animate ['vrata_right_big', _state];       // Mi-17 (CSLA) rear door
_helicopter animate ['vrata_left_big', _state];        // Mi-17 (CSLA) still rear door
_helicopter animate ['vrata_right_small', _state];     // Mi-17 (CSLA) yep stil door
_helicopter animate ['vrata_left_small', _state];      // Mi-17 (CSLA) reeeeeaaar door
_helicopter animate ["dvere2_posunZ",_state];          // Orca

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_pod", "_state"];

private _pod = _this#0;
private _state = _this#1;

switch _state do
{
    case "open": { _state = 1;};
    case "close": { _state = 0;};
};
_pod animateDoor ["Door_4_source", _state];     // Taru right door
_pod animateDoor ["Door_5_source", _state];     // Taru left door
_pod animate ["Door_4_source", _state];         // Taru right door
_pod animate ["Door_5_source", _state];         // Taru left door
_pod animate ["Doors", _state];                 // OPTRE HEV pod
_pod animateDoor ["Doors", _state];             // OPTRE HEV pod
_pod animateDoor ["deploy", _state];            // SW CIS droid despancer
_pod animate ["deploy", _state];                // SW CIS droid despancer
_pod animateDoor ["open_door", _state];         // SW REPABLIC/EMPIRE pod
_pod animate ["open_door", _state];             // SW REPABLIC/EMPIRE pod
_pod animateDoor ["open_door_2", _state];       // SW REPABLIC/EMPIRE pod
_pod animate ["open_door_2", _state];           // SW REPABLIC/EMPIRE pod
_pod animateDoor ["Ramp", _state];              // SW REPABLIC/EMPIRE pod
_pod animate ["Ramp", _state];                  // SW REPABLIC/EMPIRE pod
sleep 0.3; 
_pod animateDoor ["Door_6_source", _state];     // Taru ramp
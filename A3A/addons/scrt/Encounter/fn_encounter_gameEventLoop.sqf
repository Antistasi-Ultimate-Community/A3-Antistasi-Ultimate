/*  This loop checks if condition for random game events are met.
    Execution on: Server

    Scope: Internal

    Params:
        None

    Returns:
        Nothing
*/

#include "..\defines.inc"
FIX_LINE_NUMBERS()

if(!isServer) exitWith {};

Info("Random Events Loop Init.");

isEventInProgress = false;

private _chance = 5;
private _isEventProcced = false;

while {true} do {
    waitUntil {!isNil "A3A_activePlayerCount"};

    if (isEventInProgress || {A3A_activePlayerCount == 0}) then { 
        sleep 450; 
        continue;
    };

    _isEventProcced = (random 100) < _chance;

    if (_isEventProcced) then {
        Info_1("Event check successful, had the %1 chance.",str _chance);
        isEventInProgress = true;
        _chance = 0;

        [] call SCRT_fnc_encounter_selectAndExecuteEvent;
    } else {
        Info_1("Event hasn't rolled, current roll chance: %1.",str _chance);
        _chance = _chance + (random [1,2,4]);
    };

    sleep 450;
};

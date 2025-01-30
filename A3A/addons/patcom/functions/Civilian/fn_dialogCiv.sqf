/*
    Author:
        MaxxLite
    
    Description:
        Adds dialog action to civs and selects a rescue mission
    
    Params:
        _civUnit <unit> <Default: nil>
    
    Usage:
        [_civUnit] call A3A_fnc_dialogCiv;
    
    Return:
        _return <TYPE>
*/


#include "..\..\script_component.hpp"
private _debugStatus = format ["[Civ Dialog] | Civ Hold Action | caller: %1 Civ Unit: %2", _caller, _civUnit];
params ["_civUnit", nil];
[
    _civUnit,
    localize "STR_antistasi_actions_talk_with_civ",
    "\a3\ui_f\data\igui\cfg\simpletasks\types\unknown_ca", "\a3\ui_f\data\igui\cfg\simpletasks\types\talk_ca.paa",
    "true", "true",
    {            
        _caller globalChat (selectRandom [
            localize "STR_antistasi_actions_talk_with_civ_question1",
            localize "STR_antistasi_actions_talk_with_civ_question2",
            localize "STR_antistasi_actions_talk_with_civ_question3"
        ]);
        diag_log format ["[Maxxs work action] caller: %1 Civ Unit: %2", _caller, _civUnit];
    },
    {},
    {
        [_civUnit] call A3A_fnc_dialogCivFinished;
    },
    {            
        _caller globalChat (selectRandom [
            localize "STR_antistasi_actions_talk_with_civ_interruption1",
            localize "STR_antistasi_actions_talk_with_civ_interruption2"
        ]);
    },
    [_civUnit], 2, nil, true, false
] remoteExec ["BIS_fnc_holdActionAdd", 0]; // hold interaction to talk with a civ.
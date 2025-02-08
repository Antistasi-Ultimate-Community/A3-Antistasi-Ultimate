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
params ["_civUnit", ObjNull];
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
        private _debugStatus = format ["[Civ Dialog] | Civ Hold Action | caller: %1 Civ Unit: %2", _caller, _this select 0];
    },
    {},
    {
        [_this select 0] call A3A_fnc_dialogCivFinished;
    },
    {            
        _caller globalChat (selectRandom [
            localize "STR_antistasi_actions_talk_with_civ_interruption1",
            localize "STR_antistasi_actions_talk_with_civ_interruption2"
        ]);
    },
    [_civUnit], 2, nil, true, false
] remoteExec ["BIS_fnc_holdActionAdd", 0]; // hold interaction to talk with a civ.
/*
    Author:
        MaxxLite
    
    Description:
        Adds the action to dialog with _unit locally
    
    Params:
        _unit <Default: ObjNull>
    
    Dependencies:
        N/A
    
    Scope:
        Client
    
    Environment:
        Unscheduled
    
    Usage:
        [_unit] call A3A_fnc_dialogCiv;
    
    Return:
        false if failure is handled
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_unit", ObjNull]];

[
    _unit,
    localize "STR_antistasi_actions_talk_with_civ",
    "\a3\ui_f\data\igui\cfg\simpletasks\types\unknown_ca", "\a3\ui_f\data\igui\cfg\simpletasks\types\talk_ca.paa",
    "true", "true",
    {
        private _question = selectRandom [
            localize "STR_antistasi_actions_talk_with_civ_question1",
            localize "STR_antistasi_actions_talk_with_civ_question2",
            localize "STR_antistasi_actions_talk_with_civ_question3"
        ]; 
         
        [_caller, _question] remoteExec ["globalChat", _caller];
    },
    {},
    {
        [_target, _caller] remoteExecCall ["A3A_fnc_dialogCivFinished", 2]; // server should be handling this
    },
    {
        private _interruption = selectRandom [
            localize "STR_antistasi_actions_talk_with_civ_interruption1",
            localize "STR_antistasi_actions_talk_with_civ_interruption2"
        ];

        [_target, _interruption] remoteExec ["globalChat", _caller];
    },
    [], 2, nil, true, false
] call BIS_fnc_holdActionAdd;
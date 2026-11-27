#include "..\..\script_component.hpp"
/*
    Maintainer:
        Creep'nCrunch / jwoodruff40
    
    Description:
        Wrapper around BIS_fnc_taskCreate, to simplify / centralize task localization and task update handling 
    
    Params:
        0. _type - Type of task (e.g. "AS", "CON", "CONVOY", etc) <STRING>
        1. _params - Parameters to be passed to BIS_fnc_taskCreate (see https://community.bistudio.com/wiki/BIS_fnc_taskCreate) <ARRAY>
        2. _state - State of the task (e.g. "CREATED", "ASSIGNED", "SUCCEEDED", "FAILED") <STRING>
    
    Dependencies:
        BIS_fnc_taskCreate, A3A_fnc_localize_format_taskSetDescription, A3A_fnc_taskUpdate
    
    Scope:
        Server
    
    Environment:
        Unscheduled
    
    Usage:
        [PARAMS] call A3A_fnc_taskCreate;
    
    Return:
        Nothing
*/
params [
    ["_type", "", [""]], // type of task, for fn_taskUpdate (e.g. "AS", "CON", "CONVOY", etc )
    ["_params", [], [[]]], // params to be passed to BIS_fnc_taskCreate
    ["_state", "CREATED", [""]] // state of the task (e.g. "CREATED", "ASSIGNED", "SUCCEEDED", "FAILED")
];

private _taskID = _params param [1, "", ["",[]]];
private _descArr = _params param [2, [], [[],""]];

Debug_2("Creating task %1 with params: %2",_taskID,_params);
_params call BIS_fnc_taskCreate;

if (_type isNotEqualTo "") then { [_taskID, _type, _state] remoteExecCall ["A3A_fnc_taskUpdate", 2] };

[_taskID, _descArr] remoteExecCall ["A3A_fnc_localize_format_taskSetDescription", 0];

nil;

/*
    Author:
        Silence
    
    Description:
        Adds EH's related to blowing explosive cargo up
    
    Params:
        _cargo <OBJECT>
    
    Dependencies:
        N/A
    
    Scope:
        Server
    
    Environment:
        Unscheduled
    
    Usage:
        [_cargo] call A3U_fnc_LOG_delivery_addEHExplosive;
    
    Return:
        _array of EH id's <ARRAY<INT>>
*/

params ["_cargo"];

private _ehKilled = _cargo addEventHandler ["Killed", {
    params ["_cargo", "_killer"];

    [_cargo] spawn A3U_fnc_LOG_delivery_ehExplosive;
}];

[_ehKilled];
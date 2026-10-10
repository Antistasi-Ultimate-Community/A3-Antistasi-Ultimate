/*
    Author:
        jwoodruff40 / Creep'nCrunch
    
    Description:
        Generates a unique save ID for the campaign, avoiding collisions with existing IDs.
        Uses CBA_fnc_createUUID to generate the version 4 UUID itself,
        but ensures the last 5 digits are unique within the existing save IDs since we display only those in the setup UI.
    
    Params:
        None
    
    Dependencies:
        A3A_fnc_collectSaveData
    
    Scope:
        Server
    
    Environment:
        Unscheduled
    
    Usage:
        [] call A3A_fnc_generateSaveID;
    
    Return:
        _newID <STRING>
*/

[] call CBA_fnc_createUUID;

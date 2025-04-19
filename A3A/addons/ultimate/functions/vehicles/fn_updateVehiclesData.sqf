/*
    Author:
        Creep'nCrunch
    
    Description:
        Updates the occupier / invader faction data hashmaps (e.g. A3A_faction_occ / A3A_faction_inv) vehicles according to war level.
    
    Params:
        _faction <STRING> 
    
    Dependencies:
        N/A
    
    Scope:
        Server
    
    Environment:
        Unscheduled
    
    Usage:
		["occ"] call A3U_fnc_updateVehiclesData;
        OR
        "inv" call A3U_fnc_updateVehiclesData;
    
    Return:
        N/A
*/

params ["_faction"];

if (isNil "_faction") exitWith {};
private _factionData = missionNamespace getVariable "A3A_faction_" + _faction;
private _data = + _factionData;
private _vehiclesData = [_data get "vehiclesData"];
if (isNil "_vehiclesData") exitWith {};

{
    _data set [_x, _y];
} forEach (_vehiclesData call SCRT_fnc_unit_getTiered);
missionNamespace setVariable ["A3A_faction_" + _faction, _data];
call A3A_fnc_compileMissionAssets;
publicVariable ("A3A_faction_" + _faction);
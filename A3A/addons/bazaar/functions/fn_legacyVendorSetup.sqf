/*
    Author:
        Creep'nCrunch / jwoodruff40
    
    Description:
        Sets up the legacy vendor (Antistasi Ultimate's Arms Dealer) as a Bazaar trader.
        Not part of ABZ_vendors due to custom (or not yet implemented) logic for rotation, relocation, despawn and save logic
    
    Params:
        _u <OBJECT> <Default: objNull>
        _props <ARRAY> <Default: []>
    
    Dependencies:
        N/A
    
    Scope:
        Server
    
    Environment:
        Unscheduled
    
    Usage:
        [unit, props] call ABZ_fnc_legacyVendorSetup;
    
    Return:
        Nothing
*/
params [["_u", objNull, [objNull]], ["_props", [], [[]]]];
if (!isServer || {isNull _u}) exitWith {};

private _pos = getPosATL _u;
ABZ_legacyVendor = _u;
{ if (!isNull _x) then { _x setVariable ["ABZ_vendorId", ABZ_legacyVendorId, true] } } forEach (_props + [_u]);
_u setVariable ["ABZ_vendorName", name _u, true];

ABZ_legacyVendorEntry = [ABZ_legacyVendorId, [_pos] call ABZ_fnc_townName, _pos, getDir _u, typeOf _u, name _u, [], 0, 0, "ok", 0, _pos, [], [], -1, false];
call ABZ_fnc_legacyVendorRestock;
call ABZ_fnc_publishStalls;

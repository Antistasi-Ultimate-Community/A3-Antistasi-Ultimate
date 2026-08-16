/*
    Author: [Håkon]
    [Description]
        Gets the vehicles node array

    Arguments:
    0. <Object> Vehicle that you want to load cargo in

    Return Value:
    <Array> Node array of the object

    Scope: Any
    Environment: unscheduled
    Public: [No]
    Dependencies:

    Example: private _nodes = [_vehicle] call A3A_Logistics_fnc_getVehicleNodes;
*/
params [["_vehicle", objNull, [objNull, ""]]];
private _config = [_vehicle] call A3A_Logistics_fnc_getNodeConfig;
if (isNull _config) exitWith { [] };

configProperties [(_config/"Nodes"), "true", true] apply {[
    // Node occupation status (0 = occupied, 1 = free)
    1,
    // Node position offset relative to vehicle model
    [_x >> "offset", "ARRAY", [0, 0, 0]] call CBA_fnc_getConfigEntry,
    // Cargo seat indices blocked if node is occupied
    [_x >> "seats", "ARRAY", []] call CBA_fnc_getConfigEntry,
    // Turret indices blocked if node is occupied (optional)
    [_x >> "turrets", "ARRAY", []] call CBA_fnc_getConfigEntry,
    // If node can be used for coupling (accomodating space for cargo-size > 1) with previous node
    [_x >> "canCouple", "NUMBER", 1] call CBA_fnc_getConfigEntry
]};

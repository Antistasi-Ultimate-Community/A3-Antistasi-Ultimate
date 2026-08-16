/*
    Author: [Håkon]
    [Description]
        Verify that it can load cargo in vehicle

    Arguments:
        0. <Object> Vehicle you want to load cargo inn
        1. <Object> Cargo you want to load

    Return Value:
        <Int>   Error code
        <Array> [Cargo, Vehicle, Nodes, isWeapon] can be passed directly to logistics_load as is

    Scope: Any
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [_vehicle, _cargo] call A3A_Logistics_fnc_canLoad;

    Error codes:
        -1: Vehicle not alive or null
        -2: Cargo not alive or null
        -3: Cargo not loadable
        -4: Gunner in static weapon (cargo)
        -5: Weapon not allowed on vehicle
        -6: Unit no longer loadable (conscious)
        -7: Vehicle unable to load any cargo
        -8: Not enough space to load cargo onto vehicle
        -9: Units in cargo seats blocking loading
*/
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params [ ["_vehicle", objNull, [objNull] ], ["_object", objNull, [objNull] ] ];
if !(alive _vehicle) exitWith {-1}; //vehicle destroyed
if !(alive _object) exitWith {-2}; //cargo destroyed

//check if vehicle can load cargo
private _vehConfig = [_vehicle] call A3A_Logistics_fnc_getNodeConfig;
if (isNull _vehConfig) exitWith {-7};

//get cargo node size
private _cargoConfig = [_object] call A3A_Logistics_fnc_getCargoConfig;
if (isNull _cargoConfig) exitWith {-3};
private _objNodeType = [_object] call A3A_Logistics_fnc_getCargoNodeType;
if (_objNodeType isEqualTo -1) exitWith {-3}; //invalid cargo

if !(
    ((gunner _object) isEqualTo _object)
    or ((gunner _object) isEqualTo objNull)
) exitWith {-4}; //gunner in static

//is weapon? and weapon allowed
private _weapon = 1 == getNumber (_cargoConfig/"isWeapon");
private _allowed = if (!_weapon) then {true} else {
    if (0 == getNumber (_vehConfig/"canLoadWeapon")) exitWith {false};

    private _vehModel = getText (configFile/"CfgVehicles"/typeOf _vehicle/"model");
    private _blackList = getArray (_cargoConfig/"blackList");
    !(
        _vehModel in _blackList
        || typeOf _vehicle in _blackList
    )
};
if !(_allowed) exitWith {-5}; //weapon not allowed on vehicle

if ((_object isKindOf "CAManBase") and (
    ( [_object] call A3A_fnc_canFight )
    or !( isNull (_object getVariable ["helped",objNull]) )
    or !( isNull attachedTo _object )
)) exitWith {-6}; //conscious man

//get vehicle nodes
private _nodes = _vehicle getVariable [QGVAR(Nodes),nil];

//if nodes not initilized
if (isNil "_nodes") then {
    _nodes = [_vehicle] call A3A_Logistics_fnc_getVehicleNodes;
    _vehicle setVariable [QGVAR(Nodes), _nodes];
};

//Vehicle not able to carry cargo
if (_nodes isEqualTo []) exitWith {-7};

//enough free nodes to load cargo

private["_node","_sequenceLength","_sequenceStart"];

_sequenceLength = _objNodeType; // just confusing to read "nodeType" when it refers to size
_sequenceStart = -1;

while { isNil "_node" } do {
    _sequenceStart = _sequenceStart + 1;

    // End of nodes reached, no vacancy, break
    if (_sequenceStart >= count _nodes) then { break };

    // Starting at current sequence start, try to find a sequence of free nodes
    private _thisSequence = [];

    for "_n" from 0 to (_sequenceLength - 1) do {
        if ((_sequenceStart + _n) >= count _nodes) then { break };

        private _thisNode = _nodes select(_sequenceStart + _n);

        _thisNode params["_free","","","","_canCouple"];

        // Ocupando, break
        if (_free isNotEqualTo 1) then { break };

        // If we're trying to load size>1 cargo here, any node after the base
        // node needs to have `canCouple` set. If not, break, search for next.
        if ((_n isNotEqualTo 0) && { _canCouple isNotEqualTo 1 }) then { break };

        _thisSequence pushBack _thisNode;
    };

    // If we found a full sequence, assign it to _node
    if (_sequenceLength isEqualTo count _thisSequence) then {
        _node = _thisSequence;
    };
};

if (isNil "_node") exitWith {-8};

//block loading if crew in node seats
private _fullCrew = fullCrew _vehicle;
private _seats = [];
private _turrets = [];
if ((_node#0) isEqualType []) then {
    {_seats append (_x#2); _turrets append (_x#3)} forEach _node;
} else {
    _seats append (_node#2);
    _turrets append (_node#3);
};
if !(_fullCrew findIf {_x#2 in _seats || {_x#3 in _turrets}} isEqualTo -1) exitWith {-9};

[_object, _vehicle, _node, _weapon]

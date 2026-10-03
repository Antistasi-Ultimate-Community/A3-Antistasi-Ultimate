/*
    Author: [Håkon]
    [Description]


    Arguments:
    0. <Object> Cargo being loaded
    1. <Object> Vehicle cargo is being loaded into
    2. <Array>  Node array or array of node arrays to use for loading
    3. <Bool>   is cargo a static weapon
    4. <Bool>   optional: load cargo instantly (Default: False)

    Return Value:
    <nil>

    Scope: Any
    Environment: Scheduled
    Public: [No]
    Dependencies:

    Example:
*/
#include "..\script_component.hpp"
params ["_cargo", "_vehicle", "_node", "_weapon", ["_instant", false, [true]]];

if (_vehicle getVariable ["LoadingCargo", false]) exitWith {
    [localize "STR_A3A_Logistics_header", localize "STR_A3A_Logistics_load_alreadyloading"] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner]; 
    nil
};
_vehicle setVariable ["LoadingCargo",true,true];

//object string for jip
private _objStringCargo = str _cargo splitString ":" joinString "";
private _objStringVehicle = str _vehicle splitString ":" joinString "";

//update list of nodes on vehicle
_updateList = {
    params ["_vehicle", "_node"];
    private _list = _vehicle getVariable [QGVAR(Nodes),[]];
    private _index = _list find _node;
    _node set [0,0];
    _list set [_index, _node];
    _vehicle setVariable [QGVAR(Nodes), _list, true];
};

//find node point and seats
private _nodeOffset = [0,0,0];
private _seats = [];
private _turrets = [];

if ((_node#0) isEqualType []) then {
    //offset
    private _lastNode = (count _node) -1;
    private _offsetOne = (_node#0#1);
    private _offsetTwo = (_node#_lastNode#1);
    private _diff = _offsetOne vectorDiff _offsetTwo;
    _nodeOffset = _offsetTwo vectorAdd [0,(_diff#1)/2,0];

    //seats & turrets
    {
        _seats append (_x#2);
        _turrets append (_x#3);
    } forEach _node;

    //update cargo list
    for "_i" from 0 to _lastNode do {
        [_vehicle, _node#_i] call _updateList;
    };
} else { //single node
    //offset
    _nodeOffset = (_node#1);
    //seats
    _seats append (_node#2);
    //turrets
    _turrets append (_node#3);
    //update list
    [_vehicle , _node] call _updateList;
};

private _isLootcrate = (typeOf _cargo) isEqualTo (A3A_faction_reb get "lootCrate");
if (_isLootcrate) then {
    _cargo allowDamage false;
};

//attach data
private _offsetAndDir = [_cargo] call A3A_Logistics_fnc_getCargoOffsetAndDir;
private _location = _offsetAndDir#0;
private _location = _location vectorAdd _nodeOffset;

private _bbVehicle = boundingBoxReal _vehicle select 0 select 1;
private _bbCargo = boundingBoxReal _cargo select 0 select 1;
private _yStart = _bbVehicle + _bbCargo - 0.1;
private _yEnd = _location#1;
_cargo setVariable ["AttachmentOffset", _location];

//block seats & turrets
[_cargo, true] remoteExec ["A3A_Logistics_fnc_toggleLock", 0, "A3A_Logistics_toggleLock" + _objStringCargo];
[_vehicle, true, [_seats, _turrets]] remoteExecCall ["A3A_Logistics_fnc_toggleLock", 0, "A3A_Logistics_toggleLock" + _objStringVehicle];
_cargo engineOn false;

//break undercover
if (_weapon && !_instant) then {
    {_x setCaptive false;}forEach crew _vehicle;
    player setCaptive false;
};

//initial attachement, hide uglyness
_vectorUp = if (_cargo isKindOf "CAManBase") then {[0,0,0]} else {[0,0,1]};
_location set [1, _yStart];
_cargo hideObjectGlobal true;
_cargo attachto [_vehicle,_location];
[_cargo, [(_offsetAndDir#1),[0,0,1]]] remoteExecCall ["setVectorDirAndUp", owner _cargo]; //need to be done where cargo is local, command broadcast updated vector dir and up
_cargo hideObjectGlobal false;

_vehicle animateDoor ["Door_rear", 1];
//slideing attachment
if (_instant) then {
    _location set [1, _yEnd+0.1];
    _cargo attachto [_vehicle,_location];
} else {
    private _prevTime = time;
    while {(_location#1) < _yEnd} do {
        uiSleep 0.01;
        _location = _location vectorAdd [0,time-_prevTime,0];
        _cargo attachto [_vehicle,_location];
        _prevTime = time;
    };
};

//update loaded list (for unload ease)
private _previousLoaded = _vehicle getVariable ["Cargo", []];
private _loadedCargo = [[_cargo,_node]] + _previousLoaded;
_vehicle setVariable ["Cargo", _loadedCargo, true];

//misc
[_cargo] call A3A_Logistics_fnc_toggleAceActions;
[_vehicle, _cargo, nil, _instant] call A3A_Logistics_fnc_addOrRemoveObjectMass;

if (_isLootcrate) then {
    _nil = [_cargo] spawn {
        params["_cargo"];
        if (!isNil "_cargo" && {alive _cargo}) then {
            private _timeOut = time + 10;
            waitUntil {_timeOut < time};
            _cargo allowDamage true;
        };
        terminate _thisScript;
    };
};

if (_weapon) then {
        private _jipKey = "A3A_Logistics_weaponAction_" + _objStringCargo;
    [_cargo, _vehicle, _jipKey] remoteExec ["A3A_Logistics_fnc_addWeaponAction", 0, _jipKey];
};
_vehicle animateDoor ["Door_rear", 0];
_vehicle setVariable ["LoadingCargo",nil,true];

private _jipKey = "A3A_Logistics_unload_" + _objStringVehicle;
[_vehicle, "unload", _jipKey] remoteExec ["A3A_Logistics_fnc_addAction", 0 ,_jipKey];
nil

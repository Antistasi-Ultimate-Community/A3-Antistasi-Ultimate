/*
    Author: [Håkon]
    [Description]
        unloads last loaded cargo of the vehicle

    Arguments:
    0. <Object> Vehicle to unload cargo from
    1. <Bool>   optional: unload cargo instantly (Default: False)

    Return Value:
    <Nil>

    Scope: Any
    Environment: Scheduled
    Public: [No]
    Dependencies:

    Example: [_target] remoteExec ["A3A_Logistics_fnc_unload",2];
*/
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_vehicle", ["_instant", false, [true]]];
private _fileName = "fn_logistics_unload";

private _loaded = _vehicle getVariable ["Cargo", []];
private _lastLoaded = false;
if ((count _loaded) isEqualTo 1) then {_lastLoaded = true};
(_loaded#0) params ["_cargo", "_node"];

if !(
    ((gunner _cargo) isEqualTo _cargo)
    or ((gunner _cargo) isEqualTo objNull)
) exitWith {
    [localize "STR_A3A_Logistics_header", localize "STR_A3A_Logistics_unload_nostatic"] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner]
};

if (_vehicle getVariable ["LoadingCargo", false]) exitWith {
    [localize "STR_A3A_Logistics_header", localize "STR_A3A_Logistics_unload_already"] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner]
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
    if (_index < 0) exitWith { Error_3("Bad _updateList call | Vehicle: %1 | Vehicle Nodes: %2 | Node: %3", _vehicle, _list, _node) };
    _node set [0,1];
    _list set [_index, _node];
    _vehicle setVariable [QGVAR(Nodes), _list];
};

//find node point and seats
private _nodeOffset = [0,0,0];
private _seats = [];
private _turrets = [];

if ((_node#0) isEqualType []) then {
    //type 2 cargo
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
} else {
    //type 1 cargo
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
_vehicle animateDoor ["Door_rear", 1];
//detach cargo
private _keepUnloading = false;
if !(_cargo isEqualTo objNull) then {//cargo not deleted
    //check if its a weapon
    private _cargoConfig = [_cargo] call A3A_Logistics_fnc_getCargoConfig;
    private _weapon = 1 == getnumber (_cargoConfig/"isWeapon");

    if (_weapon) then {
        [_vehicle, _cargo, "A3A_Logistics_weaponAction_" + _objStringCargo] remoteExecCall ["A3A_Logistics_fnc_removeWeaponAction",0];
        player setCaptive false; //break undercover for unloading weapon
    };
    _cargo setVariable ["AttachmentOffset", nil, true];

    private _location = ([_cargo] call A3A_Logistics_fnc_getCargoOffsetAndDir)#0;
    private _location = _location vectorAdd _nodeOffset;
    private _bbv = boundingBoxReal _vehicle select 0 select 1;
    private _bbc = boundingBoxReal _cargo select 0 select 1;
    private _yEnd = _bbv + _bbc - 0.1;


    if (_instant) then {
        _location set [1, _yEnd-0.1];
        _cargo attachto [_vehicle,_location];
    } else {
        private _prevTime = time;
        while {(_location#1) > _yEnd} do {
            uiSleep 0.01;
            if (isNull _cargo || isNull _vehicle) exitWith {};//vehicle or cargo deleted
            _location = _location vectorAdd [0,_prevTime-time,0];
            _cargo attachto [_vehicle,_location];
            _prevTime = time;
        };
    };
    if (isNull _cargo || isNull _vehicle) exitWith {};//vehicle or cargo deleted
    detach _cargo;

    [_cargo] call A3A_Logistics_fnc_toggleAceActions;
    [_vehicle, _cargo, true, _instant] call A3A_Logistics_fnc_addOrRemoveObjectMass;
    _cargo lockDriver false;
} else {_keepUnloading = true};
if (isNull _cargo || isNull _vehicle) exitWith {};//vehicle or cargo deleted

//unlock seats & turrets
[_cargo, false] remoteExec ["A3A_Logistics_fnc_toggleLock", 0, "A3A_Logistics_toggleLock" + _objStringCargo];
[_vehicle, false, [_seats, _turrets]] remoteExec ["A3A_Logistics_fnc_toggleLock", 0, "A3A_Logistics_toggleLock" + _objStringVehicle];

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

//update list
_loaded deleteAt 0;
_vehicle setVariable ["Cargo", _loaded, true];
[_vehicle] call A3A_Logistics_fnc_refreshVehicleLoad; //refresh list in case theres more on the list but no actuall cargo loaded

_vehicle setVariable ["LoadingCargo",nil,true];
_vehicle animateDoor ["Door_rear", 0];
if (_keepUnloading and !_lastLoaded) then {[_vehicle] spawn A3A_Logistics_fnc_unload};//if you tried to unload a null obj unload next on list
nil

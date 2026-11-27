/*
    Author: [Ayla (Alsekwolf), Spoffy, Håkon, CalebSerafin]
    [Description]
        Modifies the mass of a vehicle with the mass of the object being added or removed

    Arguments:
    0. <Object> Vehicle you want to change mass of
    1. <Object> Object your loading onto vehicle
    2. <Bool>   If your removing the object from the vehicle
    3. <Bool>   Block load info message

    Return Value:
    <nil>

    Scope: Any
    Environment: Any
    Public: [No]
    Dependencies:

    Example:

    License: MIT License
*/
#include "..\script_component.hpp"
params["_vehicle","_object", ["_removeObject", false, [true]], ["_dontMsg", false, [true]]];

//------------------\\
//-- Set new mass --\\
//------------------\\
private _defaultMass = _vehicle getVariable "default_mass";
if (isNil "_defaultMass") then {
    _defaultMass = getMass _vehicle;
    _vehicle setVariable ["default_mass", _defaultMass, true];
};

private _objectMass = getMass _object;
private _currentMass = getMass _vehicle;

private _newMass = _currentMass;

//Figure out our new mass value
if (_removeObject) then {
    //Never go lower than the base vehicle's mass.
    _newMass = (_currentMass - _objectMass) max _defaultMass;
} else {
    _newMass = _currentMass + _objectMass;
};

[_vehicle, _newMass] remoteExec ["setMass", _vehicle];
if (_dontMsg) exitWith {};

//------------------\\
//-- Send message --\\
//------------------\\

//Pull data on available nodes, so we can display it to the user.
private _nodes = _vehicle getVariable [QGVAR(Nodes),[]];
private _availableNodes = { (_x#0) isEqualTo 1 } count _nodes;

private _objectName = getText (configOf _object >> "displayName");
private _vehicleName = getText (configOf _vehicle >> "displayName");
//Mass of all cargo attached to the vehicle.
private _cargoMass = _newMass - _defaultMass;

//Output the final message.
private _msg = "";
if (!_removeObject) then{
    if (_availableNodes == 0) then {
        _msg = format [localize "STR_A3A_Logistics_addOrRemoveObjectMass_1", _objectName, _vehicleName, _availableNodes];
    } else {
        _msg = format [localize "STR_A3A_Logistics_addOrRemoveObjectMass_2", _objectName, _vehicleName, _availableNodes];
    };
} else {
    _msg = format [localize "STR_A3A_Logistics_addOrRemoveObjectMass_3", _objectName, _vehicleName, _availableNodes];
};

private _text = format [
    "
    <img image='%1' size='2' align='left'/>
    <t color='#a02e69' size='1.2' shadow='1' shadowColor='#000000' align='center'>%2</t><br/>
    <t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>%6: </t>
    <t color='#00ff59' size='1.2' shadow='1' shadowColor='#000000' align='left'>%3</t><br/>
    <t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>%7: </t>
    <t color='#00ff59' size='1.2' shadow='1' shadowColor='#000000' align='left'>%4</t><br/>
    <t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>%8: </t>
    <t color='#00ff59' size='1.2' shadow='1' shadowColor='#000000' align='left'>%5</t><br/>
    ",
    getText(configOf _vehicle >> "picture"),
    getText(configOf _vehicle >> "displayName"),
    _defaultMass,
    _cargoMass,
    _defaultMass + _cargoMass,
    localize "STR_A3A_Logistics_addOrRemoveObjectMass_additive_1",
    localize "STR_A3A_Logistics_addOrRemoveObjectMass_additive_2",
    localize "STR_A3A_Logistics_addOrRemoveObjectMass_additive_3"
];
_text = _text + _msg;

[localize "STR_A3A_Logistics_header", parseText _text] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner];
[localize "STR_A3A_Logistics_header", parseText _text] remoteExec ["A3A_fnc_customHint", crew _vehicle];

nil;

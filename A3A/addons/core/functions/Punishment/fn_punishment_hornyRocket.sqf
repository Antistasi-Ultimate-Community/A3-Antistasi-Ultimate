/*
Function:
    A3A_fnc_punishment_hornyRocket

Description:
    Implements the new punishment method that sends player on a missile ride.

Scope:
    <SERVER> Execute on server.

Environment:
    <UNSCHEDULED>

Parameters:
    <STRING> The UID of the detainee being punished with new method.

Returns:
    <BOOLEAN> true if it hasn't crashed; false if invalid params; nil if it has crashed.

Author: wersal
*/
params ["_UID"];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!isServer) exitWith {
    Error("NOT SERVER");
    false;
};

private _varspace = [missionNamespace,"A3A_FFPun",_UID,locationNull] call A3A_fnc_getNestedObject;
private _detainee = _varspace getVariable ["player",objNull];

if (!isPlayer _detainee) exitWith {false};

[(format["<t>%1</t><br />", localize "STR_A3A_detainee_sentence"]), "", localize "STR_A3A_punishment_farewell", localize "STR_A3A_punishment_nonono"] remoteExecCall ["BIS_fnc_guiMessage", _detainee];

private _resourcesPlayer = player getVariable "moneyX";

if (_resourcesPlayer < _amount && {_resourcesPlayer != 0}) then {
    _amount = _resourcesPlayer;
};

// Transfer money to faction
[-_amount] call A3A_fnc_resourcesPlayer;
[_amount] remoteExec ["A3A_fnc_resourcesFIA",2];

[localize "STR_A3A_OrgPlayers_donateMoney_header", format [localize "STR_A3A_OrgPlayers_donateMoney_success", A3A_faction_civ get "currencySymbol"]] call A3A_fnc_customHint;

private _originalPos = getPosASL _detainee;

private _cratePos = [_originalPos, 0, 150, 0, 0, 0, 0, [], _originalPos] call BIS_fnc_findSafePos;

private _CrateType = (Faction(west)) get "surrenderCrate";

private _boxX = _surrenderCrateType createVehicle position _detainee;

// move all unit's equipment except uniform into the surrender crate
private _loadout = getUnitLoadout _detainee;
for "_i" from 0 to 2 do {
	if !(_loadout select _i isEqualTo []) then {
		_boxX addWeaponWithAttachmentsCargoGlobal [_loadout select _i, 1];
	};
};
{_boxX addMagazineCargoGlobal [_x,1]} forEach (magazines _detainee);
{_boxX addItemCargoGlobal [_x,1]} forEach (assignedItems _detainee);
{_boxX addItemCargoGlobal [_x,1]} forEach (items _detainee);
{_boxX addItemCargoGlobal [_x,1]} forEach (weaponsItemsCargo _detainee);
{_boxX addItemCargoGlobal [_x,1]} forEach (weaponsItems _detainee);
{_boxX addItemCargoGlobal [_x,1]} forEach [vest _detainee, headgear _detainee, goggles _detainee];
private _backpack = backpack _detainee;
if (_backpack != "") then {
	// because backpacks are often subclasses containing items
	_backpack = _backpack call A3A_fnc_basicBackpack;
	_boxX addBackpackCargoGlobal [_backpack, 1];
};
_detainee setUnitLoadout [ [], [], [], [uniform _detainee, []], [], [], "", "", [], ["","","","","",""] ];
_detainee addBackpack "b_parachute";

// Create missile and chair setup
private _launchPos = getPosATL _detainee;
_launchPos set [2, (_launchPos select 2) + 0.35];

private _missile = "ammo_Missile_Cruise_01" createVehicle _launchPos;
_missile setPosATL _launchPos;
_missile setVectorDirAndUp [[0,0,1], [0,1,0]];
_missile allowDamage false;

private _chair = "Land_ChairPlastic_F" createVehicle [0,0,0];
_chair attachTo [_missile, [0, 3, 0.27]];
_chair setVectorDirAndUp [[0,0,0], [0,0,0]];
_chair setDir 90;

_detainee attachTo [_chair, [0.1, 0, -0.45]];
_detainee setDir 90;
[_detainee, "HubSittingChairC_idle1"] remoteExec ["switchMove", 0];

// Spawn missile flight sequence
[_missile, _detainee, _chair, _UID, _originalPos] spawn {
    params ["_missile", "_target", "_chair", "_UID", "_originalPos"];

    waitUntil {sleep 0.5; (getPosATL _missile select 2) > 1500 || isNull _missile}; 

    [_UID,"forgive"] call A3A_fnc_punishment_release; 
    
    // Detach and cleanup
    detach _chair;
    deleteVehicle _missile;
    
    sleep 16;
    
    // Detach player and clean up
    detach _target; 
    [_target, ""] remoteExec ["switchMove", 0]; 
    
    // Apply velocity and delete chair
    _target setVelocity (velocity _chair);     
    deleteVehicle _chair;
};

true;
/*
	Author:
		jwoodruff40
	
	Description:
		Initializes a vehicle spawned by Zeus with appropriate vehicle class and assigns AI crew.
	
	Params:
		_emptyVeh <OBJ> : The empty vehicle placeholder spawned by Zeus, replace with an appropriate vehicle from the faction template.
		_vehFaction <STR> : The faction of the vehicle to spawn.
		_vehType <STR> : The type of vehicle to spawn.
	
	Dependencies:
		A3A\addons\core\functions\CREATE\fn_AIVEHinit
		A3A\addons\core\functions\CREATE\fn_createVehicleCrew
	
	Scope:
		Server/HC/All clients
	
	Environment:
		Any
	
	Usage:
		Only intended to be called from the PostInit event handler of Zeus-spawned A3U vehicles.
		[_vehObj, "reb", "vehiclesLightArmed"] call A3U_fnc_zeus_vehicleInit;
	
	Return:
		Nothing
*/

#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!isServer) exitWith {}; // ! on dedicated, code is run on the server and all clients, (re)creating the actual vehicle for every client and blowing them all up

params ["_emptyVeh", "_vehFaction", "_vehType"];

private _faction = missionNamespace getVariable ("A3A_Faction_" + _vehFaction);
if (isNil "_faction") exitWith {};

private _pos = position _emptyVeh;
deleteVehicle _emptyVeh;

private _typeX = selectRandom (_faction get _vehType);
if (isNil "_typeX") exitWith {
	[
		format [localize "STR_A3U_Zeus_Misc_Dialog_NoVehicleOfType", _faction get "name", _vehType],
		localize "STR_A3U_Zeus_Misc_Dialog_Header",
		true,
		false,
		findDisplay 312 // Zeus IDD
	] spawn BIS_fnc_guiMessage;
};

private _veh = _typeX createVehicle _pos;
private _side = switch (_vehFaction) do {
	case "occ": { west };
	case "inv": { east };
	case "reb": { resistance };
	case "civ": { civilian };
	case "riv": { opfor };
};
if (isNil "_side") exitWith {};
[_veh, _side] call A3A_fnc_AIVEHinit;
private _group = [_side, _veh] call A3A_fnc_createVehicleCrew;

{ _x addCuratorEditableObjects [[_veh] + crew _veh, true] } forEach (allCurators); // QoL; required since the vehicle wasn't technically spawned by Zeus (_emptyVeh was)

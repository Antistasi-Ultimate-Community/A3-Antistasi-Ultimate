/*
	Author:
		jwoodruff40
	
	Description:
		Initializes a vehicle spawned by Zeus with appropriate vehicle class and assigns AI crew.
	
	Params:
		_emptyVeh <OBJ> : The empty vehicle placeholder spawned by Zeus, replace with an appropriate vehicle from the faction template.
		_vehFaction <STR> : The faction of the vehicle to spawn.
		_vehType <STR> : The type of vehicle to spawn.
		_withCrew <BOOL> : Whether to spawn AI crew in the vehicle.
	
	Dependencies:
		A3A\addons\core\functions\CREATE\fn_AIVEHinit
		A3A\addons\core\functions\CREATE\fn_createVehicleCrew
	
	Scope:
		Server/HC/All clients
	
	Environment:
		Any
	
	Usage:
		Only intended to be called from the PostInit event handler of Zeus-spawned A3U vehicles.
		[_vehObj, "reb", "vehiclesLightArmed"] call A3A_zeus_fnc_initVehicle;
	
	Return:
		Nothing
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!isServer) exitWith {}; // ! on dedicated, code is run on the server and all clients, (re)creating the actual vehicle for every client and blowing them all up

if (isNil {areRivalsDiscovered}) exitWith {
	private _message = localize "STR_A3U_Zeus_Misc_Dialog_NotAntistasiUltimate";
	[objNull, _message] call BIS_fnc_showCuratorFeedbackMessage;
};

params ["_emptyVeh", "_vehFaction", "_vehType", ["_withCrew", true]];

private _faction = missionNamespace getVariable ("A3A_Faction_" + _vehFaction);
if (isNil "_faction") exitWith {};

private _side = switch (_vehFaction) do {
	case "occ": { west };
	case "inv";
	case "riv": { east };
	case "reb": { resistance };
	case "civ": { civilian };
};
if (isNil "_side") exitWith {};

private _pos = position _emptyVeh;
deleteVehicle _emptyVeh;

private _vehPool = _faction get _vehType;
private _typeX = if (_side isEqualTo civilian) then { selectRandomWeighted _vehPool } else { selectRandom _vehPool };
if (isNil "_typeX") exitWith {
	private _message = format [localize "STR_A3U_Zeus_Misc_Dialog_NoVehicleOfType", _faction get "name", _vehType];
	[objNull, _message] call BIS_fnc_showCuratorFeedbackMessage;
};

private _veh = _typeX createVehicle _pos;
[_veh, _side] call A3A_fnc_AIVEHinit;

private _crewFunc = [A3A_fnc_createVehicleCrew, A3A_fnc_RivalsCreateVehicleCrew] select (_vehFaction isEqualTo "riv");
if (_withCrew) then { [_side, _veh] call _crewFunc };

{ _x addCuratorEditableObjects [[_veh] + crew _veh, true] } forEach (allCurators); // QoL; required since the vehicle wasn't technically spawned by Zeus (_emptyVeh was)

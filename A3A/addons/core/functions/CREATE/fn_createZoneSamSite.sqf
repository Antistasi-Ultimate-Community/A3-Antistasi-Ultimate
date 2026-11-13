/*
	Maintainer:
		jwoodruff40 / Creep'nCrunch
	
	Description:
		Creates the SAM site (radar and SAM) for a zone
	
	Params:
		_markerX <STRING> Zone marker
		_sideX <SIDE> Zone side
		_destroyedCooldown <SCALAR> Seconds added to the zone's SAM respawn cooldown when a SAM vehicle is destroyed
	
	Dependencies:
		A3A_fnc_findSpawnPosition
		A3A_fnc_safeVehicleSpawn
		A3A_fnc_createVehicleCrew
		A3A_fnc_AIVEHinit
	
	Scope:
		Server
	
	Environment:
		Scheduled
	
	Usage:
		([_markerX, _sideX, 900] call A3A_fnc_createZoneSamSite) params ["_groups", "_soldiers", "_vehicles", "_spawnsUsed"];
	
	Return:
		[_groups, _soldiers, _vehicles, _spawnsUsed] <ARRAY>
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_markerX", "_sideX", "_destroyedCooldown"];

private _faction = Faction(_sideX);
private _groups = [];
private _soldiers = [];
private _vehicles = [];
private _spawnsUsed = [];

private _radarType = _faction getOrDefault ["vehicleRadar", ""];
private _samType = _faction getOrDefault ["vehicleSam", ""];

// radar / SAM arrays (old / misconfigured templates)
{
	_x = switch true do {
		case (isNil "_x"); // should be covered by the getOrDefault above, but we have a switch here now anyway
		case (_x isEqualTo []): { "" };
		case (_x isEqualType [] && {_x isNotEqualTo []}): { selectRandom _x };
		default { _x };
	};
} forEach [_radarType, _samType];

// don't spawn if SAM was destroyed and still on cooldown
if (garrison getVariable [_markerX + "_samDestroyedCD", 0] isNotEqualTo 0) exitWith { [_groups, _soldiers, _vehicles, _spawnsUsed] };
 
 // ? Is there a case to be made to still spawn one even if we don't have the other?
 // e.g. If people are using the radar / SAM entries in the templates not for actual radars / SAMs,
 // but just to guarantee spawn of *some thing* at milbases / airbases
 if (_radarType isEqualTo "" || {_samType isEqualTo ""}) exitWith { [_groups, _soldiers, _vehicles, _spawnsUsed] };

private _spawnParameter = [_markerX, "Sam"] call A3A_fnc_findSpawnPosition;
if !(_spawnParameter isEqualType []) exitWith { [_groups, _soldiers, _vehicles, _spawnsUsed] };
_spawnsUsed pushBack _spawnParameter#2;

{
	private _aaVehicle = nil;
	isNil {
		_aaVehicle = [_x, _spawnParameter select 0, 25, 10, true] call A3A_fnc_safeVehicleSpawn;
		_aaVehicle setDir (_spawnParameter select 1);
	};

	private _aaGroup = [_sideX, _aaVehicle] call A3A_fnc_createVehicleCrew;
	[_aaVehicle, _sideX] call A3A_fnc_AIVEHinit;

	_soldiers append (units _aaGroup);
	_groups pushBack _aaGroup;
	_vehicles pushBack _aaVehicle;

	// radar rotation
	// of course, this piece *does* assume that the radar is, in fact, a radar
	if (_x isEqualTo _radarType) then {
		_aaVehicle spawn {
			while {alive _this} do {
				{
					_this lookAt (_this getRelPos [100, _x]);
					sleep 2.45;
				} forEach [120, 240, 0];
			};
		};
		_aaVehicle setVehicleRadar 1;
		_aaVehicle setVehicleReportRemoteTargets true;
	};

	_aaVehicle setVariable ["A3A_samMarker", _markerX];
	_aaVehicle addEventHandler ["Killed", {
		private _marker = _this#0 getVariable ["A3A_samMarker", ""];
		if (_marker isNotEqualTo "") then {
			private _varName = _marker + "_samDestroyedCD";
			private _previousValue = garrison getVariable [_varName, 0];
			garrison setVariable [_varName, (_previousValue + _destroyedCooldown), true];
		};
	}];
} forEach [_radarType, _samType];

[_groups, _soldiers, _vehicles, _spawnsUsed]

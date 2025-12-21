#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_site", "_position"];

private _leave = false;
private _antennaDead = objNull;
private _economyDead = ""; // Rebuild Factories and Resources Variables Definition

if (_site in outposts) then {
	_antennasDead = antennasDead select {_x inArea _site};
	if (count _antennasDead > 0) then {
		_antennaDead = _antennasDead select 0;
	};
};

// Check if the site is a destroyed economy site
if ((_site in factories || _site in resourcesX) && _site in destroyedSites) then {
	_economyDead = _site;
	Debug_1("Rebuilding Economic Site %1", _economyDead);
};

private _name = [_site] call A3A_fnc_localizar;

private _rebuildSuccess = {
	params ["_message", ["_name", _name]];
	[
		localize "STR_notifiers_success_type",
		localize "STR_notifiers_rebuild_assets_header",
		parseText format [localize _message, _name],
		30
	] spawn SCRT_fnc_ui_showMessage;

	[0,-5000] remoteExec ["A3A_fnc_resourcesFIA",2];
};

private _rebuildFail = {
	params ["_message", ["_name", _name]];
	[
		localize "STR_notifiers_fail_type",
		localize "STR_notifiers_rebuild_assets_header",
		parsetext format [localize _message, _name],
		30
	] spawn SCRT_fnc_ui_showMessage;
};

switch (true) do {
	case (_site in citiesX): {
		[0, 10, _position] remoteExec ["A3A_fnc_citySupportChange",2];
    	[Occupants, 10, 30] remoteExec ["A3A_fnc_addAggression",2];
    	[Invaders, 10, 30] remoteExec ["A3A_fnc_addAggression",2];

		destroyedSites deleteAt(destroyedSites find _site);
		publicVariable "destroyedSites";

		["STR_notifiers_rebuild_assets_success"] call _rebuildSuccess;
	};
	// Rebuild Economic Assets and building repair start
	case (_economyDead != ""): {
		Debug_1("Calling A3A_fnc_rebuildEconomicAssets for %1", _economyDead);
		[_economyDead] remoteExec ["A3A_fnc_rebuildEconomicAssets", 2]; // Call the actual function that rebuilds the economic site

		["STR_notifiers_rebuild_assets_success"] call _rebuildSuccess;
	};
	// Rebuild Economic Assets and building repair end

	case (!isNull _antennaDead): {
		private _militaryBuildings = nearestObjects [_position, A3A_buildingWhitelist, 500,  true];

		{
			[_x] remoteExec ["A3A_fnc_repairRuinedBuilding", 2];
		} forEach _militaryBuildings;

		[_antennaDead] remoteExec ["A3A_fnc_rebuildRadioTower", 2];

		["STR_notifiers_rebuild_assets_radiotower_success"] call _rebuildSuccess;
	};

	default {
		private _militaryBuildings = nearestObjects [_position, A3A_buildingWhitelist, 500,  true];

		private _destroyedCount = count destroyedBuildings; diag_log _destroyedCount;
		{
			[_x] remoteExec ["A3A_fnc_repairRuinedBuilding", 2];
		} forEach _militaryBuildings;

		[_name, _destroyedCount, _rebuildFail, _rebuildSuccess] spawn {
			// has to be spawned IOT use a brief sleep, because it takes some time for destroyedBuildings to update
			// otherwise, it will repair any destroyed buildings but think none were repaired and give the wrong message
			params ["_name", "_destroyedCount", "_rebuildFail", "_rebuildSuccess"];
			sleep 0.5;
			if ((count destroyedBuildings) isEqualTo _destroyedCount) exitWith {
				["STR_notifiers_rebuild_assets_nothing_to_rebuild", _name] call _rebuildFail;
			};
			
			["STR_notifiers_rebuild_assets_success", _name] call _rebuildSuccess;
		};
	};
};

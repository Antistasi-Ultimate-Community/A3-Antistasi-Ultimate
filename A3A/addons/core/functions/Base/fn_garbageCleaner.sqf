#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

// Script wants to sleep a couple of lines further down. When calling garbage
// cleaner from commander menu, this script is called in unscheduled env, though.
if (!canSuspend) exitWith { [] spawn A3A_fnc_garbageCleaner };

// Do not localise timeSpan, it is broadcast to all connected clients.
private _timeSinceLastGC = [[serverTime-A3A_lastGarbageCleanTime] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format;
[localize "STR_antistasi_dialogs_open_clean_garbage_title", format [localize "STR_antistasi_dialogs_open_clean_garbage_exit", _timeSinceLastGC]] remoteExec ["A3A_fnc_customHint", 0];
Info("Cleaning garbage...");

private _rebelSpawners = units teamPlayer select { _x getVariable ["spawner",false] };
_rebelSpawners pushBack petros;

private _fnc_distCheck = {
	params["_object", "_dist"];
	if (_rebelSpawners inAreaArray [getPosATL _object, _dist, _dist] isEqualTo []) then { deleteVehicle _object };
};

// Cull A3A_buildingsToSave if over limit (e.g. if limit was lowered after builds placed)
// For example, this would allow *intentionally* removing builds by setting the limit to 0 and running the garbage cleaner
// i.e. a way to clear no longer needed builds, or to fix performance issues from too many builds
if (A3A_builderLimit isNotEqualTo -1 && {count (A3A_buildingsToSave) >= A3A_builderLimit}) then { A3A_buildingsToSave = A3A_buildingsToSave select [0, A3A_builderLimit - 1] };
publicVariable "A3A_buildingsToSave";

Debug("Moving dead solders out of vehicles...");
{
	if !(isNull objectParent _x) then { moveOut _x };
} forEach allDeadMen;
Debug("Finished moving soldiers out of vehicles; executing garbage clean.");
sleep 0.5;

{ deleteVehicle _x } forEach allDead;
{ deleteVehicle _x } forEach (allMissionObjects "WeaponHolder");
{ deleteVehicle _x } forEach (allMissionObjects "WeaponHolderSimulated");
{ [_x, 500] call _fnc_distCheck } forEach (allMissionObjects FactionGet(occ,"surrenderCrate"));// Surrender boxes NATO
{ [_x, 500] call _fnc_distCheck } forEach (allMissionObjects FactionGet(inv,"surrenderCrate"));// Surrender boxes CSAT
{ [_x, 500] call _fnc_distCheck } forEach (allMissionObjects FactionGet(riv,"surrenderCrate"));// Surrender boxes Rivals
{ deleteVehicle _x } forEach (allMissionObjects "Leaflet_05_F");				// Drone drop leaflets
{ deleteVehicle _x } forEach (allMissionObjects "Ejection_Seat_Base_F");		// All vanilla ejection seats
{ deleteVehicle _x } forEach (allMissionObjects "Land_Pallet_F");		// Pallets from Supplies mission

private _lootCrateType = FactionGet(reb, "lootCrate");
// Cleanup rebel vehicles
{
	// Locked check is a hack for roadblock vehicles
	if !(_x isKindOf "StaticWeapon" ||
		{_x in staticsToSave} ||
		{(typeOf _x) isEqualTo _lootCrateType} ||
		{unitIsUAV _x} ||
		{locked _x > 1}) then {
		[_x, 500] call _fnc_distCheck;
	};
} forEach (vehicles select {_x getVariable ["ownerSide", sideUnknown] == teamPlayer});

if (A3A_hasACE) then {
	{ deleteVehicle _x } forEach (allMissionObjects "ACE_bodyBagObject");
	{ deleteVehicle _x } forEach (allMissionObjects "UserTexture1m_F");						// ACE spraycan tags
	{ deleteVehicle _x } forEach (allMissionObjects "ace_cookoff_Turret_MBT_01");			//MBT turret wrecks
	{ deleteVehicle _x } forEach (allMissionObjects "ace_cookoff_Turret_MBT_02");
};

if (isClass (configFile/"CfgPatches"/"rhsgref_main")) then {//ToDo: these should be moved to owner mod detection and not the broad one as we may allow some rhs factions without all of rhs modset loaded
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_a10_acesII_seat");		// Ejection seat for A-10 and F-22
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_a10_canopy");			// other canopies delete on ground contact
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_k36d5_seat");			// AFRF ejection seat
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_vs1_seat");			// another dumb ejection seat
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_mi28_door_pilot");			// another garbage piece not being cleaned
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_mi28_door_gunner");		// another garbage piece not being cleaned
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_mi28_wing_left");			// another garbage piece not being cleaned
	{ deleteVehicle _x } forEach (allMissionObjects "rhs_mi28_wing_right");			// another garbage piece not being cleaned

};

// Do not localise timeSpan, it is broadcast to all connected clients.
[localize "STR_antistasi_dialogs_open_clean_garbage_title", format [localize "STR_antistasi_dialogs_open_clean_garbage_success", _timeSinceLastGC]] remoteExec ["A3A_fnc_customHint", 0];
missionNamespace setVariable ["A3A_lastGarbageCleanTime",serverTime,true];
Info("Garbage clean completed");

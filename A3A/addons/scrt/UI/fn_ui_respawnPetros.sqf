// Prevent respawning Petros if he's currently picked up
if !(isNull attachedTo petros) exitwith
{
	[localize "STR_antistasi_dialogs_hq_button_respawn_petros_text", localize "STR_A3A_Base_canMoveHq_arsenal_petros_picked_2"] call A3A_fnc_customHint;
};

// Prevent respawning Petros if HQ is currently being moved
if ((petros != leader group petros)) exitwith
{
	[localize "STR_antistasi_dialogs_hq_button_respawn_petros_text", localize "STR_antistasi_dialogs_hq_button_hq_moving_text"] call A3A_fnc_customHint;
};

if (!alive petros) exitWith {
	[localize "STR_antistasi_dialogs_hq_button_respawn_petros_text", localize "STR_antistasi_dialogs_hq_button_petros_dead_text"] call A3A_fnc_customHint;
};

[(getMarkerPos respawnTeamPlayer), 10] call A3A_fnc_createPetros;

[localize "STR_antistasi_dialogs_hq_button_respawn_petros_text", localize "STR_antistasi_dialogs_hq_button_petros_respawned_text"] call A3A_fnc_customHint;
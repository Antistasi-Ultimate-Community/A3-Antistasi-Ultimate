#include "..\defines.inc"
FIX_LINE_NUMBERS()
#include "\a3\ui_f\hpp\definedikcodes.inc"

params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];

private _handled = false;

if (_key == 35) then {
	if (A3A_selfReviveMethods isEqualTo true) then { [] spawn A3A_fnc_selfRevive };
	//if (A3A_selfReviveMethods == 2) then { [] spawn A3A_fnc_transferToAI };		// different keys later?
};

if (reviveKitsEnabled) then {
	switch (_key) do {
		case DIK_R: {
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", respawnMenu];
			player spawn A3A_fnc_respawn;
		};
		case DIK_T: {
			private _nearFriendlyUnits = [] call SCRT_fnc_ai_getNearFriendlyUnits;

			private _possessTimeout = player getVariable ["A3A_possessTime", time - 1];
			if (time < _possessTimeout) exitWith {
				[localize "STR_antistasi_dialogs_ai_control_title", format [localize "STR_A3AP_notifications_possess_cooldown", round (_possessTimeout - time)]] call SCRT_fnc_misc_deniedHint;
			};
			
			if (_nearFriendlyUnits isNotEqualTo []) then {
				(findDisplay 46) displayRemoveEventHandler ["KeyDown", respawnMenu];
				[_nearFriendlyUnits select 0] spawn SCRT_fnc_ai_possessFriendlyUnit;
			};
		};
		case DIK_Q: {
			if ("A3AP_SelfReviveKit" in (backpackItems player)) then {
				(findDisplay 46) displayRemoveEventHandler ["KeyDown", respawnMenu];
				[player, player] call SCRT_fnc_common_revive;
			};
		};
	#if __A3_DEBUG__
		case DIK_F: {
			player setVariable ["incapacitated",false,true]; 
			player setDamage 0;
		};
	#endif
	};
} else {
	switch (_key) do {
		case DIK_R: {
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", respawnMenu];
			player spawn A3A_fnc_respawn;
		};
		case DIK_T: {
			private _nearFriendlyUnits = [] call SCRT_fnc_ai_getNearFriendlyUnits;

			private _possessTimeout = player getVariable ["A3A_possessTime", time - 1];
			if (time < _possessTimeout) exitWith {
				[localize "STR_antistasi_dialogs_ai_control_title", format [localize "STR_A3AP_notifications_possess_cooldown", round (_possessTimeout - time)]] call SCRT_fnc_misc_deniedHint;
			};

			if (_nearFriendlyUnits isNotEqualTo []) then {
				(findDisplay 46) displayRemoveEventHandler ["KeyDown", respawnMenu];
				[_nearFriendlyUnits select 0] spawn SCRT_fnc_ai_possessFriendlyUnit;
			};
		};
	#if __A3_DEBUG__
		case DIK_F: {
			player setVariable ["incapacitated",false,true]; 
			player setDamage 0;
		};
	#endif
	};
};

_handled;

// Antistasi Bazaar - postInit
#include "script_component.hpp"
#include "dialogues\ids.inc"

if (hasInterface) then {
	[
		"Antistasi Bazaar", "ABZ_rumours",
		["$STR_A3U_Bazaar_Keybinds_Rumours", "$STR_A3U_Bazaar_Keybinds_Rumours_Tooltip"],
		{
			if (isNull (findDisplay 49) && {isNull (findDisplay ABZ_IDD_SHOP)} && {alive player}) then {
				private _id = [call CBA_fnc_currentUnit] call ABZ_fnc_nearVendor;
				if (_id >= 0) then { [_id] call ABZ_fnc_openShop } else { call ABZ_fnc_rumours };
			};
			true
		},
		{ false },
		[37, [true, false, false]]	// Shift + K (rebindable in CBA addon options)
	] call CBA_fnc_addKeybind;

	[
		"Antistasi Bazaar", "ABZ_reset",
		["$STR_A3U_Bazaar_Keybinds_Reset", "$STR_A3U_Bazaar_Keybinds_Reset_Tooltip"],
		{
			private _t = missionNamespace getVariable ["ABZ_resetArm", -100];
			if (time - _t < 8) then {
				ABZ_resetArm = -100;
				["ABZ_reset", [player]] call CBA_fnc_serverEvent;
			} else {
				ABZ_resetArm = time;
				["Press the key again within 8 seconds to confirm (host/admin only).", "Bazaar RESET"] call ABZ_fnc_notify;
			};
			true
		},
		{ false },
		[37, [true, false, true]]	// Shift + Alt + K (rebindable in CBA addon options)
	] call CBA_fnc_addKeybind;

	// scroll-wheel actions follow the player through respawns / unit changes
	["unit", {
		params ["_new"];
		if (isNull _new) exitWith {};
		[_new] call ABZ_fnc_applyPlayerActions;
	}, true] call CBA_fnc_addPlayerEventHandler;

	// ACE interaction on the trader (ACE groups interact with people through
	// the ACE menu, not the scroll wheel)
	if (!isNil "ace_interact_menu_fnc_createAction") then {
		ABZ_aceAction = [
			"ABZ_browse", "Browse the Bazaar", "",
			{ params ["_target"]; [_target getVariable ["ABZ_vendorId", -1]] call ABZ_fnc_openShop },
			{ params ["_target"]; alive _target && {(_target getVariable ["ABZ_vendorId", -1]) >= 0} }
		] call ace_interact_menu_fnc_createAction;
	};

	// KEEPER LOOP. Antistasi (and other mods) can strip every action off the
	// player without changing the unit - its revive does it on every pick-up.
	// Every 1.5s: make sure our actions exist on whatever unit we control,
	// refresh the nearby-trader cache (3D labels), and give new trader units
	// the ACE interaction.
	[] spawn {
		waitUntil { sleep 1; !isNull player };
		while { true } do {
			private _u = call CBA_fnc_currentUnit;
			if (!isNull _u && {alive _u}) then {
				// unscheduled, so it can't interleave with the CBA unit event
				// doing the same and leave a duplicate, untracked action set
				isNil { if (_u isEqualTo (call CBA_fnc_currentUnit)) then { [_u] call ABZ_fnc_applyPlayerActions } };
				ABZ_nearTraders = (_u nearEntities ["CAManBase", 50]) select { alive _x && {(_x getVariable ["ABZ_vendorId", -1]) >= 0} };
				// my smuggling run (v1.1.0): its destination, and its map marker
				// (kept even across a reconnect or a server restart)
				private _uid = getPlayerUID player;
				private _mine = (missionNamespace getVariable ["ABZ_runsPub", []]) select { (_x select 0) == _uid };
				ABZ_myRunDest = if (_mine isEqualTo []) then { -1 } else { (_mine select 0) select 2 };
				if (ABZ_myRunDest < 0) then {
					if (markerType "ABZ_myrun" != "") then { deleteMarkerLocal "ABZ_myrun" };
				} else {
					private _st = (missionNamespace getVariable ["ABZ_stalls", []]) select { (_x select 0) == ABZ_myRunDest };
					if (_st isNotEqualTo [] && {markerType "ABZ_myrun" == "" || {((getMarkerPos "ABZ_myrun") distance2D ((_st select 0) select 1)) > 5}}) then {
						deleteMarkerLocal "ABZ_myrun";
						createMarkerLocal ["ABZ_myrun", (_st select 0) select 1];
						"ABZ_myrun" setMarkerTypeLocal "mil_end";
						"ABZ_myrun" setMarkerColorLocal "ColorOrange";
						"ABZ_myrun" setMarkerTextLocal "Smuggling run: hand the crate over here";
					};
				};
				// "Unpack From The Truck" (v1.1.0): sealed crates within 20m, at HQ
				// (each crate - or the vehicle carrying it - at HQ itself, like the server checks)
				private _n = 0;
				if ([_u] call ABZ_fnc_atHQ) then {
					_n = {
						(_x getVariable ["ABZ_crate", []]) isNotEqualTo [] && {[[_x, attachedTo _x] select (!isNull attachedTo _x)] call ABZ_fnc_atHQ}
					} count (nearestObjects [_u, [ABZ_crateClass], 20]);
					{
						private _holder = _x;
						if ([_holder] call ABZ_fnc_atHQ) then {
							_n = _n + ({ _x isEqualType objNull && {(_x getVariable ["ABZ_crate", []]) isNotEqualTo []} } count (_holder getVariable ["ace_cargo_loaded", []]));
						};
					} forEach (nearestObjects [_u, missionNamespace getVariable ["ace_cargo_cargoHolderTypes", ["LandVehicle", "Air", "Ship"]], 20]);
				};
				ABZ_unpackHere = _n;
				if (!isNil "ABZ_aceAction") then {
					{
						if !(_x getVariable ["ABZ_aceAdded", false]) then {
							_x setVariable ["ABZ_aceAdded", true];
							[_x, 0, ["ACE_MainActions"], ABZ_aceAction] call ace_interact_menu_fnc_addActionToObject;
						};
					} forEach ABZ_nearTraders;
				};
			} else {
				ABZ_nearTraders = [];
				ABZ_unpackHere = 0;
			};
			sleep 1.5;
		};
	};

	// readouts: the sealed crate you're looking at, and traders near you
	addMissionEventHandler ["Draw3D", {
		private _o = cursorObject;
		if (!isNull _o && {player distance _o < 20}) then {
			private _d = _o getVariable ["ABZ_crate", []];
			private _ri = _o getVariable ["ABZ_runInfo", []];
			if (_d isEqualTo [] && {_ri isNotEqualTo []}) then {
				_ri params [["_who", ""], ["_dn", ""], ["_dt", ""]];
				drawIcon3D [
					"\A3\ui_f\data\map\markers\military\box_CA.paa",
					[1, 0.6, 0.25, 1],
					(ASLToAGL getPosASL _o) vectorAdd [0, 0, 0.9],
					0.8, 0.8, 0,
					format ["SMUGGLED CRATE (%1) - hand it to %2 near %3", _who, _dn, _dt],
					2, 0.033, "PuristaMedium"
				];
			};
			if (_d isNotEqualTo []) then {
				_d params ["_c", "_n"];
				drawIcon3D [
					"\A3\ui_f\data\map\markers\military\box_CA.paa",
					[1, 0.8, 0.4, 1],
					(ASLToAGL getPosASL _o) vectorAdd [0, 0, 0.9],
					0.8, 0.8, 0,
					format ["BAZAAR CRATE - %1x %2 (haul to HQ, unpack via scroll menu)", _n, [_c] call ABZ_fnc_displayNameOf],
					2, 0.033, "PuristaMedium"
				];
			};
		};
		{
			if (alive _x) then {
				drawIcon3D [
					"\A3\ui_f\data\map\markers\military\dot_CA.paa",
					[1, 0.75, 0.3, 0.9],
					(ASLToAGL getPosASL _x) vectorAdd [0, 0, 2.2],
					0.6, 0.6, 0,
					format ["BAZAAR - %1", _x getVariable ["ABZ_vendorName", "trader"]],
					2, 0.03, "PuristaMedium"
				];
			};
		} forEach ABZ_nearTraders;
	}];
};

// every machine: build the Arms Dealer lookup (fn_dealerReach) in the
// background, so the first sell menu doesn't stall on it
if (hasInterface) then {
	[] spawn { sleep 20; call ABZ_fnc_dealerReach };
};

if (isServer) then {
	// The following functions replaced by new server game save  / server init done event handlers (see below)
	// Make sure they don't do anything inadvertently, in case we missed a call to them
	OBSOLETE_SYS(ABZ_fnc_load,{});
	OBSOLETE_SYS(ABZ_fnc_queueSave,{});
	OBSOLETE_SYS(ABZ_fnc_syncCommit,{});
	OBSOLETE_SYS(ABZ_fnc_save,{});

	// Boot function replaced with a simple(r) event handler for AU server init done event,
	// since we're not concerned about non-AU functionality
	INFO("[ABZ] Hooking into CBA server init done event");
	[CBA_EVENT_SERVER_INIT_DONE, { spawn ABZ_fnc_onEventServerInitDone }] call FUNCMAIN(addEventHandler);

	// Periodic autosave loop (queueSave --> syncCommit --> save) disabled as we now rely on AU Server Game Save event
	// No need to queue save data and sync it after an AU campaign save, if the bazaar save data is now part of the campaign save, right?
	INFO("[ABZ] Hooking into CBA server game save event");
	[CBA_EVENT_SERVER_GAME_SAVE, { call ABZ_fnc_onEventServerGameSave }] call FUNCMAIN(addEventHandler);

	// ! Leaving the rest of this commented (for now) in case of implementation issues.
	/*
	missionNamespace setVariable ["ABZ_bootFunc", {
		[] spawn {
			sleep 5;	// let Antistasi finish stamping its factions/arsenal
			call ABZ_fnc_buildPool;
			call ABZ_fnc_buildVehPool;
			call ABZ_fnc_dealerReach;	// build the Arms Dealer lookup here, scheduled, not mid-restock
			call ABZ_fnc_load;
			call ABZ_fnc_queueSave;	// starts the save loop (on Antistasi: commits with each Antistasi save)
			call ABZ_fnc_publishStalls;
			[] spawn ABZ_fnc_vendorLoop;
			[] spawn ABZ_fnc_seizureLoop;
		};
	}];

	// Use Antistasi Ultimate's official "server init done" hook when present
	// (guarantees factions, towns and the campaign ID are set); otherwise a
	// plain delay.
	if (!isNil "A3A_fnc_onServerInitDone") then {
		[{ [] call (missionNamespace getVariable "ABZ_bootFunc") }] call A3A_fnc_onServerInitDone;
	} else {
		[] spawn {
			sleep 10;
			[] call (missionNamespace getVariable "ABZ_bootFunc");
		};
	};

	// periodic autosave so restock timers and crate positions stay fresh
	[] spawn {
		while { true } do {
			sleep 300;
			call ABZ_fnc_queueSave;
		};
	};
	*/
};

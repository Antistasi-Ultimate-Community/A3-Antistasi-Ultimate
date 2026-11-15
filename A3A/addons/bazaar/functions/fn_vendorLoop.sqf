// SERVER: the heartbeat, every 15s: keep the trader count up to the setting,
// then one tick per trader (fn_vendorTick: timers, watchdog, spawning the
// unit only while a player is within 900m).
// Every step that changes ABZ_vendors / ABZ_vendorObjs runs UNSCHEDULED
// (isNil) so it can't interleave with an admin reset or a purchase.
#include "..\script_component.hpp"
if (!isServer) exitWith {};
if (!isNil "ABZ_loopRunning") exitWith {};
ABZ_loopRunning = true;

while { true } do {
	sleep 15;
	if (ABZ_pool isEqualTo []) then { continue };
	// real players only: Antistasi parks headless clients at HQ, and counting
	// them kept every stall near HQ spawned forever
	private _humans = allPlayers - (entities "HeadlessClient_F");

	isNil {
		private _want = round (missionNamespace getVariable ["ABZ_vendorCount", 3]);
		if (count ABZ_vendors < _want) then {
			private _e = [ABZ_nextId] call ABZ_fnc_vendorCreate;
			if (_e isNotEqualTo []) then {
				ABZ_nextId = ABZ_nextId + 1;
				ABZ_vendors pushBack _e;
				// a new stall: contracts not yet taken are re-rolled with it as a possible partner
				{ [_x] call ABZ_fnc_entryPad; if !(_x select 15) then { _x set [14, -1] } } forEach ABZ_vendors;
				[_e] call ABZ_fnc_vendorMarker;
				if (missionNamespace getVariable ["ABZ_announce", true]) then {
					private _job = _e param [12, []];
					private _jobTxt = "";
					if (_job isNotEqualTo []) then {
						_jobTxt = format [localize "STR_A3U_Bazaar_Chat_LookingFor", _job select 1, [_job select 0] call ABZ_fnc_displayNameOf, _job select 3];
					};
					["ABZ_chat", [format [localize "STR_A3U_Bazaar_Chat_WordOnTheStreet", _e select 5, _e select 1, _jobTxt]]] call CBA_fnc_globalEvent;
				};
				Info_3("[ABZ] New trader %1 (#%2) at %3", _e select 5, _e select 0, _e select 1);
				call ABZ_fnc_queueSave;
			};
		};
		if (count ABZ_vendors > _want) then {
			private _e = ABZ_vendors select ((count ABZ_vendors) - 1);
			[_e select 0] call ABZ_fnc_vendorDespawn;
			deleteMarker format ["ABZ_vendor_%1", _e select 0];
			ABZ_vendors deleteAt ((count ABZ_vendors) - 1);
			call ABZ_fnc_queueSave;
		};
	};

	{
		private _id = _x select 0;
		isNil { [_id, _humans] call ABZ_fnc_vendorTick };
	} forEach +ABZ_vendors;

	isNil { call ABZ_fnc_publishStalls };
};

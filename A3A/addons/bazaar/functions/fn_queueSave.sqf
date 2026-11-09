// SERVER: asks for the Bazaar to be saved (traders, stock, timers, sealed
// crates - fn_save). Does nothing until the boot has restored the last save
// (ABZ_loaded): nothing may ever be written over a campaign's data before
// it has been read. The boot calls this right after fn_load, which starts
// the saving for the session:
//
// On Antistasi the Bazaar saves TOGETHER WITH Antistasi's own save - the
// autosave or a manual save - never on its own. Antistasi stamps every save
// with the real-world time ("saveTime"); the frame it changes, the Bazaar
// commits its state (fn_syncCommit, unscheduled, one step). Loading a
// campaign then brings the Bazaar back exactly as it was at that save: a
// crate bought after the last Antistasi save is gone again, just like the
// money that paid for it (otherwise quitting without saving would keep the
// crate AND the money).
// Elsewhere: saved 5 seconds after anything changes.
#include "..\script_component.hpp"
if (!isServer) exitWith {};
if !(missionNamespace getVariable ["ABZ_loaded", false]) exitWith {};

ABZ_saveDirty = true;
if (isNil "ABZ_saveLoop") then {
	ABZ_saveLoop = true;
	private _withAU = (call ABZ_fnc_isAntistasi) && {!isNil "A3A_fnc_saveLoop"} && {!isNil "A3A_fnc_returnSavedStat"} && {!isNil "A3A_saveTarget"};
	if (_withAU) then {
		ABZ_saveStampLast = call ABZ_fnc_saveStamp;	// the save just restored
		ABZ_saveEH = addMissionEventHandler ["EachFrame", { call ABZ_fnc_syncCommit }];
		Info("[ABZ] Saving together with Antistasi's saves");
	} else {
		[] spawn {
			while { true } do {
				sleep 5;
				if (ABZ_saveDirty) then {
					ABZ_saveDirty = false;
					isNil { call ABZ_fnc_save };	// one uninterrupted snapshot
				};
			};
		};
	};
};

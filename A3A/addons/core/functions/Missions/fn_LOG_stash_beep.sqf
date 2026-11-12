#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
	Function: A3U_fnc_LOG_stash_beep
	
	Description:
	    Handles the 3D audio beeping mechanic for the Stash logistics mission.
	    Loops a sonar/electronic ping until the stash is secured or destroyed.
	
	Parameters:
	    0: _stash - The stash object emitting the sound <OBJECT>
	
	Returns:
	    None
	
	Environment:
	    Scheduled
	    
	Author:
	    Maxx
---------------------------------------------------------------------------- */

params ["_stash"];

if (isNull _stash) exitWith {};

while {
	alive _stash && {
		(_stash getVariable ["A3A_isBeepingStash", false])
	}
} do {
	playSound3D ["A3\Sounds_F\weapons\Mines\electron_trigger_1.wss", _stash, false, getPosASL _stash, 2.5, 1, 75];
	sleep 1.5;
};
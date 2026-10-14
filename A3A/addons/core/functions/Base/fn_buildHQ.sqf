#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (petros != (leader group petros)) then
{
	private _groupPetros = createGroup teamPlayer;
	[petros] join _groupPetros;
	_groupPetros selectLeader petros;
};

petros switchAction "PlayerStand";
petros disableAI "MOVE";
petros disableAI "AUTOTARGET";
petros setBehaviour "SAFE";

// Put petros back on the server, otherwise might cause issues on disconnect
[group petros, 2] remoteExec ["setGroupOwner", 2];

[getPos petros, false] remoteExec ["A3A_fnc_relocateHQObjects", 2];

[{
	[CBA_EVENT_CLIENT_HQ_PLACED, [getPos petros, player]] call FUNCMAIN(triggerGlobalEvent);
}, nil, 5] call CBA_fnc_waitAndExecute;

nil;

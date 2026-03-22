//fn_buildHQ
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

petros setVariable ["A3A_Petros_partyStopRequested", false];
private _nearPlayers = allPlayers select { (_x distance petros) < 50 };

if (daytime >= 21.0 || daytime < 6.0) then {
	private _message = format ["Petros :)  %1", localize "STR_A3U_Petros_buildHQ_party"];

	if (count _nearPlayers > 0) then {
	    private _owners = _nearPlayers apply { owner _x };
	    [_message] remoteExec ["systemChat", _owners];
	};
    [petros] spawn A3A_fnc_petrosParty;
} else {
	private _hqPhrases = [
	    localize "STR_A3U_Petros_buildHQ_phrase1",
	    localize "STR_A3U_Petros_buildHQ_phrase2",
	    localize "STR_A3U_Petros_buildHQ_phrase3"
	];
	private _message = format ["Petros :)  %1", selectRandom _hqPhrases];

	if (count _nearPlayers > 0) then {
	    private _owners = _nearPlayers apply { owner _x };
	    [_message] remoteExec ["systemChat", _owners];
	};
};


// Put petros back on the server, otherwise might cause issues on disconnect
[group petros, 2] remoteExec ["setGroupOwner", 2];

[getPos petros, false] remoteExec ["A3A_fnc_relocateHQObjects", 2];

sleep 5;
["HQPlaced", [getPos petros]] call EFUNC(Events,triggerEvent);

#include "..\defines.inc"
FIX_LINE_NUMBERS()

private _resourcesFIA = server getVariable ["resourcesFIA", 0];

if(_resourcesFIA < 10) exitWith {
    Info("Not enough rebel resources to share.");
    [
        localize "STR_antistasi_actions_common_notifications_share_money_title", 
        localize "STR_antistasi_actions_common_notifications_share_money_not_enough_text"
    ] remoteExecCall ["A3A_fnc_customHint", theBoss];
};


private _affectedPlayers = call SCRT_fnc_misc_getRebelPlayers;

if (membershipEnabled) then {
    _affectedPlayers = _affectedPlayers select { 
        private _uid = getPlayerUID _x;
        private _isMember = _x call A3A_fnc_isMember;
       _isMember
    };
};

private _playersCount = count _affectedPlayers;

if(_playersCount > 0) then {
    private _sharePerPlayer = round(_resourcesFIA / _playersCount);

    Info_2("Share per player: %1, quantity of players: %2",str _sharePerPlayer,str _playersCount);

    { 
        [_sharePerPlayer] remoteExec ["A3A_fnc_resourcesPlayer", _x];
        private _paycheckText = format [
            localize "STR_comms_mp_money_share",
            name theBoss,
            name _x,  
            _sharePerPlayer,
            A3A_faction_civ get "currencySymbol"
    	];

		[petros, "income", _paycheckText] remoteExec ["A3A_fnc_commsMP", _x];
    } forEach _affectedPlayers;
};

server setVariable ["resourcesFIA", 0, true];

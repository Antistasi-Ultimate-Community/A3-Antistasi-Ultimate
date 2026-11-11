// SERVER: a player wants to browse a trader - send them the stock snapshot
// (the client opens the dialog when it arrives).
// _tok is the client's request token; a refusal echoes it so it only ends
// THAT request, never a newer one.
if (!isServer) exitWith {};
params [["_player", objNull, [objNull]], ["_id", -1, [0]], ["_tok", -1, [0]]];
if (isNull _player) exitWith {};

private _e = [_id] call ABZ_fnc_vendorEntry;
private _why = [_player, _e] call ABZ_fnc_serverCanTrade;
if (_why != "") exitWith { ["ABZ_shopRefused", [_why, _tok], _player] call CBA_fnc_targetEvent };

["ABZ_shopData", [_e, _player] call ABZ_fnc_shopPayload, _player] call CBA_fnc_targetEvent;

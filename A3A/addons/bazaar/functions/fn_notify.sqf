// Client: feedback to the player. [_msg, _header]
// Inside Antistasi it goes through Antistasi's own notification queue
// (A3A_fnc_customHint). A plain hint is NOT reliable there: Antistasi
// re-renders its hint box several times a second for 15s after any queued
// notification, which wiped Bazaar messages before anyone saw them -
// "I pressed Browse and nothing happened". So EVERY player-facing Bazaar
// message goes through here.
params [["_msg", "", [""]], ["_header", "Bazaar", [""]]];
if (_msg == "" || {!hasInterface}) exitWith {};

if (!isNil "A3A_fnc_customHint") then {
	// our messages use the two-character sequence \n for line breaks
	private _body = _msg;
	private _i = _body find "\n";
	while { _i > -1 } do {
		_body = (_body select [0, _i]) + "<br/>" + (_body select [_i + 2]);
		_i = _body find "\n";
	};
	// customHint REPLACES an entry with the same header in place and only
	// draws the top one - an older Bazaar entry buried under an Antistasi
	// notification would swallow this message. Drop ours first so the new
	// one is pushed on top.
	if (!isNil "A3A_customHint_MSGs" && {A3A_customHint_MSGs isEqualType []}) then {
		private _old = A3A_customHint_MSGs findIf { (_x param [0, ""]) isEqualTo _header };
		if (_old > -1) then { A3A_customHint_MSGs deleteAt _old };
	};
	[_header, _body, true] call A3A_fnc_customHint;
} else {
	hintSilent _msg;
};

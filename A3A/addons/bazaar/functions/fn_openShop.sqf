// Client: "Browse the Bazaar" (scroll action, ACE interaction or Shift+K) -
// ask the server for this trader's stock. The dialog opens when the
// snapshot arrives (fn_shopFill), only while THIS request is pending: the
// server's refusal arrives as ABZ_shopRefused and ends it; nothing else does.
// [_id]  (a trader id; an object carrying ABZ_vendorId is accepted too)
#include "..\dialogues\ids.inc"
params [["_id", -1, [0, objNull]]];
if (!hasInterface) exitWith {};
if (_id isEqualType objNull) then { _id = _id getVariable ["ABZ_vendorId", -1] };
if (_id < 0) exitWith {};

// only our own dialog blocks a new request. (v1.0.1 refused whenever ANY
// dialog was open, so one stuck menu from another mod killed the Bazaar.)
if (!isNull (findDisplay ABZ_IDD_SHOP)) exitWith {};
if (time < (missionNamespace getVariable ["ABZ_openCooldown", -1])) exitWith {};
ABZ_openCooldown = time + 1;

// instant undercover feedback - the server checks again and has the final
// word. Uses the town centre, exactly like the server does.
private _stall = ((missionNamespace getVariable ["ABZ_stalls", []]) select { (_x select 0) == _id }) param [0, []];
private _centre = _stall param [2, getPosATL player];
private _why = [call CBA_fnc_currentUnit, _centre] call ABZ_fnc_undercoverOk;
if (_why != "") exitWith { [_why] call ABZ_fnc_notify };

private _tok = floor (random 1000000);
ABZ_shopReqTok = _tok;
ABZ_shopPending = 1;	// > 0 = a request is waiting; ended by its answer or the timer below
["ABZ_shopReq", [player, _id, _tok]] call CBA_fnc_serverEvent;

// never fail silently: no answer within 8s -> say so (only for the request
// this timer belongs to)
[_tok] spawn {
	params ["_tok"];
	sleep 8;
	// check-and-clear in one unscheduled step, so an answer can't slip in
	// between: whichever comes first - the answer or this - ends the request
	isNil {
		if ((missionNamespace getVariable ["ABZ_shopReqTok", -1]) isEqualTo _tok
			&& {(missionNamespace getVariable ["ABZ_shopPending", -1]) > 0}
			&& {isNull (findDisplay ABZ_IDD_SHOP)}) then {
			ABZ_shopPending = -1;
			[localize "STR_A3U_Bazaar_Notify_NoAnswer"] call ABZ_fnc_notify;
		};
	};
};

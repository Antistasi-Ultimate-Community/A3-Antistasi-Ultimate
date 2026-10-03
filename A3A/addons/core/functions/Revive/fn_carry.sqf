params ["_carry", "_carrier"];

if (!alive _carry) exitWith {
	[localize  "STR_A3A_revive_carry_header", format [localize "STR_A3A_revive_carry_dead",name _carry]] call A3A_fnc_customHint;
};

if !(_carry getVariable ["incapacitated",false]) exitWith {
	[localize  "STR_A3A_revive_carry_header", format [localize "STR_A3A_revive_no_longer_need_help",name _carry]] call A3A_fnc_customHint;
};

if !(isNull attachedTo _carry) exitWith {
	[localize  "STR_A3A_revive_carry_header", format [localize "STR_A3A_revive_transported",name _carry]] call A3A_fnc_customHint;
};
if (call A3A_fnc_isCarrying) exitWith {[_titleStr, format [localize "STR_A3A_fn_revive_carry_already",name _carry]] call A3A_fnc_customHint;};

if (captive _carrier) then {
	_carrier setCaptive false
};
_carrier setVariable ["A3A_carryingObject", true];

_carrier playMoveNow "AcinPknlMstpSrasWrflDnon";
[_carry,"AinjPpneMrunSnonWnonDb"] remoteExec ["switchMove",_carry];
_carry setVariable ["helped",_carrier,true];
[_carry,"remove"] remoteExec ["A3A_fnc_flagaction",0,_carry];
_carry attachTo [_carrier, [0,1.1,0.092]];
_carry setDir 180;
_timeOut = time + 60;
_action = _carrier addAction [format [localize "STR_antistasi_actions_release_carry",name _carry], {_this#0 setVariable ["A3A_cancelCarry", true]},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];

waitUntil {sleep 0.5; 
	(!alive _carry) or 
	!([_carrier] call A3A_fnc_canFight) or
	!(_carry getVariable ["incapacitated",false]) or
	(_carrier getVariable ["A3A_cancelCarry", false]) or
	(time > _timeOut) or
	(vehicle _carrier != _carrier)
};

[] call SCRT_fnc_misc_updateRichPresence;

_carrier removeAction _action;
if (_carry in attachedObjects _carrier) then {detach _carry};
_carrier setVariable ["A3A_cancelCarry", nil];
_carrier setVariable ["A3A_carryingObject", nil];
_carrier playMove "amovpknlmstpsraswrfldnon";
[_carry,"UnconsciousReviveDefault"] remoteExec ["switchMove",_carry];
[_carry,"heal1"] remoteExec ["A3A_fnc_flagaction",0,_carry];
sleep 5;
_carry setVariable ["helped",objNull,true];

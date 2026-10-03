params ["_moneyX", ["_hasSound", false]];

[CBA_EVENT_CLIENT_RESOURCE_CHANGE, [_moneyX]] call FUNCMAIN(triggerLocalEvent);

if (_hasSound && {_moneyX > 0}) then {
	playSound "3DEN_notificationDefault";
};

_moneyX = _moneyX + (player getVariable "moneyX");
if (_moneyX < 0) then {_moneyX = 0};

player setVariable ["moneyX",_moneyX,true];
[] spawn A3A_fnc_statistics;

true

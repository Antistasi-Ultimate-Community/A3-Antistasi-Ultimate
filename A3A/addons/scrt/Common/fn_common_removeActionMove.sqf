params ["_vehicle"];

private _actionId = _vehicle getVariable ["scrt_moveActionId", nil];
if(!isNil "_actionId") then {
    _vehicle removeAction _actionId;
	_vehicle setVariable ["scrt_moveActionId", nil];
};

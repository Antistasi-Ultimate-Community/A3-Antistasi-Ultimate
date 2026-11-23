/*
	author: Socrates
	description: Adds move action to vehicle.
	returns: nothing
*/
params ["_vehicle"];

private _actionId = _vehicle getVariable ["scrt_moveActionId", nil];

//Check if action exists already
if(!isNil "_actionId") then {
	_vehicle removeAction _actionId;
};

//add action
_actionId = _vehicle addAction [
    (localize "STR_antistasi_actions_carry_crate"), 
    SCRT_fnc_common_moveStatic,
    nil,
    0,
    false,
    true,
    "",
    "(isPlayer _this) && {(_this == _this getVariable ['owner',objNull]) && {isNull attachedTo _target}}", 
    4
];

_vehicle setVariable ["scrt_moveActionId", _actionId, false];

//add event handler to remove action from vehicle when it's killed
_vehicle addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[_unit] remoteExec ["SCRT_fnc_common_removeActionMove",0, _unit];
}];

_actionId;

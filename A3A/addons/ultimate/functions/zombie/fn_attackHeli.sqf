params ["_heli", "_target"];

private _gunner = (gunner _heli);
if (isNil "_gunner") exitWith {};

private _weapon = (weapons _heli) select 0; 
private _mode = (getArray (configFile >> "cfgweapons" >> _weapon >> "modes")) select 0;

if (_mode == "this") then {_mode = _weapon};

_gunner doTarget _target;

while {alive _heli} do 
{
    if (!(alive _target)) exitWith {};

    if (_heli aimedAtTarget [_target] >= 0.6) then {
        (gunner _heli) fireAtTarget [_target, _weapon];
    };

    uiSleep 0.2;
};
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_victim", "_killer"];

//Stops the unit from spawning things
if (_victim getVariable ["spawner",false]) then
{
	_victim setVariable ["spawner",nil,true]
};

//Gather infos, trigger timed despawn
private _victimGroup = group _victim;
private _victimSide = side (group _victim);
private _isRival = _victim getVariable ["isRival", false];
[_victim] spawn A3A_fnc_postmortem;

// Deplete resource pools if we haven't paid for this unit in advance
private _pool = _victim getVariable ["A3A_resPool", "legacy"];
if (_pool == "legacy" && {!_isRival}) then {
	[-10, _victimSide, "legacy"] remoteExecCall ["A3A_fnc_addEnemyResources", 2];
};


if (A3A_hasACE) then
{
	if ((isNull _killer) || (_killer == _victim)) then
	{
		_killer = _victim getVariable ["ace_medical_lastDamageSource", _killer];
	};
};

if (_victimSide in [Occupants, Invaders]) then {
    [_victim, _victimGroup, _killer] spawn A3A_fnc_AIreactOnKill;
};

if (side (group _killer) == teamPlayer) then
{
    if (isPlayer _killer) then
    {
        [2,_killer] call A3A_fnc_addScorePlayer;
        if (captive _killer) then
        {
            if (_killer distance _victim < distanceSPWN) then
            {
                [_killer,false] remoteExec ["setCaptive",_killer];
            };
        };
        _killer addRating 1000;
    };
    if (vehicle _killer isKindOf "StaticMortar") then
    {
        {
            if ((_x distance _victim < 300) and (captive _x)) then
            {
                [_x,false] remoteExec ["setCaptive",_x];
            };
        } forEach (call A3A_fnc_playableUnits);
    };
	if (count weapons _victim < 1 && {!(_victim getVariable ["isAnimal", false])}) then
    {
        //This doesn't trigger for dogs, only for surrendered units
        Debug("aggroEvent | Rebels killed a surrendered unit");
		if (_victimSide == Occupants) then
		{
			[0,-2,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
		};

        if (!_isRival) then {
            [_victimSide, 20, 30] remoteExec ["A3A_fnc_addAggression", 2];
        };
	}
	else
	{
		[-1,1,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
        if (!_isRival) then {
            [_victimSide, 0.5, 45] remoteExec ["A3A_fnc_addAggression", 2];
        };
	};
    if (_isRival) then {
        [random [3,4,5], 30] remoteExec ["SCRT_fnc_rivals_reduceActivity",2];
    };
}
else
{
	if (_victimSide == Occupants) then
	{
		[-0.25,0,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
	}
	else
	{
        if (!_isRival) then {
            [0.25,0,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
        } else {
            [random [3,4,5], 30] remoteExec ["SCRT_fnc_rivals_reduceActivity",2];
        };
	};
};

private _victimLocation = _victim getVariable ["markerX", ""];
if (_victimLocation != "") then
{
	if (sidesX getVariable [_victimLocation,sideUnknown] == _victimSide) then
	{
		[_victim getVariable "unitType",_victimSide,_victimLocation,-1] remoteExec ["A3A_fnc_garrisonUpdate",2];
        [_victimLocation,_victimSide] remoteExec ["A3A_fnc_zoneCheck",2]
	};
};

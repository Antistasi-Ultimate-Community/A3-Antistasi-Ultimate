params ["_groupZombies", "_zombie"];

// For some reason, the AI will just... stop working if the leader of the group is dead?

_zombie setVariable ["A3U_zombieGroup", _groupZombies];
_zombie addEventHandler ["Killed", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];
    private _groupZombies = _unit getVariable ["A3U_zombieGroup", grpNull];
    if (_unit isEqualTo (leader _groupZombies) && {units _groupZombies isNotEqualTo []}) then {
        _groupZombies selectLeader selectRandom (units _groupZombies select {alive _x});
    };
}];

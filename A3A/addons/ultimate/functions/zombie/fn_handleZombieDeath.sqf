params ["_groupZombies", "_zombie"];

// For some reason, the AI will just... stop working if the leader of the group is dead?

_zombie addEventHandler ["Killed", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];
    
    if (_unit isEqualTo (leader _groupZombies)) then {
        _groupZombies selectLeader (units _groupZombies select {alive _x});
    };
}];
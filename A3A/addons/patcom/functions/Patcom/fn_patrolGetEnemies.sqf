#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_group"];

private _side = side _group;
private _enemySides = [];
private _knownEnemies = [];

_enemySides = if (gameMode isEqualTo 2) then {
    switch (_side) do {
        case (teamPlayer): { [Occupants, Invaders, sideEnemy] };
        case (Occupants);
        case (Invaders): { [teamPlayer, sideEnemy] };
    };
} else {
    switch (_side) do {
        case (teamPlayer): { [Occupants, Invaders, sideEnemy] };
        case (Occupants): { [teamPlayer, Invaders, sideEnemy] };
        case (Invaders): { [teamPlayer, Occupants, sideEnemy] };
    };
};

_knownEnemies append (_group targets [true, PATCOM_VISUAL_RANGE, _enemySides, PATCOM_TARGET_TIME]);

{
    if ((side _x) in _enemySides) then {
        if ((_group knowsAbout _x) > 2) then {
            _knownEnemies pushBackUnique (group _x);
        };
    };
} forEach (allUnits inAreaArray [getPosATL (leader _group), PATCOM_VISUAL_RANGE, PATCOM_VISUAL_RANGE]);

_knownEnemies
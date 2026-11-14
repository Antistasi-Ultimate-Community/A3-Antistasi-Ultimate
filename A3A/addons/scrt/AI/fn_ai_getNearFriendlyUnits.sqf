/*
Maintainer: Socrates
   Returns all near friendly AI capable units. 
   Local only.

Return Value:
    <ARRAY> Units

Scope: Client
Environment: Any
Public: Yes

Example:
[] call SCRT_fnc_ai_getNearFriendlyUnits
*/

if (!unconsciousPossessAi) exitWith {[]};

private _units = (units player) select {
    !(isPlayer _x) 
    && _x isNotEqualTo petros
    && {_x inArea [player, 200, 200, 0, false]
    && {!((animationState _x) in (medicAnims apply {toLowerANSI _x})) //already being healed, player shouldn't be able to interrupt the process
    && {[_x] call A3A_fnc_canFight
    //players might find FAKs anywhere on battlefield to heal their unconscious original body?
    // && {(([_x, "FirstAidKit"] call BIS_fnc_hasItem) || ([_x, "Medikit"] call BIS_fnc_hasItem))
}}}};

[_units, [], { _x getUnitTrait "Medic" }, "DESCEND"] call BIS_fnc_sortBy

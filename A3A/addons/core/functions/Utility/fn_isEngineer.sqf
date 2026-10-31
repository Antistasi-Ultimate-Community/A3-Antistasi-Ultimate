/*

Credit: https://github.com/official-antistasi-community/A3-Antistasi/blob/2df1d16ef7ffcce598e56095439e6f6cbb1087dd/A3A/addons/core/functions/Utility/fn_isEngineer.sqf

*/

params ["_unit"];

if (!isNil {_unit getVariable "ace_isEngineer"}) exitWith {
    // Yes, the spec for this var is garbage
    !(_unit getVariable "ace_isEngineer" in [0, false])
};

_unit getUnitTrait "engineer";

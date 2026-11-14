/*
Maintainer: Wurzel0701
    Checks if the HQ can currently be moved

Arguments:
    <NIL>

Return Value:
    <ARRAY> If the HQ can be moved right now, first element bool, every other afterwards string, at least 2 elements

Scope: Local
Environment: Any
Public: Yes
Dependencies:
    <OBJECT> theBoss
    <OBJECT> boxX
    <OBJECT> petros

Example:
[] call A3A_fnc_canMoveHQ;
*/

private _result = [false];
if (player != theBoss) then
{
    [localize "STR_antistasi_journal_entry_header_commander_5", localize "STR_generic_commander_only"] call A3A_fnc_customHint;
    _result pushBack (localize "STR_A3A_Base_canMoveHq_only_comm");
};

if ((weaponCargo boxX isNotEqualTo []) or (count magazineCargo boxX >0) or (itemCargo boxX isNotEqualTo []) or (backpackCargo boxX isNotEqualTo [])) then
{
    if(count _result == 1) then
    {
        [localize "STR_antistasi_journal_entry_header_commander_5", localize "STR_A3A_Base_canMoveHq_arsenal_empty"] call A3A_fnc_customHint;
    };
    _result pushBack (localize "STR_A3A_Base_canMoveHq_arsenal_empty_2");
};

if !(isNull attachedTo petros) then
{
    if(count _result == 1) then
    {
        [localize "STR_antistasi_journal_entry_header_commander_5", localize "STR_A3A_Base_canMoveHq_arsenal_petros_picked"] call A3A_fnc_customHint;
    };
    _result pushBack (localize "STR_A3A_Base_canMoveHq_arsenal_petros_picked_2");
};

if(count _result != 1) exitWith {
    _result;
};

[true, ""];

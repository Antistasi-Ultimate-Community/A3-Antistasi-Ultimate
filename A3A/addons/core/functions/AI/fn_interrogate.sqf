#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_unit", "_player", "_actionID"];

/*  The action of interrogating a surrendered unit.
*   Params:
*       _unit : OBJECT : The unit which will be interrogated
*       _player : OBJECT : The unit which is interrogating
*       _unused : NOT USED
*       _actionID : NUMBER : The ID of the interrogate action
*
*   Returns:
*       Nothing
*/

//Removing action
[_unit, _actionID] remoteExec ["removeAction", [teamPlayer, civilian], _unit];

if (!alive _unit) exitWith {};
if (_unit getVariable ["interrogated", false]) exitWith {};
_unit setVariable ["interrogated", true, true];

_player globalChat (selectRandom [
        localize "STR_interrogate_phrase1_text",
        localize "STR_interrogate_phrase2_text",
        localize "STR_interrogate_phrase3_text"
]);
private _side = side (group _unit);
private _chance = 120 - ([aggressionOccupants, aggressionInvaders] select (_side == Invaders));


sleep 4;

if (random 100 < _chance) then {

    if (hideEnemyMarkers) then {
        [1,localize "STR_reveal_interrogation_success"] call A3U_fnc_revealRandomZones;
    }; // Since bases can be revealed without "intel", don't see any negative to this. Adds a somewhat consistent way to gain zone locations

    if(_unit getVariable ["hasIntel", false]) then {
        _unit globalChat (selectRandom [
            localize "STR_interrogation_success_phrase1_text",
            localize "STR_interrogation_success_phrase2_text",
            localize "STR_interrogation_success_phrase3_text"
        ]);
        
        _unit setVariable ["hasIntel", false, true];

        if (_unit getVariable ["isRival", false]) then {
            [] remoteExecCall ["SCRT_fnc_rivals_selectIntel", 2];
        } else {
            ["Small", _side] remoteExec ["A3A_fnc_selectIntel", 2];
        };
    } else {
        _unit globalChat (selectRandom [
            localize "STR_interrogation_fail_noknowledge_phrase1_text",
            localize "STR_interrogation_fail_noknowledge_phrase2_text",
            localize "STR_interrogation_fail_noknowledge_phrase3_text"
        ]);
    };
} else {
	_unit globalChat (selectRandom [
        localize "STR_interrogation_fail_refuse_phrase1_text",
        localize "STR_interrogation_fail_refuse_phrase2_text",
        localize "STR_interrogation_fail_refuse_phrase3_text"
    ]);
};

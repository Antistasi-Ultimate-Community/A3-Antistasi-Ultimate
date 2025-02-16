/*
    Author:
        MaxxLite
    
    Description:
        on success selects a mission and assigns it to the closest enemy town.
    
    Params:
        _civUnit <Default: ObjNull>
    
    Usage:
        call A3A_fnc_dialogCivFinished;
    
    Return:
        N/A
*/
#include "..\..\script_component.hpp"
params [["_civUnit", ObjNull]];

if (_civUnit isEqualTo ObjNull) exitWith {nil};

private _possibleMarkers = [citiesX, _civUnit, true] call A3A_fnc_findIfNearAndHostile;
_possibleMarkers = _possibleMarkers select 1;

private _dialogResult = "";
private _civRequestedMission = "";

private _debugStatus = format ["[Civ Dialog] | %3 | Mission type and site selected | %1 | %2 |", _civRequestedMission, _possibleMarkers, _dialogResult];

if (4 >= random 10 && {_possibleMarkers isNotEqualTo ""}) then {
    _dialogResult = "Success";
    if (tierWar >= 5) then {
        _civRequestedMission = selectRandom [
            "A3A_fnc_RES_Refugees", 
            "A3A_fnc_RES_Informer", 
            "A3A_fnc_RES_Prisoners", 
            "A3A_fnc_RES_Deserters"
        ];
    } else {
        _civRequestedMission = selectRandom [
            "A3A_fnc_RES_Refugees", 
            "A3A_fnc_RES_Informer", 
            "A3A_fnc_RES_Prisoners"
        ];
    };

    private _civResponse = "";

    switch (_civRequestedMission) do
    {

        case "A3A_fnc_RES_Refugees":
        {
            _civResponse = (selectRandom [
                localize "STR_antistasi_actions_talk_with_civ_success_ref1", 
                localize "STR_antistasi_actions_talk_with_civ_success_ref2"
            ]);
        };

        case "A3A_fnc_RES_Informer":
        {
            _civResponse = (selectRandom [
                localize "STR_antistasi_actions_talk_with_civ_success_info1", 
                localize "STR_antistasi_actions_talk_with_civ_success_info2"
            ]);
        };

        case "A3A_fnc_RES_Prisoners":
        {
            _civResponse = (selectRandom [
                localize "STR_antistasi_actions_talk_with_civ_success_prisoners1", 
                localize "STR_antistasi_actions_talk_with_civ_success_prisoners2"
            ]);
        };
        
        case "A3A_fnc_RES_Deserters":
        {
            _civResponse = (selectRandom [
                localize "STR_antistasi_actions_talk_with_civ_success_Deserters1", 
                localize "STR_antistasi_actions_talk_with_civ_success_Deserters2"
            ]);
        };

        _civUnit globalChat _civResponse;
    };

    [[_possibleMarkers],_civRequestedMission] remoteExec ["A3A_fnc_scheduler",2];

    if (hideEnemyMarkers) then {
        if (10 >= (random 100)) then {
            [
                {
                    (_this#0) globalChat (selectRandom [
                        localize "STR_antistasi_actions_talk_with_civ_success_zone_reveal1", 
                        localize "STR_antistasi_actions_talk_with_civ_success_zone_reveal2"
                    ]);
                },
                [_civUnit], 
                5 // 5s is around the time it takes me to read the entire paragraph
            ] call CBA_fnc_waitAndExecute;

            [1, "A civilian has revealed a zone"] call A3U_fnc_revealRandomZones;
        };
    };
} else {
    _civUnit globalChat (selectRandom [
        localize "STR_antistasi_actions_talk_with_civ_fail1", 
        localize "STR_antistasi_actions_talk_with_civ_fail2", 
        localize "STR_antistasi_actions_talk_with_civ_fail3"
    ]);
    _dialogResult = "Failure";
};

diag_log _debugStatus;

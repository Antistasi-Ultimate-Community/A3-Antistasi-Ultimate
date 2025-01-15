/*
    Author:
        MaxxLite
    
    Description:
        on success selects a mission and assigns it to the closest enemy town.
    
    Params:
        _civUnit <unit> <Default: nil>
    
    Usage:
        call A3A_fnc_dialogCivFinished;
    
    Return:
        _return <TYPE>
*/

#include "..\..\script_component.hpp"
private _civilian = _this select 0;
if (4 >= random 10) then {
    private _civrequestedMission = "";
    if (tierWar >= 5) then {
        _civrequestedMission = selectRandom [
        "A3A_fnc_RES_Refugees", 
        "A3A_fnc_RES_Informer", 
        "A3A_fnc_RES_Prisoners", 
        "A3A_fnc_RES_Deserters"
        ];
    } else {
        _civrequestedMission = selectRandom [
        "A3A_fnc_RES_Refugees", 
        "A3A_fnc_RES_Informer", 
        "A3A_fnc_RES_Prisoners"
        ];
    };

    switch (_civrequestedMission) do
    {

        case "A3A_fnc_RES_Refugees":
        {
            _civilian globalChat (selectRandom [
                localize "STR_antistasi_actions_talk_with_civ_success_ref1", 
                localize "STR_antistasi_actions_talk_with_civ_success_ref2"
            ]);
            diag_log format ["[Maxxs work] %1 selected", _civrequestedMission];
        };

        case "A3A_fnc_RES_Informer":
        {
            _civilian globalChat (selectRandom [
                localize "STR_antistasi_actions_talk_with_civ_success_info1", 
                localize "STR_antistasi_actions_talk_with_civ_success_info2"
            ]);
            diag_log format ["[Maxxs work] %1 selected", _civrequestedMission];
        };

        case "A3A_fnc_RES_Prisoners":
        {
            _civilian globalChat (selectRandom [
                localize "STR_antistasi_actions_talk_with_civ_success_prisoners1", 
                localize "STR_antistasi_actions_talk_with_civ_success_prisoners2"
            ]);
            diag_log format ["[Maxxs work] %1 selected", _civrequestedMission];
        };
        
        case "A3A_fnc_RES_Deserters":
        {
            _civilian globalChat (selectRandom [
                localize "STR_antistasi_actions_talk_with_civ_success_Deserters1", 
                localize "STR_antistasi_actions_talk_with_civ_success_Deserters2"
            ]);
            diag_log format ["[Maxxs work] %1 selected", _civrequestedMission];
        };
    };
    
    private _possibleMarkers = [citiesX] call A3A_fnc_findIfNearAndHostile;
    private _site = selectRandom _possibleMarkers;

    diag_log format ["[Maxxs work] selected site: ", _site];

    [[_site],_civrequestedMission] remoteExec ["A3A_fnc_scheduler",2];
    if (hideEnemyMarkers) then {
        if (random(100) >= 25) then {
            
            sleep 2;// waits for 2 sec so the text wont appear too fast

            _civilian globalChat (selectRandom [
                localize "STR_antistasi_actions_talk_with_civ_success_zone_reveal1", 
                localize "STR_antistasi_actions_talk_with_civ_success_zone_reveal2"
            ]);

            [1, "A civilian as revealed a zone"] call A3U_fnc_revealRandomZones;
        };
    };
} else {
    _civilian globalChat (selectRandom [
        localize "STR_antistasi_actions_talk_with_civ_fail1", 
        localize "STR_antistasi_actions_talk_with_civ_fail2", 
        localize "STR_antistasi_actions_talk_with_civ_fail3"
    ]);

    if (hideEnemyMarkers) then {
        if (random(100) >= 8) then {
            
            sleep 2;// waits for 2 sec so the text wont appear too fast
            
            _civilian globalChat (selectRandom [
                localize "STR_antistasi_actions_talk_with_civ_fail_zone_reveal1", 
                localize "STR_antistasi_actions_talk_with_civ_fail_zone_reveal2"
            ]);

            [1, "A civilian as revealed a zone"] call A3U_fnc_revealRandomZones;
        };
    };
};
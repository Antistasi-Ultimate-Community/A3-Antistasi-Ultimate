/*
    Author:
        MaxxLite
    
    Description:
        on success selects a mission and assigns it to the closest enemy town.
    
    Params:
        _civUnit <Default: ObjNull>
        _caller <Default: ObjNull>
    
    Usage:
        call A3A_fnc_dialogCivFinished;
    
    Return:
        Success/Fail <BOOL>
*/
#include "..\..\script_component.hpp"
params [["_civUnit", ObjNull], ["_caller", ObjNull]];

if (_civUnit isEqualTo ObjNull || _caller isEqualTo ObjNull) exitWith {nil};

if (_civUnit getVariable ["A3U_civDialogHasSpoken", false]) exitWith {
    private _failMessage = selectRandom [
        localize "STR_antistasi_actions_talk_with_civ_fail_alreadyspoken1", 
        localize "STR_antistasi_actions_talk_with_civ_fail_alreadyspoken2"
    ];

    [_civUnit, _failMessage] remoteExec ["globalChat", _caller];
};

private _possibleMarkers = [citiesX, _civUnit, true] call A3A_fnc_findIfNearAndHostile;

private _isDialogSuccessful = (captive player && (4 >= random 10) && (_possibleMarkers isNotEqualTo []));

if (_isDialogSuccessful) exitWith {
    private _roll = random 100;
    private _missionInProgress = missionNamespace getVariable ["A3U_dialogCivMissionInProgress", false];

    if (_roll > 50 && {_missionInProgress isEqualTo false}) then {
        private _civRequestedMissions = ["A3A_fnc_RES_Refugees", "A3A_fnc_RES_Informer", "A3A_fnc_RES_Prisoners"];
        if (tierWar >= 5) then {_civRequestedMissions pushBack "A3A_fnc_RES_Deserters"};
        
        private _civResponse = "";
        private _missionMarker = selectRandom _possibleMarkers;
        private _civRequestedMission = selectRandom _civRequestedMissions;
        switch (_civRequestedMission) do
        {
            case "A3A_fnc_RES_Refugees":
            {
                _civResponse = selectRandom [
                    "STR_antistasi_actions_talk_with_civ_success_ref1", 
                    "STR_antistasi_actions_talk_with_civ_success_ref2"
                ];
            };

            case "A3A_fnc_RES_Informer":
            {
                _civResponse = selectRandom [
                    "STR_antistasi_actions_talk_with_civ_success_info1", 
                    "STR_antistasi_actions_talk_with_civ_success_info2"
                ];
            };

            case "A3A_fnc_RES_Prisoners":
            {
                _civResponse = selectRandom [
                    "STR_antistasi_actions_talk_with_civ_success_prisoners1", 
                    "STR_antistasi_actions_talk_with_civ_success_prisoners2"
                ];
            };
            
            case "A3A_fnc_RES_Deserters":
            {
                _civResponse = selectRandom [
                    "STR_antistasi_actions_talk_with_civ_success_Deserters1", 
                    "STR_antistasi_actions_talk_with_civ_success_Deserters2"
                ];
            };
        };

        [_civUnit, (localize _civResponse)] remoteExec ["globalChat", _caller];
        [[_missionMarker], _civRequestedMission] remoteExec ["A3A_fnc_scheduler",2];
        missionNamespace setVariable ["A3U_dialogCivMissionInProgress", true, true];

        if (hideEnemyMarkers) then {
            if (30 >= (random 100)) then {
                [
                    {
                        private _message = selectRandom [
                            "STR_antistasi_actions_talk_with_civ_success_zone_reveal1", 
                            "STR_antistasi_actions_talk_with_civ_success_zone_reveal2"
                        ];

                        [(_this#0), (localize _message)] remoteExec ["globalChat", _caller];
                    },
                    [_civUnit], 
                    5 // 5s is around the time it takes me to read the entire paragraph
                ] call CBA_fnc_waitAndExecute;

                [1, "A civilian has revealed a zone"] call A3U_fnc_revealRandomZones;
            };
        };
    } else {
        private _intel = ["Civilian", Occupants] call A3A_fnc_selectIntel;
        private _intelMessage = "";

        switch (_intel) do 
        {
            case 502: // dealer
            {
                _intelMessage = selectRandom [
                    "STR_antistasi_actions_talk_with_civ_success_dealer1", 
                    "STR_antistasi_actions_talk_with_civ_success_dealer2"
                ];
            };
            case 300: // weapons
            {
                _intelMessage = selectRandom [
                    "STR_antistasi_actions_talk_with_civ_success_weapons1", 
                    "STR_antistasi_actions_talk_with_civ_success_weapons2"
                ];
            };
            case 301: // traitor
            {
                _intelMessage = selectRandom [
                    "STR_antistasi_actions_talk_with_civ_success_traitor1", 
                    "STR_antistasi_actions_talk_with_civ_success_traitor2"
                ];
            };
            case 302: // money
            {
                _intelMessage = selectRandom [
                    "STR_antistasi_actions_talk_with_civ_success_money1", 
                    "STR_antistasi_actions_talk_with_civ_success_money2"
                ];
            };
            case 102: // decryption key
            {
                _intelMessage = selectRandom [
                    "STR_antistasi_actions_talk_with_civ_success_decryption1", 
                    "STR_antistasi_actions_talk_with_civ_success_decryption2"
                ];
            };
            default {_intelMessage = "STR_antistasi_actions_talk_with_civ_fail1"};
        };
        
        [_civUnit, (localize _intelMessage)] remoteExec ["globalChat", _caller];
    };

    _civUnit setVariable ["A3U_civDialogHasSpoken", true, true];

    true
};

private _failMessage = selectRandom [
    "STR_antistasi_actions_talk_with_civ_fail1", 
    "STR_antistasi_actions_talk_with_civ_fail2", 
    "STR_antistasi_actions_talk_with_civ_fail3"
];

if (!(captive player) || {aggressionOccupants >= random [30, 50, 70]}) then {
    _failMessage = selectRandom [
        "STR_antistasi_actions_talk_with_civ_fail_notundercover1",
        "STR_antistasi_actions_talk_with_civ_fail_notundercover2"
    ];
};

[_civUnit, (localize _failMessage)] remoteExec ["globalChat", _caller];

_civUnit setVariable ["A3U_civDialogHasSpoken", true, true];

false
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!hasInterface) exitWith {};

params ["_flag","_typeX"];

private _actionX = -1;

switch _typeX do
{
    case "take":
    {
        removeAllActions _flag;
        _actionX = _flag addAction [format["<img image='\A3\ui_f\data\igui\cfg\actions\takeflag_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", (localize "STR_antistasi_actions_take_flag")], A3A_fnc_mrkWIN,nil,6,true,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
        _flag setUserActionText [_actionX,(localize "STR_antistasi_actions_take_flag"),"<t size='2'><img image='\A3\ui_f\data\igui\cfg\actions\takeflag_ca.paa'/></t>"];
    };
    case "unit":
    {
        if (playerRecruitAI isEqualTo 1) then 
        {
            _flag addAction [
                format ["<img image='\a3\ui_f\data\igui\cfg\simpletasks\types\meet_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_antistasi_actions_recruit_units"],
                {
                    if ([getPosATL player] call A3A_fnc_enemyNearCheck) then {
                        [localize "STR_antistasi_actions_unit_recruitment", localize "STR_antistasi_actions_unit_recruitment_distance_check_failure"] call A3A_fnc_customHint;
                    } else { 
                        [] spawn A3A_fnc_unit_recruit; 
                    };
                },nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4
            ];
        };
    };
    case "vehicle":
    {
        _flag addAction [
            format ["<img image='a3\ui_f\data\igui\cfg\simpletasks\types\truck_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_antistasi_actions_buy_vehicle"], 
            {
                if ([getPosATL player] call A3A_fnc_enemyNearCheck) then {
                    [localize "STR_antistasi_actions_buy_vehicle", localize "STR_antistasi_actions_buy_vehicle_distance_check_failure"] call A3A_fnc_customHint
                } else {
                    createDialog "A3A_BuyVehicleDialog";
                };
            },nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4
        ];
    };
    case "petros":
    {
        petros addAction [
            format ["<img image='\A3\ui_f\data\igui\cfg\simpleTasks\types\talk_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_antistasi_actions_request_mission"], {
                #ifdef UseDoomGUI
                    ERROR("Disabled due to UseDoomGUI Switch.")
                #else
                    createDialog "missionMenu";
                #endif
            },
            nil,0,false,true,"","([_this] call A3A_fnc_isMember or _this == theBoss) and (petros == leader group petros)",4
        ];
        petros addAction [localize "STR_antistasi_actions_move_this_asset", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss) and (petros == leader group petros)"];
        petros addAction [format ["<img image='a3\ui_f\data\igui\cfg\actions\takeflag_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_antistasi_actions_build_hq"], A3A_fnc_buildHQ,nil,0,false,true,"","(_this == theBoss) and (petros != leader group petros)",4];
    };
    case "truckX":
    {
        actionX = _flag addAction [
            format [
                "<img image='\A3\ui_f\data\igui\cfg\actions\unloadVehicle_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", 
                localize "STR_antistasi_transfer_ammobox_to_truck"
            ], A3A_fnc_transfer, nil, 6, true, true, "", "(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"
        ];
    };
    case "heal":
    {
        if (player != _flag) then
        {
            _actionX = _flag addAction [
                format [
                    (format ["<img size='1.8' <img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa' /> <t>%1</t>", localize "STR_antistasi_actions_revive"]), 
                    name _flag
                ], A3A_fnc_actionRevive,nil,6,true,true,"","!(_this getVariable [""helping"",false]) and (isNull attachedTo _target)",4];
            _flag setUserActionText [_actionX,format [(localize "STR_antistasi_actions_revive"), name _flag],"<t size='2'><img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa'/></t>"];

            if (reviveKitsEnabled) then {
                [
                    _flag,
                    format [localize "STR_antistasi_actions_crk_use", name _flag],
                    "a3\missions_f_exp\data\img\lobby\ui_campaign_lobby_background_tablet_button_revive02_ca.paa",
                    "a3\missions_f_exp\data\img\lobby\ui_campaign_lobby_background_tablet_button_revive02_ca.paa",
                    "'A3AP_SelfReviveKit' in (backpackItems player) && _this distance _target < 4 && (isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (isNull attachedTo _target) and !(_this getVariable [""helping"",false]);",
                    "'A3AP_SelfReviveKit' in (backpackItems player) && _this distance _target < 4 && (isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (isNull attachedTo _target) and !(_this getVariable [""helping"",false]);",
                    {},
                    {},
                    {
                        params ["_target", "_caller", "_actionId", "_arguments"];
                        [_caller, _target] call SCRT_fnc_common_revive;
                        [_target, _actionId] call BIS_fnc_holdActionRemove;
                    }, {}, [], 2, 0, false, false
                ] call BIS_fnc_holdActionAdd;
            };
        };
    };
    case "heal1":
    {
        if (player != _flag) then
        {
            _actionX = _flag addAction [
                format [(format ["<img size='1.8' <img image='\a3\ui_f\data\igui\cfg\simpletasks\types\help_ca.paa' /> <t>%1</t>", localize "STR_antistasi_actions_revive"]), name _flag], 
                A3A_fnc_actionRevive,
                nil,
                6,true,false,"","!(_this getVariable [""helping"",false]) and (isNull attachedTo _target)",4];
            _flag setUserActionText [_actionX,format [(localize "STR_antistasi_actions_revive"),name _flag],"<t size='2'><img image='\a3\ui_f\data\igui\cfg\simpletasks\types\help_ca.paa'/></t>"];

            _actionX = _flag addAction [
                format [
                    (format ["<img size='1.8' <img image='\a3\ui_f\data\igui\cfg\actions\take_ca.paa' /> <t>%1</t>", localize "STR_antistasi_actions_carry"]), 
                    name _flag
                ], A3A_fnc_carry,nil,5,true,false,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (isNull attachedTo _target) and !(_this getVariable [""helping"",false]);",4];
            _flag setUserActionText [_actionX,format [localize "STR_antistasi_actions_carry", name _flag],"<t size='2'><img image='\a3\ui_f\data\igui\cfg\actions\take_ca.paa'/></t>"];
            if (reviveKitsEnabled) then {
                [
                    _flag,
                    format [localize "STR_antistasi_actions_crk_use", name _flag],
                    "a3\missions_f_exp\data\img\lobby\ui_campaign_lobby_background_tablet_button_revive02_ca.paa",
                    "a3\missions_f_exp\data\img\lobby\ui_campaign_lobby_background_tablet_button_revive02_ca.paa",
                    "'A3AP_SelfReviveKit' in (backpackItems player) && _this distance _target < 4 && (isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (isNull attachedTo _target) and !(_this getVariable [""helping"",false]);",
                    "'A3AP_SelfReviveKit' in (backpackItems player) && _this distance _target < 4 && (isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (isNull attachedTo _target) and !(_this getVariable [""helping"",false]);",
                    {},
                    {},
                    {
                        params ["_target", "_caller", "_actionId", "_arguments"];
                        [_caller, _target] call SCRT_fnc_common_revive;
                        [_target, _actionId] call BIS_fnc_holdActionRemove;
                    }, {}, [], 2, 0, false, false
                ] call BIS_fnc_holdActionAdd;
            };

            [_flag] call A3A_Logistics_fnc_addLoadAction;
        };
    };
    case "heal2":
    {
        _actionX = _flag addAction [
            format [
                (format ["<img size='1.8' <img image='\a3\ui_f\data\igui\cfg\simpletasks\types\help_ca.paa' /> <t>%1</t>", localize "STR_antistasi_actions_revive"]), 
                name _flag
            ], A3A_fnc_actionRevive,nil,6,true,false,"","!(_this getVariable [""helping"",false]) and (isNull attachedTo _target)",4];
        _flag setUserActionText [_actionX,format [(localize "STR_antistasi_actions_revive"),name _flag],"<t size='2'><img image='\a3\ui_f\data\igui\cfg\simpletasks\types\help_ca.paa'/></t>"];
    };
    case "remove":
    {
        if (player == _flag) then
        {
            if (isNil "actionX") then
            {
                removeAllActions _flag;
                if (player == player getVariable ["owner",player]) then {[] call SA_Add_Player_Tow_Actions};
                call A3A_fnc_dropObject;
            }
            else
            {
                _flag removeAction actionX;
            };
        }
        else
        {
            removeAllActions _flag;
        };
    };
    case "refugee":
    {
        _flag addAction [format [
            "<img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", 
            localize "STR_antistasi_actions_free_prisoner"
        ], A3A_fnc_liberaterefugee,nil,6,true,true,"","(isPlayer _this) && (_this == _this getVariable ['owner',objNull]) && alive _target",4];
    };
    case "deserter":
    {
        _flag addAction [format [
            "<img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", 
            localize "STR_antistasi_actions_free_prisoner"
        ], A3A_fnc_liberateDeserter,nil,6,true,true,"","(isPlayer _this) && (_this == _this getVariable ['owner',objNull]) && alive _target",4];
    };
    case "prisonerX":
    {
        _flag addAction [format [
            "<img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", 
            localize "STR_antistasi_actions_free_prisoner"
        ], A3A_fnc_liberatePOW,nil,6,true,true,"","(isPlayer _this) && (_this == _this getVariable ['owner',objNull]) && alive _target",4];
    };
    case "prisonerFlee":
    {
        _flag addAction [format [
            "<img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", 
            localize "STR_antistasi_actions_free_prisoner"
        ], A3A_fnc_liberateFlee,nil,6,true,true,"","(isPlayer _this) && (_this == _this getVariable ['owner',objNull]) && alive _target",4];
    };
    case "captureX":
    {
        // Uses the optional param to determine whether the call of captureX is a release or a recruit
        _flag addAction [format ["<img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_release_action"], { _this spawn A3A_fnc_captureX; },false,6,true,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
        _flag addAction [format ["<img image='a3\missions_f_oldman\data\img\holdactions\holdaction_follow_start_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_recruit_action"], { _this spawn A3A_fnc_captureX; },true,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
        _flag addAction [format ["<img image='\a3\missions_f_oldman\data\img\holdactions\holdaction_talk_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_interrogate_action"], A3A_fnc_interrogate, nil, 0, false, true, "", "(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (_target getVariable ['canBeInterrogated', false])",4];
        _flag addAction [format ["<img image='\a3\ui_f_oldman\data\igui\cfg\holdactions\map_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_reveal_action"],SCRT_fnc_common_reveal,false,6,true,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
    };
    case "captureRivals":
    {
        _flag addAction [format ["<img image='a3\ui_f\data\igui\cfg\holdactions\holdaction_secure_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_imprison_action"], { _this spawn SCRT_fnc_rivals_imprison; },false,6,true,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
        _flag addAction [format ["<img image='a3\missions_f_oldman\data\img\holdactions\holdaction_talk_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_interrogate_action"], A3A_fnc_interrogateRivals, nil, 0, false, true, "", "(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (_target getVariable ['canBeInterrogated', false])",4];
        _flag addAction [format ["<img image='a3\ui_f_oldman\data\igui\cfg\holdactions\map_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_reveal_action"],SCRT_fnc_common_reveal,false,6,true,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
    };
    case "seaport":
    {
        // No additional actions assigned.
    };
    case "garage":
    {
        [_flag] call HR_GRG_fnc_initGarage;
    };
    case "SDKFlag":
    {
#ifdef UseDoomGUI
        if (true) exitWith { ERROR("Disabled due to UseDoomGUI Switch.") };
#endif
        removeAllActions _flag;
        if (playerRecruitAI isEqualTo 1) then {
            _flag addAction [
                format ["<img image='\a3\ui_f\data\igui\cfg\simpletasks\types\meet_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_antistasi_actions_recruit_units"], 
                {
                    if ([getPosATL player] call A3A_fnc_enemyNearCheck) then {
                        [localize "STR_antistasi_actions_unit_recruitment", localize "STR_antistasi_actions_unit_recruitment_distance_check_failure"] call A3A_fnc_customHint;
                    } else { 
                        [] spawn A3A_fnc_unit_recruit; 
                    };
                },nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4
            ];
        };
        _flag addAction [
            format ["<img image='a3\ui_f\data\igui\cfg\simpletasks\types\truck_ca.paa' size='1.6' shadow=2 /> <t>%1</t>",  localize "STR_antistasi_actions_buy_vehicle"], 
            {
                if ([getPosATL player] call A3A_fnc_enemyNearCheck) then {
                    [localize "STR_antistasi_dialogs_buy_vehicle_frame_text", localize "STR_antistasi_actions_buy_vehicle_distance_check_failure"] call A3A_fnc_customHint;
                } else {
                    createDialog "A3A_BuyVehicleDialog";
                }
            },nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4
        ];
        [_flag] call HR_GRG_fnc_initGarage;
    };
    case "Intel_Small":
    {
        _flag addAction [
            format ["<img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_search_intel_text"],
            A3A_fnc_searchIntelOnLeader,
            nil,
            4,
            true,
            false,
            "",
            "!([_target] call A3A_fnc_canFight) && !(_target getVariable ['intelSearchDone', false]) && isPlayer _this",
            4
        ];
    };
    case "Intel_Medium":
    {
        _flag addAction [format ["<img image='a3\ui_f\data\igui\cfg\holdactions\holdaction_search_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_antistasi_actions_take_intel"], A3A_fnc_searchIntelOnDocument, nil, 4, true, false, "", "isPlayer _this", 4];
    };
    case "Intel_Large":
    {
        _flag addAction [format ["<img image='a3\ui_f\data\igui\cfg\holdactions\holdaction_hack_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_antistasi_actions_download_intel"], A3A_fnc_searchIntelOnLaptop, nil, 4, true, false, "", "isPlayer _this", 4];
    };
    case "Intel_Encrypted":
    {
        _flag addAction [format ["<img image='a3\ui_f\data\igui\cfg\holdactions\holdaction_hack_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_antistasi_actions_decipher_intel"], A3A_fnc_searchEncryptedIntel, nil, 4, true, false, "", "isPlayer _this", 4];
    };
    case "Intel_Rivals_Laptop":
    {
        _flag addAction [
            format ["<img image='\a3\ui_f\data\igui\cfg\holdactions\holdaction_hack_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_millaptop_getdata_text"],
            SCRT_fnc_rivals_searchDataOnLaptop,
            nil,
            4,
            true,
            false,
            "",
            "isPlayer _this && (_target getVariable ['laptopSearchDone', false] != true)",
            4
        ];
    };
    case "Move_Outpost_Static":
    {
        _flag addAction [localize "STR_antistasi_actions_move_static_weapon_emplacement", SCRT_fnc_common_moveOutpostStatic, nil, 4, true, false, "", "isPlayer _this", 4];
    };
    case "static":
    {
        private _cond = "(_target getVariable ['ownerSide', teamPlayer] == teamPlayer) and (isNull attachedTo _target) and (_this call A3A_fnc_isMember) and ";
        _flag addAction [localize "STR_antistasi_actions_move_static_allow_ai", A3A_fnc_unlockStatic, nil, 1, false, true, "", _cond+"!isNil {_target getVariable 'lockedForAI'}", 4];
        _flag addAction [localize "STR_antistasi_actions_move_static_prevent_ai", A3A_fnc_lockStatic, nil, 1, false, true, "", _cond+"isNil {_target getVariable 'lockedForAI'}", 4];
    //    _flag addAction [localize "STR_antistasi_actions_move_static_kick_ai", A3A_fnc_lockStatic, nil, 1, true, false, "", _cond+"isNil {_target getVariable 'lockedForAI'} and !(isNull gunner _target) and !(isPlayer gunner _target)}", 4];
        _flag addAction [localize "STR_antistasi_actions_move_this_asset", A3A_fnc_moveHQObject, nil, 1.5, false, true, "",  _cond+"(count crew _target == 0)", 4];
    };
    case "rivals_quest":
    {
        _flag addAction [
            format ["<img image='\a3\ui_f\data\igui\cfg\holdactions\holdaction_hack_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_millaptop_getdata_text"],
            SCRT_fnc_rivals_searchDataOnLaptopTask,
            nil,
            4,
            true,
            false,
            "",
            "isPlayer _this && (_target getVariable ['laptopSearchDone', false] != true)",
            4
        ];
    };
};

_actionX

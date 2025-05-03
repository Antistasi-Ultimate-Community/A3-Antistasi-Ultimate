//Define results for small intel
#define TIME_LEFT               101
#define DECRYPTION_KEY          102
#define CONVOY                  103
#define DEF_RESOURCES           104
#define REVEAL_ZONE_SMALL       105

//Define results for medium intel
#define ACCESS_ARMOR            200
#define ACCESS_AIR              201
#define ACCESS_HELI             202
#define CONVOYS                 203
#define COUNTER_ATTACK          204
#define KEY_PACK                205
#define CONVOY_ROUTE            206
#define REVEAL_ZONE_MEDIUM      207

//Define results for large intel
#define WEAPON                  300
#define TRAITOR                 301
#define MONEY                   302
#define REVEAL_ZONE_LARGE       303

//Additional types
#define DISCOUNT      500
#define RIVALS        501
#define DEALER        502

params ["_intelType", "_side"];

/*  Selects, creates and executes the intel of the given type and side
*   Params:
*       _intelType : STRING : One of "Small", "Medium" or "Large"
*       _side : SIDE : The enemy side, which the intel belongs to
*
*   Returns:
*       _text : STRING : The text of the selected intel
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if(isNil "_intelType") exitWith
{
    Error("No intel type given!");
};
if(isNil "_side") exitWith
{
    Error("No side given!");
};

private _faction = Faction(_side);
private _text = "";
private _sideName = _faction get "name";
private _intelContent = -1;

if (!isTraderQuestCompleted && !isTraderQuestAssigned) then {
    private _thresholds = createHashMapFromArray [
        ["Civilian", 20],
        ["Small", 20],
        ["Medium", 75],
        ["Large", 100]
    ];

    if (random 100 < (_thresholds get _intelType)) then {
        [] remoteExec ["SCRT_fnc_trader_prepareTraderQuest", 2];
        _text = format [localize "STR_trader_task_hint_description", ([] call SCRT_fnc_misc_getWorldName)];
        _intelContent = DEALER;
    };
};

private _fnc_addWeapon = {
    private _notYetUnlocked = allWeapons - unlockedWeapons;
    private _newWeapon = selectRandom _notYetUnlocked;
    private _magazine = selectRandom compatibleMagazines _newWeapon;
    if (minWeaps > 0) then {
        [_newWeapon] remoteExec ["A3A_fnc_unlockEquipment", 2];
        [_magazine] remoteExec ["A3A_fnc_unlockEquipment", 2];
    } else {
        private _arsenalTab = 
	    [
            _newWeapon call jn_fnc_arsenal_itemType,
            _newWeapon,
            A3A_guestItemLimit max 20
        ] call jn_fnc_arsenal_addItem;
        [
            _magazine call jn_fnc_arsenal_itemType,
            _magazine,
            (A3A_guestItemLimit max 20) * 6 * getNumber (configFile >> "CfgMagazines" >> _magazine >> "count")
        ] call jn_fnc_arsenal_addItem;
    };

    private _return = [
        getText (configFile >> "CfgWeapons" >> _newWeapon >> "displayName"),
        ["acquired", "unlocked"] select (minWeaps > 0)
    ];
    _return;
};

if (_text isEqualTo "") then {
    switch (true) do {
        case (_intelType isEqualTo "Civilian"): {
            /*_intelContent = selectRandomWeighted [
                MONEY, 0.2,
                WEAPON, 0.2,
                DECRYPTION_KEY, 0.2,
                TRAITOR, 0.1
            ];*/
            _intelContent = WEAPON;

            switch (_intelContent) do
            {
                case (MONEY):
                {
                    private _money = ((round (random 50)) + (10 * tierWar)) * 100;
                    _text = format ["A civilian gave you some confidential data, you sold it for %1 on the black market!", _money];
                    [0, _money] remoteExec ["A3A_fnc_resourcesFIA",2];
                };
                case (DECRYPTION_KEY):
                {
                    occupantsRadioKeys = occupantsRadioKeys + 1;
                    _text = format [localize "STR_intel_decryption_key", _sideName];
                };
                case (WEAPON):
                {
                    [] call _fnc_addWeapon params ["_weaponName", "_action"];
                    _text = format ["A civilian gave you the location of a warehouse containing stashes of the<br/> %1.<br/> You have %2 this weapon!", _weaponName, _action];
                };
                case (TRAITOR):
                {
                    _text = "A civilian handed you a file with incriminating evidence on a traitor, we don't think they will cause any more trouble.";
                    traitorIntel = true; publicVariable "traitorIntel";
                };
            };
        };
        case (_intelType isEqualTo "Small"): {
            _intelContent = [
                selectRandomWeighted [TIME_LEFT, 0.2, REVEAL_ZONE_SMALL, 0.2, DEF_RESOURCES, 0.2, DECRYPTION_KEY, 0.2, CONVOY, 0.2, RIVALS, 0.1],
                selectRandomWeighted [TIME_LEFT, 0.23, REVEAL_ZONE_SMALL, 0.2, DEF_RESOURCES, 0.23, DECRYPTION_KEY, 0.23, CONVOY, 0.21]
            ] select (areRivalsEnabled && {areRivalsDiscovered && {!areRivalsDefeated}});
            
            switch (_intelContent) do
            {
                case (TIME_LEFT):
                {
                    private _atkRes = [A3A_resourcesAttackOcc, A3A_resourcesAttackInv] select (_side == Invaders);
                    private _atkResRate = A3A_balanceResourceRate * (A3A_enemyAttackMul / 10) / 10;           // per minute
                    if (_side == Invaders) then { _atkResRate = _atkResRate * (A3A_invaderBalanceMul / 10) };

                    private _nextAttack = (0.7 + random 0.6) * (-_atkRes / _atkResRate);
                    if(_nextAttack < 5) then
                    {
                        _text = format [localize "STR_intel_imminent_attack", _sideName];
                    }
                    else
                    {
                        _text = format [localize "STR_intel_attack", _sideName, round (_nextAttack)];
                    };
                };
                case (REVEAL_ZONE_SMALL):
                {
                    _text = [random 2] call A3U_fnc_revealRandomZones;
                };
                case (DEF_RESOURCES):
                {
                    private _defRes = [A3A_resourcesDefenceOcc, A3A_resourcesDefenceInv] select (_side == Invaders);
                    private _defResCap = A3A_balanceResourceRate * 10 * ([1, A3A_invaderBalanceMul / 10] select (_side == Invaders));

                    private _fraction = _defRes / _defResCap;
                    private _fmt = call {
                        if (_fraction > 0.75) exitWith { localize "STR_intel_def_resources_plenty" };
                        if (_fraction > 0.50) exitWith { localize "STR_intel_def_resources_moderate" };
                        if (_fraction > 0.25) exitWith { localize "STR_intel_def_resources_short" };
                        if (_fraction > 0.00) exitWith { localize "STR_intel_def_resources_lack" };
                        localize "STR_intel_def_resources_depleted";
                    };
                    _text = format [_fmt, _sideName];
                };
                case (DECRYPTION_KEY):
                {
                    if(_side == Occupants) then
                    {
                        occupantsRadioKeys = occupantsRadioKeys + 1;
                    }
                    else
                    {
                        invaderRadioKeys = invaderRadioKeys + 1;
                    };
                    _text = format [localize "STR_intel_decryption_key", _sideName];
                };
                case (CONVOY):
                {
                    // These aren't active at the moment
                    private _convoyMarker = "";
                    [] call A3A_fnc_cleanConvoyMarker;
                    if(_side == Occupants) then
                    {
                        _convoyMarker = (server getVariable ["convoyMarker_Occupants", []]);
                    }
                    else
                    {
                        _convoyMarker = (server getVariable ["convoyMarker_Invaders", []]);
                    };
                    if(count _convoyMarker != 0) then
                    {
                        (selectRandom _convoyMarker) setMarkerAlpha 1;
                        _text = format [localize "STR_intel_convoy_tracking_success", _sideName];
                    }
                    else
                    {
                        _text = format [localize "STR_intel_convoy_tracking_fail", _sideName];
                    };
                };
                case (RIVALS):
                {
                    _text = format [(localize "STR_intel_rivals"), A3A_faction_riv get "name", _sideName];
                    [15] remoteExecCall ["SCRT_fnc_rivals_addProgressToRivalsLocationReveal", 2];
                };
            };
        };
        case (_intelType isEqualTo "Medium"): {
            _intelContent = selectRandomWeighted [
                KEY_PACK, 0.4, 
                REVEAL_ZONE_MEDIUM, 0.35,
                ACCESS_AIR, 0, 
                ACCESS_HELI, 0, 
                ACCESS_ARMOR, 0, 
                COUNTER_ATTACK, 0,
                CONVOY_ROUTE, 0.2, 
                CONVOYS, 0.2
            ];
            switch (_intelContent) do
            {
                case (KEY_PACK):
                {
                    private _keyCount = round (3 + random 3);
                    if(_side == Occupants) then
                    {
                        occupantsRadioKeys = occupantsRadioKeys + _keyCount;
                    }
                    else
                    {
                        invaderRadioKeys = invaderRadioKeys + _keyCount;
                    };
                    _text = format [localize "STR_intel_key_pack", _sideName];
                };
                case (REVEAL_ZONE_MEDIUM):
                {
                    _text = [3] call A3U_fnc_revealRandomZones;
                };
                case (CONVOYS):
                {
                    [] call A3A_fnc_cleanConvoyMarker;
                    private _convoyMarkers = [];
                    if(_side == Occupants) then
                    {
                        _convoyMarkers = server getVariable ["convoyMarker_Occupants", []];
                    }
                    else
                    {
                        _convoyMarkers = server getVariable ["convoyMarker_Invaders", []];
                    };
                    {
                        _x setMarkerAlpha 1;
                    } forEach _convoyMarkers;
                    _text = format [localize "STR_intel_convoy_marker", (["GLONASS","GPS"] select (_side isEqualTo Occupants)), _sideName, count _convoyMarkers];
                };
                case (COUNTER_ATTACK):
                {
                    //Not yet implemented, needs a rework of the attack script
                };
                case (CONVOY_ROUTE):
                {
                    if (!("CONVOY" in A3A_activeTasks) && {!bigAttackInProgress}) then
                    {
                        private _potentials = (outposts + milbases + airportsX + resourcesX + factories) select { sidesX getVariable [_x, sideUnknown] != teamPlayer };
                        private _site = [_potentials, petros] call BIS_fnc_nearestPosition;
                        private _base = [_site] call A3A_fnc_findBasesForConvoy;
                        private _fromName = [_base] call A3A_fnc_localizar;
                        private _toName = [_site] call A3A_fnc_localizar;
                        _text = format [localize "STR_intel_convoy_route", _fromName, _toName];
                        if (_base != "" && {_site != ""}) then {
                            [[_site, _base, "", "legacy", -1, true],"A3A_fnc_convoy"] call A3A_fnc_scheduler;
                        };
                    } else {
                        _worldName = [] call SCRT_fnc_misc_getWorldName;
                        _text = format [localize "STR_intel_convoy_route_outdated", _worldName];
                        private _money = (round (random 10)) * 100;
                        [0, _money] remoteExec ["A3A_fnc_resourcesFIA",2];    
                    };
                };
            };
        };
        case (_intelType isEqualTo "Large"): {
            if ("AS" in A3A_activeTasks) then {
                _intelContent = selectRandomWeighted [TRAITOR, 0.25, REVEAL_ZONE_LARGE, 0.25, WEAPON, 0.25, MONEY, 0.25];
            } else {
                _intelContent = [
                    selectRandomWeighted [WEAPON, 0.35, REVEAL_ZONE_LARGE, 0.3, MONEY, 0.55],
                    selectRandomWeighted [WEAPON, 0.35, REVEAL_ZONE_LARGE, 0.3, MONEY, 0.35, RIVALS, 0.15]
                ] select (areRivalsEnabled && {areRivalsDiscovered && {!areRivalsDefeated}});
            };

            switch (_intelContent) do
            {
                case (TRAITOR):
                {
                    _text = "You found incriminating data on the traitor, we don't think he will cause any more trouble";
                    traitorIntel = true; publicVariable "traitorIntel";
                };
                case (REVEAL_ZONE_LARGE):
                {
                    _text = [5] call A3U_fnc_revealRandomZones;
                };
                case (WEAPON):
                {
                    [] call _fnc_addWeapon params ["_weaponName", "_action"];
                    _text = format ["You found the supply data for the<br/> %1<br/> You have %2 this weapon!", _weaponName, _action];
                };
                case (MONEY):
                {
                    private _money = ((round (random 50)) + (10 * tierWar)) * 100;
                    _text = format ["You found some confidential data, you sold it for %1 on the black market!", _money];
                    [0, _money] remoteExec ["A3A_fnc_resourcesFIA",2];
                };
                case (RIVALS):
                {
                    _text = format [(localize "STR_intel_rivals"), A3A_faction_riv get "name", _sideName];
                    [] remoteExecCall ["SCRT_fnc_rivals_revealLocation", 2];
                };
            };
        };
    };
};

if (_text isNotEqualTo "") then {
    [_text, true] remoteExec ["A3A_fnc_showIntel", [civilian, teamPlayer]];
};

_intelContent;
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Info("initPetros started");
scriptName "fn_initPetros";

petros setSkill 1;
petros setVariable ["respawning",false];
petros allowDamage false;

if (face petros != "GreekHead_A3_01") then {
    [petros, createHashMapFromArray [["face", "GreekHead_A3_01"], ["speaker", "Male01GRE"], ["pitch", 1.1], ["firstName", "Petros"], ["lastName", ":)"]]] call A3A_fnc_setIdentity;
};

removeHeadgear petros;
removeGoggles petros;
private _vest = selectRandomWeighted (A3A_rebelGear get "ArmoredVests");
if (_vest == "") then { _vest = selectRandomWeighted (A3A_rebelGear get "CivilianVests") };
petros addVest _vest;
[petros, "Rifles"] call A3A_fnc_randomWeapon;
[petros, "Handguns", 10] call A3A_fnc_randomWeapon;

petros selectWeapon (primaryWeapon petros);

if (petros == leader group petros) then {
	group petros setGroupIdGlobal ["Petros","GroupColor4"];
	petros disableAI "MOVE";
	petros disableAI "AUTOTARGET";
	petros setBehaviour "SAFE";
};

// Install both moving and static actions
[petros,"petros"] remoteExec ["A3A_fnc_flagaction", 0, petros];

[petros,true] call A3A_fnc_punishment_FF_addEH;

petros addEventHandler
[
    "HandleDamage",
    {
        params ["_unit", "_part", "_damage", "_injurer", "_projectile", "_hitPartIndex", "_instigator", "_hitPoint", "_directHit", "_context"];

        if (isPlayer _injurer) then
        {
            _damage = _unit getHitPointDamage _hitPoint;
        };
        if ((isNull _injurer) or (_injurer == petros)) then {_damage = 0};
        if (_part == "") then
        {
            if (_damage > 1) then
            {
                if (!(petros getVariable ["incapacitated",false])) then
                {
                    petros setVariable ["incapacitated",true,true];
                    _damage = 0.9;
                    if (!isNull _injurer) then {[petros,side _injurer] spawn A3A_fnc_unconscious} else {[petros,sideUnknown] spawn A3A_fnc_unconscious};
                }
                else
                {
                    _overall = (petros getVariable ["overallDamage",0]) + (_damage - 1);
                    if (_overall > 1) then
                    {
                        petros removeAllEventHandlers "HandleDamage";
                    }
                    else
                    {
                        petros setVariable ["overallDamage",_overall];
                        _damage = 0.9;
                    };
                };
            };
        };

        if (isPlayer _injurer) then {
            private _lastMsg = _unit getVariable ["A3A_Petros_lastDamageMsgTime", 0];
            if (time - _lastMsg >= 3) then {
                _unit setVariable ["A3A_Petros_lastDamageMsgTime", time];

                private _damageKeys = [
                    "STR_A3U_Petros_reaction_damage1",
                    "STR_A3U_Petros_reaction_damage2",
                    "STR_A3U_Petros_reaction_damage3",
                    "STR_A3U_Petros_reaction_damage4",
                    "STR_A3U_Petros_reaction_damage5",
                    "STR_A3U_Petros_reaction_damage6",
                    "STR_A3U_Petros_reaction_damage7"
                ];
                private _lastKey = _unit getVariable ["A3A_Petros_lastDamageKey", ""];
                private _available = _damageKeys select { _x != _lastKey };
                if (_available isEqualTo []) then { _available = _damageKeys; };
                private _selectedKey = selectRandom _available;
                _unit setVariable ["A3A_Petros_lastDamageKey", _selectedKey];

                private _reactions = [
                    ["gesture", "GestureCeaseFire"],
                    ["anim", "Acts_Ambient_Aggressive"],
                    ["anim", "Acts_Ambient_Defensive"],
                    ["anim", "Acts_Ambient_Dismissing"]
                ];
                private _selectedReaction = selectRandom _reactions;
                private _reactionType = _selectedReaction select 0;
                private _reactionName = _selectedReaction select 1;
                if (_reactionType == "gesture") then {
                    [_unit, _reactionName] remoteExec ["playGesture", 0];
                    //_unit playGesture _reactionName;
                } else {
                    private _isAttached = !isNull attachedTo _petros;
                    private _moveEnabled = _petros checkAIFeature "MOVE";
                    if (!_isAttached || !_moveEnabled) then {
                        [_unit, _reactionName] remoteExec ["switchMove", 0];
                        //_unit switchMove _reactionName;
                    };
                };

                private _message = format ["Petros :)  %1", localize _selectedKey];

                private _nearPlayers = allPlayers select { (_x distance _unit) < 50 && alive _x };
                if (count _nearPlayers > 0) then {
                    private _owners = _nearPlayers apply { owner _x };
                    [_message] remoteExec ["systemChat", _owners];
                };
            };
        };
        _damage;
    }
];

petros addMPEventHandler ["mpkilled",
{
    removeAllActions petros;
    if (!isServer) exitWith {};

    _killer = _this select 1;
    if ((side _killer == Invaders) or (side _killer == Occupants) and !(isPlayer _killer) and !(isNull _killer)) then
    {
        garrison setVariable ["Synd_HQ", [], true];
        _hr = server getVariable "hr";
        _res = server getVariable "resourcesFIA";
        [-1*(round(_hr*0.9)), -1*(round(_res*0.9))] spawn A3A_fnc_resourcesFIA;
        [] spawn A3A_fnc_petrosDeathMonitor;
    }
    else
    {
        [] call A3A_fnc_createPetros;
    };
}];

[] spawn {sleep 120; petros allowDamage true;};

Info("initPetros completed");

petros addEventHandler ["Attached", {
    params ["_attachedObj", "_parentObj", "_isReattach"];
    if (!_isReattach) then {
        private _attachedKeys = [
            "STR_A3U_Petros_reaction_attached1",
            "STR_A3U_Petros_reaction_attached2",
            "STR_A3U_Petros_reaction_attached3",
            "STR_A3U_Petros_reaction_attached4",
            "STR_A3U_Petros_reaction_attached5",
            "STR_A3U_Petros_reaction_attached6",
            "STR_A3U_Petros_reaction_attached7",
            "STR_A3U_Petros_reaction_attached8",
            "STR_A3U_Petros_reaction_attached9"
        ];
        private _selectedKey = selectRandom _attachedKeys;
        private _message = format ["Petros :)  %1", localize _selectedKey];

        private _nearPlayers = allPlayers select { (_x distance _attachedObj) < 50 };
        if (count _nearPlayers > 0) then {
            private _owners = _nearPlayers apply { owner _x };
            [_message] remoteExec ["systemChat", _owners]; //
        };
    };
}];

petros addEventHandler ["Detached", {
    params ["_attachedObj", "_parentObj"];
    private _detachedKeys = [
        "STR_A3U_Petros_reaction_detached1",
        "STR_A3U_Petros_reaction_detached2",
        "STR_A3U_Petros_reaction_detached3",
        "STR_A3U_Petros_reaction_detached4",
        "STR_A3U_Petros_reaction_detached5",
        "STR_A3U_Petros_reaction_detached6"
    ];
    private _selectedKey = selectRandom _detachedKeys;
    private _message = format ["Petros :)  %1", localize _selectedKey];

    private _nearPlayers = allPlayers select { (_x distance _attachedObj) < 50 };
    if (count _nearPlayers > 0) then {
        private _owners = _nearPlayers apply { owner _x };
        [_message] remoteExec ["systemChat", _owners];
    };
}];

missionNamespace setVariable ["A3A_Petros_screamList", [
    ["A3A_Audio_Petros_Scream_short1", 0.5],
    ["A3A_Audio_Petros_Scream_short2", 0.5],
    ["A3A_Audio_Petros_Scream_short3", 0.5],
    ["A3A_Audio_Petros_Scream_long",   1.25]
]];

petros addEventHandler ["FiredNear", {
    params ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];

    if (_distance > 5) exitWith {};
    if (random 1 >= 0.9) exitWith {};
    if (_unit getVariable ["A3A_Petros_screaming", false]) exitWith {};

    _unit setVariable ["A3A_Petros_screaming", true];

    private _screamList = missionNamespace getVariable "A3A_Petros_screamList";
    private _lastScream = _unit getVariable ["A3A_Petros_lastScream", ""];
    private _available = _screamList select { (_x select 0) != _lastScream };
    if (_available isEqualTo []) then { _available = _screamList; };
    private _selected = selectRandom _available;
    private _screamClass = _selected select 0;
    private _duration = _selected select 1;

    _unit setVariable ["A3A_Petros_lastScream", _screamClass];

    [_unit, _screamClass] remoteExec ["say3D", 0];
    [_unit, true] remoteExec ["setRandomLip", 0];

    [_unit, _duration] spawn {
        params ["_unit", "_duration"];
        sleep _duration;
        [_unit, false] remoteExec ["setRandomLip", 0];
        _unit setVariable ["A3A_Petros_screaming", false];
    };
}];

petros addEventHandler ["Explosion", {
    params ["_vehicle", "_damage", "_explosionSource"];

    private _distance = petros distance _explosionSource;
    if (_distance > 10) exitWith {};
    if (random 1 >= 0.7) exitWith {};
    if (petros getVariable ["A3A_Petros_screaming", false]) exitWith {};

    petros setVariable ["A3A_Petros_screaming", true];

    private _screamList = missionNamespace getVariable "A3A_Petros_screamList";
    private _lastScream = petros getVariable ["A3A_Petros_lastScream", ""];
    private _available = _screamList select { (_x select 0) != _lastScream };
    if (_available isEqualTo []) then { _available = _screamList; };
    private _selected = selectRandom _available;
    private _screamClass = _selected select 0;
    private _duration = _selected select 1;

    petros setVariable ["A3A_Petros_lastScream", _screamClass];

    [petros, _screamClass] remoteExec ["say3D", 0];
    [petros, true] remoteExec ["setRandomLip", 0];

    [petros, _duration] spawn {
        params ["_unit", "_duration"];
        sleep _duration;
        [_unit, false] remoteExec ["setRandomLip", 0];
        _unit setVariable ["A3A_Petros_screaming", false];
    };
}];

[] spawn {
    [petros, "Acts_StaticDeath_Coffin"] remoteExec ["switchMove", 0];

    waitUntil {
        sleep 2;
        (count (allPlayers select { alive _x && (_x distance petros) < 10 })) > 0
    };
    [petros, "Acts_Undead_Coffin"] remoteExec ["switchMove", 0];
    sleep 2;

    private _nearPlayers = allPlayers select { (_x distance petros) < 20 && alive _x };
    if (count _nearPlayers > 0) then {
        private _owners = _nearPlayers apply { owner _x };
        private _message = format ["Petros :)  %1", localize "STR_A3U_Petros_revival_zombie"];
        [_message] remoteExec ["systemChat", _owners];
    };

    sleep 4;
    [petros, "AmovPercMstpSnonWnonDnon"] remoteExec ["switchMove", 0];

    [petros] call A3A_fnc_unitAmbient; // adds ambient sounds and animations to petros
    //[petros] spawn A3A_fnc_petrosTweaking; //needs way more thoughts put into it.
    [petros] spawn A3A_fnc_petrosSpook;
    [petros] spawn A3A_fnc_petrosParty; ///need to find a way to switch between both of them, like through some global variable or time constraint. Also exit that when moving HQ
};


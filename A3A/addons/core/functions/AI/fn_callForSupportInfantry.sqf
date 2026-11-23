/*  Simulates the call for support by a group by making the teamleader a bit more dumb for a time

    Execution on: HC or Server

    Scope: Internal

    Params:
        _group: GROUP : The group which should call support
        _target: OBJECT : The target object the group wants support against

    Returns:
        Nothing
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group", "_target"];

private _side = side _group;

if ((_side isEqualTo Occupants && areOccupantsDefeated) || {(_side isEqualTo Invaders && areInvadersDefeated)}) exitWith {
    Info_1("%1 faction had been defeated earlier, aborting calling support.",_side);
};

if(_side != Occupants && _side != Invaders) exitWith {
    Error_2("Non-enemy group %1 of side %2 managed to call callForSupportInfantry",_group,_side);
};

private _radiomanIndex = (units _group) findIf {(_x getVariable "unitType") in (FactionGet(all,"Radiomen"))};

if (_radiomanIndex isEqualTo -1) exitWith {
    Info_1("%1 Group has no capabilities to call support, no radiomen in squad, aborting.",str _group);
};

private _radioMan = (units _group) select _radiomanIndex;

//If radioman is down, dont call support
if !(_radioMan call A3A_fnc_canFight) exitWith {};
if((_group getVariable ["A3A_canCallSupportAt", -1]) > time) exitWith {};

private _timeToCallSupport = (15 + random 15) / A3A_balancePlayerScale;
_group setVariable ["A3A_canCallSupportAt", time + 15*_timeToCallSupport];

{_radioMan disableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];

_radioMan setVariable ["callAnimsDone",false];
_radioMan setVariable ["timeToCall",_timeToCallSupport];
_radioMan setVariable ["callSuccess",false];
_radioMan playMoveNow "Acts_SupportTeam_Front_ToKneelLoop";

_radioMan spawn {
    sleep random 3;
    playSound3D [(selectRandom radioSoundsIn), _this, false, getPosASL _this, 3, 1, 30];
};

_radioMan addEventHandler ["AnimDone", {
    params ["_supportCaller"];
    if (([_supportCaller] call A3A_fnc_canFight) && {(time <= (_supportCaller getVariable ["timeToCall",time])) && {isNull objectParent _supportCaller}}) then {
        _supportCaller spawn {
            sleep random 3;
            playSound3D [(selectRandom radioSoundsMid), _this, false, getPosASL _this, 3, 1, 30];
        };
        _supportCaller playMoveNow "Acts_SupportTeam_Front_KneelLoop";
    } else {
        _supportCaller removeEventHandler ["AnimDone",_thisEventHandler];
        _supportCaller setVariable ["callAnimsDone",true];
        if (([_supportCaller] call A3A_fnc_canFight) && {isNull objectParent _supportCaller}) then {
            _supportCaller playMoveNow "Acts_SupportTeam_Front_FromKneelLoop";
            _supportCaller spawn {
                sleep random 3;
                playSound3D [(selectRandom radioSoundsOut), _this, false, getPosASL _this, 3, 1, 30];
            };
            _supportCaller setVariable ["callSuccess",true];
        };
    };
}];

waitUntil {sleep 0.5; (_radioMan getVariable ["callAnimsDone",true])};

_radioMan setVariable ["radioAnimsDone",nil];
_radioMan setVariable ["timeToCall", nil];

{_radioMan enableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];

ServerDebug_4("Radioman of %1 (side %2) is starting to request support against %3 (type %4)",_group,_side,_target,typeOf _target);

if(_radioMan getVariable ["callSuccess",true]) then {
    // why here? Are we intercepting the radio traffic?
    private _revealed = [getPosATL _radioMan, side _group] call A3A_fnc_calculateSupportCallReveal;
    //Starting the support
    ServerDebug_2("%1 managed to request support, reveal value is %2",_group,_revealed);
    [_side, _target, getPosATL _radioMan, _group knowsAbout _target, _revealed] remoteExec ["A3A_fnc_requestSupport", 2];
} else {
    //Support call failed, reset cooldown
    ServerDebug_1("%1 failed to request support as the leader is dead or down",_group);
    _group setVariable ["A3A_canCallSupportAt", nil];
};

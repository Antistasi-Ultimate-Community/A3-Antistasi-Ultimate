params ["_cured", "_medic"];

private _player = isPlayer _medic;
private _inPlayerGroup = if !(_player) then {if ({isPlayer _x} count (units group _medic) > 0) then {true} else {false}} else {false};
private _isMedic = [_medic] call A3A_fnc_isMedic;

if (captive _medic) then { _medic setCaptive false };         // medic is will be local
if !(alive _cured) exitWith
{
    if (_player) then {[localize "STR_antistasi_revive_header", format [localize "STR_chats_action_revive_already_dead",name _cured]] call A3A_fnc_customHint};
    if (_inPlayerGroup) then {_medic groupChat format [localize "STR_chats_action_revive_already_dead",name _cured]};
    false
};
if !([_medic] call A3A_fnc_canFight) exitWith
{
    if (_player) then { [localize "STR_antistasi_revive_header", localize "STR_antistasi_revive_error_not_able"] call A3A_fnc_customHint };
    false
};
if !(isNull attachedTo _cured) exitWith
{
    if (_player) then {[localize "STR_antistasi_revive_header", format [localize "STR_chats_action_revive_carried_fail",name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medic groupChat format [localize "STR_chats_action_revive_carried_fail",name _cured]};
    false
};
if !(_cured getVariable ["incapacitated",false]) exitWith
{
    if (_player) then {[localize "STR_antistasi_revive_header", format [localize "STR_chats_action_revive_already_healed_you",name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medic groupChat format [localize "STR_chats_action_revive_already_healed_me",name _cured]};
    false
};

private _medkits = ["Medikit"] + (A3A_faction_reb get "mediKits");    // Medikit is kept in case a unit still got hold of it.
private _firstAidKits = ["FirstAidKit"] + (A3A_faction_reb get "firstAidKits");    // FirstAidKit is kept in case a unit still got hold of it.
private _hasMedkit = (count (_medkits arrayIntersect (items _medic + items _cured)) > 0);
private _medicFAKs = if (!_hasMedkit) then { _firstAidKits arrayIntersect items _medic };
private _curedFAKs = if (!_hasMedkit) then { _firstAidKits arrayIntersect items _cured };

if (!_hasMedkit && {count _medicFAKs == 0 && count _curedFAKs == 0}) exitWith
{
    if (_player) then {[localize "STR_antistasi_revive_header", format [localize "STR_chats_action_revive_no_fak_you",name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medic groupChat localize "STR_chats_action_revive_no_fak_me"};
    false
};

private _timer = if (_isMedic) then { time + (A3A_reviveTime / 2) } else { time + A3A_reviveTime }; // socrates my friend, you forgot time + A3A_reviveTime in the first statement
// if (_isMedic) then { _timer = A3A_reviveTime / 2 } else { _timer = time + A3A_reviveTime };

_medic setVariable ["helping", true];
_medic playMoveNow selectRandom medicAnims;
_medic setVariable ["cancelRevive", false];
_medic setVariable ["A3A_cured", _cured];

private _actionX = 0;
if (!_player) then
{
    {_medic disableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
}
else
{
    _actionX = _medic addAction [(localize "STR_antistasi_actions_cancel_revive"), {(_this select 1) setVariable ["cancelRevive",true]},nil,6,true,true,"",""];
    _cured setVariable ["helped",_medic,true];

    if (isPlayer _cured) then {
		[["UpdateState", format ["Treats %1", (name _cured)]]] call SCRT_fnc_misc_updateRichPresence;
    };
};

private _animHandler = _medic addEventHandler ["AnimDone",
{
    private _medic = _this select 0;
    _medic playMoveNow selectRandom medicAnims;

    private _cured = _medic getVariable ["A3A_cured", objNull];

    if (isNull _cured || {(!isPlayer _cured && !isPlayer _medic)}) exitWith {};

    private _props = _cured getVariable ["A3A_medProps", []];
    private _propsCount = round random [1,2,4];
    if ((count _props) < _propsCount) then {
        private _position = [getPos _cured, 0.7, random 360] call SCRT_fnc_misc_extendPosition;
        if (_cured call SCRT_fnc_misc_isInHouse) then {
            private _height = (getPosATL _cured) select 2;
            _position = [_position select 0, _position select 1, _height];
        };

        private _prop = [
            (selectRandom A3A_medicalProps),
            _position,
            (random 360)
        ] call SCRT_fnc_misc_createBelonging;

        _props pushBack _prop; 
        _cured setVariable ["A3A_medProps", _props];
    };
}];

waitUntil {
    sleep 1;
    !([_medic] call A3A_fnc_canFight)
    or (time > _timer)
    or (_medic getVariable ["cancelRevive", false])		// medic might get deleted
    or !(alive _cured)
};

private _props = _cured getVariable ["A3A_medProps", []];

if (_props isNotEqualTo []) then {
    _nil = [_props] spawn {
        params ["_props"];
        sleep random [30,45,60];
        {deleteVehicle _x} forEach _props;
        terminate _thisScript;
    };
};
_cured setVariable ["A3A_medProps", nil];

if (isNull _medic) exitWith { false };

_medic removeEventHandler ["AnimDone", _animHandler];
_medic setVariable ["helping",false];
_medic setVariable ["A3A_cured", nil];
_medic playMoveNow "AinvPknlMstpSnonWnonDnon_medicEnd";

if (!_player) then
{
    {_medic enableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
}
else
{
    _medic removeAction _actionX;
    _cured setVariable ["helped",objNull,true];

    [] call SCRT_fnc_misc_updateRichPresence;
};

if (_medic getVariable ["cancelRevive",false]) exitWith
{
    // AI medics can be cancelled from A3A_fnc_help
    if (_player) then
    {
        [localize "STR_antistasi_revive_header", "Revive cancelled."] call A3A_fnc_customHint;
        _medic setVariable ["cancelRevive",nil];
    };
    false;
};
if !(alive _cured) exitWith
{
    if (_player) then {[localize "STR_antistasi_revive_header", format [localize "STR_antistasi_revive_lost", name _cured]] call A3A_fnc_customHint;};
    if (_inPlayerGroup) then {_medic groupChat format [localize "STR_antistasi_revive_lost", name _cured]};
    false;
};
if (!([_medic] call A3A_fnc_canFight)) exitWith
{
    if (_player) then {[localize "STR_antistasi_revive_header", localize "STR_antistasi_revive_cancelled"] call A3A_fnc_customHint;};
    false;
};

// Successful revive
if (_isMedic) then {_cured setDamage 0} else {_cured setDamage 0.25};
if (!_hasMedkit) then {
    if (count _medicFAKs == 0) then { _cured removeItem selectRandom _curedFAKs }
    else { _medic removeItem selectRandom _medicFAKs };
};
private _sideX = side (group _cured);
if ((_sideX != side (group _medic)) and ((_sideX == Occupants) or (_sideX == Invaders))) then
{
    _cured setVariable ["surrendering",true,true];
    sleep 2;
};
_cured setVariable ["incapacitated",false,true];        // why is this applied later? check

true;

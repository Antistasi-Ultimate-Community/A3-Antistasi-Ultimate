/*
    Set face, voice, pitch and name of unit. Global effect and JIP-safe.

Scope: Any
Environment: Any
Public: Yes

Arguments:
    <OBJECT> Object to set identity for
    <STRING> Optional: Face of unit
    <STRING> Optional: Voice/speaker of unit
    <STRING> Optional: (Voice) pitch of unit
    <STRING> Optional: Name of unit
*/

#include "..\..\script_component.hpp"

params ["_unit", "_identity"];           // Don't care about the other params here

if (isNull _unit) exitWith {};

private _firstName = _identity getOrDefault ["firstName", ""];
private _lastName = _identity getOrDefault ["lastName", ""];

if ((isNil "_firstName" || {_firstName isEqualTo ""}) || (isNil "_lastName" || {_lastName isEqualTo ""})) then {
    private _nameConfig = configfile >> "CfgWorlds" >> "GenericNames" >> "GreekMen";
    private _firstNames = configProperties [_nameConfig >> "FirstNames"] apply { getText(_x) };
    private _lastNames = configProperties [_nameConfig >> "LastNames"] apply { getText(_x) };

    private _type = _unit getVariable ["unitType", ""]; // Why do some units *not* have this set? I will never know!
    private _identity = [Faction(side _unit), _type] call A3A_fnc_createRandomIdentity;

    // Choose appropriate faction identity if possible, fallback to default names if unavailable
    _firstName = ([_identity getOrDefault ["firstName", ""], selectRandom _firstNames] select {_x != ""}) # 0;
    _lastName = ([_identity getOrDefault ["lastName", ""], selectRandom _lastNames] select {_x != ""}) # 0;
};

_identity set ["firstName", _firstName];
_identity set ["lastName", _lastName];

private _JIPID = "identity_" + netId _unit;
[_JIPID, _unit, _identity] remoteExec ["A3A_fnc_setIdentityLocal", 0, _JIPID];
// ([_JIPID] + _this) remoteExec ["A3A_fnc_setIdentityLocal", 0, _JIPID];

// This won't be 100% reliable because it's only installed locally, but it'll avoid remoteExec spam on connection
_unit addEventHandler ["Deleted", {
    remoteExec ["", "identity_" + netId _unit];
}];

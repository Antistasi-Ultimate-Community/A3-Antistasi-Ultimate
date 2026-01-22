#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_makeObjectLocal

Description:
    Change ownership of an object to local machine

Parameters:
    0: _object - Object whose locality is to be changed <OBJECT>

Optional:
    1: _timeout - Maximum time to wait for locality change <NUMBER>
        Default: 10 seconds

Example:
    (begin example)
    [_object] call A3A_fnc_makeObjectLocal;
    (end example)

Returns:
    <BOOL> - true on success, false on failure

Environment:
    Client, Scheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(makeObjectLocal),_this);

if !assert(params[
    ["_object", nil, [objNull]]
]) exitWith { false };
if !assert(!isNull _object) exitWith { false };

// Need to be able to `waitUntil`
if !assert(canSuspend) exitWith { false };
// Nothing to be done
if (local _object) exitWith { true };

private _owner = clientOwner;
private _timeout = params[1, 10, [0]];

[_object, _owner] remoteExecCall["setOwner", 2];

private _waitUntil = diag_tickTime + _timeout;

waitUntil { (local _object) || { diag_tickTime > _waitUntil } };

if !(local _object) exitWith { 
    Error_2("Failed to make object %1 local within %2 seconds",_object,_timeout);
    false;
};

true;

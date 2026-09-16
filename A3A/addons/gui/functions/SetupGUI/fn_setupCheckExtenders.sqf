#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_setupCheckExtenders

Description:
    Check loaded extenders, open dismissal dialog, if necessary

Parameters:

Optional:

Example:

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(setupCheckExtenders),_this);

// The command to execute this function _may_ come earlier than network traffic
// synchronizing the GVARs. Wait a bit until they appear.
#define WAIT_FOR_GVARS_TIMEOUT 5

private _hasGVARS = waitUntil[{
    (!isNil QEGVAR(core,extendersLoaded)) && (!isNil QEGVAR(core,extendersLoadedInvalid))
}, WAIT_FOR_GVARS_TIMEOUT]; // time out after five seconds

if !assert(!isNil "_hasGVARS") exitWith {
    Error_1("extender GVARs failed to present after %1 seconds; continuing w/ game setup.",WAIT_FOR_GVARS_TIMEOUT);
    player setVariable[QEGVAR(core,confirmedExtenderWarnings), true, 2];
};

// Nothing to nag about
if (EGVAR(core,extendersLoadedInvalid) isEqualTo []) exitWith {
    player setVariable[QEGVAR(core,confirmedExtenderWarnings), true, 2];
};

Info("There are invalid extenders loaded. Showing extenders warning dialog.");

[{ createDialog QGVAR(ExtendersWarningDialog) }] call CBA_fnc_execNextFrame;

nil;

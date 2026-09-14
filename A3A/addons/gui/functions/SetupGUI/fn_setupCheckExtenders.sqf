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

// Should not happen but we can't abort game setup
if (!assert(!isNil QEGVAR(core,extendersLoaded)) || { !assert(!isNil QEGVAR(core,extendersLoadedInvalid)) }) exitWith {
    player setVariable[QEGVAR(core,seenExtenderWarnings), true, 2];
};

// Nothing to nag about
if (EGVAR(core,extendersLoadedInvalid) isEqualTo []) exitWith {
    player setVariable[QEGVAR(core,seenExtenderWarnings), true, 2];
};

Info("There are invalid extenders loaded. Showing extenders warning dialog.");

[{ createDialog QGVAR(ExtendersWarningDialog) }] call CBA_fnc_execNextFrame;

nil;

#include "..\..\script_component.hpp"
#include "..\..\dialogues\defines.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_onExtendersWarningDialogUnload

Description:
    onUnload handler for extender warning dialog

Parameters:
    0: _display - The extender warning dialog <DISPLAY>
    1: _exitCode - The exit code of the dialog <NUMBER>

Optional:

Example:

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(onExtendersWarningDialogUnload),_this);

if !assert(params[
    ["_dialog", nil, [displayNull]],
    ["_exitCode", nil, [0]]
]) exitWith {};
if !assert(!isNull _dialog) exitWith {};

uiNamespace setVariable[QGVAR(extendersWarningDialog), nil];

// Dialog canceled by pressing Escape. Relaunch dialog in this case.
if (_exitCode isEqualTo MB_BUTTON_CANCEL) exitWith {
    Info("Extenders warning dialog canceled, relaunching...");
    [{ createDialog QGVAR(ExtendersWarningDialog) }] call CBA_fnc_execNextFrame;
};

// Dialog terminated w/ checkbox acknowledged. Run setup dialog.
[{
    // Tell the server this player does not need to see the extender warnings anymore
    player setVariable[QEGVAR(core,confirmedExtenderWarnings), true, 2];
}] call CBA_fnc_execNextFrame;

nil;

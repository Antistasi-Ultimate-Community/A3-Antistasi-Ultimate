#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3USPCM_garrison_fnc_startAutoUpdateLoop

Description:
    Auto update garrison of selected location

Parameters:

Optional:

Example:

Returns:
    Nothing

Author:
    goreSplatter
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(startAutoUpdateLoop),_this);

while { !isNull(uiNamespace getVariable[QGVAR(menuDisplay), displayNull]) } do {
    uiSleep 0.1;
    if (GVAR(nextAutoUpdate) < diag_tickTime) then { continue };
    GVAR(nextAutoUpdate) = -1;
    [] spawn FUNC(autoUpdate);
};

TRACE_1(QFUNC(startAutoUpdateLoop),_this);
nil;

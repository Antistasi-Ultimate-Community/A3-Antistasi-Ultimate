#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_dynamic_hover_menu_fnc_closeMap

Description:
    Reset hover menu, map visiblity after context menu action

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
Trace_1(QFUNC(closeMap),_this);

[] call FUNC(closeContextMenu);

if (visibleMap) then {
    openMap false;
};

nil;

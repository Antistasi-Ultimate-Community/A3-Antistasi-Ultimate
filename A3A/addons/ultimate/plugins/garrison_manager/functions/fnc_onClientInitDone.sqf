#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_garrison_manager_fnc_onClientInitDone

Description:
    Called after A3U client init is done

Parameters:

Optional:

Example:

Returns:
    Nothing

Author:
    goreSplatter
---------------------------------------------------------------------------- */
waitUntil { !isNull(missionNamespace getVariable["mapX", objNull]) };

if GVAR(addActionToMapObject) then {
    missionNamespace getVariable "mapX" addAction[
        LLSTRING(RscA3UGarrisonManagerDialog_StaticTitle),
        {
            createDialog QGVAR(dialog);
        },
        nil,
        0,
        false,
        true,
        "",
        "true",
        3
    ];
};

nil;

#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_showNoIntelMessage

Description:
    Instead of showing a generic "no intel" message, this function will display 
    a random message from the IntelMessages class.

Parameters:

Optional:

Example:

Returns:
    Nothing

Author:
    UnseenKill
---------------------------------------------------------------------------- */

private _message = if ("Yes" isNotEqualTo localize "STR_antistasi_dialogs_generic_button_yes_text") then {
    // If language isn't English, fall back to generic message
    localize "STR_intel_search_failure_description";
} else {
    format[
        localize "STR_intel_search_failure_alternate_description", 
        selectRandom getArray(configFile >> "A3A" >> "IntelMessages" >> "notFound")
    ];
};

[localize "STR_intel_no_structtext_header", _message] call A3A_fnc_customHint;

nil;

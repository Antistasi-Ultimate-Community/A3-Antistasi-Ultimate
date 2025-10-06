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

if (isNil QGVAR(HaveIntelTranslations)) then {
    // We need the localized `STR_antistasi_intel_translated` string to spell out
    // the exact localized version of `STR_antistasi_dialogs_generic_button_yes_text`;
    // that serves as an indicator that translations for alternate "not found"
    // messages are available.
    GVAR(HaveIntelTranslations) = 
        (localize "STR_antistasi_dialogs_generic_button_yes_text")
        isEqualTo
        (localize "STR_antistasi_intel_translated");
};

private _message = if !GVAR(HaveIntelTranslations) then {
    // If language isn't translated yet, fall back to generic message
    localize "STR_intel_search_failure_description";
} else {
    format[
        localize "STR_intel_search_failure_alternate_description", 
        selectRandom getArray(configFile >> "A3A" >> "IntelMessages" >> "notFound")
    ];
};

[localize "STR_intel_search_intel_header", _message] call A3A_fnc_customHint;

nil;

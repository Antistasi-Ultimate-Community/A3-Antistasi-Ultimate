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

private _message = format[
    localize "STR_intel_search_failure_alternate_description", 
    selectRandom getArray(configFile >> "A3A" >> "IntelMessages" >> "notFound")
];

[localize "STR_intel_no_structtext_header", _message] call A3A_fnc_customHint;

nil;

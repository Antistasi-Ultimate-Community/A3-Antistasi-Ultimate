#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_traderSellingAppraiseItem

Description:
    API function to hook into selling item appraisal.

Parameters:
    0: _callback - The appraisal function to add <CODE>

Optional:
    1: _arguments - Additional arguments to pass to the appraisal function <ANY>

Example:
    (begin example)
    // Don't actually do this. Don't put all the code in the callback argument;
    // rather, use a function call to keep things neat and clean.
    [{
        // Parameters passed into callback from event trigger to appraise item
        params[
            ["_itemClass", nil, [""]],
            ["_itemConfig", nil, [configNull]],
            ["_itemType", nil, [""]]
        ];

        // Our parameters passed in from the _arguments array
        _thisArgs params[
            ["_greeting", nil, [""]],
            ["_answer", nil, [0]],
            ["_luckyNumber", nil, [0]]
        ];

        // Do appraisal logic here. If you have a price, return it.
        // If you don't want to set a price, return nothing (`nil`).

        if (_luckyNumber != 1337) exitWith {}; // No price found if unlucky

        // Example price calculation
        private _basePrice = 100;

        _basePrice + _answer;
    }, ["Hello, world.", 42, 1337]] call A3A_fnc_traderSellingAppraiseItem;
    (end example)

Returns:
    <NUMBER> Unique ID of the callback; can be removed with 
        `A3A_fnc_removeEventHandler`; event type is `_thisType` in callback.

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(traderSellingAppraiseItem),_this);

if !assert(params[
    ["_callback", nil, [{}]]
]) exitWith {};

private _params = param[1, []];

[CBA_EVENT_CLIENT_TRADER_SELLING_GETITEMPRICE, _callback, _params] call CBA_fnc_addEventHandler;

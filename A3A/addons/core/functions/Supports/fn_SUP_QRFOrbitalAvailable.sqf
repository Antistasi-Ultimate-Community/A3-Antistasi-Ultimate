/*  Get Orbital QRF support selection weight against target

Arguments:
    <OBJECT> Target object
    <SIDE> Side to send support from
    <ARRAY> Array of strings of available types for this faction

Return value:
    <SCALAR> Weight value, 0 for unavailable or useless
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_target", "_side", "_maxSpend", "_availTypes"];

// make orbital a bit more likely with war tier? or not?

if (tierWar < 5) exitWith { 0 };

// It can technically hit air/tanks, but you wouldn't ram a droppod through a vehicle... wouldn't you?

if (_target isKindOf "Air") exitWith { 0.1 };
if !(_target isKindOf "Man") exitWith { 0.5 };
if (_maxSpend < 300) exitWith { 0 };        // don't use unless we're rich
(tierWar - 3) / 10;       // 20% at tier 5 to 70% at tier 10

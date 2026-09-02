/*  Get Air QRF support selection weight against target

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

if (tierWar < 5) exitWith { 0 };

// Otherwise fine?
// Could reduce chance for heli or non-infantry targets in general
// It can technically hit air/tanks, but you wouldn't ram a droppod through a vehicle... wouldn't you?

if (_target isKindOf "Air") exitWith { 0.1 };
if !(_target isKindOf "Man") exitWith { 0.5 };
(tierWar - 3) / 10;

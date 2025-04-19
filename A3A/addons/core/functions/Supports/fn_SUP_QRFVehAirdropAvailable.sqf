/*  Get vehicle airdrop QRF support selection weight against target

Arguments:
    <OBJECT> Target object
    <SIDE> Side to send support from
    <SCALAR> Max resource spend (not currently used)
    <ARRAY> Array of strings of available types for this faction

Return value:
    <SCALAR> Weight value, 0 for unavailable or useless
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_target", "_side", "_maxSpend", "_availTypes"];

if(tierWar < 2) exitWith {-1};

private _allAA = (
    (FactionGetTiered(all, "vehiclesPlanesAA")) +
    (FactionGetTiered(all, "vehiclesAA")) +
    (FactionGetTiered(all, "staticAA"))
);
if (typeOf _target in _allAA) exitWith { 0 };

if (_target isKindOf "Tank") exitWith { 0.3 }; //airborne veihcles usually have light anti-infantry weapons

(tierWar - 5) / 8; 
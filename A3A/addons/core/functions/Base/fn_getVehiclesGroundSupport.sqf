/*  
Maintainer: John Jordan
    Returns a weighted ground support vehicle pool based on war level and side

Arguments:
    <SIDE> The side for which the vehicle pool should be generated (occupants or invaders)
    <INTEGER> 1-10 range, war-level based vehicle quality

Return value:
    <ARRAY> [vehType, weight, vehType2, weight2, ...]
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_side", "_level", ["_tanksOnly", false]];
_level = (_level max 1 min 10) - 1;
private _faction = [A3A_faction_occ, A3A_faction_inv] select (_side == Invaders);

private _fnc_addArrayToWeights = {
    params ["_vehArray", "_baseWeight"];
    { _vehWeights append [_x, _baseWeight / count _vehArray] } forEach _vehArray;
};

private _vehWeights = [];

private _milCarWeight =     [50, 40, 30, 20, 10,  0,  0,  0,  0,  0] select _level;
private _carWeight =        [50, 50, 50, 50, 50, 50, 50, 40, 35, 30] select _level;
private _aaWeight =         [ 0,  0,  3,  5,  7,  8, 10, 12, 13, 14] select _level;
private _milApcWeight =     [ 0,  5, 15, 25,  0,  0,  0,  0,  0,  0] select _level;
private _tankWeight =       [ 0,  0,  0, 15, 20, 25, 30, 35, 40, 50] select _level;
private _ltankWeight =      [ 0, 10, 15, 25, 30, 35, 30, 25, 20, 15] select _level;

// filter out weak AA that shouldn't be tier-scaled (eg. Avenger, zu23)
private _vehAA = (FactionGetTiered(_faction, "vehiclesAA")) select { A3A_vehicleResourceCosts get _x >= 100 };
if (_vehAA isEqualTo []) then { _tankWeight = _tankWeight + _aaWeight };

[FactionGetTiered(_faction, "vehiclesLightTanks"), _ltankWeight] call _fnc_addArrayToWeights;
[FactionGetTiered(_faction, "vehiclesTanks"), _tankWeight] call _fnc_addArrayToWeights;
if (_tanksOnly) exitWith { _vehWeights };

// only occupants use militia vehicles?
if (_side == Occupants) then {
    [FactionGetMilitia(_faction, "vehiclesLightArmed"), _milCarWeight] call _fnc_addArrayToWeights;
    private _milApc = FactionGetMilitia(_faction, "vehiclesAPCs");
    if (_milApc isNotEqualTo []) then {
        [_milApc, _milApcWeight] call _fnc_addArrayToWeights;
    };
};
[FactionGetTiered(_faction, "vehiclesLightArmed"), _carWeight] call _fnc_addArrayToWeights;
[_vehAA, _aaWeight] call _fnc_addArrayToWeights;

_vehWeights;

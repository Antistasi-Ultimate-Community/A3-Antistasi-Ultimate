#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {
    Error("Server-only function miscalled");
};

params [
    ["_resAdd", 0],
    ["_hrAdd", 0]
];

private _ownedFactories = {sidesX getVariable [_x, sideUnknown] == teamPlayer && !(_x in destroyedSites)} count factories;
private _resBoost = 1 + (_ownedFactories * 0.25); // 1 base resource gain + 0.25 per factory owned

{
    if (sidesX getVariable [_x,sideUnknown] == teamPlayer and {!(_x in destroyedSites)}) then
    {
        _resAdd = _resAdd + (300 * _resBoost);
    };
} forEach resourcesX;

_resAdd = [_resAdd] call SCRT_fnc_common_rebelSalary;
if (isNil "_resAdd" || {!finite _resAdd}) then {
    _resAdd = 25000;
};

_hrAdd = round _hrAdd;
_resAdd = round _resAdd;
if (!finite _resAdd) then { _resAdd = 25000; }; //either number is too large or something is broken
if (!finite _hrAdd) then { _hrAdd = 30; };
server setVariable ["hr", _hrAdd + (server getVariable ["hr", 0]), true];
server setVariable ["resourcesFIA", _resAdd + (server getVariable ["resourcesFIA", 0]), true];

private _rebAirportsQuantity = {sidesX getVariable [_x,sideUnknown] == teamPlayer} count airportsX;
bombRuns = bombRuns + 0.25 * _rebAirportsQuantity;
publicVariable "bombRuns";

if (bombRuns > (_rebAirportsQuantity * 2)) then {
    bombRuns = _rebAirportsQuantity * 2;
};

if(tierWar > 2) then {
    supportPoints = supportPoints + 1;
};

if(supportPoints > maxSupportPoints) then {
    supportPoints = maxSupportPoints;
};

publicVariable "supportPoints";

private _textX = format [localize "STR_comms_mp_taxes_income", _hrAdd, _resAdd, A3A_faction_civ get "currencySymbol"];
private _textArsenal = [] call A3A_fnc_arsenalManage;
if (_textArsenal != "") then {_textX = format [localize "STR_comms_mp_arsenal_updated", _textX, _textArsenal]};
[petros, "taxRep", _textX] remoteExec ["A3A_fnc_commsMP", [teamPlayer, civilian]];
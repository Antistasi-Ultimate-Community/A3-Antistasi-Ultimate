#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _factionMoney = server getVariable ["resourcesFIA",0];
private _hr = server getVariable ["hr",0];
private _victoryZones = airportsX + milbases + outposts + resourcesX + factories + seaports;
private _victoryZonesLogistical = airportsX + milbases + seaports;
private _popTotal = 0;
private _popKilled = 0;
private _missingMoney = ((2000000 - _factionMoney) call BIS_fnc_numberText) splitString " " joinString ",";
private _popReb = 0;
private _popGov = 0;
private _popMajority = 0;

{
    private _city = _x;
    private _cityData = server getVariable _city;
    _cityData params ["_numCiv", "_numVeh", "_supportGov", "_supportReb"];

    _popTotal = _popTotal + _numCiv;
    if (_city in destroyedSites) then { _popKilled = _popKilled + _numCiv; continue };

    _popReb = _popReb + (_numCiv * (_supportReb / 100));
    _popGov = _popGov + (_numCiv * (_supportGov / 100));
} forEach citiesX;

_popMajority = _popTotal * 0.75;

switch (lossCondition) do
{
    //3rd of the pop dead
    case 0:
    {
        if (_popKilled > (_popTotal / 3)) then
        {
            isNil {["ended", true] call A3A_fnc_writebackSaveVar};
            ["destroyedSites",false,true] remoteExec ["BIS_fnc_endMission"];
        };
    };

    //no HR left ()
    case 1:
    {
        private _tierWarHRloss = missionNamespace getVariable ["A3U_setting_tierWarHRLoss",3];
        if (_hr <= 0 && {(tierWar >= _tierWarHRloss)}) then 
        {
            isNil {["ended", true] call A3A_fnc_writebackSaveVar};
            ["HRLoss",false,true] remoteExec ["BIS_fnc_endMission"];
        };
    };

    //faction has no money left
    case 2:
    {
        if (_factionMoney <= 0) then
        {
            isNil {["ended", true] call A3A_fnc_writebackSaveVar};
            ["financialLoss",false,true] remoteExec ["BIS_fnc_endMission"];
        };
    };

    //hardcore (all loss conditions in one)
    case 3:
    {
        if ((_factionMoney <= 0) || {_hr <= 0} || {_popKilled > (_popTotal / 3)}) then
        {
            isNil {["ended", true] call A3A_fnc_writebackSaveVar};
            ["hardcoreLoss",false,true] remoteExec ["BIS_fnc_endMission"];
        };
    };

    default {diag_log format["Loss condition was not recognized. Condition given: %1", lossCondition]};
};
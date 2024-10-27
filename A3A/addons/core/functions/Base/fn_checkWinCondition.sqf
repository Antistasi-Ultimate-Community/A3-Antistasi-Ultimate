#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _factionMoney = server getVariable ["resourcesFIA",0];
private _hr = server getVariable ["hr",0];
private _victoryZones = airportsX + milbases + outposts + resourcesX + factories + seaports;
private _victoryZonesLogistical = airportsX + milbases + seaports;
private _popTotal = 0;
private _popKilled = 0;
private _popReb = 0;
private _popGov = 0;
private _popMajority = 0;
private _resourcesCount = count (resourcesX);
private _economicCalculation = (_resourcesCount * 100000);
private _missingMoney = ((_economicCalculation - _factionMoney) call BIS_fnc_numberText) splitString " " joinString ",";

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

private _resourcesTotal = count (resourcesX);
private _resourcesOwned = ({sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (resourcesX));

private _factoriesTotal = count (factories);
private _factoriesOwned = ({sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (factories));

private _outpostsTotal = count (outposts);
private _outpostsOwned = ({sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (outposts));

private _seaportsTotal = count (seaports);
private _seaportsOwned = ({sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (seaports));

private _milbasesTotal = count (milbases);
private _milbasesOwned = ({sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases));

private _airportsTotal = count (airportsX);
private _airportsOwned = ({sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (airportsX));

switch (victoryCondition) do
{
    //Normal Victory
    case 0:
    {
        if ((_popReb > _popGov) && {({sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (airportsX + milbases)) isEqualTo count (airportsX + milbases)}) then {
            isNil {["ended", true] call A3A_fnc_writebackSaveVar};
            ["End1",true,true,true,true] remoteExec ["BIS_fnc_endMission"];
        } else {
            isNil { [format [localize "STR_A3AU_victory_condition_check" + localize "STR_A3AU_victory_type_normal"],format [localize "STR_A3AU_victory_condition_not_met" + localize "STR_A3AU_victory_condition_normal_victory_info", (round _popReb),(round _popGov),_milbasesOwned,_milbasesTotal,_airportsOwned,_airportsTotal], true] call A3A_fnc_customHint };
        };
    };

    //Total Victory
    case 1:
    {
        if ((_popReb > _popGov) && {({sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (_victoryZones)) isEqualTo count (_victoryZones)}) then {
            isNil {["ended", true] call A3A_fnc_writebackSaveVar};
            ["totalVictory",true,true,true,true] remoteExec ["BIS_fnc_endMission"];
        } else {
            isNil { [format [localize "STR_A3AU_victory_condition_check" + localize "STR_A3AU_victory_type_total"],format [localize "STR_A3AU_victory_condition_not_met" + localize "STR_A3AU_victory_condition_total_victory_info", (round _popReb),(round _popGov),_resourcesOwned,_resourcesTotal,_factoriesOwned,_factoriesTotal,_outpostsOwned,_outpostsTotal,_seaportsOwned,_seaportsTotal,_milbasesOwned,_milbasesTotal,_airportsOwned,_airportsTotal], true] call A3A_fnc_customHint };
        };
    };

    //Economic Victory
    case 2:
    {
        if (_factionMoney >= _economicCalculation) then {
            isNil {["ended", true] call A3A_fnc_writebackSaveVar};
            ["economicVictory",true,true,true,true] remoteExec ["BIS_fnc_endMission"];
        } else {
            isNil { [format [localize "STR_A3AU_victory_condition_check" + localize "STR_A3AU_victory_type_economic"],format [localize "STR_A3AU_victory_condition_not_met" + localize "STR_A3AU_victory_condition_missing_money", _missingMoney, A3A_faction_civ get "currencySymbol"], true] call A3A_fnc_customHint };
        };
    };

    //Logistical Victory
    case 3:
    {
        if (({sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (_victoryZonesLogistical) ) isEqualTo count (_victoryZonesLogistical)) then {
            isNil { ["ended", true] call A3A_fnc_writebackSaveVar };
            ["logisticalVictory",true,true,true,true] remoteExec ["BIS_fnc_endMission"];
        } else {
            isNil { [format [localize "STR_A3AU_victory_condition_check" + localize "STR_A3AU_victory_type_logistical"],format [localize "STR_A3AU_victory_condition_not_met" + localize "STR_A3AU_victory_condition_logistical_victory_info",_seaportsOwned,_seaportsTotal,_milbasesOwned,_milbasesTotal,_airportsOwned,_airportsTotal], true] call A3A_fnc_customHint };
        };
    };

    //Political Victory (Over 75% population Support)
    case 4:
    { 
        if (_popReb >= _popMajority) then {
            isNil {["ended", true] call A3A_fnc_writebackSaveVar};
            ["politicalVictory",true,true,true,true] remoteExec ["BIS_fnc_endMission"];
        } else {
            isNil { [format [localize "STR_A3AU_victory_condition_check" + localize "STR_A3AU_victory_type_political"],format [localize "STR_A3AU_victory_condition_not_met" + localize "STR_A3AU_victory_condition_missing_support",_popTotal,(round _popGov),(round _popReb)], true] call A3A_fnc_customHint };
        };
    };

    default {diag_log format["Victory condition was not recognized. Condition given: %1", victoryCondition]};
};
/*
    Author:
        Silence
    
    Description:
        Gets a cargo list from CfgCargo
    
    Params:
        N/A
    
    Dependencies:
        N/A
    
    Scope:
        Server, Client
    
    Environment:
        Unscheduled
    
    Usage:
        call A3U_fnc_LOG_delivery_getCargo;
    
    Return:
        _cargo <STRING, INT>
*/

#include "..\..\script_component.hpp"

params [["_cargoType", ""]];

private _cfg = (configFile >> "A3U" >> "CfgCargo");
private _cfgCondition = "!('base' in configName _x)";
private _cfgConditionEra = ["modern", "lowTech"] select ("lowTech" in A3A_factionEquipFlags);

_cfgCondition = _cfgCondition + " " + (format ["&& {'%1' in (getArray (_x >> 'flag'))}", _cfgConditionEra]);

if (_cargoType isEqualTo "") then {
    private _types = createHashMap;
    private _typesWeighted = [];

    private _cfgTypes = _cfgCondition configClasses (_cfg);

    _cfgTypes apply {
        private _name = configName _x;
        private _weight = getNumber (_x >> "weight");
        private _flag = getTextRaw (_x >> "flag");
        
        _types set [_name, [_weight, _flag]];
        _typesWeighted append [_name, _weight];
    };

    _cargoType = selectRandomWeighted _typesWeighted;
};

private _cfgCargoTypes = "true" configClasses (_cfg >> _cargoType >> "cargoTypes");
private _cargoTypes = createHashMap;
private _cargoTypesWeighted = [];

_cfgCargoTypes apply {
    private _name = configName _x;
    private _weight = getNumber (_x >> "weight");
    private _cargo = getArray (_x >> "cargo");

    _cargoTypes set [_name, _cargo];
    _cargoTypesWeighted append [_name, _weight];
};

private _cargoTypeRandom = selectRandomWeighted _cargoTypesWeighted;
private _cargoFull = selectRandom (_cargoTypes get _cargoTypeRandom);
private _cargoNum = if !(_cargoFull#1 isEqualType "") then {_cargoFull#1} else {-1}; // If cargo isn't CLASS, AMOUNT, assume we are spawning multiple different classes
private _cargo = _cargoFull#0;

diag_log [_cargoType, _cargoTypeRandom, _cargoFull];

[_cargo, _cargoNum]; // Make sure to give any possible cargo type a proper cargoValue
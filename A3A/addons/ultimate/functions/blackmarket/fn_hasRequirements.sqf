params [
    ["_requirements", ["NA", 0]]
];

private _requirement = "";
private _requirementAmount = 0;

if (_requirements isEqualType []) then {
    _requirement = _requirements#0;
    _requirementAmount = _requirements#1;
} else {
    _requirementsSplit = _requirements splitString "_";
    _requirement = _requirementsSplit select 0; // select the required type
    _requirementAmount = parseNumber (_requirementsSplit select 1); // select the required amount
};

private _rebelZones = call A3U_fnc_sidesX;
private _warLevel = tierWar;

private _resources = resourcesX;
private _factories = factories;
private _milbases = milbases;
private _airports = airportsX;
private _seaports = seaports;
private _outposts = outposts;

private _resourcesRebel = _rebelZones count _resources;
private _factoriesRebel = _rebelZones count _factories;
private _milbasesRebel = _rebelZones count _milbases;
private _airportsRebel = _rebelZones count _airports;
private _seaportsRebel = _rebelZones count _seaports;
private _outpostsRebel = _rebelZones count _outposts;

if (blackMarketIgnoreRequirements isEqualTo true) then {
    _requirement = "true";
};

private _return = false;

switch (_requirement) do 
{
    case "true":
    {
        _return = true;
    };
    case "warlevel": 
    {
        if (_warLevel >= _requirementAmount) exitWith {_return = true};
    };
    case "resources": 
    {
        private _requiredResources = if (_requirementAmount > count _resources) then {count _resources} else {_requirementAmount};
        if (_resourcesRebel >= _requiredResources) exitWith {_return = true};
    };
    case "factories": 
    {
        private _requiredFactories = if (_requirementAmount > count _factories) then {count _factories} else {_requirementAmount};
        if (_factoriesRebel >= _requiredFactories) exitWith {_return = true};
    };
    case "milbases": 
    {
        private _requiredMilbases = if (_requirementAmount > count _milbases) then {count _milbases} else {_requirementAmount};
        if (_milbasesRebel >= _requiredMilbases) exitWith {_return = true};
    };
    case "airports": 
    {
        private _requiredAirports = if (_requirementAmount > count _airports) then {count _airports} else {_requirementAmount};
        if (_airportsRebel >= _requiredAirports) exitWith {_return = true};
    };
    case "seaports": 
    {
        private _requiredSeaports = if (_requirementAmount > count _seaports) then {count _seaports} else {_requirementAmount};
        if (_seaportsRebel >= _requiredSeaports) exitWith {_return = true};
    };
    case "outposts": 
    {
        private _requiredOutposts = if (_requirementAmount > count _outposts) then {count _outposts} else {_requirementAmount};
        if (_outpostsRebel >= _requiredOutposts) exitWith {_return = true};
    };
    default
    {
        _return = false
    };
};

_return;
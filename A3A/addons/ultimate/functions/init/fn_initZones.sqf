params [["_markersX", markersX]];

if !(hideEnemyMarkers) exitWith {};

markersImmune = markersX select {
    ((sidesX getVariable [_x, sideUnknown]) isEqualTo resistance)
    || 
    {("cont" in _x)} 
    || 
    {(_x in citiesX)}
    || 
    {(_x in airportsX)}
};

publicVariable "markersImmune";

private _revealedZones = revealedZones;

if (isNil "revealedZones") then {
    revealedZones = [];
};

{
    private _markerSide = sidesX getVariable [_x, sideUnknown];

    if (_x in _revealedZones) then {
        [_x] call A3U_fnc_revealZone;
        continue;
    };

    if (_markerSide isNotEqualTo sideUnknown && {_markerSide isNotEqualTo resistance}) then 
    {
        if (_x in airportsX || {_x in citiesX}) then {continue};

        "Dum"+_x setMarkerAlpha 0; // "Dum" is for dummy marker, the actual one you see in-game. The editor one is hidden
    };
} forEach _markersX;
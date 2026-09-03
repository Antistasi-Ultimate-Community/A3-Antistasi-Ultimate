/*
    File: fn_availableBasesMixed.sqf
    Author: wersal

    Description:
        Select from distance-weighted list of available enemy bases (air + land) or return full list.
        Combines fn_availableBasesAir and fn_availableBasesLand. Optionally filters outposts from land bases.

    Parameter(s):
        _side     - Side of enemy faction [SIDE]
        _targPos  - Target position or marker name [POS2D or STRING]
        _returnAll     - Optional, true to return all bases & weights (Default: false) [BOOL]
        _filterOutposts - Optional, true to exclude outposts from land bases (Default: true) [BOOL]

    Returns:
        _marker - Marker name of selected base, or nil if none available [STRING]
        or [_bases, _weights] if _returnAll is true [ARRAY]
*/

params ["_side", "_targPos", ["_returnAll", false], ["_filterOutposts", true]];

// Retrieve air and land base lists with their weights
private _airData = [_side, _targPos, true] call A3A_fnc_availableBasesAir;
private _landData = [_side, _targPos, true] call A3A_fnc_availableBasesLand;

private _landMarkers = _landData select 0;
private _landWeights = _landData select 1;

// Filter outposts if requested
if (_filterOutposts) then {
    private _filteredMarkers = [];
    private _filteredWeights = [];
    {
        if !(_x in outposts) then {
            _filteredMarkers pushBack _x;
            _filteredWeights pushBack (_landWeights select _forEachIndex);
        };
    } forEach _landMarkers;
    _landMarkers = _filteredMarkers;
    _landWeights = _filteredWeights;
};

// Combine markers and weights from both sources
private _allBases = (_airData select 0) + _landMarkers;
private _allWeights = (_airData select 1) + _landWeights;

if (_returnAll) exitWith { [_allBases, _allWeights] };

// If no bases are available, return nil (not possbile with air bases?)
if (_allBases isEqualTo []) exitWith { nil };

// Weighted random selection from combined pool
_allBases selectRandomWeighted _allWeights;
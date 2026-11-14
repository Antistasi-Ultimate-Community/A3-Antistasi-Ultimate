params ["_markerX", ["_ignoreFrontier", false]];

if ("carrier" in _markerX) exitWith { 0 };

private _size = [_markerX] call A3A_fnc_sizeMarker;
private _frontierX = if (_ignoreFrontier) then { false } else { [_markerX] call A3A_fnc_isFrontline };

private _groups = 0;

switch (true) do {
    case (_markerX in airportsX): {
        _groups = 2 + round (_size/30);
        _groups = _groups min 11;
        if (_frontierX) then {_groups = _groups + 3};
    };
    case (_markerX in outposts): {
        _groups = 1 + round (_size/30);
        _buildings = nearestObjects [getMarkerPos _markerX,(["Land_TTowerBig_1_F","Land_TTowerBig_2_F","Land_Communication_F"]) + A3A_milBuildingWhitelist, _size];
        if (_buildings isNotEqualTo []) then {_groups = _groups + 2};
        _groups = _groups min 7;
        if (_frontierX) then {_groups = _groups + 2};
    };
    case (_markerX in milbases): {
        _groups = 1 + round (_size/30);
        _buildings = nearestObjects [getMarkerPos _markerX,(["Land_TTowerBig_1_F","Land_TTowerBig_2_F","Land_Communication_F"]) + A3A_milBuildingWhitelist, _size];
        if (_buildings isNotEqualTo []) then {_groups = _groups + 2};
        _groups = _groups min 9;
        if (_frontierX) then {_groups = _groups + 2};
    };
    default {
        _groups = if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {1 + round (_size/45)} else {1 + round (_size/30)};
        _groups = _groups min 5;
        if (_frontierX) then {_groups = _groups + 1};
    };
};

4 * (_groups max 2);

/*
    Author: [Hazey]
    Description:
        Sends group directly to garrison positions

    Arguments:
        <Group> Group to run action on.
        <Array> Position you want group to look for garrison positions.
        <Number> How far you want to look for potential positions

    Return Value:
        <Group> Returns group if not enough buildings or positions are found.

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        private _garrisonGroups = [_group, getMarkerPos _markerX, _size] call A3A_fnc_patrolGroupGarrison;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group", "_position", "_radius"];

private _units = units _group;
private _buildings = [];
private _newGroups = [];

if (_units isEqualTo []) exitWith {};

_group lockWP true;
_buildings = nearestObjects [_position, keys PATCOM_Garrison_Positions, _radius];

if (_buildings isEqualTo []) then {
    _buildings = [_position, _radius] call A3A_fnc_patrolEnterableBuildings;
};

// don't place units on destroyed buildings
_buildings = _buildings select { damage _x < 1 && !isObjectHidden _x };
_buildings = _buildings call BIS_fnc_arrayShuffle;

{
    if (_units isEqualTo []) exitWith {};
    private _building = _x;
    private _class = typeOf _building;
    private _buildingPositions = [];

    if (_class in PATCOM_Garrison_Positions) then {
        {
            private _buildingPos = _building buildingPos _x;
            if (_buildingPos isNotEqualTo [0,0,0]) then {
                _buildingPositions pushBack _buildingPos;
            };
        } forEach (PATCOM_Garrison_Positions get _class);
    } else {
        _buildingPositions = _building buildingPos -1;
    };

    {
        if (_units isEqualTo []) exitWith {};
        private _unit = _units select 0;
        private _position = _x;
        _unit setPosATL _position;
        _unit setDir ((_unit getRelDir _building)-180);
        _unit disableAI "PATH";
        _unit setUnitPos "UP";

        doStop _unit;

        _units deleteAt 0;
    } forEach _buildingPositions;
} forEach _buildings;

// Splits Garrison AI into an additional defense group if not enough buildings/positions were found.
if (_units isNotEqualTo []) then {
   private _groupSplit = createGroup (side _group);
   _newGroups pushBack _groupSplit;
   _units joinSilent _groupSplit;
   [_groupSplit, "Patrol_Defend", 0, 100, -1, true, _position, false] call A3A_fnc_patrolLoop;
};
_newGroups

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_positionX","_sideX","_typesX"];

private _groupX = createGroup _sideX;

// Coalition: choose one Rival coalition member for the whole group.
private _coalitionTag = [
    _groupX,
    "riv",
    _typesX
] call A3A_fnc_selectCoalitionForGroup;

private _resolvedTypes = _typesX apply {
    [
        _groupX,
        "riv",
        _x
    ] call A3A_fnc_resolveCoalitionType
};

private _ranks = ["LIEUTENANT","SERGEANT","CORPORAL"];
private _countX = count _typesX;

if (_countX < 4) then {
	_ranks = _ranks - ["LIEUTENANT","SERGEANT"];
} else {
	if (_countX < 8) then {
		_ranks = _ranks - ["LIEUTENANT"]
	};
};
private _countRanks = (count _ranks - 1);

Debug_2("Side: %1 spawning group composition: %2", _sideX, _typesX);

diag_log format [
    "[A3A Coalition Rivals] spawnGroup tag='%1' original=%2 resolved=%3",
    _coalitionTag,
    _typesX,
    _resolvedTypes
];

for "_i" from 0 to (_countX - 1) do {
    private _requestedType = _typesX select _i;
    private _resolvedType = _resolvedTypes select _i;

	_unit = [_groupX, _resolvedType, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
	_unit allowDamage false;

	if (_i <= _countRanks) then { 
		_unit setRank (_ranks select _i) 
	};
	if (
        _requestedType in (
            A3A_faction_riv getOrDefault [
                "SquadLeaders",
                []
            ]
        )
    ) then {
		_groupX selectLeader _unit
	};
	sleep 0.25;
};

{_x allowDamage true} forEach units _groupX;


_groupX

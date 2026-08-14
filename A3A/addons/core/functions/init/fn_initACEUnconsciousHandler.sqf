/*
	Handler for the ACE medical unconscious event

	No arguments or return
	Should be installed on every machine.
*/

scriptName "initACEUnconsciousHandler.sqf";
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Info("initACEUnconsciousHandler started");

["ace_unconscious", {
	params["_unit", "_knockout"];
	private _group = group _unit;
	private _unitIsLocal = local _unit;
	private _groupIsLocal = local _group;
	private _realSide = side _group;		// setUnconscious in ACE often breaks this otherwise

	if (_knockout) exitWith
	{
		if (_unitIsLocal) then {
			_unit setVariable ["incapacitated", true, true];	// for canFight tests
		};

		if (_groupIsLocal) then {
			private _groupLeader = leader _group;

			// Pass group lead if unit is the leader
			if (_unit == _groupLeader) then
			{
				private _allUnits = (units _group) select {_x call A3A_fnc_canFight};

				// Ensure there are any units available to select
				if (_allUnits isNotEqualTo []) then {
					private _playerUnits = _allUnits select {isPlayer _x};
					private _newLeader = _playerUnits param [0];

					// Check if there is an eligible player unit first
					if (isNil "_newLeader") then {
						private _aiUnits = _allUnits select {!isPlayer _x};

						// If not select an AI unit
						_newLeader = _aiUnits param [0];
					};

					// Should never be nil, but just in case
					if (!isNil "_newLeader") then {
						_group selectLeader _newLeader;

						// Save previous group leader
						_group setVariable ["A3A_previousGroupLeader", _groupLeader, true];
					};
				};
			};
		};

		if (_unitIsLocal && (_realSide == Occupants || _realSide == Invaders)) then {
			[_unit, _group, _unit getVariable ["ace_medical_lastDamageSource", objNull]] spawn A3A_fnc_AIReactOnKill;
		};
	};

	// Unit woke up
	if (_unitIsLocal) then {
		_unit setVariable ["incapacitated", false, true];
	};

	if (_groupIsLocal) then {
		private _previousGroupLeader = _group getVariable ["A3A_previousGroupLeader", objNull];

		if (_unit == _previousGroupLeader) then {
			_group selectLeader _unit;
			_group setVariable ["A3A_previousGroupLeader", nil, true];
		};
	};

	if (_unitIsLocal) then {
		if !(_unit getVariable ["ACE_captives_isHandcuffed", false]) then {
			_unit setCaptive false;			// match vanilla behaviour
		};
		
		if (isPlayer _unit) exitWith {};					// don't force surrender with players
		if (_realSide != Occupants && _realSide != Invaders) exitWith {};
		if (_unit getVariable ["surrendered", false]) exitWith {};		// don't surrender twice

		// surrender if we don't have a primary weapon
		if (primaryWeapon _unit == "") exitWith { [_unit] spawn A3A_fnc_surrenderAction };

		// find closest fighting unit within 50m
		private _nearestUnit = objNull;
		private _minDist = 999;
		{
			private _dist = _x distance _unit;
			if (side _x != civilian && _x != _unit && _dist < _minDist && {_x call A3A_fnc_canFight}) then {
				_minDist = _dist;
				_nearestUnit = _x;
			};
		} forEach (_unit nearEntities ["Man", 50]);

		if (side _nearestUnit == teamPlayer) then { [_unit] spawn A3A_fnc_surrenderAction };
	};
}] call CBA_fnc_addEventHandler;

Info("initACEUnconsciousHandler completed");

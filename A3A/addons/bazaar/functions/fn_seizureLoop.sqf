// SERVER: the risk. Every 20s each sealed crate away from HQ is checked:
// if enemy units have eyes on it (on the vehicle carrying it, or on the
// rebel standing beside it) for long enough, it is confiscated. A crate on
// a destroyed vehicle is lost with it. Smuggling-run crates run the same
// risk (their run fails - fn_runFail), and runs past their deadline end.
if (!isServer) exitWith {};
if (!isNil "ABZ_seizureRunning") exitWith {};
ABZ_seizureRunning = true;
// smuggling-run crates: fast travel check every second (fn_runWatch)
[{ call ABZ_fnc_runWatch }, 1] call CBA_fnc_addPerFrameHandler;

while { true } do {
	sleep 20;
	isNil { ABZ_crates = ABZ_crates select { !isNull _x } };	// atomic: a crate bought meanwhile is never dropped
	isNil { call ABZ_fnc_runCheck };
	private _on = missionNamespace getVariable ["ABZ_seizure", true];
	private _ticks = 1 max ceil ((missionNamespace getVariable ["ABZ_seizureSeconds", 60]) / 20);

	{
		private _c = _x;
		private _d = _c getVariable ["ABZ_crate", []];
		private _runId = _c getVariable ["ABZ_runId", -1];
		if (_d isEqualTo [] && {_runId < 0}) then { continue };
		_d params [["_cls", ""], ["_n", 0]];
		private _name = if (_runId >= 0) then { "" } else { [_cls] call ABZ_fnc_displayNameOf };
		private _carrier = attachedTo _c;

		// went up with the vehicle
		if (!isNull _carrier && {!alive _carrier} && {!(_carrier isKindOf "CAManBase")}) then {	// a dead player carrying it just drops it
			if (_runId >= 0) then {
				isNil { [_runId, "the crate went up with the vehicle carrying it"] call ABZ_fnc_runFail };
			} else {
				["ABZ_chat", [format ["[Bazaar] A sealed crate (%1x %2) was destroyed along with the vehicle carrying it.", _n, _name]]] call CBA_fnc_globalEvent;
				diag_log format ["[ABZ] Crate of %1x %2 destroyed with vehicle %3", _n, _cls, typeOf _carrier];
				isNil { [_c] call ABZ_fnc_crateRemove };
			};
			continue;
		};
		if (!_on) then { continue };
		// ACE-loaded bulk crates are out of sight. A smuggling run's crate isn't
		// let off that easily: eyes on the vehicle are eyes on the run.
		if (isObjectHidden _c && {_runId < 0}) then { continue };
		if (isNull _carrier) then { _carrier = _c };

		private _pos = getPosATL _carrier;
		if ([_pos] call ABZ_fnc_atHQ) then {
			_c setVariable ["ABZ_heat", 0];
			continue;
		};

		// who do the enemy actually see: the vehicle, or the rebel by the crate?
		private _target = _carrier;
		if (_carrier isEqualTo _c) then {
			private _near = allPlayers select { alive _x && {_x distance _c < 15} };
			if (_near isEqualTo []) then {
				_c setVariable ["ABZ_heat", 0];
				continue;
			};
			_target = _near select 0;
		};

		private _spotted = (([_pos, 250] call ABZ_fnc_enemiesNear) findIf { (_x knowsAbout _target) > 1.5 }) > -1;
		private _heat = _c getVariable ["ABZ_heat", 0];
		_heat = if (_spotted) then { _heat + 1 } else { 0 };
		_c setVariable ["ABZ_heat", _heat];

		if (_spotted && {_heat == 1}) then {
			{
				["ABZ_notify", ["You've been spotted with contraband! Break contact or the crate gets seized."], _x] call CBA_fnc_targetEvent;
			} forEach (allPlayers select { _x distance _target < 30 });
		};
		if (_heat >= _ticks) then {
			if (_runId >= 0) then {
				isNil { [_runId, format ["the crate was seized near %1", [_pos] call ABZ_fnc_townName]] call ABZ_fnc_runFail };
			} else {
				["ABZ_chat", [format ["[Bazaar] CONTRABAND SEIZED - a sealed crate (%1x %2) was confiscated near %3.", _n, _name, [_pos] call ABZ_fnc_townName]]] call CBA_fnc_globalEvent;
				diag_log format ["[ABZ] Crate of %1x %2 seized at %3", _n, _cls, _pos];
				isNil { [_c] call ABZ_fnc_crateRemove };
			};
		};
	} forEach +ABZ_crates;

	isNil { ABZ_crates = ABZ_crates select { !isNull _x } };	// atomic: a crate bought meanwhile is never dropped
};

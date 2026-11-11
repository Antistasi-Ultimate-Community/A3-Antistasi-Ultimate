// SERVER, unscheduled, every second (a CBA per-frame handler started by
// fn_seizureLoop): a smuggling run's crate has to travel - by road, by
// boat, by helicopter, but travel. Antistasi's fast travel moves a vehicle
// and whatever is loaded on it in one jump, past every patrol on the way;
// a crate that covers ground faster than anything that can carry it
// (350 m/s, plus slack) voids the contract.
// It also remembers the vehicle carrying the crate: if that vehicle dies and
// the crate comes loose (ACE throws its cargo out of a wreck, an unload
// from a fresh wreck), the run fails just as if the crate had gone with it.
{
	_x params ["_runId", "", "", "", "", "", "", "_crate"];
	if (isNull _crate) then { continue };
	private _v = attachedTo _crate;
	// only vehicles count as carriers - a player carrying or dragging the crate
	// (ACE) who dies just drops it, and a parachute is no vehicle either
	private _isVeh = !isNull _v && {!(_v isKindOf "CAManBase")} && {!(_v isKindOf "ParachuteBase")};
	if (_isVeh && {!alive _v}) then {
		// still strapped to a fresh wreck (Antistasi logistics doesn't let go)
		[_runId, localize "STR_A3U_Bazaar_Runs_LostWithVehicle"] call ABZ_fnc_runFail;
		continue;
	};
	if (!isNull _v) then {
		if (_isVeh) then { _crate setVariable ["ABZ_carrier", _v] } else { _crate setVariable ["ABZ_carrier", nil] };
	} else {
		private _lc = _crate getVariable ["ABZ_carrier", objNull];
		if (!isNull _lc) then {
			_crate setVariable ["ABZ_carrier", nil];
			if (!alive _lc) then {
				[_runId, localize "STR_A3U_Bazaar_Runs_LostWithVehicle"] call ABZ_fnc_runFail;
				continue;
			};
		};
	};
	private _p = getPosATL ([_crate, _v] select (!isNull _v));
	private _last = _crate getVariable ["ABZ_lastSeen", []];
	_crate setVariable ["ABZ_lastSeen", [_p, time]];
	if (_last isNotEqualTo []) then {
		_last params ["_lp", "_lt"];
		private _dt = time - _lt;
		if (_dt > 0 && {_dt < 5} && {(_p distance2D _lp) > (50 + 350 * _dt)}) then {
			[_runId, localize "STR_A3U_Bazaar_Runs_FastTravel"] call ABZ_fnc_runFail;
		};
	};
} forEach +ABZ_runs;

// SERVER, unscheduled: every 20s (fn_seizureLoop) - ends runs whose crate is
// gone (deleted with a vehicle, cleaned up), whose deadline passed, or whose
// destination trader no longer exists at all.
{
	_x params ["_runId", "", "", "", "_destId", "", "_deadline", "_crate"];
	switch (true) do {
		case (isNull _crate): { [_runId, "the crate was lost"] call ABZ_fnc_runFail };
		case (time > _deadline): { [_runId, "the deadline passed"] call ABZ_fnc_runFail };
		case (([_destId] call ABZ_fnc_vendorEntry) isEqualTo []): { [_runId, "the contact on the other end vanished", true] call ABZ_fnc_runFail };
	};
} forEach +ABZ_runs;

// contracts pointing at a trader who is gone for good (no town to move to,
// or the trader count was lowered): re-rolled on the next tick
{
	private _o = _x param [13, []];
	if (_o isNotEqualTo [] && {([_o select 0] call ABZ_fnc_vendorEntry) isEqualTo []}) then {
		_x set [13, []];
		_x set [14, -1];
	};
} forEach ABZ_vendors;

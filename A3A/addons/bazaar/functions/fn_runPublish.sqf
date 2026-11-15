// SERVER: tells every client which smuggling runs are active (who holds
// them and where they're headed) - for the "Hand over" scroll action and
// the crate readouts. [[uid, runId, destId], ...]
private _pub = ABZ_runs apply { [_x select 1, _x select 0, _x select 4] };
if (_pub isNotEqualTo (missionNamespace getVariable ["ABZ_runsPub", []])) then {
	ABZ_runsPub = _pub;
	publicVariable "ABZ_runsPub";
};

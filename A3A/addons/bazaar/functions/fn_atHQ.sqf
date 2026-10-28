// Is this position (or object) "at base" for unpacking a crate?
// Antistasi: within 60m of the HQ marker or 30m of the arsenal box.
// Outside Antistasi there is no base, so anywhere counts.
params [["_pos", [0,0,0], [[], objNull]]];
if (_pos isEqualType objNull) then { _pos = getPosATL _pos };
if !(call ABZ_fnc_isAntistasi) exitWith { true };

private _hq = getMarkerPos "Synd_HQ";
if (!(_hq isEqualTo [0,0,0]) && {_pos distance2D _hq < 60}) exitWith { true };
private _box = missionNamespace getVariable ["boxX", objNull];
!isNull _box && {_pos distance2D _box < 30}

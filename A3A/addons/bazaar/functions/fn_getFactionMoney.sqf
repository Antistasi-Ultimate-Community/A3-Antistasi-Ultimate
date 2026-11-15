// Returns the Antistasi faction war chest balance, or -1 when no faction
// money system is present (outside Antistasi, or before mission init).
// Antistasi keeps the balance on its "server" logic object as "resourcesFIA",
// published to all machines, so any client can read it directly.
private _srv = missionNamespace getVariable ["server", objNull];
if (isNull _srv) exitWith { -1 };
private _f = _srv getVariable ["resourcesFIA", -1];
if !(_f isEqualType 0) exitWith { -1 };
_f

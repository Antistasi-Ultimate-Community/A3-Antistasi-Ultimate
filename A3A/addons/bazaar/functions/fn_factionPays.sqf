// SERVER: does the faction war chest pay (and get paid) right now?
// The same test fn_serverCharge and fn_serverPay use: "Purchases paid from"
// is Faction money and Antistasi's war chest is readable.
if ((missionNamespace getVariable ["ABZ_funds", 0]) != 1) exitWith { false };
private _srv = missionNamespace getVariable ["server", objNull];
private _f = if (isNull _srv) then { -1 } else { _srv getVariable ["resourcesFIA", -1] };
_f isEqualType 0 && {_f >= 0} && {!isNil "A3A_fnc_resourcesFIA"}

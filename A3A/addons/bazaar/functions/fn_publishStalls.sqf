// SERVER: publishes where the open stalls are - [[id, posATL, townCentre], ...]
// - so a client can tell it is standing at a stall without relying on the
// trader unit's variables having arrived (fn_nearVendor fallback, Shift+K),
// and its undercover pre-check looks up the same town the server does.
// Only sends when something changed.
if (!isServer) exitWith {};
private _st = (ABZ_vendors select { (_x select 9) == "ok" }) apply { [_x select 0, _x select 2, _x select 11] };
if !(_st isEqualTo (missionNamespace getVariable ["ABZ_stalls", []])) then {
	ABZ_stalls = _st;
	publicVariable "ABZ_stalls";
};

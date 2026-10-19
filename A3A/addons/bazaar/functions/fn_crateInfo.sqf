// Client: "Inspect Bazaar Crate" - what's in it and what to do with it.
// A smuggling-run crate (v1.1.0) says whose it is and where it's going.
params [["_c", objNull, [objNull]]];
if (isNull _c) exitWith {};
private _d = _c getVariable ["ABZ_crate", []];
private _ri = _c getVariable ["ABZ_runInfo", []];
if (_d isEqualTo [] && {_ri isEqualTo []}) exitWith {};

private _header = "Sealed Bazaar crate";
private _body = "";
if (_d isEqualTo []) then {
	_ri params [["_who", ""], ["_dn", ""], ["_dt", ""]];
	_header = "Smuggled crate";
	_body = format [
		"<t color='#ffb060'>Contraband - %1's smuggling run</t><br/>Hand it over to %2 near %3 (the stall is marked on %1's map). It has to be within 30m of the stall, on the ground or still in the vehicle.<br/><br/><t size='0.85' color='#c8c8c8'>Spotted with it long enough and it's seized. Lose the vehicle carrying it and the run fails. It can't be opened or unpacked.</t>",
		_who, _dn, _dt
	];
} else {
	_d params ["_cls", "_n"];
	private _owner = _c getVariable ["ABZ_owner", ""];
	private _where = if ([_c] call ABZ_fnc_atHQ) then {
		"You're at HQ - unpack it into the arsenal from the scroll menu (or every crate around at once: 'Unpack Every Bazaar Crate Here')."
	} else {
		"Get it to HQ (near the arsenal) and unpack it there - no need to unload it first. Keep enemy eyes off it on the way."
	};
	_body = format [
		"<t color='#d98cff'>%1x %2</t><br/>%3<br/><br/><t size='0.85' color='#c8c8c8'>%4</t>",
		_n, [_cls] call ABZ_fnc_displayNameOf, ["", format ["Bought by %1", _owner]] select (_owner != ""), _where
	];
};
// through Antistasi's notification queue when it's there (a plain hint is
// painted over by its renderer); fn_notify passes markup through untouched
if (!isNil "A3A_fnc_customHint") then {
	[_body, _header] call ABZ_fnc_notify;
} else {
	hint parseText (format ["<t size='1.1' color='#f1c27d'>%1</t><br/><br/>", toUpper _header] + _body);
};

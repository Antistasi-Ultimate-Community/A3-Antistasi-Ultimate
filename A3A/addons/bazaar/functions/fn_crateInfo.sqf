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
	_body = format [localize "STR_A3U_Bazaar_Crate_Contraband", _who, _dn, _dt];
} else {
	_d params ["_cls", "_n"];
	private _owner = _c getVariable ["ABZ_owner", ""];
	private _where = localize (["STR_A3U_Bazaar_Crate_NotAtHQ", "STR_A3U_Bazaar_Crate_AtHQ"] select ([_c] call ABZ_fnc_atHQ));
	_body = format [
		"<t color='#d98cff'>%1x %2</t><br/>%3<br/><br/><t size='0.85' color='#c8c8c8'>%4</t>",
		_n, [_cls] call ABZ_fnc_displayNameOf, ["", format [localize "STR_A3U_Bazaar_Crate_BoughtBy", _owner]] select (_owner != ""), _where
	];
};
// through Antistasi's notification queue when it's there (a plain hint is
// painted over by its renderer); fn_notify passes markup through untouched
if (!isNil "A3A_fnc_customHint") then {
	[_body, _header] call ABZ_fnc_notify;
} else {
	hint parseText (format ["<t size='1.1' color='#f1c27d'>%1</t><br/><br/>", toUpper _header] + _body);
};

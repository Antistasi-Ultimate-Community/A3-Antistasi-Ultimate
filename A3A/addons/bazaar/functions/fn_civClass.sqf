// SERVER: a civilian class for a trader - the campaign's own civ template
// when Antistasi is running (so an RHS/CUP/whatever civ set is honoured),
// else a scan for civilian-side people. Cached.
if (!isNil "ABZ_civClasses" && {ABZ_civClasses isNotEqualTo []}) exitWith { selectRandom ABZ_civClasses };

private _out = [];
private _civ = missionNamespace getVariable ["A3A_faction_civ", nil];
if (!isNil "_civ" && {_civ isEqualType createHashMap}) then {
	{
		private _v = _civ getOrDefault [_x, []];
		if (_v isEqualType "") then { _v = [_v] };
		if (_v isEqualType []) then {
			{
				if (_x isEqualType "" && {isClass (configFile >> "CfgVehicles" >> _x)}) then { _out pushBackUnique _x };
			} forEach _v;
		};
	} forEach ["unitMan", "unitWorker"];
};

if (_out isEqualTo []) then {
	_out = ("getNumber (_x >> 'scope') == 2 && {getNumber (_x >> 'side') == 3} && {(configName _x) isKindOf 'CAManBase'} && {getText (_x >> 'simulation') == 'soldier'}"
		configClasses (configFile >> "CfgVehicles")) apply { configName _x };
	private _plain = _out select { ((toLower _x) select [0, 6]) == "c_man_" };
	if (_plain isNotEqualTo []) then { _out = _plain };
};
if (_out isEqualTo []) then { _out = ["C_man_1"] };

ABZ_civClasses = _out;
selectRandom _out

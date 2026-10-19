// Shared (client UI + server authority): can the rebels take delivery of a
// vehicle of this category right now?
// Returns [met, richText, plainText].
//
// Requirements are Antistasi Ultimate's own black-market rules
// (ultimate\config\trader\vehicles\vehicles_conditions.hpp), so a server
// sees the same progression whichever market the vehicle comes from:
//   unarmed vehicle  1 resource site + 1 factory
//   armed vehicle    1 resource site + 2 factories
//   boat             1 seaport
//   APC/IFV, AA      (2 seaports or 1 military base) + 2 factories
//   helicopter       (1 airport or 1 military base) + 2 factories
//   tank             1 military base + 3 factories
// Like Antistasi, a requirement is capped at how many of that facility the
// map has (a map with no seaports never blocks on seaports). Unlike it, a
// destroyed site does not count until it is rebuilt.
params [["_cat", "", [""]]];
if ((missionNamespace getVariable ["ABZ_vehRequirements", 0]) == 1) exitWith {
	[true, "<t color='#a0ffa0'>No facility requirement on this server.</t>", "No facility requirement on this server."]
};
if (!(call ABZ_fnc_isAntistasi) || {isNil "sidesX"}) exitWith { [true, "", ""] };
private _ign = missionNamespace getVariable ["blackMarketIgnoreRequirements", 0];
if (_ign isEqualTo true || {_ign isEqualTo 1}) exitWith {
	[true, "<t color='#a0ffa0'>Requirements waived on this server.</t>", "Requirements waived on this server."]
};

private _clauses = switch (_cat) do {
	case "UNARMEDCAR": { [[["resources", 1]], [["factories", 1]]] };
	case "ARMEDCAR": { [[["resources", 1]], [["factories", 2]]] };
	case "BOAT": { [[["seaports", 1]]] };
	case "APC";
	case "AA": { [[["seaports", 2], ["milbases", 1]], [["factories", 2]]] };
	case "HELI": { [[["airports", 1], ["milbases", 1]], [["factories", 2]]] };
	case "TANK": { [[["milbases", 1]], [["factories", 3]]] };
	default { [] };
};

private _vars = createHashMapFromArray [["factories", "factories"], ["seaports", "seaports"], ["airports", "airportsX"], ["milbases", "milbases"], ["resources", "resourcesX"]];
private _names = createHashMapFromArray [["factories", ["factory", "factories"]], ["seaports", ["seaport", "seaports"]], ["airports", ["airport", "airports"]], ["milbases", ["military base", "military bases"]], ["resources", ["resource site", "resource sites"]]];
private _destroyed = missionNamespace getVariable ["destroyedSites", []];
if !(_destroyed isEqualType []) then { _destroyed = [] };

private _allMet = true;
private _rich = [];
private _plain = [];
{
	private _clauseMet = false;
	private _opts = [];
	{
		_x params ["_type", "_n"];
		private _arr = missionNamespace getVariable [_vars get _type, []];
		if !(_arr isEqualType []) then { _arr = [] };
		private _own = { (sidesX getVariable [_x, sideUnknown]) == teamPlayer && {!(_x in _destroyed)} } count _arr;
		if (_own >= (_n min (count _arr))) then { _clauseMet = true };
		(_names get _type) params ["_one", "_many"];
		_opts pushBack format ["%1 %2 (you hold %3)", _n, [_many, _one] select (_n == 1), _own];
	} forEach _x;
	if (!_clauseMet) then { _allMet = false };
	_rich pushBack format ["<t color='%1'>%2</t>", ["#ff8a6a", "#a0ffa0"] select _clauseMet, _opts joinString " or "];
	_plain pushBack (_opts joinString " or ");
} forEach _clauses;

if (_clauses isEqualTo []) exitWith { [true, "", ""] };
[_allMet, "Needs " + (_rich joinString " and "), "needs " + (_plain joinString " and ")]

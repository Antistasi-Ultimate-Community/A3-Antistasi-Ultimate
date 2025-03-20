/*
 * File: fn_loadFaction.sqf
 * Author: Spoffy
 * Description:
 *    Loads a faction definition file
 * Params:
 *    _filepaths - Single or array of faction definition filepath
 * Returns:
 *    Namespace containing faction information
 * Example Usage:
 */

#include "..\..\script_component.hpp"
params [
	["_filepaths",[],["",[]]]
];

if (_filepaths isEqualType "") then {_filepaths = [_filepaths]};
if (count _filepaths == 0) then {Error("No filepaths provided.")};

private _dataStore = createHashMap;

private _fnc_saveToTemplate = {
	params ["_name", "_data"];

	_dataStore set [_name, _data];
};

private _fnc_getFromTemplate = {
	params ["_name"];

	_dataStore get _name;
};

//Keep track of loadout namespaces so we can delete them when we're done.
private _loadoutNamespaces = [];
private _fnc_createLoadoutData = {
	private _namespace = createHashMap;
	_loadoutNamespaces pushBack _namespace;
	_namespace
};

private _fnc_copyLoadoutData = {
	params ["_sourceNamespace"];
    + _sourceNamespace //hashmaps deepcopy with +
};

private _allLoadouts = createHashMap;
_dataStore set ["loadouts", _allLoadouts];

private _fnc_saveUnitToTemplate = {
	params ["_typeName", "_loadouts", ["_traits", []], ["_unitProperties", []]];
	private _unitDefinition = [_loadouts, _traits, _unitProperties];
	_allLoadouts set [_typeName, _unitDefinition];
};

private _fnc_generateAndSaveUnitToTemplate = {
	params ["_name", "_template", "_loadoutData", ["_traits", []], ["_unitProperties", []]];
	private _loadouts = [];
	for "_i" from 1 to loadoutsToGenerate do {
		_loadouts pushBack ([_template, _loadoutData] call A3A_fnc_loadout_builder);
	};
	[_name, _loadouts, _traits, _unitProperties] call _fnc_saveUnitToTemplate;
};

private _fnc_generateAndSaveUnitsToTemplate = {
	params ["_prefix", "_unitTemplates", "_loadoutData"];
	{
		_x params ["_name", "_template", ["_traits", []], ["_unitProperties", []]];
		private _finalName = format ["%1_%2", _prefix, _name];
		[_finalName, _template, _loadoutData, _traits, _unitProperties] call _fnc_generateAndSaveUnitToTemplate;
	} forEach _unitTemplates;
};

// Custom defined name lists beyond what is available in CfgWorlds.GenericNames
Lao_LastNames = [
    "Sisavath", "Souvanthong", "Inthavong", "Keomany", "Sihavong", "Chansy", "Phanthavong", "Somphone", "Bounmy", "Douangphouxay",
    "Xaysana", "Vongsavanh", "Phimmasone", "Souvannavong", "Khamphoumy", "Sengsouly", "Thongsavath", "Vannasith", "Phouangmala", "Khamchai",
    "Sihavong", "Vongphachanh", "Xayavong", "Thammavong", "Vannavong", "Douangchai", "Chanthavong", "Souvannaseng", "Phanlasy", "Thongsavanh",
    "Somsanith", "Khamvongsa", "Phommasane", "Inthasone", "Khamsouk", "Vixay", "Kongmany", "Chanthalangsy", "Souvannaphong", "Bounnack",
    "Douangsavanh", "Xaybandith", "Phengsavanh", "Sisouvanh", "Nanthavong", "Vongxay", "Phommachanh", "Soukthavong", "Phouangpak", "Somsavath"
];
Lao_FirstNames = [
    "Somchai", "Bounthavy", "Khamla", "Sengphet", "Xay", "Chansy", "Thongchai", "Vixay", "Phoutthasone", "Douang",
    "Souvanny", "Khamphou", "Chanthone", "Sisouk", "Somsack", "Phomma", "Bounlue", "Khampheng", "Thonglith", "Vong",
];
VN_LastNames = [
    "Nguyen", "Tran", "Le", "Pham", "Hoang", "Phan", "Vu", "Dang", "Bui", "Ngo", "Duong", "Dinh", 
	"Ly", "Luu", "Thach", "Ton", "Tieu", "Quach", "Diep", "Huynh", "Trinh", "Tu", "Gia", "Van", 
	"Luong", "Nghiem", "Khanh", "Son", "Dao", "Tam", "Hien"
];
VN_FirstNames = ["An", "Bao", "Cuong", "Dung", "Hai", "Khoa", "Linh", "Minh", "Quang", "Tu"];

private _fnc_saveNames = {
    params ["_names"];

    private _firstNames = [];
    private _lastNames = [];

    switch (_names) do {
		case "VietnameseMen": {
            _firstNames = VN_FirstNames;
            _lastNames = VN_LastNames;
        };
		case "LaoMen": {
            _firstNames = Lao_FirstNames;
            _lastNames = Lao_LastNames;
        };
		default {
    		private _nameConfig = configfile >> "CfgWorlds" >> "GenericNames" >> _names;
    		_firstNames = configProperties [_nameConfig >> "FirstNames"] apply { getText(_x) };
    		_lastNames = configProperties [_nameConfig >> "LastNames"] apply { getText(_x) };
		}
	};

	["firstNames", _firstNames] call _fnc_saveToTemplate;
    ["lastNames", _lastNames] call _fnc_saveToTemplate;
};

{
	call compile preprocessFileLineNumbers _x;
} forEach _filepaths;


_dataStore

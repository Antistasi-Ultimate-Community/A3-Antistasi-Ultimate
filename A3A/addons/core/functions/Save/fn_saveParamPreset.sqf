#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {
    Error("Miscalled server-only function");
};

params ["_presetName", "_presetParams", ["_delete", false]];

Info("Starting params preset save");
//[localize "STR_A3A_save_persisent_save",localize "STR_A3A_save_save_game_starting"] remoteExecCall ["A3A_fnc_customHint",0,false];

// Select save namespace
A3A_saveTarget params ["_serverID", "_campaignID"];
private _saveToNewNamespace = _serverID isEqualType false;
private _namespace = [profileNamespace, missionProfileNamespace] select _saveToNewNamespace;

// Save param preset to namespace
private _customPresets = _namespace getVariable ["antistasiUltimateCustomParamPresets", createHashMap];
if (_delete) then {
	_customPresets deleteAt _presetName;
} else {
	_customPresets set [_presetName, _presetParams];
};
_namespace setVariable ["antistasiUltimateCustomParamPresets", _customPresets];

//[localize "STR_A3A_save_persisent_save",_saveHintText] remoteExecCall ["A3A_fnc_customHint",0,false];

if (_saveToNewNamespace) then { saveMissionProfileNamespace } else { saveProfileNamespace };

Info("Params preset save completed");
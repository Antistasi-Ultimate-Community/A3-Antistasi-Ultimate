#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_presetName", "_presetParams", ["_delete", false]];

Info("Starting params preset save");

// Save param preset to namespace
private _customPresets = profileNamespace getVariable ["antistasiUltimateCustomParamPresets", createHashMap];
if (_delete) then {
	_customPresets deleteAt _presetName;
} else {
	_customPresets set [_presetName, _presetParams];
};
profileNamespace setVariable ["antistasiUltimateCustomParamPresets", _customPresets];

saveProfileNamespace;

Info("Params preset save completed");
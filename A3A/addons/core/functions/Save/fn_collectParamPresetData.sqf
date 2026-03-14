#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

// profileNamespace presets
private _customPresets = [profileNamespace getVariable "antistasiUltimateCustomParamPresets"];

// missionProfileNamespace presets
private _customPresets2 = [missionProfileNamespace getVariable "antistasiUltimateCustomParamPresets"];

private _presetData = createHashMap;
_presetData merge _customPresets;
_presetData merge _customPresets2;

_presetData;

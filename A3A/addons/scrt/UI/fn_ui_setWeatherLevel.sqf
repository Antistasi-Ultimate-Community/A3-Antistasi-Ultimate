#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

disableSerialization;
private _display = findDisplay 60000;
private _combo = _display displayCtrl 4076;
private _selectedData = lbData [4076, lbCurSel _combo];

profileNamespace setVariable ["A3A_weatherLevel", _selectedData];
saveProfileNamespace;

// Saving interval from slider
private _slider = _display displayCtrl 4075;
private _interval = sliderPosition _slider;
profileNamespace setVariable ["A3A_weatherInterval", _interval];
saveProfileNamespace;

// Sending to server for sync
publicVariableServer "A3A_weatherLevel";
publicVariableServer "A3A_weatherInterval";
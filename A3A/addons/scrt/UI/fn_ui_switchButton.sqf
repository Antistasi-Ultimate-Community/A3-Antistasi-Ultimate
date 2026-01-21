#include "..\script_component.hpp"

params ["_table", "_idc", ["_change", true], ["_action", "NONE"]];	
private _optionData = [_table, _idc] call SCRT_fnc_ui_getSwitchLookup;

private _varStr = (_optionData select 0);
private _currentValue = (_optionData select 1);	
private _allValues = (_optionData select 2);

private _newValue = nil;
private _representation = nil;

if (_change) then {
    switch (true) do {
        case(_currentValue isEqualType true): { //fast check if type is boolean
            _newValue = !_currentValue;
            _representation = if(_newValue) then {_allValues select 0} else {_allValues select 1};
        };  
        //TODO: other types
    };

    missionNamespace setVariable [_varStr, _newValue];
    ctrlSetText [(_idc + 3), _representation];

    if (_action isEqualTo "NONE") exitWith {};
    if (_action isEqualTo "MUSIC") exitWith { [] call EFUNC(ultimate_tracklist_editor,music) };
    if (_action isEqualTo "PARADROP") exitWith {
        if (isPlayerParadropable) then {
            [] spawn {
                private _paradropAttendants = [missionNamespace, "paradropAttendants", []] call BIS_fnc_getServerVariable;
                private _uid = getPlayerUID player;
                _paradropAttendants pushBackUnique _uid;
                [missionNamespace, "paradropAttendants", _paradropAttendants] call BIS_fnc_setServerVariable;
            };
        } else {
            [] spawn {
                private _paradropAttendants = [missionNamespace, "paradropAttendants", []] call BIS_fnc_getServerVariable;
                private _uid = getPlayerUID player;

                private _playerIndex = _paradropAttendants find _uid;
                
                if (_playerIndex != -1) then {
                    _paradropAttendants deleteAt _playerIndex;
                    [missionNamespace, "paradropAttendants", _paradropAttendants] call BIS_fnc_setServerVariable;
                };
            };
        };
    };
    if (_action isEqualTo "UNIFORMRANDOMIZE") exitWith {
        publicVariable "randomizeRebelLoadoutUniforms";
    };
} else {
    _representation = if(_currentValue) then {_allValues select 0} else {_allValues select 1};
    ctrlSetText [(_idc + 3), _representation];
};
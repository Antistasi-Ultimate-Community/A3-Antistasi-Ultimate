//fn_civVEHinit
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _veh = _this select 0;
private _vehCrew = crew _veh;

if (_veh isKindOf "Car") then {
	_veh addEventHandler ["HandleDamage",{if (((_this select 1) find "wheel" != -1) and (_this select 4=="") and (!isPlayer driver (_this select 0))) then {0} else {(_this select 2)};}];
};

[_veh] spawn A3A_fnc_cleanserVeh;

_veh addEventHandler ["Killed",{[_this select 0] spawn A3A_fnc_postmortem}];

if (count _vehCrew == 0) then { //and {("vanilla" in A3A_factionEquipFlags)}
	sleep 10;
	[_veh,false] remoteExec ["enableSimulationGlobal",2];
	_veh addEventHandler ["GetIn", { //ToDo: we should clean up the sim eh after as its a one of thing
		_veh = _this select 0;
		if (!simulationEnabled _veh) then {[_veh,true] remoteExec ["enableSimulationGlobal",2]};
		[_veh] spawn A3A_fnc_VEHdespawner;
	}];
	_veh addEventHandler ["HandleDamage", {
		_veh = _this select 0;
		if (!simulationEnabled _veh) then {[_veh,true] remoteExec ["enableSimulationGlobal",2]};
	}];
};
["civVehInit", [_veh]] call EFUNC(Events,triggerEvent);

// Добавляем SOG-радио, если DLC Vietnam загружен и у техники нет встроенного действия
if (isClass (configFile >> "CfgPatches" >> "music_f_vietnam") && {!(_veh getVariable ["A3U_SOGRadioAdded", false])}) then {
    private _config = configFile >> "CfgVehicles" >> typeOf _veh >> "UserActions" >> "music_player";
    if (!isClass _config) then {
        _veh addAction [
            "Radio Jukebox",
            {
                params ["_target", "_caller", "_actionId", "_arguments"];
                ["open"] call vn_fnc_music;
            },
            [],
            -99,
            false,
            true,
            "",
            "driver _target == _this",
            2
        ];
        _veh setVariable ["A3U_SOGRadioAdded", true];
    };
};

// Добавляем радио A3U для гражданских
if !(_veh getVariable ["A3U_radioAdded", false]) then {
    private _type = "car";
    if (_veh isKindOf "Air") then {
        if (_veh isKindOf "Helicopter") then { _type = "helicopter"; } else { _type = "plane"; };
    };
    if (_veh isKindOf "Ship") then { _type = "car"; };
    [_veh, "sound", _type] call A3U_fnc_addRadioAction;
    _veh setVariable ["A3U_radioAdded", true];
};
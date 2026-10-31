params ["_mode"];

if(_mode == "ADD") then {
    [
        "minefieldMap",
        "onMapSingleClick",
        {
            playSound "readoutClick";
            [minefieldType, _pos] spawn A3A_fnc_mineDialog;
        },
        []
	] call BIS_fnc_addStackedEventHandler;
} else {
    ["minefieldMap", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
};

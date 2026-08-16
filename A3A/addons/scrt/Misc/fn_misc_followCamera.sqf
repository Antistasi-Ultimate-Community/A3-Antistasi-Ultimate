private _vehicle = vehicle player;
private _coords = position _vehicle;

private _camera = "camera" camCreate _coords;
_camera cameraEffect ["INTERNAL","BACK"]; 
_camera camSetTarget vehicle player; 
_camera camCommit 0; 
_camera attachTo [_vehicle, [0,-10,20]];

waitUntil {!isMenuOpen};

_camera cameraEffect ["Terminate", "Back"];
camDestroy _camera;

// Loading of optics addon can be fully suppressed; make sure function exists.
// See CBA addons\optics\XEH_preInit.sqf:7
if !(isNil "CBA_optics_fnc_restartCamera") then {
    [call CBA_fnc_currentUnit, true] call CBA_optics_fnc_restartCamera;
};

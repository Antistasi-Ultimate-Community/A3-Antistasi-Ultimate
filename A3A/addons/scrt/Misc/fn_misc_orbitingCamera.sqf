private _radius = 10;
private _angle = 360;
private _altitude = 50;
private _speed = 0.15;

private _coords = [player, _radius, _angle] call BIS_fnc_relPos;
_coords set [2, _altitude];

private _camera = "camera" camCreate _coords;
_camera cameraEffect ["INTERNAL","BACK"];
_camera camPrepareFOV 0.700;
_camera camPrepareTarget player;
_camera camCommitPrepared 0;

while {isMenuOpen} do {      
    _coords = [player, _radius, _angle] call BIS_fnc_relPos;
    _coords set [2, _altitude];

    _camera camPreparePos _coords;
    _camera camCommitPrepared _speed;

    waitUntil {camCommitted _camera || !(isMenuOpen)};

    _camera camPreparePos _coords;
    _camera camCommitPrepared 0;

    _angle = _angle + 1;
};

_camera cameraEffect ["Terminate", "Back"];
camDestroy _camera;

// Loading of optics addon can be fully suppressed; make sure function exists.
// See CBA addons\optics\XEH_preInit.sqf:7
if !(isNil "CBA_optics_fnc_restartCamera") then {
    [call CBA_fnc_currentUnit, true] call CBA_optics_fnc_restartCamera;
};

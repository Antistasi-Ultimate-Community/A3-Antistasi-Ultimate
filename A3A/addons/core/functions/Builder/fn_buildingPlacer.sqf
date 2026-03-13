/*
Author: [Killerswin2, Hakon (Stole his bb code)]
    team leader structured placer. Allows teamleaders to gain access to a
    rts like camera to place objects.
Arguments:
1. <object> object that will center placement
2. <number> number that is used for the radius of placement
Return Value:
NONE
Scope: Client
Environment: Unscheduled
Public:
no
Example:
[player, 100] call A3A_fnc_buildingPlacer.sqf
*/

#if __A3_DEBUG__
    #define __SHOW_OBJECT_ALIGN_HELPERS__ true
#else
    #define __SHOW_OBJECT_ALIGN_HELPERS__ false
#endif

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

#include "\a3\ui_f\hpp\definedikcodes.inc"
#include "placerDefines.hpp"
#include "\x\A3A\addons\GUI\dialogues\ids.inc"
#define EVENT_TYPE_ACTIVATE QUOTE(Activate)
#define EVENT_TYPE_DEACTIVATE QUOTE(Deactivate)
#define EVENT_TYPE_ANALOG QUOTE(Analog)

params [
    ["_centerObject", player, [objNull]],
    ["_buildingRadius", 20, [0]],
    ["_teamLeaderBox", objNull, [objNull]]
];

// Already in the placer
if(!isNil "A3A_building_EHDB") exitwith {};

[_centerObject, _buildingRadius, _teamLeaderBox] call A3A_fnc_initPlacerDB;
[_centerObject, _buildingRadius] spawn A3A_fnc_initBuilderCollisionHelper;

("A3A_PlacerHint" call BIS_fnc_rscLayer) cutRsc ["A3A_PlacerHints", "PLAIN", -1, false];
A3A_cam = "camcurator" camCreate (position _centerObject vectorAdd [0,0,5]);
A3A_cam cameraEffect ["Internal", "top"];
player enableSimulation false;

A3A_boundingCircle = [];
for "_i" from 1 to 36 do {
    private _posStart = [_buildingRadius * (cos(10*_i)), _buildingRadius * (sin(10*_i)),0] vectorAdd getPos _centerObject;
    private _piece = "Sign_Sphere100cm_F" createVehicleLocal _posStart;
    _piece enableSimulation false;
    A3A_boundingCircle pushBack _piece;
};

private _emptyDisplay = findDisplay 46 createDisplay "A3A_teamLeaderBuilder";
A3A_building_EHDB set [BUILD_DISPLAY, _emptyDisplay];
call (A3A_building_EHDB get UPDATE_BB);

private _userActions = [
    [
        QGVAR(buildingPlacerAbort),
        EVENT_TYPE_DEACTIVATE,
        {
            [] call (A3A_building_EHDB get END_BUILD_FUNC);
        }
    ],
    [
        QGVAR(buildingPlacerAlign),
        EVENT_TYPE_DEACTIVATE,
        {
            private _source = (A3A_building_EHDB get CURSOR_OBJECT);
            private _object = (A3A_building_EHDB get BUILD_OBJECT_TEMP_OBJECT);

            if (isNull _source || isNull _object) exitWith {};

            private _direction = getDir _source;

            A3A_building_EHDB set [BUILD_OBJECT_TEMP_DIR, _direction];
            _object setDir _direction;

            systemChat format["Aligned object to %1 (%2°)", getText(configOf _source >> "displayName"), _direction];
        }
    ],
    [
        QGVAR(buildingPlacerDelete),
        EVENT_TYPE_DEACTIVATE,
        {
            private _tempArray = (A3A_building_EHDB get BUILD_OBJECT_TEMP_OBJECT_ARRAY);
            private _buildArray = (A3A_building_EHDB get BUILD_OBJECTS_ARRAY);
            private _objIndex = _tempArray find (A3A_building_EHDB get CURSOR_OBJECT);
            if (_objIndex == -1) exitWith {};

            attachedObjects (_tempArray # _objIndex) apply {
                detach _x;
                deleteVehicle _x;
            };

            deleteVehicle (_tempArray deleteAt _objIndex);
            private _buildData = _buildArray deleteAt _objIndex;
            private _supply = (A3A_building_EHDB get AVAILABLE_MONEY);
            A3A_building_EHDB set [AVAILABLE_MONEY, _supply + (_buildData#4)];
            ["updateMoney"] call A3A_fnc_teamLeaderRTSPlacerDialog;
        }
    ],
    [
        QGVAR(buildingPlacerPlace),
        EVENT_TYPE_DEACTIVATE,
        {
            if (A3A_builderLimit isNotEqualTo -1 && {count (A3A_buildingsToSave) >= A3A_builderLimit}) exitWith {
                ["Build Placer", format["There are too many builds. %1/%2", (count A3A_buildingsToSave), A3A_builderLimit]] call A3A_fnc_customHint;
            };

            private _tempObject = (A3A_building_EHDB get BUILD_OBJECT_TEMP_OBJECT);
            if (isObjectHidden _tempObject) exitWith {};
            if ((A3A_building_EHDB get BUILD_OBJECT_SELECTED_STRING) isEqualTo "Land_Can_V2_F") exitWith {};	// temp objects not built.

            if (_tempObject distance (A3A_building_EHDB get BUILD_RADIUS_OBJECT_CENTER) > (A3A_building_EHDB get BUILD_RADIUS)) exitWith {};
            //if (isOnRoad getPosATL _tempObject) exitwith {};	// can't build on roads

            private _price = (A3A_building_EHDB get OBJECT_PRICE);
            private _supply = (A3A_building_EHDB get AVAILABLE_MONEY);

            // TODO: Hints don't work here, just hope players are watching the numbers for now
            if (_price > _supply) exitWith {};

            A3A_building_EHDB set [AVAILABLE_MONEY, _supply - _price];
            ["updateMoney"] call A3A_fnc_teamLeaderRTSPlacerDialog;

            private _position = getPosWorld _tempObject;
            private _dirAndUp = [vectorDir _tempObject, vectorUp _tempObject];

            private _vehicle = typeof _tempObject createVehicleLocal [0,0,0];
            _vehicle enableSimulation false;
            _vehicle setPosWorld _position;
            _vehicle setVectorDirAndUp _dirAndUp;
            //playSound3D[getMissionPath "Sounds\hammer.ogg", player];

            (A3A_building_EHDB get BUILD_OBJECT_TEMP_OBJECT_ARRAY) pushBack _vehicle;
            (A3A_building_EHDB get BUILD_OBJECTS_ARRAY) pushBack [typeof _vehicle, objNull, _position, _dirAndUp, _price];

            _tempObject hideObject true;		// prevent unintentional double-builds
        }
    ],
    [
        QGVAR(buildingPlacerRepair),
        EVENT_TYPE_DEACTIVATE,
        {
            private _ruin = (A3A_building_EHDB get CURSOR_OBJECT);
            if !(_ruin isKindOf "Ruins") exitWith {};
            private _building = _ruin getVariable "building";
            if (isNil "_building") then { _building = _ruin getVariable "BIS_fnc_createRuin_object" };
            if (isNil "_building") exitWith {};																	// non-rebuildable ruin
            if (-1 != (A3A_building_EHDB get BUILD_OBJECTS_ARRAY) findIf { _x#1 == _building }) exitWith {};		// already rebuilt

            // Calculate repair cost from bounding box
            private _bbsize = (boundingBoxReal _building # 1) vectorDiff (boundingBoxReal _building # 0);
            private _price = 6 * sqrt((_bbsize#0) * (_bbsize#1) * (_bbsize#2));
            _price = 10 * round (_price / 10);

            // TODO: Sort out hints or something?
            private _supply = (A3A_building_EHDB get AVAILABLE_MONEY);
            if(_price > _supply) exitWith {};
            A3A_building_EHDB set [AVAILABLE_MONEY, _supply - _price];
            ["updateMoney"] call A3A_fnc_teamLeaderRTSPlacerDialog;

            // Place imitation of repaired building
            private _oldPos = getPosATL _building;
            private _vehicle = typeof _building createVehicleLocal [0,0,0];
            _vehicle enableSimulation false;
            _vehicle setDir getDir _building;
            _vehicle setPosATL [_oldPos#0, _oldPos#1, 0];

            (A3A_building_EHDB get BUILD_OBJECTS_ARRAY) pushBack [typeof _vehicle, _building, nil, nil, _price];
            (A3A_building_EHDB get BUILD_OBJECT_TEMP_OBJECT_ARRAY) pushBack _vehicle;
        }
    ],
    [
        QGVAR(buildingPlacerRotateCCW),
        EVENT_TYPE_ACTIVATE,
        {
            A3A_building_EHDB set [ROTATION_MODE_CCW, true];
        }
    ],
    [
        QGVAR(buildingPlacerRotateCCW),
        EVENT_TYPE_DEACTIVATE,
        {
            A3A_building_EHDB set [ROTATION_MODE_CCW, false];
        }
    ],
    [
        QGVAR(buildingPlacerRotateCW),
        EVENT_TYPE_ACTIVATE,
        {
            A3A_building_EHDB set [ROTATION_MODE_CW, true];
        }
    ],
    [
        QGVAR(buildingPlacerRotateCW),
        EVENT_TYPE_DEACTIVATE,
        {
            A3A_building_EHDB set [ROTATION_MODE_CW, false];
        }
    ],
    [
        QGVAR(buildingPlacerRotateStepDecrease),
        EVENT_TYPE_DEACTIVATE,
        {
            [-1] call (A3A_building_EHDB get ROTATION_STEP_FUNC);
        }
    ],
    [
        QGVAR(buildingPlacerRotateStepIncrease),
        EVENT_TYPE_DEACTIVATE,
        {
            [1] call (A3A_building_EHDB get ROTATION_STEP_FUNC);
        }
    ],
    [
        QGVAR(buildingPlacerSnapToSurface),
        EVENT_TYPE_DEACTIVATE,
        {
            A3A_building_EHDB set [SNAP_SURFACE_MODE, !(A3A_building_EHDB get SNAP_SURFACE_MODE)];

            // change the text color to tell that you have entered the mode
            private _display = uiNamespace getVariable "A3A_placerHint_display";
            private _altText = (_display displayCtrl IDC_PLACERHINT_ALT_TEXT);

            _altText ctrlSetTextColor ([[1, 1, 1, 1], [1, 0, 0, 1]] select (A3A_building_EHDB get SNAP_SURFACE_MODE));
        }
    ],
    [
        QGVAR(buildingPlacerUnsafeMode),
        EVENT_TYPE_DEACTIVATE,
        {
            A3A_building_EHDB set [UNSAFE_MODE, !(A3A_building_EHDB get UNSAFE_MODE)];

            // change the text color to tell that you have entered the mode
            private _display = uiNamespace getVariable "A3A_placerHint_display";
            private _shiftText = (_display displayCtrl IDC_PLACERHINT_SHIFT_TEXT);

            _shiftText ctrlSetTextColor ([[1, 1, 1, 1], [1, 0, 0, 1]] select (A3A_building_EHDB get UNSAFE_MODE));
        }
    ],
    [
        QGVAR(buildingPlacerZOffsetDecrease),
        EVENT_TYPE_ACTIVATE,
        {
            A3A_building_EHDB set [Z_OFFSET_MODE_DECREASE, true];
        }
    ],
    [
        QGVAR(buildingPlacerZOffsetDecrease),
        EVENT_TYPE_DEACTIVATE,
        {
            A3A_building_EHDB set [Z_OFFSET_MODE_DECREASE, false];
        }
    ],
    [
        QGVAR(buildingPlacerZOffsetIncrease),
        EVENT_TYPE_ACTIVATE,
        {
            A3A_building_EHDB set [Z_OFFSET_MODE_INCREASE, true];
        }
    ],
    [
        QGVAR(buildingPlacerZOffsetIncrease),
        EVENT_TYPE_DEACTIVATE,
        {
            A3A_building_EHDB set [Z_OFFSET_MODE_INCREASE, false];
        }
    ],
    [
        QGVAR(buildingPlacerZStepDecrease),
        EVENT_TYPE_DEACTIVATE,
        {
            [-1] call (A3A_building_EHDB get Z_OFFSET_STEP_FUNC);
        }
    ],
    [
        QGVAR(buildingPlacerZStepIncrease),
        EVENT_TYPE_DEACTIVATE,
        {
            [1] call (A3A_building_EHDB get Z_OFFSET_STEP_FUNC);
        }
    ]
];

A3A_building_EHDB set[USER_ACTION_EHS, _userActions apply {
    _x params["_actionName", "_eventType", "_callback"];

    [_actionName, _eventType, addUserActionEventHandler[_actionName, _eventType, _callback]];
}];

private _showObjectAlignHelpers = __SHOW_OBJECT_ALIGN_HELPERS__ ||
    // Set this in console to force showing building place helpers
    { missionNamespace getVariable[QGVAR(debugBuildingPlacerHelpers), false] };

GVAR(fncObjectAlignHelpers) = if !(_showObjectAlignHelpers) then {
    {};
} else {
    {
        params["_vehiclePos","_vehicleVectorUp"];
        private _lineLength = 4;
        private _perpendicularPlaneOffset = [0,0,3];

        // *** Surface normal vector (yellow) ***
        drawLine3D[_vehiclePos vectorAdd _perpendicularPlaneOffset, _vehiclePos vectorAdd (_vehicleVectorUp vectorMultiply 5) vectorAdd _perpendicularPlaneOffset, [1,1,0,1], 8];

        // *** Surface intersection debug lines (green) ***
        drawLine3D[_vehiclePos vectorAdd ([1,1,0] vectorMultiply _lineLength), _vehiclePos vectorAdd ([-1,-1,0] vectorMultiply _lineLength), [0,1,0,1], 8];
        drawLine3D[_vehiclePos vectorAdd ([-1,1,0] vectorMultiply _lineLength), _vehiclePos vectorAdd ([1,-1,0] vectorMultiply _lineLength), [0,1,0,1], 8];

        // *** Surface intersection without normal translation, 1m above intersection point (cyan) ***
        drawLine3D[_vehiclePos vectorAdd ([1,1,1] vectorMultiply _lineLength), _vehiclePos vectorAdd ([-1,-1,1] vectorMultiply _lineLength), [0,1,1,1], 8];
        drawLine3D[_vehiclePos vectorAdd ([-1,1,1] vectorMultiply _lineLength), _vehiclePos vectorAdd ([1,-1,1] vectorMultiply _lineLength), [0,1,1,1], 8];

        // *** Lines perpendicular to surface (blue) ***
        // Convert Lines to Direction Vectors
        private _L1 = [[-1,0,0] vectorMultiply _lineLength, [1,0,0] vectorMultiply _lineLength];
        private _L2 = [[0,-1,0] vectorMultiply _lineLength, [0,1,0] vectorMultiply _lineLength];
        private _D1 = vectorNormalized((_L1 select 1) vectorAdd ((_L1 select 0) vectorMultiply -1));
        private _D2 = vectorNormalized((_L2 select 1) vectorAdd ((_L2 select 0) vectorMultiply -1));
        private _Zt = vectorNormalized _vehicleVectorUp;
        // Build Target Orthonormal Basis
        private _temp = [[0,1,0], [1,0,0]] select(abs(_Zt select 0) < 0.9);
        private _Xt = vectorNormalized(_Zt vectorCrossProduct _temp);
        private _Yt = _Zt vectorCrossProduct _Xt;
        // ^ Target frame: (Xt, Yt, Zt)

        // Build Source Orthonormal Basis from the X Shape
        private _Xs = _D1;
        private _Zs = vectorNormalized(_D1 vectorCrossProduct _D2);
        private _Ys = _Zs vectorCrossProduct _Xs;
        // ^ Source frame: (Xs, Ys, Zs)

        // Compute Rotation Matrix from Source to Target
        private _Ms = [_Xs, _Ys, _Zs];
        private _Mt = [_Xt, _Yt, _Zt];
        private _R = _Mt matrixMultiply matrixTranspose _Ms;

        private _L1r = [_R matrixMultiply [_L1 select 0], _R matrixMultiply [_L1 select 1]];
        private _L2r = [_R matrixMultiply [_L2 select 0], _R matrixMultiply [_L2 select 1]];

        private _L1A_r = _vehiclePos vectorAdd _perpendicularPlaneOffset vectorAdd flatten(_R matrixMultiply [[_L1 select 0 select 0], [_L1 select 0 select 1], [_L1 select 0 select 2]]);
        private _L1B_r = _vehiclePos vectorAdd _perpendicularPlaneOffset vectorAdd flatten(_R matrixMultiply [[_L1 select 1 select 0], [_L1 select 1 select 1], [_L1 select 1 select 2]]);
        private _L2A_r = _vehiclePos vectorAdd _perpendicularPlaneOffset vectorAdd flatten(_R matrixMultiply [[_L2 select 0 select 0], [_L2 select 0 select 1], [_L2 select 0 select 2]]);
        private _L2B_r = _vehiclePos vectorAdd _perpendicularPlaneOffset vectorAdd flatten(_R matrixMultiply [[_L2 select 1 select 0], [_L2 select 1 select 1], [_L2 select 1 select 2]]);

        drawLine3D[_L1A_r, _L1B_r, [0,0,1,1], 8];
        drawLine3D[_L2A_r, _L2B_r, [0,0,1,1], 8];

        // Vertical line (red)
        drawLine3D[
            [_vehiclePos select 0, _vehiclePos select 1, 100],
            [_vehiclePos select 0, _vehiclePos select 1, 0],
            [1,0,0,1],
            8
        ];
    };
};

private _eventHanderEachFrame = addMissionEventHandler ["EachFrame", {
    private _stateChange = false;
    private _object = (A3A_building_EHDB get BUILD_OBJECT_TEMP_OBJECT);
    private _vehiclePos = screenToWorld getMousePosition;
    private["_vehicleVectorUp"];

    //change in position
    if (_object distance2d _vehiclePos > 0.1) then {
        _stateChange = true;
    };

    // Set up context-sensitive hints (cancel, repair)
    private _intersects = lineIntersectsSurfaces [getPosASL A3A_cam, AGLtoASL _vehiclePos, _object, A3A_cam];
    private _intersectObj = if (count _intersects > 0) then { _intersects#0#3 } else { objNull };
    A3A_building_EHDB set [CURSOR_OBJECT, _intersectObj];
    ["setContextKey", [""]] call A3A_fnc_setupPlacerHints;

    //((uiNamespace getVariable "A3A_placerHint_display") displayCtrl IDC_PLACERHINT_TEST_TEXT) ctrlSetText str _intersectObj;

    if (_intersectObj isKindOf "Ruins") then {
        // Show T key and rebuild cost
        private _ruin = _intersectObj;
        private _building = _ruin getVariable "building";
        if (isNil "_building") exitWith {};																	// non-rebuildable ruin
        if (_building in antennasDead) exitWith {};                                                         // don't use this for radio towers
        if (-1 != (A3A_building_EHDB get BUILD_OBJECTS_ARRAY) findIf { _x#1 == _building }) exitWith {};		// already rebuilt

        // Calculate repair cost from bounding box
        private _bbsize = (boundingBoxReal _building # 1) vectorDiff (boundingBoxReal _building # 0);
        private _price = 6 * sqrt((_bbsize#0) * (_bbsize#1) * (_bbsize#2));
        _price = 10 * round (_price / 10);
        ["setContextKey", ["rebuild", _price]] call A3A_fnc_setupPlacerHints;
    };

    if (_intersectObj in (A3A_building_EHDB get BUILD_OBJECT_TEMP_OBJECT_ARRAY)) then {
        // show C key
        ["setContextKey", ["cancel", getText (configof _intersectObj >> "displayName")]] call A3A_fnc_setupPlacerHints;
    };

    if ((A3A_building_EHDB get ROTATION_MODE_CW) || { A3A_building_EHDB get ROTATION_MODE_CCW }) then {
        private _multiplier = [-1, 1] select (A3A_building_EHDB get ROTATION_MODE_CW);
        private _delta = if ((A3A_building_EHDB get ROTATION_STEP) isEqualType false) then {
            diag_deltaTime * 120
        } else {
            // with rotation stepping, only rotate once per frame then wait for the next key press
            A3A_building_EHDB set[ROTATION_MODE_CCW, false];
            A3A_building_EHDB set[ROTATION_MODE_CW, false];

            (A3A_building_EHDB get ROTATION_STEP)
        };

        private _direction = (A3A_building_EHDB get BUILD_OBJECT_TEMP_DIR) + _multiplier * _delta;
        A3A_building_EHDB set [BUILD_OBJECT_TEMP_DIR, _direction];

        _stateChange = true;
    };

    if ((A3A_building_EHDB get Z_OFFSET_MODE_DECREASE) || { A3A_building_EHDB get Z_OFFSET_MODE_INCREASE }) then {
        private _multiplier = [-1, 1] select (A3A_building_EHDB get Z_OFFSET_MODE_INCREASE);
        private _delta = diag_deltaTime * (A3A_building_EHDB get Z_OFFSET_STEP);
        private _offset = A3A_building_EHDB get Z_OFFSET_VALUE;
        _offset = _offset + _multiplier * _delta;
        A3A_building_EHDB set [Z_OFFSET_VALUE, _offset];

        _stateChange = true;
    };

    if (A3A_building_EHDB get SNAP_SURFACE_MODE) then {
        private _posASL = AGLtoASL _vehiclePos;
        private _intersects = lineIntersectsSurfaces [_posASL vectorAdd [0,0,100], _posASL vectorAdd [0,0,-100], _object, objNull, true, 1, "GEOM"];

        if (count _intersects > 0) then {
            _vehiclePos = ASLtoAGL (_intersects select 0 select 0);
            _vehicleVectorUp = _intersects select 0 select 1;

            [_vehiclePos, _vehicleVectorUp] call GVAR(fncObjectAlignHelpers);

            _stateChange = true;
        };
    };


    // Camera clamping
    private _centerPos = getPosATL (A3A_building_EHDB get BUILD_RADIUS_OBJECT_CENTER);
    private _cameraPos = getPosATL A3A_cam;
    private _buildRad = A3A_building_EHDB get BUILD_RADIUS;

    private _camClampPos = [0,0,0];
    _camClampPos set [0, _cameraPos#0 max (_centerPos#0 - _buildRad) min (_centerPos#0 + _buildRad)];
    _camClampPos set [1, _cameraPos#1 max (_centerPos#1 - _buildRad) min (_centerPos#1 + _buildRad)];

    // make the clamp a sphere instead of a weird rectangle
    _camClampPos set [2, _cameraPos#2 max (_centerPos#2 + 5) min (_centerPos#2 + _buildRad)];
    A3A_cam setPosATL _camClampPos;


    // Object render state update
    if (!_stateChange) exitWith {};

    _object setPosATL(_vehiclePos vectorAdd [0, 0, A3A_building_EHDB get Z_OFFSET_VALUE]);
    _object setDir(A3A_building_EHDB get BUILD_OBJECT_TEMP_DIR);

    private _normal = switch true do {
        case !(isNil "_vehicleVectorUp"): {
            _vehicleVectorUp;
        };
        case isArray(configOf _object >> QGVAR(buildingPlacerVectorUp)): {
            getArray(configOf _object >> QGVAR(buildingPlacerVectorUp));
        };
        default {
            // Conform for terrain surface normal in vicinity. Kinda works
            private _normTotal = surfaceNormal _vehiclePos;
            {
                _normTotal = _normTotal vectorAdd (surfaceNormal (_vehiclePos vectorAdd _x));
            } forEach [[-2,0], [2,0], [0,-2], [0,2]];
            vectorNormalized _normTotal;
        };
    };

    _object setVectorUp _normal;

    private _hide = call {
        if (_object distance (A3A_building_EHDB get BUILD_RADIUS_OBJECT_CENTER) > (A3A_building_EHDB get BUILD_RADIUS)) exitWith {true};
        if (surfaceIsWater _vehiclePos) exitWith {true};
        if (A3A_building_EHDB get UNSAFE_MODE) exitWith {false};
        if (A3A_building_EHDB get SNAP_SURFACE_MODE) exitWith {false};				// implies unsafe anyway

        // collison check, god arma what I would give for collison trigers (looking at you unity, BGE had them and it was made by 20ish guys)
        if (isNil "A3A_buildingRays") then { call (A3A_building_EHDB get UPDATE_BB) };

        -1 != A3A_buildingRays findIf {
            _x params ["_start", "_end"];
            lineIntersects [_object modelToWorldVisualWorld _start, _object modelToWorldVisualWorld _end, _object];
        };
    };
    _object hideObject _hide;

}];

A3A_building_EHDB set [EACH_FRAME_EH, _eventHanderEachFrame];

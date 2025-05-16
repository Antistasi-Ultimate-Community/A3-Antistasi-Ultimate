#include "placerDefines.hpp"

/*
Author: [Killerswin2]
	DataBase constructor. Creates the placement database for the rts placer
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
[player, 100] call A3A_fnc_initBuildingDB
*/



params [
	["_buildCenter", player, [objNull]],
	["_buildRadius", 20,[0]],
	["_teamLeaderBox", objNull, [objNull]]
];


A3A_building_EHDB = [
	// SPACE_PRESSED (unused)
	false,
	// ROTATION_MODE_CW
	false,
	// ROTATION_MODE_CCW
	false,
	// GUI_BUTTON_PRESSED
	false,
	// UNSAFE_MODE
	false,
	// BUILD_OBJECTS_ARRAY
	[],
	// BUILD_OBJECT_SELECTED_STRING
	"Land_Can_V2_F",
	// BUILD_OBJECT_TEMP_OBJECT
	"Land_Can_V2_F" createVehicleLocal [0,0,0],
	// BUILD_OBJECT_TEMP_OBJECT_ARRAY
	[],
	// END_BUILD_FUNC
	{
		// Finished so release
		private _remMoney = (A3A_building_EHDB # AVAILABLE_MONEY);
		[A3A_building_EHDB # TEAMLEADER_BOX, player, false, _remMoney] remoteExecCall ["A3A_fnc_lockBuilderBox", 2];
		{deleteVehicle _x} forEach A3A_boundingCircle;
		{deleteVehicle _x} forEach (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT_ARRAY);
		{
			_x params["_actionName", "_eventType", "_ehID"];
			removeUserActionEventHandler[_actioName, _eventType, _ehID];
		} forEach (A3A_building_EHDB # USER_ACTION_EHS);
		removeMissionEventHandler ["EachFrame", (A3A_building_EHDB # EACH_FRAME_EH)];
		(A3A_building_EHDB # BUILD_DISPLAY) closeDisplay 1;
		A3A_cam cameraEffect ["terminate", "back"];
		camDestroy A3A_cam;
		deleteVehicle (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT);
		("A3A_PlacerHint" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
		private _params = (A3A_building_EHDB # BUILD_OBJECTS_ARRAY);
		A3A_buildingRays = nil;
		A3A_building_EHDB = nil;
		player enableSimulation true;
		[_params] remoteExecCall ["A3A_fnc_placeBuilderObjects", 2];
	},
	// BUILD_DISPLAY
	-1,
	// USER_ACTION_EHS
	[],
	// KEY_UP_EH (unused)
	-1,
	// EACH_FRAME_EH
	-1,
	// UPDATE_BB
	{
		private _bb = (0 boundingBoxReal (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT));
		private _back = (_bb#0#1);
		private _front = (_bb#1#1);
		private _top = (_bb#1#2);
		private _left = (_bb#0#0);
		private _right = (_bb#1#0);
		private _bottom = (_bb#0#2) + 0.2;//rais slightly from the ground
		private _knee = _bottom + 0.5;
		A3A_buildingRays = [
		//outer box
			[[_left,_back,_bottom], [_right,_back,_top]]			//back cross
			,[[_left,_back,_top], [_right,_back,_bottom]]

			,[[_left,_front,_bottom], [_right,_front,_top]]		 //front cross
			,[[_left,_front,_top], [_right,_front,_bottom]]

			,[[_left,_back,_bottom], [_left,_front,_top]]		   //left cross
			,[[_left,_back,_top], [_left,_front,_bottom]]

			,[[_right,_back,_bottom], [_right,_front,_top]]		 //right cross
			,[[_right,_back,_top], [_right,_front,_bottom]]

			,[[_left,_back,_top], [_right,_front,_top]]			 //top cross
			,[[_right,_back,_top], [_left,_front,_top]]

			,[[_left,_back,_bottom], [_right,_front,_bottom]]	   //bottom cross
			,[[_right,_back,_bottom], [_left,_front,_bottom]]

			,[[_left,_back,_bottom], [_left,_back,_top]]			//back left vertical
			,[[_left,_front,_bottom], [_left,_front,_top]]		  //front left vertical
			,[[_right,_back,_bottom], [_right,_back,_top]]		  //back right vertical
			,[[_right,_front,_bottom], [_right,_front,_top]]		//front right vertical

			,[[_left,_back,_bottom], [_left,_front,_bottom]]		//left bottom horisontal
			,[[_left,_back,_top], [_left,_front,_top]]			  //left top horisontal

			,[[_right,_back,_bottom], [_right,_front,_bottom]]	  //right bottom horisontal
			,[[_right,_back,_top], [_right,_front,_top]]			//right top horisontal

			,[[_left,_front,_bottom], [_right,_front,_bottom]]	  //front bottom horisontal
			,[[_left,_front,_top], [_right,_front,_top]]			//front top horisontal

			,[[_left,_back,_bottom], [_right,_back,_bottom]]		//back bottom horisontal
			,[[_left,_back,_top], [_right,_back,_top]]			  //back top horisontal

			//inner lines
			,[[_left,_back,_bottom], [_right,_front,_top]]		  //diag 1
			,[[_left,_back,_top], [_right,_front,_bottom]]

			,[[_right,_back,_bottom], [_left,_front,_top]]		  //diag 2
			,[[_right,_back,_top], [_left,_front,_bottom]]

			,[[_left,_back,0], [_right,_front,0]]				   //diag 3
			,[[_right,_back,0], [_left,_front,0]]

			,[[_left,0,0], [_right,0,0]]							//center
			,[[0,_back,0], [0,_front,0]]
			,[[0,0,_bottom], [0,0,_top]]

			,[[_left,_back,_knee], [_right,_front,_knee]]		   //knee check
			,[[_right,_back,_knee], [_left,_front,_knee]]
			,[[0,_back,_knee], [0,_front,_knee]]
			,[[_left,0,_knee], [_right,0,_knee]]
			,[[_left,_back,_knee], [_left,_front,_knee]]
			,[[_left,_front,_knee], [_right,_front,_knee]]
			,[[_right,_front,_knee], [_right,_back,_knee]]
			,[[_right,_back,_knee], [_left,_back,_knee]]
		];
	},
	// BUILD_RADIUS_OBJECT_CENTER
	_buildCenter,
	// BUILD_RADIUS
	_buildRadius,
	// HOLD_TIME (unused)
	15,
	// OBJECT_PRICE
	0,
	// BUILD_OBJECT_TEMP_DIR
	0,
	// TEAMLEADER_BOX
	_teamLeaderBox,
	// ELEVATION_MODE_UP (unused)
	false,
	// ELEVATION_MODE_DOWN (unused)
	false,
	// SNAP_SURFACE_MODE
	false,
	// AVAILABLE_MONEY
	_teamLeaderBox getVariable ["A3A_build_money", 0],
	// CURSOR_OBJECT
	objNull
];
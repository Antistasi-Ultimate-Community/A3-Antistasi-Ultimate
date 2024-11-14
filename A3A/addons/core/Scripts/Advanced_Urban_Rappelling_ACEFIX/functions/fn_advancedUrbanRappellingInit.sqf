/*
The MIT License (MIT)

Copyright (c) 2016 Seth Duda

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/
#include "..\..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {};

private _platformData = productVersion;
private _platform = _platformData select 6;
if(_platform == "Linux") exitWith {};

AUR_Advanced_Urban_Rappelling_Install = {

// Prevent advanced urban rappelling from installing twice
if(!isNil "AUR_RAPPELLING_INIT") exitWith {};
scriptName "fn_advancedUrbanRappellingInit.sqf";
private _fileName = "fn_advancedUrbanRappellingInit.sqf";
AUR_RAPPELLING_INIT = true;

diag_log "Advanced Urban Rappelling Loading...";

AUR_Has_Addon_Animations_Installed = {
	(count getText ( configFile / "CfgMovesBasic" / "ManActions" / "AUR_01" )) > 0;
};

AUR_Has_Addon_Sounds_Installed = {
	private ["_config","_configMission"];
	_config = getArray ( configFile / "CfgSounds" / "AUR_Rappel_Start" / "sound" );
	_configMission = getArray ( missionConfigFile / "CfgSounds" / "AUR_Rappel_Start" / "sound" );
	(count _config > 0 || count _configMission > 0);
};

AUR_Play_Rappelling_Sounds_Global = {
	_this remoteExec ["AUR_Play_Rappelling_Sounds", 0];
};

AUR_Play_Rappelling_Sounds = {
	params ["_player","_rappelDevice","_rappelAncor"];
	if(!hasInterface || !(call AUR_Has_Addon_Sounds_Installed) ) exitWith {};
	if(player distance _player < 15) then {
		[_player, "AUR_Rappel_Start"] call AUR_Play_3D_Sound;
		[_rappelDevice, "AUR_Rappel_Loop"] call AUR_Play_3D_Sound;
	};
	_this spawn {
		params ["_player","_rappelDevice","_rappelAncor"];
		private ["_lastDistanceFromAnchor","_distanceFromAnchor"];
		_lastDistanceFromAnchor = _rappelDevice distance _rappelAncor;
		while {_player getVariable ["AUR_Is_Rappelling",false]} do {
			_distanceFromAnchor = _rappelDevice distance _rappelAncor;
			if(_distanceFromAnchor > _lastDistanceFromAnchor + 0.1 && player distance _player < 15) then {
				[_player, "AUR_Rappel_Loop"] call AUR_Play_3D_Sound;
				sleep 0.2;
				[_rappelDevice, "AUR_Rappel_Loop"] call AUR_Play_3D_Sound;
			};
			sleep 0.9;
			_lastDistanceFromAnchor = _distanceFromAnchor;
		};
	};
	_this spawn {
		params ["_player"];
		while {_player getVariable ["AUR_Is_Rappelling",false]} do {
			sleep 0.1;
		};
		if(player distance _player < 15) then {
			[_player, "AUR_Rappel_End"] call AUR_Play_3D_Sound;
		};
	};
};

AUR_Play_3D_Sound = {
	params ["_soundSource","_className"];
	private ["_config","_configMission"];
	_config = getArray ( configFile / "CfgSounds" / _className / "sound" );
	if(count _config > 0) exitWith {
		_soundSource say3D  _className;
	};
	_configMission = getArray ( missionConfigFile / "CfgSounds" / _className / "sound" );
	if(count _configMission > 0) exitWith {
		_soundSource say3D  _className;
	};
};

/*
	Description:
	Finds the nearest rappel point within 1.5m of the specified player.
	
	Parameter(s):
	_this select 0: OBJECT - The rappelling unit
	_this select 1: STRING - Search type - "FAST_EXISTS_CHECK" or "POSITION". If FAST_EXISTS_CHECK, this function
		does a quicker search for rappel points and return 1 if a possible rappel point is found, otherwise 0.
		If POSITION, the function will return the rappel position and direction in an array, or empty array if
		no position is found.
		
	Returns: 
	Number or Array (see above)
*/
AUR_Find_Nearby_Rappel_Point = {
	params ["_player",["_searchType","FAST_EXISTS_CHECK"]];
	
	private ["_playerPosition","_intersectionRadius","_intersectionDistance","_intersectionTests","_lastIntersectStartASL","_lastIntersectionIntersected","_edges"];
	private ["_edge","_x","_y","_directionUnitVector","_intersectStartASL","_intersectEndASL","_surfaces"];
	
	_playerPosition = getPosASL _player;
	_intersectionRadius = 1.5;
	_intersectionDistance = 4;
	_intersectionTests = 40;
	
	if(_searchType == "FAST_EXISTS_CHECK") then {
		_intersectionTests = 8;
	};
	
	_lastIntersectStartASL = [];
	_lastIntersectionIntersected = false;
	_edges = [];
	_edge = [];
	
	_fastExistsEdgeFound = false;
	
	// Search for nearby edges
	
	for "_i" from 0 to _intersectionTests do
	{
		_x = cos ((360/_intersectionTests)*_i);
		_y = sin ((360/_intersectionTests)*_i);
		_directionUnitVector = vectorNormalized [_x, _y, 0];
		_intersectStartASL = _playerPosition vectorAdd ( _directionUnitVector vectorMultiply _intersectionRadius )  vectorAdd [0,0,1.5];
		_intersectEndASL = _intersectStartASL vectorAdd [0,0,-5];
		_surfaces = lineIntersectsSurfaces [_intersectStartASL, _intersectEndASL, _player, objNull, true, 1];
		if(_searchType == "FAST_EXISTS_CHECK") then {
			if(count _surfaces == 0) exitWith { _fastExistsEdgeFound = true; };
		} else {
			if(count _surfaces > 0) then {
				if(!_lastIntersectionIntersected && _i != 0) then {
					// Moved from edge to no edge (edge end)
					_edge pushBack _lastIntersectStartASL;
					_edges pushBack _edge;
				};
				_lastIntersectionIntersected = true;
			} else {
				if(_lastIntersectionIntersected && _i != 0) then {
					// Moved from no edge to edge (edge start)
					_edge = [_intersectStartASL];
					if(_i == _intersectionTests) then {
						_edges pushBack _edge;
					};
				};
				_lastIntersectionIntersected = false;
			};
			_lastIntersectStartASL = _intersectStartASL;
		};
	};
	
	if(_searchType == "FAST_EXISTS_CHECK") exitWith { _fastExistsEdgeFound; };
	
	// If edges found, return nearest edge
	
	private ["_firstEdge","_largestEdgeDistance","_largestEdge","_edgeDistance","_edgeStart","_edgeEnd","_edgeMiddle","_edgeDirection"];
	
	if(count _edge == 1) then {
		_firstEdge = _edges deleteAt 0;
		_edges deleteAt (count _edges - 1);
		_edges pushBack (_edge+_firstEdge);
	};
	
	_largestEdgeDistance = 0;
	_largestEdge = [];
	{
		_edgeDistance = (_x select 0) distance (_x select 1);
		if(_edgeDistance > _largestEdgeDistance) then {
			_largestEdgeDistance = _edgeDistance;
			_largestEdge = _x;
		};
	} forEach _edges;
	
	if(count _largestEdge > 0) then {
		_edgeStart = (_largestEdge select 0);
		_edgeStart set [2,getPosASL _player select 2];
		_edgeEnd = (_largestEdge select 1);
		_edgeEnd set [2,getPosASL _player select 2];
		_edgeMiddle = _edgeStart vectorAdd (( _edgeEnd vectorDiff _edgeStart ) vectorMultiply 0.5 );
		_edgeDirection = vectorNormalized (( _edgeStart vectorFromTo _edgeEnd ) vectorCrossProduct [0,0,1]);
		
		// Check to see if there's a surface we can attach the rope to (so it doesn't hang in the air)
		
		_playerPositionASL = getPosASL _player;
		
		_intersectStartASL = _playerPositionASL vectorAdd ((_playerPositionASL vectorFromTo _edgeStart) vectorMultiply (_intersectionRadius));
		_intersectEndASL = _intersectStartASL vectorAdd ((_intersectStartASL vectorFromTo _playerPositionASL) vectorMultiply (_intersectionRadius * 2)) vectorAdd [0,0,-0.5];
		_surfaces = lineIntersectsSurfaces [_intersectStartASL, _intersectEndASL, _player, objNull, true, 1, "FIRE", "NONE"];
		if(count _surfaces > 0) then {
			_edgeStart = (_surfaces select 0) select 0;
		};
		
		_intersectStartASL = _playerPositionASL vectorAdd ((_playerPositionASL vectorFromTo _edgeEnd) vectorMultiply (_intersectionRadius));
		_intersectEndASL = _intersectStartASL vectorAdd ((_intersectStartASL vectorFromTo _playerPositionASL) vectorMultiply (_intersectionRadius * 2)) vectorAdd [0,0,-0.5];
		_surfaces = lineIntersectsSurfaces [_intersectStartASL, _intersectEndASL, _player, objNull, true, 1, "FIRE", "NONE"];
		if(count _surfaces > 0) then {
			_edgeEnd = (_surfaces select 0) select 0;
		};
		
		_intersectStartASL = _playerPositionASL vectorAdd ((_playerPositionASL vectorFromTo _edgeMiddle) vectorMultiply (_intersectionRadius));
		_intersectEndASL = _intersectStartASL vectorAdd ((_intersectStartASL vectorFromTo _playerPositionASL) vectorMultiply (_intersectionRadius * 2)) vectorAdd [0,0,-0.5];
		_surfaces = lineIntersectsSurfaces [_intersectStartASL, _intersectEndASL, _player, objNull, true, 1, "FIRE", "NONE"];
		if(count _surfaces > 0) then {
			_edgeMiddle = (_surfaces select 0) select 0;
		};
		
		// Check to make sure there's an opening for rappelling (to stop people from rappelling through a wall)
		_intersectStartASL = _playerPosition vectorAdd [0,0,1.5];
		_intersectEndASL = _intersectStartASL vectorAdd (_edgeDirection vectorMultiply 4);
		_surfaces = lineIntersectsSurfaces [_intersectStartASL, _intersectEndASL, _player, objNull, true, 1, "FIRE", "NONE"];
		if(count _surfaces > 0) exitWith { [] };
	
		[_edgeMiddle,_edgeDirection,[_edgeStart,_edgeEnd,_edgeMiddle]];
	} else {
		[];
	};
	
};

AUR_Rappel_Action = {
	params ["_player"];	
	if([_player] call AUR_Rappel_Action_Check) then {
		_rappelPoint = [_player,"POSITION"] call AUR_Find_Nearby_Rappel_Point;
		if(count _rappelPoint > 0) then {
			_player setVariable ["AUR_Rappelling_Last_Started_Time",diag_tickTime];
			_player setVariable ["AUR_Rappelling_Last_Rappel_Point",_rappelPoint];
			_ropeLength = ([_player] call AUR_Get_Player_Height_Above_Ground) * 1.3;
			[_player, _rappelPoint select 0, _rappelPoint select 1,_ropeLength] call AUR_Rappel;
		} else {
			[["Couldn't attach rope. Move closer to edge!", false],"AUR_Hint",_player] call AUR_RemoteExec;
		};
	} else {
		[["Couldn't attach rope. Move closer to edge!", false],"AUR_Hint",_player] call AUR_RemoteExec;
	};
};

AUR_Get_Player_Height_Above_Ground = {
	params ["_player"];
	(ASLtoAGL (getPosASL _player)) select 2;
};

AUR_Rappel_Action_Check = {
	params ["_player"];
	if(_player getVariable ["AUR_Is_Rappelling",false]) exitWith {false;};
	if(vehicle _player != _player) exitWith {false;};
	if(([_player] call AUR_Get_Player_Height_Above_Ground) < 4) exitWith {false};
	if!([_player,"FAST_EXISTS_CHECK"] call AUR_Find_Nearby_Rappel_Point) exitWith {false;};
	if(count ([_player,"POSITION"] call AUR_Find_Nearby_Rappel_Point) == 0) exitWith {false;};
	true;
};

AUR_Rappel_Climb_To_Top_Action = {
	params ["_player"];
	_player setVariable ["AUR_Climb_To_Top",true];
};

AUR_Rappel_Climb_To_Top_Action_Check = {
	params ["_player"];
	private ["_topRope"];
	if!(_player getVariable ["AUR_Is_Rappelling",false]) exitWith {false;};
	_topRope = player getVariable ["AUR_Rappel_Rope_Top",nil];
	if(isNil "_topRope") exitWith {false;};
	if(ropeLength _topRope > 1) exitWith {false;};
	true;
};

AUR_Rappel_Detach_Action = {
	params ["_player"];
	_player setVariable ["AUR_Detach_Rope",true];
};

AUR_Rappel_Detach_Action_Check = {
	params ["_player"];
	if!(_player getVariable ["AUR_Is_Rappelling",false]) exitWith {false;};
	true;
};

AUR_Get_AI_Units_Ready_To_Rappel = {
	params ["_player"];
	if(leader _player != _player) exitWith {[]};
	_hasAiUnits = false;
	{
		if(!isPlayer _x) exitWith {
			_hasAiUnits = true;
		};
	} forEach units _player;
	if(!_hasAiUnits) exitWith {[]};
	_canRappel = [_player] call AUR_Rappel_Action_Check;
	_isRappelling = _player getVariable ["AUR_Is_Rappelling",false];
	_didRappel = (diag_tickTime - (_player getVariable ["AUR_Rappelling_Last_Started_Time",0])) < 300;
	_aiUnitsReady = [];
	if(_canRappel || _isRappelling || _didRappel) then {
		_rappelPoint = _player getVariable ["AUR_Rappelling_Last_Rappel_Point",[]];
		_rappelPosition = [0,0,0];
		if(count _rappelPoint > 0) then {
			_rappelPosition = ASLToATL (_rappelPoint select 0);
		};
		if(_canRappel) then {
			_rappelPosition = getPosATL _player;
		};
		{
			if(!isPlayer _x && _rappelPosition distance _x < 15 && abs ((_rappelPosition select 2) - ((getPosATL _x) select 2)) < 4 && not (_x getVariable ["AUR_Is_Rappelling",false]) && alive _x && vehicle _x == _x ) then {
				_aiUnitsReady pushBack _x;
			};
		} forEach units _player;
	};
	_aiUnitsReady;
};

AUR_Rappel_AI_Units_Action = {
	params ["_player"];
	_aiUnits = [_player] call AUR_Get_AI_Units_Ready_To_Rappel;
	_rappelPoint = _player getVariable ["AUR_Rappelling_Last_Rappel_Point",[]];
	if([_player] call AUR_Rappel_Action_Check) then {
		_rappelPoint = [_player,"POSITION"] call AUR_Find_Nearby_Rappel_Point;	
	};
	_index = 0;
	_allRappelPoints = _rappelPoint select 2;
	if(count _rappelPoint > 0) then {
		{
			if(!(_x getVariable ["AUR_Is_Rappelling",false])) then {
				[_x, _allRappelPoints select (_index mod 3), _rappelPoint select 1,60] spawn AUR_Rappel;
				sleep 5;
			};
			_index = _index + 1;
		} forEach (_aiUnits);
	};
};

AUR_Rappel_AI_Units_Action_Check = {
	params ["_player"];
	if(leader _player != _player) exitWith {false;};
	_hasAiUnits = false;
	{
		if(!isPlayer _x) exitWith {
			_hasAiUnits = true;
		};
	} forEach units _player;
	if(!_hasAiUnits) exitWith {false;};
	if((count ([_player] call AUR_Get_AI_Units_Ready_To_Rappel)) == 0) exitWith {false;};
	true;
};

AUR_Rappel_Unit = {
	params ["_unit",["_ropeLength",0],["_rappelPoint",[]],["_rappelDirection",[]]];
	if(count _rappelPoint == 0) then {
		_findRappelPointResult = [_unit,"POSITION"] call AUR_Find_Nearby_Rappel_Point;	
		if(count _findRappelPointResult > 0) then {
			_rappelPoint = _findRappelPointResult select 0;
			_rappelDirection = _findRappelPointResult select 1;
		};
	};
	if(count _rappelPoint > 0) then {
		if(_ropeLength <= 0) then {
			_ropeLength = ([_unit] call AUR_Get_Player_Height_Above_Ground) * 1.3;
		};
		[_unit, _rappelPoint, _rappelDirection, _ropeLength] spawn AUR_Rappel;
	} else {
		hint "Could not rappel unit - move unit closer to edge!";
	};
};

AUR_Rappel = {
	params ["_player","_rappelPoint","_rappelDirection","_ropeLength"];

	_player setVariable ["AUR_Is_Rappelling",true,true];

	_playerPreRappelPosition = getPosASL _player;
	
	// Start player rappelling 2m out from the rappel point
	_playerStartPosition = _rappelPoint vectorAdd (_rappelDirection vectorMultiply 2);
	_playerStartPosition set [2, getPosASL _player select 2];
	_player setPosWorld _playerStartPosition;
	
	// Create anchor for rope (at rappel point)
	_anchor = createVehicle ["Land_Can_V2_F", _player, [], 0, "CAN_COLLIDE"];
	hideObject _anchor;
	_anchor enableSimulation false;
	_anchor allowDamage false;
	[[_anchor],"AUR_Hide_Object_Global"] call AUR_RemoteExecServer;

	// Create rappel device (attached to player)
	_rappelDevice = createVehicle ["B_Static_Designator_01_F", _player, [], 0, "CAN_COLLIDE"];
	hideObject _rappelDevice;
	_rappelDevice setPosWorld _playerStartPosition;
	_rappelDevice allowDamage false;
	[[_rappelDevice],"AUR_Hide_Object_Global"] call AUR_RemoteExecServer;
	
	[[_player,_rappelDevice,_anchor],"AUR_Play_Rappelling_Sounds_Global"] call AUR_RemoteExecServer;
	
	_rope2 = ropeCreate [_rappelDevice, [-0.15,0,0], _ropeLength - 1];
	_rope2 allowDamage false;
	_rope1 = ropeCreate [_rappelDevice, [0,0.15,0], _anchor, [0, 0, 0], 1];
	_rope1 allowDamage false;
	
	_anchor setPosWorld _rappelPoint;

	_player setVariable ["AUR_Rappel_Rope_Top",_rope1];
	_player setVariable ["AUR_Rappel_Rope_Bottom",_rope2];
	_player setVariable ["AUR_Rappel_Rope_Length",_ropeLength];

	[_player] spawn AUR_Enable_Rappelling_Animation;
	
	// Make player face the wall they're rappelling on
	_player setVectorDir (_rappelDirection vectorMultiply -1);
	
	_gravityAccelerationVec = [0,0,-9.8];
	_velocityVec = [0,0,0];
	_lastTime = diag_tickTime;
	_lastPosition = AGLtoASL (_rappelDevice modelToWorldVisual [0,0,0]);
	
	_decendRopeKeyDownHandler = -1;
	_ropeKeyUpHandler = -1;
	if(_player == player) then {	
		_decendRopeKeyDownHandler = (findDisplay 46) displayAddEventHandler ["KeyDown", {
			private ["_topRope","_bottomRope"];
			if(_this select 1 in (actionKeys "MoveBack")) then {
				_ropeLength = player getVariable ["AUR_Rappel_Rope_Length",100];
				_topRope = player getVariable ["AUR_Rappel_Rope_Top",nil];
				if(!isNil "_topRope") then {
					ropeUnwind [ _topRope, 1.5, ((ropeLength _topRope) + 0.1) min _ropeLength];
				};
				_bottomRope = player getVariable ["AUR_Rappel_Rope_Bottom",nil];
				if(!isNil "_bottomRope") then {
					ropeUnwind [ _bottomRope, 1.5, ((ropeLength _bottomRope) - 0.1) max 0];
				};
			};
			if(_this select 1 in (actionKeys "MoveForward")) then {
				_ropeLength = player getVariable ["AUR_Rappel_Rope_Length",100];
				_topRope = player getVariable ["AUR_Rappel_Rope_Top",nil];
				if(!isNil "_topRope") then {
					ropeUnwind [ _topRope, 0.3, ((ropeLength _topRope) - 0.1) min _ropeLength];
				};
				_bottomRope = player getVariable ["AUR_Rappel_Rope_Bottom",nil];
				if(!isNil "_bottomRope") then {
					ropeUnwind [ _bottomRope, 0.3, ((ropeLength _bottomRope) + 0.1) max 0];
				};
			};
			if(_this select 1 in (actionKeys "Turbo") && player getVariable ["AUR_JUMP_PRESSED_START",0] == 0) then {
				player setVariable ["AUR_JUMP_PRESSED_START",diag_tickTime];
			};
			
			if(_this select 1 in (actionKeys "TurnRight")) then {
				player setVariable ["AUR_RIGHT_DOWN",true];
			};
			if(_this select 1 in (actionKeys "TurnLeft")) then {
				player setVariable ["AUR_LEFT_DOWN",true];
			};
		}];
		_ropeKeyUpHandler = (findDisplay 46) displayAddEventHandler ["KeyUp", {
			if(_this select 1 in (actionKeys "Turbo")) then {
				player setVariable ["AUR_JUMP_PRESSED",true];
				player setVariable ["AUR_JUMP_PRESSED_TIME",diag_tickTime - (player getVariable ["AUR_JUMP_PRESSED_START",diag_tickTime])];
				player setVariable ["AUR_JUMP_PRESSED_START",0];	
			};
			if(_this select 1 in (actionKeys "TurnRight")) then {
				player setVariable ["AUR_RIGHT_DOWN",false];
			};
			if(_this select 1 in (actionKeys "TurnLeft")) then {
				player setVariable ["AUR_LEFT_DOWN",false];
			};
		}];
	} else {
		[_rope1,_rope2] spawn {
			params ["_rope1","_rope2"];
			sleep 1;
			_randomSpeedFactor = ((random 10) - 5) / 10;
			ropeUnwind [ _rope1, 2 + _randomSpeedFactor, (ropeLength _rope1) + (ropeLength _rope2)];
			ropeUnwind [ _rope2, 2 + _randomSpeedFactor, 0];
		};
	};
	
	_walkingOnWallForce = [0,0,0];
	
	_lastAiJumpTime = diag_tickTime;
	
	while {true} do {
	
		_currentTime = diag_tickTime;
		_timeSinceLastUpdate = _currentTime - _lastTime;
		_lastTime = _currentTime;
		if(_timeSinceLastUpdate > 1) then {
			_timeSinceLastUpdate = 0;
		};

		_environmentWindVelocity = wind;
		_playerWindVelocity = _velocityVec vectorMultiply -1;
		_totalWindVelocity = _environmentWindVelocity vectorAdd _playerWindVelocity;
		_totalWindForce = _totalWindVelocity vectorMultiply (9.8/53);

		_accelerationVec = _gravityAccelerationVec vectorAdd _totalWindForce vectorAdd _walkingOnWallForce;
		_velocityVec = _velocityVec vectorAdd ( _accelerationVec vectorMultiply _timeSinceLastUpdate );
		_newPosition = _lastPosition vectorAdd ( _velocityVec vectorMultiply _timeSinceLastUpdate );

		if(_newPosition distance _rappelPoint > ((ropeLength _rope1) + 1)) then {
			_newPosition = (_rappelPoint) vectorAdd (( vectorNormalized ( (_rappelPoint) vectorFromTo _newPosition )) vectorMultiply ((ropeLength _rope1) + 1));
			_surfaceVector = ( vectorNormalized ( _newPosition vectorFromTo (_rappelPoint) ));
			_velocityVec = _velocityVec vectorAdd (( _surfaceVector vectorMultiply (_velocityVec vectorDotProduct _surfaceVector)) vectorMultiply -1);
		};

		_radius = 0.85;
		_intersectionTests = 10;
		for "_i" from 0 to _intersectionTests do
		{
			_axis1 = cos ((360/_intersectionTests)*_i);
			_axis2 = sin ((360/_intersectionTests)*_i);
			{
				_directionUnitVector = vectorNormalized _x;
				_intersectStartASL = _newPosition;
				_intersectEndASL = _newPosition vectorAdd ( _directionUnitVector vectorMultiply _radius );
				_surfaces = lineIntersectsSurfaces [_intersectStartASL, _intersectEndASL, _player, objNull, true, 10,"FIRE","NONE"];
				{
					_x params ["_intersectionPositionASL", "_surfaceNormal", "_intersectionObject"];
					_objectFileName = str _intersectionObject;
					if((_objectFileName find "rope") == -1 && not (_intersectionObject isKindOf "RopeSegment") && (_objectFileName find " t_") == -1 && (_objectFileName find " b_") == -1 ) then {
						if(_newPosition distance _intersectionPositionASL < 1) then {
							_newPosition = _intersectionPositionASL vectorAdd ( ( vectorNormalized ( _intersectEndASL vectorFromTo _intersectStartASL )) vectorMultiply  (_radius) );
						};
						_velocityVec = _velocityVec vectorAdd (( _surfaceNormal vectorMultiply (_velocityVec vectorDotProduct _surfaceNormal)) vectorMultiply -1);
					};
				} forEach _surfaces;
			} forEach [[_axis1, _axis2, 0], [_axis1, 0, _axis2], [0, _axis1, _axis2]];
		};
		
		
		_jumpPressed = _player getVariable ["AUR_JUMP_PRESSED",false];
		_jumpPressedTime = _player getVariable ["AUR_JUMP_PRESSED_TIME",0];
		_leftDown = _player getVariable ["AUR_LEFT_DOWN",false];
		_rightDown = _player getVariable ["AUR_RIGHT_DOWN",false];
		
		// Simulate AI jumping off wall randomly
		if(_player != player) then {
			if(diag_tickTime - _lastAiJumpTime > (random 30) max 5) then {
				_jumpPressed = true;
				_jumpPressedTime = 0;
				_lastAiJumpTime = diag_tickTime;
			};
		};
		
		if(_jumpPressed || _leftDown || _rightDown) then {
			
			// Get the surface normal of the surface the player is hanging against
			_intersectStartASL = _newPosition;
			_intersectEndASL = _intersectStartASL vectorAdd (vectorDir _player vectorMultiply (_radius + 0.3));
			_surfaces = lineIntersectsSurfaces [_intersectStartASL, _intersectEndASL, _player, objNull, true, 10, "GEOM", "NONE"];
			_isAgainstSurface = false;
			{
				_x params ["_intersectionPositionASL", "_surfaceNormal", "_intersectionObject"];
				_objectFileName = str _intersectionObject;
				if((_objectFileName find "rope") == -1 && not (_intersectionObject isKindOf "RopeSegment") && (_objectFileName find " t_") == -1 && (_objectFileName find " b_") == -1 ) exitWith {
					_isAgainstSurface = true;
				};
			} forEach _surfaces;

			if(_isAgainstSurface) then {
				if(_jumpPressed) then {
					_jumpForce = ((( 1.5 min _jumpPressedTime )/1.5) * 4.5) max 2.5;
					_velocityVec = _velocityVec vectorAdd (vectorDir _player vectorMultiply (_jumpForce * -1));
					_player setVariable ["AUR_JUMP_PRESSED", false];
				};
				if(_rightDown) then {
					_walkingOnWallForce = (vectorNormalized ((vectorDir _player) vectorCrossProduct [0,0,1])) vectorMultiply 1;
				};
				if(_leftDown) then {
					_walkingOnWallForce = (vectorNormalized ((vectorDir _player) vectorCrossProduct [0,0,-1])) vectorMultiply 1;
				};
				if(_rightDown && _leftDown) then {
					_walkingOnWallForce = [0,0,0];
				}
			} else {
				_player setVariable ["AUR_JUMP_PRESSED", false];
			};
		
		} else {
			_walkingOnWallForce = [0,0,0];
		};
		
		_rappelDevice setPosWorld (_newPosition vectorAdd (_velocityVec vectorMultiply 0.1) );
		_rappelDevice setVectorDir (vectorDir _player); 
		
		_player setPosWorld (_newPosition vectorAdd [0,0,-0.6]);

		_player setVelocity [0,0,0];

		_lastPosition = _newPosition;
		
		if((getPos _player) select 2 < 1 || !alive _player || vehicle _player != _player || ropeLength _rope2 <= 1 || _player getVariable ["AUR_Climb_To_Top",false] || _player getVariable ["AUR_Detach_Rope",false] ) exitWith {};
		
		sleep 0.01;
	};

	if(ropeLength _rope2 > 1 && alive _player && vehicle _player == _player && not (_player getVariable ["AUR_Climb_To_Top",false])) then {
	
		_playerStartASLIntersect = getPosASL _player;
		_playerEndASLIntersect = [_playerStartASLIntersect select 0, _playerStartASLIntersect select 1, (_playerStartASLIntersect select 2) - 5];
		_surfaces = lineIntersectsSurfaces [_playerStartASLIntersect, _playerEndASLIntersect, _player, objNull, true, 10];
		_intersectionASL = [];
		{
			scopeName "surfaceLoop";
			_intersectionObject = _x select 2;
			_objectFileName = str _intersectionObject;
			if((_objectFileName find " t_") == -1 && (_objectFileName find " b_") == -1) then {
				_intersectionASL = _x select 0;
				breakOut "surfaceLoop";
			};
		} forEach _surfaces;
		
		if(count _intersectionASL != 0) then {
			_player allowDamage false;
			_player setPosASL _intersectionASL;
		};		

		if(_player getVariable ["AUR_Detach_Rope",false]) then {
			// Player detached from rope. Don't prevent damage 
			// if we didn't find a position on the ground
			if(count _intersectionASL == 0) then {
				_player allowDamage true;
			};	
		};
		
	};
	
	if(_player getVariable ["AUR_Climb_To_Top",false]) then {
		_player allowDamage false;
		_player setPosASL _playerPreRappelPosition;
	};

	ropeDestroy _rope1;
	ropeDestroy _rope2;		
	deleteVehicle _anchor;
	deleteVehicle _rappelDevice;
	
	_player setVariable ["AUR_Is_Rappelling",nil,true];
	_player setVariable ["AUR_Rappel_Rope_Top",nil];
	_player setVariable ["AUR_Rappel_Rope_Bottom",nil];
	_player setVariable ["AUR_Rappel_Rope_Length",nil];
	_player setVariable ["AUR_Climb_To_Top",nil];
	_player setVariable ["AUR_Detach_Rope",nil];
	_player setVariable ["AUR_Animation_Move",nil,true];

	if(_decendRopeKeyDownHandler != -1) then {			
		(findDisplay 46) displayRemoveEventHandler ["KeyDown", _decendRopeKeyDownHandler];
	};
	
	sleep 2;
	
	_player allowDamage true;

};

AUR_Enable_Rappelling_Animation_Global = {
	params ["_player"];
	[_player,true] remoteExec ["AUR_Enable_Rappelling_Animation", 0];
};

AUR_Current_Weapon_Type_Selected = {
	params ["_player"];
	if(currentWeapon _player == handgunWeapon _player) exitWith {"HANDGUN"};
	if(currentWeapon _player == primaryWeapon _player) exitWith {"PRIMARY"};
	if(currentWeapon _player == secondaryWeapon _player) exitWith {"SECONDARY"};
	"OTHER";
};

AUR_Enable_Rappelling_Animation = {
	params ["_player",["_globalExec",false]];
	
	if(local _player && _globalExec) exitWith {};
	
	if(local _player && !_globalExec) then {
		[[_player],"AUR_Enable_Rappelling_Animation_Global"] call AUR_RemoteExecServer;
	};

	if(_player != player) then {
		_player enableSimulation false;
	};
	
	if(call AUR_Has_Addon_Animations_Installed) then {		
		if([_player] call AUR_Current_Weapon_Type_Selected == "HANDGUN") then {
			if(local _player) then {
				_player switchMove "AUR_01_Idle_Pistol";
				_player setVariable ["AUR_Animation_Move","AUR_01_Idle_Pistol_No_Actions",true];
			} else {
				_player setVariable ["AUR_Animation_Move","AUR_01_Idle_Pistol_No_Actions"];			
			};
		} else {
			if(local _player) then {
				_player switchMove "AUR_01_Idle";
				_player setVariable ["AUR_Animation_Move","AUR_01_Idle_No_Actions",true];
			} else {
				_player setVariable ["AUR_Animation_Move","AUR_01_Idle_No_Actions"];
			};
		};
		if!(local _player) then {
			// Temp work around to avoid seeing other player as standing
			_player switchMove "AUR_01_Idle_No_Actions";
			sleep 1;
			_player switchMove "AUR_01_Idle_No_Actions";
			sleep 1;
			_player switchMove "AUR_01_Idle_No_Actions";
			sleep 1;
			_player switchMove "AUR_01_Idle_No_Actions";
		};
	} else {
		if(local _player) then {
			_player switchMove "HubSittingChairC_idle1";
			_player setVariable ["AUR_Animation_Move","HubSittingChairC_idle1",true];
		} else {
			_player setVariable ["AUR_Animation_Move","HubSittingChairC_idle1"];		
		};
	};

	_animationEventHandler = -1;
	if(local _player) then {
		_animationEventHandler = _player addEventHandler ["AnimChanged",{
			params ["_player","_animation"];
			if(call AUR_Has_Addon_Animations_Installed) then {
				if((toLower _animation) find "aur_" < 0) then {
					if([_player] call AUR_Current_Weapon_Type_Selected == "HANDGUN") then {
						_player switchMove "AUR_01_Aim_Pistol";
						_player setVariable ["AUR_Animation_Move","AUR_01_Aim_Pistol_No_Actions",true];
					} else {
						_player switchMove "AUR_01_Aim";
						_player setVariable ["AUR_Animation_Move","AUR_01_Aim_No_Actions",true];
					};
				} else {
					if(toLower _animation == "aur_01_aim") then {
						_player setVariable ["AUR_Animation_Move","AUR_01_Aim_No_Actions",true];
					};
					if(toLower _animation == "aur_01_idle") then {
						_player setVariable ["AUR_Animation_Move","AUR_01_Idle_No_Actions",true];
					};
					if(toLower _animation == "aur_01_aim_pistol") then {
						_player setVariable ["AUR_Animation_Move","AUR_01_Aim_Pistol_No_Actions",true];
					};
					if(toLower _animation == "aur_01_idle_pistol") then {
						_player setVariable ["AUR_Animation_Move","AUR_01_Idle_Pistol_No_Actions",true];
					};
				};
			} else {
				_player switchMove "HubSittingChairC_idle1";
				_player setVariable ["AUR_Animation_Move","HubSittingChairC_idle1",true];
			};
		}];
	};
	
	if(!local _player) then {
		[_player] spawn {
			params ["_player"];
			private ["_currentState"];
			while {_player getVariable ["AUR_Is_Rappelling",false]} do {
				_currentState = toLower animationState _player;
				_newState = toLower (_player getVariable ["AUR_Animation_Move",""]);
				if!(call AUR_Has_Addon_Animations_Installed) then {
					_newState = "HubSittingChairC_idle1";
				};
				if(_currentState != _newState) then {
					_player switchMove _newState;
					_player switchGesture "";
					sleep 1;
					_player switchMove _newState;
					_player switchGesture "";
				};
				sleep 0.1;
			};			
		};
	};
	
	waitUntil {!(_player getVariable ["AUR_Is_Rappelling",false])};
	
	if(_animationEventHandler != -1) then {
		_player removeEventHandler ["AnimChanged", _animationEventHandler];
	};
	
	_player switchMove "";	
	_player enableSimulation true;
	
};

AUR_Hint = {
    params ["_msg",["_isSuccess",true]];
    if(!isNil "ExileClient_gui_notification_event_addNotification") then {
		if(_isSuccess) then {
			["Success", [_msg]] call ExileClient_gui_notification_event_addNotification; 
		} else {
			["Whoops", [_msg]] call ExileClient_gui_notification_event_addNotification; 
		};
    } else {
        hint _msg;
    };
};

AUR_Hide_Object_Global = {
	params ["_obj"];
	if( _obj isKindOf "Land_Can_V2_F" || _obj isKindOf "B_Static_Designator_01_F" ) then {
		hideObjectGlobal _obj;
	};
};

AUR_Add_Player_Actions = {
	params ["_player"];
	
	_player addAction ["Rappel Self", { 
		[player, vehicle player] call AUR_Rappel_Action;
	}, nil, 0, false, true, "", "[player] call AUR_Rappel_Action_Check"];

	_player addAction ["Rappel AI Units", { 
		[player] call AUR_Rappel_AI_Units_Action;
	}, nil, 0, false, true, "", "[player] call AUR_Rappel_AI_Units_Action_Check"];

	_player addAction ["Climb To Top", { 
		[player] call AUR_Rappel_Climb_To_Top_Action;
	}, nil, 0, false, true, "", "[player] call AUR_Rappel_Climb_To_Top_Action_Check"];
	
	_player addAction ["Detach Rappel Device", { 
		[player] call AUR_Rappel_Detach_Action;
	}, nil, 0, false, true, "", "[player] call AUR_Rappel_Detach_Action_Check"];
	
	_player addEventHandler ["Respawn", {
		player setVariable ["AUR_Actions_Loaded",false];
	}];
	
};

if(!isDedicated) then {
	[] spawn {
		while {true} do {
			if(!isNull player && isPlayer player) then {
				if!(player getVariable ["AUR_Actions_Loaded",false] ) then {
					[player] call AUR_Add_Player_Actions;
					player setVariable ["AUR_Actions_Loaded",true];
				};
			};
			sleep 5;
		};
	};
};

AUR_RemoteExec = {
	params ["_params","_functionName","_target",["_isCall",false]];
	if(!isNil "ExileClient_system_network_send") then {
		["AdvancedUrbanRappellingRemoteExecClient",[_params,_functionName,_target,_isCall]] call ExileClient_system_network_send;
	} else {
		if(_isCall) then {
			_params remoteExecCall [_functionName, _target];
		} else {
			_params remoteExec [_functionName, _target];
		};
	};
};

AUR_RemoteExecServer = {
	params ["_params","_functionName",["_isCall",false]];
	if(!isNil "ExileClient_system_network_send") then {
		["AdvancedUrbanRappellingRemoteExecServer",[_params,_functionName,_isCall]] call ExileClient_system_network_send;
	} else {
		if(_isCall) then {
			_params remoteExecCall [_functionName, 0];
		} else {
			_params remoteExec [_functionName, 0];
		};
	};
};

if(isServer) then {
	
	// Adds support for exile network calls (Only used when running exile) //
	
	AUR_SUPPORTED_REMOTEEXECSERVER_FUNCTIONS = ["AUR_Enable_Rappelling_Animation_Global","AUR_Hide_Object_Global","AUR_Play_Rappelling_Sounds_Global"];

	ExileServer_AdvancedUrbanRappelling_network_AdvancedUrbanRappellingRemoteExecServer = {
		params ["_sessionId", "_messageParameters",["_isCall",false]];
		_messageParameters params ["_params","_functionName"];
		if(_functionName in AUR_SUPPORTED_REMOTEEXECSERVER_FUNCTIONS) then {
			if(_isCall) then {
				_params call (missionNamespace getVariable [_functionName,{}]);
			} else {
				_params spawn (missionNamespace getVariable [_functionName,{}]);
			};
		};
	};
	
	AUR_SUPPORTED_REMOTEEXECCLIENT_FUNCTIONS = ["AUR_Hint"];
	
	ExileServer_AdvancedUrbanRappelling_network_AdvancedUrbanRappellingRemoteExecClient = {
		params ["_sessionId", "_messageParameters"];
		_messageParameters params ["_params","_functionName","_target",["_isCall",false]];
		if(_functionName in AUR_SUPPORTED_REMOTEEXECCLIENT_FUNCTIONS) then {
			if(_isCall) then {
				_params remoteExecCall [_functionName, _target];
			} else {
				_params remoteExec [_functionName, _target];
			};
		};
	};
	
};

diag_log "Advanced Urban Rappelling Loaded";

};

publicVariable "AUR_Advanced_Urban_Rappelling_Install";

[] call AUR_Advanced_Urban_Rappelling_Install;
// Install Advanced Urban Rappelling on all clients (plus JIP) //
remoteExecCall ["AUR_Advanced_Urban_Rappelling_Install", -2,true];


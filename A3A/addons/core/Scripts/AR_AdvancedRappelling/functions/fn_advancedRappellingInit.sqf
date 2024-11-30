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
if(_platform == "Linux") exitWith {}; ////Professor Sugon says on deez nuts for all Linux users

AR_Advanced_Rappelling_Install = {

// Prevent advanced rappelling from installing twice
if(!isNil "AR_RAPPELLING_INIT") exitWith {};
scriptName "fn_advancedRappellingInit.sqf";
private _fileName = "fn_advancedRappellingInit.sqf";
AR_RAPPELLING_INIT = true;

diag_log "Advanced Rappelling Loading...";

AP_RAPPEL_POINTS = [];

AR_RAPPEL_POINT_CLASS_HEIGHT_OFFSET = [  
	["All", [-0.05, -0.05, -0.05, -0.05, -0.05, -0.05]]
];

AR_Has_Addon_Animations_Installed = {
	(count getText ( configFile / "CfgMovesBasic" / "ManActions" / "AR_01" )) > 0;
};

AR_Has_Addon_Sounds_Installed = {
	private ["_config","_configMission"];
	_config = getArray ( configFile / "CfgSounds" / "AR_Rappel_Start" / "sound" );
	_configMission = getArray ( missionConfigFile / "CfgSounds" / "AR_Rappel_Start" / "sound" );
	(count _config > 0 || count _configMission > 0);
};

AR_Rappel_All_Cargo = {
	params ["_vehicle",["_rappelHeight",25],["_positionASL",[]]];
	if(isPlayer (driver _vehicle)) exitWith {};
	if(local _vehicle) then {
		_this spawn {
			params ["_vehicle",["_rappelHeight",25],["_positionASL",[]]];
	
			_heliGroup = group driver _vehicle;
			_vehicle setVariable ["AR_Units_Rappelling",true];

			_heliGroupOriginalBehaviour = behaviour leader _heliGroup;
			_heliGroupOriginalCombatMode = combatMode leader _heliGroup;
			_heliGroupOriginalFormation = formation _heliGroup;

			if(count _positionASL == 0) then {
				_positionASL = AGLtoASL [(getPos _vehicle) select 0, (getPos _vehicle) select 1, 0];
			};
			_positionASL = _positionASL vectorAdd [0, 0, _rappelHeight];
			
			_gameLogicLeader = _heliGroup createUnit ["LOGIC", ASLToAGL _positionASL, [], 0, ""];
			_heliGroup selectLeader _gameLogicLeader;

			_heliGroup setBehaviour "Careless";
			_heliGroup setCombatMode "Blue";
			_heliGroup setFormation "File";
			
			// Wait for heli to slow down
			waitUntil { (vectorMagnitude (velocity _vehicle)) < 10 && _vehicle distance2d _gameLogicLeader < 50  };
			
			// Force heli to specific position
			[_vehicle, _positionASL] spawn {
				params ["_vehicle","_positionASL"];
				
				while { _vehicle getVariable ["AR_Units_Rappelling",false] && alive _vehicle } do {

					_velocityMagatude = 5;
					_distanceToPosition = ((getPosASL _vehicle) distance _positionASL);
					if( _distanceToPosition <= 10 ) then {
						_velocityMagatude = (_distanceToPosition / 10) * _velocityMagatude;
					};
					
					_currentVelocity = velocity _vehicle;
					_currentVelocity = _currentVelocity vectorAdd (( (getPosASL _vehicle) vectorFromTo _positionASL ) vectorMultiply _velocityMagatude);
					_currentVelocity = (vectorNormalized _currentVelocity) vectorMultiply ( (vectorMagnitude _currentVelocity) min _velocityMagatude );
					_vehicle setVelocity _currentVelocity;
					
					sleep 0.05;
				};
			};

			// Find all units that will be rappelling
			_rappelUnits = [];
			_rappelledGroups = [];
			{
				if( group _x != _heliGroup && alive _x ) then {
					_rappelUnits pushBack _x;
					_rappelledGroups = _rappelledGroups + [group _x];
				};
			} forEach crew _vehicle;
	
			// Rappel all units
			_unitsOutsideVehicle = [];
			while { count _unitsOutsideVehicle != count _rappelUnits } do { 	
				_distanceToPosition = ((getPosASL _vehicle) distance _positionASL);
				if(_distanceToPosition < 3) then {
					{
						[_x, _vehicle] call AR_Rappel_From_Heli;					
						sleep 1;
					} forEach (_rappelUnits-_unitsOutsideVehicle);
					{
						if!(_x in _vehicle) then {
							_unitsOutsideVehicle pushBack _x;
						};
					} forEach (_rappelUnits-_unitsOutsideVehicle);
				};
				sleep 2;
			};
			
			// Wait for all units to reach ground
			_unitsRappelling = true;
			while { _unitsRappelling } do { 
				_unitsRappelling = false;
				{
					if( _x getVariable ["AR_Is_Rappelling",false] ) then {
						_unitsRappelling = true;
					};
				} forEach _rappelUnits;
				sleep 1.5;
			};

			{
				unassignVehicle _x;
			} forEach _rappelUnits;
			
			deleteVehicle _gameLogicLeader;
			
			_heliGroup setBehaviour _heliGroupOriginalBehaviour;
			_heliGroup setCombatMode _heliGroupOriginalCombatMode;
			_heliGroup setFormation _heliGroupOriginalFormation;

			_vehicle setVariable ["AR_Units_Rappelling",nil];
	
		};
	} else {
		[_this,"AR_Rappel_All_Cargo",_vehicle] call AR_RemoteExec;
	};
};

AR_Play_Rappelling_Sounds_Global = {
	_this remoteExec ["AR_Play_Rappelling_Sounds", 0];
};

AR_Play_Rappelling_Sounds = {
	params ["_player","_rappelDevice","_rappelAncor"];
	if(!hasInterface || !(call AR_Has_Addon_Sounds_Installed) ) exitWith {};
	if(player distance _player < 15) then {
		[_player, "AR_Rappel_Start"] call AR_Play_3D_Sound;
		[_rappelDevice, "AR_Rappel_Loop"] call AR_Play_3D_Sound;
	};
	_this spawn {
		params ["_player","_rappelDevice","_rappelAncor"];
		private ["_lastDistanceFromAnchor","_distanceFromAnchor"];
		_lastDistanceFromAnchor = _rappelDevice distance _rappelAncor;
		while {_player getVariable ["AR_Is_Rappelling",false]} do {
			_distanceFromAnchor = _rappelDevice distance _rappelAncor;
			if(_distanceFromAnchor > _lastDistanceFromAnchor + 1 && player distance _player < 15) then {
				[_player, "AR_Rappel_Loop"] call AR_Play_3D_Sound;
				sleep 0.2;
				[_rappelDevice, "AR_Rappel_Loop"] call AR_Play_3D_Sound;
			};
			sleep 0.9;
			_lastDistanceFromAnchor = _distanceFromAnchor;
		};
	};
	_this spawn {
		params ["_player"];
		while {_player getVariable ["AR_Is_Rappelling",false]} do {
			sleep 0.1;
		};
		if(player distance _player < 15) then {
			[_player, "AR_Rappel_End"] call AR_Play_3D_Sound;
		};
	};
};

AR_Play_3D_Sound = {
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

AR_Get_Heli_Rappel_Points = {
	params ["_vehicle"];
	
	// Check for pre-defined rappel points
	
	private ["_preDefinedRappelPoints","_className","_rappelPoints","_preDefinedRappelPointsConverted"];
	_preDefinedRappelPoints = [];
	{
		_className = _x select 0;
		_rappelPoints = _x select 1;
		if( _vehicle isKindOf _className ) then {
			_preDefinedRappelPoints = _rappelPoints;
		};
	} forEach (AP_RAPPEL_POINTS + (missionNamespace getVariable ["AP_CUSTOM_RAPPEL_POINTS",[]]));
	if(count _preDefinedRappelPoints > 0) exitWith { 
		_preDefinedRappelPointsConverted = [];
		{
			if(typeName _x == "STRING") then {
				_modelPosition = _vehicle selectionPosition _x;
				if( [0,0,0] distance _modelPosition > 0 ) then {
					_preDefinedRappelPointsConverted pushBack _modelPosition;
				};
			} else {
				_preDefinedRappelPointsConverted pushBack _x;
			};
		} forEach _preDefinedRappelPoints;
		_preDefinedRappelPointsConverted;
	};
	
	// Calculate dynamic rappel points
	
	private ["_rappelPointsArray","_cornerPoints","_frontLeftPoint","_frontRightPoint","_rearLeftPoint","_rearRightPoint","_rearLeftPointFinal"];
	private ["_rearRightPointFinal","_frontLeftPointFinal","_frontRightPointFinal","_middleLeftPointFinal","_middleRightPointFinal","_vehicleUnitVectorUp"];
	private ["_rappelPoints","_modelPoint","_modelPointASL","_surfaceIntersectStartASL","_surfaceIntersectEndASL","_surfaces","_intersectionASL","_intersectionObject"];
	private ["_la","_lb","_n","_p0","_l","_d","_validRappelPoints"];
	
	_rappelPointsArray = [];
	_cornerPoints = [_vehicle] call AR_Get_Corner_Points;
	
	_frontLeftPoint = (((_cornerPoints select 2) vectorDiff (_cornerPoints select 3)) vectorMultiply 0.2) vectorAdd (_cornerPoints select 3);
	_frontRightPoint = (((_cornerPoints select 2) vectorDiff (_cornerPoints select 3)) vectorMultiply 0.8) vectorAdd (_cornerPoints select 3);
	_rearLeftPoint = (((_cornerPoints select 0) vectorDiff (_cornerPoints select 1)) vectorMultiply 0.2) vectorAdd (_cornerPoints select 1);
	_rearRightPoint = (((_cornerPoints select 0) vectorDiff (_cornerPoints select 1)) vectorMultiply 0.8) vectorAdd (_cornerPoints select 1);
	
	_rearLeftPointFinal = ((_frontLeftPoint vectorDiff _rearLeftPoint) vectorMultiply 0.2) vectorAdd _rearLeftPoint;
	_rearRightPointFinal = ((_frontRightPoint vectorDiff _rearRightPoint) vectorMultiply 0.2) vectorAdd _rearRightPoint;
	_frontLeftPointFinal = ((_rearLeftPoint vectorDiff _frontLeftPoint) vectorMultiply 0.2) vectorAdd _frontLeftPoint;
	_frontRightPointFinal = ((_rearRightPoint vectorDiff _frontRightPoint) vectorMultiply 0.2) vectorAdd _frontRightPoint;
	_middleLeftPointFinal = ((_frontLeftPointFinal vectorDiff _rearLeftPointFinal) vectorMultiply 0.5) vectorAdd _rearLeftPointFinal;
	_middleRightPointFinal = ((_frontRightPointFinal vectorDiff _rearRightPointFinal) vectorMultiply 0.5) vectorAdd _rearRightPointFinal;

	_vehicleUnitVectorUp = vectorNormalized (vectorUp _vehicle);
	
	_rappelPointHeightOffset = 0;
	{
		if(_vehicle isKindOf (_x select 0)) then {
			_rappelPointHeightOffset = (_x select 1);
		};
	} forEach AR_RAPPEL_POINT_CLASS_HEIGHT_OFFSET;
	
	_rappelPoints = [];
	{
		_modelPoint = _x;
		_modelPointASL = AGLToASL (_vehicle modelToWorldVisual _modelPoint);
		_surfaceIntersectStartASL = _modelPointASL vectorAdd ( _vehicleUnitVectorUp vectorMultiply -5 );
		_surfaceIntersectEndASL = _modelPointASL vectorAdd ( _vehicleUnitVectorUp vectorMultiply 5 );
		
		// Determine if the surface intersection line crosses below ground level
		// If if does, move surfaceIntersectStartASL above ground level (lineIntersectsSurfaces
		// doesn't work if starting below ground level for some reason
		// See: https://en.wikipedia.org/wiki/Line%E2%80%93plane_intersection
		
		_la = ASLToAGL _surfaceIntersectStartASL;
		_lb = ASLToAGL _surfaceIntersectEndASL;
		
		if(_la select 2 < 0 && _lb select 2 > 0) then {
			_n = [0,0,1];
			_p0 = [0,0,0.1];
			_l = (_la vectorFromTo _lb);
			if((_l vectorDotProduct _n) != 0) then {
				_d = ( ( _p0 vectorAdd ( _la vectorMultiply -1 ) ) vectorDotProduct _n ) / (_l vectorDotProduct _n);
				_surfaceIntersectStartASL = AGLToASL ((_l vectorMultiply _d) vectorAdd _la);
			};
		};
		
		_surfaces = lineIntersectsSurfaces [_surfaceIntersectStartASL, _surfaceIntersectEndASL, objNull, objNull, true, 100];
		_intersectionASL = [];
		{
			_intersectionObject = _x select 2;
			if(_intersectionObject == _vehicle) exitWith {
				_intersectionASL = _x select 0;
			};
		} forEach _surfaces;
		if(count _intersectionASL > 0) then {
			_intersectionASL = _intersectionASL vectorAdd (( _surfaceIntersectStartASL vectorFromTo _surfaceIntersectEndASL ) vectorMultiply (_rappelPointHeightOffset select (count _rappelPoints)));
			_rappelPoints pushBack (_vehicle worldToModelVisual (ASLToAGL _intersectionASL));
		} else {
			_rappelPoints pushBack [];
		};
	} forEach [_middleLeftPointFinal, _middleRightPointFinal, _frontLeftPointFinal, _frontRightPointFinal, _rearLeftPointFinal, _rearRightPointFinal];

	_validRappelPoints = [];
	{
		if(count _x > 0 && count _validRappelPoints < missionNamespace getVariable ["AR_MAX_RAPPEL_POINTS_OVERRIDE",6]) then {
			_validRappelPoints pushBack _x;
		};
	} forEach _rappelPoints;
	
	_validRappelPoints;
};


AR_Rappel_From_Heli = {
	params ["_player","_heli"];
	if(isServer) then {
	
		if!(_player in _heli) exitWith {};
		if(_player getVariable ["AR_Is_Rappelling", false]) exitWith {};
	
		// Find next available rappel anchor
		_rappelPoints = [_heli] call AR_Get_Heli_Rappel_Points;
		_rappelPointIndex = 0;
		{
			_rappellingPlayer = _heli getVariable ["AR_Rappelling_Player_" + str _rappelPointIndex,objNull];
			if(isNull _rappellingPlayer) exitWith {};
			_rappelPointIndex = _rappelPointIndex + 1;
		} forEach _rappelPoints;
		
		// All rappel anchors are taken by other players. Hint player to try again.
		if(count _rappelPoints == _rappelPointIndex) exitWith {
			if(isPlayer _player) then {
				[["All rappel anchors in use. Please try again.", false],"AR_Hint",_player] call AR_RemoteExec;
			};
		};
		
		_heli setVariable ["AR_Rappelling_Player_" + str _rappelPointIndex,_player];

		_player setVariable ["AR_Is_Rappelling",true,true];

		// Start rappelling (client side)
		[_player,_heli,_rappelPoints select _rappelPointIndex] spawn AR_Client_Rappel_From_Heli;
		
		// Wait for player to finish rappeling before freeing up anchor
		[_player, _heli, _rappelPointIndex] spawn {
			params ["_player","_heli", "_rappelPointIndex"];
			while {true} do {
				if(!alive _player) exitWith {};
				if!(_player getVariable ["AR_Is_Rappelling", false]) exitWith {};
				sleep 2;
			};
			_heli setVariable ["AR_Rappelling_Player_" + str _rappelPointIndex, nil];
		};

	} else {
		[_this,"AR_Rappel_From_Heli",true] call AR_RemoteExecServer;
	};
};

AR_Client_Rappel_From_Heli = {
	params ["_player","_heli","_rappelPoint"];	
	if(local _player) then {
		[_player] orderGetIn false;
		moveOut _player;
		waitUntil { vehicle _player == _player};
		_playerStartPosition = AGLtoASL (_heli modelToWorldVisual _rappelPoint);
		_playerStartPosition set [2,(_playerStartPosition select 2) - 1];
		_playerStartPosition set [1,(_playerStartPosition select 1) - ((((random 100)-50))/25)];
		_playerStartPosition set [0,(_playerStartPosition select 0) - ((((random 100)-50))/25)];
		_player setPosWorld _playerStartPosition;

		_anchor = "Land_Can_V2_F" createVehicle position _player;
		_anchor allowDamage false;
		hideObject _anchor;
		[[_anchor],"AR_Hide_Object_Global"] call AR_RemoteExecServer;
		_anchor attachTo [_heli,_rappelPoint];
		
		private _vehicle = "B_static_AA_F";
		if (isClass(configfile >> "CfgPatches" >> "ace_main")) then {_vehicle = "ACE_O_T_SpottingScope"};	// ACE v3.12.6 compatibility
		
		_rappelDevice = _vehicle createVehicle position _player;
		_rappelDevice setPosWorld _playerStartPosition;
		_rappelDevice allowDamage false;
		hideObject _rappelDevice;
		[[_rappelDevice],"AR_Hide_Object_Global"] call AR_RemoteExecServer;
		
		[[_player,_rappelDevice,_anchor],"AR_Play_Rappelling_Sounds_Global"] call AR_RemoteExecServer;
		
		_bottomRopeLength = 60;
		_bottomRope = ropeCreate [_rappelDevice, [-0.15,0,0], _bottomRopeLength];
		_bottomRope allowDamage false;
		_topRopeLength = 3;
		_topRope = ropeCreate [_rappelDevice, [0,0.15,0], _anchor, [0, 0, 0], _topRopeLength];
		_topRope allowDamage false;

		[_player] spawn AR_Enable_Rappelling_Animation_Client;
		
		_gravityAccelerationVec = [0,0,-9.8];
		_velocityVec = [0,0,0];
		_lastTime = diag_tickTime;
		_lastPosition = AGLtoASL (_rappelDevice modelToWorldVisual [0,0,0]);
		_lookDirFreedom = 50;
		_dir = (random 360) + (_lookDirFreedom / 2);
		_dirSpinFactor = (((random 10) - 5) / 5) max 0.1;
		
		_ropeKeyDownHandler = -1;
		_ropeKeyUpHandler = -1;
		if(_player == player) then {

			_player setVariable ["AR_DECEND_PRESSED",false];
			_player setVariable ["AR_FAST_DECEND_PRESSED",false];
			_player setVariable ["AR_RANDOM_DECEND_SPEED_ADJUSTMENT",0];
			
			_ropeKeyDownHandler = (findDisplay 46) displayAddEventHandler ["KeyDown", {
				if(_this select 1 in (actionKeys "MoveBack")) then {
					player setVariable ["AR_DECEND_PRESSED",true];
				};
				if(_this select 1 in (actionKeys "Turbo")) then {
					player setVariable ["AR_FAST_DECEND_PRESSED",true];
				};
			}];
			
			_ropeKeyUpHandler = (findDisplay 46) displayAddEventHandler ["KeyUp", {
				if(_this select 1 in (actionKeys "MoveBack")) then {
					player setVariable ["AR_DECEND_PRESSED",false];
				};
				if(_this select 1 in (actionKeys "Turbo")) then {
					player setVariable ["AR_FAST_DECEND_PRESSED",false];
				};
			}];
			
		} else {
		
			_player setVariable ["AR_DECEND_PRESSED",false];
			_player setVariable ["AR_FAST_DECEND_PRESSED",false];
			_player setVariable ["AR_RANDOM_DECEND_SPEED_ADJUSTMENT",(random 2) - 1];

			[_player] spawn {
				params ["_player"];
				sleep 2;
				_player setVariable ["AR_DECEND_PRESSED",true];
			};
			
		};
		
		// Cause player to fall from rope if heli is moving too fast
		_this spawn {
			params ["_player","_heli"];	
			while {_player getVariable ["AR_Is_Rappelling", false]} do {
				if(speed _heli > 150) then {
					if(isPlayer _player) then {
						["Moving too fast! You've lost grip of the rope.", false] call AR_Hint;
					};
					[_player] call AR_Rappel_Detach_Action;
				};
				sleep 2;
			};
		};
		

		
		while {true} do {
		
			_currentTime = diag_tickTime;
			_timeSinceLastUpdate = _currentTime - _lastTime;
			_lastTime = _currentTime;
			if(_timeSinceLastUpdate > 1) then {
				_timeSinceLastUpdate = 0;
			};

			_environmentWindVelocity = wind;
			_playerWindVelocity = _velocityVec vectorMultiply -1;
			_helicopterWindVelocity = (vectorUp _heli) vectorMultiply -30;
			_totalWindVelocity = _environmentWindVelocity vectorAdd _playerWindVelocity vectorAdd _helicopterWindVelocity;
			_totalWindForce = _totalWindVelocity vectorMultiply (9.8/53);

			_accelerationVec = _gravityAccelerationVec vectorAdd _totalWindForce;
			_velocityVec = _velocityVec vectorAdd ( _accelerationVec vectorMultiply _timeSinceLastUpdate );
			_newPosition = _lastPosition vectorAdd ( _velocityVec vectorMultiply _timeSinceLastUpdate );
			
			_heliPos = AGLtoASL (_heli modelToWorldVisual _rappelPoint);
			
			if(_newPosition distance _heliPos > _topRopeLength) then {
				_newPosition = (_heliPos) vectorAdd (( vectorNormalized ( (_heliPos) vectorFromTo _newPosition )) vectorMultiply _topRopeLength);
				_surfaceVector = ( vectorNormalized ( _newPosition vectorFromTo (_heliPos) ));
				_velocityVec = _velocityVec vectorAdd (( _surfaceVector vectorMultiply (_velocityVec vectorDotProduct _surfaceVector)) vectorMultiply -1);
			};

			_rappelDevice setPosWorld (_lastPosition vectorAdd ((_newPosition vectorDiff _lastPosition) vectorMultiply 6));
			
			_rappelDevice setVectorDir (vectorDir _player); 
			_player setPosWorld [_newPosition select 0, _newPosition select 1, (_newPosition select 2)-0.6];
			_player setVelocity [0,0,0];
			
			// Handle rappelling down rope
			if(_player getVariable ["AR_DECEND_PRESSED",false]) then {
				_decendSpeedMetersPerSecond = 3.5;
				if(_player getVariable ["AR_FAST_DECEND_PRESSED",false]) then {
					_decendSpeedMetersPerSecond = 5;
				};
				_decendSpeedMetersPerSecond = _decendSpeedMetersPerSecond + (_player getVariable ["AR_RANDOM_DECEND_SPEED_ADJUSTMENT",0]);
				_bottomRopeLength = _bottomRopeLength - (_timeSinceLastUpdate * _decendSpeedMetersPerSecond);
				_topRopeLength = _topRopeLength + (_timeSinceLastUpdate * _decendSpeedMetersPerSecond);
				ropeUnwind [_topRope, _decendSpeedMetersPerSecond, _topRopeLength - 0.5];
				ropeUnwind [_bottomRope, _decendSpeedMetersPerSecond, _bottomRopeLength];
			};
			
			// Fix player direction
			_dir = _dir + ((360/1000) * _dirSpinFactor);
			if(isPlayer _player) then {
				_currentDir = getDir _player;
				_minDir = (_dir - (_lookDirFreedom/2)) mod 360;
				_maxDir = (_dir + (_lookDirFreedom/2)) mod 360;
				_minDegreesToMax = 0;
				_minDegreesToMin = 0;
				if( _currentDir > _maxDir ) then {
					_minDegreesToMax = (_currentDir - _maxDir) min (360 - _currentDir + _maxDir);
				};
				if( _currentDir < _maxDir ) then {
					_minDegreesToMax = (_maxDir - _currentDir) min (360 - _maxDir + _currentDir);
				};
				if( _currentDir > _minDir ) then {
					_minDegreesToMin = (_currentDir - _minDir) min (360 - _currentDir + _minDir);
				};
				if( _currentDir < _minDir ) then {
					_minDegreesToMin = (_minDir - _currentDir) min (360 - _minDir + _currentDir);
				};
				if( _minDegreesToMin > _lookDirFreedom || _minDegreesToMax > _lookDirFreedom ) then {
					if( _minDegreesToMin < _minDegreesToMax ) then {
						_player setDir _minDir;
					} else {
						_player setDir _maxDir;
					};
				} else {
					_player setDir (_currentDir  + ((360/1000) * _dirSpinFactor));
				};
			} else {
				_player setDir _dir;
			};
			
			_lastPosition = _newPosition;
			
			if(((getPos _player) select 2 < 1 and !(isPlayer _player)) || !alive _player || vehicle _player != _player || _bottomRopeLength <= 1 || _player getVariable ["AR_Detach_Rope",false] ) exitWith {};
			//if(!alive _player || vehicle _player != _player || _bottomRopeLength <= 1 || _player getVariable ["AR_Detach_Rope",false] ) exitWith {};

			sleep 0.01;
		};
				
		if(_bottomRopeLength > 1 && alive _player && vehicle _player == _player) then {
		
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

			if(_player getVariable ["AR_Detach_Rope",false]) then {
				// Player detached from rope. Don't prevent damage 
				// if we didn't find a position on the ground
				if(count _intersectionASL == 0) then {
					_player allowDamage true;
				};	
			};
			
			// Allow damage if you get out of a heli with no engine on
			if(!isEngineOn _heli) then {
				_player allowDamage true;
			};
			
		};
		
		ropeDestroy _topRope;
		ropeDestroy _bottomRope;		
		deleteVehicle _anchor;
		deleteVehicle _rappelDevice;
		
		_player setVariable ["AR_Is_Rappelling",nil,true];
		_player setVariable ["AR_Rappelling_Vehicle", nil, true];
		_player setVariable ["AR_Detach_Rope",nil];
		
		if(_ropeKeyDownHandler != -1) then {			
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", _ropeKeyDownHandler];
		};
		
		if(_ropeKeyUpHandler != -1) then {			
			(findDisplay 46) displayRemoveEventHandler ["KeyUp", _ropeKeyUpHandler];
		};
		
		sleep 2;
		
		_player allowDamage true;	

	} else {
		[_this,"AR_Client_Rappel_From_Heli",_player] call AR_RemoteExec;
	};
};


AR_Enable_Rappelling_Animation = {
	params ["_player"];
	[_player,true] remoteExec ["AR_Enable_Rappelling_Animation_Client", 0];
};

AR_Current_Weapon_Type_Selected = {
	params ["_player"];
	if(currentWeapon _player == handgunWeapon _player) exitWith {"HANDGUN"};
	if(currentWeapon _player == primaryWeapon _player) exitWith {"PRIMARY"};
	if(currentWeapon _player == secondaryWeapon _player) exitWith {"SECONDARY"};
	"OTHER";
};

AR_Enable_Rappelling_Animation_Client = {
	params ["_player",["_globalExec",false]];
	
	if(local _player && _globalExec) exitWith {};
	
	if(local _player && !_globalExec) then {
		[[_player],"AR_Enable_Rappelling_Animation"] call AR_RemoteExecServer;
	};

	if(_player != player) then {
		_player enableSimulation false;
	};
	
	if(call AR_Has_Addon_Animations_Installed) then {		
		if([_player] call AR_Current_Weapon_Type_Selected == "HANDGUN") then {
			if(local _player) then {
				if(missionNamespace getVariable ["AR_DISABLE_SHOOTING_OVERRIDE",false]) then {
					_player switchMove "AR_01_Idle_Pistol_No_Actions";
				} else {
					_player switchMove "AR_01_Idle_Pistol";
				};
				_player setVariable ["AR_Animation_Move","AR_01_Idle_Pistol_No_Actions",true];
			} else {
				_player setVariable ["AR_Animation_Move","AR_01_Idle_Pistol_No_Actions"];			
			};
		} else {
			if(local _player) then {
				if(missionNamespace getVariable ["AR_DISABLE_SHOOTING_OVERRIDE",false]) then {
					_player switchMove "AR_01_Idle_No_Actions";
				} else {
					_player switchMove "AR_01_Idle";
				};
				_player setVariable ["AR_Animation_Move","AR_01_Idle_No_Actions",true];
			} else {
				_player setVariable ["AR_Animation_Move","AR_01_Idle_No_Actions"];
			};
		};
		if!(local _player) then {
			// Temp work around to avoid seeing other player as standing
			_player switchMove (_player getVariable ["AR_Animation_Move","HubSittingChairC_idle1"]);
			sleep 1;
			_player switchMove (_player getVariable ["AR_Animation_Move","HubSittingChairC_idle1"]);
			sleep 1;
			_player switchMove (_player getVariable ["AR_Animation_Move","HubSittingChairC_idle1"]);
			sleep 1;
			_player switchMove (_player getVariable ["AR_Animation_Move","HubSittingChairC_idle1"]);
		};
	} else {
		if(local _player) then {
			_player switchMove "HubSittingChairC_idle1";
			_player setVariable ["AR_Animation_Move","HubSittingChairC_idle1",true];
		} else {
			_player setVariable ["AR_Animation_Move","HubSittingChairC_idle1"];		
		};
	};

	_animationEventHandler = -1;
	if(local _player) then {
		_animationEventHandler = _player addEventHandler ["AnimChanged",{
			params ["_player","_animation"];
			if(call AR_Has_Addon_Animations_Installed) then {
				if((toLower _animation) find "ar_" < 0) then {
					if([_player] call AR_Current_Weapon_Type_Selected == "HANDGUN") then {
						_player switchMove "AR_01_Aim_Pistol";
						_player setVariable ["AR_Animation_Move","AR_01_Aim_Pistol_No_Actions",true];
					} else {
						_player switchMove "AR_01_Aim";
						_player setVariable ["AR_Animation_Move","AR_01_Aim_No_Actions",true];
					};
				} else {
					if(toLower _animation == "ar_01_aim") then {
						_player setVariable ["AR_Animation_Move","AR_01_Aim_No_Actions",true];
					};
					if(toLower _animation == "ar_01_idle") then {
						_player setVariable ["AR_Animation_Move","AR_01_Idle_No_Actions",true];
					};
					if(toLower _animation == "ar_01_aim_pistol") then {
						_player setVariable ["AR_Animation_Move","AR_01_Aim_Pistol_No_Actions",true];
					};
					if(toLower _animation == "ar_01_idle_pistol") then {
						_player setVariable ["AR_Animation_Move","AR_01_Idle_Pistol_No_Actions",true];
					};
				};
			} else {
				_player switchMove "HubSittingChairC_idle1";
				_player setVariable ["AR_Animation_Move","HubSittingChairC_idle1",true];
			};
		}];
	};
	
	if(!local _player) then {
		[_player] spawn {
			params ["_player"];
			private ["_currentState"];
			while {_player getVariable ["AR_Is_Rappelling",false]} do {
				_currentState = toLower animationState _player;
				_newState = toLower (_player getVariable ["AR_Animation_Move",""]);
				if!(call AR_Has_Addon_Animations_Installed) then {
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
	
	waitUntil {!(_player getVariable ["AR_Is_Rappelling",false])};
	
	if(_animationEventHandler != -1) then {
		_player removeEventHandler ["AnimChanged", _animationEventHandler];
	};
	
	_player switchMove "";	
	_player enableSimulation true;
	
};

AR_Rappel_Detach_Action = {
	params ["_player"];
	_player setVariable ["AR_Detach_Rope",true];
};

AR_Rappel_Detach_Action_Check = {
	params ["_player"];
	if!(_player getVariable ["AR_Is_Rappelling",false]) exitWith {false;};
	true;
};

AR_Rappel_From_Heli_Action = {
	params ["_player","_vehicle"];	
	if([_player, _vehicle] call AR_Rappel_From_Heli_Action_Check) then {
		[_player, _vehicle] call AR_Rappel_From_Heli;
	};
};

AR_Rappel_From_Heli_Action_Check = {
	params ["_player","_vehicle"];
	if!([_vehicle] call AR_Is_Supported_Vehicle) exitWith {false};
	if(((getPos _vehicle) select 2) < 5 ) exitWith {false};
	if(((getPos _vehicle) select 2) > 150 ) exitWith {false};
	if(driver _vehicle == _player && isEngineOn _vehicle) exitWith {false};
	if(speed _vehicle > 100) exitWith {false};
	true;
};

AR_Rappel_AI_Units_From_Heli_Action_Check = {
	params ["_player"];
	if(leader _player != _player) exitWith {false}; 
	_canRappelOne = false;
	{
		if(vehicle _x != _x && !isPlayer _x) then {
			if([_x, vehicle _x] call AR_Rappel_From_Heli_Action_Check) then {
				_canRappelOne = true;
			};
		};
	} forEach (units _player);
	_canRappelOne;
};

AR_Get_Corner_Points = {
	params ["_vehicle"];
	private ["_centerOfMass","_bbr","_p1","_p2","_rearCorner","_rearCorner2","_frontCorner","_frontCorner2"];
	private ["_maxWidth","_widthOffset","_maxLength","_lengthOffset","_widthFactor","_lengthFactor","_maxHeight","_heightOffset"];
	
	// Correct width and length factor for air
	_widthFactor = 0.5;
	_lengthFactor = 0.5;
	if(_vehicle isKindOf "Air") then {
		_widthFactor = 0.3;
	};
	if(_vehicle isKindOf "Helicopter") then {
		_widthFactor = 0.2;
		_lengthFactor = 0.45;
	};
	
	_centerOfMass = getCenterOfMass _vehicle;
	_bbr = boundingBoxReal _vehicle;
	_p1 = _bbr select 0;
	_p2 = _bbr select 1;
	_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
	_widthOffset = ((_maxWidth / 2) - abs ( _centerOfMass select 0 )) * _widthFactor;
	_maxLength = abs ((_p2 select 1) - (_p1 select 1));
	_lengthOffset = ((_maxLength / 2) - abs (_centerOfMass select 1 )) * _lengthFactor;
	_maxHeight = abs ((_p2 select 2) - (_p1 select 2));
	_heightOffset = _maxHeight/6;
	
	_rearCorner = [(_centerOfMass select 0) + _widthOffset, (_centerOfMass select 1) - _lengthOffset, (_centerOfMass select 2)+_heightOffset];
	_rearCorner2 = [(_centerOfMass select 0) - _widthOffset, (_centerOfMass select 1) - _lengthOffset, (_centerOfMass select 2)+_heightOffset];
	_frontCorner = [(_centerOfMass select 0) + _widthOffset, (_centerOfMass select 1) + _lengthOffset, (_centerOfMass select 2)+_heightOffset];
	_frontCorner2 = [(_centerOfMass select 0) - _widthOffset, (_centerOfMass select 1) + _lengthOffset, (_centerOfMass select 2)+_heightOffset];
	
	[_rearCorner,_rearCorner2,_frontCorner,_frontCorner2];
};

AR_SUPPORTED_VEHICLES = [
	"Helicopter",
	"VTOL_Base_F"
];

AR_Is_Supported_Vehicle = {
	params ["_vehicle","_isSupported"];
	_isSupported = false;
	if(not isNull _vehicle) then {
		{
			if(_vehicle isKindOf _x) then {
				_isSupported = true;
			};
		} forEach (missionNamespace getVariable ["AR_SUPPORTED_VEHICLES_OVERRIDE",AR_SUPPORTED_VEHICLES]);
	};
	_isSupported;
};

AR_Hint = {
    params ["_msg",["_isSuccess",true]];
    hint _msg;
};

AR_Hide_Object_Global = {
	params ["_obj"];
	if( _obj isKindOf "Land_Can_V2_F" || _obj isKindOf "B_static_AA_F" || _obj isKindOf "ACE_O_T_SpottingScope") then {
		hideObjectGlobal _obj;
	};
};

AR_Add_Player_Actions = {
	params ["_player"];

	_player addAction [localize "STR_Rappel_Self", { 
		[player, vehicle player] call AR_Rappel_From_Heli_Action;
	}, nil, 0, false, true, "", "[player, vehicle player] call AR_Rappel_From_Heli_Action_Check"];
	
	_player addAction [localize "STR_Rappel_AI_Units", { 
		{
			if(!isPlayer _x) then {
				sleep 1;
				[_x, vehicle _x] call AR_Rappel_From_Heli_Action;
			};
		} forEach (units player);
	}, nil, 0, false, true, "", "[player] call AR_Rappel_AI_Units_From_Heli_Action_Check"];
	
	_player addAction [localize "STR_Detach_Rappel_Device", { 
		[player] call AR_Rappel_Detach_Action;
	}, nil, 0, false, true, "", "[player] call AR_Rappel_Detach_Action_Check"];
	
	_player addEventHandler ["Respawn", {
		player setVariable ["AR_Actions_Loaded",false];
	}];
	
};

if(!isDedicated) then {
	[] spawn {
		while {true} do {
			if(!isNull player && isPlayer player) then {
				if!(player getVariable ["AR_Actions_Loaded",false] ) then {
					[player] call AR_Add_Player_Actions;
					player setVariable ["AR_Actions_Loaded",true];
				};
			};
			sleep 5;
		};
	};
};

AR_RemoteExec = {
	params ["_params","_functionName","_target",["_isCall",false]];
	if(_isCall) then {
		_params remoteExecCall [_functionName, _target];
	} else {
		_params remoteExec [_functionName, _target];
	};
};

AR_RemoteExecServer = {
	params ["_params","_functionName",["_isCall",false]];
	if(_isCall) then {
		_params remoteExecCall [_functionName, 2];
	} else {
		_params remoteExec [_functionName, 2];
	};
};


diag_log "Advanced Rappelling Loaded";

};

publicVariable "AR_Advanced_Rappelling_Install";

[] call AR_Advanced_Rappelling_Install;
// Install Advanced Rappelling on all clients (plus JIP) //
remoteExecCall ["AR_Advanced_Rappelling_Install", -2,true];

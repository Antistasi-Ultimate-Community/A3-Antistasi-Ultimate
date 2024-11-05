// #include "\a3\editor_f\Data\Scripts\dikCodes.h"
#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\definedikcodes.inc"
FIX_LINE_NUMBERS()

if ((missionNamespace getVariable ["A3U_setting_enableAdvancedSlingloading", true]) isEqualTo false) exitWith {Info("Skipped loading advanced slingloading")};

// prevent the old advanced sling loading from pushing to this client
ASL_ROPE_INIT = true;
publicVariable "ASL_ROPE_INIT";
ASL_Advanced_Sling_Loading_Install = {};


ASLR_Rope_Get_Lift_Capability = {
	params ["_vehicle"];
	private ["_slingLoadMaxCargoMass"];
	_slingLoadMaxCargoMass = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "slingLoadMaxCargoMass");
	if(_slingLoadMaxCargoMass <= 0) then {
		_slingLoadMaxCargoMass = 4000;
	};
	_slingLoadMaxCargoMass;	
};

ASLR_SLING_LOAD_POINT_CLASS_HEIGHT_OFFSET = [  
	["All", [-0.05, -0.05, -0.05]],  
	["CUP_CH47F_base", [-0.05, -2, -0.05]],  
	["CUP_AW159_Unarmed_Base", [-0.05, -0.06, -0.05]],
	["RHS_CH_47F", [-0.75, -2.6, -0.75]], 
	["rhsusf_CH53E_USMC", [-0.8, -1, -1.1]], 
	["rhsusf_CH53E_USMC_D", [-0.8, -1, -1.1]] 
];

ASLR_Get_Sling_Load_Points = {
	params ["_vehicle"];
	private ["_slingLoadPointsArray","_cornerPoints","_rearCenterPoint","_vehicleUnitVectorUp"];
	private ["_slingLoadPoints","_modelPoint","_modelPointASL","_surfaceIntersectStartASL","_surfaceIntersectEndASL","_surfaces","_intersectionASL","_intersectionObject"];
	_slingLoadPointsArray = [];
	_cornerPoints = [_vehicle] call ASLR_Get_Corner_Points;
	_frontCenterPoint = (((_cornerPoints select 2) vectorDiff (_cornerPoints select 3)) vectorMultiply 0.5) vectorAdd (_cornerPoints select 3);
	_rearCenterPoint = (((_cornerPoints select 0) vectorDiff (_cornerPoints select 1)) vectorMultiply 0.5) vectorAdd (_cornerPoints select 1);
	_rearCenterPoint = ((_frontCenterPoint vectorDiff _rearCenterPoint) vectorMultiply 0.2) vectorAdd _rearCenterPoint;
	_frontCenterPoint = ((_rearCenterPoint vectorDiff _frontCenterPoint) vectorMultiply 0.2) vectorAdd _frontCenterPoint;
	_middleCenterPoint = ((_frontCenterPoint vectorDiff _rearCenterPoint) vectorMultiply 0.5) vectorAdd _rearCenterPoint;
	_vehicleUnitVectorUp = vectorNormalized (vectorUp _vehicle);
	
	_slingLoadPointHeightOffset = 0;
	{
		if(_vehicle isKindOf (_x select 0)) then {
			_slingLoadPointHeightOffset = (_x select 1);
		};
	} forEach ASLR_SLING_LOAD_POINT_CLASS_HEIGHT_OFFSET;
	
	_slingLoadPoints = [];
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
			_intersectionASL = _intersectionASL vectorAdd (( _surfaceIntersectStartASL vectorFromTo _surfaceIntersectEndASL ) vectorMultiply (_slingLoadPointHeightOffset select (count _slingLoadPoints)));
			_slingLoadPoints pushBack (_vehicle worldToModelVisual (ASLToAGL _intersectionASL));
		} else {
			_slingLoadPoints pushBack [];
		};
	} forEach [_frontCenterPoint, _middleCenterPoint, _rearCenterPoint];
	
	if(count (_slingLoadPoints select 1) > 0) then {
		_slingLoadPointsArray pushBack [_slingLoadPoints select 1];
		if(count (_slingLoadPoints select 0) > 0 && count (_slingLoadPoints select 2) > 0 ) then {
			if( ((_slingLoadPoints select 0) distance (_slingLoadPoints select 2)) > 3 ) then {
				_slingLoadPointsArray pushBack [_slingLoadPoints select 0,_slingLoadPoints select 2];
				if( ((_slingLoadPoints select 0) distance (_slingLoadPoints select 1)) > 3 ) then {
					_slingLoadPointsArray pushBack [_slingLoadPoints select 0,_slingLoadPoints select 1,_slingLoadPoints select 2];
				};	
			};	
		};
	};
	_slingLoadPointsArray;
};

ASLR_Rope_Set_Mass = {
	private ["_obj","_mass"];
	_obj = [_this,0] call BIS_fnc_param;
	_mass = [_this,1] call BIS_fnc_param;
	_obj setMass _mass;
};

ASLR_Rope_Adjust_Mass = {
	params ["_obj","_heli",["_ropes",[]]];
	private ["_mass","_lift","_originalMass","_heavyLiftMinLift"];
	_lift = [_heli] call ASLR_Rope_Get_Lift_Capability;
	_originalMass = getMass _obj;
	_heavyLiftMinLift = missionNamespace getVariable ["ASLR_HEAVY_LIFTING_MIN_LIFT_OVERRIDE",5000];
	if( _originalMass >= ((_lift)*0.8) && _lift >= _heavyLiftMinLift ) then {
		private ["_originalMassSet","_ends","_endDistance","_ropeLength"];
		_originalMassSet = (getMass _obj) == _originalMass;
		while { _obj in (ropeAttachedObjects _heli) && _originalMassSet } do {
			{
				_ends = ropeEndPosition _x;
				_endDistance = (_ends select 0) distance (_ends select 1);
				_ropeLength = ropeLength _x;
				if((_ropeLength - 2) <= _endDistance && ((position _heli) select 2) > 0 ) then {
					[[_obj, ((_lift)*0.8)],"ASLR_Rope_Set_Mass",_obj,true] call ASLR_RemoteExec;
					_originalMassSet = false;
				};
			} forEach _ropes;
			sleep 0.1;
		};
		while { _obj in (ropeAttachedObjects _heli) } do {
			sleep 0.5;
		};
		[[_obj, _originalMass],"ASLR_Rope_Set_Mass",_obj,true] call ASLR_RemoteExec;
	};	
};

/*
 Constructs an array of all active rope indexes and position labels (e.g. [[rope index,"Front"],[rope index,"Rear"]])
 for a specified vehicle
*/
ASLR_Get_Active_Ropes = {
	params ["_vehicle"];
	private ["_activeRopes","_existingRopes","_ropeLabelSets","_ropeIndex","_totalExistingRopes","_ropeLabels"];
	_activeRopes = [];
	_existingRopes = _vehicle getVariable ["ASLR_Ropes",[]];
	_ropeLabelSets = [["Center"],["Front","Rear"],["Front","Center","Rear"]];
	_ropeIndex = 0;
	_totalExistingRopes = count _existingRopes;
	{
		if(count _x > 0) then {
			_ropeLabels = _ropeLabelSets select (_totalExistingRopes - 1);
			_activeRopes pushBack [_ropeIndex,_ropeLabels select _ropeIndex];
		};
		_ropeIndex = _ropeIndex + 1;
	} forEach _existingRopes;
	_activeRopes;
};

/*
 Constructs an array of all inactive rope indexes and position labels (e.g. [[rope index,"Front"],[rope index,"Rear"]])
 for a specified vehicle
*/
ASLR_Get_Inactive_Ropes = {
	params ["_vehicle"];
	private ["_inactiveRopes","_existingRopes","_ropeLabelSets","_ropeIndex","_totalExistingRopes","_ropeLabels"];
	_inactiveRopes = [];
	_existingRopes = _vehicle getVariable ["ASLR_Ropes",[]];
	_ropeLabelSets = [["Center"],["Front","Rear"],["Front","Center","Rear"]];
	_ropeIndex = 0;
	_totalExistingRopes = count _existingRopes;
	{
		if(count _x == 0) then {
			_ropeLabels = _ropeLabelSets select (_totalExistingRopes - 1);
			_inactiveRopes pushBack [_ropeIndex,_ropeLabels select _ropeIndex];
		};
		_ropeIndex = _ropeIndex + 1;
	} forEach _existingRopes;
	_inactiveRopes;
};

ASLR_Get_Active_Ropes_With_Cargo = {
	params ["_vehicle"];
	private ["_activeRopesWithCargo","_existingCargo","_activeRopes","_cargo"];
	_activeRopesWithCargo = [];
	_existingCargo = _vehicle getVariable ["ASLR_Cargo",[]];
	_activeRopes = _this call ASLR_Get_Active_Ropes;
	{
		_cargo = _existingCargo select (_x select 0);
		if(!isNull _cargo) then {
			_activeRopesWithCargo pushBack _x;
		};
	} forEach _activeRopes;
	_activeRopesWithCargo;
};

ASLR_Get_Active_Ropes_Without_Cargo = {
	params ["_vehicle"];
	private ["_activeRopesWithoutCargo","_existingCargo","_activeRopes","_cargo"];
	_activeRopesWithoutCargo = [];
	_existingCargo = _vehicle getVariable ["ASLR_Cargo",[]];
	_activeRopes = _this call ASLR_Get_Active_Ropes;
	{
		_cargo = _existingCargo select (_x select 0);
		if(isNull _cargo) then {
			_activeRopesWithoutCargo pushBack _x;
		};
	} forEach _activeRopes;
	_activeRopesWithoutCargo;
};

ASLR_Get_Ropes = {
	params ["_vehicle","_ropeIndex"];
	private ["_allRopes","_selectedRopes"];
	_selectedRopes = [];
	_allRopes = _vehicle getVariable ["ASLR_Ropes",[]];
	if(count _allRopes > _ropeIndex) then {
		_selectedRopes = _allRopes select _ropeIndex;
	};
	_selectedRopes;
};


ASLR_Get_Ropes_Count = {
	params ["_vehicle"];
	count (_vehicle getVariable ["ASLR_Ropes",[]]);
};

ASLR_Get_Cargo = {
	params ["_vehicle","_ropeIndex"];
	private ["_allCargo","_selectedCargo"];
	_selectedCargo = objNull;
	_allCargo = _vehicle getVariable ["ASLR_Cargo",[]];
	if(count _allCargo > _ropeIndex) then {
		_selectedCargo = _allCargo select _ropeIndex;
	};
	_selectedCargo;
};

ASLR_Get_Ropes_And_Cargo = {
	params ["_vehicle","_ropeIndex"];
	private ["_selectedCargo","_selectedRopes"];
	_selectedCargo = (_this call ASLR_Get_Cargo);
	_selectedRopes = (_this call ASLR_Get_Ropes);
	[_selectedRopes, _selectedCargo];
};

ASLR_Show_Select_Ropes_Menu = {
	params ["_title", "_functionName","_ropesIndexAndLabelArray",["_ropesLabel","Ropes"]];
	ASLR_Show_Select_Ropes_Menu_Array = [[_title,false]];
	{
		ASLR_Show_Select_Ropes_Menu_Array pushBack [ (_x select 1) + " " + _ropesLabel, [0], "", -5, [["expression", "["+(str (_x select 0))+"] call " + _functionName]], "1", "1"];
	} forEach _ropesIndexAndLabelArray;
	ASLR_Show_Select_Ropes_Menu_Array pushBack ["All " + _ropesLabel, [0], "", -5, [["expression", "{ [_x] call " + _functionName + " } forEach [0,1,2];"]], "1", "1"];
	showCommandingMenu "";
	showCommandingMenu "#USER:ASLR_Show_Select_Ropes_Menu_Array";
};
	
ASLR_Extend_Ropes = {
	params ["_vehicle","_player",["_ropeIndex",0]];
	if(local _vehicle) then {
		private ["_existingRopes"];
		_existingRopes = [_vehicle,_ropeIndex] call ASLR_Get_Ropes;
		if(count _existingRopes > 0) then {
			_ropeLength = ropeLength (_existingRopes select 0);
			if(_ropeLength <= 100 ) then {
				{
					ropeUnwind [_x, 3, 5, true];
				} forEach _existingRopes;
			};
		};
	} else {
		[_this,"ASLR_Extend_Ropes",_vehicle,true] call ASLR_RemoteExec;
	};
};

ASLR_Extend_Ropes_Action = {
	private ["_vehicle"];
	_vehicle = vehicle player;
	if([_vehicle] call ASLR_Can_Extend_Ropes) then {
		private ["_activeRopes"];
		_activeRopes = [_vehicle] call ASLR_Get_Active_Ropes;
		if(count _activeRopes > 1) then {
			player setVariable ["ASLR_Extend_Index_Vehicle", _vehicle];
			["Extend Cargo Ropes","ASLR_Extend_Ropes_Index_Action",_activeRopes] call ASLR_Show_Select_Ropes_Menu;
		} else {
			if(count _activeRopes == 1) then {
				[_vehicle,player,(_activeRopes select 0) select 0] call ASLR_Extend_Ropes;
			};
		};
	};
};

ASLR_Extend_Ropes_Index_Action = {
	params ["_ropeIndex"];
	private ["_vehicle","_canDeployRopes"];
	_vehicle = player getVariable ["ASLR_Extend_Index_Vehicle", objNull];
	if(_ropeIndex >= 0 && !isNull _vehicle && [_vehicle] call ASLR_Can_Extend_Ropes) then {
		[_vehicle,player,_ropeIndex] call ASLR_Extend_Ropes;
	};
};

ASLR_Extend_Ropes_Action_Check = {
	if(vehicle player == player) exitWith {false};
	[vehicle player] call ASLR_Can_Extend_Ropes;
};

ASLR_Can_Extend_Ropes = {
	params ["_vehicle"];
	private ["_existingRopes","_activeRopes"];
	if(player distance _vehicle > 10) exitWith { false };
	if!([_vehicle] call ASLR_Is_Supported_Vehicle) exitWith { false };
	_existingRopes = _vehicle getVariable ["ASLR_Ropes",[]];
	if((count _existingRopes) == 0) exitWith { false };
	_activeRopes = [_vehicle] call ASLR_Get_Active_Ropes;
	if((count _activeRopes) == 0) exitWith { false };
	true;
};

ASLR_Shorten_Ropes = {
	params ["_vehicle","_player",["_ropeIndex",0]];
	if(local _vehicle) then {
		private ["_existingRopes"];
		_existingRopes = [_vehicle,_ropeIndex] call ASLR_Get_Ropes;
		if(count _existingRopes > 0) then {
			_ropeLength = ropeLength (_existingRopes select 0);
			if(_ropeLength <= 2 ) then {
				_this call ASLR_Release_Cargo;
			} else {
				{
					if(_ropeLength >= 10) then {
						ropeUnwind [_x, 3, -5, true];
					} else {
						ropeUnwind [_x, 3, -1, true];
					};
				} forEach _existingRopes;
			};
		};
	} else {
		[_this,"ASLR_Shorten_Ropes",_vehicle,true] call ASLR_RemoteExec;
	};
};

ASLR_Shorten_Ropes_Action = {
	private ["_vehicle"];
	_vehicle = vehicle player;
	if([_vehicle] call ASLR_Can_Shorten_Ropes) then {
		private ["_activeRopes"];
		_activeRopes = [_vehicle] call ASLR_Get_Active_Ropes;
		if(count _activeRopes > 1) then {
			player setVariable ["ASLR_Shorten_Index_Vehicle", _vehicle];
			["Shorten Cargo Ropes","ASLR_Shorten_Ropes_Index_Action",_activeRopes] call ASLR_Show_Select_Ropes_Menu;
		} else {
			if(count _activeRopes == 1) then {
				[_vehicle,player,(_activeRopes select 0) select 0] call ASLR_Shorten_Ropes;
			};
		};
	};
};

ASLR_Shorten_Ropes_Index_Action = {
	params ["_ropeIndex"];
	private ["_vehicle"];
	_vehicle = player getVariable ["ASLR_Shorten_Index_Vehicle", objNull];
	if(_ropeIndex >= 0 && !isNull _vehicle && [_vehicle] call ASLR_Can_Shorten_Ropes) then {
		[_vehicle,player,_ropeIndex] call ASLR_Shorten_Ropes;
	};
};

ASLR_Shorten_Ropes_Action_Check = {
	if(vehicle player == player) exitWith {false};
	[vehicle player] call ASLR_Can_Shorten_Ropes;
};

ASLR_Can_Shorten_Ropes = {
	params ["_vehicle"];
	private ["_existingRopes","_activeRopes"];
	if(player distance _vehicle > 10) exitWith { false };
	if!([_vehicle] call ASLR_Is_Supported_Vehicle) exitWith { false };
	_existingRopes = _vehicle getVariable ["ASLR_Ropes",[]];
	if((count _existingRopes) == 0) exitWith { false };
	_activeRopes = [_vehicle] call ASLR_Get_Active_Ropes;
	if((count _activeRopes) == 0) exitWith { false };
	true;
};

ASLR_Release_Cargo = {
	params ["_vehicle","_player",["_ropeIndex",0]];
	if(local _vehicle) then {
		private ["_existingRopesAndCargo","_existingRopes","_existingCargo","_allCargo"];
		_existingRopesAndCargo = [_vehicle,_ropeIndex] call ASLR_Get_Ropes_And_Cargo;
		_existingRopes = _existingRopesAndCargo select 0;
		_existingCargo = _existingRopesAndCargo select 1; 
		{
			_existingCargo ropeDetach _x;
		} forEach _existingRopes;
		_allCargo = _vehicle getVariable ["ASLR_Cargo",[]];
		_allCargo set [_ropeIndex,objNull];
		_vehicle setVariable ["ASLR_Cargo",_allCargo, true];
		_this call ASLR_Retract_Ropes;
	} else {
		[_this,"ASLR_Release_Cargo",_vehicle,true] call ASLR_RemoteExec;
	};
};
	
ASLR_Release_Cargo_Action = {
	private ["_vehicle"];
	_vehicle = vehicle player;
	if([_vehicle] call ASLR_Can_Release_Cargo) then {
		private ["_activeRopes"];
		_activeRopes = [_vehicle] call ASLR_Get_Active_Ropes_With_Cargo;
		if(count _activeRopes > 1) then {
			player setVariable ["ASLR_Release_Cargo_Index_Vehicle", _vehicle];
			["Release Cargo","ASLR_Release_Cargo_Index_Action",_activeRopes,"Cargo"] call ASLR_Show_Select_Ropes_Menu;
		} else {
			if(count _activeRopes == 1) then {
				[_vehicle,player,(_activeRopes select 0) select 0] call ASLR_Release_Cargo;
			};
		};
	};
};

ASLR_Release_Cargo_Index_Action = {
	params ["_ropesIndex"];
	private ["_vehicle"];
	_vehicle = player getVariable ["ASLR_Release_Cargo_Index_Vehicle", objNull];
	if(_ropesIndex >= 0 && !isNull _vehicle && [_vehicle] call ASLR_Can_Release_Cargo) then {
		[_vehicle,player,_ropesIndex] call ASLR_Release_Cargo;
	};
};

ASLR_Release_Cargo_Action_Check = {
	if(vehicle player == player) exitWith {false};
	[vehicle player] call ASLR_Can_Release_Cargo;
};

ASLR_Can_Release_Cargo = {
	params ["_vehicle"];
	private ["_existingRopes","_activeRopes"];
	if(player distance _vehicle > 10) exitWith { false };
	if!([_vehicle] call ASLR_Is_Supported_Vehicle) exitWith { false };
	_existingRopes = _vehicle getVariable ["ASLR_Ropes",[]];
	if((count _existingRopes) == 0) exitWith { false };
	_activeRopes = [_vehicle] call ASLR_Get_Active_Ropes_With_Cargo;
	if((count _activeRopes) == 0) exitWith { false };
	true;
};

ASLR_Retract_Ropes = {
	params ["_vehicle","_player",["_ropeIndex",0]];
	if(local _vehicle) then {
		private ["_existingRopesAndCargo","_existingRopes","_existingCargo","_allRopes","_activeRopes"];
		_existingRopesAndCargo = [_vehicle,_ropeIndex] call ASLR_Get_Ropes_And_Cargo;
		_existingRopes = _existingRopesAndCargo select 0;
		_existingCargo = _existingRopesAndCargo select 1; 
		if(isNull _existingCargo) then {
			_this call ASLR_Drop_Ropes;
			{
				[_x,_vehicle] spawn {
					params ["_rope","_vehicle"];
					private ["_count"];
					_count = 0;
					ropeUnwind [_rope, 3, 0];
					while {(!ropeUnwound _rope) && _count < 20} do {
						sleep 1;
						_count = _count + 1;
					};
					ropeDestroy _rope;
				};
			} forEach _existingRopes;
			_allRopes = _vehicle getVariable ["ASLR_Ropes",[]];
			_allRopes set [_ropeIndex,[]];
			_vehicle setVariable ["ASLR_Ropes",_allRopes,true];
		};
		_activeRopes = [_vehicle] call ASLR_Get_Active_Ropes;
		if(count _activeRopes == 0) then {
			_vehicle setVariable ["ASLR_Ropes",nil,true];
		};
	} else {
		[_this,"ASLR_Retract_Ropes",_vehicle,true] call ASLR_RemoteExec;
	};
};

ASLR_Retract_Ropes_Action = {
	private ["_vehicle","_canRetractRopes"];
	if(vehicle player == player) then {
		_vehicle = cursorTarget;
	} else {
		_vehicle = vehicle player;
	};
	if([_vehicle] call ASLR_Can_Retract_Ropes) then {
		private ["_activeRopes"];
		_activeRopes = [_vehicle] call ASLR_Get_Active_Ropes_Without_Cargo;
		if(count _activeRopes > 1) then {
			player setVariable ["ASLR_Retract_Ropes_Index_Vehicle", _vehicle];
			["Retract Cargo Ropes","ASLR_Retract_Ropes_Index_Action",_activeRopes] call ASLR_Show_Select_Ropes_Menu;
		} else {
			if(count _activeRopes == 1) then {
				[_vehicle,player,(_activeRopes select 0) select 0] call ASLR_Retract_Ropes;
			};
		};
	};
};

ASLR_Retract_Ropes_Index_Action = {
	params ["_ropesIndex"];
	private ["_vehicle"];
	_vehicle = player getVariable ["ASLR_Retract_Ropes_Index_Vehicle", objNull];
	if(_ropesIndex >= 0 && !isNull _vehicle && [_vehicle] call ASLR_Can_Retract_Ropes) then {
		[_vehicle,player,_ropesIndex] call ASLR_Retract_Ropes;
	};
};

ASLR_Retract_Ropes_Action_Check = {
	if(vehicle player == player) then {
		[cursorTarget] call ASLR_Can_Retract_Ropes;
	} else {
		[vehicle player] call ASLR_Can_Retract_Ropes;
	};
};

ASLR_Can_Retract_Ropes = {
	params ["_vehicle"];
	private ["_existingRopes","_activeRopes"];
	if(player distance _vehicle > 30) exitWith { false };
	if!([_vehicle] call ASLR_Is_Supported_Vehicle) exitWith { false };
	_existingRopes = _vehicle getVariable ["ASLR_Ropes",[]];
	if((count _existingRopes) == 0) exitWith { false };
	_activeRopes = [_vehicle] call ASLR_Get_Active_Ropes_Without_Cargo;
	if((count _activeRopes) == 0) exitWith { false };
	true;
};

ASLR_Deploy_Ropes = {
	params ["_vehicle","_player",["_cargoCount",1],["_ropeLength",15]];
	if(local _vehicle) then {
		private ["_existingRopes","_cargoRopes","_startLength","_slingLoadPoints"];
		_slingLoadPoints = [_vehicle] call ASLR_Get_Sling_Load_Points;
		_existingRopes = _vehicle getVariable ["ASLR_Ropes",[]];
		if(count _existingRopes == 0) then {
			if(count _slingLoadPoints == 0) exitWith {
				[["Vehicle doesn't support cargo ropes", false],"ASLR_Hint",_player] call ASLR_RemoteExec;
			};
			if(count _slingLoadPoints < _cargoCount) exitWith {
				[["Vehicle doesn't support " + _cargoCount + " cargo ropes", false],"ASLR_Hint",_player] call ASLR_RemoteExec;
			};
			_cargoRopes = [];
			_cargo = [];
			for "_i" from 0 to (_cargoCount-1) do
			{
				_cargoRopes pushBack [];
				_cargo pushBack objNull;
			};
			_vehicle setVariable ["ASLR_Ropes",_cargoRopes,true];
			_vehicle setVariable ["ASLR_Cargo",_cargo,true];
			for "_i" from 0 to (_cargoCount-1) do
			{
				[_vehicle,_player,_i] call ASLR_Deploy_Ropes_Index;
			};
		} else {
			[["Vehicle already has cargo ropes deployed", false],"ASLR_Hint",_player] call ASLR_RemoteExec;
		};
	} else {
		[_this,"ASLR_Deploy_Ropes",_vehicle,true] call ASLR_RemoteExec;
	};
};

ASLR_Deploy_Ropes_Index = {
	params ["_vehicle","_player",["_ropesIndex",0],["_ropeLength",15]];
	if(local _vehicle) then {
		private ["_existingRopes","_existingRopesCount","_allRopes"];
		_existingRopes = [_vehicle,_ropesIndex] call ASLR_Get_Ropes;
		_existingRopesCount = [_vehicle] call ASLR_Get_Ropes_Count;
		if(count _existingRopes == 0) then {
			_slingLoadPoints = [_vehicle] call ASLR_Get_Sling_Load_Points;
			_cargoRopes = [];
			_cargoRopes pushBack ropeCreate [_vehicle, (_slingLoadPoints select (_existingRopesCount - 1)) select _ropesIndex, 0]; 
			_cargoRopes pushBack ropeCreate [_vehicle, (_slingLoadPoints select (_existingRopesCount - 1)) select _ropesIndex, 0]; 
			_cargoRopes pushBack ropeCreate [_vehicle, (_slingLoadPoints select (_existingRopesCount - 1)) select _ropesIndex, 0]; 
			_cargoRopes pushBack ropeCreate [_vehicle, (_slingLoadPoints select (_existingRopesCount - 1)) select _ropesIndex, 0]; 
			{
				ropeUnwind [_x, 5, _ropeLength];
			} forEach _cargoRopes;
			_allRopes = _vehicle getVariable ["ASLR_Ropes",[]];
			_allRopes set [_ropesIndex,_cargoRopes];
			_vehicle setVariable ["ASLR_Ropes",_allRopes,true];
		};
	} else {
		[_this,"ASLR_Deploy_Ropes_Index",_vehicle,true] call ASLR_RemoteExec;
	};
};

ASLR_Deploy_Ropes_Action = {
	private ["_vehicle","_canDeployRopes"];
	if(vehicle player == player) then {
		_vehicle = cursorTarget;
	} else {
		_vehicle = vehicle player;
	};
	if([_vehicle] call ASLR_Can_Deploy_Ropes) then {
	
		_canDeployRopes = true;
		
		if!(missionNamespace getVariable ["ASLR_LOCKED_VEHICLES_ENABLED",false]) then {
			if( locked _vehicle > 1 ) then {
				["Cannot deploy cargo ropes from locked vehicle",false] call ASLR_Hint;
				_canDeployRopes = false;
			};
		};
		
		if(_canDeployRopes) then {
			
			_inactiveRopes = [_vehicle] call ASLR_Get_Inactive_Ropes;
			
			if(count _inactiveRopes > 0) then {
				
				if(count _inactiveRopes > 1) then {
					player setVariable ["ASLR_Deploy_Ropes_Index_Vehicle", _vehicle];	
					["Deploy Cargo Ropes","ASLR_Deploy_Ropes_Index_Action",_inactiveRopes] call ASLR_Show_Select_Ropes_Menu;
				} else {
					[_vehicle,player,(_inactiveRopes select 0) select 0] call ASLR_Deploy_Ropes_Index;
				};
			
			} else {
			
				_slingLoadPoints = [_vehicle] call ASLR_Get_Sling_Load_Points;
				if(count _slingLoadPoints > 1) then {
					player setVariable ["ASLR_Deploy_Count_Vehicle", _vehicle];
					ASLR_Deploy_Ropes_Count_Menu = [
							["Deploy Ropes",false]
					];
					ASLR_Deploy_Ropes_Count_Menu pushBack ["For Single Cargo", [0], "", -5, [["expression", "[1] call ASLR_Deploy_Ropes_Count_Action"]], "1", "1"];
					if((count _slingLoadPoints) > 1) then {
						ASLR_Deploy_Ropes_Count_Menu pushBack ["For Double Cargo", [0], "", -5, [["expression", "[2] call ASLR_Deploy_Ropes_Count_Action"]], "1", "1"];
					};
					if((count _slingLoadPoints) > 2) then {
						ASLR_Deploy_Ropes_Count_Menu pushBack ["For Triple Cargo", [0], "", -5, [["expression", "[3] call ASLR_Deploy_Ropes_Count_Action"]], "1", "1"];
					};
					showCommandingMenu "";
					showCommandingMenu "#USER:ASLR_Deploy_Ropes_Count_Menu";
				} else {			
					[_vehicle,player] call ASLR_Deploy_Ropes;
				};
				
			};
			
		};
	
	};
};

ASLR_Deploy_Ropes_Index_Action = {
	params ["_ropesIndex"];
	private ["_vehicle"];
	_vehicle = player getVariable ["ASLR_Deploy_Ropes_Index_Vehicle", objNull];
	if(_ropesIndex >= 0 && !isNull _vehicle && [_vehicle] call ASLR_Can_Deploy_Ropes) then {
		[_vehicle,player,_ropesIndex] call ASLR_Deploy_Ropes_Index;
	};
};

ASLR_Deploy_Ropes_Count_Action = {
	params ["_count"];
	private ["_vehicle","_canDeployRopes"];
	_vehicle = player getVariable ["ASLR_Deploy_Count_Vehicle", objNull];
	if(_count > 0 && !isNull _vehicle && [_vehicle] call ASLR_Can_Deploy_Ropes) then {
		[_vehicle,player,_count] call ASLR_Deploy_Ropes;
	};
};

ASLR_Deploy_Ropes_Action_Check = {
	if(vehicle player == player) then {
		[cursorTarget] call ASLR_Can_Deploy_Ropes;
	} else {
		[vehicle player] call ASLR_Can_Deploy_Ropes;
	};
};

ASLR_Can_Deploy_Ropes = {
	params ["_vehicle"];
	private ["_existingRopes","_activeRopes"];
	if(player distance _vehicle > 10) exitWith { false };
	if!([_vehicle] call ASLR_Is_Supported_Vehicle) exitWith { false };
	_existingVehicle = player getVariable ["ASLR_Ropes_Vehicle", []];
	if(count _existingVehicle > 0) exitWith { false };
	_existingRopes = _vehicle getVariable ["ASLR_Ropes",[]];
	if((count _existingRopes) == 0) exitWith { true };
	_activeRopes = [_vehicle] call ASLR_Get_Active_Ropes;
	if((count _existingRopes) > 0 && (count _existingRopes) == (count _activeRopes)) exitWith { false };
	true;
};

ASLR_Get_Corner_Points = {
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


ASLR_Attach_Ropes = {
	params ["_cargo","_player"];
	_vehicleWithIndex = _player getVariable ["ASLR_Ropes_Vehicle", [objNull,0]];
	_vehicle = _vehicleWithIndex select 0;
	_heliOwner = owner _vehicle;
	_cargo setOwner _heliOwner;
	if(!isNull _vehicle) then {
		if(local _vehicle) then {
			private ["_ropes","_attachmentPoints","_objDistance","_ropeLength","_allCargo"];
			_ropes = [_vehicle,(_vehicleWithIndex select 1)] call ASLR_Get_Ropes;
			if(count _ropes == 4) then {
				_attachmentPoints = [_cargo] call ASLR_Get_Corner_Points;
				_ropeLength = (ropeLength (_ropes select 0));
				_objDistance = (_cargo distance _vehicle) + 2;
				if( _objDistance > _ropeLength ) then {
					[["The cargo ropes are too short. Move vehicle closer.", false],"ASLR_Hint",_player] call ASLR_RemoteExec;
				} else {		
					// [_vehicle,_player] call ASLR_Drop_Ropes;
					[_vehicle,_player,(_vehicleWithIndex select 1)] call ASLR_Drop_Ropes;
					[_cargo, _attachmentPoints select 0, [0,0,-1]] ropeAttachTo (_ropes select 0);
					[_cargo, _attachmentPoints select 1, [0,0,-1]] ropeAttachTo (_ropes select 1);
					[_cargo, _attachmentPoints select 2, [0,0,-1]] ropeAttachTo (_ropes select 2);
					[_cargo, _attachmentPoints select 3, [0,0,-1]] ropeAttachTo (_ropes select 3);
					_allCargo = _vehicle getVariable ["ASLR_Cargo",[]];
					_allCargo set [(_vehicleWithIndex select 1),_cargo];
					_vehicle setVariable ["ASLR_Cargo",_allCargo, true];
					if(missionNamespace getVariable ["ASLR_HEAVY_LIFTING_ENABLED",true]) then {
						[_cargo, _vehicle, _ropes] spawn ASLR_Rope_Adjust_Mass;		
					};				
				};
			};
		} else {
			[_this,"ASLR_Attach_Ropes",_vehicle,true] call ASLR_RemoteExec;
		};
	};
};

ASLR_Attach_Ropes_Action = {
	private ["_vehicle","_cargo","_canBeAttached"];
	_cargo = cursorTarget;
	_vehicle = (player getVariable ["ASLR_Ropes_Vehicle", [objNull,0]]) select 0;
	if([_vehicle,_cargo] call ASLR_Can_Attach_Ropes) then {
		
		_canBeAttached = true;
		
		if!(missionNamespace getVariable ["ASLR_LOCKED_VEHICLES_ENABLED",false]) then {
			if( locked _cargo > 1 ) then {
				["Cannot attach cargo ropes to locked vehicle",false] call ASLR_Hint;
				_canBeAttached = false;
			};
		};
	
		if(_canBeAttached) then {
			[_cargo,player] call ASLR_Attach_Ropes;
		};
		
	};
};

ASLR_Attach_Ropes_Action_Check = {
	private ["_vehicleWithIndex","_cargo"];
	_vehicleWithIndex = player getVariable ["ASLR_Ropes_Vehicle", [objNull,0]];
	_cargo = cursorTarget;
	[_vehicleWithIndex select 0,_cargo] call ASLR_Can_Attach_Ropes;
};

ASLR_Can_Attach_Ropes = {
	params ["_vehicle","_cargo"];
	if(!isNull _vehicle && !isNull _cargo) then {
		[_vehicle,_cargo] call ASLR_Is_Supported_Cargo && vehicle player == player && player distance _cargo < 10 && _vehicle != _cargo;
	} else {
		false;
	};
};

ASLR_Drop_Ropes = {
	params ["_vehicle","_player",["_ropesIndex",0]];
	if(local _vehicle) then {
		private ["_helper","_existingRopes"];
		_helper = (_player getVariable ["ASLR_Ropes_Pick_Up_Helper", objNull]);
		if(!isNull _helper) then {
			_existingRopes = [_vehicle,_ropesIndex] call ASLR_Get_Ropes;		
			{
				_helper ropeDetach _x;
			} forEach _existingRopes;
			detach _helper;
			deleteVehicle _helper;		
		};
		_player setVariable ["ASLR_Ropes_Vehicle", nil,true];
		_player setVariable ["ASLR_Ropes_Pick_Up_Helper", nil,true];
	} else {
		[_this,"ASLR_Drop_Ropes",_vehicle,true] call ASLR_RemoteExec;
	};
};

ASLR_Drop_Ropes_Action = {
	private ["_vehicleAndIndex"];
	if([] call ASLR_Can_Drop_Ropes) then {	
		_vehicleAndIndex = player getVariable ["ASLR_Ropes_Vehicle", []];
		if(count _vehicleAndIndex == 2) then {
			[_vehicleAndIndex select 0, player, _vehicleAndIndex select 1] call ASLR_Drop_Ropes;
		};
	};
};

ASLR_Drop_Ropes_Action_Check = {
	[] call ASLR_Can_Drop_Ropes;
};

ASLR_Can_Drop_Ropes = {
	count (player getVariable ["ASLR_Ropes_Vehicle", []]) > 0 && vehicle player == player;
};

ASLR_Get_Closest_Rope = {
	private ["_nearbyVehicles","_closestVehicle","_closestRopeIndex","_closestDistance"];
	private ["_vehicle","_activeRope","_ropes","_ends"];
	private ["_end1","_end2","_minEndDistance"];
	_nearbyVehicles = missionNamespace getVariable ["ASLR_Nearby_Vehicles",[]];
	_closestVehicle = objNull;
	_closestRopeIndex = 0;
	_closestDistance = -1;
	{
		_vehicle = _x;
		{
			_activeRope = _x;
			_ropes = [_vehicle,(_activeRope select 0)] call ASLR_Get_Ropes;
			{
				_ends = ropeEndPosition _x;
				if(count _ends == 2) then {
					_end1 = _ends select 0;
					_end2 = _ends select 1;
					_minEndDistance = ((position player) distance _end1) min ((position player) distance _end2);
					if(_closestDistance == -1 || _closestDistance > _minEndDistance) then {
						_closestDistance = _minEndDistance;
						_closestRopeIndex = (_activeRope select 0);
						_closestVehicle = _vehicle;
					};
				};
			} forEach _ropes;
		} forEach ([_vehicle] call ASLR_Get_Active_Ropes);
	} forEach _nearbyVehicles;
	[_closestVehicle,_closestRopeIndex];
};

ASLR_Pickup_Ropes = {
	params ["_vehicle","_player",["_ropesIndex",0]];
	if(local _vehicle) then {
		private ["_existingRopesAndCargo","_existingRopes","_existingCargo","_helper","_allCargo"];
		_existingRopesAndCargo = [_vehicle,_ropesIndex] call ASLR_Get_Ropes_And_Cargo;
		_existingRopes = _existingRopesAndCargo select 0;
		_existingCargo = _existingRopesAndCargo select 1;
		if(!isNull _existingCargo) then {
			{
				_existingCargo ropeDetach _x;
			} forEach _existingRopes;
			_allCargo = _vehicle getVariable ["ASLR_Cargo",[]];
			_allCargo set [_ropesIndex,objNull];
			_vehicle setVariable ["ASLR_Cargo",_allCargo, true];
		};
		_helper = "Land_Can_V2_F" createVehicle position _player;
		{
			[_helper, [0, 0, 0], [0,0,-1]] ropeAttachTo _x;
			_helper attachTo [_player, [-0.1, 0.1, 0.15], "Pelvis"];
		} forEach _existingRopes;
		hideObject _helper;
		[[_helper],"ASLR_Hide_Object_Global"] call ASLR_RemoteExecServer;
		_player setVariable ["ASLR_Ropes_Vehicle", [_vehicle,_ropesIndex],true];
		_player setVariable ["ASLR_Ropes_Pick_Up_Helper", _helper,true];
	} else {
		[_this,"ASLR_Pickup_Ropes", _vehicle, true] call ASLR_RemoteExec;
	};
};

ASLR_Pickup_Ropes_Action = {
	private ["_nearbyVehicles","_canPickupRopes","_closestRope"];
	_nearbyVehicles = missionNamespace getVariable ["ASLR_Nearby_Vehicles",[]];
	if([] call ASLR_Can_Pickup_Ropes) then {
		_closestRope = [] call ASLR_Get_Closest_Rope;
		if(!isNull (_closestRope select 0)) then {
			_canPickupRopes = true;
			if!(missionNamespace getVariable ["ASLR_LOCKED_VEHICLES_ENABLED",false]) then {
				if( locked (_closestRope select 0) > 1 ) then {
					["Cannot pick up cargo ropes from locked vehicle",false] call ASLR_Hint;
					_canPickupRopes = false;
				};
			};
			if(_canPickupRopes) then {
				[(_closestRope select 0), player, (_closestRope select 1)] call ASLR_Pickup_Ropes;
			};	
		};
	};
};

ASLR_Pickup_Ropes_Action_Check = {
	[] call ASLR_Can_Pickup_Ropes;
};

ASLR_Can_Pickup_Ropes = {
	count (player getVariable ["ASLR_Ropes_Vehicle", []]) == 0 && count (missionNamespace getVariable ["ASLR_Nearby_Vehicles",[]]) > 0 && vehicle player == player;
};

ASLR_SUPPORTED_VEHICLES = [
	"Helicopter",
	"VTOL_Base_F"
];

ASLR_Is_Supported_Vehicle = {
	params ["_vehicle","_isSupported"];
	_isSupported = false;
	if(not isNull _vehicle) then {
		{
			if(_vehicle isKindOf _x) then {
				_isSupported = true;
			};
		} forEach (missionNamespace getVariable ["ASLR_SUPPORTED_VEHICLES_OVERRIDE",ASLR_SUPPORTED_VEHICLES]);
	};
	_isSupported;
};

ASLR_SLING_RULES = [
	["All","CAN_SLING","All"]
];

ASLR_Is_Supported_Cargo = {
	params ["_vehicle","_cargo"];
	private ["_canSling"];
	_canSling = false;
	if(not isNull _vehicle && not isNull _cargo) then {
		{
			if(_vehicle isKindOf (_x select 0)) then {
				if(_cargo isKindOf (_x select 2)) then {
					if( (toUpper (_x select 1)) == "CAN_SLING" ) then {
						_canSling = true;
					} else {
						_canSling = false;
					};
				};
			};
		} forEach (missionNamespace getVariable ["ASLR_SLING_RULES_OVERRIDE",ASLR_SLING_RULES]);
	};
	_canSling;
};

ASLR_Hint = {
    params ["_msg",["_isSuccess",true]];
    hint _msg;
};

ASLR_Hide_Object_Global = {
	params ["_obj"];
	if( _obj isKindOf "Land_Can_V2_F" ) then {
		hideObjectGlobal _obj;
	};
};

ASLR_Find_Nearby_Vehicles = {
	private ["_nearVehicles","_nearVehiclesWithRopes","_vehicle","_ends","_end1","_end2","_playerPosAGL"];
	_nearVehicles = [];
	{
		_nearVehicles append  (player nearObjects [_x, 30]);
	} forEach (missionNamespace getVariable ["ASLR_SUPPORTED_VEHICLES_OVERRIDE",ASLR_SUPPORTED_VEHICLES]);
	_nearVehiclesWithRopes = [];
	{
		_vehicle = _x;
		{
			_ropes = _vehicle getVariable ["ASLR_Ropes",[]];
			if(count _ropes > (_x select 0)) then {
				_ropes = _ropes select (_x select 0);
				{
					_ends = ropeEndPosition _x;
					if(count _ends == 2) then {
						_end1 = _ends select 0;
						_end2 = _ends select 1;
						_playerPosAGL = ASLtoAGL getPosASL player;
						if((_playerPosAGL distance _end1) < 5 || (_playerPosAGL distance _end2) < 5 ) then {
							_nearVehiclesWithRopes =  _nearVehiclesWithRopes + [_vehicle];
						}
					};
				} forEach _ropes;
			};
		} forEach ([_vehicle] call ASLR_Get_Active_Ropes);
	} forEach _nearVehicles;
	_nearVehiclesWithRopes;
};

ASLR_Add_Player_Actions = {
	// define the action menu items

	player addAction ["Extend Cargo Ropes", { 
		[] call ASLR_Extend_Ropes_Action;
	}, nil, 0, false, true, "", "call ASLR_Extend_Ropes_Action_Check"];
	
	player addAction ["Shorten Cargo Ropes", { 
		[] call ASLR_Shorten_Ropes_Action;
	}, nil, 0, false, true, "", "call ASLR_Shorten_Ropes_Action_Check"];
		
	player addAction ["Release Cargo", { 
		[] call ASLR_Release_Cargo_Action;
	}, nil, 0, false, true, "", "call ASLR_Release_Cargo_Action_Check"];
		
	player addAction ["Retract Cargo Ropes", { 
		[] call ASLR_Retract_Ropes_Action;
	}, nil, 0, false, true, "", "call ASLR_Retract_Ropes_Action_Check"];
	
	player addAction ["Deploy Cargo Ropes", { 
		[] call ASLR_Deploy_Ropes_Action;
	}, nil, 0, false, true, "", "call ASLR_Deploy_Ropes_Action_Check"];

	player addAction ["Attach To Cargo Ropes", { 
		[] call ASLR_Attach_Ropes_Action;
	}, nil, 0, false, true, "", "call ASLR_Attach_Ropes_Action_Check"];

	player addAction ["Drop Cargo Ropes", { 
		[] call ASLR_Drop_Ropes_Action;
	}, nil, 0, false, true, "", "call ASLR_Drop_Ropes_Action_Check"];

	player addAction ["Pickup Cargo Ropes", { 
		[] call ASLR_Pickup_Ropes_Action;
	}, nil, 0, false, true, "", "call ASLR_Pickup_Ropes_Action_Check"];

	player addEventHandler ["Respawn", {
		player setVariable ["ASLR_Actions_Loaded",false];
	}];
	
};


adv_fnc_timedHint = { 
	_this spawn {
	params [["_hint", "", [""]],["_duration",5, [0]],["_isSilent",false,[true]]];
	
	if (_isSilent) then {
		hintSilent format ["%1",_hint];
	} else {
		hint format ["%1",_hint];
	};
	sleep _duration;
	hintSilent "";
	};
};


ASLR_Deploy_Ropes_Keybind = {
	params ["_vehicle","_player",["_cargoCount",1],["_ropeLength",15]];
    if([_vehicle] call ASLR_Is_Supported_Vehicle) then {

    	message = "Single Rope Deployed";
	    if(_cargoCount == 2)  then {
	    	message = "Double Rope Deployed";
	    };
	    if(_cargoCount == 3) then {
	    	message = "Triple Rope Deployed";
	    };

		[message, 5] call adv_fnc_timedHint;
		[_vehicle, _player, _cargoCount] call ASLR_Deploy_Ropes;
	};
};


ASLR_Retract_Ropes_Keybind = {
	params ["_vehicle","_player",["_ropeIndex",0]];
	if([_vehicle] call ASLR_Is_Supported_Vehicle) then {
		["All ropes retracted", 5] call adv_fnc_timedHint;
		[_vehicle, _player, _ropeIndex] call ASLR_Retract_Ropes;
	};
};

ASLR_Extend_Ropes_Keybind = {
	params ["_vehicle","_player",["_ropeIndex",0]];
	if([_vehicle] call ASLR_Is_Supported_Vehicle) then {
		["All ropes extended", 5] call adv_fnc_timedHint;
		[_vehicle, _player, _ropeIndex] call ASLR_Extend_Ropes;
	};
};

ASLR_Shorten_Ropes_Keybind = {
	params ["_vehicle","_player",["_ropeIndex",0]];
	if([_vehicle] call ASLR_Is_Supported_Vehicle) then {
		["All ropes shortened", 5] call adv_fnc_timedHint;
		[_vehicle, _player, _ropeIndex] call ASLR_Shorten_Ropes;
	};	
};

ASLR_Release_Cargo_Keybind = {
	params ["_vehicle","_player",["_ropeIndex",0]];
	if([_vehicle] call ASLR_Is_Supported_Vehicle) then {
		["Cargo released", 5] call adv_fnc_timedHint;
		[_vehicle, _player, _ropeIndex] call ASLR_Release_Cargo;
	};
};

ASLR_Setup_Keybinding = {
	//define Default Key Binding

	/////////////////////////////////////DEPLOY

	[	"Advanced Sling Loading Refactored",	//SINGLE ROPE
		"KB_SingleDeploy", 
		"Deploy Single Rope",
		{[(vehicle player) ,player, 1] call ASLR_Deploy_Ropes_Keybind}, {}, [DIK_DOWNARROW, [false, false, false]]
	] call CBA_fnc_addKeybind;
		
	[	"Advanced Sling Loading Refactored",	//DOUBLE ROPES
		"KB_DoubleDeploy", 
		"Deploy Double Rope", 
		{[(vehicle player) ,player, 2] call ASLR_Deploy_Ropes_Keybind}, {}, [DIK_DOWNARROW, [true, false, false]]
	] call CBA_fnc_addKeybind;
		
	[	"Advanced Sling Loading Refactored",	//TRIPLE ROPES
		"KB_TripleDeploy", 
		"Deploy Triple Rope", 
		{[(vehicle player) ,player, 3] call ASLR_Deploy_Ropes_Keybind}, {}, [DIK_DOWNARROW, [false, true, false]]
	] call CBA_fnc_addKeybind;
		
	/////////////////////////////////////RETRACT (ALL)

	[	"Advanced Sling Loading Refactored",
		"KB_retract",
		"Retract Rope (ALL)", 
		{
			[(vehicle player), player, 0] call ASLR_Retract_Ropes_Keybind;
			[(vehicle player), player, 1] call ASLR_Retract_Ropes_Keybind;
			[(vehicle player), player, 2] call ASLR_Retract_Ropes_Keybind;
		}, {}, [DIK_UPARROW, [false, false, false]]
	] call CBA_fnc_addKeybind;
			
	////////////////////////////////////EXTEND (ALL)

	[	"Advanced Sling Loading Refactored",
		"KB_extend", 
		"Extend Rope (ALL)",
		{
			[(vehicle player), player, 0] call ASLR_Extend_Ropes_Keybind;
			[(vehicle player), player, 1] call ASLR_Extend_Ropes_Keybind;
			[(vehicle player), player, 2] call ASLR_Extend_Ropes_Keybind;
		}, {}, [DIK_RIGHTARROW, [false, false, false]]
	] call CBA_fnc_addKeybind;

	///////////////////////////////////SHORTEN (ALL)

	[	"Advanced Sling Loading Refactored",
		"KB_Shorten", 
		"Shorten Rope (ALL)",
		{
			[(vehicle player), player, 0] call ASLR_Shorten_Ropes_Keybind;
			[(vehicle player), player, 1] call ASLR_Shorten_Ropes_Keybind;
			[(vehicle player), player, 2] call ASLR_Shorten_Ropes_Keybind;
		}, {}, [DIK_LEFTARROW, [false, false, false]]
	] call CBA_fnc_addKeybind;

	/////////////////////////////////////RELEASE CARGO

	[	"Advanced Sling Loading Refactored",
		"KB_Release", 
		"Release Cargo (ALL)",
		{
			[(vehicle player), player, 0] call ASLR_Release_Cargo_Keybind;
			[(vehicle player), player, 1] call ASLR_Release_Cargo_Keybind;
			[(vehicle player), player, 2] call ASLR_Release_Cargo_Keybind;
		}, {}, [DIK_LEFTARROW, [true, true, false]]
	] call CBA_fnc_addKeybind;

};


ASLR_RemoteExec = {
	params ["_params","_functionName","_target",["_isCall",false]];
	if(_isCall) then {
		_params remoteExecCall [_functionName, _target];
	} else {
		_params remoteExec [_functionName, _target];
	};
};

ASLR_RemoteExecServer = {
	params ["_params","_functionName",["_isCall",false]];
	if(_isCall) then {
		_params remoteExecCall [_functionName, 2];
	} else {
		_params remoteExec [_functionName, 2];
	};
};



// runloop for the sling loading behavior

[] spawn {
	while {true} do {
		if(!isNull player && isPlayer player) then {
			if!( player getVariable ["ASLR_Actions_Loaded",false] ) then {
				[] call ASLR_Add_Player_Actions;
				[] call ASLR_Setup_Keybinding;
				player setVariable ["ASLR_Actions_Loaded",true];
			};
		};
		missionNamespace setVariable ["ASLR_Nearby_Vehicles", (call ASLR_Find_Nearby_Vehicles)];
		sleep 2;
	};
};


diag_log 'aslr client loaded';

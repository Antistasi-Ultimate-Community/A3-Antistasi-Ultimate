#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_posWorld"];

if (rallyPointSpawnCount isEqualTo 0) exitWith
{ 
	private _warningText = "<t font ='PuristaSemibold' align = 'center' shadow='1' shadowColor='#000000' size='0.8' color='#ebebeb'>" + localize "STR_params_rallyPointSpawnCountDisabled" +"</t>"; 
	[_warningText,0,safezoneY+0.5] spawn BIS_fnc_dynamicText; 
    
};

private _rallyPointClass = FactionGet(reb,"rallyPoint");

rallyProps = [];

rallyPointRoot = [_rallyPointClass, _posWorld] call BIS_fnc_createSimpleObject;
private _rootPos = position rallyPointRoot;
private _rootHeight = (_rootPos select 2) - 0.185;
_rootPos set [2, _rootHeight];
rallyPointRoot setPos _rootPos;

private _backpack1 = ["B_Carryall_oli", _posWorld] call BIS_fnc_createSimpleObject;
private _backpack1Pos = position _backpack1;
_backpack1 setPos [(_backpack1Pos select 0) - 0.15, (_backpack1Pos select 1) + 0.05, _rootHeight];
_backpack1 setDir 135;
[_backpack1, -30, 0] call BIS_fnc_setPitchBank;

private _backpack2 = ["B_Carryall_oli", _posWorld] call BIS_fnc_createSimpleObject;
private _backpack2Pos = position _backpack2;
_backpack2 setPos [(_backpack2Pos select 0) + 0.15, (_backpack2Pos select 1) + 0.05, _rootHeight];
_backpack2 setDir 225;
[_backpack2, -30, 0] call BIS_fnc_setPitchBank;

private _bag = ["Item_Sleeping_bag_folded_01", _posWorld] call BIS_fnc_createSimpleObject;
private _bagPos = position _bag;
_bag setPos [(_bagPos select 0) + 0.025, (_bagPos select 1) - 0.1, (_bagPos select 2) + 0.4];


private _ammobox = ["Land_Ammobox_rounds_F", _posWorld] call BIS_fnc_createSimpleObject;
private _ammoboxPos = position _ammobox;
_ammobox setPos [(_ammoboxPos select 0) + 0.35, (_ammoboxPos select 1) - 0.15, (_ammoboxPos select 2) - 0.15];
_ammobox setDir 115;

[rallyPointRoot, [0, 0, -0.5], 0.2] remoteExec ["SCRT_fnc_common_attachLightSource", 0, rallyPointRoot];

rallyPointMarker = createMarker ["RallyPointMarker", _rootPos];
rallyPointMarker setMarkerType "hd_join";
rallyPointMarker setMarkerSize [1, 1];
rallyPointMarker setMarkerText (format [localize "STR_marker_RP", str rallyPointSpawnCount]);
rallyPointMarker setMarkerColor "colorIndependent";
rallyPointMarker setMarkerAlpha 1;
sidesX setVariable [rallyPointMarker,teamPlayer,true];
publicVariable "rallyPointMarker";

rallyProps append [_backpack1, _backpack2, _bag, _ammobox];
publicVariable "rallyProps";

rallyPointRoot setVariable ["remainingTravels", rallyPointSpawnCount, true];
publicVariable "rallyPointRoot";
//	Author: Socrates
// 
//	Description:
//	Creates trader on position.
//
//	Returns:
//	Trader object.
//
// 	How to use: 
// 	[position] call SCRT_fnc_trader_createTrader;

params ["_position"];

if (disableTrader) exitWith {};

traderObjects = [];

traderMarker = createMarker ["TraderMarker", _position];
traderMarker setMarkerType "hd_objective";
traderMarker setMarkerSize [1, 1];
traderMarker setMarkerText (localize "STR_marker_arms_dealer");
traderMarker setMarkerColor "ColorUNKNOWN";
traderMarker setMarkerAlpha 1;
sidesX setVariable [traderMarker,teamPlayer,true];
publicVariable "traderMarker";

//clear point
{  
	[_x, true] remoteExec ["hideObject", 0, true];
} forEach nearestTerrainObjects [_position, [], 50, false, true];

private _isVn = ((A3A_Reb_template splitString "_") select 0) isEqualTo "VN";

//trader prop objects
_traderTent = if (_isVn) then { 
	createVehicle ["Land_MedicalTent_01_wdl_generic_inner_F", _position]; 
} else {
	createVehicle ["Land_MedicalTent_01_wdl_generic_open_F", _position];
};

_traderTent allowDamage false;
_buildingPositions = _traderTent buildingPos -1;

_chair = ["Land_DeskChair_01_black_F", getPosWorld _traderTent] call BIS_fnc_createSimpleObject;
_chair setPos (_buildingPositions select 0);
_chair setPos [getPos _chair select 0, (getPos _chair select 1) + 1, (getPos _chair select 2) + 0.4]; 

_table = ["Land_PortableDesk_01_black_F", getPosWorld _traderTent] call BIS_fnc_createSimpleObject;
_table setPos (_buildingPositions select 0);
_table setPos [getPos _table select 0, getPos _table select 1, (getPos _table select 2) + 0.7]; 


if (!_isVn) then {
	_laptopArray = [[_table, "TOP"],"Land_Laptop_02_unfolded_F",1,[0,0,0],180] call BIS_fnc_spawnObjects;
	_laptop = _laptopArray select 0;
	traderObjects pushBack _laptop;

	_satellite = ["SatelliteAntenna_01_Black_F", getPosWorld _traderTent] call BIS_fnc_createSimpleObject;
	_satellite setPos (_buildingPositions select 0);
	_satellite setPos [(getPos _laptop select 0) + 5.5, getPos _laptop select 1, (getPos _laptop select 2) + 1.75];
	_satellite setDir 45; 
	traderObjects pushBack _satellite;
};

_tableBoxArray = [[_table, "TOP"],"Land_Ammobox_rounds_F",1,[-0.4,(random 0.2),(random 20)-10],(random 180)] call BIS_fnc_spawnObjects;
_tableBox = _tableBoxArray select 0;

_ammoBox1 = ["Land_PaperBox_open_full_F", getPosWorld _traderTent] call BIS_fnc_createSimpleObject;
_ammoBox1 setPos [(getPos _ammoBox1 select 0) + 2.6, (getPos _ammoBox1 select 1) + 3, (getPos _ammoBox1 select 2) - 1.4];

_ammoBox2 = ["Land_PaperBox_open_empty_F", getPosWorld _traderTent] call BIS_fnc_createSimpleObject;
_ammoBox2 setPos [(getPos _ammoBox2 select 0) - 2.6, (getPos _ammoBox2 select 1) + 3, (getPos _ammoBox2 select 2) - 1.4];

_container = ["Land_Cargo20_military_green_F", getPosWorld _traderTent] call BIS_fnc_createSimpleObject;
_container setPos (_buildingPositions select 0);
_container setPos [(getPos _container select 0) - 8, (getPos _container select 1) + 3, (getPos _container select 2) + 2.4];
_container setDir 90;

traderObjects append [_traderTent, _chair, _table, _tableBox, _ammoBox1, _ammoBox2, _container];
publicVariable "traderObjects";

[_traderTent, [0, 0, 1]] remoteExec ["SCRT_fnc_common_attachLightSource", 0, _traderTent];

//trader itself
private _traderGroup = createGroup civilian;
_traderX = _traderGroup createUnit ["C_Nikos", _position, [], 0, "CAN_COLLIDE"];
_traderX allowDamage false;
_traderX setUnitPos "UP";
_traderX setSpeaker "NoVoice";
{_traderX disableAI _x} forEach ["CHECKVISIBLE", "MOVE", "COVER", "SUPPRESSION", "FSM"];
_traderX setDir -30;

_traderX
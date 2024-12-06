#include "..\defines.inc"
FIX_LINE_NUMBERS()

Info("Helicopter slingload cargo Event Init.");

private _vehicles = [];
private _groups = [];
private _difficult = random 10 < tierWar;

private _player = selectRandom (call SCRT_fnc_misc_getRebelPlayers);

if (isNil "_player") exitWith {
    Error("No players found, aborting.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _originPosition = position _player;

Info_2("%1 will be used as center of the event at %2 position.", name _player, str _originPosition);

private _potentialOutposts = (outposts + milbases + airportsX + resourcesX + factories) select {
    sidesX getVariable [_x, sideUnknown] != teamPlayer && {(getMarkerPos _x) distance2D _player < distanceSPWN*5}
};

if (_potentialOutposts isEqualTo []) exitWith {
    Info("No outposts in proximity, aborting Heli slingload cargo Event.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _outpost = selectRandom _potentialOutposts;
private _side = sidesX getVariable [_outpost, sideUnknown];
private _faction = Faction(_side);
private _outpostPosition = getMarkerPos _outpost;

private _potentialspawnPosition = (outposts + milbases + airportsX + resourcesX + factories) select {
    sidesX getVariable [_x, sideUnknown] != teamPlayer && _x != _outpost && sidesX getVariable [_x, sideUnknown] == _side && {(getMarkerPos _x) distance2D _player < distanceSPWN}
};
if (_potentialspawnPosition isEqualTo []) exitWith {
    Info("No spawn positions in proximity, aborting Heli slingload cargo Event.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};
private _spawnPosition = selectRandom _potentialspawnPosition;
/* if (_spawnPosition == _outpost) then {
	while {true} do {
		_potentialspawnPosition = (outposts + milbases + airportsX + resourcesX + factories) select {
    	sidesX getVariable [_x, sideUnknown] != teamPlayer && _x != _outpost && sidesX getVariable [_x, sideUnknown] == _side  &&  {(getMarkerPos _x) distance2D _player < distanceSPWN}};
		_spawnPosition = selectRandom _potentialspawnPosition;
		if (_spawnPosition != _outpost) exitwith{};
	};
}; */

private _actualspawnPosition = getMarkerPos _spawnPosition;

private _HeliClass = selectRandom (_faction get "vehiclesHelisTransport");
private _ammoBoxType = _faction get "ammobox";

if (_HeliClass == "") exitWith {
    Error("No Helicopters, problem with template, aborting Heli slingload cargo Event.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

if (_HeliClass isKindOf "Heli_Transport_04_base_F") then {
	_HeliClass = "O_Heli_Transport_04_F";
};

private _heliVehicleData = [_actualspawnPosition, 90, _HeliClass, _side] call A3A_fnc_spawnVehicle;

private _heliVehicle = _heliVehicleData select 0;
private _lootCrateTest = [_ammoBoxType, _actualspawnPosition, 20, 5, true] call A3A_fnc_safeVehicleSpawn;
if !(_heliVehicle canSlingLoad _lootCrateTest) exitwith {
    Error("Your heli can't do shit, aborting.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};
deleteVehicle _lootCrateTest;
///new
private _specOpsArray = if (_difficult) then {selectRandom (_faction get "groupSpecOpsRandom")} else {selectRandom ([_faction, "groupsTierSquads"] call SCRT_fnc_unit_flattenTier)};

private _lootcrateType = "";
private _csatPods = ["Land_Pod_Heli_Transport_04_covered_F" , "Land_Pod_Heli_Transport_04_bench_F" , "Land_Pod_Heli_Transport_04_medevac_F" , "Land_Pod_Heli_Transport_04_repair_F", "Land_Pod_Heli_Transport_04_fuel_F" , "Land_Pod_Heli_Transport_04_ammo_F" , "Land_Pod_Heli_Transport_04_box_F"];
private _regPods = ["B_Slingload_01_Cargo_F", "B_Slingload_01_Ammo_F", "B_Slingload_01_Medevac_F", "B_Slingload_01_Repair_F", "B_Slingload_01_Fuel_F"];
private _lootCrate = objNull;
private _attempts = 15;

if (_HeliClass == "O_Heli_Transport_04_F") then {
	_HeliClass = "O_Heli_Transport_04_F";
	/* _lootcrateType = selectRandom ((_faction get "vehiclesLightUnarmed") + (_faction get "vehiclesLightArmed") + (_faction get "vehiclesAirborne") + 
	(_faction get "vehiclesAA") + (_faction get "vehiclesLightTanks") + (_faction get "vehiclesMilitiaAPCs") + (_faction get "vehiclesAPCs") + (_faction get "vehiclesIFVs") + (selectRandom _csatPods)); */
	while {_attempts != 0} do {
		private _csatPods = ["Land_Pod_Heli_Transport_04_covered_F" , "Land_Pod_Heli_Transport_04_bench_F" , "Land_Pod_Heli_Transport_04_medevac_F" , "Land_Pod_Heli_Transport_04_repair_F", "Land_Pod_Heli_Transport_04_fuel_F" , "Land_Pod_Heli_Transport_04_ammo_F" , "Land_Pod_Heli_Transport_04_box_F"];
		_lootcrateType = selectRandom ((_faction get "vehiclesLightUnarmed") + (_faction get "vehiclesLightArmed") + (_faction get "vehiclesAirborne") + (_faction get "vehiclesAA") + (_faction get "vehiclesLightTanks") + 
		(_faction get "vehiclesMilitiaAPCs") + (_faction get "vehiclesAPCs") + (_faction get "vehiclesIFVs") + _csatPods);
		_lootCrate = _lootcrateType createVehicle _actualspawnPosition;
		deleteVehicle _lootCrate;
		if (_heliVehicle canSlingLoad _lootCrate) exitwith {
			deleteVehicle _lootCrate;
		};
		deleteVehicle _lootCrate;
		_attempts = _attempts - 1;
		sleep 0.05;
	};
	deleteVehicle _lootCrate;
	{
		deleteGroup group _x;
		_heliVehicle deleteVehicleCrew _x;
	} forEach crew _heliVehicle;
	deleteVehicle _heliVehicle;
	if (_HeliClass canSlingLoad _lootcrateType) then {
		if (_lootcrateType == "Land_Pod_Heli_Transport_04_box_F" || _lootcrateType == "Land_Pod_Heli_Transport_04_ammo_F") then{
			_lootCrate = [_lootcrateType, _actualspawnPosition, 40, 5, true] call A3A_fnc_safeVehicleSpawn;
			[_lootCrate] spawn A3A_fnc_fillLootCrate;
			[_lootCrate] call A3A_Logistics_fnc_addLoadAction;
			[_lootCrate, _side] call A3A_fnc_AIVEHinit;
		} else {
			_lootCrate = [_lootcrateType, _actualspawnPosition, 40, 5, true] call A3A_fnc_safeVehicleSpawn;
			[_lootCrate, _side] call A3A_fnc_AIVEHinit;
			[_lootCrate] call A3A_Logistics_fnc_addLoadAction;
		};
		if (_lootcrateType == "Land_Pod_Heli_Transport_04_covered_F" || _lootcrateType == "Land_Pod_Heli_Transport_04_bench_F") then {
			_heliInfGroup = [_actualspawnPosition, _side, _specOpsArray] call A3A_fnc_spawnGroup;
			_groups pushBack _heliInfGroup;
			{
    			_x assignAsCargo _lootCrate; 
    			_x moveInCargo _lootCrate; 
    			[_x] join _heliInfGroup;
    			[_x] call A3A_fnc_NATOinit;
			} forEach units _heliInfGroup;
			{
			private _index = _lootCrate getCargoIndex _x;
				if (_index == -1) then {
    			deleteVehicle _x;
				};
			}forEach units _heliInfGroup;
		};
		if !(_lootcrateType in _csatPods) then {
			_lootCrate = [_lootcrateType, _actualspawnPosition, 40, 5, true] call A3A_fnc_safeVehicleSpawn;
			_unitType = [_side, _lootCrate] call A3A_fnc_crewTypeForVehicle;
			_group = [_side, _lootCrate, _unitType] call A3A_fnc_createVehicleCrew;
		};
	} else {
		_lootCrate = [_ammoBoxType, _actualspawnPosition, 40, 5, true] call A3A_fnc_safeVehicleSpawn;
		[_lootCrate] spawn A3A_fnc_fillLootCrate;
		[_lootCrate] call A3A_Logistics_fnc_addLoadAction;
		// Otherwise when destroyed, ammoboxes sink 100m underground and are never cleared up
		_lootCrate addEventHandler ["Killed", { [_this#0] spawn { sleep 10; deleteVehicle (_this#0) } }];
	};
} else {
	//if (_HeliClass typeOf "Heli_Transport_03_base_F") then {
	/* _lootcrateType = selectRandom ((_faction get "vehiclesLightUnarmed") + (_faction get "vehiclesLightArmed") + (_faction get "vehiclesAirborne") + (_faction get "vehiclesAA") + 
	(_faction get "vehiclesLightTanks") + (_faction get "vehiclesMilitiaAPCs") + (_faction get "vehiclesAPCs") + (_faction get "vehiclesIFVs") + (selectRandom _regPods)); ///light armored vehicles + light tanks + pods */
	while {_attempts != 0 } do {
		private _regPods = ["B_Slingload_01_Cargo_F", "B_Slingload_01_Ammo_F", "B_Slingload_01_Medevac_F", "B_Slingload_01_Repair_F", "B_Slingload_01_Fuel_F"];
		_lootcrateType = selectRandom ((_faction get "vehiclesLightUnarmed") + (_faction get "vehiclesLightArmed") + (_faction get "vehiclesAirborne") + 
		(_faction get "vehiclesAA") + (_faction get "vehiclesLightTanks") + (_faction get "vehiclesMilitiaAPCs") + (_faction get "vehiclesAPCs") + (_faction get "vehiclesIFVs") + _regPods);
		_lootCrate = _lootcrateType createVehicle _actualspawnPosition;
		deleteVehicle _lootCrate;
		if (_heliVehicle canSlingLoad _lootCrate) exitwith {
			deleteVehicle _lootCrate;
		};
		deleteVehicle _lootCrate;
		_attempts = _attempts - 1;
		sleep 0.08;
	};
	deleteVehicle _lootCrate;
	{
		_heliVehicle deleteVehicleCrew _x;
	} forEach crew _heliVehicle;
	deleteVehicle _heliVehicle;
	if (_HeliClass canSlingLoad _lootcrateType) then {
		if (_lootcrateType == "B_Slingload_01_Cargo_F" || _lootcrateType == "B_Slingload_01_Ammo_F") then {
			_lootCrate = [_lootcrateType, _actualspawnPosition, 40, 5, true] call A3A_fnc_safeVehicleSpawn;
			[_lootCrate, _side] call A3A_fnc_AIVEHinit;
			[_lootCrate] spawn A3A_fnc_fillLootCrate;
			[_lootCrate] call A3A_Logistics_fnc_addLoadAction;
		} else {
			_lootCrate = [_lootcrateType, _actualspawnPosition, 40, 5, true] call A3A_fnc_safeVehicleSpawn;
			[_lootCrate, _side] call A3A_fnc_AIVEHinit;
			[_lootCrate] call A3A_Logistics_fnc_addLoadAction;
		};
		if !(_lootcrateType in _regPods) then {
			_unitType = [_side, _lootCrate] call A3A_fnc_crewTypeForVehicle;
			_group = [_side, _lootCrate, _unitType] call A3A_fnc_createVehicleCrew;
		};
	} else {
		_lootCrate = [_ammoBoxType, _actualspawnPosition, 15, 5, true] call A3A_fnc_safeVehicleSpawn;
		[_lootCrate] spawn A3A_fnc_fillLootCrate;
		[_lootCrate] call A3A_Logistics_fnc_addLoadAction;
		// Otherwise when destroyed, ammoboxes sink 100m underground and are never cleared up
		_lootCrate addEventHandler ["Killed", { [_this#0] spawn { sleep 10; deleteVehicle (_this#0) } }];
	};
};
sleep 1;
private _heliVehicleData = [_actualspawnPosition, 90, _HeliClass, _side] call A3A_fnc_spawnVehicle;

private _heliVehicle = _heliVehicleData select 0;
_heliVehicle setSlingLoad _lootCrate;
_lootCrate allowDamage false; ///not sure about this
_heliVehicle setVelocity [20,0,0];
//_lootCrate addEventHandler ["GetOut", {private _lootCrate = _this select 0; _lootCrate allowDamage true; if ((isTouchingGround _lootCrate)) then {_lootCrate}}]; ///not sure about this either
if (getSlingLoad _heliVehicle  == objNull) then {
	sleep 5;
	private _wpbug = _heliGroup addWaypoint [_lootCrate, -1];
	_wpbug setWaypointSpeed "NORMAL";
	_wpbug setWaypointType "HOOK";
	_wpbug setWaypointBehaviour "CARELESS";
};
///
private _midHeight = [100, 150] select (A3A_climate isEqualTo "tropical");
_heliVehicle flyInHeight _midHeight;

_heliVehicle limitSpeed 150;
[_heliVehicle, _side] call A3A_fnc_AIVEHinit;

private _heliVehicleCrew = _heliVehicleData select 1;
{[_x] call A3A_fnc_NATOinit} forEach _heliVehicleCrew;
private _heliGroup = _heliVehicleData select 2;

[_heliVehicle, localize "STR_marker_logistics_heli", false] spawn A3A_fnc_inmuneConvoy;	
_groups pushBack _heliGroup;
_vehicles pushBack _heliVehicle;

if !(typeOf _lootCrate in _regPods || typeOf _lootCrate in _csatPods || typeOf _lootCrate == _ammoBoxType) then {
	private _wplootbox = group driver(_lootCrate) addWaypoint [_outpostPosition, 10]; //wplootbox lol
	_wplootbox setWaypointSpeed "NORMAL";
	//_wplootbox setWaypointType "GETOUT";
	_wplootbox setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) leaveVehicle (assignedVehicle this)"]; /////NEEDS TO BE TESTED
	_wplootbox setWaypointBehaviour "CARELESS";
};

private _wpDropPos = [_outpostPosition, 1, 50, 5, 0, 20, 0] call BIS_fnc_findSafePos;
private _wp = _heliGroup addWaypoint [_wpDropPos, 5];
_wp setWaypointSpeed "NORMAL";
_wp setWaypointType "UNHOOK";
_wp setWaypointBehaviour "CARELESS";

private _wp2 = _heliGroup addWaypoint [_actualspawnPosition, 0];
_wp2 setWaypointSpeed "NORMAL";
//_wp2 setWaypointType "GETOUT";
_wp2 setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) leaveVehicle (assignedVehicle this)"]; /////NEEDS TO BE TESTED

_wp2 setWaypointBehaviour "CARELESS";
sleep 4;
//private _timeOut = time + 1800;
waitUntil { sleep 2; getSlingLoad _heliVehicle  == objNull || getPos _lootCrate select 2 < 3};
private _smokeGrenade = selectRandom allSmokeGrenades; //notife player where sweet loot has landed
private _smoke = _smokeGrenade createVehicle (getPosATL _lootCrate);
_smoke attachTo [_lootCrate, [0,0,0] ];
sleep 5;
detach _smoke;
_lootCrate allowDamage true;
{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
sleep 360;
if (_lootCrate distance2D _wpDropPos < 50) then {
	_vehicles pushBack _lootCrate;
	{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
	{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;
	isEventInProgress = false;
	publicVariableServer "isEventInProgress";
	Info("Helicopter sligload clean up complete.");
} else {
	{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
	{[_x] spawn A3A_fnc_groupDespawner} forEach _groups; 
	//assuming heli and it's payload didn't make it to destination
	isEventInProgress = false;
	publicVariableServer "isEventInProgress";
	Info("Helicopter sligload clean up complete.");
};
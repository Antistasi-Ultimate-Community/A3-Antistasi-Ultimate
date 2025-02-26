#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_positionX","_size","_buildings","_groupX","_typeUnit","_sideX","_building","_typeB","_frontierX","_typeVehX","_veh","_vehiclesX","_soldiers","_pos","_ang","_markerX","_unit","_return"];
_markerX = _this select 0;
_positionX = getMarkerPos _markerX;
_size = _this select 1;
_buildings = nearestObjects [_positionX, A3A_milBuildingWhitelist, _size, true];
_buildings = _buildings inAreaArray _markerX;

if (count _buildings == 0) exitWith {[grpNull,[],[]]};

_sideX = _this select 2;
private _faction = Faction(_sideX);
_frontierX = _this select 3;

_vehiclesX = [];
_soldiers = [];
private _spawnsUsed = [];

private _groupX = createGroup _sideX;
private _typeUnit = [_faction get "unitTierStaticCrew"] call SCRT_fnc_unit_getTiered;

//New system to place helis, does not care about heli types currently
private _helicopterTypes = [];
switch (true) do {
    case (_markerX in milbases): {
        _helicopterTypes append (_faction get "vehiclesHelisTransport");
        _helicopterTypes append (_faction get "vehiclesHelisLight");
        _helicopterTypes append (_faction get "vehiclesHelisLightAttack");
    };
    case (_markerX in airportsX): {
        _helicopterTypes append (_faction get "vehiclesHelisTransport");
        _helicopterTypes append (_faction get "vehiclesHelisLight");
        _helicopterTypes append (_faction get "vehiclesHelisLightAttack");
        _helicopterTypes append (_faction get "vehiclesHelisAttack");
    };
    default {
        _helicopterTypes append (_faction get "vehiclesHelisLight");
    };
};
private _count = 1 + round (random 3); //Change these numbers as you want, first number is minimum, max is first plus second number
while {_count > 0} do
{
    if (_helicopterTypes isEqualTo []) exitWith {}; //no helis to pick from
    _typeVehX = selectRandom _helicopterTypes;
    private _spawnParameter = [_markerX, "Heli"] call A3A_fnc_findSpawnPosition;
    if !(_spawnParameter isEqualType []) exitWith {};       // out of spawn places
    _spawnsUsed pushBack _spawnParameter#2;
    _veh = createVehicle [_typeVehX, (_spawnParameter select 0), [],0, "CAN_COLLIDE"];
    _veh setDir (_spawnParameter select 1);
    _vehiclesX pushBack _veh;
    _count = _count - 1;
};

//Spawning certain statics on fixed buildingPos of chosen buildings

private _fnc_spawnStatic = {
    params ["_type", "_pos", "_dir"];
    private _veh = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
    if (!isNil "_dir") then { _veh setDir _dir };
    private _unit = [_groupX, _typeUnit, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
    _unit moveInGunner _veh;
    [_unit,_markerX] call A3A_fnc_NATOinit;
    _soldiers pushBack _unit;
    _vehiclesX pushBack _veh;
    _veh;
};

private _fnc_spawnStaticUnit = {
    params ["_type", "_pos", "_dir"];
	private _unit = [_groupX, _type, _pos, [], 0, "NONE"] call A3A_fnc_createUnit;
    if (!isNil "_dir") then { _unit setDir _dir };
    _unit disableAI "PATH"; //block moving
    _unit setUnitPos "UP"; //force standing
    [_unit,_markerX] call A3A_fnc_NATOinit;
    _unit setPosATL _pos;
    _soldiers pushBack _unit;
    _unit;
};

for "_i" from 0 to (count _buildings) - 1 do
{
    if (spawner getVariable _markerX == 2) exitWith {};
    private _building = _buildings select _i;
    private _typeB = typeOf _building;

    call {
        if (damage _building >= 1 or isObjectHidden _building) exitWith {};			// don't put statics on destroyed buildings
        //Static MGs
        if 	((_typeB == "Land_Cargo_Patrol_V1_F") or (_typeB == "Land_Cargo_Patrol_V2_F") or (_typeB == "Land_Cargo_Patrol_V3_F") or (_typeB == "Land_Cargo_Patrol_V4_F")) exitWith
        {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building) - 180;
            private _zpos = AGLToASL (_building buildingPos 1);
            private _pos = _zpos getPos [1.5, _dir];			// zeroes Z value because BIS
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
		if 	((_typeB == "Land_Hlaska") or (_typeB == "Land_vn_hlaska")) exitWith
        {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building);
            private _zpos = AGLToASL (_building buildingPos 1);
            private _pos = _zpos getPos [0.5, _dir];
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if 	((_typeB == "Land_fortified_nest_small_EP1") or (_typeB == "Land_BagBunker_Small_F") or (_typeB == "Land_BagBunker_01_small_green_F") or (_typeB == "Land_fortified_nest_small") or (_typeB == "Fort_Nest") or (_typeB == "Land_vn_bagbunker_01_small_green_f") or (_typeB == "Land_vn_bagbunker_small_f") or (_typeB == "Land_vn_o_shelter_05")or (_typeB == "Land_vn_bunker_small_01")) exitWith
        {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building) - 180;
            private _zpos = AGLToASL (_building buildingPos 1);
            private _pos = _zpos getPos [-1, _dir];
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
		};
 		if 	((_typeB == "Land_vn_o_tower_02")) exitWith
         {
             private _type = selectRandom (_faction get "staticMGs");
             private _dir = (getDir _building) - 90;
             private _zpos = AGLToASL (_building buildingPos 1);
             private _pos = _zpos getPos [0.5, _dir];
             _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
             [_type, _pos, _dir] call _fnc_spawnStatic;
         };
 		if 	((_typeB == "Land_vn_hut_tower_01")) exitWith
         {
             private _type = selectRandom (_faction get "staticMGs");
             private _dir = (getDir _building) - 180;
             private _zpos = AGLToASL (_building buildingPos 5);
             private _pos = _zpos getPos [1, _dir];
             _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
             [_type, _pos, _dir] call _fnc_spawnStatic;
         };
 		if 	((_typeB == "Land_vn_o_platform_05") or (_typeB == "Land_vn_o_platform_06")) exitWith
         {
             private _type = selectRandom (_faction get "staticMGs");
             private _dir = (getDir _building) - 270;
             private _zpos = AGLToASL (_building buildingPos 5);
             private _pos = _zpos getPos [0.5, _dir];
             _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
             [_type, _pos, _dir] call _fnc_spawnStatic;
        };
		if 	((_typeB == "Land_vn_b_trench_bunker_04_01")) exitWith
         {
             private _type = selectRandom (_faction get "staticMGs");
             private _dir = (getDir _building) + 90;
             private _zpos = AGLToASL (_building buildingPos 4);
             private _pos = _zpos getPos [-1.5, _dir];
             _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
             [_type, _pos, _dir] call _fnc_spawnStatic;

        };
        if 	((_typeB == "Land_Cargo_Tower_V1_F") or (_typeB == "Land_Cargo_Tower_V1_No1_F") or (_typeB == "Land_Cargo_Tower_V1_No2_F") or (_typeB == "Land_Cargo_Tower_V1_No3_F") or (_typeB == "Land_Cargo_Tower_V1_No4_F") or (_typeB == "Land_Cargo_Tower_V1_No5_F") or (_typeB == "Land_Cargo_Tower_V1_No6_F") or (_typeB == "Land_Cargo_Tower_V1_No7_F") or (_typeB == "Land_Cargo_Tower_V2_F") or (_typeB == "Land_Cargo_Tower_V3_F") or (_typeB == "Land_Cargo_Tower_V4_F")) exitWith			// just the big towers which have 3 .50 cals on top
        {
            private _type = selectRandom (_faction get "staticMGs");
            _dir = getDir _building;
            _zOffset = [0, 0, -0.3]; //fix spawn hight
            _Tdir = _dir + 90; //relative rotation to building
            _zpos = AGLToASL (_building buildingPos 11); //relative East
            _pos = _zpos getPos [-1, _Tdir]; //offset
            _zpos = _zpos vectorAdd _zOffset;
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _Tdir] call _fnc_spawnStatic;
            sleep 0.5;			// why only here?
            _Tdir = _dir + 0;
            _zpos = AGLToASL (_building buildingPos 13); //relative North
            _pos = _zpos getPos [-0.8, _Tdir]; //offset
            _zpos = _zpos vectorAdd _zOffset;
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _Tdir] call _fnc_spawnStatic;
            sleep 0.5;
            _Tdir = _dir + 180;
            _zpos = AGLToASL (_building buildingPos 16); //relative South
            _pos = _zpos getPos [-0.2, _Tdir]; //offset
            _zpos = _zpos vectorAdd _zOffset;
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _Tdir] call _fnc_spawnStatic;
        };
        if     ((_typeB == "Land_SPE_Sandbag_Nest")) exitWith
        {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building);
            private _pos = _building modelToWorld [0.0065918,-0.489746,-0.417223];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };

        //Static AAs
		if 	((_typeB == "Land_Radar_01_HQ_F") or (_typeB == "Land_vn_radar_01_hq_f")) exitWith
        {
            private _type = selectRandom (_faction get "staticAA");
            private _dir = getDir _building;
            private _zpos = AGLToASL (_building buildingPos 30);
            private _pos = getPosASL _building;
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if 	((_typeB == "Land_Cargo_HQ_V1_F") or (_typeB == "Land_Cargo_HQ_V2_F") or (_typeB == "Land_Cargo_HQ_V3_F")) exitWith
        {
            private _type = selectRandom (_faction get "staticAA");
            private _dir = getDir _building;
            private _zpos = AGLToASL (_building buildingPos 8);
            private _pos = getPosASL _building;
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
		if 	((_typeB == "Land_vn_cementworks_01_grey_f")) exitWith
        {
            private _type = selectRandom (_faction get "staticAA");
            private _dir = getDir _building;
            private _zpos = AGLToASL (_building buildingPos 24);
            private _pos = getPosASL _building;
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
		if 	((_typeB == "Land_vn_cementworks_01_brick_f")) exitWith
        {
            private _type = selectRandom (_faction get "staticAA");
            private _dir = getDir _building;
            private _zpos = AGLToASL (_building buildingPos 20);
            private _pos = getPosASL _building;
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
		if 	((_typeB == "Land_vn_a_office01")) exitWith
        {
            private _type = selectRandom (_faction get "staticAA");
            private _dir = (getDir _building) + 180;
            private _zpos = AGLToASL (_building buildingPos 8);
			private _pos = _zpos getPos [1.5, _dir];
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
		
        if (_typeB isEqualTo "land_gm_sandbags_02_bunker_high" or {_typeB isEqualTo "land_gm_woodbunker_01_bags"}) exitWith {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = getDir _building;
            private _zpos = AGLToASL (position _building);
            private _pos = _zpos getPos [0, _dir];
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            private _static = [_type, _pos, _dir] call _fnc_spawnStatic;
            _static setPos _pos
        };
        if (_typeB isEqualTo "Land_HBarrier_01_big_tower_green_F" or {_typeB isEqualTo "Land_HBarrierTower_F"}) exitWith {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building) - 180;
            private _zpos = AGLToASL (position _building);
            private _zOffset = [0, 0, 2.55];
            _zpos = _zpos vectorAdd _zOffset;
            private _pos = _zpos getPos [1.5, _dir];
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            private _static = [_type, _pos, _dir] call _fnc_spawnStatic;
            _static setPos _pos; 
        };
        if (_typeB isEqualTo "Land_HBarrier_01_tower_green_F"  or {_typeB isEqualTo "Land_BagBunker_Tower_F"}) exitWith {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building) - 180;
            private _zpos = AGLToASL (position _building);
            private _zOffset = [0, 0, 2.55];
            _zpos = _zpos vectorAdd _zOffset;
            private _pos = _zpos getPos [1.5, _dir];
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            private _static = [_type, _pos, _dir] call _fnc_spawnStatic;
            _static setPos _pos; 
        };
        if (_typeB isEqualTo "Land_Fort_Watchtower_EP1" or {_typeB isEqualTo "Land_Fort_Watchtower"}) exitWith {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building) - 180;
            private _zpos = AGLToASL (position _building);
            private _zOffset = [0, 0, 2.25];
            _zpos = _zpos vectorAdd _zOffset;
            private _pos = _zpos getPos [1.5, _dir];
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            private _static = [_type, _pos, _dir] call _fnc_spawnStatic;
            _static setPos _pos; 
        };
        if (_typeB in ["Land_BagBunker_Large_F", "Land_fortified_nest_big_EP1", "Land_fortified_nest_big", "Land_BagBunker_01_large_green_F", "Land_vn_bunker_big_01"]) exitWith {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building) - 180;
            private _zpos = AGLToASL (_building buildingPos 4);
            private _pos = _zpos getPos [2, _dir];
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            private _static = [_type, _pos, _dir] call _fnc_spawnStatic;
            _static setPos _pos; 
        };
        if (_typeB isEqualTo "Land_Bunker_01_big_F") exitWith {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building) - 180;
            private _zpos = AGLToASL (_building buildingPos 2);
            private _pos = _zpos getPos [-1, _dir];
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            private _static = [_type, _pos, _dir] call _fnc_spawnStatic;
            _static setPos _pos; 
            _zpos = AGLToASL (_building buildingPos 5);
            _pos = _zpos getPos [-1, _dir];
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            _static = [_type, _pos, _dir] call _fnc_spawnStatic;
            _static setPos _pos; 
        };
        if (_typeB isEqualTo "Land_Bunker_01_small_F") exitWith {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building) - 180;
            private _zpos = AGLToASL (_building buildingPos 1);
            private _pos = _zpos getPos [-1, _dir];
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            private _static = [_type, _pos, _dir] call _fnc_spawnStatic;
            _static setPos _pos; 
        };
        if (_typeB isEqualTo "Land_Bunker_01_tall_F") exitWith {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building) - 180;
            private _zpos = AGLToASL (_building buildingPos 3);
            private _pos = _zpos getPos [-1.5, _dir];
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            private _static = [_type, _pos, _dir] call _fnc_spawnStatic;
            _static setPos _pos; 
        };
        if (_typeB isEqualTo "land_gm_euro_misc_viewplatform_01") exitWith {
            private _type = selectRandom (_faction get "staticAA");
            private _dir = (getDir _building) - 180;
            private _zpos = AGLToASL (position _building);
            private _zOffset = [0, 0, 5.2];
            _zpos = _zpos vectorAdd _zOffset;
            private _pos = _zpos getPos [0.6, _dir];
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            private _static = [_type, _pos, _dir] call _fnc_spawnStatic;
            _static setPos _pos; 
        };
        if  ((_typeB == "Land_WW2_Bunker_H679")) exitWith
        {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building) - 90;
            private _pos = _building modelToWorld [-1.8,0,0.555];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if  ((_typeB == "Land_WW2_Bunker_Gun_R")) exitWith
        {
            private _type = selectRandom (_faction get "staticAT");
            private _dir = (getDir _building) - 180;
            private _pos = _building modelToWorld [0.2,0,0.3];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if  ((_typeB == "Land_WW2_Bunker_Gun_L")) exitWith
        {
            private _type = selectRandom (_faction get "staticAT");
            private _dir = (getDir _building) - 180;
            private _pos = _building modelToWorld [0,0,0.3];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if  ((_typeB == "Land_WW2_BET_Flak_Bettung")) exitWith
        {
            private _type = selectRandom (_faction get "staticAA");
            private _dir = (getDir _building) - 45;
            private _pos = _building modelToWorld [-1.2,1,0.2];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if  ((_typeB == "Land_SPE_H667")) exitWith
        {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building) - 180;
            private _pos = _building modelToWorld [0,-0.1,0.3];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if  ((_typeB == "Land_SPE_H612")) exitWith
        {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building) - 180;
            private _pos = _building modelToWorld [-0.3,-5,0.3];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if  ((_typeB == "Land_SPE_H630")) exitWith
        {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building) - 180;
            private _pos = _building modelToWorld [0.8,-2.5,0.3];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if  ((_typeB == "Land_SPE_H669")) exitWith
        {
            private _type = selectRandom (_faction get "staticAT");
            private _dir = (getDir _building) - 180;
            private _pos = _building modelToWorld [0,-3.2,0.3];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if  ((_typeB == "Land_SPE_H679")) exitWith
        {
            private _type = selectRandom (_faction get "staticAT");
            private _dir = (getDir _building) - 180;
            private _pos = _building modelToWorld [-0.2,-2,0.3];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if     ((_typeB == "LAND_uns_weapon_pit")) exitWith
        {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building) - 180;
            private _pos = _building modelToWorld [0.5,0.1,0.3];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if     ((_typeB == "LAND_CSJ_gunpit")) exitWith
        {
            private _type = selectRandom (_faction get "staticAA");
            private _dir = (getDir _building) - 90;
            private _pos = _building modelToWorld [0,0,1.2];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if     ((_typeB == "csj_VCbunk01")) exitWith
        {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building) - 180;
            private _pos = _building modelToWorld [0,0,-0.5];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
        if     ((_typeB == "Land_Vil_Tower")) exitWith
        {
            private _type = selectRandom (_faction get "staticMGs");
            private _dir = (getDir _building) - 180;
            private _pos = _building modelToWorld [-0.5,-0.7,1.3];
            [_type, _pos, _dir] call _fnc_spawnStatic;
        };
    };
};

//Spawning Marksmen on fixed buildingPos of chosen buildings
for "_i" from 0 to (count _buildings) - 1 do
{
    if (spawner getVariable _markerX == 2) exitWith {};
    private _building = _buildings select _i;
    private _typeB = typeOf _building;

    call {
        if (isObjectHidden _building) exitWith {};            // don't put statics on destroyed buildings
        if     ((_typeB == "Land_vn_o_snipertree_01") or (_typeB == "Land_vn_o_snipertree_02") or (_typeB == "Land_vn_o_snipertree_03") or (_typeB == "Land_vn_o_snipertree_04") or (_typeB == "Land_vn_o_platform_01") or (_typeB == "Land_vn_o_platform_02") or (_typeB == "Land_vn_o_platform_03")) exitWith
        {
            private _type = _faction get "unitMarksman";
            private _dir = (getDir _building) - 180;
            private _zpos = AGLToASL (_building buildingPos 0);
            private _pos = _zpos getPos [0, _dir];            // zeroes Z value because BIS
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            private _unit = [_type, _pos, _dir] call _fnc_spawnStaticUnit;
        };
    };
};

//Spawning Riflemen on fixed buildingPos of chosen buildings
for "_i" from 0 to (count _buildings) - 1 do
{
    if (spawner getVariable _markerX == 2) exitWith {};
    private _building = _buildings select _i;
    private _typeB = typeOf _building;

    call {
        if (isObjectHidden _building) exitWith {};            // don't put statics on destroyed buildings
        if (_typeB == "Land_vn_b_tower_01") exitWith {
            private _type = selectRandom ([_faction, "unitTierGuard"] call SCRT_fnc_unit_flattenTier);
            private _dir = (getDir _building) - 180;
            private _zpos = AGLToASL (_building buildingPos 0);
            private _pos = _zpos getPos [0, _dir];            // zeroes Z value because BIS
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            private _unit = [_type, _pos, _dir] call _fnc_spawnStaticUnit;
        };
        if (_typeB isEqualTo "Land_GuardTower_01_F" || {_typeB isEqualTo "Land_vn_guardtower_01_f" || {_typeB isEqualTo "Land_MobileRadar_01_radar_F"}}) exitWith {
            private _type = selectRandom ([_faction, "unitTierTower"] call SCRT_fnc_unit_flattenTier);
            private _dir = (getDir _building) - 180;
            private _zpos = AGLToASL (_building buildingPos 2);
            private _pos = _zpos getPos [0, _dir];            // zeroes Z value because BIS
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            private _unit = [_type, _pos, _dir] call _fnc_spawnStaticUnit;
        };
        if (_typeB isEqualTo "Land_GuardTower_02_F" || 
            {_typeB isEqualTo "Land_vn_guardtower_02_f" || 
            {_typeB isEqualTo "Land_vn_guardtower_03_f" || 
            {_typeB isEqualTo "Land_vn_guardtower_04_f" ||
            {_typeB isEqualTo "Land_Vez"
        }}}}) exitWith {
            private _type = selectRandom ([_faction, "unitTierGuard"] call SCRT_fnc_unit_flattenTier);
            private _dir = getDir _building;
            private _zpos = AGLToASL (_building buildingPos 0);
            private _pos = _zpos getPos [-0.4, _dir];
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            private _unit = [_type, _pos, _dir] call _fnc_spawnStaticUnit;
        };
        if (_typeB isEqualTo "Land_GuardHouse_02_F" || {_typeB isEqualTo "Land_GuardHouse_02_grey_F"}) exitWith {
            private _type = selectRandom ([_faction, "unitTierGuard"] call SCRT_fnc_unit_flattenTier);
            private _dir = getDir _building;
            private _zpos = AGLToASL (_building buildingPos 1);
            private _pos = _zpos getPos [0, _dir];            // zeroes Z value because BIS
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            private _unit = [_type, _pos, _dir] call _fnc_spawnStaticUnit;
        };
        if (_typeB isEqualTo "Land_GuardBox_01_brown_F" || 
           {_typeB isEqualTo "Land_GuardBox_01_green_F" || 
           {_typeB isEqualTo "Land_GuardBox_01_smooth_F"
        }}) exitWith {
            private _type = selectRandom ([_faction, "unitTierGuard"] call SCRT_fnc_unit_flattenTier);
            private _dir = (getDir _building) - 180;
            private _zpos = AGLToASL (_building buildingPos 0);
            private _pos = _zpos getPos [0, _dir];            // zeroes Z value because BIS
            _pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
            private _unit = [_type, _pos, _dir] call _fnc_spawnStaticUnit;
        };
    };
};



[_groupX,_vehiclesX,_soldiers,_spawnsUsed]
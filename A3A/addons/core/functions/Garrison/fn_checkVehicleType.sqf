#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_vehicle", "_preference"];

/*  Checks if the given vehicle type is within the preferred category
*   Params:
*     _vehicle : STRING : The vehicle type
*     _preference : STRING : The preferred category
*
*   Return:
*     _result : BOOLEAN : True if vehicle fits category, false otherwise
*/

//define list of vehicles as lazy conditions
#define lightVeh \
    {_vehicle in flatten FactionGet(occ,"vehiclesLightArmed")} \
    || {_vehicle in flatten FactionGet(occ,"vehiclesLightUnarmed")} \
    || {_vehicle in flatten FactionGet(inv,"vehiclesLightArmed")} \
    || {_vehicle in flatten FactionGet(inv,"vehiclesLightUnarmed")}

#define apc \
    {_vehicle in flatten FactionGet(occ,"vehiclesAPCs")} \
    || {_vehicle in flatten FactionGet(inv,"vehiclesAPCs")}

#define tank \
    {_vehicle in flatten FactionGet(occ,"vehiclesTanks")} \
    || {_vehicle in flatten FactionGet(inv,"vehiclesTanks")}

#define patrolHeli \
    {_vehicle in flatten FactionGet(occ,"vehiclesHelisLight")} \
    || {_vehicle in flatten FactionGet(inv,"vehiclesHelisLight")}

#define transportHeli \
    patrolHeli \
    || {_vehicle in flatten FactionGet(occ,"vehiclesHelisTransport")} \
    || {_vehicle in flatten FactionGet(inv,"vehiclesHelisTransport")}

#define attackHeli \
    {_vehicle in flatten FactionGet(occ,"vehiclesHelisAttack")} \
    || {_vehicle in flatten FactionGet(inv,"vehiclesHelisAttack")}

#define drone \
    {_vehicle in flatten FactionGet(occ,"uavsAttack")} \
    || {_vehicle in flatten FactionGet(inv,"uavsAttack")} \
    || {_vehicle in flatten FactionGet(occ,"uavsPortable")} \
    || {_vehicle in flatten FactionGet(inv,"uavsPortable")}

#define plane \
    {_vehicle in flatten FactionGet(occ,"vehiclesPlanesCAS")} \
    || {_vehicle in flatten FactionGet(inv,"vehiclesPlanesCAS")} \
    || {_vehicle in flatten FactionGet(inv,"vehiclesPlanesAA")} \
    || {_vehicle in flatten FactionGet(occ,"vehiclesPlanesGunship")} \
	|| {_vehicle in flatten FactionGet(occ,"vehiclesPlanesLargeCAS")} \
	|| {_vehicle in flatten FactionGet(inv,"vehiclesPlanesLargeAA")} \
	|| {_vehicle in flatten FactionGet(occ,"vehiclesPlanesLargeAA")} \
	|| {_vehicle in flatten FactionGet(inv,"vehiclesPlanesLargeCAS")} \
    || {_vehicle in flatten FactionGet(inv,"vehiclesPlanesGunship")}   

//TODO this does not work properly (maybe even throws errors) as the template files arent
//unified on how they work, await Pots Templates, then fix this
switch (_preference) do
{
    case ("EMPTY"):
    {
      _vehicle == "";
    };
    case ("LAND_START"):
    {
        _vehicle == "" || lightVeh;
    };
    case ("LAND_LIGHT"):
    {
      false || lightVeh;
    };
    case ("LAND_DEFAULT"):
    {
      false || lightVeh || apc;
    };
    case ("LAND_APC"):
    {
      false || apc;
    };
    case ("LAND_ATTACK"):
    {

      false || apc || tank;
    };
    case ("LAND_TANK"):
    {
      false || tank;
    };
    case ("LAND_AIR"):
    {
      _vehicle in flatten FactionGet(occ,"vehiclesAA") || {_vehicle in flatten FactionGet(inv,"vehiclesAA")};
    };
    case ("HELI_PATROL"):
    {
      _vehicle == "" || patrolHeli;
    };
    case ("HELI_LIGHT"):
    {
      false || patrolHeli;
    };
    case ("HELI_TRANSPORT"):
    {
        false || transportHeli;
    };
    case ("HELI_DEFAULT"):
    {
        false || transportHeli || attackHeli;
    };
    case ("HELI_ATTACK"):
    {
      false || attackHeli;
    };
    case ("AIR_DRONE"):
    {
      _vehicle == "" || drone
    };
    case ("AIR_GENERIC"):
    {
      false || drone || plane;
    };
    case ("AIR_DEFAULT"):
    {
      false || plane;
    };
};

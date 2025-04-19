params ["_preference", "_side"];

/*  Selects a fitting vehicle type based on given preference and side
*   Params:
*     _preference : STRING : The preferred vehicle type
*     _side : SIDE : The side of the vehicle
*
*   Returns:
*     _result : STRING : The className of the selected vehicle (also empty string or "Empty")
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private _faction = Faction(_side);

Verbose_2("SelectVehicleType: Selecting vehicle now, preferred is %1, side is %2", _preference, _side);

if(_preference == "LAND_AIR") exitWith { selectRandomWeighted (FactionGetTiered(_faction, "vehiclesAA")) };
if(_preference == "LAND_TANK") exitWith { selectRandomWeighted (FactionGetTiered(_faction, "vehiclesTanks")) };

private _possibleVehicles = [];
if(_preference in ["EMPTY", "LAND_START", "HELI_PATROL", "AIR_DRONE"]) then {
    _possibleVehicles pushBack "";
};

if(_preference in ["LAND_START", "LAND_LIGHT", "LAND_DEFAULT"]) then {
    _possibleVehicles append (FactionGetTiered(_faction, "vehiclesLightArmed"));
    _possibleVehicles append (FactionGetTiered(_faction, "vehiclesLightUnarmed"));
};

if(_preference in ["LAND_DEFAULT", "LAND_APC", "LAND_ATTACK"]) then {
    _possibleVehicles append (FactionGetTiered(_faction, "vehiclesAPCs"));
};

if(_preference in ["LAND_ATTACK"]) then {
    _possibleVehicles append (FactionGetTiered(_faction, "vehiclesTanks"));
};

if(_preference in ["HELI_PATROL", "HELI_LIGHT"]) then {
    _possibleVehicles append (FactionGetTiered(_faction, "vehiclesHelisLight"));
};

if(_preference in ["HELI_TRANSPORT", "HELI_DEFAULT"]) then {
    _possibleVehicles append (FactionGetTiered(_faction, "vehiclesHelisLight"));
    _possibleVehicles append (FactionGetTiered(_faction, "vehiclesHelisTransport"));
};

if(_preference in ["HELI_DEFAULT", "HELI_ATTACK"]) then {
    _possibleVehicles append (FactionGetTiered(_faction, "vehiclesHelisAttack"));
};

if(_preference in ["AIR_DRONE", "AIR_GENERIC"]) then {
    _possibleVehicles append (FactionGetTiered(_faction, "uavsAttack"));
    _possibleVehicles append (FactionGetTiered(_faction, "uavsPortable"));
};
if(_preference in ["AIR_GENERIC", "AIR_DEFAULT"]) then {
    _possibleVehicles append (FactionGetTiered(_faction, "vehiclesPlanesCAS"));
    _possibleVehicles append (FactionGetTiered(_faction, "vehiclesPlanesAA"));
    _possibleVehicles append (FactionGetTiered(_faction, "vehiclesPlanesGunship"));
};

if(count _possibleVehicles == 0) exitWith
{
    //Error_1("No result for %1, assuming bad parameter!", _preference);
    "Empty";
};

Verbose_1("SelectVehicleType: Preselection done, possible vehicles are %1", str _possibleVehicles);

selectRandomWeighted _possibleVehicles;

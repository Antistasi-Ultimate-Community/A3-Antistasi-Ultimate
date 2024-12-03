/*
Author: Håkon
Description:
    Generates a list off all assets used by the factions, replaces old global variables like vehAttack

Arguments: <Nil>

Return Value: <Hashmap> the hashmap A3A_faction_all

Scope: Server
Environment: unscheduled
Public: No
Dependencies:

Example:

License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

#define OccAndInv(VAR) (FactionGetOrDefault(occ, VAR, []) + FactionGetOrDefault(inv, VAR, []))
#define Reb(VAR) FactionGetOrDefault(reb, VAR, [])
#define Riv(VAR) FactionGetOrDefault(riv, VAR, [])
#define Occ(VAR) FactionGetOrDefault(occ, VAR, [])
#define Inv(VAR) FactionGetOrDefault(inv, VAR, [])

A3A_faction_all = createHashMap;
//setVar expects an array
#define setVar(VAR, VALUE) A3A_faction_all set [VAR, (VALUE) arrayIntersect (VALUE)];
#define getVar(VAR) (A3A_faction_all get VAR)


private _fnc_extractMarketClasses = {
    private _type = _this;
    private _vehicleRegisters = A3U_blackMarketStock select {(_x select 2) isEqualTo _type};
    if (_vehicleRegisters isEqualTo []) exitWith {[]};

    _vehicleRegisters apply {_x select 0}
};

private _fnc_setHashmap = {
    params ["_faction", "_templateVar"];

    private _map = createHashMap;
    {_map set [_x select 0, _x select 1]} forEach (_faction get _templateVar);
    _faction set [_templateVar, _map];
};

  //=====\\
 // Units \\
// ======= \\
Info("Identifying unit types");

//create empty lists
private _squadLeaders = [];
private _medics = [];
private _radioMen = [];

//add occ and inv units to the lists
{
    private _prefix = _x;
    {
        _squadLeaders pushBack ('loadouts_'+_prefix+_x+'SquadLeader');//type
        _medics pushBack ('loadouts_'+_prefix+_x+'Medic');
        _radioMen pushBack ('loadouts_'+_prefix+_x+'Radioman');
    } forEach ["militia_","military_","elite_","SF_"];//section
} forEach ["occ_", "inv_"];//prefix

_squadLeaders append [
    'loadouts_occ_other_Official',
    'loadouts_riv_militia_CellLeader',
    'loadouts_riv_militia_Commander',
    'loadouts_reb_militia_SquadLeader'
];
_medics append [
    'loadouts_reb_militia_Medic',
    'loadouts_riv_militia_Medic'
];

_radioMen pushBack 'loadouts_occ_other_Official';

//set the lists in the hm
setVar("SquadLeaders", _squadLeaders);
setVar("Medics", _medics);
setVar("Radiomen", _radioMen);

  //========\\
 // Vehicles \\
// ========== \\
Info("Identifying vehicle types");

//Occ&Inv X vehicles
//Antistasi Ultimate stuff
setVar("vehiclesDropPod", OccAndInv("vehiclesDropPod"));
setVar("vehiclesSDV", OccAndInv("vehiclesSDV"));
///
setVar("vehiclesPolice", OccAndInv("vehiclesPolice"));
setVar("vehiclesAttack", OccAndInv("vehiclesAttack"));
setVar("vehiclesAmmoTrucks", OccAndInv("vehiclesAmmoTrucks"));
setVar("vehiclesLightAPCs", OccAndInv("vehiclesLightAPCs") + OccAndInv("vehiclesMilitiaAPCs") + OccAndInv("vehiclesAirborne"));
setVar("vehiclesMedical", OccAndInv("vehiclesMedical") + ((A3A_faction_civ get "vehiclesCivMedical") select {_x isEqualType ""}));
setVar("vehiclesAPCs", OccAndInv("vehiclesAPCs") + Riv("vehiclesRivalsAPCs") + ("APC" call _fnc_extractMarketClasses));
setVar("vehiclesIFVs", OccAndInv("vehiclesIFVs") );
setVar("vehiclesUAVs", OccAndInv("uavsAttack")+ OccAndInv("uavsPortable") + Riv("vehiclesRivalsUavs") + ("UAV" call _fnc_extractMarketClasses));
setVar("vehiclesAA", OccAndInv("vehiclesAA") + ("AA" call _fnc_extractMarketClasses) + Reb("vehiclesAA"));
setVar("vehiclesArtillery", OccAndInv("vehiclesArtillery") + ("ARTILLERY" call _fnc_extractMarketClasses));
setVar("vehiclesTanks", OccAndInv("vehiclesTanks") + Riv("vehiclesRivalsTanks") + ("TANK" call _fnc_extractMarketClasses));
setVar("vehiclesTransportAir", OccAndInv("vehiclesHelisLight") + OccAndInv("vehiclesHelisTransport") + OccAndInv("vehiclesPlanesTransport"));
setVar("vehiclesHelisLight", OccAndInv("vehiclesHelisLight") );
setVar("vehiclesHelisLightAttack", OccAndInv("vehiclesHelisLightAttack") );
setVar("vehiclesHelisAttack", OccAndInv("vehiclesHelisAttack") );
setVar("vehiclesHelisTransport", OccAndInv("vehiclesHelisTransport") );
setVar("vehiclesPlanesAA", OccAndInv("vehiclesPlanesAA") );
setVar("vehiclesPlanesCAS", OccAndInv("vehiclesPlanesCAS") );
setVar("vehiclesPlanesLargeAA", OccAndInv("vehiclesPlanesLargeAA") );
setVar("vehiclesPlanesLargeCAS", OccAndInv("vehiclesPlanesLargeCAS") );
setVar("vehiclesPlanesTransport", OccAndInv("vehiclesPlanesTransport"));
setVar("vehiclesPlanesGunship", OccAndInv("vehiclesPlanesGunship"));
setVar("staticMortars", OccAndInv("staticMortars") + Riv("staticMortars") + Reb("staticMortars") + ("STATICMORTAR" call _fnc_extractMarketClasses));
setVar("staticAA", OccAndInv("staticAA") + Reb("staticAA") + ("STATICAA" call _fnc_extractMarketClasses));
setVar("staticAT", OccAndInv("staticAT") + Reb("staticAT") + ("STATICAT" call _fnc_extractMarketClasses));
setVar("staticMGs", OccAndInv("staticMGs") + Riv("staticLowWeapons") + Reb("staticMGs") + ("STATICMG" call _fnc_extractMarketClasses));

//Antistasi Plus stuff
setVar("vehiclesAirborne", OccAndInv("vehiclesAirborne"));
setVar("vehiclesLightTanks", OccAndInv("vehiclesLightTanks"));

setVar("vehicleRadars", [Occ("vehicleRadar"), Inv("vehicleRadar")]);
setVar("vehicleSams", [Occ("vehicleSam"), Inv("vehicleSam")]);
setVar("staticHowitzers", OccAndInv("staticHowitzers"));

[A3A_faction_inv, "animations"] call _fnc_setHashmap;
[A3A_faction_occ, "animations"] call _fnc_setHashmap;
[A3A_faction_reb, "animations"] call _fnc_setHashmap;
[A3A_faction_riv, "animations"] call _fnc_setHashmap;
[A3A_faction_civ, "animations"] call _fnc_setHashmap;
[A3A_faction_inv, "variants"] call _fnc_setHashmap;
[A3A_faction_occ, "variants"] call _fnc_setHashmap;
[A3A_faction_reb, "variants"] call _fnc_setHashmap;
[A3A_faction_riv, "variants"] call _fnc_setHashmap;
[A3A_faction_civ, "variants"] call _fnc_setHashmap;

//Rivals
private _vehRivalsArmor = Riv("vehiclesRivalsAPCs") + Riv("vehiclesRivalsTanks");
setVar("vehiclesRivalsArmor", _vehRivalsArmor);

private _vehRivalsLight = Riv("vehiclesRivalsCars") + Riv("vehiclesRivalsLightArmed") + Riv("vehiclesRivalsTrucks");
setVar("vehiclesRivalsLight", _vehRivalsLight);

private _vehRivalsStatics = Riv("staticMGs") + Riv("staticAT") + Riv("staticAA");
setVar("vehiclesRivalsStatics", _vehRivalsStatics);

private _vehRivalsAir = Riv("vehiclesRivalsHelis");
setVar("vehiclesRivalsAir", _vehRivalsAir);

private _vehRivals = Riv("vehiclesRivalsAPCs") 
+ Riv("vehiclesRivalsTanks") 
+ Riv("vehiclesRivalsTrucks") 
+ Riv("vehiclesRivalsCars") 
+ Riv("vehiclesRivalsLightArmed") 
+ Riv("vehiclesRivalsUavs")
+ Riv("vehiclesRivalsHelis");
setVar("vehiclesRivals", _vehRivals);

private _vehMilitia = OccAndInv("vehiclesMilitiaCars")
+ OccAndInv("vehiclesMilitiaTrucks")
+ OccAndInv("vehiclesMilitiaLightArmed")
+ OccAndInv("vehiclesMilitiaAPCs");
setVar("vehiclesMilitia", _vehMilitia);

//boats
private _vehBoats = OccAndInv("vehiclesTransportBoats") + OccAndInv("vehiclesGunBoats") + Reb("vehiclesBoat");
setVar("vehiclesBoats", _vehBoats);

//Occ&Inv helicopters
private _vehHelis =
OccAndInv("vehiclesHelisTransport")
+ OccAndInv("vehiclesHelisLightAttack")
+ OccAndInv("vehiclesHelisAttack")
+ OccAndInv("vehiclesHelisLight")
+ ("HELI" call _fnc_extractMarketClasses);
setVar("vehiclesHelis", _vehHelis);

//fixed winged aircrafts
private _vehFixedWing =
OccAndInv("vehiclesPlanesCAS")
+ OccAndInv("vehiclesPlanesAA")
+ OccAndInv("vehiclesPlanesLargeAA")
+ OccAndInv("vehiclesPlanesLargeCAS")
+ OccAndInv("vehiclesPlanesTransport")
+ Reb("vehiclesPlane")
+ Reb("vehiclesCivPlane")
+ ("PLANE" call _fnc_extractMarketClasses);
setVar("vehiclesFixedWing", _vehFixedWing);

//trucks to carry infantry
private _vehTrucks =
OccAndInv("vehiclesTrucks")
+ OccAndInv("vehiclesMilitiaTrucks")
+ Riv("vehiclesRivalsTrucks")
+ Reb("vehiclesTruck");
setVar("vehiclesTrucks", _vehTrucks);

//Armed cars
private _carsArmed =
OccAndInv("vehiclesLightArmed")
+ OccAndInv("vehiclesMilitiaLightArmed")
+ Reb("vehiclesLightArmed")
+ Riv("vehiclesRivalsLightArmed")
+ ("ARMEDCAR" call _fnc_extractMarketClasses);
setVar("vehiclesLightArmed", _carsArmed);

//Unarmed cars
private _carsUnarmed =
OccAndInv("vehiclesLightUnarmed")      // anything else?
+ OccAndInv("vehiclesMilitiaCars")
+ OccAndInv("vehiclesPolice")
+ Riv("vehiclesRivalsCars")
+ ("UNARMEDCAR" call _fnc_extractMarketClasses)
+ Reb("vehiclesLightUnarmed");
setVar("vehiclesLightUnarmed", _carsUnarmed);
setVar("vehiclesLight", _carsArmed + _carsUnarmed);

//all Occ&Inv armor
private _vehArmor =
getVar("vehiclesTanks")
+ getVar("vehiclesAA")
+ getVar("vehiclesArtillery")
+ getVar("vehiclesLightAPCs")
+ getVar("vehiclesAPCs")
+ getVar("vehiclesLightTanks")
+ getVar("vehiclesAirborne")
+ getVar("vehiclesIFVs");
setVar("vehiclesArmor", _vehArmor);

//rebel vehicles
private _vehReb = 
    Reb("vehiclesBasic") + Reb("vehiclesTruck") + Reb("vehiclesBoat")
    + Reb("vehiclesAT") + Reb("vehiclesLightArmed") + Reb("vehiclesLightUnarmed")
    + Reb("staticMGs") + Reb("staticAT") + Reb("staticAA") + Reb("staticMortars")
    + Reb("vehiclesHelis") + Reb("vehiclesPlane") + Reb("vehiclesMedical") + Reb("vehiclesAA")
    + (A3U_blackMarketStock apply {_x select 0});
setVar("vehiclesReb", _vehReb);

//trucks that can cary logistics cargo
private _vehCargoTrucks = (_vehTrucks + OccAndInv("vehiclesCargoTrucks")) select { [_x] call A3A_Logistics_fnc_getVehCapacity > 1 };
setVar("vehiclesCargoTrucks", _vehCargoTrucks);

missionNamespace setVariable ["A3A_faction_all", A3A_faction_all, true];
A3A_faction_all

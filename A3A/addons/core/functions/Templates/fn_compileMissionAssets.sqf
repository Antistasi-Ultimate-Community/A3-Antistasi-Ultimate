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
setVar("vehiclesDropPod", OccAndInv("vehiclesDropPod") select {_x isEqualType ""});
setVar("vehiclesSDV", OccAndInv("vehiclesSDV") select {_x isEqualType ""});
///
setVar("vehiclesPolice", OccAndInv("vehiclesPolice") select {_x isEqualType ""});
setVar("vehiclesAttack", OccAndInv("vehiclesAttack") select {_x isEqualType ""});
setVar("vehiclesAmmoTrucks", OccAndInv("vehiclesAmmoTrucks") select {_x isEqualType ""});
setVar("vehiclesLightAPCs", (OccAndInv("vehiclesLightAPCs") + OccAndInv("vehiclesMilitiaAPCs") + OccAndInv("vehiclesAirborne")) select {_x isEqualType ""});
setVar("vehiclesMedical", (OccAndInv("vehiclesMedical") + (A3A_faction_civ get "vehiclesCivMedical")) select {_x isEqualType ""});
setVar("vehiclesAPCs", (OccAndInv("vehiclesAPCs") + Riv("vehiclesRivalsAPCs") + ("APC" call _fnc_extractMarketClasses)) select {_x isEqualType ""});
setVar("vehiclesIFVs", OccAndInv("vehiclesIFVs") select {_x isEqualType ""});
setVar("vehiclesUAVs", (OccAndInv("uavsAttack")+ OccAndInv("uavsPortable") + Riv("vehiclesRivalsUavs") + ("UAV" call _fnc_extractMarketClasses)) select {_x isEqualType ""});
setVar("vehiclesAA", (OccAndInv("vehiclesAA") + ("AA" call _fnc_extractMarketClasses) + Reb("vehiclesAA")) select {_x isEqualType ""});
setVar("vehiclesArtillery", (OccAndInv("vehiclesArtillery") + ("ARTILLERY" call _fnc_extractMarketClasses)) select {_x isEqualType ""});
setVar("vehiclesTanks", (OccAndInv("vehiclesTanks") + Riv("vehiclesRivalsTanks") + ("TANK" call _fnc_extractMarketClasses)) select {_x isEqualType ""});
setVar("vehiclesTransportAir", (OccAndInv("vehiclesHelisLight") + OccAndInv("vehiclesHelisTransport") + OccAndInv("vehiclesPlanesTransport")) select {_x isEqualType ""});
setVar("vehiclesHelisLight", OccAndInv("vehiclesHelisLight") select {_x isEqualType ""});
setVar("vehiclesHelisLightAttack", OccAndInv("vehiclesHelisLightAttack") select {_x isEqualType ""});
setVar("vehiclesHelisAttack", OccAndInv("vehiclesHelisAttack") select {_x isEqualType ""});
setVar("vehiclesHelisTransport", OccAndInv("vehiclesHelisTransport") select {_x isEqualType ""});
setVar("vehiclesPlanesAA", OccAndInv("vehiclesPlanesAA") select {_x isEqualType ""});
setVar("vehiclesPlanesCAS", OccAndInv("vehiclesPlanesCAS") select {_x isEqualType ""});
setVar("vehiclesPlanesLargeAA", OccAndInv("vehiclesPlanesLargeAA") select {_x isEqualType ""});
setVar("vehiclesPlanesLargeCAS", OccAndInv("vehiclesPlanesLargeCAS") select {_x isEqualType ""});
setVar("vehiclesPlanesTransport", OccAndInv("vehiclesPlanesTransport") select {_x isEqualType ""});
setVar("vehiclesAirPatrol", OccAndInv("vehiclesAirPatrol") select {_x isEqualType ""});
setVar("vehiclesPlanesGunship", OccAndInv("vehiclesPlanesGunship") select {_x isEqualType ""});
setVar("staticMortars", (OccAndInv("staticMortars") + Riv("staticMortars") + Reb("staticMortars") + ("STATICMORTAR" call _fnc_extractMarketClasses)) select {_x isEqualType ""});
setVar("staticAA", (OccAndInv("staticAA") + Reb("staticAA") + ("STATICAA" call _fnc_extractMarketClasses)) select {_x isEqualType ""});
setVar("staticAT", (OccAndInv("staticAT") + Reb("staticAT") + ("STATICAT" call _fnc_extractMarketClasses)) select {_x isEqualType ""});
setVar("staticMGs", (OccAndInv("staticMGs") + Riv("staticLowWeapons") + Reb("staticMGs") + ("STATICMG" call _fnc_extractMarketClasses)) select {_x isEqualType ""});

//Antistasi Plus stuff
setVar("vehiclesAirborne", OccAndInv("vehiclesAirborne") select {_x isEqualType ""});
setVar("vehiclesLightTanks", OccAndInv("vehiclesLightTanks") select {_x isEqualType ""});

setVar("vehicleRadars", [Occ("vehicleRadar"), Inv("vehicleRadar")] select {_x isEqualType ""});
setVar("vehicleSams", [Occ("vehicleSam"), Inv("vehicleSam")] select {_x isEqualType ""});
setVar("staticHowitzers", OccAndInv("staticHowitzers") select {_x isEqualType ""});

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
setVar("vehiclesRivalsArmor", _vehRivalsArmor select {_x isEqualType ""});

private _vehRivalsLight = Riv("vehiclesRivalsCars") + Riv("vehiclesRivalsLightArmed") + Riv("vehiclesRivalsTrucks");
setVar("vehiclesRivalsLight", _vehRivalsLight select {_x isEqualType ""});

private _vehRivalsStatics = Riv("staticMGs") + Riv("staticAT") + Riv("staticAA");
setVar("vehiclesRivalsStatics", _vehRivalsStatics select {_x isEqualType ""});

private _vehRivalsAir = Riv("vehiclesRivalsHelis");
setVar("vehiclesRivalsAir", _vehRivalsAir select {_x isEqualType ""});

private _vehRivals = Riv("vehiclesRivalsAPCs") 
+ Riv("vehiclesRivalsTanks") 
+ Riv("vehiclesRivalsTrucks") 
+ Riv("vehiclesRivalsCars") 
+ Riv("vehiclesRivalsLightArmed") 
+ Riv("vehiclesRivalsUavs")
+ Riv("vehiclesRivalsHelis");
setVar("vehiclesRivals", _vehRivals select {_x isEqualType ""});

private _vehMilitia = OccAndInv("vehiclesMilitiaCars")
+ OccAndInv("vehiclesMilitiaTrucks")
+ OccAndInv("vehiclesMilitiaLightArmed")
+ OccAndInv("vehiclesMilitiaAPCs");
setVar("vehiclesMilitia", _vehMilitia select {_x isEqualType ""});

//boats
private _vehBoats = OccAndInv("vehiclesTransportBoats") + OccAndInv("vehiclesGunBoats") + Reb("vehiclesBoat");
setVar("vehiclesBoats", _vehBoats select {_x isEqualType ""});

//Occ&Inv helicopters
private _vehHelis =
OccAndInv("vehiclesHelisTransport")
+ OccAndInv("vehiclesHelisLightAttack")
+ OccAndInv("vehiclesHelisAttack")
+ OccAndInv("vehiclesHelisLight")
+ ("HELI" call _fnc_extractMarketClasses);
setVar("vehiclesHelis", _vehHelis select {_x isEqualType ""});

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
setVar("vehiclesFixedWing", _vehFixedWing select {_x isEqualType ""});

//trucks to carry infantry
private _vehTrucks =
OccAndInv("vehiclesTrucks")
+ OccAndInv("vehiclesMilitiaTrucks")
+ Riv("vehiclesRivalsTrucks")
+ Reb("vehiclesTruck");
setVar("vehiclesTrucks", _vehTrucks select {_x isEqualType ""});

//Armed cars
private _carsArmed =
OccAndInv("vehiclesLightArmed")
+ OccAndInv("vehiclesMilitiaLightArmed")
+ Reb("vehiclesLightArmed")
+ Riv("vehiclesRivalsLightArmed")
+ ("ARMEDCAR" call _fnc_extractMarketClasses);
setVar("vehiclesLightArmed", _carsArmed select {_x isEqualType ""});

//Unarmed cars
private _carsUnarmed =
OccAndInv("vehiclesLightUnarmed")      // anything else?
+ OccAndInv("vehiclesMilitiaCars")
+ OccAndInv("vehiclesPolice")
+ Riv("vehiclesRivalsCars")
+ ("UNARMEDCAR" call _fnc_extractMarketClasses)
+ Reb("vehiclesLightUnarmed");
setVar("vehiclesLightUnarmed", _carsUnarmed);
setVar("vehiclesLight", (_carsArmed + _carsUnarmed) select {_x isEqualType ""});

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
setVar("vehiclesArmor", _vehArmor select {_x isEqualType ""});

//rebel vehicles
private _vehReb = 
    Reb("vehiclesBasic") + Reb("vehiclesTruck") + Reb("vehiclesBoat")
    + Reb("vehiclesAT") + Reb("vehiclesLightArmed") + Reb("vehiclesLightUnarmed")
    + Reb("staticMGs") + Reb("staticAT") + Reb("staticAA") + Reb("staticMortars")
    + Reb("vehiclesHelis") + Reb("vehiclesPlane") + Reb("vehiclesMedical") + Reb("vehiclesAA")
    + (A3U_blackMarketStock apply {_x select 0});
setVar("vehiclesReb", _vehReb select {_x isEqualType ""});

//trucks that can cary logistics cargo
private _vehCargoTrucks = (_vehTrucks + OccAndInv("vehiclesCargoTrucks")) select { _x isEqualType "" && {[_x] call A3A_Logistics_fnc_getVehCapacity > 1} };
setVar("vehiclesCargoTrucks", _vehCargoTrucks);

missionNamespace setVariable ["A3A_faction_all", A3A_faction_all, true];
A3A_faction_all

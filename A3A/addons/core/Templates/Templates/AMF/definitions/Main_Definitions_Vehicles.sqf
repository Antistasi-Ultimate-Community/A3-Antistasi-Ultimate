/////////////////////////////////
//  Vehicle Definitions          //
/////////////////////////////////

["vehiclesBasic", _vehiclesBasic] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", _vehiclesLightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;
["vehiclesTrucks", _vehiclesTrucks] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", _vehiclesCargoTrucks] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", _vehiclesAmmoTrucks] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", _vehiclesRepairTrucks] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", _vehiclesFuelTrucks] call _fnc_saveToTemplate;
["vehiclesMedical", _vehiclesMedicalTrucks] call _fnc_saveToTemplate;
["vehiclesLightAPCs", _vehiclesLightAPCs] call _fnc_saveToTemplate;
["vehiclesAPCs", _vehiclesAPCs] call _fnc_saveToTemplate;
["vehiclesIFVs", _vehiclesIFVs] call _fnc_saveToTemplate;
["vehiclesAirborne", _vehiclesAirborne] call _fnc_saveToTemplate;
["vehiclesAA", _vehiclesAA] call _fnc_saveToTemplate;
["vehiclesLightTanks", _vehiclesLightTanks] call _fnc_saveToTemplate;
["vehiclesTanks", _vehiclesTanks] call _fnc_saveToTemplate;
["vehiclesTransportBoats", _vehiclesTransportBoats] call _fnc_saveToTemplate;
["vehiclesGunBoats", _vehiclesGunBoats] call _fnc_saveToTemplate;
["vehiclesPlanesCAS", _vehiclesPlanesCAS] call _fnc_saveToTemplate;
["vehiclesPlanesAA", _vehiclesPlanesAA] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", _vehiclesPlanesTransport] call _fnc_saveToTemplate;
["vehiclesPlanesGunship", _vehiclesPlanesGunship] call _fnc_saveToTemplate;
["vehiclesPlanesLargeCAS", _vehiclesPlanesLargeCAS] call _fnc_saveToTemplate;
["vehiclesPlanesLargeAA", _vehiclesPlanesLargeAA] call _fnc_saveToTemplate;
["vehiclesHelisLight", _vehiclesHelisLight] call _fnc_saveToTemplate;
["vehiclesHelisTransport", _vehiclesHelisTransport] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", _vehiclesHelisLightAttack] call _fnc_saveToTemplate;
["vehiclesHelisAttack", _vehiclesHelisAttack] call _fnc_saveToTemplate;
["vehiclesAirPatrol", _vehiclesAirPatrol] call _fnc_saveToTemplate;
["vehiclesArtillery", _vehiclesArtillery] call _fnc_saveToTemplate;
["uavsPortable", _uavsPortable] call _fnc_saveToTemplate;
["uavsAttack", _uavsAttack] call _fnc_saveToTemplate;

// Config-specific vehicle customisation data.
["animations", _animations] call _fnc_saveToTemplate;
["variants", _variants] call _fnc_saveToTemplate;

// Early-game / militia / police pools.
["vehiclesMilitiaTrucks", _vehiclesMilitiaTrucks] call _fnc_saveToTemplate;
["vehiclesMilitiaLightArmed", _vehiclesMilitiaLightArmed] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", _vehiclesMilitiaCars] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", _vehiclesMilitiaAPCs] call _fnc_saveToTemplate;
["vehiclesPolice", _vehiclesPolice] call _fnc_saveToTemplate;

// Radar/SAM are singular template fields and take one classname, not an array.
["vehicleRadar", _vehiclesRadar] call _fnc_saveToTemplate;
["vehicleSam", _vehiclesSam] call _fnc_saveToTemplate;

// Static weapons and minefields.
["staticAA", _staticAA] call _fnc_saveToTemplate;
["staticMGs", _staticMG] call _fnc_saveToTemplate;
["staticAT", _staticAT] call _fnc_saveToTemplate;
["staticMortars", _staticMortars] call _fnc_saveToTemplate;
["staticHowitzers", _staticHowitzers] call _fnc_saveToTemplate;
["minefieldAT", _minefieldAT] call _fnc_saveToTemplate;
["minefieldAPERS", _minefieldAPERS] call _fnc_saveToTemplate;


["vehiclesSDV", _SDV] call _fnc_saveToTemplate;
["vehiclesDropPod", _DropPod] call _fnc_saveToTemplate; 

["vehiclesAirPatrol", _airPatrol] call _fnc_saveToTemplate;
["vehiclesPlanesGunship", _gunship] call _fnc_saveToTemplate;
["vehiclesGunBoats", _gunBoat] call _fnc_saveToTemplate;
["vehiclesTransportBoats", _transportBoat] call _fnc_saveToTemplate;
["staticAA", _staticAA] call _fnc_saveToTemplate;
["uavsAttack", _uavsAttack] call _fnc_saveToTemplate;
["uavsPortable", _uavsPortable] call _fnc_saveToTemplate;
["staticMGs", _staticMG] call _fnc_saveToTemplate;
["staticAT", _staticAT] call _fnc_saveToTemplate;
["staticMortars", _staticMortars] call _fnc_saveToTemplate;
["mortarMagazineHE", _mortarMagazineHE] call _fnc_saveToTemplate;
["mortarMagazineSmoke", _mortarMagazineSmoke] call _fnc_saveToTemplate;
["mortarMagazineFlare", _mortarMagazineFlare] call _fnc_saveToTemplate;
["howitzerMagazineHE", _howitzerMagazineHE] call _fnc_saveToTemplate;
["minefieldAT", _minefieldAT] call _fnc_saveToTemplate;
["minefieldAPERS", _minefieldAPERS] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", _militiaTrucks] call _fnc_saveToTemplate;
["vehiclesMilitiaLightArmed", _militiaLightArmed] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", _militiaCars] call _fnc_saveToTemplate;
["vehiclesPolice", _policeVehs] call _fnc_saveToTemplate;
["vehiclesBasic", _basic] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", _planesTransport] call _fnc_saveToTemplate;
["vehiclesHelisLight", _helisLight] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", _helisLightAttack] call _fnc_saveToTemplate;
["vehiclesHelisAttack", _helisAttack] call _fnc_saveToTemplate;
["vehiclesHelisTransport", _transportHelicopters] call _fnc_saveToTemplate;
["staticHowitzers", _howitzers] call _fnc_saveToTemplate;
["vehicleRadar", _radar] call _fnc_saveToTemplate;
["vehicleSam", _SAM] call _fnc_saveToTemplate;
["vehiclesPlanesCAS", _planesCAS] call _fnc_saveToTemplate;
["vehiclesPlanesAA", _planesAA] call _fnc_saveToTemplate;
["vehiclesArtillery", _artillery] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray _artilleryMags] call _fnc_saveToTemplate;
["vehiclesLightAPCs", _lightAPCs] call _fnc_saveToTemplate;
["vehiclesAPCs", _APCs] call _fnc_saveToTemplate;
["vehiclesIFVs", _IFVs] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", _militiaAPCs] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", _lightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _lightArmed] call _fnc_saveToTemplate;
["vehiclesLightTanks",  _lightTanks] call _fnc_saveToTemplate;
["vehiclesAirborne", _airborneVehicles] call _fnc_saveToTemplate;
["vehiclesAA", _aa] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", _cargoTrucks] call _fnc_saveToTemplate;
["vehiclesTanks", _tanks] call _fnc_saveToTemplate;
["vehiclesTrucks", _Trucks] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", _ammoTrucks] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", _repairTrucks] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", _fuelTrucks] call _fnc_saveToTemplate;
["vehiclesMedical", _medicalTrucks] call _fnc_saveToTemplate;

["animations", _animations] call _fnc_saveToTemplate;
["variants", _variants] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", _faces] call _fnc_saveToTemplate;
["voices", _voices] call _fnc_saveToTemplate;

["insignia", _insignia] call _fnc_saveToTemplate;
["milInsignia", _milInsignia] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

// Note on loadout array weighting:
// If a given loadoutData variable has a weighted array, make sure all mod/DLC compats also have a weighted array for the same.
// To simplify work on mod/DLC compats, the weighted arrays here are made to sum up to 10. This is so that compats have a consistent base to work off but is not strictly necessary.

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", _slRifles];
_loadoutData set ["rifles", _rifles];
_loadoutData set ["carbines", _carbines];
_loadoutData set ["grenadeLaunchers", _grenadeLaunchers];
_loadoutData set ["designatedGrenadeLaunchers", _designatedGrenadeLaunchers];
_loadoutData set ["SMGs", _SMGs];
_loadoutData set ["machineGuns", _machineGuns];
_loadoutData set ["marksmanRifles", _marksmanRifles];
_loadoutData set ["sniperRifles", _sniperRifles];
_loadoutData set ["lightATLaunchers", _lightATLaunchers];
_loadoutData set ["lightHELaunchers", _lightHELaunchers];
_loadoutData set ["ATLaunchers", _ATLaunchers];
_loadoutData set ["missileATLaunchers", _missleATLaunchers];
_loadoutData set ["AALaunchers", _AALaunchers];
_loadoutData set ["sidearms", _sidearms];
_loadoutData set ["GLsidearms", _GLsidearms];

_loadoutData set ["ATMines", _ATMines];
_loadoutData set ["APMines", _APMines];
_loadoutData set ["lightExplosives", _lightExplosives];
_loadoutData set ["heavyExplosives", _heavyExplosives];

_loadoutData set ["antiInfantryGrenades", _antiInfantryGrenades];
_loadoutData set ["antiTankGrenades", _antiTankGrenades];
_loadoutData set ["smokeGrenades", _smokeGrenades];
_loadoutData set ["signalsmokeGrenades", _signalsmokeGrenades];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", _maps];
_loadoutData set ["watches", _watches];
_loadoutData set ["compasses", _compasses];
_loadoutData set ["radios", _radios];
_loadoutData set ["gpses", _gpses];
_loadoutData set ["NVGs", _NVGs];
_loadoutData set ["binoculars", _binoculars];
_loadoutData set ["rangefinders", _rangefinders];

_loadoutData set ["traitorUniforms", _traitorUniforms];
_loadoutData set ["traitorVests", _traitorVests];
_loadoutData set ["traitorHats", _traitorHats];
_loadoutData set ["officerUniforms", _officerUniforms];
_loadoutData set ["officerVests", _officerVests];
_loadoutData set ["officerHats", _officerHats];
_loadoutData set ["cloakUniforms", _cloakUniforms];
_loadoutData set ["cloakVests", _cloakVests];
_loadoutData set ["cloakRifles", _cloakRifles];
_loadoutData set ["cloakCarbines", _cloakCarbines];
_loadoutData set ["cloakSidearms", _cloakSidearms];

_loadoutData set ["uniforms", _uniforms];
_loadoutData set ["slUniforms", _SLuniforms];
_loadoutData set ["vests", _vests];
_loadoutData set ["Hvests", _Hvests];
_loadoutData set ["MGvests", _MGvests];
_loadoutData set ["MEDvests", _MEDvests];
_loadoutData set ["SLvests", _SLvests];
_loadoutData set ["sniVests", _SNIvests];
_loadoutData set ["GLvests", _GLvests];
_loadoutData set ["backpacks", _backpacks];
_loadoutData set ["atBackpacks", _ATBackpacks];
_loadoutData set ["aaBackpacks", _AABackpacks];
_loadoutData set ["medBackpacks", _MEDBackpacks];
_loadoutData set ["engBackpacks", _ENGBackpacks];
_loadoutData set ["expBackpacks", _EXPBackpacks];
_loadoutData set ["longRangeRadios", _longRangeRadios];
_loadoutData set ["helmets", _helmets];
_loadoutData set ["slHat", _SLhats];
_loadoutData set ["sniHats", _SNIhats];

_loadoutData set ["facewear", _facewear];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
_loadoutData set ["items_squadLeader_extras", _slItems];
_loadoutData set ["items_rifleman_extras", _rItems];
_loadoutData set ["items_medic_extras", _mItems];
_loadoutData set ["items_grenadier_extras", _gItems];
_loadoutData set ["items_explosivesExpert_extras", _eeItems];
_loadoutData set ["items_engineer_extras", _eeItems];
_loadoutData set ["items_lat_extras", _latItems];
_loadoutData set ["items_at_extras", _atItems];
_loadoutData set ["items_aa_extras", _aaItems];
_loadoutData set ["items_machineGunner_extras", _mgItems];
_loadoutData set ["items_marksman_extras", _mmItems];
_loadoutData set ["items_sniper_extras", _mmItems];
_loadoutData set ["items_police_extras", _pItems];
_loadoutData set ["items_crew_extras", _cItems];
_loadoutData set ["items_unarmed_extras", _uItems];

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
if (count _sfslRifles > 0) then { _sfLoadoutData set ["slRifles", _sfslRifles]; };
if (count _sfrifles > 0) then { _sfLoadoutData set ["rifles", _sfrifles]; };
if (count _sfcarbines > 0) then { _sfLoadoutData set ["carbines", _sfcarbines]; };
if (count _sfgrenadeLaunchers > 0) then { _sfLoadoutData set ["grenadeLaunchers", _sfgrenadeLaunchers]; };
if (count _sfdesignatedGrenadeLaunchers > 0) then { _sfLoadoutData set ["designatedGrenadeLaunchers", _sfdesignatedGrenadeLaunchers]; };
if (count _sfSMGs > 0) then { _sfLoadoutData set ["SMGs", _sfSMGs]; };
if (count _sfmachineGuns > 0) then { _sfLoadoutData set ["machineGuns", _sfmachineGuns]; };
if (count _sfmarksmanRifles > 0) then { _sfLoadoutData set ["marksmanRifles", _sfmarksmanRifles]; };
if (count _sfsniperRifles > 0) then { _sfLoadoutData set ["sniperRifles", _sfsniperRifles]; };
if (count _sflightATLaunchers > 0) then { _sfLoadoutData set ["lightATLaunchers", _sflightATLaunchers]; };
if (count _sflightHELaunchers > 0) then { _sfLoadoutData set ["lightHELaunchers", _sflightHELaunchers]; };
if (count _sfATLaunchers > 0) then { _sfLoadoutData set ["ATLaunchers", _sfATLaunchers]; };
if (count _sfmissleATLaunchers > 0) then { _sfLoadoutData set ["missileATLaunchers", _sfmissleATLaunchers]; };
if (count _sfAALaunchers > 0) then { _sfLoadoutData set ["AALaunchers", _sfAALaunchers]; };
if (count _sfsidearms > 0) then { _sfLoadoutData set ["sidearms", _sfsidearms]; };
if (count _sfGLsidearms > 0) then { _sfLoadoutData set ["GLsidearms", _sfGLsidearms]; };

if (count _sfATMines > 0) then { _sfLoadoutData set ["ATMines", _sfATMines]; };
if (count _sfAPMines > 0) then { _sfLoadoutData set ["APMines", _sfAPMines]; };
if (count _sflightExplosives > 0) then { _sfLoadoutData set ["lightExplosives", _sflightExplosives]; };
if (count _sfheavyExplosives > 0) then { _sfLoadoutData set ["heavyExplosives", _sfheavyExplosives]; };

if (count _sfantiInfantryGrenades > 0) then { _sfLoadoutData set ["antiInfantryGrenades", _sfantiInfantryGrenades]; };
if (count _sfsmokeGrenades > 0) then { _sfLoadoutData set ["smokeGrenades", _sfsmokeGrenades]; };
if (count _sfsignalsmokeGrenades > 0) then { _sfLoadoutData set ["signalsmokeGrenades", _sfsignalsmokeGrenades]; };

if (count _sfmaps > 0) then { _sfLoadoutData set ["maps", _sfmaps]; };
if (count _sfwatches > 0) then { _sfLoadoutData set ["watches", _sfwatches]; };
if (count _sfcompasses > 0) then { _sfLoadoutData set ["compasses", _sfcompasses]; };
if (count _sfradios > 0) then { _sfLoadoutData set ["radios", _sfradios]; };
if (count _sfgpses > 0) then { _sfLoadoutData set ["gpses", _sfgpses]; };
if (count _sfNVGs > 0) then { _sfLoadoutData set ["NVGs", _sfNVGs]; };
if (count _sfbinoculars > 0) then { _sfLoadoutData set ["binoculars", _sfbinoculars]; };
if (count _sfrangefinders > 0) then { _sfLoadoutData set ["rangefinders", _sfrangefinders]; };

if (count _sfuniforms > 0) then { _sfLoadoutData set ["uniforms", _sfuniforms]; };
if (count _sfSLuniforms > 0) then { _sfLoadoutData set ["slUniforms", _sfSLuniforms]; };
if (count _sfvests > 0) then { _sfLoadoutData set ["vests", _sfvests]; };
if (count _sfHvests > 0) then { _sfLoadoutData set ["Hvests", _sfHvests]; };
if (count _sfMGvests > 0) then { _sfLoadoutData set ["MGvests", _sfMGvests]; };
if (count _sfMEDvests > 0) then { _sfLoadoutData set ["MEDvests", _sfMEDvests]; };
if (count _sfSLvests > 0) then { _sfLoadoutData set ["SLvests", _sfSLvests]; };
if (count _sfSNIvests > 0) then { _sfLoadoutData set ["sniVests", _sfSNIvests]; };
if (count _sfGLvests > 0) then { _sfLoadoutData set ["GLvests", _sfGLvests]; };
if (count _sfbackpacks > 0) then { _sfLoadoutData set ["backpacks", _sfbackpacks]; };
if (count _sfATBackpacks > 0) then { _sfLoadoutData set ["atBackpacks", _sfATBackpacks]; };
if (count _sfAABackpacks > 0) then { _sfLoadoutData set ["aaBackpacks", _sfAABackpacks]; };
if (count _sfMEDBackpacks > 0) then { _sfLoadoutData set ["medBackpacks", _sfMEDBackpacks]; };
if (count _sfENGBackpacks > 0) then { _sfLoadoutData set ["engBackpacks", _sfENGBackpacks]; };
if (count _sfEXPBackpacks > 0) then { _sfLoadoutData set ["expBackpacks", _sfEXPBackpacks]; };
if (count _sflongRangeRadios > 0) then { _sfLoadoutData set ["longRangeRadios", _sflongRangeRadios]; };
if (count _sfhelmets > 0) then { _sfLoadoutData set ["helmets", _sfhelmets]; };
if (count _sfSLhats > 0) then { _sfLoadoutData set ["slHat", _sfSLhats]; };
if (count _sfSNIhats > 0) then { _sfLoadoutData set ["sniHats", _sfSNIhats]; };
if (count _sffacewear > 0) then { _sfLoadoutData set ["facewear", _sffacewear]; };

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
if (count _eliteslRifles > 0) then { _eliteLoadoutData set ["slRifles", _eliteslRifles]; };
if (count _eliterifles > 0) then { _eliteLoadoutData set ["rifles", _eliterifles]; };
if (count _elitecarbines > 0) then { _eliteLoadoutData set ["carbines", _elitecarbines]; };
if (count _elitegrenadeLaunchers > 0) then { _eliteLoadoutData set ["grenadeLaunchers", _elitegrenadeLaunchers]; };
if (count _elitedesignatedGrenadeLaunchers > 0) then { _eliteLoadoutData set ["designatedGrenadeLaunchers", _elitedesignatedGrenadeLaunchers]; };
if (count _eliteSMGs > 0) then { _eliteLoadoutData set ["SMGs", _eliteSMGs]; };
if (count _elitemachineGuns > 0) then { _eliteLoadoutData set ["machineGuns", _elitemachineGuns]; };
if (count _elitemarksmanRifles > 0) then { _eliteLoadoutData set ["marksmanRifles", _elitemarksmanRifles]; };
if (count _elitesniperRifles > 0) then { _eliteLoadoutData set ["sniperRifles", _elitesniperRifles]; };
if (count _elitelightATLaunchers > 0) then { _eliteLoadoutData set ["lightATLaunchers", _elitelightATLaunchers]; };
if (count _elitelightHELaunchers > 0) then { _eliteLoadoutData set ["lightHELaunchers", _elitelightHELaunchers]; };
if (count _eliteATLaunchers > 0) then { _eliteLoadoutData set ["ATLaunchers", _eliteATLaunchers]; };
if (count _elitemissleATLaunchers > 0) then { _eliteLoadoutData set ["missileATLaunchers", _elitemissleATLaunchers]; };
if (count _eliteAALaunchers > 0) then { _eliteLoadoutData set ["AALaunchers", _eliteAALaunchers]; };
if (count _elitesidearms > 0) then { _eliteLoadoutData set ["sidearms", _elitesidearms]; };
if (count _eliteGLsidearms > 0) then { _eliteLoadoutData set ["GLsidearms", _eliteGLsidearms]; };

if (count _eliteATMines > 0) then { _eliteLoadoutData set ["ATMines", _eliteATMines]; };
if (count _eliteAPMines > 0) then { _eliteLoadoutData set ["APMines", _eliteAPMines]; };
if (count _elitelightExplosives > 0) then { _eliteLoadoutData set ["lightExplosives", _elitelightExplosives]; };
if (count _eliteheavyExplosives > 0) then { _eliteLoadoutData set ["heavyExplosives", _eliteheavyExplosives]; };

if (count _eliteantiInfantryGrenades > 0) then { _eliteLoadoutData set ["antiInfantryGrenades", _eliteantiInfantryGrenades]; };
if (count _elitesmokeGrenades > 0) then { _eliteLoadoutData set ["smokeGrenades", _elitesmokeGrenades]; };
if (count _elitesignalsmokeGrenades > 0) then { _eliteLoadoutData set ["signalsmokeGrenades", _elitesignalsmokeGrenades]; };

if (count _elitemaps > 0) then { _eliteLoadoutData set ["maps", _elitemaps]; };
if (count _elitewatches > 0) then { _eliteLoadoutData set ["watches", _elitewatches]; };
if (count _elitecompasses > 0) then { _eliteLoadoutData set ["compasses", _elitecompasses]; };
if (count _eliteradios > 0) then { _eliteLoadoutData set ["radios", _eliteradios]; };
if (count _elitegpses > 0) then { _eliteLoadoutData set ["gpses", _elitegpses]; };
if (count _eliteNVGs > 0) then { _eliteLoadoutData set ["NVGs", _eliteNVGs]; };
if (count _elitebinoculars > 0) then { _eliteLoadoutData set ["binoculars", _elitebinoculars]; };
if (count _eliterangefinders > 0) then { _eliteLoadoutData set ["rangefinders", _eliterangefinders]; };

if (count _eliteuniforms > 0) then { _eliteLoadoutData set ["uniforms", _eliteuniforms]; };
if (count _eliteSLuniforms > 0) then { _eliteLoadoutData set ["slUniforms", _eliteSLuniforms]; };
if (count _elitevests > 0) then { _eliteLoadoutData set ["vests", _elitevests]; };
if (count _eliteHvests > 0) then { _eliteLoadoutData set ["Hvests", _eliteHvests]; };
if (count _eliteMGvests > 0) then { _eliteLoadoutData set ["MGvests", _eliteMGvests]; };
if (count _eliteMEDvests > 0) then { _eliteLoadoutData set ["MEDvests", _eliteMEDvests]; };
if (count _eliteSLvests > 0) then { _eliteLoadoutData set ["SLvests", _eliteSLvests]; };
if (count _eliteSNIvests > 0) then { _eliteLoadoutData set ["sniVests", _eliteSNIvests]; };
if (count _eliteGLvests > 0) then { _eliteLoadoutData set ["GLvests", _eliteGLvests]; };
if (count _elitebackpacks > 0) then { _eliteLoadoutData set ["backpacks", _elitebackpacks]; };
if (count _eliteATBackpacks > 0) then { _eliteLoadoutData set ["atBackpacks", _eliteATBackpacks]; };
if (count _eliteAABackpacks > 0) then { _eliteLoadoutData set ["aaBackpacks", _eliteAABackpacks]; };
if (count _eliteMEDBackpacks > 0) then { _eliteLoadoutData set ["medBackpacks", _eliteMEDBackpacks]; };
if (count _eliteENGBackpacks > 0) then { _eliteLoadoutData set ["engBackpacks", _eliteENGBackpacks]; };
if (count _eliteEXPBackpacks > 0) then { _eliteLoadoutData set ["expBackpacks", _eliteEXPBackpacks]; };
if (count _elitelongRangeRadios > 0) then { _eliteLoadoutData set ["longRangeRadios", _elitelongRangeRadios]; };
if (count _elitehelmets > 0) then { _eliteLoadoutData set ["helmets", _elitehelmets]; };
if (count _eliteSLhats > 0) then { _eliteLoadoutData set ["slHat", _eliteSLhats]; };
if (count _eliteSNIhats > 0) then { _eliteLoadoutData set ["sniHats", _eliteSNIhats]; };
if (count _elitefacewear > 0) then { _eliteLoadoutData set ["facewear", _elitefacewear]; };

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
if (count _militaryslRifles > 0) then { _militaryLoadoutData set ["slRifles", _militaryslRifles]; };
if (count _militaryrifles > 0) then { _militaryLoadoutData set ["rifles", _militaryrifles]; };
if (count _militarycarbines > 0) then { _militaryLoadoutData set ["carbines", _militarycarbines]; };
if (count _militarygrenadeLaunchers > 0) then { _militaryLoadoutData set ["grenadeLaunchers", _militarygrenadeLaunchers]; };
if (count _militarydesignatedGrenadeLaunchers > 0) then { _militaryLoadoutData set ["designatedGrenadeLaunchers", _militarydesignatedGrenadeLaunchers]; };
if (count _militarySMGs > 0) then { _militaryLoadoutData set ["SMGs", _militarySMGs]; };
if (count _militarymachineGuns > 0) then { _militaryLoadoutData set ["machineGuns", _militarymachineGuns]; };
if (count _militarymarksmanRifles > 0) then { _militaryLoadoutData set ["marksmanRifles", _militarymarksmanRifles]; };
if (count _militarysniperRifles > 0) then { _militaryLoadoutData set ["sniperRifles", _militarysniperRifles]; };
if (count _militarylightATLaunchers > 0) then { _militaryLoadoutData set ["lightATLaunchers", _militarylightATLaunchers]; };
if (count _militarylightHELaunchers > 0) then { _militaryLoadoutData set ["lightHELaunchers", _militarylightHELaunchers]; };
if (count _militaryATLaunchers > 0) then { _militaryLoadoutData set ["ATLaunchers", _militaryATLaunchers]; };
if (count _militarymissleATLaunchers > 0) then { _militaryLoadoutData set ["missileATLaunchers", _militarymissleATLaunchers]; };
if (count _militaryAALaunchers > 0) then { _militaryLoadoutData set ["AALaunchers", _militaryAALaunchers]; };
if (count _militarysidearms > 0) then { _militaryLoadoutData set ["sidearms", _militarysidearms]; };
if (count _militaryGLsidearms > 0) then { _militaryLoadoutData set ["GLsidearms", _militaryGLsidearms]; };

if (count _militaryATMines > 0) then { _militaryLoadoutData set ["ATMines", _militaryATMines]; };
if (count _militaryAPMines > 0) then { _militaryLoadoutData set ["APMines", _militaryAPMines]; };
if (count _militarylightExplosives > 0) then { _militaryLoadoutData set ["lightExplosives", _militarylightExplosives]; };
if (count _militaryheavyExplosives > 0) then { _militaryLoadoutData set ["heavyExplosives", _militaryheavyExplosives]; };

if (count _militaryantiInfantryGrenades > 0) then { _militaryLoadoutData set ["antiInfantryGrenades", _militaryantiInfantryGrenades]; };
if (count _militarysmokeGrenades > 0) then { _militaryLoadoutData set ["smokeGrenades", _militarysmokeGrenades]; };
if (count _militarysignalsmokeGrenades > 0) then { _militaryLoadoutData set ["signalsmokeGrenades", _militarysignalsmokeGrenades]; };

if (count _militarymaps > 0) then { _militaryLoadoutData set ["maps", _militarymaps]; };
if (count _militarywatches > 0) then { _militaryLoadoutData set ["watches", _militarywatches]; };
if (count _militarycompasses > 0) then { _militaryLoadoutData set ["compasses", _militarycompasses]; };
if (count _militaryradios > 0) then { _militaryLoadoutData set ["radios", _militaryradios]; };
if (count _militarygpses > 0) then { _militaryLoadoutData set ["gpses", _militarygpses]; };
if (count _militaryNVGs > 0) then { _militaryLoadoutData set ["NVGs", _militaryNVGs]; };
if (count _militarybinoculars > 0) then { _militaryLoadoutData set ["binoculars", _militarybinoculars]; };
if (count _militaryrangefinders > 0) then { _militaryLoadoutData set ["rangefinders", _militaryrangefinders]; };

if (count _militaryuniforms > 0) then { _militaryLoadoutData set ["uniforms", _militaryuniforms]; };
if (count _militarySLuniforms > 0) then { _militaryLoadoutData set ["slUniforms", _militarySLuniforms]; };
if (count _militaryvests > 0) then { _militaryLoadoutData set ["vests", _militaryvests]; };
if (count _militaryHvests > 0) then { _militaryLoadoutData set ["Hvests", _militaryHvests]; };
if (count _militaryMGvests > 0) then { _militaryLoadoutData set ["MGvests", _militaryMGvests]; };
if (count _militaryMEDvests > 0) then { _militaryLoadoutData set ["MEDvests", _militaryMEDvests]; };
if (count _militarySLvests > 0) then { _militaryLoadoutData set ["SLvests", _militarySLvests]; };
if (count _militarySNIvests > 0) then { _militaryLoadoutData set ["sniVests", _militarySNIvests]; };
if (count _militaryGLvests > 0) then { _militaryLoadoutData set ["GLvests", _militaryGLvests]; };
if (count _militarybackpacks > 0) then { _militaryLoadoutData set ["backpacks", _militarybackpacks]; };
if (count _militaryATBackpacks > 0) then { _militaryLoadoutData set ["atBackpacks", _militaryATBackpacks]; };
if (count _militaryAABackpacks > 0) then { _militaryLoadoutData set ["aaBackpacks", _militaryAABackpacks]; };
if (count _militaryMEDBackpacks > 0) then { _militaryLoadoutData set ["medBackpacks", _militaryMEDBackpacks]; };
if (count _militaryENGBackpacks > 0) then { _militaryLoadoutData set ["engBackpacks", _militaryENGBackpacks]; };
if (count _militaryEXPBackpacks > 0) then { _militaryLoadoutData set ["expBackpacks", _militaryEXPBackpacks]; };
if (count _militarylongRangeRadios > 0) then { _militaryLoadoutData set ["longRangeRadios", _militarylongRangeRadios]; };
if (count _militaryhelmets > 0) then { _militaryLoadoutData set ["helmets", _militaryhelmets]; };
if (count _militarySLhats > 0) then { _militaryLoadoutData set ["slHat", _militarySLhats]; };
if (count _militarySNIhats > 0) then { _militaryLoadoutData set ["sniHats", _militarySNIhats]; };
if (count _militaryfacewear > 0) then { _militaryLoadoutData set ["facewear", _militaryfacewear]; };

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
if (count _policeuniforms > 0) then { _policeLoadoutData set ["uniforms", _policeuniforms]; };
if (count _policevests > 0) then { _policeLoadoutData set ["vests", _policevests]; };
if (count _policehelmets > 0) then { _policeLoadoutData set ["helmets", _policehelmets]; };
if (count _policeWeapons > 0) then { _policeLoadoutData set ["SMGs", _policeWeapons]; };
if (count _policesidearms > 0) then { _policeLoadoutData set ["sidearms", _policesidearms]; };

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
if (count _militiaslRifles > 0) then { _militiaLoadoutData set ["slRifles", _militiaslRifles]; };
if (count _militiarifles > 0) then { _militiaLoadoutData set ["rifles", _militiarifles]; };
if (count _militiacarbines > 0) then { _militiaLoadoutData set ["carbines", _militiacarbines]; };
if (count _militiagrenadeLaunchers > 0) then { _militiaLoadoutData set ["grenadeLaunchers", _militiagrenadeLaunchers]; };
if (count _militiadesignatedGrenadeLaunchers > 0) then { _militiaLoadoutData set ["designatedGrenadeLaunchers", _militiadesignatedGrenadeLaunchers]; };
if (count _militiaSMGs > 0) then { _militiaLoadoutData set ["SMGs", _militiaSMGs]; };
if (count _militiamachineGuns > 0) then { _militiaLoadoutData set ["machineGuns", _militiamachineGuns]; };
if (count _militiamarksmanRifles > 0) then { _militiaLoadoutData set ["marksmanRifles", _militiamarksmanRifles]; };
if (count _militiasniperRifles > 0) then { _militiaLoadoutData set ["sniperRifles", _militiasniperRifles]; };
if (count _militialightATLaunchers > 0) then { _militiaLoadoutData set ["lightATLaunchers", _militialightATLaunchers]; };
if (count _militialightHELaunchers > 0) then { _militiaLoadoutData set ["lightHELaunchers", _militialightHELaunchers]; };
if (count _militiaATLaunchers > 0) then { _militiaLoadoutData set ["ATLaunchers", _militiaATLaunchers]; };
if (count _militiamissleATLaunchers > 0) then { _militiaLoadoutData set ["missileATLaunchers", _militiamissleATLaunchers]; };
if (count _militiaAALaunchers > 0) then { _militiaLoadoutData set ["AALaunchers", _militiaAALaunchers]; };
if (count _militiasidearms > 0) then { _militiaLoadoutData set ["sidearms", _militiasidearms]; };
if (count _militiaGLsidearms > 0) then { _militiaLoadoutData set ["GLsidearms", _militiaGLsidearms]; };

if (count _militiaATMines > 0) then { _militiaLoadoutData set ["ATMines", _militiaATMines]; };
if (count _militiaAPMines > 0) then { _militiaLoadoutData set ["APMines", _militiaAPMines]; };
if (count _militialightExplosives > 0) then { _militiaLoadoutData set ["lightExplosives", _militialightExplosives]; };
if (count _militiaheavyExplosives > 0) then { _militiaLoadoutData set ["heavyExplosives", _militiaheavyExplosives]; };

if (count _militiaantiInfantryGrenades > 0) then { _militiaLoadoutData set ["antiInfantryGrenades", _militiaantiInfantryGrenades]; };
if (count _militiasmokeGrenades > 0) then { _militiaLoadoutData set ["smokeGrenades", _militiasmokeGrenades]; };
if (count _militiasignalsmokeGrenades > 0) then { _militiaLoadoutData set ["signalsmokeGrenades", _militiasignalsmokeGrenades]; };

if (count _militiamaps > 0) then { _militiaLoadoutData set ["maps", _militiamaps]; };
if (count _militiawatches > 0) then { _militiaLoadoutData set ["watches", _militiawatches]; };
if (count _militiacompasses > 0) then { _militiaLoadoutData set ["compasses", _militiacompasses]; };
if (count _militiaradios > 0) then { _militiaLoadoutData set ["radios", _militiaradios]; };
if (count _militiagpses > 0) then { _militiaLoadoutData set ["gpses", _militiagpses]; };
if (count _militiaNVGs > 0) then { _militiaLoadoutData set ["NVGs", _militiaNVGs]; };
if (count _militiabinoculars > 0) then { _militiaLoadoutData set ["binoculars", _militiabinoculars]; };
if (count _militiarangefinders > 0) then { _militiaLoadoutData set ["rangefinders", _militiarangefinders]; };

if (count _militiauniforms > 0) then { _militiaLoadoutData set ["uniforms", _militiauniforms]; };
if (count _militiaSLuniforms > 0) then { _militiaLoadoutData set ["slUniforms", _militiaSLuniforms]; };
if (count _militiavests > 0) then { _militiaLoadoutData set ["vests", _militiavests]; };
if (count _militiaHvests > 0) then { _militiaLoadoutData set ["Hvests", _militiaHvests]; };
if (count _militiaMGvests > 0) then { _militiaLoadoutData set ["MGvests", _militiaMGvests]; };
if (count _militiaMEDvests > 0) then { _militiaLoadoutData set ["MEDvests", _militiaMEDvests]; };
if (count _militiaSLvests > 0) then { _militiaLoadoutData set ["SLvests", _militiaSLvests]; };
if (count _militiaSNIvests > 0) then { _militiaLoadoutData set ["sniVests", _militiaSNIvests]; };
if (count _militiaGLvests > 0) then { _militiaLoadoutData set ["GLvests", _militiaGLvests]; };
if (count _militiabackpacks > 0) then { _militiaLoadoutData set ["backpacks", _militiabackpacks]; };
if (count _militiaATBackpacks > 0) then { _militiaLoadoutData set ["atBackpacks", _militiaATBackpacks]; };
if (count _militiaAABackpacks > 0) then { _militiaLoadoutData set ["aaBackpacks", _militiaAABackpacks]; };
if (count _militiaMEDBackpacks > 0) then { _militiaLoadoutData set ["medBackpacks", _militiaMEDBackpacks]; };
if (count _militiaENGBackpacks > 0) then { _militiaLoadoutData set ["engBackpacks", _militiaENGBackpacks]; };
if (count _militiaEXPBackpacks > 0) then { _militiaLoadoutData set ["expBackpacks", _militiaEXPBackpacks]; };
if (count _militialongRangeRadios > 0) then { _militiaLoadoutData set ["longRangeRadios", _militialongRangeRadios]; };
if (count _militiahelmets > 0) then { _militiaLoadoutData set ["helmets", _militiahelmets]; };
if (count _militiaSLhats > 0) then { _militiaLoadoutData set ["slHat", _militiaSLhats]; };
if (count _militiaSNIhats > 0) then { _militiaLoadoutData set ["sniHats", _militiaSNIhats]; };
if (count _militiafacewear > 0) then { _militiaLoadoutData set ["facewear", _militiafacewear]; };

//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
if (count _crewuniforms > 0) then { _crewLoadoutData set ["uniforms", _crewuniforms]; };
if (count _crewvests > 0) then { _crewLoadoutData set ["vests", _crewvests]; };
if (count _crewhelmets > 0) then { _crewLoadoutData set ["helmets", _crewhelmets]; };
if (count _crewcarbines > 0) then { _crewLoadoutData set ["carbines", _crewcarbines]; };
if (count _crewSMGs > 0) then { _crewLoadoutData set ["SMGs", _crewSMGs]; };
if (count _crewsidearms > 0) then { _crewLoadoutData set ["sidearms", _crewsidearms]; };
if (count _crewfacewear > 0) then { _crewLoadoutData set ["facewear", _crewfacewear]; };

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
if (count _pilotuniforms > 0) then { _pilotLoadoutData set ["uniforms", _pilotuniforms]; };
if (count _pilotvests > 0) then { _pilotLoadoutData set ["vests", _pilotvests]; };
if (count _pilotbackpacks > 0) then { _pilotLoadoutData set ["backpacks", _pilotbackpacks]; };
if (count _pilothelmets > 0) then { _pilotLoadoutData set ["helmets", _pilothelmets]; };
if (count _pilotcarbines > 0) then { _pilotLoadoutData set ["carbines", _pilotcarbines]; };
if (count _pilotSMGs > 0) then { _pilotLoadoutData set ["SMGs", _pilotSMGs]; };
if (count _pilotsidearms > 0) then { _pilotLoadoutData set ["sidearms", _pilotsidearms]; };
if (count _pilotfacewear > 0) then { _pilotLoadoutData set ["facewear", _pilotfacewear]; };
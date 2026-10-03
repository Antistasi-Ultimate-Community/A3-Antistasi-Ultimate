private _hasWs = "ws" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasTanks = "tank" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;
private _hasJets = "jets" in A3A_enabledDLC;
private _hasHelicopters = "heli" in A3A_enabledDLC;
private _hasArtOfWar = "aow" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;
private _hasGM = "gm" in A3A_enabledDLC;
private _hasCSLA = "csla" in A3A_enabledDLC;
private _hasRF = "rf" in A3A_enabledDLC;
private _hasSOG = "vn" in A3A_enabledDLC;
private _hasSPE = "spe" in A3A_enabledDLC;
private _hasEF = "ef" in A3A_enabledDLC;

//////////////////////////
//       Vehicles       //
//////////////////////////

private _basic = [];
private _lightUnarmed = [];
private _lightArmed = [];
private _Trucks = [];
private _cargoTrucks = [];
private _ammoTrucks = [];
private _repairTrucks = [];
private _fuelTrucks = [];
private _medicalTrucks = [];
private _lightAPCs = [];
private _APCs = [];
private _IFVs = [];
private _airborneVehicles = [];
private _tanks = [];
private _lightTanks = [];
private _aa = [];

private _SDV = [];
private _DropPod = [];

private _transportBoat = [];
private _gunBoat = [];
private _Amphibious = [];

private _planesCAS = [];
private _planesAA = [];

private _planesTransport = [];
private _gunship = [];

private _helisLight = [];
private _transportHelicopters = [];
private _helisLightAttack =  [];
private _helisAttack = [];

private _airPatrol = [];

private _artillery = [];
private _artilleryMags = [];

private _uavsAttack = [];
private _uavsPortable = [];

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:

private _militiaLightArmed = [];
private _militiaTrucks = [];
private _militiaCars = [];
private _militiaAPCs = []; 

private _policeVehs = [];

private _staticMG = [];
private _staticAT = [];
private _staticAA = [];
private _staticMortars = [];
private _howitzers =  [];

private _radar = "";
private _SAM = "";

// Override these if needed
private _mortarMagazineHE = "8Rnd_82mm_Mo_shells";
private _mortarMagazineSmoke = "8Rnd_82mm_Mo_Smoke_white";
private _mortarMagazineFlare = "8Rnd_82mm_Mo_Flare_white";
private _howitzerMagazineHE = "6Rnd_120mm_HE_shells_RF","2Rnd_120mm_Mo_Cluster_RF";

private _minefieldAT = [];
private _minefieldAPERS = [];

private _animations = [];
private _variants = [];

private _faces = [];
private _voices = [];
private _sfVoices = [];
private _eliteVoices = [];

private _insignia = [];
private _sfInsignia = [];
private _milInsignia = [];

//////////////////////////
//       Loadouts       //
//////////////////////////

private _slRifles = [];
private _rifles = [];
private _carbines = [];
private _grenadeLaunchers = [];
private _designatedGrenadeLaunchers = [];
private _SMGs = [];
private _machineGuns = [];
private _marksmanRifles = [];
private _sniperRifles = [];
private _lightATLaunchers = [];
private _lightHELaunchers = [];
private _ATLaunchers = [];
private _missleATLaunchers = [];
private _AALaunchers = [];
private _sidearms = [];
private _GLsidearms = [];

private _ATMines = [];
private _APMines = [];
private _lightExplosives = [];
private _heavyExplosives = [];

private _antiInfantryGrenades = [];
private _antiTankGrenades = [];
private _smokeGrenades = [];
private _signalsmokeGrenades = [];

private _maps = [];
private _watches = [];
private _compasses = [];
private _radios = [];
private _gpses = [];
private _NVGs = [];
private _binoculars = [];
private _rangefinders = [];

private _traitorUniforms = [];
private _traitorVests = [];
private _traitorHats = [];

private _officerUniforms = [];
private _officerVests = [];
private _officerHats = [];

private _cloakUniforms = [];
private _cloakVests = [];
private _cloakRifles = [];
private _cloakCarbines = [];
private _cloakSidearms = [];

private _uniforms = [];
private _SLuniforms = [];
private _ENGuniforms = [];
private _MEDuniforms = [];
private _vests = [];
private _Hvests = [];
private _MGvests = [];
private _MEDvests =[] ;
private _SLvests = [];
private _SNIvests = [];
private _GLvests = [];
private _ATvests = [];
private _ENGvests = [];
private _backpacks = [];
private _ATBackpacks = [];
private _AABackpacks = [];
private _MGBackpacks = [];
private _GLBackpacks = [];
private _MEDBackpacks = [];
private _ENGBackpacks = [];
private _EXPBackpacks = [];
private _SLBackpacks = [];
private _longRangeRadios = [];
private _helmets = [];
private _MEDhelmets = [];
private _SLhelmets = [];
private _SLhats = [];
private _SNIhats = [];

private _slItems = [];
private _rItems = [];
private _mItems = [];
private _gItems = [];
private _eeItems = [];
private _latItems = [];
private _atItems = [];
private _aaItems = [];
private _mgItems = [];
private _mmItems = [];
private _pItems = [];
private _cItems = [];
private _uItems = [];

private _facewear = [];

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfslRifles = [];
private _sfrifles = [];
private _sfcarbines = [];
private _sfgrenadeLaunchers = [];
private _sfdesignatedGrenadeLaunchers = [];
private _sfSMGs = [];
private _sfmachineGuns = [];
private _sfmarksmanRifles = [];
private _sfsniperRifles = [];
private _sflightATLaunchers = [];
private _sflightHELaunchers = [];
private _sfATLaunchers = [];
private _sfmissleATLaunchers = [];
private _sfAALaunchers = [];
private _sfsidearms = [];
private _sfGLsidearms = [];

private _sfATMines = [];
private _sfAPMines = [];
private _sflightExplosives = [];
private _sfheavyExplosives = [];

private _sfantiInfantryGrenades = [];
private _sfsmokeGrenades = [];
private _sfsignalsmokeGrenades = [];

private _sfmaps = [];
private _sfwatches = [];
private _sfcompasses = [];
private _sfradios = [];
private _sfgpses = [];
private _sfNVGs = [];
private _sfbinoculars = [];
private _sfrangefinders = [];

private _sfuniforms = [];
private _sfMEDuniforms = [];
private _sfENGuniforms = [];
private _sfSLuniforms = [];
private _sfvests = [];
private _sfHvests = [];
private _sfMGvests = [];
private _sfMEDvests = [];
private _sfSLvests = [];
private _sfSNIvests = [];
private _sfGLvests = [];
private _sfATvests = [];
private _sfENGvests = [];
private _sfbackpacks = [];
private _sfATBackpacks = [];
private _sfAABackpacks = [];
private _sfMGbackpacks = [];
private _sfGLbackpacks = [];
private _sfMEDBackpacks = [];
private _sfENGBackpacks = [];
private _sfEXPBackpacks = [];
private _sfMEDhelmets = [];
private _sfSLBackpacks = [];
private _sflongRangeRadios = [];
private _sfhelmets = [];
private _sfSLhelmets = [];
private _sfSLhats = [];
private _sfSNIhats = [];

private _sffacewear = [];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteslRifles = [];
private _eliterifles = [];
private _elitecarbines = [];
private _elitegrenadeLaunchers = [];
private _elitedesignatedGrenadeLaunchers = [];
private _eliteSMGs = [];
private _elitemachineGuns = [];
private _elitemarksmanRifles = [];
private _elitesniperRifles = [];
private _elitelightATLaunchers = [];
private _elitelightHELaunchers = [];
private _eliteATLaunchers = [];
private _elitemissleATLaunchers = [];
private _eliteAALaunchers = [];
private _elitesidearms = [];
private _eliteGLsidearms = [];

private _eliteATMines = [];
private _eliteAPMines = [];
private _elitelightExplosives = [];
private _eliteheavyExplosives = [];

private _eliteantiInfantryGrenades = [];
private _elitesmokeGrenades = [];
private _elitesignalsmokeGrenades = [];

private _elitemaps = [];
private _elitewatches = [];
private _elitecompasses = [];
private _eliteradios = [];
private _elitegpses = [];
private _eliteNVGs = [];
private _elitebinoculars = [];
private _eliterangefinders = [];

private _eliteuniforms = [];
private _eliteSLuniforms = [];
private _elitevests = [];
private _eliteHvests = [];
private _eliteMGvests = [];
private _eliteMEDvests = [];
private _eliteSLvests = [];
private _eliteSNIvests = [];
private _eliteGLvests = [];
private _eliteATvests = [];
private _eliteENGvests = [];
private _elitebackpacks = [];
private _eliteATBackpacks = [];
private _eliteAABackpacks = [];
private _eliteMGBackpacks = [];
private _eliteGLBackpacks = [];
private _eliteMEDBackpacks = [];
private _eliteENGBackpacks = [];
private _eliteEXPBackpacks = [];
private _eliteSLBackpacks = [];
private _elitelongRangeRadios = [];
private _elitehelmets = [];
private _eliteMEDhelmets = [];
private _eliteSLhelmets = [];
private _eliteSLhats = [];
private _eliteSNIhats = [];

private _elitefacewear = [];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryslRifles = [];
private _militaryrifles = [];
private _militarycarbines = [];
private _militarygrenadeLaunchers = [];
private _militarydesignatedGrenadeLaunchers = [];
private _militarySMGs = [];
private _militarymachineGuns = [];
private _militarymarksmanRifles = [];
private _militarysniperRifles = [];
private _militarylightATLaunchers = [];
private _militarylightHELaunchers = [];
private _militaryATLaunchers = [];
private _militarymissleATLaunchers = [];
private _militaryAALaunchers = [];
private _militarysidearms = [];
private _militaryGLsidearms = [];

private _militaryATMines = [];
private _militaryAPMines = [];
private _militarylightExplosives = [];
private _militaryheavyExplosives = [];

private _militaryantiInfantryGrenades = [];
private _militarysmokeGrenades = [];
private _militarysignalsmokeGrenades = [];

private _militarymaps = [];
private _militarywatches = [];
private _militarycompasses = [];
private _militaryradios = [];
private _militarygpses = [];
private _militaryNVGs = [];
private _militarybinoculars = [];
private _militaryrangefinders = [];

private _militaryuniforms = [];
private _militaryENGuniforms = [];
private _militarySLuniforms = [];
private _militaryvests = [];
private _militaryHvests = [];
private _militaryMGvests = [];
private _militaryMEDvests = [];
private _militarySLvests = [];
private _militarySNIvests = [];
private _militaryGLvests = [];
private _militaryATvests = [];
private _militaryENGvests = [];
private _militarybackpacks = [];
private _militaryATBackpacks = [];
private _militaryAABackpacks = [];
private _militaryMGBackpacks = [];
private _militaryGLBackpacks = [];
private _militaryMEDBackpacks = [];
private _militaryENGBackpacks = [];
private _militaryEXPBackpacks = [];
private _militaryMEDhelmets = [];
private _militarySLBackpacks = [];
private _militarylongRangeRadios = [];
private _militaryhelmets = [];
private _militarySLhelmets = [];
private _militarySLhats = [];
private _militarySNIhats = [];

private _militaryfacewear = [];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeuniforms = [];
private _policeSLuniforms = [];
private _policevests = [];
private _policehelmets = [];
private _policeWeapons = [];
private _policesidearms = [];

private _policefacewear = [];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaslRifles = [];
private _militiarifles = [];
private _militiacarbines = [];
private _militiagrenadeLaunchers = [];
private _militiadesignatedGrenadeLaunchers = [];
private _militiaSMGs = [];
private _militiamachineGuns = [];
private _militiamarksmanRifles = [];
private _militiasniperRifles = [];
private _militialightATLaunchers = [];
private _militialightHELaunchers = [];
private _militiaATLaunchers = [];
private _militiamissleATLaunchers = [];
private _militiaAALaunchers = [];
private _militiasidearms = [];
private _militiaGLsidearms = [];

private _militiaATMines = [];
private _militiaAPMines = [];
private _militialightExplosives = [];
private _militiaheavyExplosives = [];

private _militiaantiInfantryGrenades = [];
private _militiasmokeGrenades = [];
private _militiasignalsmokeGrenades = [];

private _militiamaps = [];
private _militiawatches = [];
private _militiacompasses = [];
private _militiaradios = [];
private _militiagpses = [];
private _militiaNVGs = [];
private _militiabinoculars = [];
private _militiarangefinders = [];

private _militiauniforms = [];
private _militiaMEDuniforms = [];
private _militiaENGuniforms = [];
private _militiaSLuniforms = [];
private _militiavests = [];
private _militiaHvests = [];
private _militiaMGvests = [];
private _militiaMEDvests = [];
private _militiaSLvests = [];
private _militiaSNIvests = [];
private _militiaGLvests = [];
private _militiaATvests = [];
private _militiaENGvests = [];
private _militiabackpacks = [];
private _militiaATBackpacks = [];
private _militiaAABackpacks = [];
private _militiaMGBackpacks = [];
private _militiaGLBackpacks = [];
private _militiaMEDBackpacks = [];
private _militiaENGBackpacks = [];
private _militiaEXPBackpacks = [];
private _militiaSLBackpacks = [];
private _militialongRangeRadios = [];
private _militiahelmets = [];
private _militiaMEDhelmets = [];
private _militiaSLhelmets = [];
private _militiaSLhats = [];
private _militiaSNIhats = [];

private _militiafacewear = [];

/////////////////////////////
//    Misc Loadout Data    //
/////////////////////////////

private _crewuniforms = [];
private _crewvests = [];
private _crewhelmets = [];
private _crewcarbines = [];
private _crewSMGs = [];
private _crewsidearms = [];

private _crewfacewear = [];

private _pilotuniforms = [];
private _pilotvests = [];
private _pilotbackpacks = [];
private _pilothelmets = [];
private _pilotcarbines = [];
private _pilotSMGs = [];
private _pilotsidearms = [];

private _pilotfacewear = [];

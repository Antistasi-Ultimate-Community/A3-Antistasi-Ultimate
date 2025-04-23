//////////////////////////////
//   Civilian Information   //
//////////////////////////////

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesCivCar", [
	"C_Van_02_vehicle_F", 0.1
	,"C_Van_02_transport_F", 0.2
	,"CSLA_CIV_ADA1600", 1.0
	,"CSLA_CIV_ADA1600VB", 0.6
	,"CSLA_CIV_Sarka1200VB", 0.6
	,"CSLA_CIV_Sarka1200", 1.0
	,"CSLA_CIV_Sarka1200PO", 0.5
	,"CSLA_CIV_AZU", 1.0
	,"CSLA_CIV_CATOR", 0.4
	,"CSLA_CIV_JARA250", 0.2
	,"US85_TT650", 0.2
]] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
        "C_Truck_02_transport_F", 0.25
        ,"C_Truck_02_covered_F", 0.25
        ,"C_Tractor_01_F", 0.2
	,"C_Van_02_vehicle_F", 0.1
	,"C_Van_02_transport_F", 0.1
	,"CSLA_CIV_V3S", 1.0
]] call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "C_Boat_Civil_01_F", 1.0
    ,"C_Rubberboat", 1.0
    ,"C_Boat_Transport_02_F", 1.0
]] call _fnc_saveToTemplate;

["vehiclesCivRepair", [
    "CSLA_CIV_V3Sr", 1.0
   ,"C_Truck_02_box_F", 0.25
]] call _fnc_saveToTemplate;

["vehiclesCivMedical", ["C_Van_02_medevac_F", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivFuel", [
    "CSLA_V3Sf", 1.0
    ,"C_Truck_02_fuel_F", 0.25
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["GreekHead_A3_02", "GreekHead_A3_03", "GreekHead_A3_04", "GreekHead_A3_05", "GreekHead_A3_06",
"GreekHead_A3_07", "GreekHead_A3_08", "GreekHead_A3_09", "Ioannou", "Barklem", "WhiteHead_05"
]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _civUniforms = ["FIA_uniCitizen", "FIA_uniCitizen2", "FIA_uniCitizen3", "FIA_uniCitizen4", "FIA_uniDoctor", "FIA_uniForeman", "FIA_uniForeman2", "FIA_uniVillager", "FIA_uniVillager2", "FIA_uniVillager3", "FIA_uniVillager4", "FIA_uniWoodlander", "FIA_uniWoodlander2", "FIA_uniWoodlander3", "FIA_uniWoodlander4"];
private _pressUniforms = ["FIA_uniFunctionary", "FIA_uniFunctionary2"];
private _workerUniforms = ["FIA_uniWorker", "FIA_uniWorker2", "FIA_uniWorker3", "FIA_uniWorker4"];

["uniforms", _civUniforms + _pressUniforms + _workerUniforms] call _fnc_saveToTemplate;

_civhats = ["FIA_Hairs_Brown", "FIA_Hairs_Silver", "FIA_Budajka", "CSLA_BudajkaGy", "CSLA_BudajkaBk", "FIA_Radiovka", "CSLA_RadiovkaGy", "CSLA_RadiovkaBk", "FIA_Usanka"];

["headgear", _civHats] call _fnc_saveToTemplate;

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniforms];
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["pressVests", ["V_Press_F"]];
_loadoutData set ["helmets", _civHats];
_loadoutData set ["pressHelmets", ["H_Cap_press"]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];


private _manTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _workerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["workerUniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _pressTemplate = {
    ["pressHelmets"] call _fnc_setHelmet;
    ["pressVests"] call _fnc_setVest;
    ["pressUniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _prefix = "militia";
private _unitTypes = [
    ["Press", _pressTemplate],
    ["Worker", _workerTemplate],
    ["Man", _manTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;

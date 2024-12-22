/* private _hasWs = "ws" in A3A_enabledDLC;
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
private _hasEF = "ef" in A3A_enabledDLC; */ ///dlc stuff if your templates needs it

//////////////////////////
//       Vehicles       //
//////////////////////////    

["vehiclesCivCar", []] call _fnc_saveToTemplate;             //this line determines civilian cars -- Example: ["vehiclesCivCar", ["C_Offroad_01_F"]] -- Array, can contain multiple assets

["vehiclesCivIndustrial", []] call _fnc_saveToTemplate;             //this line determines civilian trucks -- Example: ["vehiclesCivIndustrial", ["C_Truck_02_transport_F"]] -- Array, can contain multiple assets

["vehiclesCivHeli", []] call _fnc_saveToTemplate;            //this line determines civilian helis -- Example: ["vehiclesCivHeli", ["C_Heli_Light_01_civil_F"]] -- Array, can contain multiple assets

["vehiclesCivPlanes", []] call _fnc_saveToTemplate;          // this line determines civilian planes -- Example: ["vehiclesCivPlanes", ["C_Plane_Civil_01_F"]] -- Array, can contain multiple assets

["vehiclesCivBoat", []] call _fnc_saveToTemplate;             //this line determines civilian boats -- Example: ["vehiclesCivBoat", ["C_Boat_Civil_01_F"]] -- Array, can contain multiple assets

["vehiclesCivRepair", []] call _fnc_saveToTemplate;            //this line determines civilian repair vehicles

["vehiclesCivMedical", []] call _fnc_saveToTemplate;        //this line determines civilian medic vehicles

["vehiclesCivFuel", []] call _fnc_saveToTemplate;            //this line determines civilian fuel vehicles

//Example on how to use dlc content
/* if (_hasKart) then {
  #include "..\DLC_content\vehicles\Kart\kart.sqf"  
}; */


["variants", []] call _fnc_saveToTemplate;                 //this line determines particular paintjob/camo for a vehicle --  Example: ["I_Heli_Transport_02_F", ["Dahoman", 1]] -- Array, can contain multiple assets

//or do it like this
/* ["variants", [
  #include "..\vehicleVariants\Vanilla_GM_CIV.sqf"
]] call _fnc_saveToTemplate; */

["animations", []] call _fnc_saveToTemplate;                //     -- Example: ["vehClass", ["animsourcefromgarage1", 0.3, "animsourcefromgarage2", 0.25, "animsourcefromgarage3", 0.3, "animsourcefromgarage4", 0.3]] -- Array, can contain multiple assets

//or do it like this
/* ["animations", [
  #include "..\vehicleAnimations\vehicleAnimations_CSLA.sqf"
]] call _fnc_saveToTemplate; */

/////////////////////////////////
///  Identities and currency  ///
////////////////////////////////

["currencySymbol", ""] call _fnc_saveToTemplate;

["faces", []] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = [];          //Uniforms given to Normal Civs

private _pressUniforms = [];            //Uniforms given to Press/Journalists

private _workerUniforms = [];           //Uniforms given to Workers at Factories/Resources

private _dlcUniforms = [];          //Uniforms given if DLCs are enabled, only given to the Arsenal not Civilians

if (_hasApex) then {_dlcUniforms append [];
};

if (_hasLawsOfWar) then {_dlcUniforms append [];
};

["uniforms", _civUniforms + _pressUniforms + _workerUniforms + _dlcUniforms] call _fnc_saveToTemplate;          //Uniforms given to the Arsenal, Allowed for Undercover and given to Rebel Ai that go Undercover

_civhats = [];

["headgear", _civHats] call _fnc_saveToTemplate;            //Headgear given to Normal Civs, Workers, Undercover Rebels.

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniforms];
_loadoutData set ["helmets", _civHats];

_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["pressVests", _pressVests];
_loadoutData set ["pressHelmets", _pressHelmets];

_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["workerHelmets", _workerHelmets];

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
    [["workerHelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    ["workerUniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _pressTemplate = {
    [["pressHelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
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

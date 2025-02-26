//////////////////////////
//   Side Information   //
/////////////////////////

["name", "CSLA"] call _fnc_saveToTemplate;
["spawnMarkerName", "CSLA Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_CSLA"] call _fnc_saveToTemplate;
["flagTexture", "\csla_misc\signs\flags\cssr_flag.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_CzechRepublic"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["CSLA_JARA250","CSLA_AZU_R2"]] call _fnc_saveToTemplate;			 
["vehiclesLightUnarmed", ["CSLA_AZU","CSLA_AZU_para","CSLA_AZU_R2"]] call _fnc_saveToTemplate;		 
["vehiclesLightArmed", []] call _fnc_saveToTemplate;             
["vehiclesTrucks", ["CSLA_V3SLizard","CSLA_F813o","CSLA_F813"]] call _fnc_saveToTemplate;		 
["vehiclesCargoTrucks", ["CSLA_V3SLizard","CSLA_F813o","CSLA_F813"]] call _fnc_saveToTemplate;		 
["vehiclesAmmoTrucks", ["CSLA_V3Sa"]] call _fnc_saveToTemplate;		 
["vehiclesRepairTrucks", ["CSLA_V3Sr","CSLA_DTP90"]] call _fnc_saveToTemplate;		 
["vehiclesFuelTrucks", ["CSLA_V3Sf"]] call _fnc_saveToTemplate;		 
["vehiclesMedical", ["CSLA_OZV90"]] call _fnc_saveToTemplate;		 
["vehiclesLightAPCs", ["CSLA_OT64C"]] call _fnc_saveToTemplate;             
["vehiclesAPCs", ["CSLA_OT64C"]] call _fnc_saveToTemplate;                  
["vehiclesAirborne", ["CSLA_BVP1","CSLA_BPzV"]] call _fnc_saveToTemplate;              
["vehiclesIFVs", ["CSLA_OT62"]] call _fnc_saveToTemplate;                  
["vehiclesTanks", ["CSLA_T72","CSLA_T72M","CSLA_T72M1"]] call _fnc_saveToTemplate;                 
["vehiclesLightTanks", ["CSLA_BVP1","CSLA_BPzV"]] call _fnc_saveToTemplate;            
["vehiclesAA", ["CSLA_PLdvK59V3S"]] call _fnc_saveToTemplate;                    

["vehiclesTransportBoats", ["CSLA_lodka"]] call _fnc_saveToTemplate;	
["vehiclesGunBoats", ["O_Boat_Armed_01_hmg_F"]] call _fnc_saveToTemplate;              

["vehiclesPlanesCAS", ["O_Plane_CAS_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;            
["vehiclesPlanesAA", ["O_Plane_CAS_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;              
["vehiclesPlanesTransport", ["CSLA_CIV_An2_1"]] call _fnc_saveToTemplate;	

["vehiclesHelisLight", ["CSLA_Mi17"]] call _fnc_saveToTemplate;            
["vehiclesHelisTransport", ["CSLA_Mi17mg"]] call _fnc_saveToTemplate;        

["vehiclesHelisLightAttack", ["CSLA_Mi17pylons"]] call _fnc_saveToTemplate;      
["vehiclesHelisAttack", ["CSLA_Mi24V"]] call _fnc_saveToTemplate;           

["vehiclesArtillery", ["CSLA_ShKH77","CSLA_RM70","CSLA_RM51"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["CSLA_ShKH77", ["CSLA_54Rnd_152EOF"]],
["CSLA_RM70", ["CSLA_40rnd_9M22U"]],
["CSLA_RM51", ["CSLA_32rnd_130JRROv"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;                    
["uavsPortable", []] call _fnc_saveToTemplate;                  

//Config special vehicles
["vehiclesMilitiaLightArmed", []] call _fnc_saveToTemplate;     
["vehiclesMilitiaTrucks", ["CSLA_V3So","CSLA_V3S"]] call _fnc_saveToTemplate;         
["vehiclesMilitiaCars", ["CSLA_AZU","CSLA_AZU_para","CSLA_AZU_R2"]] call _fnc_saveToTemplate;           

["vehiclesMilitiaAPCs", ["CSLA_OT64C"]] call _fnc_saveToTemplate;             

["vehiclesPolice", ["CSLA_CIV_ADA1600VB","CSLA_CIV_Sarka1200VB","CSLA_AZU_VB"]] call _fnc_saveToTemplate;                

["staticMGs", ["CSLA_UK59L_Stat"]] call _fnc_saveToTemplate;
["staticAT", ["CSLA_9K113_Stat"]] call _fnc_saveToTemplate;
["staticAA", ["CSLA_PLdvK59_Stat"]] call _fnc_saveToTemplate;
["staticMortars", ["CSLA_M52_Stat"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "CSLA_8rnd_82EOM52"] call _fnc_saveToTemplate;               

["vehicleRadar", ""] call _fnc_saveToTemplate;                  
["vehicleSam", ""] call _fnc_saveToTemplate;                    

["howitzerMagazineHE", ""] call _fnc_saveToTemplate;            
             
["mortarMagazineSmoke", ""] call _fnc_saveToTemplate;           

//Minefield definition
["minefieldAT", ["CSLA_PtMiBa3_charge"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["CSLA_PPMiNa_charge"]] call _fnc_saveToTemplate;

//SLAT cages, camo nets, logs, doors etc
["animations", []] call _fnc_saveToTemplate;

//vehicle skins
["variants", []] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_17","WhiteHead_18","WhiteHead_20","WhiteHead_21","WhiteHead_30"]] call _fnc_saveToTemplate;
["voices", ["CSLA_Male01CZ","CSLA_Male02CZ","CSLA_Male03CZ","CSLA_Male04CZ"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["lightATLaunchers", [
["CSLA_RPG75", "", "", "", ["CSLA_RPG75_Mag"], [], ""],
["CSLA_RPG7", "", "", "", ["CSLA_PG7M110"], [], ""]
]];
_loadoutData set ["ATLaunchers", [
["CSLA_RPG7V", "", "", "", ["CSLA_PG7M110", "CSLA_PG7M110V"], [], ""]
]];
_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["AALaunchers", [
["CSLA_9K32", "", "", "", ["CSLA_9M32M"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["CSLA_PtMiBa3_mag"]];
_loadoutData set ["APMines", ["CSLA_PPMiNa_mag"]];
_loadoutData set ["lightExplosives", ["CSLA_TNT0100g"]];
_loadoutData set ["heavyExplosives", ["CSLA_IVZ"]];

_loadoutData set ["antiInfantryGrenades", ["CSLA_RG4o", "CSLA_RG4u","CSLA_URG86o","CSLA_URG86u","CSLA_F1"]];
_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["smokeGrenades", ["CSLA_dymB","CSLA_dymC","CSLA_dymZ","CSLA_dymZl"]];
_loadoutData set ["signalsmokeGrenades", ["CSLA_26_5sigCv1a", "CSLA_26_5sigZl1a", "CSLA_26_5sigCrD", "CSLA_26_5sigOrD", "CSLA_26_5sigMD"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["CSLA_Prim_enl"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", []];
_loadoutData set ["NVGs", []];
_loadoutData set ["binoculars", []];
_loadoutData set ["rangefinders", []];

_loadoutData set ["uniforms", ["CSLA_uni60wld"]];
_loadoutData set ["slUniforms", ["CSLA_uni60wld"]];
_loadoutData set ["vests", [
		"CSLA_gr60rfl"
]];
_loadoutData set ["SLvests", [
		"CSLA_gr60sgt"
]];
_loadoutData set ["MEDIvests", [
		"CSLA_gr60medic"
]];
_loadoutData set ["ATvests", [
		"CSLA_gr60RPG7",
		"CSLA_gr60RPG7r"
]];
_loadoutData set ["MGvests", [
		"CSLA_gr60UK59"
]];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", ["CSLA_bp60"]];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", ["CSLA_helmet53","CSLA_helmet53d","CSLA_helmet53m","CSLA_helmet53j","CSLA_helmet53G"]];
_loadoutData set ["slHat", ["CSLA_cap"]];
_loadoutData set ["sniHats", ["CSLA_hat85Gn"]];

_loadoutData set ["traitorUniforms", ["FIA_uniWoodlander","FIA_uniWoodlander2","FIA_uniWoodlander3","FIA_uniWoodlander4"]];
_loadoutData set ["traitorVests", ["FIA_gr85_Sa61"]];
_loadoutData set ["traitorHats", ["FIA_Usanka"]];

_loadoutData set ["officerUniforms", []]; ///finish that
_loadoutData set ["officerVests", []];
_loadoutData set ["officerHats", []];

_loadoutData set ["cloakUniforms", []];
_loadoutData set ["cloakVests", []];

_loadoutData set ["slUniforms", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", []];
_loadoutData set ["sniHats", []];

_loadoutData set ["glasses", []];
_loadoutData set ["goggles", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = [];
private _eeItems = ["CSLA_toolkit_KOMZE", "CSLA_w3p_detector"];
private _mmItems = [];

if (A3A_hasACE) then {
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadLeader_extras", _slItems];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", _eeItems];
_loadoutData set ["items_engineer_extras", _eeItems];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", _mmItems];
_loadoutData set ["items_sniper_extras", _mmItems];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_sfLoadoutData set ["uniforms", ["CSLA_uni60lrr"]];
_sfLoadoutData set ["slUniforms", ["CSLA_uni60lrr"]];
_sfLoadoutData set ["vests", [
		"CSLA_gr85ptBase",
		"CSLA_gr85lrrSa61"
]];
_sfLoadoutData set ["MEDIvests", [
		"CSLA_gr85ptMdc"
]];
_sfLoadoutData set ["ATvests", [
		"CSLA_gr85ptCrw"
]];
_sfLoadoutData set ["SLvests", [
		"CSLA_gr85ptSgt",
		"CSLA_gr85ptOfc"
]];
_sfLoadoutData set ["MGvests", [
		"CSLA_gr85ptMg"
]];
_sfLoadoutData set ["SNIvests", [
		"CSLA_gr85ptOP63"
]];
_sfLoadoutData set ["Hvests", []];
_sfLoadoutData set ["backpacks", ["CSLA_bp85Sa58", "CSLA_bp85RF10"]];
_sfLoadoutData set ["helmets", ["CSLA_helmetPara","CSLA_beretR"]];
_sfLoadoutData set ["sniHats", ["CSLA_beretM"]];
_sfLoadoutData set ["NVGs", ["CSLA_nokto"]];
_sfLoadoutData set ["binoculars", ["CSLA_Bino"]];
//SF Weapons
_sfLoadoutData set ["slRifles", [
["CSLA_Sa58V", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], [], ""]
]];
_sfLoadoutData set ["rifles", [
["CSLA_Sa58P", "", "", "CSLA_ZD4x8", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["CSLA_Sa58V", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], [], "CSLA_Sa58bpd"]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["CSLA_VG70", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], ["CSLA_26_5vz70","CSLA_26_5vz70","CSLA_26_5vz70","CSLA_26_5vz70"], ""]
]];
_sfLoadoutData set ["SMGs", [
["CSLA_rSa61", "CSLA_Sa61tlm", "", "", ["CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["CSLA_UK59L", "", "", "", ["CSLA_UK59_50rnd_7_62PZ59", "CSLA_UK59_50rnd_7_62PZ59","CSLA_UK59_50rnd_7_62PZ59"], [], ""],
["CSLA_UK59L", "", "", "CSLA_UK59_ZD4x8", ["CSLA_UK59_50rnd_7_62PZ59", "CSLA_UK59_50rnd_7_62PZ59","CSLA_UK59_50rnd_7_62PZ59"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["CSLA_Sa58P", "", "", "CSLA_ZD4x8", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43"], [], "CSLA_Sa58bpd"]
]];
_sfLoadoutData set ["sniperRifles", [
["CSLA_OP63", "", "", "", ["CSLA_OP63_10rnd_7_62PZ59","CSLA_OP63_10rnd_7_62PZ59","CSLA_OP63_10rnd_7_62PZ59", "CSLA_OP63_10rnd_7_62Odst59"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["CSLA_Sa61", "", "", "", ["CSLA_Sa61_20rnd_7_65Pi27"], [], ""],
["CSLA_Pi75lr", "", "", "", ["CSLA_Pi75_15Rnd_9Luger"], [], ""],
["CSLA_Pi75sr", "", "", "", ["CSLA_Pi75_15Rnd_9Luger"], [], ""],
["CSLA_Pi52", "", "", "", ["CSLA_Pi52_8rnd_7_62Pi52"], [], ""],
["CSLA_Pi82", "", "", "", ["CSLA_Pi82_12rnd_9Pi82"], [], ""]
]];


/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["CSLA_uni60lrr"]];
_eliteLoadoutData set ["slUniforms", ["CSLA_uni60lrr"]];
_eliteLoadoutData set ["vests", [
		"CSLA_gr85ptBase",
		"CSLA_gr85lrrSa61",
        "CSLA_gr85ptMdc",
        "CSLA_gr85ptCrw",
        "CSLA_gr85ptSgt",
		"CSLA_gr85ptOfc",
        "CSLA_gr85ptMg",
        "CSLA_gr85ptOP63"
]];
_eliteLoadoutData set ["Hvests", []];
_eliteLoadoutData set ["backpacks", ["CSLA_bp85Sa58", "CSLA_bp85RF10"]];
_eliteLoadoutData set ["helmets", ["CSLA_helmetPara","CSLA_beretR"]];
_eliteLoadoutData set ["sniHats", ["CSLA_beretM"]];
_eliteLoadoutData set ["NVGs", ["CSLA_nokto"]];
_eliteLoadoutData set ["binoculars", ["CSLA_Bino"]];
//SF Weapons
_eliteLoadoutData set ["slRifles", [
["CSLA_Sa58V", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62vz43"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
["CSLA_Sa58P", "", "", "CSLA_ZD4x8", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62vz43"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["CSLA_Sa58V", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62vz43"], [], "CSLA_Sa58bpd"]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["CSLA_VG70", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62vz43"], ["CSLA_26_5vz70","CSLA_26_5vz70","CSLA_26_5vz70","CSLA_26_5vz70"], ""]
]];
_eliteLoadoutData set ["SMGs", [
["CSLA_rSa61", "CSLA_Sa61tlm", "", "", ["CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["CSLA_UK59L", "", "", "", ["CSLA_UK59_50rnd_7_62PZ59", "CSLA_UK59_50rnd_7_62PZ59","CSLA_UK59_50rnd_7_62PZ59"], [], ""],
["CSLA_UK59L", "", "", "CSLA_UK59_ZD4x8", ["CSLA_UK59_50rnd_7_62PZ59", "CSLA_UK59_50rnd_7_62PZ59","CSLA_UK59_50rnd_7_62PZ59"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
["CSLA_Sa58P", "", "", "CSLA_ZD4x8", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62vz43"], [], "CSLA_Sa58bpd"]
]];
_eliteLoadoutData set ["sniperRifles", [
["CSLA_OP63", "", "", "", ["CSLA_OP63_10rnd_7_62PZ59","CSLA_OP63_10rnd_7_62PZ59","CSLA_OP63_10rnd_7_62PZ59", "CSLA_OP63_10rnd_7_62Odst59"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
["CSLA_Sa61", "", "", "", ["CSLA_Sa61_20rnd_7_65Pi27"], [], ""],
["CSLA_Pi75lr", "", "", "", ["CSLA_Pi75_15Rnd_9Luger"], [], ""],
["CSLA_Pi75sr", "", "", "", ["CSLA_Pi75_15Rnd_9Luger"], [], ""],
["CSLA_Pi52", "", "", "", ["CSLA_Pi52_8rnd_7_62Pi52"], [], ""],
["CSLA_Pi82", "", "", "", ["CSLA_Pi82_12rnd_9Pi82"], [], ""]
]];


/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["CSLA_uni60wld"]];
_militaryLoadoutData set ["slUniforms", ["CSLA_uni60wld"]];
_eliteLoadoutData set ["vests", [
		"CSLA_gr85ptBase",
		"CSLA_gr85lrrSa61",
        "CSLA_gr85ptMdc",
        "CSLA_gr85ptCrw",
        "CSLA_gr85ptSgt",
		"CSLA_gr85ptOfc",
        "CSLA_gr85ptMg",
        "CSLA_gr85ptOP63"
]];
//_militaryLoadoutData set ["glVests", ["CSLA_uni60wld"]];
_militaryLoadoutData set ["Hvests", []];
_militaryLoadoutData set ["backpacks", ["CSLA_bp60"]];
_militaryLoadoutData set ["ATbackpacks", ["CSLA_bpRPG7"]];
_militaryLoadoutData set ["helmets", ["CSLA_helmet53","CSLA_helmet53d","CSLA_helmet53m","CSLA_helmet53j","CSLA_helmet53G"]];
_militaryLoadoutData set ["binoculars", ["CSLA_Bino"]];

_militaryLoadoutData set ["slRifles", [
["CSLA_Sa58V", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
["CSLA_Sa58P", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["CSLA_Sa58V", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["CSLA_VG70", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43"], ["CSLA_26_5vz70","CSLA_26_5vz70","CSLA_26_5vz70","CSLA_26_5vz70"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["CSLA_rSa61", "", "", "", ["CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["CSLA_UK59L", "", "", "", ["CSLA_UK59_50rnd_7_62PZ59", "CSLA_UK59_50rnd_7_62PZ59","CSLA_UK59_50rnd_7_62PZ59"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["CSLA_Sa58P", "", "", "CSLA_ZD4x8", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43"], [], "CSLA_Sa58bpd"]
]];
_militaryLoadoutData set ["sniperRifles", [
["CSLA_OP63", "", "", "", ["CSLA_OP63_10rnd_7_62PZ59","CSLA_OP63_10rnd_7_62PZ59","CSLA_OP63_10rnd_7_62PZ59", "CSLA_OP63_10rnd_7_62Odst59"], [], ""]
]];
_militaryLoadoutData set ["sidearms", ["CSLA_Pi52"]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["CSLA_uniPoliceMan"]];
_policeLoadoutData set ["slUniforms", ["CSLA_uniPoliceMan"]];
_policeLoadoutData set ["vests", []];
_policeLoadoutData set ["helmets", ["CSLA_PoliceCap"]];
_policeLoadoutData set ["SMGs", [
["CSLA_rSa61", "", "", "", ["CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27"], [], ""]
]];
_policeLoadoutData set ["sidearms", ["CSLA_Pi82"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["CSLA_uni60wld"]];
_militiaLoadoutData set ["slUniforms", ["CSLA_uni60wld"]];
_militiaLoadoutData set ["vests", ["CSLA_gr60drv"]];
_militiaLoadoutData set ["glVests", []];
_militiaLoadoutData set ["Hvests", []];
_militiaLoadoutData set ["backpacks", []];
_militiaLoadoutData set ["helmets", ["CSLA_cap"]];
_militiaLoadoutData set ["rifles", [
["CSLA_Sa58V", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["CSLA_Sa58V", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["CSLA_VG70", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43"], ["CSLA_26_5vz70","CSLA_26_5vz70","CSLA_26_5vz70","CSLA_26_5vz70"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["CSLA_rSa61", "", "", "", ["CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["CSLA_UK59L", "", "", "", ["CSLA_UK59_50rnd_7_62PZ59", "CSLA_UK59_50rnd_7_62PZ59","CSLA_UK59_50rnd_7_62PZ59"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["CSLA_Sa58P", "", "", "CSLA_ZD4x8", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43"], [], "CSLA_Sa58bpd"]
]];
_militiaLoadoutData set ["sniperRifles", [
["CSLA_OP63", "", "", "", ["CSLA_OP63_10rnd_7_62PZ59","CSLA_OP63_10rnd_7_62PZ59","CSLA_OP63_10rnd_7_62PZ59", "CSLA_OP63_10rnd_7_62Odst59"], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["CSLA_Pi52"]];
//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["CSLA_uniSrv"]];
_crewLoadoutData set ["slUniforms", ["CSLA_uniSrv"]];
_crewLoadoutData set ["vests", ["CSLA_gr60crw"]];
_crewLoadoutData set ["helmets", ["CSLA_helmetT28", "CSLA_helmetT28G"]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["CSLA_uniPlt"]];
_pilotLoadoutData set ["slUniforms", ["CSLA_uniPlt"]];
_pilotLoadoutData set ["vests", ["CSLA_gr60crw"]];
_pilotLoadoutData set ["helmets", ["CSLA_helmetPOP6"]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
    [selectRandomWeighted ["helmets", 2, "slHat", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["binoculars"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _radiomanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["longRangeRadios"] call _fnc_setBackpack;


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
    [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_medic"] call _fnc_addItemSet;
    ["items_medic_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 1.25]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    if (random 1 < 0.3) then {
        [["designatedGrenadeLaunchers", "grenadeLaunchers"] call _fnc_fallback] call _fnc_setPrimary;
        ["backpacks"] call _fnc_setBackpack;
    } else {
        ["grenadeLaunchers"] call _fnc_setPrimary;
    };
    
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;


    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_explosivesExpert_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["lightExplosives", 2] call _fnc_addItem;
    if (random 1 > 0.5) then {["heavyExplosives", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["atMines", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["apMines", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_engineer_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    if (random 1 > 0.5) then {["lightExplosives", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 1]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_machineGunner_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
    [selectRandomWeighted ["helmets", 2, "sniHats", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["sniVests","vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["SMGs"] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_police_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_crew_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["NVGs"] call _fnc_addNVGs;
};

private _unarmedTemplate = {
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _traitorTemplate = {
    ["traitorHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
    ["traitorVests"] call _fnc_setVest;
    ["traitorUniforms"] call _fnc_setUniform;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _officerTemplate = {
    ["officerHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
    ["officerVests"] call _fnc_setVest;
    ["officerUniforms"] call _fnc_setUniform;

    [["SMGs", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;
    
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _patrolSniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["cloakVests","vests"] call _fnc_fallback] call _fnc_setVest;
    [["cloakUniforms","uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _patrolSpotterTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["cloakVests","vests"] call _fnc_fallback] call _fnc_setVest;
    [["cloakUniforms","uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [selectRandom ["rifles", "carbines", "marksmanRifles"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};


////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _prefix = "SF";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _sfLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

/*{
    params ["_name", "_loadoutTemplate"];
    private _loadouts = [_sfLoadoutData, _loadoutTemplate] call _fnc_buildLoadouts;
    private _finalName = _prefix + _name;
    [_finalName, _loadouts] call _fnc_saveToTemplate;
} forEach _unitTypes;
*/

///////////////////////
//  Military Units   //
///////////////////////
private _prefix = "military";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]],
    	["PatrolSniper", _patrolSniperTemplate, [], [_prefix]],
    	["PatrolSpotter", _patrolSpotterTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
	["SquadLeader", _policeTemplate, [], [_prefix]],
	["Standard", _policeTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]],
    	["PatrolSniper", _patrolSniperTemplate, [], [_prefix]],
    	["PatrolSpotter", _patrolSpotterTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

///////////////////////
//  Elite Units   //
///////////////////////
private _prefix = "elite";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]],
    	["PatrolSniper", _patrolSniperTemplate, [], [_prefix]],
    	["PatrolSpotter", _patrolSpotterTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _eliteLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate, [], ["other"]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
["other", [["Pilot", _crewTemplate, [], ["other"]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _officerTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate, [], ["other"]]], _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

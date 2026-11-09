/////////////////////////
//  Rebel Unit Types  //
///////////////////////

private _templateSquadLeader = {
  ["uniformsReb"] call _fnc_setUniform;
  [selectRandomWeighted [[], 1, "facewear", 0.7]] call _fnc_setFacewear;

  ["items_medical_standard"] call _fnc_addItemSet;
  ["items_miscEssentials"] call _fnc_addItemSet;

  ["maps"] call _fnc_addMap;
  ["watches"] call _fnc_addWatch;
  ["compasses"] call _fnc_addCompass;
  ["binoculars"] call _fnc_addBinoculars;
};

private _templateRifleman = {
  ["uniformsReb"] call _fnc_setUniform;
  [selectRandomWeighted [[], 1, "facewear", 0.5]] call _fnc_setFacewear;

  ["items_medical_standard"] call _fnc_addItemSet;
  ["items_miscEssentials"] call _fnc_addItemSet;

  ["maps"] call _fnc_addMap;
  ["watches"] call _fnc_addWatch;
  ["compasses"] call _fnc_addCompass;
};

private _prefix = "militia";
private _unitTypes = [
  ["Petros", _templateSquadLeader],
  ["SquadLeader", _templateSquadLeader],
  ["Rifleman", _templateRifleman],
  ["staticCrew", _templateRifleman],
  ["Medic", _templateRifleman, [["medic", true]]],
  ["Engineer", _templateRifleman, [["engineer", true]]],
  ["ExplosivesExpert", _templateRifleman, [["explosiveSpecialist", true]]],
  ["Grenadier", _templateRifleman],
  ["LAT", _templateRifleman],
  ["AT", _templateRifleman],
  ["AA", _templateRifleman],
  ["MachineGunner", _templateRifleman],
  ["Marksman", _templateRifleman],
  ["Sniper", _templateRifleman],
  ["Unarmed", _templateRifleman]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
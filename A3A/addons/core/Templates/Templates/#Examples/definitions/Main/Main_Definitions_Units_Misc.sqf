#pragma hemtt ignore_variables ["_crewTemplate", "_pilotTemplate", "_officerTemplate", "_traitorTemplate", "_UnarmedTemplate", "_policeTemplate", "_crewLoadoutData", "_pilotLoadoutData", "_militaryLoadoutData", "_militiaLoadoutData", "_policeLoadoutData", "_fnc_generateAndSaveUnitsToTemplate"]

///////////////////////
//    Misc Units    //
/////////////////////

["other", [["Crew", _crewTemplate, [], ["other"]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate, [], ["other"]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

// "Kill the Official"
["other", [["Official", _officerTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

// "Kill the Traitor"
["other", [["Traitor", _traitorTemplate, [], ["other"]]], _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

// "Invader Punishment" Civilians
["other", [["Unarmed", _UnarmedTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

/////////////////////////
//    Police Units    //
///////////////////////
private _prefix = "police";
private _unitTypes = [
	["SquadLeader", _policeTemplate, [], [_prefix]],
	["Standard", _policeTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

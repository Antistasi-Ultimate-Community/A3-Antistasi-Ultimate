/*
Author: Barbolani, DoomMetal, MeltedPixel, Bob-Murphy, Wurzel0701, Socrates
    Sets the units traits (camouflage, medic, engineer) for the selected role of the player
    THIS FUNCTION DEPENDS ON ONLY THE DEFAULT COMMANDER HAVING A ROLE DESCRIPTION!

Arguments:
    <NULL>

Return Value:
    <NULL>

Scope: Local
Environment: Any
Public: No
Dependencies:
    <NULL>

Example:
    [] spawn A3A_fnc_unitTraits;
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _type = typeOf player;
private _text = "";

if(roleDescription player isEqualTo "@STR_role_default_commander_role_name" || {roleDescription player isEqualTo "Default Commander"}) then {
    player setUnitTrait ["camouflageCoef",0.8];
    player setUnitTrait ["audibleCoef",0.8];
    player setUnitTrait ["loadCoef",1.4];
    player setUnitTrait ["medic", true];
    player setUnitTrait ["explosiveSpecialist", true];
	player setUnitTrait ["UAVHacker",true];
    // ACE clears the engineer unitTrait and adds this var at CBA initPost, so we have to do it ourselves; Credit: https://github.com/official-antistasi-community/A3-Antistasi/pull/2978/files
    if (missionNamespace getVariable ["ace_repair_enabled", false]) then { player setVariable ["ace_isEngineer", true, true] } else { player setUnitTrait ["engineer", true] };
    _text = localize "STR_role_default_commander";
} else {
    switch (_type) do {
    	case "I_G_medic_F":  {
			player setUnitTrait ["camouflageCoef",0.8]; 
			player setUnitTrait ["audibleCoef",0.8]; 
			player setUnitTrait ["loadCoef",1.2]; 
			player setUnitTrait ["medic", true]; ///why not?
			_text = localize "STR_role_medic"
		}; 
    	case "I_G_Soldier_TL_F": {
			player setUnitTrait ["camouflageCoef",0.8]; 
			player setUnitTrait ["audibleCoef",0.8]; 
			player setUnitTrait ["loadCoef",1.4]; 
			_text = localize "STR_role_teamleader"
		}; 
    	case "I_G_Soldier_F":  {
			player setUnitTrait ["audibleCoef",1.15]; 
			player setUnitTrait ["camouflageCoef",1.15]; 
			player setUnitTrait ["loadCoef",0.7]; 
			_text = localize "STR_role_rifleman"
		}; 
    	case "I_G_engineer_F":  {
			player setUnitTrait ["UAVHacker",true]; 
			player setUnitTrait ["explosiveSpecialist", true]; ///why not?
			_text = localize "STR_role_engineer"
		}; 
    };
};

if (isDiscordRichPresenceActive) then {
	if(player != theBoss) then {
		private _roleName = getText (configFile >> "CfgVehicles" >> _type >> "displayName");
		[["UpdateDetails", _roleName]] call SCRT_fnc_misc_updateRichPresence;
	} else {
		[["UpdateDetails", format ["%1 Commander", FactionGet(reb,"name")]]] call SCRT_fnc_misc_updateRichPresence;
	};
};

if (_text isNotEqualTo "") then {
    sleep 5;
	[localize "STR_role_unit_traits", _text] call A3A_fnc_customHint;
};

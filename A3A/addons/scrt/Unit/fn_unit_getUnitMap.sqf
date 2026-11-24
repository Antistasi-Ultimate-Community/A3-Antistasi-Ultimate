#include "..\script_component.hpp"
/*
Maintainer: Socrates
    Returns base unit map (used only by fn_compatibilityLoadFaction).
	This needed to retain BI unit config traits that otherwise would be lost and basically makes some difference
	for example, between SF and other types of soldiers.


Return Value:
    <HASHMAP>

Scope: Client, Server
Environment: Any
Public: Yes

Example:
Invaders call SCRT_fnc_misc_getUnitMap;
*/

///might need to add opfor here for rivals

private _side = _this;

private _unitClassMap = createHashMapFromArray (switch (_side) do {
	case west: { 
		[
			["militia_SquadLeader", QEGVAR(core,Occupants_Militia_SquadLeader)],
			["militia_Rifleman", QEGVAR(core,Occupants_Militia_Rifleman)],
			["militia_Radioman", QEGVAR(core,Occupants_Militia_Radioman)],
			["militia_Medic", QEGVAR(core,Occupants_Militia_Medic)],
			["militia_Engineer", QEGVAR(core,Occupants_Militia_Engineer)],
			["militia_ExplosivesExpert", QEGVAR(core,Occupants_Militia_ExplosivesExpert)],
			["militia_Grenadier", QEGVAR(core,Occupants_Militia_Grenadier)],
			["militia_LAT", QEGVAR(core,Occupants_Militia_LAT)],
			["militia_AT", QEGVAR(core,Occupants_Militia_AT)],
			["militia_AA", QEGVAR(core,Occupants_Militia_AA)],
			["militia_MachineGunner", QEGVAR(core,Occupants_Militia_MachineGunner)],
			["militia_Marksman", QEGVAR(core,Occupants_Militia_Marksman)],
			["militia_Sniper", QEGVAR(core,Occupants_Militia_Sniper)],

			["military_SquadLeader", QEGVAR(core,Occupants_Military_SquadLeader)],
			["military_Rifleman", QEGVAR(core,Occupants_Military_Rifleman)],
			["military_Radioman", QEGVAR(core,Occupants_Military_Radioman)],
			["military_Medic", QEGVAR(core,Occupants_Military_Medic)],
			["military_Engineer", QEGVAR(core,Occupants_Military_Engineer)],
			["military_ExplosivesExpert", QEGVAR(core,Occupants_Military_ExplosivesExpert)],
			["military_Grenadier", QEGVAR(core,Occupants_Military_Grenadier)],
			["military_LAT", QEGVAR(core,Occupants_Military_LAT)],
			["military_AT", QEGVAR(core,Occupants_Military_AT)],
			["military_AA", QEGVAR(core,Occupants_Military_AA)],
			["military_MachineGunner", QEGVAR(core,Occupants_Military_MachineGunner)],
			["military_Marksman", QEGVAR(core,Occupants_Military_Marksman)],
			["military_Sniper", QEGVAR(core,Occupants_Military_Sniper)],

			["elite_SquadLeader", QEGVAR(core,Occupants_Elite_SquadLeader)],
			["elite_Rifleman", QEGVAR(core,Occupants_Elite_Rifleman)],
			["elite_Radioman", QEGVAR(core,Occupants_Elite_Radioman)],
			["elite_Medic", QEGVAR(core,Occupants_Elite_Medic)],
			["elite_Engineer", QEGVAR(core,Occupants_Elite_Engineer)],
			["elite_ExplosivesExpert", QEGVAR(core,Occupants_Elite_ExplosivesExpert)],
			["elite_Grenadier", QEGVAR(core,Occupants_Elite_Grenadier)],
			["elite_LAT", QEGVAR(core,Occupants_Elite_LAT)],
			["elite_AT", QEGVAR(core,Occupants_Elite_AT)],
			["elite_AA", QEGVAR(core,Occupants_Elite_AA)],
			["elite_MachineGunner", QEGVAR(core,Occupants_Elite_MachineGunner)],
			["elite_Marksman", QEGVAR(core,Occupants_Elite_Marksman)],
			["elite_Sniper", QEGVAR(core,Occupants_Elite_Sniper)],

			["sf_SquadLeader", QEGVAR(core,Occupants_SpecialForces_SquadLeader)],
			["sf_Rifleman", QEGVAR(core,Occupants_SpecialForces_Rifleman)],
			["sf_Radioman", QEGVAR(core,Occupants_SpecialForces_Radioman)],
			["sf_Medic", QEGVAR(core,Occupants_SpecialForces_Medic)],
			["sf_Engineer", QEGVAR(core,Occupants_SpecialForces_Engineer)],
			["sf_ExplosivesExpert", QEGVAR(core,Occupants_SpecialForces_ExplosivesExpert)],
			["sf_Grenadier", QEGVAR(core,Occupants_SpecialForces_Grenadier)],
			["sf_LAT", QEGVAR(core,Occupants_SpecialForces_LAT)],
			["sf_AT", QEGVAR(core,Occupants_SpecialForces_AT)],
			["sf_AA", QEGVAR(core,Occupants_SpecialForces_AA)],
			["sf_MachineGunner", QEGVAR(core,Occupants_SpecialForces_MachineGunner)],
			["sf_Marksman", QEGVAR(core,Occupants_SpecialForces_Marksman)],
			["sf_Sniper", QEGVAR(core,Occupants_SpecialForces_Sniper)],

			["other_Crew", QEGVAR(core,Occupants_Other_Crew)],
			["other_Unarmed", QEGVAR(core,Occupants_Other_Unarmed)],
			["other_Official", QEGVAR(core,Occupants_Other_Official)],
			["other_Traitor", QEGVAR(core,Occupants_Other_Traitor)],
			["other_Pilot", QEGVAR(core,Occupants_Other_Pilot)],
			["police_SquadLeader", QEGVAR(core,Occupants_Police_SquadLeader)],
			["police_Standard", QEGVAR(core,Occupants_Police_Standard)]
		];
	};
	case east: { 
		[
			["militia_SquadLeader", QEGVAR(core,Invaders_Militia_SquadLeader)],
			["militia_Rifleman", QEGVAR(core,Invaders_Militia_Rifleman)],
			["militia_Radioman", QEGVAR(core,Invaders_Militia_Radioman)],
			["militia_Medic", QEGVAR(core,Invaders_Militia_Medic)],
			["militia_Engineer", QEGVAR(core,Invaders_Militia_Engineer)],
			["militia_ExplosivesExpert", QEGVAR(core,Invaders_Militia_ExplosivesExpert)],
			["militia_Grenadier", QEGVAR(core,Invaders_Militia_Grenadier)],
			["militia_LAT", QEGVAR(core,Invaders_Militia_LAT)],
			["militia_AT", QEGVAR(core,Invaders_Militia_AT)],
			["militia_AA", QEGVAR(core,Invaders_Militia_AA)],
			["militia_MachineGunner", QEGVAR(core,Invaders_Militia_MachineGunner)],
			["militia_Marksman", QEGVAR(core,Invaders_Militia_Marksman)],
			["militia_Sniper", QEGVAR(core,Invaders_Militia_Sniper)],

			["military_SquadLeader", QEGVAR(core,Invaders_Military_SquadLeader)],
			["military_Rifleman", QEGVAR(core,Invaders_Military_Rifleman)],
			["military_Radioman", QEGVAR(core,Invaders_Military_Radioman)],
			["military_Medic", QEGVAR(core,Invaders_Military_Medic)],
			["military_Engineer", QEGVAR(core,Invaders_Military_Engineer)],
			["military_ExplosivesExpert", QEGVAR(core,Invaders_Military_ExplosivesExpert)],
			["military_Grenadier", QEGVAR(core,Invaders_Military_Grenadier)],
			["military_LAT", QEGVAR(core,Invaders_Military_LAT)],
			["military_AT", QEGVAR(core,Invaders_Military_AT)],
			["military_AA", QEGVAR(core,Invaders_Military_AA)],
			["military_MachineGunner", QEGVAR(core,Invaders_Military_MachineGunner)],
			["military_Marksman", QEGVAR(core,Invaders_Military_Marksman)],
			["military_Sniper", QEGVAR(core,Invaders_Military_Sniper)],

			["elite_SquadLeader", QEGVAR(core,Invaders_Elite_SquadLeader)],
			["elite_Rifleman", QEGVAR(core,Invaders_Elite_Rifleman)],
			["elite_Radioman", QEGVAR(core,Invaders_Elite_Radioman)],
			["elite_Medic", QEGVAR(core,Invaders_Elite_Medic)],
			["elite_Engineer", QEGVAR(core,Invaders_Elite_Engineer)],
			["elite_ExplosivesExpert", QEGVAR(core,Invaders_Elite_ExplosivesExpert)],
			["elite_Grenadier", QEGVAR(core,Invaders_Elite_Grenadier)],
			["elite_LAT", QEGVAR(core,Invaders_Elite_LAT)],
			["elite_AT", QEGVAR(core,Invaders_Elite_AT)],
			["elite_AA", QEGVAR(core,Invaders_Elite_AA)],
			["elite_MachineGunner", QEGVAR(core,Invaders_Elite_MachineGunner)],
			["elite_Marksman", QEGVAR(core,Invaders_Elite_Marksman)],
			["elite_Sniper", QEGVAR(core,Invaders_Elite_Sniper)],

			["sf_SquadLeader", QEGVAR(core,Invaders_SpecialForces_SquadLeader)],
			["sf_Rifleman", QEGVAR(core,Invaders_SpecialForces_Rifleman)],
			["sf_Radioman", QEGVAR(core,Invaders_SpecialForces_Radioman)],
			["sf_Medic", QEGVAR(core,Invaders_SpecialForces_Medic)],
			["sf_Engineer", QEGVAR(core,Invaders_SpecialForces_Engineer)],
			["sf_ExplosivesExpert", QEGVAR(core,Invaders_SpecialForces_ExplosivesExpert)],
			["sf_Grenadier", QEGVAR(core,Invaders_SpecialForces_Grenadier)],
			["sf_LAT", QEGVAR(core,Invaders_SpecialForces_LAT)],
			["sf_AT", QEGVAR(core,Invaders_SpecialForces_AT)],
			["sf_AA", QEGVAR(core,Invaders_SpecialForces_AA)],
			["sf_MachineGunner", QEGVAR(core,Invaders_SpecialForces_MachineGunner)],
			["sf_Marksman", QEGVAR(core,Invaders_SpecialForces_Marksman)],
			["sf_Sniper", QEGVAR(core,Invaders_SpecialForces_Sniper)],

			["other_Crew", QEGVAR(core,Invaders_Other_Crew)],
			["other_Unarmed", QEGVAR(core,Invaders_Other_Unarmed)],
			["other_Official", QEGVAR(core,Invaders_Other_Official)],
			["other_Traitor", QEGVAR(core,Invaders_Other_Traitor)],
			["other_Pilot", QEGVAR(core,Invaders_Other_Pilot)],
			["police_SquadLeader", QEGVAR(core,Invaders_Police_SquadLeader)],
			["police_Standard", QEGVAR(core,Invaders_Police_Standard)]
		];
	};
	case independent: {
		[
			["militia_Unarmed", QEGVAR(core,Rebels_Unarmed)],
        	["militia_Rifleman", QEGVAR(core,Rebels_Base)],
        	["militia_staticCrew", QEGVAR(core,Rebels_Base)],
        	["militia_Medic", QEGVAR(core,Rebels_Medic)],
        	["militia_Sniper", QEGVAR(core,Rebels_Sniper)],
        	["militia_Marksman", QEGVAR(core,Rebels_Marksman)],
        	["militia_LAT", QEGVAR(core,Rebels_LAT)],
        	["militia_MachineGunner", QEGVAR(core,Rebels_MachineGunner)],
        	["militia_ExplosivesExpert", QEGVAR(core,Rebels_ExplosivesExpert)],
        	["militia_Grenadier", QEGVAR(core,Rebels_Grenadier)],
        	["militia_SquadLeader", QEGVAR(core,Rebels_SquadLeader)],
        	["militia_Engineer", QEGVAR(core,Rebels_Engineer)],
        	["militia_AT", QEGVAR(core,Rebels_AT)],
        	["militia_AA", QEGVAR(core,Rebels_AA)],
        	["militia_Petros", QEGVAR(core,Rebels_Petros)]
		];
	};
	case civilian: {
		[
			["militia_Worker", QEGVAR(core,Civilians_Worker)],
			["militia_Press", QEGVAR(core,Civilians_Press)],
			["militia_Man", QEGVAR(core,Civilians_Man)]
		];
	};
});

_unitClassMap

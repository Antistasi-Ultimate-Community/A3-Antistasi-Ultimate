class CfgGroups {
	class INDEP {
		class A3U_Rebels {
			name = $STR_A3U_Zeus_Faction_Rebels;
			class Infantry {
				name = $STR_A3U_Zeus_GroupType_Infantry;
				
				class A3U_Rebels_Infantry_Squad {
					name = $STR_A3U_Zeus_GroupType_Infantry_Squad;
					faction = "A3U_Rebels";
					side = 2;
					class Unit0 {
						side = 2;
						vehicle = "A3U_Rebels_SquadLeader";
						rank = "SERGEANT";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = "A3U_Rebels_Rifleman";
						rank = "CORPORAL";
						position[] = {2,-2,0};
					};
					class Unit2 : Unit1 {
						position[] = {4,-4,0};
					};
					class Unit3 : Unit0 {
						vehicle = "A3U_Rebels_MachineGunner";
						rank = "PRIVATE";
						position[] = {6,-6,0};
					};
					class Unit4 : Unit0 {
						vehicle = "A3U_Rebels_Grenadier";
						rank = "PRIVATE";
						position[] = {8,-8,0};
					};
					class Unit5 : Unit1 {
						position[] = {-2,-2,0};
					};
					class Unit6 : Unit2 {
						position[] = {-4,-4,0};
					};
					class Unit7 : Unit3 {
						position[] = {-6,-6,0};
					};
					class Unit8 : Unit4 {
						position[] = {-8,-8,0};
					};
				};
				class A3U_Rebels_Infantry_Team {
					name = $STR_A3U_Zeus_GroupType_Infantry_Team;
					faction = "A3U_Rebels";
					side = 2;
					class Unit0 {
						side = 2;
						vehicle = "A3U_Rebels_Rifleman";
						rank = "CORPORAL";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = "A3U_Rebels_Rifleman";
						rank = "PRIVATE";
						position[] = {2,-2,0};
					};
					class Unit2 : Unit1 {
						vehicle = "A3U_Rebels_MachineGunner";
						rank = "PRIVATE";
						position[] = {-2,-2,0};
					};
					class Unit3 : Unit1 {
						vehicle = "A3U_Rebels_Grenadier";
						rank = "PRIVATE";
						position[] = {0,-4,0};
					};
				};
				class A3U_Rebels_Infantry_MachineGun_Team {
					name = $STR_A3U_Zeus_GroupType_Infantry_MGTeam;
					faction = "A3U_Rebels";
					side = 2;
					class Unit0 {
						side = 2;
						vehicle = "A3U_Rebels_Rifleman";
						rank = "CORPORAL";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = "A3U_Rebels_MachineGunner";
						rank = "PRIVATE";
						position[] = {2,-2,0};
					};
					class Unit2 : Unit1 {
						vehicle = "A3U_Rebels_Rifleman";
						rank = "PRIVATE";
						position[] = {-2,-2,0};
					};
				};
				class A3U_Rebels_Infantry_AT_Team : A3U_Rebels_Infantry_MachineGun_Team {
					name = $STR_A3U_Zeus_GroupType_Infantry_ATTeam;
					class Unit0 : Unit0 {};
					class Unit1 : Unit1 {
						vehicle = "A3U_Rebels_AT";
					};
					class Unit2 : Unit2 {};
				};
				class A3U_Rebels_Infantry_AA_Team : A3U_Rebels_Infantry_MachineGun_Team {
					name = $STR_A3U_Zeus_GroupType_Infantry_AATeam;
					class Unit0 : Unit0 {};
					class Unit1 : Unit1 {
						vehicle = "A3U_Rebels_AA";
					};
					class Unit2 : Unit2 {};
				};
				class A3U_Rebels_Infantry_Sniper_Team {
					name = $STR_A3U_Zeus_GroupType_Infantry_SniperTeam;
					faction = "A3U_Rebels";
					side = 2;
					class Unit0 {
						side = 2;
						vehicle = "A3U_Rebels_Marksman";
						rank = "SERGEANT";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = "A3U_Rebels_Sniper";
						rank = "CORPORAL";
						position[] = {2,-2,0};
					};
				};
			};
			/* 
			// ? Not needed now that crewed vehicles show in units section?
			class Weapons {
				name = $STR_A3U_Zeus_GroupType_Weapons;

				class A3U_Rebels_Weapons_MG_Team {
					name = $STR_A3U_Zeus_GroupType_Weapons_MGTeam;
					faction = "A3U_Rebels";
					side = 2;
					class Unit0 {
						side = 2;
						vehicle = "A3U_Rebels_Vehicle_StaticMG";
						rank = "PRIVATE";
						position[] = {0,0,0};
					};
					class Unit1 {
						side = 2;
						vehicle = "A3U_Rebels_SquadLeader";
						rank = "SERGEANT";
						position[] = {0,-2,0};
					};
					class Unit2 : Unit1 {
						vehicle = "A3U_Rebels_Rifleman";
						rank = "Corporal";
						position[] = {-2,-4,0};
					};
					class Unit3 : Unit2 {
						rank = "PRIVATE";
						position[] = {2,-4,0};
					};
				};
				class A3U_Rebels_Weapons_AT_Team : A3U_Rebels_Weapons_MG_Team {
					name = $STR_A3U_Zeus_GroupType_Weapons_ATTeam;
					class Unit0 : Unit0 {
						vehicle = "A3U_Rebels_Vehicle_StaticAT";
					};
					class Unit1 : Unit1 {};
					class Unit2 : Unit2 {};
					class Unit3 : Unit3 {};
				};
				class A3U_Rebels_Weapons_AA_Team : A3U_Rebels_Weapons_MG_Team {
					name = $STR_A3U_Zeus_GroupType_Weapons_AATeam;
					class Unit0 : Unit0 {
						vehicle = "A3U_Rebels_Vehicle_StaticAA";
					};
					class Unit1 : Unit1 {};
					class Unit2 : Unit2 {};
					class Unit3 : Unit3 {};
				};
				class A3U_Rebels_Weapons_Mortar_Team : A3U_Rebels_Weapons_MG_Team {
					name = $STR_A3U_Zeus_GroupType_Weapons_MortarTeam;
					class Unit0 : Unit0 {
						vehicle = "A3U_Rebels_Vehicle_Mortar";
					};
					class Unit1 : Unit1 {};
					class Unit2 : Unit2 {};
					class Unit3 : Unit3 {};
				};				
			};
			class Vehicles {
				name = $STR_A3U_Zeus_GroupType_Vehicles;

				class A3U_Rebels_Vehicles_AT {
					name = $STR_A3U_Zeus_GroupType_Vehicles_AT;
					faction = "A3U_Rebels";
					side = 2;
					class Unit0 {
						side = 2;
						vehicle = "A3U_Rebels_Vehicle_AT";
						rank = "PRIVATE";
						position[] = {0,0,0};
					};
					class Unit1 {
						side = 2;
						vehicle = "A3U_Rebels_staticCrew";
						rank = "CORPORAL";
						position[] = {0,-12,0};
					};
					class Unit2 : Unit1 {
						rank = "PRIVATE";
						position[] = {2,-12,0};
					};
				};
				class A3U_Rebels_Vehicles_AA : A3U_Rebels_Vehicles_AT {
					name = $STR_A3U_Zeus_GroupType_Vehicles_AA;
					class Unit0 : Unit0 {
						vehicle = "A3U_Rebels_Vehicle_AA";
					};
					class Unit1 : Unit1 {};
					class Unit2 : Unit2 {};
				};
			};
			*/
		};
	};
	class WEST {
		class A3U_Occupants {
			name = $STR_A3U_Zeus_Faction_Occupants;
			class Infantry_Militia {
				name = $STR_A3U_Zeus_GroupType_Infantry_Militia;
				
				class A3U_Occupants_Militia_Infantry_Squad {
					name = $STR_A3U_Zeus_GroupType_Infantry_Squad;
					faction = "A3U_Occupants";
					side = 1;
					class Unit0 {
						side = 1;
						vehicle = "A3U_Occupants_Militia_SquadLeader";
						rank = "SERGEANT";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = "A3U_Occupants_Militia_Rifleman";
						rank = "CORPORAL";
						position[] = {2,-2,0};
					};
					class Unit2 : Unit1 {
						position[] = {4,-4,0};
					};
					class Unit3 : Unit0 {
						vehicle = "A3U_Occupants_Militia_MachineGunner";
						rank = "PRIVATE";
						position[] = {6,-6,0};
					};
					class Unit4 : Unit0 {
						vehicle = "A3U_Occupants_Militia_Grenadier";
						rank = "PRIVATE";
						position[] = {8,-8,0};
					};
					class Unit5 : Unit1 {
						position[] = {-2,-2,0};
					};
					class Unit6 : Unit2 {
						position[] = {-4,-4,0};
					};
					class Unit7 : Unit3 {
						position[] = {-6,-6,0};
					};
					class Unit8 : Unit4 {
						position[] = {-8,-8,0};
					};
				};
				class A3U_Occupants_Militia_Infantry_Team {
					name = $STR_A3U_Zeus_GroupType_Infantry_Team;
					faction = "A3U_Occupants";
					side = 1;
					class Unit0 {
						side = 1;
						vehicle = "A3U_Occupants_Militia_Rifleman";
						rank = "CORPORAL";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = "A3U_Occupants_Militia_Rifleman";
						rank = "PRIVATE";
						position[] = {2,-2,0};
					};
					class Unit2 : Unit1 {
						vehicle = "A3U_Occupants_Militia_MachineGunner";
						rank = "PRIVATE";
						position[] = {-2,-2,0};
					};
					class Unit3 : Unit1 {
						vehicle = "A3U_Occupants_Militia_Grenadier";
						rank = "PRIVATE";
						position[] = {0,-4,0};
					};
				};
				class A3U_Occupants_Militia_Infantry_MachineGun_Team {
					name = $STR_A3U_Zeus_GroupType_Infantry_MGTeam;
					faction = "A3U_Occupants";
					side = 1;
					class Unit0 {
						side = 1;
						vehicle = "A3U_Occupants_Militia_Rifleman";
						rank = "CORPORAL";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = "A3U_Occupants_Militia_MachineGunner";
						rank = "PRIVATE";
						position[] = {2,-2,0};
					};
					class Unit2 : Unit1 {
						vehicle = "A3U_Occupants_Militia_Rifleman";
						rank = "PRIVATE";
						position[] = {-2,-2,0};
					};
				};
				class A3U_Occupants_Militia_Infantry_AT_Team : A3U_Occupants_Militia_Infantry_MachineGun_Team {
					name = $STR_A3U_Zeus_GroupType_Infantry_ATTeam;
					class Unit0 : Unit0 {};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_Vehicle_StaticAT";
					};
					class Unit2 : Unit2 {};
				};
				class A3U_Occupants_Militia_Infantry_AA_Team : A3U_Occupants_Militia_Infantry_MachineGun_Team {
					name = $STR_A3U_Zeus_GroupType_Infantry_AATeam;
					class Unit0 : Unit0 {};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_Vehicle_StaticAA";
					};
					class Unit2 : Unit2 {};
				};
				class A3U_Occupants_Militia_Infantry_Sniper_Team {
					name = $STR_A3U_Zeus_GroupType_Infantry_SniperTeam;
					faction = "A3U_Occupants";
					side = 1;
					class Unit0 {
						side = 1;
						vehicle = "A3U_Occupants_Militia_Marksman";
						rank = "SERGEANT";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = "A3U_Occupants_Militia_Sniper";
						rank = "CORPORAL";
						position[] = {2,-2,0};
					};
				};
			};
			class Infantry_Military : Infantry_Militia {
				name = $STR_A3U_Zeus_GroupType_Infantry_Military;

				class A3U_Occupants_Military_Infantry_Squad : A3U_Occupants_Militia_Infantry_Squad {
					class Unit0 : Unit0 {
						vehicle = "A3U_Occupants_Military_SquadLeader";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_Military_Rifleman";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Occupants_Military_Rifleman";
					};
					class Unit3 : Unit3 {
						vehicle = "A3U_Occupants_Military_MachineGunner";
					};
					class Unit4 : Unit4 {
						vehicle = "A3U_Occupants_Military_Grenadier";
					};
					class Unit5 : Unit5 {
						vehicle = "A3U_Occupants_Military_Rifleman";
					};
					class Unit6 : Unit6 {
						vehicle = "A3U_Occupants_Military_Rifleman";
					};
					class Unit7 : Unit7 {
						vehicle = "A3U_Occupants_Military_MachineGunner";
					};
					class Unit8 : Unit8 {
						vehicle = "A3U_Occupants_Military_Grenadier";
					};
				};
				class A3U_Occupants_Military_Infantry_Team : A3U_Occupants_Militia_Infantry_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Occupants_Military_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_Military_Rifleman";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Occupants_Military_MachineGunner";
					};
					class Unit3 : Unit3 {
						vehicle = "A3U_Occupants_Military_Grenadier";
					};
				};
				class A3U_Occupants_Military_Infantry_MachineGun_Team : A3U_Occupants_Militia_Infantry_MachineGun_Team {
					name = $STR_A3U_Zeus_GroupType_Infantry_MGTeam;
					class Unit0 : Unit0 {
						vehicle = "A3U_Occupants_Military_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_Military_MachineGunner";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Occupants_Military_Rifleman";
					};
				};
				class A3U_Occupants_Military_Infantry_AT_Team : A3U_Occupants_Militia_Infantry_AT_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Occupants_Military_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_Vehicle_StaticAT";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Occupants_Military_Rifleman";
					};
				};
				class A3U_Occupants_Military_Infantry_AA_Team : A3U_Occupants_Militia_Infantry_AA_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Occupants_Military_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_Vehicle_StaticAA";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Occupants_Military_Rifleman";
					};
				};
				class A3U_Occupants_Military_Infantry_Sniper_Team : A3U_Occupants_Militia_Infantry_Sniper_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Occupants_Military_Marksman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_Military_Sniper";
					};
				};
			};
			class Infantry_Elite : Infantry_Militia {
				name = $STR_A3U_Zeus_GroupType_Infantry_Elite;

				class A3U_Occupants_Elite_Infantry_Squad : A3U_Occupants_Militia_Infantry_Squad {
					class Unit0 : Unit0 {
						vehicle = "A3U_Occupants_Elite_SquadLeader";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_Elite_Rifleman";
					};
					class Unit2 : Unit2 {};
					class Unit3 : Unit3 {
						vehicle = "A3U_Occupants_Elite_MachineGunner";
					};
					class Unit4 : Unit4 {
						vehicle = "A3U_Occupants_Elite_Grenadier";
					};
					class Unit5 : Unit5 {
						vehicle = "A3U_Occupants_Elite_Rifleman";
					};
					class Unit6 : Unit6 {
						vehicle = "A3U_Occupants_Elite_Rifleman";
					};
					class Unit7 : Unit7 {
						vehicle = "A3U_Occupants_Elite_MachineGunner";
					};
					class Unit8 : Unit8 {
						vehicle = "A3U_Occupants_Elite_Grenadier";
					};
				};
				class A3U_Occupants_Elite_Infantry_Team : A3U_Occupants_Militia_Infantry_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Occupants_Elite_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_Elite_Rifleman";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Occupants_Elite_MachineGunner";
					};
					class Unit3 : Unit3 {
						vehicle = "A3U_Occupants_Elite_Grenadier";
					};
				};
				class A3U_Occupants_Elite_Infantry_MachineGun_Team : A3U_Occupants_Militia_Infantry_MachineGun_Team {
					name = $STR_A3U_Zeus_GroupType_Infantry_MGTeam;
					class Unit0 : Unit0 {
						vehicle = "A3U_Occupants_Elite_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_Elite_MachineGunner";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Occupants_Elite_Rifleman";
					};
				};
				class A3U_Occupants_Elite_Infantry_AT_Team : A3U_Occupants_Militia_Infantry_AT_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Occupants_Elite_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_Vehicle_StaticAT";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Occupants_Elite_Rifleman";
					};
				};
				class A3U_Occupants_Elite_Infantry_AA_Team : A3U_Occupants_Militia_Infantry_AA_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Occupants_Elite_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_Vehicle_StaticAA";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Occupants_Elite_Rifleman";
					};
				};
				class A3U_Occupants_Elite_Infantry_Sniper_Team : A3U_Occupants_Militia_Infantry_Sniper_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Occupants_Elite_Marksman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_Elite_Sniper";
					};
				};
			};
			class Infantry_SpecialForces : Infantry_Militia {
				name = $STR_A3U_Zeus_GroupType_Infantry_SpecialForces;

				class A3U_Occupants_SpecialForces_Infantry_Squad : A3U_Occupants_Militia_Infantry_Squad {
					class Unit0 : Unit0 {
						vehicle = "A3U_Occupants_SpecialForces_SquadLeader";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_SpecialForces_Rifleman";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Occupants_SpecialForces_Rifleman";
					};
					class Unit3 : Unit3 {
						vehicle = "A3U_Occupants_SpecialForces_MachineGunner";
					};
					class Unit4 : Unit4 {
						vehicle = "A3U_Occupants_SpecialForces_Grenadier";
					};
					class Unit5 : Unit5 {
						vehicle = "A3U_Occupants_SpecialForces_Rifleman";
					};
					class Unit6 : Unit6 {
						vehicle = "A3U_Occupants_SpecialForces_Rifleman";
					};
					class Unit7 : Unit7 {
						vehicle = "A3U_Occupants_SpecialForces_MachineGunner";
					};
					class Unit8 : Unit8 {
						vehicle = "A3U_Occupants_SpecialForces_Grenadier";
					};
				};
				class A3U_Occupants_SpecialForces_Infantry_Team : A3U_Occupants_Militia_Infantry_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Occupants_SpecialForces_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_SpecialForces_Rifleman";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Occupants_SpecialForces_MachineGunner";
					};
					class Unit3 : Unit3 {
						vehicle = "A3U_Occupants_SpecialForces_Grenadier";
					};
				};
				class A3U_Occupants_SpecialForces_Infantry_MachineGun_Team : A3U_Occupants_Militia_Infantry_MachineGun_Team {
					name = $STR_A3U_Zeus_GroupType_Infantry_MGTeam;
					class Unit0 : Unit0 {
						vehicle = "A3U_Occupants_SpecialForces_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_SpecialForces_MachineGunner";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Occupants_SpecialForces_Rifleman";
					};
				};
				class A3U_Occupants_SpecialForces_Infantry_AT_Team : A3U_Occupants_Militia_Infantry_AT_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Occupants_SpecialForces_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_Vehicle_StaticAT";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Occupants_SpecialForces_Rifleman";
					};
				};
				class A3U_Occupants_SpecialForces_Infantry_AA_Team : A3U_Occupants_Militia_Infantry_AA_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Occupants_SpecialForces_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_Vehicle_StaticAA";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Occupants_SpecialForces_Rifleman";
					};
				};
				class A3U_Occupants_SpecialForces_Infantry_Sniper_Team : A3U_Occupants_Militia_Infantry_Sniper_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Occupants_SpecialForces_Marksman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_SpecialForces_Sniper";
					};
				};
			};
			class Infantry_Police : Infantry_Militia {
				name = $STR_A3U_Zeus_GroupType_Infantry_Police;

				class A3U_Occupants_Police_Infantry_Squad : A3U_Occupants_Militia_Infantry_Squad {
					class Unit0 : Unit0 {
						vehicle = "A3U_Occupants_Police_SquadLeader";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_Police_Standard";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Occupants_Police_Standard";
					};
					class Unit3 : Unit3 {
						vehicle = "A3U_Occupants_Police_Standard";
					};
					class Unit4 : Unit4 {
						vehicle = "A3U_Occupants_Police_Standard";
					};
					class Unit5 : Unit5 {
						vehicle = "A3U_Occupants_Police_Standard";
					};
					class Unit6 : Unit6 {
						vehicle = "A3U_Occupants_Police_Standard";
					};
					class Unit7 : Unit7 {
						vehicle = "A3U_Occupants_Police_Standard";
					};
					class Unit8 : Unit8 {
						vehicle = "A3U_Occupants_Police_Standard";
					};
				};
				class A3U_Occupants_Police_Infantry_Team : A3U_Occupants_Militia_Infantry_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Occupants_Police_Standard";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Occupants_Police_Standard";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Occupants_Police_Standard";
					};
					class Unit3 : Unit3 {
						vehicle = "A3U_Occupants_Police_Standard";
					};
				};
				delete A3U_Occupants_Militia_Infantry_MachineGun_Team;
				delete A3U_Occupants_Militia_Infantry_AT_Team;
				delete A3U_Occupants_Militia_Infantry_AA_Team;
				delete A3U_Occupants_Militia_Infantry_Sniper_Team;
			};
		};
	};
	class EAST {
		class A3U_Invaders {
			name = $STR_A3U_Zeus_Faction_Invaders;
			class Infantry_Militia {
				name = $STR_A3U_Zeus_GroupType_Infantry_Militia;
				
				class A3U_Invaders_Militia_Infantry_Squad {
					name = $STR_A3U_Zeus_GroupType_Infantry_Squad;
					faction = "A3U_Invaders";
					side = 0;
					class Unit0 {
						side = 0;
						vehicle = "A3U_Invaders_Militia_SquadLeader";
						rank = "SERGEANT";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = "A3U_Invaders_Militia_Rifleman";
						rank = "CORPORAL";
						position[] = {2,-2,0};
					};
					class Unit2 : Unit1 {
						position[] = {4,-4,0};
					};
					class Unit3 : Unit0 {
						vehicle = "A3U_Invaders_Militia_MachineGunner";
						rank = "PRIVATE";
						position[] = {6,-6,0};
					};
					class Unit4 : Unit0 {
						vehicle = "A3U_Invaders_Militia_Grenadier";
						rank = "PRIVATE";
						position[] = {8,-8,0};
					};
					class Unit5 : Unit1 {
						position[] = {-2,-2,0};
					};
					class Unit6 : Unit2 {
						position[] = {-4,-4,0};
					};
					class Unit7 : Unit3 {
						position[] = {-6,-6,0};
					};
					class Unit8 : Unit4 {
						position[] = {-8,-8,0};
					};
				};
				class A3U_Invaders_Militia_Infantry_Team {
					name = $STR_A3U_Zeus_GroupType_Infantry_Team;
					faction = "A3U_Invaders";
					side = 0;
					class Unit0 {
						side = 0;
						vehicle = "A3U_Invaders_Militia_Rifleman";
						rank = "CORPORAL";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = "A3U_Invaders_Militia_Rifleman";
						rank = "PRIVATE";
						position[] = {2,-2,0};
					};
					class Unit2 : Unit1 {
						vehicle = "A3U_Invaders_Militia_MachineGunner";
						rank = "PRIVATE";
						position[] = {-2,-2,0};
					};
					class Unit3 : Unit1 {
						vehicle = "A3U_Invaders_Militia_Grenadier";
						rank = "PRIVATE";
						position[] = {0,-4,0};
					};
				};
				class A3U_Invaders_Militia_Infantry_MachineGun_Team {
					name = $STR_A3U_Zeus_GroupType_Infantry_MGTeam;
					faction = "A3U_Invaders";
					side = 0;
					class Unit0 {
						side = 0;
						vehicle = "A3U_Invaders_Militia_Rifleman";
						rank = "CORPORAL";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = "A3U_Invaders_Militia_MachineGunner";
						rank = "PRIVATE";
						position[] = {2,-2,0};
					};
					class Unit2 : Unit1 {
						vehicle = "A3U_Invaders_Militia_Rifleman";
						rank = "PRIVATE";
						position[] = {-2,-2,0};
					};
				};
				class A3U_Invaders_Militia_Infantry_AT_Team : A3U_Invaders_Militia_Infantry_MachineGun_Team {
					name = $STR_A3U_Zeus_GroupType_Infantry_ATTeam;
					class Unit0 : Unit0 {};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_Vehicle_StaticAT";
					};
					class Unit2 : Unit2 {};
				};
				class A3U_Invaders_Militia_Infantry_AA_Team : A3U_Invaders_Militia_Infantry_MachineGun_Team {
					name = $STR_A3U_Zeus_GroupType_Infantry_AATeam;
					class Unit0 : Unit0 {};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_Vehicle_StaticAA";
					};
					class Unit2 : Unit2 {};
				};
				class A3U_Invaders_Militia_Infantry_Sniper_Team {
					name = $STR_A3U_Zeus_GroupType_Infantry_SniperTeam;
					faction = "A3U_Invaders";
					side = 0;
					class Unit0 {
						side = 0;
						vehicle = "A3U_Invaders_Militia_Marksman";
						rank = "SERGEANT";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = "A3U_Invaders_Militia_Sniper";
						rank = "CORPORAL";
						position[] = {2,-2,0};
					};
				};
			};
			class Infantry_Military : Infantry_Militia {
				name = $STR_A3U_Zeus_GroupType_Infantry_Military;

				class A3U_Invaders_Military_Infantry_Squad : A3U_Invaders_Militia_Infantry_Squad {
					class Unit0 : Unit0 {
						vehicle = "A3U_Invaders_Military_SquadLeader";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_Military_Rifleman";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Invaders_Military_Rifleman";
					};
					class Unit3 : Unit3 {
						vehicle = "A3U_Invaders_Military_MachineGunner";
					};
					class Unit4 : Unit4 {
						vehicle = "A3U_Invaders_Military_Grenadier";
					};
					class Unit5 : Unit5 {
						vehicle = "A3U_Invaders_Military_Rifleman";
					};
					class Unit6 : Unit6 {
						vehicle = "A3U_Invaders_Military_Rifleman";
					};
					class Unit7 : Unit7 {
						vehicle = "A3U_Invaders_Military_MachineGunner";
					};
					class Unit8 : Unit8 {
						vehicle = "A3U_Invaders_Military_Grenadier";
					};
				};
				class A3U_Invaders_Military_Infantry_Team : A3U_Invaders_Militia_Infantry_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Invaders_Military_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_Military_Rifleman";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Invaders_Military_MachineGunner";
					};
					class Unit3 : Unit3 {
						vehicle = "A3U_Invaders_Military_Grenadier";
					};
				};
				class A3U_Invaders_Military_Infantry_MachineGun_Team : A3U_Invaders_Militia_Infantry_MachineGun_Team {
					name = $STR_A3U_Zeus_GroupType_Infantry_MGTeam;
					class Unit0 : Unit0 {
						vehicle = "A3U_Invaders_Military_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_Military_MachineGunner";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Invaders_Military_Rifleman";
					};
				};
				class A3U_Invaders_Military_Infantry_AT_Team : A3U_Invaders_Militia_Infantry_AT_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Invaders_Military_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_Vehicle_StaticAT";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Invaders_Military_Rifleman";
					};
				};
				class A3U_Invaders_Military_Infantry_AA_Team : A3U_Invaders_Militia_Infantry_AA_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Invaders_Military_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_Vehicle_StaticAA";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Invaders_Military_Rifleman";
					};
				};
				class A3U_Invaders_Military_Infantry_Sniper_Team : A3U_Invaders_Militia_Infantry_Sniper_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Invaders_Military_Marksman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_Military_Sniper";
					};
				};
			};
			class Infantry_Elite : Infantry_Militia {
				name = $STR_A3U_Zeus_GroupType_Infantry_Elite;

				class A3U_Invaders_Elite_Infantry_Squad : A3U_Invaders_Militia_Infantry_Squad {
					class Unit0 : Unit0 {
						vehicle = "A3U_Invaders_Elite_SquadLeader";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_Elite_Rifleman";
					};
					class Unit2 : Unit2 {};
					class Unit3 : Unit3 {
						vehicle = "A3U_Invaders_Elite_MachineGunner";
					};
					class Unit4 : Unit4 {
						vehicle = "A3U_Invaders_Elite_Grenadier";
					};
					class Unit5 : Unit5 {
						vehicle = "A3U_Invaders_Elite_Rifleman";
					};
					class Unit6 : Unit6 {
						vehicle = "A3U_Invaders_Elite_Rifleman";
					};
					class Unit7 : Unit7 {
						vehicle = "A3U_Invaders_Elite_MachineGunner";
					};
					class Unit8 : Unit8 {
						vehicle = "A3U_Invaders_Elite_Grenadier";
					};
				};
				class A3U_Invaders_Elite_Infantry_Team : A3U_Invaders_Militia_Infantry_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Invaders_Elite_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_Elite_Rifleman";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Invaders_Elite_MachineGunner";
					};
					class Unit3 : Unit3 {
						vehicle = "A3U_Invaders_Elite_Grenadier";
					};
				};
				class A3U_Invaders_Elite_Infantry_MachineGun_Team : A3U_Invaders_Militia_Infantry_MachineGun_Team {
					name = $STR_A3U_Zeus_GroupType_Infantry_MGTeam;
					class Unit0 : Unit0 {
						vehicle = "A3U_Invaders_Elite_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_Elite_MachineGunner";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Invaders_Elite_Rifleman";
					};
				};
				class A3U_Invaders_Elite_Infantry_AT_Team : A3U_Invaders_Militia_Infantry_AT_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Invaders_Elite_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_Vehicle_StaticAT";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Invaders_Elite_Rifleman";
					};
				};
				class A3U_Invaders_Elite_Infantry_AA_Team : A3U_Invaders_Militia_Infantry_AA_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Invaders_Elite_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_Vehicle_StaticAA";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Invaders_Elite_Rifleman";
					};
				};
				class A3U_Invaders_Elite_Infantry_Sniper_Team : A3U_Invaders_Militia_Infantry_Sniper_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Invaders_Elite_Marksman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_Elite_Sniper";
					};
				};
			};
			class Infantry_SpecialForces : Infantry_Militia {
				name = $STR_A3U_Zeus_GroupType_Infantry_SpecialForces;

				class A3U_Invaders_SpecialForces_Infantry_Squad : A3U_Invaders_Militia_Infantry_Squad {
					class Unit0 : Unit0 {
						vehicle = "A3U_Invaders_SpecialForces_SquadLeader";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_SpecialForces_Rifleman";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Invaders_SpecialForces_Rifleman";
					};
					class Unit3 : Unit3 {
						vehicle = "A3U_Invaders_SpecialForces_MachineGunner";
					};
					class Unit4 : Unit4 {
						vehicle = "A3U_Invaders_SpecialForces_Grenadier";
					};
					class Unit5 : Unit5 {
						vehicle = "A3U_Invaders_SpecialForces_Rifleman";
					};
					class Unit6 : Unit6 {
						vehicle = "A3U_Invaders_SpecialForces_Rifleman";
					};
					class Unit7 : Unit7 {
						vehicle = "A3U_Invaders_SpecialForces_MachineGunner";
					};
					class Unit8 : Unit8 {
						vehicle = "A3U_Invaders_SpecialForces_Grenadier";
					};
				};
				class A3U_Invaders_SpecialForces_Infantry_Team : A3U_Invaders_Militia_Infantry_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Invaders_SpecialForces_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_SpecialForces_Rifleman";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Invaders_SpecialForces_MachineGunner";
					};
					class Unit3 : Unit3 {
						vehicle = "A3U_Invaders_SpecialForces_Grenadier";
					};
				};
				class A3U_Invaders_SpecialForces_Infantry_MachineGun_Team : A3U_Invaders_Militia_Infantry_MachineGun_Team {
					name = $STR_A3U_Zeus_GroupType_Infantry_MGTeam;
					class Unit0 : Unit0 {
						vehicle = "A3U_Invaders_SpecialForces_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_SpecialForces_MachineGunner";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Invaders_SpecialForces_Rifleman";
					};
				};
				class A3U_Invaders_SpecialForces_Infantry_AT_Team : A3U_Invaders_Militia_Infantry_AT_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Invaders_SpecialForces_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_Vehicle_StaticAT";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Invaders_SpecialForces_Rifleman";
					};
				};
				class A3U_Invaders_SpecialForces_Infantry_AA_Team : A3U_Invaders_Militia_Infantry_AA_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Invaders_SpecialForces_Rifleman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_Vehicle_StaticAA";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Invaders_SpecialForces_Rifleman";
					};
				};
				class A3U_Invaders_SpecialForces_Infantry_Sniper_Team : A3U_Invaders_Militia_Infantry_Sniper_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Invaders_SpecialForces_Marksman";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_SpecialForces_Sniper";
					};
				};
			};
			class Infantry_Police : Infantry_Militia {
				name = $STR_A3U_Zeus_GroupType_Infantry_Police;

				class A3U_Invaders_Police_Infantry_Squad : A3U_Invaders_Militia_Infantry_Squad {
					class Unit0 : Unit0 {
						vehicle = "A3U_Invaders_Police_SquadLeader";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_Police_Standard";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Invaders_Police_Standard";
					};
					class Unit3 : Unit3 {
						vehicle = "A3U_Invaders_Police_Standard";
					};
					class Unit4 : Unit4 {
						vehicle = "A3U_Invaders_Police_Standard";
					};
					class Unit5 : Unit5 {
						vehicle = "A3U_Invaders_Police_Standard";
					};
					class Unit6 : Unit6 {
						vehicle = "A3U_Invaders_Police_Standard";
					};
					class Unit7 : Unit7 {
						vehicle = "A3U_Invaders_Police_Standard";
					};
					class Unit8 : Unit8 {
						vehicle = "A3U_Invaders_Police_Standard";
					};
				};
				class A3U_Invaders_Police_Infantry_Team : A3U_Invaders_Militia_Infantry_Team {
					class Unit0 : Unit0 {
						vehicle = "A3U_Invaders_Police_Standard";
					};
					class Unit1 : Unit1 {
						vehicle = "A3U_Invaders_Police_Standard";
					};
					class Unit2 : Unit2 {
						vehicle = "A3U_Invaders_Police_Standard";
					};
					class Unit3 : Unit3 {
						vehicle = "A3U_Invaders_Police_Standard";
					};
				};
				delete A3U_Invaders_Militia_Infantry_MachineGun_Team;
				delete A3U_Invaders_Militia_Infantry_AT_Team;
				delete A3U_Invaders_Militia_Infantry_AA_Team;
				delete A3U_Invaders_Militia_Infantry_Sniper_Team;
			};
		};
		/*
		// ! Placeholder
		class A3U_Rivals {
			name = $STR_A3U_Zeus_Faction_Rivals;
		};
		*/
	};
	/*
	// ! Placeholder
	class CIV {
		class A3U_Civilians {
			name = $STR_A3U_Zeus_Faction_Civilians;
		};
	};
	*/
};
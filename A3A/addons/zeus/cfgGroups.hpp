class CfgGroups {
	class INDEP {
		class GVAR(Rebels) {
			name = $STR_A3U_Zeus_Faction_Rebels;
			class Infantry {
				name = $STR_A3U_Zeus_GroupType_Infantry;
				
				class GVAR(Rebels_Infantry_Squad) {
					name = $STR_A3U_Zeus_GroupType_Infantry_Squad;
					faction = QGVAR(Rebels);
					side = 2;
					class Unit0 {
						side = 2;
						vehicle = QGVAR(Rebels_SquadLeader);
						rank = "SERGEANT";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = QGVAR(Rebels_Rifleman);
						rank = "CORPORAL";
						position[] = {2,-2,0};
					};
					class Unit2 : Unit1 {
						position[] = {4,-4,0};
					};
					class Unit3 : Unit0 {
						vehicle = QGVAR(Rebels_MachineGunner);
						rank = "PRIVATE";
						position[] = {6,-6,0};
					};
					class Unit4 : Unit0 {
						vehicle = QGVAR(Rebels_Grenadier);
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
				class GVAR(Rebels_Infantry_Team) {
					name = $STR_A3U_Zeus_GroupType_Infantry_Team;
					faction = QGVAR(Rebels);
					side = 2;
					class Unit0 {
						side = 2;
						vehicle = QGVAR(Rebels_Rifleman);
						rank = "CORPORAL";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = QGVAR(Rebels_Rifleman);
						rank = "PRIVATE";
						position[] = {2,-2,0};
					};
					class Unit2 : Unit1 {
						vehicle = QGVAR(Rebels_MachineGunner);
						rank = "PRIVATE";
						position[] = {-2,-2,0};
					};
					class Unit3 : Unit1 {
						vehicle = QGVAR(Rebels_Grenadier);
						rank = "PRIVATE";
						position[] = {0,-4,0};
					};
				};
				class GVAR(Rebels_Infantry_MachineGun_Team) {
					name = $STR_A3U_Zeus_GroupType_Infantry_MGTeam;
					faction = QGVAR(Rebels);
					side = 2;
					class Unit0 {
						side = 2;
						vehicle = QGVAR(Rebels_Rifleman);
						rank = "CORPORAL";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = QGVAR(Rebels_MachineGunner);
						rank = "PRIVATE";
						position[] = {2,-2,0};
					};
					class Unit2 : Unit1 {
						vehicle = QGVAR(Rebels_Rifleman);
						rank = "PRIVATE";
						position[] = {-2,-2,0};
					};
				};
				class GVAR(Rebels_Infantry_AT_Team) : GVAR(Rebels_Infantry_MachineGun_Team) {
					name = $STR_A3U_Zeus_GroupType_Infantry_ATTeam;
					class Unit0 : Unit0 {};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Rebels_AT);
					};
					class Unit2 : Unit2 {};
				};
				class GVAR(Rebels_Infantry_AA_Team) : GVAR(Rebels_Infantry_MachineGun_Team) {
					name = $STR_A3U_Zeus_GroupType_Infantry_AATeam;
					class Unit0 : Unit0 {};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Rebels_AA);
					};
					class Unit2 : Unit2 {};
				};
				class GVAR(Rebels_Infantry_Sniper_Team) {
					name = $STR_A3U_Zeus_GroupType_Infantry_SniperTeam;
					faction = QGVAR(Rebels);
					side = 2;
					class Unit0 {
						side = 2;
						vehicle = QGVAR(Rebels_Marksman);
						rank = "SERGEANT";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = QGVAR(Rebels_Sniper);
						rank = "CORPORAL";
						position[] = {2,-2,0};
					};
				};
			};
		};
	};
	class WEST {
		class GVAR(Occupants) {
			name = $STR_A3U_Zeus_Faction_Occupants;
			class Infantry_Militia {
				name = $STR_A3U_Zeus_GroupType_Infantry_Militia;
				
				class GVAR(Occupants_Militia_Infantry_Squad) {
					name = $STR_A3U_Zeus_GroupType_Infantry_Squad;
					faction = QGVAR(Occupants);
					side = 1;
					class Unit0 {
						side = 1;
						vehicle = QGVAR(Occupants_Militia_SquadLeader);
						rank = "SERGEANT";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = QGVAR(Occupants_Militia_Rifleman);
						rank = "CORPORAL";
						position[] = {2,-2,0};
					};
					class Unit2 : Unit1 {
						position[] = {4,-4,0};
					};
					class Unit3 : Unit0 {
						vehicle = QGVAR(Occupants_Militia_MachineGunner);
						rank = "PRIVATE";
						position[] = {6,-6,0};
					};
					class Unit4 : Unit0 {
						vehicle = QGVAR(Occupants_Militia_Grenadier);
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
				class GVAR(Occupants_Militia_Infantry_Team) {
					name = $STR_A3U_Zeus_GroupType_Infantry_Team;
					faction = QGVAR(Occupants);
					side = 1;
					class Unit0 {
						side = 1;
						vehicle = QGVAR(Occupants_Militia_Rifleman);
						rank = "CORPORAL";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = QGVAR(Occupants_Militia_Rifleman);
						rank = "PRIVATE";
						position[] = {2,-2,0};
					};
					class Unit2 : Unit1 {
						vehicle = QGVAR(Occupants_Militia_MachineGunner);
						rank = "PRIVATE";
						position[] = {-2,-2,0};
					};
					class Unit3 : Unit1 {
						vehicle = QGVAR(Occupants_Militia_Grenadier);
						rank = "PRIVATE";
						position[] = {0,-4,0};
					};
				};
				class GVAR(Occupants_Militia_Infantry_MachineGun_Team) {
					name = $STR_A3U_Zeus_GroupType_Infantry_MGTeam;
					faction = QGVAR(Occupants);
					side = 1;
					class Unit0 {
						side = 1;
						vehicle = QGVAR(Occupants_Militia_Rifleman);
						rank = "CORPORAL";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = QGVAR(Occupants_Militia_MachineGunner);
						rank = "PRIVATE";
						position[] = {2,-2,0};
					};
					class Unit2 : Unit1 {
						vehicle = QGVAR(Occupants_Militia_Rifleman);
						rank = "PRIVATE";
						position[] = {-2,-2,0};
					};
				};
				class GVAR(Occupants_Militia_Infantry_AT_Team) : GVAR(Occupants_Militia_Infantry_MachineGun_Team) {
					name = $STR_A3U_Zeus_GroupType_Infantry_ATTeam;
					class Unit0 : Unit0 {};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_Vehicle_StaticAT);
					};
					class Unit2 : Unit2 {};
				};
				class GVAR(Occupants_Militia_Infantry_AA_Team) : GVAR(Occupants_Militia_Infantry_MachineGun_Team) {
					name = $STR_A3U_Zeus_GroupType_Infantry_AATeam;
					class Unit0 : Unit0 {};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_Vehicle_StaticAA);
					};
					class Unit2 : Unit2 {};
				};
				class GVAR(Occupants_Militia_Infantry_Sniper_Team) {
					name = $STR_A3U_Zeus_GroupType_Infantry_SniperTeam;
					faction = QGVAR(Occupants);
					side = 1;
					class Unit0 {
						side = 1;
						vehicle = QGVAR(Occupants_Militia_Marksman);
						rank = "SERGEANT";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = QGVAR(Occupants_Militia_Sniper);
						rank = "CORPORAL";
						position[] = {2,-2,0};
					};
				};
			};
			class Infantry_Military : Infantry_Militia {
				name = $STR_A3U_Zeus_GroupType_Infantry_Military;

				class GVAR(Occupants_Military_Infantry_Squad) : GVAR(Occupants_Militia_Infantry_Squad) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Occupants_Military_SquadLeader);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_Military_Rifleman);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Occupants_Military_Rifleman);
					};
					class Unit3 : Unit3 {
						vehicle = QGVAR(Occupants_Military_MachineGunner);
					};
					class Unit4 : Unit4 {
						vehicle = QGVAR(Occupants_Military_Grenadier);
					};
					class Unit5 : Unit5 {
						vehicle = QGVAR(Occupants_Military_Rifleman);
					};
					class Unit6 : Unit6 {
						vehicle = QGVAR(Occupants_Military_Rifleman);
					};
					class Unit7 : Unit7 {
						vehicle = QGVAR(Occupants_Military_MachineGunner);
					};
					class Unit8 : Unit8 {
						vehicle = QGVAR(Occupants_Military_Grenadier);
					};
				};
				class GVAR(Occupants_Military_Infantry_Team) : GVAR(Occupants_Militia_Infantry_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Occupants_Military_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_Military_Rifleman);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Occupants_Military_MachineGunner);
					};
					class Unit3 : Unit3 {
						vehicle = QGVAR(Occupants_Military_Grenadier);
					};
				};
				class GVAR(Occupants_Military_Infantry_MachineGun_Team) : GVAR(Occupants_Militia_Infantry_MachineGun_Team) {
					name = $STR_A3U_Zeus_GroupType_Infantry_MGTeam;
					class Unit0 : Unit0 {
						vehicle = QGVAR(Occupants_Military_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_Military_MachineGunner);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Occupants_Military_Rifleman);
					};
				};
				class GVAR(Occupants_Military_Infantry_AT_Team) : GVAR(Occupants_Militia_Infantry_AT_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Occupants_Military_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_Vehicle_StaticAT);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Occupants_Military_Rifleman);
					};
				};
				class GVAR(Occupants_Military_Infantry_AA_Team) : GVAR(Occupants_Militia_Infantry_AA_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Occupants_Military_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_Vehicle_StaticAA);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Occupants_Military_Rifleman);
					};
				};
				class GVAR(Occupants_Military_Infantry_Sniper_Team) : GVAR(Occupants_Militia_Infantry_Sniper_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Occupants_Military_Marksman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_Military_Sniper);
					};
				};
			};
			class Infantry_Elite : Infantry_Militia {
				name = $STR_A3U_Zeus_GroupType_Infantry_Elite;

				class GVAR(Occupants_Elite_Infantry_Squad) : GVAR(Occupants_Militia_Infantry_Squad) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Occupants_Elite_SquadLeader);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_Elite_Rifleman);
					};
					class Unit2 : Unit2 {};
					class Unit3 : Unit3 {
						vehicle = QGVAR(Occupants_Elite_MachineGunner);
					};
					class Unit4 : Unit4 {
						vehicle = QGVAR(Occupants_Elite_Grenadier);
					};
					class Unit5 : Unit5 {
						vehicle = QGVAR(Occupants_Elite_Rifleman);
					};
					class Unit6 : Unit6 {
						vehicle = QGVAR(Occupants_Elite_Rifleman);
					};
					class Unit7 : Unit7 {
						vehicle = QGVAR(Occupants_Elite_MachineGunner);
					};
					class Unit8 : Unit8 {
						vehicle = QGVAR(Occupants_Elite_Grenadier);
					};
				};
				class GVAR(Occupants_Elite_Infantry_Team) : GVAR(Occupants_Militia_Infantry_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Occupants_Elite_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_Elite_Rifleman);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Occupants_Elite_MachineGunner);
					};
					class Unit3 : Unit3 {
						vehicle = QGVAR(Occupants_Elite_Grenadier);
					};
				};
				class GVAR(Occupants_Elite_Infantry_MachineGun_Team) : GVAR(Occupants_Militia_Infantry_MachineGun_Team) {
					name = $STR_A3U_Zeus_GroupType_Infantry_MGTeam;
					class Unit0 : Unit0 {
						vehicle = QGVAR(Occupants_Elite_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_Elite_MachineGunner);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Occupants_Elite_Rifleman);
					};
				};
				class GVAR(Occupants_Elite_Infantry_AT_Team) : GVAR(Occupants_Militia_Infantry_AT_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Occupants_Elite_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_Vehicle_StaticAT);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Occupants_Elite_Rifleman);
					};
				};
				class GVAR(Occupants_Elite_Infantry_AA_Team) : GVAR(Occupants_Militia_Infantry_AA_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Occupants_Elite_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_Vehicle_StaticAA);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Occupants_Elite_Rifleman);
					};
				};
				class GVAR(Occupants_Elite_Infantry_Sniper_Team) : GVAR(Occupants_Militia_Infantry_Sniper_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Occupants_Elite_Marksman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_Elite_Sniper);
					};
				};
			};
			class Infantry_SpecialForces : Infantry_Militia {
				name = $STR_A3U_Zeus_GroupType_Infantry_SpecialForces;

				class GVAR(Occupants_SpecialForces_Infantry_Squad) : GVAR(Occupants_Militia_Infantry_Squad) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Occupants_SpecialForces_SquadLeader);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_SpecialForces_Rifleman);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Occupants_SpecialForces_Rifleman);
					};
					class Unit3 : Unit3 {
						vehicle = QGVAR(Occupants_SpecialForces_MachineGunner);
					};
					class Unit4 : Unit4 {
						vehicle = QGVAR(Occupants_SpecialForces_Grenadier);
					};
					class Unit5 : Unit5 {
						vehicle = QGVAR(Occupants_SpecialForces_Rifleman);
					};
					class Unit6 : Unit6 {
						vehicle = QGVAR(Occupants_SpecialForces_Rifleman);
					};
					class Unit7 : Unit7 {
						vehicle = QGVAR(Occupants_SpecialForces_MachineGunner);
					};
					class Unit8 : Unit8 {
						vehicle = QGVAR(Occupants_SpecialForces_Grenadier);
					};
				};
				class GVAR(Occupants_SpecialForces_Infantry_Team) : GVAR(Occupants_Militia_Infantry_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Occupants_SpecialForces_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_SpecialForces_Rifleman);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Occupants_SpecialForces_MachineGunner);
					};
					class Unit3 : Unit3 {
						vehicle = QGVAR(Occupants_SpecialForces_Grenadier);
					};
				};
				class GVAR(Occupants_SpecialForces_Infantry_MachineGun_Team) : GVAR(Occupants_Militia_Infantry_MachineGun_Team) {
					name = $STR_A3U_Zeus_GroupType_Infantry_MGTeam;
					class Unit0 : Unit0 {
						vehicle = QGVAR(Occupants_SpecialForces_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_SpecialForces_MachineGunner);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Occupants_SpecialForces_Rifleman);
					};
				};
				class GVAR(Occupants_SpecialForces_Infantry_AT_Team) : GVAR(Occupants_Militia_Infantry_AT_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Occupants_SpecialForces_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_Vehicle_StaticAT);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Occupants_SpecialForces_Rifleman);
					};
				};
				class GVAR(Occupants_SpecialForces_Infantry_AA_Team) : GVAR(Occupants_Militia_Infantry_AA_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Occupants_SpecialForces_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_Vehicle_StaticAA);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Occupants_SpecialForces_Rifleman);
					};
				};
				class GVAR(Occupants_SpecialForces_Infantry_Sniper_Team) : GVAR(Occupants_Militia_Infantry_Sniper_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Occupants_SpecialForces_Marksman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_SpecialForces_Sniper);
					};
				};
			};
			class Infantry_Police : Infantry_Militia {
				name = $STR_A3U_Zeus_GroupType_Infantry_Police;

				class GVAR(Occupants_Police_Infantry_Squad) : GVAR(Occupants_Militia_Infantry_Squad) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Occupants_Police_SquadLeader);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_Police_Standard);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Occupants_Police_Standard);
					};
					class Unit3 : Unit3 {
						vehicle = QGVAR(Occupants_Police_Standard);
					};
					class Unit4 : Unit4 {
						vehicle = QGVAR(Occupants_Police_Standard);
					};
					class Unit5 : Unit5 {
						vehicle = QGVAR(Occupants_Police_Standard);
					};
					class Unit6 : Unit6 {
						vehicle = QGVAR(Occupants_Police_Standard);
					};
					class Unit7 : Unit7 {
						vehicle = QGVAR(Occupants_Police_Standard);
					};
					class Unit8 : Unit8 {
						vehicle = QGVAR(Occupants_Police_Standard);
					};
				};
				class GVAR(Occupants_Police_Infantry_Team) : GVAR(Occupants_Militia_Infantry_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Occupants_Police_Standard);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Occupants_Police_Standard);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Occupants_Police_Standard);
					};
					class Unit3 : Unit3 {
						vehicle = QGVAR(Occupants_Police_Standard);
					};
				};
				delete GVAR(Occupants_Militia_Infantry_MachineGun_Team);
				delete GVAR(Occupants_Militia_Infantry_AT_Team);
				delete GVAR(Occupants_Militia_Infantry_AA_Team);
				delete GVAR(Occupants_Militia_Infantry_Sniper_Team);
			};
		};
	};
	class EAST {
		class GVAR(Invaders) {
			name = $STR_A3U_Zeus_Faction_Invaders;
			class Infantry_Militia {
				name = $STR_A3U_Zeus_GroupType_Infantry_Militia;
				
				class GVAR(Invaders_Militia_Infantry_Squad) {
					name = $STR_A3U_Zeus_GroupType_Infantry_Squad;
					faction = QGVAR(Invaders);
					side = 0;
					class Unit0 {
						side = 0;
						vehicle = QGVAR(Invaders_Militia_SquadLeader);
						rank = "SERGEANT";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = QGVAR(Invaders_Militia_Rifleman);
						rank = "CORPORAL";
						position[] = {2,-2,0};
					};
					class Unit2 : Unit1 {
						position[] = {4,-4,0};
					};
					class Unit3 : Unit0 {
						vehicle = QGVAR(Invaders_Militia_MachineGunner);
						rank = "PRIVATE";
						position[] = {6,-6,0};
					};
					class Unit4 : Unit0 {
						vehicle = QGVAR(Invaders_Militia_Grenadier);
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
				class GVAR(Invaders_Militia_Infantry_Team) {
					name = $STR_A3U_Zeus_GroupType_Infantry_Team;
					faction = QGVAR(Invaders);
					side = 0;
					class Unit0 {
						side = 0;
						vehicle = QGVAR(Invaders_Militia_Rifleman);
						rank = "CORPORAL";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = QGVAR(Invaders_Militia_Rifleman);
						rank = "PRIVATE";
						position[] = {2,-2,0};
					};
					class Unit2 : Unit1 {
						vehicle = QGVAR(Invaders_Militia_MachineGunner);
						rank = "PRIVATE";
						position[] = {-2,-2,0};
					};
					class Unit3 : Unit1 {
						vehicle = QGVAR(Invaders_Militia_Grenadier);
						rank = "PRIVATE";
						position[] = {0,-4,0};
					};
				};
				class GVAR(Invaders_Militia_Infantry_MachineGun_Team) {
					name = $STR_A3U_Zeus_GroupType_Infantry_MGTeam;
					faction = QGVAR(Invaders);
					side = 0;
					class Unit0 {
						side = 0;
						vehicle = QGVAR(Invaders_Militia_Rifleman);
						rank = "CORPORAL";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = QGVAR(Invaders_Militia_MachineGunner);
						rank = "PRIVATE";
						position[] = {2,-2,0};
					};
					class Unit2 : Unit1 {
						vehicle = QGVAR(Invaders_Militia_Rifleman);
						rank = "PRIVATE";
						position[] = {-2,-2,0};
					};
				};
				class GVAR(Invaders_Militia_Infantry_AT_Team) : GVAR(Invaders_Militia_Infantry_MachineGun_Team) {
					name = $STR_A3U_Zeus_GroupType_Infantry_ATTeam;
					class Unit0 : Unit0 {};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_Vehicle_StaticAT);
					};
					class Unit2 : Unit2 {};
				};
				class GVAR(Invaders_Militia_Infantry_AA_Team) : GVAR(Invaders_Militia_Infantry_MachineGun_Team) {
					name = $STR_A3U_Zeus_GroupType_Infantry_AATeam;
					class Unit0 : Unit0 {};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_Vehicle_StaticAA);
					};
					class Unit2 : Unit2 {};
				};
				class GVAR(Invaders_Militia_Infantry_Sniper_Team) {
					name = $STR_A3U_Zeus_GroupType_Infantry_SniperTeam;
					faction = QGVAR(Invaders);
					side = 0;
					class Unit0 {
						side = 0;
						vehicle = QGVAR(Invaders_Militia_Marksman);
						rank = "SERGEANT";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						vehicle = QGVAR(Invaders_Militia_Sniper);
						rank = "CORPORAL";
						position[] = {2,-2,0};
					};
				};
			};
			class Infantry_Military : Infantry_Militia {
				name = $STR_A3U_Zeus_GroupType_Infantry_Military;

				class GVAR(Invaders_Military_Infantry_Squad) : GVAR(Invaders_Militia_Infantry_Squad) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Invaders_Military_SquadLeader);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_Military_Rifleman);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Invaders_Military_Rifleman);
					};
					class Unit3 : Unit3 {
						vehicle = QGVAR(Invaders_Military_MachineGunner);
					};
					class Unit4 : Unit4 {
						vehicle = QGVAR(Invaders_Military_Grenadier);
					};
					class Unit5 : Unit5 {
						vehicle = QGVAR(Invaders_Military_Rifleman);
					};
					class Unit6 : Unit6 {
						vehicle = QGVAR(Invaders_Military_Rifleman);
					};
					class Unit7 : Unit7 {
						vehicle = QGVAR(Invaders_Military_MachineGunner);
					};
					class Unit8 : Unit8 {
						vehicle = QGVAR(Invaders_Military_Grenadier);
					};
				};
				class GVAR(Invaders_Military_Infantry_Team) : GVAR(Invaders_Militia_Infantry_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Invaders_Military_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_Military_Rifleman);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Invaders_Military_MachineGunner);
					};
					class Unit3 : Unit3 {
						vehicle = QGVAR(Invaders_Military_Grenadier);
					};
				};
				class GVAR(Invaders_Military_Infantry_MachineGun_Team) : GVAR(Invaders_Militia_Infantry_MachineGun_Team) {
					name = $STR_A3U_Zeus_GroupType_Infantry_MGTeam;
					class Unit0 : Unit0 {
						vehicle = QGVAR(Invaders_Military_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_Military_MachineGunner);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Invaders_Military_Rifleman);
					};
				};
				class GVAR(Invaders_Military_Infantry_AT_Team) : GVAR(Invaders_Militia_Infantry_AT_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Invaders_Military_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_Vehicle_StaticAT);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Invaders_Military_Rifleman);
					};
				};
				class GVAR(Invaders_Military_Infantry_AA_Team) : GVAR(Invaders_Militia_Infantry_AA_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Invaders_Military_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_Vehicle_StaticAA);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Invaders_Military_Rifleman);
					};
				};
				class GVAR(Invaders_Military_Infantry_Sniper_Team) : GVAR(Invaders_Militia_Infantry_Sniper_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Invaders_Military_Marksman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_Military_Sniper);
					};
				};
			};
			class Infantry_Elite : Infantry_Militia {
				name = $STR_A3U_Zeus_GroupType_Infantry_Elite;

				class GVAR(Invaders_Elite_Infantry_Squad) : GVAR(Invaders_Militia_Infantry_Squad) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Invaders_Elite_SquadLeader);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_Elite_Rifleman);
					};
					class Unit2 : Unit2 {};
					class Unit3 : Unit3 {
						vehicle = QGVAR(Invaders_Elite_MachineGunner);
					};
					class Unit4 : Unit4 {
						vehicle = QGVAR(Invaders_Elite_Grenadier);
					};
					class Unit5 : Unit5 {
						vehicle = QGVAR(Invaders_Elite_Rifleman);
					};
					class Unit6 : Unit6 {
						vehicle = QGVAR(Invaders_Elite_Rifleman);
					};
					class Unit7 : Unit7 {
						vehicle = QGVAR(Invaders_Elite_MachineGunner);
					};
					class Unit8 : Unit8 {
						vehicle = QGVAR(Invaders_Elite_Grenadier);
					};
				};
				class GVAR(Invaders_Elite_Infantry_Team) : GVAR(Invaders_Militia_Infantry_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Invaders_Elite_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_Elite_Rifleman);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Invaders_Elite_MachineGunner);
					};
					class Unit3 : Unit3 {
						vehicle = QGVAR(Invaders_Elite_Grenadier);
					};
				};
				class GVAR(Invaders_Elite_Infantry_MachineGun_Team) : GVAR(Invaders_Militia_Infantry_MachineGun_Team) {
					name = $STR_A3U_Zeus_GroupType_Infantry_MGTeam;
					class Unit0 : Unit0 {
						vehicle = QGVAR(Invaders_Elite_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_Elite_MachineGunner);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Invaders_Elite_Rifleman);
					};
				};
				class GVAR(Invaders_Elite_Infantry_AT_Team) : GVAR(Invaders_Militia_Infantry_AT_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Invaders_Elite_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_Vehicle_StaticAT);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Invaders_Elite_Rifleman);
					};
				};
				class GVAR(Invaders_Elite_Infantry_AA_Team) : GVAR(Invaders_Militia_Infantry_AA_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Invaders_Elite_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_Vehicle_StaticAA);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Invaders_Elite_Rifleman);
					};
				};
				class GVAR(Invaders_Elite_Infantry_Sniper_Team) : GVAR(Invaders_Militia_Infantry_Sniper_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Invaders_Elite_Marksman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_Elite_Sniper);
					};
				};
			};
			class Infantry_SpecialForces : Infantry_Militia {
				name = $STR_A3U_Zeus_GroupType_Infantry_SpecialForces;

				class GVAR(Invaders_SpecialForces_Infantry_Squad) : GVAR(Invaders_Militia_Infantry_Squad) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Invaders_SpecialForces_SquadLeader);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_SpecialForces_Rifleman);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Invaders_SpecialForces_Rifleman);
					};
					class Unit3 : Unit3 {
						vehicle = QGVAR(Invaders_SpecialForces_MachineGunner);
					};
					class Unit4 : Unit4 {
						vehicle = QGVAR(Invaders_SpecialForces_Grenadier);
					};
					class Unit5 : Unit5 {
						vehicle = QGVAR(Invaders_SpecialForces_Rifleman);
					};
					class Unit6 : Unit6 {
						vehicle = QGVAR(Invaders_SpecialForces_Rifleman);
					};
					class Unit7 : Unit7 {
						vehicle = QGVAR(Invaders_SpecialForces_MachineGunner);
					};
					class Unit8 : Unit8 {
						vehicle = QGVAR(Invaders_SpecialForces_Grenadier);
					};
				};
				class GVAR(Invaders_SpecialForces_Infantry_Team) : GVAR(Invaders_Militia_Infantry_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Invaders_SpecialForces_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_SpecialForces_Rifleman);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Invaders_SpecialForces_MachineGunner);
					};
					class Unit3 : Unit3 {
						vehicle = QGVAR(Invaders_SpecialForces_Grenadier);
					};
				};
				class GVAR(Invaders_SpecialForces_Infantry_MachineGun_Team) : GVAR(Invaders_Militia_Infantry_MachineGun_Team) {
					name = $STR_A3U_Zeus_GroupType_Infantry_MGTeam;
					class Unit0 : Unit0 {
						vehicle = QGVAR(Invaders_SpecialForces_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_SpecialForces_MachineGunner);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Invaders_SpecialForces_Rifleman);
					};
				};
				class GVAR(Invaders_SpecialForces_Infantry_AT_Team) : GVAR(Invaders_Militia_Infantry_AT_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Invaders_SpecialForces_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_Vehicle_StaticAT);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Invaders_SpecialForces_Rifleman);
					};
				};
				class GVAR(Invaders_SpecialForces_Infantry_AA_Team) : GVAR(Invaders_Militia_Infantry_AA_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Invaders_SpecialForces_Rifleman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_Vehicle_StaticAA);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Invaders_SpecialForces_Rifleman);
					};
				};
				class GVAR(Invaders_SpecialForces_Infantry_Sniper_Team) : GVAR(Invaders_Militia_Infantry_Sniper_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Invaders_SpecialForces_Marksman);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_SpecialForces_Sniper);
					};
				};
			};
			class Infantry_Police : Infantry_Militia {
				name = $STR_A3U_Zeus_GroupType_Infantry_Police;

				class GVAR(Invaders_Police_Infantry_Squad) : GVAR(Invaders_Militia_Infantry_Squad) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Invaders_Police_SquadLeader);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_Police_Standard);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Invaders_Police_Standard);
					};
					class Unit3 : Unit3 {
						vehicle = QGVAR(Invaders_Police_Standard);
					};
					class Unit4 : Unit4 {
						vehicle = QGVAR(Invaders_Police_Standard);
					};
					class Unit5 : Unit5 {
						vehicle = QGVAR(Invaders_Police_Standard);
					};
					class Unit6 : Unit6 {
						vehicle = QGVAR(Invaders_Police_Standard);
					};
					class Unit7 : Unit7 {
						vehicle = QGVAR(Invaders_Police_Standard);
					};
					class Unit8 : Unit8 {
						vehicle = QGVAR(Invaders_Police_Standard);
					};
				};
				class GVAR(Invaders_Police_Infantry_Team) : GVAR(Invaders_Militia_Infantry_Team) {
					class Unit0 : Unit0 {
						vehicle = QGVAR(Invaders_Police_Standard);
					};
					class Unit1 : Unit1 {
						vehicle = QGVAR(Invaders_Police_Standard);
					};
					class Unit2 : Unit2 {
						vehicle = QGVAR(Invaders_Police_Standard);
					};
					class Unit3 : Unit3 {
						vehicle = QGVAR(Invaders_Police_Standard);
					};
				};
				delete GVAR(Invaders_Militia_Infantry_MachineGun_Team);
				delete GVAR(Invaders_Militia_Infantry_AT_Team);
				delete GVAR(Invaders_Militia_Infantry_AA_Team);
				delete GVAR(Invaders_Militia_Infantry_Sniper_Team);
			};
		};
		/*
		// ! Placeholder
		class GVAR(Rivals) {
			name = $STR_A3U_Zeus_Faction_Rivals;
		};
		*/
	};
	/*
	// ! Placeholder
	class CIV {
		class GVAR(Civilians) {
			name = $STR_A3U_Zeus_Faction_Civilians;
		};
	};
	*/
};
class CfgGroups {
	class INDEP {
		class A3U_Rebels {
			name = "[A3U] Rebels";
			class Infantry {
				name = "Infantry";
				class A3U_Rebels_Infantry_Team {
					name = "Infantry Team";
					faction = "A3U_Rebels";
					side = 2;
					//icon = "\A3A\addons\ultimate\data\rebellion_icon.paa";
					class Unit0 {
						side = 2;
						vehicle = "A3U_Rebels_Rifleman";
						rank = "SERGEANT";
						position[] = {0,0,0};
					};
					class Unit1 : Unit0 {
						rank = "PRIVATE";
						position[] = {2,-2,0};
					};
					class Unit2 : Unit1 {
						rank = "PRIVATE";
						position[] = {-2,-2,0};
					};
					class Unit3 : Unit1 {
						rank = "PRIVATE";
						position[] = {0,-4,0};
					};
				};
			};
		};
	};
};
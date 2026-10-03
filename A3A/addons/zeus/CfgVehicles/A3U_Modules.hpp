	// Supports
	class GVAR(Module_Support_Base) : GVAR(Module_Base) {
		curatorCanAttach = 1;
		category = "";
		class arguments {
			type = "";
			side = "";
			caller = QUOTE(attack);
			maxSpend = 500;
			target = QUOTE(false);
			position = QUOTE(getPosATL _module);
			reveal = 1;
			delay = 0;
		};
		function = QUOTE(A3A_fnc_createSupport);
	};
	class GVAR(Module_Support_Occupants_Airstrike) : GVAR(Module_Support_Base) {
		scopeCurator = 2;
		category = QGVAR(Supports_Occupants);
		displayName = "$STR_A3U_Zeus_ModuleType_Support_Airstrike";
		icon = "\a3\Modules_F_Curator\Data\iconCAS_ca.paa";
        portrait = "\a3\Modules_F_Curator\Data\portraitCASBomb_ca.paa";
		class arguments : arguments {
			side = QUOTE(Occupants);
			type = QUOTE(AIRSTRIKE);
		};
	};
	class GVAR(Module_Support_Invaders_Airstrike) : GVAR(Module_Support_Occupants_Airstrike) {
		category = QGVAR(Supports_Invaders);
		class arguments : arguments {
			side = QUOTE(Invaders);
		};
	};
	class GVAR(Module_Support_Occupants_Gunship) : GVAR(Module_Support_Occupants_Airstrike) {
		portrait = "\a3\Modules_F_Curator\Data\portraitCAS_ca.paa";
		displayName = "$STR_A3U_Zeus_ModuleType_Support_Gunship";
		class arguments : arguments {
			type = QUOTE(GUNSHIP);
		};
	};
	class GVAR(Module_Support_Invaders_Gunship) : GVAR(Module_Support_Occupants_Gunship) {
		category = QGVAR(Supports_Invaders);
		class arguments : arguments {
			side = QUOTE(Invaders);
		};
	};
	class GVAR(Module_Support_Occupants_ASF) : GVAR(Module_Support_Occupants_Airstrike) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_ASF";
		portrait = "\a3\Modules_F_Curator\Data\portraitCASMissile_ca.paa";
		class arguments : arguments {
			type = QUOTE(ASF);
		};
	};
	class GVAR(Module_Support_Invaders_ASF) : GVAR(Module_Support_Occupants_ASF) {
		category = QGVAR(Supports_Invaders);
		class arguments : arguments {
			side = QUOTE(Invaders);
		};
	};
	class GVAR(Module_Support_Occupants_CAS) : GVAR(Module_Support_Occupants_Airstrike) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_CAS";
		portrait = "\a3\Modules_F_Curator\Data\portraitCAS_ca.paa";
		class arguments : arguments {
			type = QUOTE(CAS);
		};
	};
	class GVAR(Module_Support_Invaders_CAS) : GVAR(Module_Support_Occupants_CAS) {
		category = QGVAR(Supports_Invaders);
		class arguments : arguments {
			side = QUOTE(Invaders);
		};
	};
	class GVAR(Module_Support_Occupants_CASDive) : GVAR(Module_Support_Occupants_Airstrike) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_CASDive";
		portrait = "\a3\Modules_F_Curator\Data\portraitCASGunMissile_ca.paa";
		class arguments : arguments {
			type = QUOTE(CASDIVE);
		};
	};
	class GVAR(Module_Support_Invaders_CASDive) : GVAR(Module_Support_Occupants_CASDive) {
		category = QGVAR(Supports_Invaders);
		class arguments : arguments {
			side = QUOTE(Invaders);
		};
	};
	class GVAR(Module_Support_Occupants_CarpetBomb) : GVAR(Module_Support_Occupants_Airstrike) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_CarpetBomb";
		portrait = "\a3\Modules_F_Curator\Data\portraitCASBomb_ca.paa";
		class arguments : arguments {
			type = QUOTE(CARPETBOMBS);
		};
	};
	class GVAR(Module_Support_Invaders_CarpetBomb) : GVAR(Module_Support_Occupants_CarpetBomb) {
		category = QGVAR(Supports_Invaders);
		class arguments : arguments {
			side = QUOTE(Invaders);
		};
	};
	class GVAR(Module_Support_Occupants_Artillery) : GVAR(Module_Support_Base) {
		scopeCurator = 2;
		category = QGVAR(Supports_Occupants);
		displayName = "$STR_A3U_Zeus_ModuleType_Support_Artillery";
		icon = "\a3\Modules_F_Curator\Data\iconOrdnance_ca.paa";
        portrait = "\a3\Modules_F_Curator\Data\portraitOrdnance_ca.paa";
		class arguments : arguments {
			side = QUOTE(Occupants);
			type = QUOTE(ARTILLERY);
			caller = QUOTE(defence);
		};
	};
	class GVAR(Module_Support_Invaders_Artillery) : GVAR(Module_Support_Occupants_Artillery) {
		category = QGVAR(Supports_Invaders);
		class arguments : arguments {
			side = QUOTE(Invaders);
		};
	};
	class GVAR(Module_Support_Occupants_Mortar) : GVAR(Module_Support_Occupants_Artillery) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_Mortar";
		portrait = "\a3\Modules_F_Curator\Data\portraitOrdnanceMortar_ca.paa";
		class arguments : arguments {
			type = QUOTE(MORTAR);
		};
	};
	class GVAR(Module_Support_Invaders_Mortar) : GVAR(Module_Support_Occupants_Mortar) {
		category = QGVAR(Supports_Invaders);
		class arguments : arguments {
			side = QUOTE(Invaders);
		};
	};
	class GVAR(Module_Support_Occupants_Howitzer) : GVAR(Module_Support_Occupants_Artillery) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_Howitzer";
		portrait = "\a3\Modules_F_Curator\Data\portraitOrdnanceHowitzer_ca.paa";
		class arguments : arguments {
			type = QUOTE(HOWITZER);
		};
	};
	class GVAR(Module_Support_Invaders_Howitzer) : GVAR(Module_Support_Occupants_Howitzer) {
		category = QGVAR(Supports_Invaders);
		class arguments : arguments {
			side = QUOTE(Invaders);
		};
	};
	class GVAR(Module_Support_Occupants_SAM) : GVAR(Module_Support_Occupants_Artillery) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_SAM";
		portrait = "\a3\Modules_F_Curator\Data\portraitOrdnanceRocket_ca.paa";
		class arguments : arguments {
			type = QUOTE(SAM);
		};
	};
	class GVAR(Module_Support_Invaders_SAM) : GVAR(Module_Support_Occupants_SAM) {
		category = QGVAR(Supports_Invaders);
		class arguments : arguments {
			side = QUOTE(Invaders);
		};
	};
	class GVAR(Module_Support_Occupants_CruiseMissile) : GVAR(Module_Support_Occupants_SAM) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_CruiseMissile";
		class arguments : arguments {
			type = QUOTE(CRUISEMISSILE);
		};
	};
	class GVAR(Module_Support_Invaders_CruiseMissile) : GVAR(Module_Support_Occupants_CruiseMissile) {
		category = QGVAR(Supports_Invaders);
		class arguments : arguments {
			side = QUOTE(Invaders);
		};
	};
	class GVAR(Module_Support_Occupants_QRFLand) : GVAR(Module_Support_Base) {
		scopeCurator = 2;
		category = QGVAR(Supports_Occupants);
		displayName = "$STR_A3U_Zeus_ModuleType_Support_QRFLand";
		class arguments : arguments {
			side = QUOTE(Occupants);
			type = QUOTE(QRFLAND);
		};
	};
	class GVAR(Module_Support_Invaders_QRFLand) : GVAR(Module_Support_Occupants_QRFLand) {
		category = QGVAR(Supports_Invaders);
		class arguments : arguments {
			side = QUOTE(Invaders);
		};
	};
	class GVAR(Module_Support_Occupants_QRFAir) : GVAR(Module_Support_Occupants_QRFLand) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_QRFAir";
		class arguments : arguments {
			type = QUOTE(QRFAIR);
		};
	};
	class GVAR(Module_Support_Invaders_QRFAir) : GVAR(Module_Support_Occupants_QRFAir) {
		category = QGVAR(Supports_Invaders);
		class arguments : arguments {
			side = QUOTE(Invaders);
		};
	};
	class GVAR(Module_Support_Occupants_QRFVehAirdrop) : GVAR(Module_Support_Occupants_QRFLand) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_QRFVehAirdrop";
		class arguments : arguments {
			type = QUOTE(QRFVEHAIRDROP);
		};
	};
	class GVAR(Module_Support_Invaders_QRFVehAirdrop) : GVAR(Module_Support_Occupants_QRFVehAirdrop) {
		category = QGVAR(Supports_Invaders);
		class arguments : arguments {
			side = QUOTE(Invaders);
		};
	};
	class GVAR(Module_Support_Occupants_QRFOrbital) : GVAR(Module_Support_Occupants_QRFLand) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_QRFOrbital";
		class arguments : arguments {
			type = QUOTE(QRFORBITAL);
		};
	};
	class GVAR(Module_Support_Invaders_QRFOrbital) : GVAR(Module_Support_Occupants_QRFOrbital) {
		category = QGVAR(Supports_Invaders);
		class arguments : arguments {
			side = QUOTE(Invaders);
		};
	};
	class GVAR(Module_Support_Occupants_OrbitalStrike) : GVAR(Module_Support_Occupants_QRFLand) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_OrbitalStrike";
		class arguments : arguments {
			type = QUOTE(ORBITALSTRIKE);
		};
	};
	class GVAR(Module_Support_Invaders_OrbitalStrike) : GVAR(Module_Support_Occupants_OrbitalStrike) {
		category = QGVAR(Supports_Invaders);
		class arguments : arguments {
			side = QUOTE(Invaders);
		};
	};
	class GVAR(Module_Support_Occupants_UAV) : GVAR(Module_Support_Occupants_QRFLand) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_UAV";
		class arguments : arguments {
			type = QUOTE(UAV);
		};
	};
	class GVAR(Module_Support_Invaders_UAV) : GVAR(Module_Support_Occupants_UAV) {
		category = QGVAR(Supports_Invaders);
		class arguments : arguments {
			side = QUOTE(Invaders);
		};
	};
	class GVAR(Module_Support_Occupants_UAVAttack) : GVAR(Module_Support_Occupants_QRFLand) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_UAVAttack";
		class arguments : arguments {
			type = QUOTE(UAVAttack);
		};
	};
	class GVAR(Module_Support_Invaders_UAVAttack) : GVAR(Module_Support_Occupants_UAVAttack) {
		category = QGVAR(Supports_Invaders);
		class arguments : arguments {
			side = QUOTE(Invaders);
		};
	};
	class GVAR(Module_Support_Occupants_Tank) : GVAR(Module_Support_Occupants_QRFLand) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_Tank";
		class arguments : arguments {
			type = QUOTE(TANK);
		};
	};
	class GVAR(Module_Support_Invaders_Tank) : GVAR(Module_Support_Occupants_Tank) {
		category = QGVAR(Supports_Invaders);
		class arguments : arguments {
			side = QUOTE(Invaders);
		};
	};

	// Misc
	class GVAR(Module_Misc_Base) : GVAR(Module_Base) {
		curatorCanAttach = 1;
		category = "";
		class arguments {};
	};
	class GVAR(Module_Misc_addToHC) : GVAR(Module_Misc_Base) {
		scopeCurator = 2;
		category = QGVAR(Misc);
		displayName = "$STR_A3U_Zeus_ModuleType_Misc_AddToHC";
		function = QUOTE(FUNC(addToHC));
	};
		

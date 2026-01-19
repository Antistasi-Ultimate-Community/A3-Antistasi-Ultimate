	// Supports
	class GVAR(Module_Support_Base) : GVAR(Module_Base) {
		category = QGVAR(Supports);
		class arguments {
			type = "";
			side = Occupants;
			caller = QUOTE(attack);
			maxSpend = 500;
			target = false;
			position = getPosATL _module;
			reveal = 1;
			delay = 0;
		};
		function = QUOTE(A3A_fnc_createSupport);
	}
	class GVAR(Module_Support_Airstrike) : GVAR(Module_Support_Base) {
		scopeCurator = 2;
		displayName = "$STR_A3U_Zeus_ModuleType_Support_Airstrike";
		icon = "\a3\Modules_F_Curator\Data\iconCAS_ca.paa";
        portrait = "\a3\Modules_F_Curator\Data\portraitCASBomb_ca.paa";
		class arguments : arguments {
			type = QUOTE(AIRSTRIKE);
		};
	};
	class GVAR(Module_Support_Gunship) : GVAR(Module_Support_Airstrike) {
		portrait = "\a3\Modules_F_Curator\Data\portraitCAS_ca.paa";
		displayName = "$STR_A3U_Zeus_ModuleType_Support_Gunship";
		class arguments : arguments {
			type = QUOTE(GUNSHIP);
		};
	};
	class GVAR(Module_Support_ASF) : GVAR(Module_Support_Airstrike) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_ASF";
		portrait = "\a3\Modules_F_Curator\Data\portraitCASMissile_ca.paa";
		class arguments : arguments {
			type = QUOTE(ASF);
		};
	};
	class GVAR(Module_Support_CAS) : GVAR(Module_Support_Airstrike) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_CAS";
		portrait = "\a3\Modules_F_Curator\Data\portraitCAS_ca.paa";
		class arguments : arguments {
			type = QUOTE(CAS);
		};
	};
	class GVAR(Module_Support_CASDive) : GVAR(Module_Support_Airstrike) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_CASDive";
		portrait = "\a3\Modules_F_Curator\Data\portraitCASGunMissile_ca.paa";
		class arguments : arguments {
			type = QUOTE(CASDIVE);
		};
	};
	class GVAR(Module_Support_CarpetBomb) : GVAR(Module_Support_Airstrike) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_CarpetBomb";
		portrait = "\a3\Modules_F_Curator\Data\portraitCASBomb_ca.paa";
		class arguments : arguments {
			type = QUOTE(CARPETBOMBS);
		};
	};
	class GVAR(Module_Support_Artillery) : GVAR(Module_Support_Base) {
		scopeCurator = 2;
		displayName = "$STR_A3U_Zeus_ModuleType_Support_Artillery";
		icon = "\a3\Modules_F_Curator\Data\iconOrdnance_ca.paa";
        portrait = "\a3\Modules_F_Curator\Data\portraitOrdnance_ca.paa";
		class arguments : arguments {
			type = QUOTE(ARTILLERY);
			caller = QUOTE(defence);
		};
	};
	class GVAR(Module_Support_Mortar) : GVAR(Module_Support_Artillery) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_Mortar";
		portrait = "\a3\Modules_F_Curator\Data\portraitOrdnanceMortar_ca.paa";
		class arguments : arguments {
			type = QUOTE(MORTAR);
		};
	};
	class GVAR(Module_Support_Howitzer) : GVAR(Module_Support_Artillery) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_Howitzer";
		portrait = "\a3\Modules_F_Curator\Data\portraitOrdnanceHowitzer_ca.paa";
		class arguments : arguments {
			type = QUOTE(HOWITZER);
		};
	};
	class GVAR(Module_Support_SAM) : GVAR(Module_Support_Artillery) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_SAM";
		portrait = "\a3\Modules_F_Curator\Data\portraitOrdnanceRocket_ca.paa";
		class arguments : arguments {
			type = QUOTE(SAM);
		};
	};
	class GVAR(Module_Support_CruiseMissile) : GVAR(Module_Support_SAM) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_CruiseMissile";
		class arguments : arguments {
			type = QUOTE(CRUISEMISSILE);
		};
	};
	class GVAR(Module_Support_QRFLand) : GVAR(Module_Support_Base) {
		scopeCurator = 2;
		displayName = "$STR_A3U_Zeus_ModuleType_Support_QRFLand";
		class arguments : arguments {
			type = QUOTE(QRFLAND);
		};
	};
	class GVAR(Module_Support_QRFAir) : GVAR(Module_Support_QRFLand) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_QRFAir";
		class arguments : arguments {
			type = QUOTE(QRFAIR);
		};
	};
	class GVAR(Module_Support_QRFVehAirdrop) : GVAR(Module_Support_QRFLand) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_QRFVehAirdrop";
		class arguments : arguments {
			type = QUOTE(QRFVEHAIRDROP);
		};
	};
	class GVAR(Module_Support_QRFOrbital) : GVAR(Module_Support_QRFLand) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_QRFOrbital";
		class arguments : arguments {
			type = QUOTE(QRFORBITAL);
		};
	};
	class GVAR(Module_Support_OrbitalStrike) : GVAR(Module_Support_QRFLand) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_OrbitalStrike";
		class arguments : arguments {
			type = QUOTE(ORBITALSTRIKE);
		};
	};
	class GVAR(Module_Support_UAV) : GVAR(Module_Support_QRFLand) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_UAV";
		class arguments : arguments {
			type = QUOTE(UAV);
		};
	};
	class GVAR(Module_Support_UAVAttack) : GVAR(Module_Support_QRFLand) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_UAVAttack";
		class arguments : arguments {
			type = QUOTE(UAVAttack);
		};
	};
	class GVAR(Module_Support_Tank) : GVAR(Module_Support_QRFLand) {
		displayName = "$STR_A3U_Zeus_ModuleType_Support_Tank";
		class arguments : arguments {
			type = QUOTE(TANK);
		};
	};

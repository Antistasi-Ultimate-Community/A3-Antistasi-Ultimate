	class GVAR(Module_Support_Base) : GVAR(Module_Base) {
        category = QGVAR(Supports);
    };
	class GVAR(Module_Support_QRFAir) : GVAR(Module_Support_Base) {
		scopeCurator = 2;
		displayName = "$STR_A3U_Zeus_ModuleType_Support_QRFAir";
		arguments[] = {
			QUOTE(QRFAIR),
			Occupants,
			QUOTE(attack),
			1000,
			false,
			getPosATL _module,
			1,
			0
		};
		function = QUOTE(A3A_fnc_createSupport);
	};

	class GVAR(Module_Support_Base) : GVAR(Module_Base) {
        category = QGVAR(Supports);
    };
    class GVAR(Module_Support_Airstrike): GVAR(Module_Support_Base) {
        scopeCurator = 2;
        displayName = "$STR_A3U_Zeus_ModuleType_Support_Airstrike";
        //function = QFUNC(module_SUP_airstrike);
    };
class Extended_PreInit_EventHandlers
{
	class ABZ_main
	{
		//init = QUOTE(call compile preprocessFileLineNumbers QUOTE(QPATHTOFOLDER(XEH_preInit.sqf)));
		init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
	};
};

class Extended_PostInit_EventHandlers
{
	class ABZ_main
	{
		//init = QUOTE(call compile preprocessFileLineNumbers QUOTE(QPATHTOFOLDER(XEH_postInit.sqf)));
		init = QUOTE(call COMPILE_SCRIPT(XEH_postInit));
	};
};

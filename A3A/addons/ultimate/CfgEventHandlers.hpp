class Extended_InitPost_EventHandlers
{
    class A3AU_TerrainSmoother_Base_F 
    {
        class ADDON 
        {
            clientInit = QUOTE(call A3A_fnc_handlerTerrainObjectHiderPostInitClient);
        };
    };

    class A3AU_VegetationCleaner_Base_F 
    {
        class ADDON 
        {
            clientInit = QUOTE(call A3A_fnc_handlerTerrainObjectHiderPostInitClient);
        };
    };

    class GVAR(BB_TerrainObjectHider_Base) 
    {
        class ADDON 
        {
            clientInit = QUOTE(call A3A_fnc_handlerTerrainObjectHiderPostInitClient);
        };
    };

    // A3U Zombies
    // Init EH is overridden for the base zombie classes we use to avoid their unit loaoduts from being overridden by WBK's init EH
    class Zombie_O_Walker_Civ
	{
		class Zombie_Walker_Init {
            init="_unit = _this select 0; if (local _unit) then {_unit spawn {[_this, false] execVM '\WBK_Zombies\AI\WBK_AI_Walker.sqf';};};";
        };
	};
    class Zombie_O_Shambler_Civ
    {
		class Zombie_Shambler_Init {
            init="_unit = _this select 0; if (local _unit) then {_unit spawn {_this execVM '\WBK_Zombies\AI\WBK_AI_Middle.sqf';};};";
        };
	};
    class Zombie_O_RC_Civ
    {
        class Zombie_RunnerCalm_Init {
            init="_unit = _this select 0; if (local _unit) then {_unit spawn {[_this, true, false] execVM '\WBK_Zombies\AI\WBK_AI_Runner.sqf';};};";
        };
    };
};

class Extended_PostInit_EventHandlers 
{
    class ADDON
	{
        init = "call A3U_fnc_postInit";
    };
};

class Extended_PreInit_EventHandlers 
{
    class ADDON
	{
        init = "call A3U_fnc_init";
    };
};

    class LIB_C47_Skytrain;
	class A3U_LIB_C47_German: LIB_C47_Skytrain
	{
		author=AUTHOR;
		displayName="C-47 Skytrain (German)";
        scope = 2;
        side = -1;
        faction = "LIB_WEHRMACHT";
		hiddenSelectionsTextures[]=
		{
			QPATHTOFOLDER(IFA\data\dc3_body_01_bob_co.paa),
			QPATHTOFOLDER(IFA\data\dc3_body_02_co.paa)
		};

		
	};

class DefaultEventHandlers;
class CfgVehicles 
{
	class LIB_US_Willys_MB_M1919;
	class a3a_LIB_Willys_MB_M1919 : LIB_US_Willys_MB_M1919{
		hiddenSelectionsTextures[] = {"WW2\Assets_t\Vehicles\Cars_t\IF_Willys_MB\Willys_co.paa","\WW2\Assets_t\Vehicles\Cars_t\IF_Willys_MB\Willys_Additional_co.paa"};
		typicalCargo[] = {"LIB_SOV_AT_soldier"};
		crew = "LIB_SOV_unequip";
		faction = "LIB_RKKA";
		side = 0;
	};
	class LIB_DAK_PzKpfwIV_H;
	class a3a_lib_PzKpfwIV_noShield : LIB_DAK_PzKpfwIV_H{
		faction = "LIB_WEHRMACHT";
		hiddenSelectionsTextures[] = {"\WW2\Assets_t\Vehicles\Tanks_t\IF_PzKpfwIV_H\Body_co.paa","\WW2\Assets_t\Vehicles\Tanks_t\IF_PzKpfwIV_H\Turret_co.paa","\WW2\Assets_t\Vehicles\Tanks_t\IF_PzKpfwIV_H\Wheels_co.paa","\WW2\Assets_t\Vehicles\Tanks_t\IF_PzKpfwIV_H\Tracks_co.paa"};
	};
	class LIB_Zis6_Parm;
	class a3a_lib_Zis6_BOX : LIB_Zis6_Parm {
		displayName = "ZIS-5V (Box)";
		transportRepair = 0;
		typicalCargo[] = {"LIB_FFI_LAT_Soldier"};
		faction = "LIB_FFI";
		side = 2;
	};
	// CBA event handlers fix
	class Tank;
	class LIB_Armored_Target_Dummy : Tank {
		delete EventHandlers;
	};

	// Nose-fall tweaks to make planes turn at a semi-decent rate when flown by AI
	// Note: LIB_Ju87 not adjusted because planes with low maxSpeed use different AI logic
	class LIB_GER_Plane_base;
	class LIB_FW190F8 : LIB_GER_Plane_base
	{
		draconicTorqueXCoef = 2;
	};
	class LIB_SU_Plane_base;
	class LIB_P39 : LIB_SU_Plane_base
	{
		draconicTorqueXCoef = 2;
	};
	class LIB_Pe2 : LIB_SU_Plane_base
	{
		draconicTorqueXCoef = 2;
	};
	class LIB_US_Plane_base;
	class LIB_P47 : LIB_US_Plane_base
	{
		draconicTorqueXCoef = 2;
	};
};
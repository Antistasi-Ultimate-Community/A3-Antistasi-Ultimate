class A3U_OPTRE_Pelican_VTOL_Unarmed: A3U_OPTRE_Pelican_VTOL_Base
{
	displayName="D77H-TCI Pelican unarmed VTOL";
	editorPreview="\OPTRE_Misc\Image\OPTRE\Aircraft\OPTRE_Pelican_unarmed.jpg";
	author="Article 2 Studios";
	scope=2;
	scopeCurator=2;
	scopeArsenal=2;
	side=1;
	vehicleClass="OPTRE_UNSC_Air_class";
	faction="OPTRE_UNSC";
	crew="OPTRE_UNSC_Airforce_Soldier_Airman";
	textureList[]=
	{
		"standard",
		1,
		"colorgreen",
		1,
		"colorblack",
		1,
		"colorsnow",
		1,
		"colortan",
		1
	};
	tf_range=25000;
	tf_isolatedAmount=0.40000001;
	tf_dialogUpdate="call TFAR_fnc_updateLRDialogToChannel;";
	tf_hasLRradio=1;
	enableRadio=1;
};
class A3U_OPTRE_Pelican_VTOL_unarmed_ins: A3U_OPTRE_Pelican_VTOL_Unarmed
{
	editorPreview="\OPTRE_Misc\Image\OPTRE\Aircraft\OPTRE_Pelican_unarmed_ins.jpg";
	displayName="D77H-TCI Pelican VTOL unarmed (Ins)";
	author="Article 2 Studios";
	scope=2;
	scopeCurator=2;
	scopeArsenal=2;
	side=0;
	faction="OPTRE_Ins";
	crew="OPTRE_Ins_URF_Crewman";
	vehicleClass="OPTRE_Ins_Air_class";
	hiddenSelectionsTextures[]=
	{
		"OPTRE_Vehicles\Pelican\data\innie\PelicanExterior_innie_CO.paa",
		""
	};
	textureList[]=
	{
		"Baseinnie",
		1,
		"InnieWdl",
		1,
		"InnieWdl2",
		1,
		"InnieDes",
		1,
		"InnieDes2",
		1,
		"InnieSnow",
		1,
		"InnieSnow2",
		1
	};
};
class A3U_OPTRE_Pelican_VTOL_unarmed_Marine: A3U_OPTRE_Pelican_VTOL_Unarmed
{
	displayName="D77H-TCI Pelican VTOL unarmed (Marine)";
	author="Spartanjackwar / wersal";
	scope=1;
	scopeCurator=1;
	scopeArsenal=1;
	crew="OPTRE_UNSC_Marine_Pilot";
	hiddenSelectionsTextures[]=
	{
		"OPTRE_Vehicles\Pelican\data\PelicanExterior_Marine_CO.paa",
		""
	};
};
class A3U_OPTRE_Pelican_VTOL_unarmed_Green: A3U_OPTRE_Pelican_VTOL_Unarmed
{
	displayName="D77H-TCI Pelican VTOL unarmed (Green)";
	author="Spartanjackwar / wersal";
	scope=1;
	scopeCurator=1;
	scopeArsenal=1;
	hiddenSelectionsTextures[]=
	{
		"OPTRE_Vehicles\Pelican\data\PelicanExterior_green_CO.paa",
		""
	};
};
// -------------------- Unarmed texture variants --------------------
class A3U_OPTRE_Pelican_VTOL_unarmed_tan: A3U_OPTRE_Pelican_VTOL_Unarmed
{
    displayName = "D77H-TCI Pelican unarmed VTOL (Tan)";
    author = "Article 2 Studios";
    scope = 1;
    scopeCurator = 2;
    hiddenSelectionsTextures[] =
    {
        "OPTRE_Vehicles\Pelican\data\PelicanExterior_Tan_CO.paa",
        ""
    };
};

class A3U_OPTRE_Pelican_VTOL_unarmed_black: A3U_OPTRE_Pelican_VTOL_Unarmed
{
    displayName = "D77H-TCI Pelican unarmed VTOL (Black)";
    author = "Article 2 Studios";
    scope = 1;
    scopeCurator = 2;
    hiddenSelectionsTextures[] =
    {
        "OPTRE_Vehicles\Pelican\data\PelicanExterior_black_CO.paa",
        ""
    };
};

class A3U_OPTRE_Pelican_VTOL_unarmed_PD: A3U_OPTRE_Pelican_VTOL_Unarmed
{
    displayName = "D77H-TCI Pelican unarmed VTOL (Police)";
    author = "Article 2 Studios";
    scope = 2;
    scopeCurator = 2;
    side = 2;
    faction = "OPTRE_PD";
    crew = "OPTRE_CPD_Pilot";
    vehicleClass = "OPTRE_PD_Air_class";
    hiddenSelectionsTextures[] =
    {
        "OPTRE_Vehicles\Pelican\data\PelicanExterior_police_CO.paa",
        ""
    };
};

class A3U_OPTRE_Pelican_VTOL_unarmed_CMA: A3U_OPTRE_Pelican_VTOL_Unarmed
{
    displayName = "D77H-TCI Pelican unarmed VTOL [CMA]";
    author = "Article 2 Studios";
    scope = 2;
    scopeCurator = 2;
    side = 2;
    faction = "OPTRE_CAA";
    crew = "OPTRE_CMA_Army_Soldier_Airman";
    vehicleClass = "OPTRE_CMA_Air_class";
    hiddenSelectionsTextures[] =
    {
        "OPTRE_Vehicles\Pelican\data\PelicanExterior_black_CO.paa",
        ""
    };
};
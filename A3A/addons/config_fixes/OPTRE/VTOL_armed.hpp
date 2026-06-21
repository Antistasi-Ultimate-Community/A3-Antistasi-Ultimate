class A3U_OPTRE_Pelican_VTOL_Armed: A3U_OPTRE_Pelican_VTOL_Base
{
	editorPreview="\OPTRE_Misc\Image\OPTRE\Aircraft\OPTRE_Pelican_armed.jpg";
    displayName = "D77H-TCI/AV Pelican VTOL";
	author="Spartanjackwar / wersal";
	scope=2;
	scopeCurator=2;
	side=1;
	vehicleClass="OPTRE_UNSC_Air_class";
	faction="OPTRE_UNSC";
	crew="OPTRE_UNSC_Airforce_Soldier_Airman";
	hiddenSelections[]=
	{
		"camo1",
		"camo3",
		"clan",
		"clan_text",
		"insignia"
	};
	hiddenSelectionsTextures[]=
	{
		"OPTRE_Vehicles\Pelican\data\PelicanExterior_standard_CO.paa",
		""
	};
	memoryPointLMissile="Rocket_1";
	memoryPointRMissile="Rocket_2";
	weapons[]=
	{
		"CMFlareLauncher"
	};
	magazines[]=
	{
		"168Rnd_CMFlare_Chaff_Magazine"
	};
	class Components: Components
	{
		class TransportPylonsComponent
		{
			UIPicture="\OPTRE_Vehicles\Pelican\pelicanPylonPic.paa";
			class pylons
			{
				class pylons1
				{
					maxweight=560;
					hardpoints[]=
					{
						"OPAEX_Hardpoint_D77-TC"
					};
					attachment="OPTRE_32Rnd_Anvil1_missiles";
					bay=-1;
					priority=2;
					UIposition[]={0.1,0.5};
					turret[]={};
				};
				class pylons2: pylons1
				{
					mirroredMissilePos=1;
					UIposition[]={0.1,0.1};
				};
				class pylons3: pylons1
				{
					attachment="OPTRE_4Rnd_Jackknife_missile";
					priority=2;
					hardpoints[]=
					{
						"OPTRE_Hardpoint_D77_Guided"
					};
					UIposition[]={0.25,0.44};
					turret[]={0};
				};
				class pylons4: pylons1
				{
					mirroredMissilePos=3;
					attachment="OPTRE_4Rnd_Jackknife_missile";
					priority=2;
					hardpoints[]=
					{
						"OPTRE_Hardpoint_D77_Guided"
					};
					UIposition[]={0.25,0.16};
					turret[]={0};
				};
				class pylonsNoseCannon
				{
					maxweight=1000;
					hardpoints[]=
					{
						"OPTRE_PELICAN_LIGHT_NOSE_CANNON",
						"OPTRE_PELICAN_MEDIUM_NOSE_CANNON",
						"OPTRE_PELICAN_HEAVY_NOSE_CANNON"
					};
					attachment="OPTRE_1200Rnd_40mm_HE";
					bay=-1;
					priority=2;
					UIposition[]={0.2,0.34};
					turret[]={0};
				};
			};
			class Presets
			{
				class Empty
				{
					displayName="Empty";
					attachment[]={};
				};
				class Default
				{
					displayName="CAP";
					attachment[]=
					{
						"OPTRE_12Rnd_C2GMLS_missiles",
						"OPTRE_12Rnd_C2GMLS_missiles",
						"OPTRE_12Rnd_C2GMLS_missiles",
						"OPTRE_12Rnd_C2GMLS_missiles",
						"OPTRE_1000Rnd_127x99_M41_HE"
					};
				};
				class CAS_Rockets
				{
					displayName="CAS: ANVIL I";
					attachment[]=
					{
						"OPTRE_32Rnd_Anvil1_missiles",
						"OPTRE_32Rnd_Anvil1_missiles",
						"",
						"",
						"OPTRE_1200Rnd_40mm_HE"
					};
				};
				class CAS_Rockets_Guided
				{
					displayName="CAS: ANVIL II & III";
					attachment[]=
					{
						"OPTRE_32Rnd_Anvil2_missiles",
						"OPTRE_32Rnd_Anvil3_missiles",
						"",
						"",
						"OPTRE_1200Rnd_40mm_HE"
					};
				};
				class CAS_AT
				{
					displayName="AT";
					attachment[]=
					{
						"OPTRE_4Rnd_Jackknife_missile",
						"OPTRE_4Rnd_Jackknife_missile",
						"OPTRE_4Rnd_Jackknife_missile",
						"OPTRE_4Rnd_Jackknife_missile",
						"OPTRE_750Rnd_70mm_HE"
					};
				};
			};
		};
	};
	class Turrets: Turrets
	{
		class CopilotTurret: CopilotTurret
		{
			gunnerAction="OPTRE_Pelican_Gunner";
			gunnerInAction="OPTRE_Pelican_Gunner";
			precisegetinout=1;
			gunnerGetInAction="pilot_Heli_Light_02_Enter";
			gunnerGetOutAction="pilot_Heli_Light_02_Exit";
			memoryPointsGetInGunner="Pos_Gunner";
			memoryPointsGetInGunnerDir="Pos_Gunner_dir";
			canEject=1;
			body="mainTurret";
			gun="mainGun";
			gunAxis="Osa Hlavne";
			gunBeg="Usti hlavne";
			gunEnd="konec hlavne";
			animationSourceBody="mainTurret";
			animationSourceGun="mainGun";
			gunnerLeftHandAnimName="";
			gunnerRightHandAnimName="";
			maxHorizontalRotSpeed=5;
			maxVerticalRotSpeed=5;
			proxyindex=1;
			isCopilot=1;
			gunnerName="Gunner";
			primaryGunner=1;
			visionMode[]=
			{
				"Normal",
				"NVG",
				"Ti"
			};
			weapons[]=
			{
				"CMFlareLauncher",
				"Laserdesignator_mounted"
			};
			magazines[]=
			{
				"168Rnd_CMFlare_Chaff_Magazine",
				"Laserbatteries"
			};
			minElev=-90;
			maxElev=30;
			initElev=0;
			minTurn=-180;
			maxTurn=180;
			initTurn=0;
			stabilizedInAxes="StabilizedInAxesBoth";
			startEngine=0;
			class Viewoptics
			{
				minAngleX=-80;
				maxAngleX=80;
				initAngleX=0;
				minAngleY=-80;
				maxAngleY=15;
				initAngleY=0;
				initFov=0.75;
				minFov=0.25;
				maxFov=0.75;
				visionMode[]=
				{
					"Normal",
					"NVG",
					"Ti"
				};
			};
			class OpticsIn
			{
				class Wide
				{
					initAngleX=0;
					minAngleX=-30;
					maxAngleX=30;
					initAngleY=0;
					minAngleY=-100;
					maxAngleY=100;
					initFov=0.46599999;
					minFov=0.46599999;
					maxFov=0.46599999;
					directionStabilized=1;
					opticsDisplayName="W";
					visionMode[]=
					{
						"Normal",
						"NVG",
						"Ti"
					};
					thermalMode[]={0,1};
					gunnerOpticsModel="\A3\Weapons_F_Beta\Reticle\Heli_Attack_01_Optics_Gunner_wide_F";
				};
				class Medium: Wide
				{
					initFov=0.093000002;
					minFov=0.093000002;
					maxFov=0.093000002;
					opticsDisplayName="M";
					gunnerOpticsModel="\A3\Weapons_F_Beta\Reticle\Heli_Attack_01_Optics_Gunner_medium_F";
				};
				class Narrow: Wide
				{
					initFov=0.028999999;
					minFov=0.028999999;
					maxFov=0.028999999;
					opticsDisplayName="N";
					gunnerOpticsModel="\A3\Weapons_F_Beta\Reticle\Heli_Attack_01_Optics_Gunner_narrow_F";
				};
			};
			class OpticsOut
			{
				class Monocular
				{
					initAngleX=0;
					minAngleX=-30;
					maxAngleX=30;
					initAngleY=0;
					minAngleY=-100;
					maxAngleY=100;
					minFov=0.25;
					maxFov=1.25;
					initFov=0.75;
					visionMode[]=
					{
						"Normal",
						"NVG"
					};
					gunnerOpticsModel="";
					gunnerOpticsEffect[]={};
				};
			};
			class Components
			{
				class VehicleSystemsDisplayManagerComponentLeft: DefaultVehicleSystemsDisplayManagerLeft
				{
					class Components: components
					{
						class VehiclePrimaryGunnerDisplay
						{
							componentType="TransportFeedDisplayComponent";
							source="PrimaryGunner";
						};
						class VehicleMissileDisplay
						{
							componentType="TransportFeedDisplayComponent";
							source="Missile";
						};
						class SensorDisplay
						{
							componentType="SensorsDisplayComponent";
							range[]={4000,2000,16000,8000};
							resource="RscCustomInfoSensors";
						};
					};
				};
				class VehicleSystemsDisplayManagerComponentRight: DefaultVehicleSystemsDisplayManagerRight
				{
					defaultDisplay="SensorDisplay";
					class Components: components
					{
						class VehiclePrimaryGunnerDisplay
						{
							componentType="TransportFeedDisplayComponent";
							source="PrimaryGunner";
						};
						class VehicleMissileDisplay
						{
							componentType="TransportFeedDisplayComponent";
							source="Missile";
						};
						class SensorDisplay
						{
							componentType="SensorsDisplayComponent";
							range[]={4000,2000,16000,8000};
							resource="RscCustomInfoSensors";
						};
					};
				};
			};
			soundServo[]=
			{
				"",
				0.0099999998,
				1
			};
			outGunnerMayFire=1;
			commanding=-1;
			memoryPointGunnerOptics="gunner1";
			selectionFireAnim="";
			castGunnerShadow=0;
			viewGunnerShadow=0;
			turretAxis="axisturret1";
			gunnerOpticsModel="";
			gunnerOpticsEffect[]=
			{
				"TankCommanderOptics1",
				"BWTV"
			};
			gunnerForceOptics=0;
			turretInfoType="RscOptics_Heli_Attack_01_gunner";
			discreteDistance[]={100,200,300,400,500,600,700,800,1000,1200,1500,1800,2100};
			discreteDistanceInitIndex=5;
			showAllTargets=4;
		};
		class CargoTurret_01: CargoTurret
		{
			gunnerAction="passenger_inside_2";
			gunnerCompartments="Compartment2";
			memoryPointsGetInGunner="pos_cargo_l";
			memoryPointsGetInGunnerDir="pos_cargo_l_dir";
			gunnerName="Passenger (Left door)";
			proxyIndex=1;
			maxElev=15;
			minElev=-25;
			maxTurn=10;
			minTurn=-50;
			isPersonTurret=1;
			ejectDeadGunner=0;
			enabledByAnimationSource="cargoDoors";
			memoryPointGunnerOptics="";
		};
		class CargoTurret_02: CargoTurret_01
		{
			gunnerAction="passenger_inside_2";
			gunnerCompartments="Compartment2";
			memoryPointsGetInGunner="pos_cargo_r";
			memoryPointsGetInGunnerDir="pos_cargo_r_dir";
			gunnerName="Passenger (Right door)";
			proxyIndex=2;
			maxElev=15;
			minElev=-25;
			maxTurn=50;
			minTurn=-10;
			isPersonTurret=1;
			ejectDeadGunner=0;
			enabledByAnimationSource="cargoDoors";
			memoryPointGunnerOptics="";
		};
	};
	class textureSources
	{
		class standard
		{
			displayName="Standard";
			author="Article 2 Studios";
			textures[]=
			{
				"OPTRE_Vehicles\Pelican\data\PelicanExterior_standard_CO.paa"
			};
			factions[]=
			{
				"OPTRE_UNSC"
			};
		};
		class colorgreen
		{
			displayName="Green";
			author="Article 2 Studios";
			textures[]=
			{
				"OPTRE_Vehicles\Pelican\data\PelicanExterior_green_CO.paa"
			};
			factions[]=
			{
				"OPTRE_UNSC"
			};
		};
		class colortan
		{
			displayName="Tan";
			author="Article 2 Studios";
			textures[]=
			{
				"OPTRE_Vehicles\Pelican\data\PelicanExterior_Tan_CO.paa"
			};
			factions[]=
			{
				"OPTRE_UNSC"
			};
		};
		class colorblack
		{
			displayName="Black";
			author="Article 2 Studios";
			textures[]=
			{
				"OPTRE_Vehicles\Pelican\data\PelicanExterior_black_CO.paa"
			};
			factions[]=
			{
				"OPTRE_UNSC"
			};
		};
		class colorsnow
		{
			displayName="Snow";
			author="Article 2 Studios";
			textures[]=
			{
				"OPTRE_Vehicles\Pelican\data\PelicanExterior_snow_CO.paa"
			};
			factions[]=
			{
				"OPTRE_UNSC"
			};
		};
		class colormarine
		{
			displayName="Marines";
			author="Article 2 Studios";
			textures[]=
			{
				"OPTRE_Vehicles\Pelican\data\PelicanExterior_marine_CO.paa"
			};
			factions[]=
			{
				"OPTRE_UNSC"
			};
		};
		class Baseinnie
		{
			displayName="Innie";
			author="Article 2 Studios";
			textures[]=
			{
				"OPTRE_Vehicles\Pelican\data\innie\PelicanExterior_innie_CO.paa"
			};
			factions[]=
			{
				"OPTRE_Ins"
			};
		};
		class InnieWdl
		{
			displayName="Innie Woodland #1";
			author="Article 2 Studios";
			textures[]=
			{
				"OPTRE_Vehicles\Pelican\data\innie\pelicanexterior_woodland_co.paa"
			};
			factions[]=
			{
				"OPTRE_Ins"
			};
		};
		class InnieWdl2
		{
			displayName="Innie Woodland #2";
			author="Article 2 Studios";
			textures[]=
			{
				"OPTRE_Vehicles\Pelican\data\innie\pelicanexterior_woodland2_co.paa"
			};
			factions[]=
			{
				"OPTRE_Ins"
			};
		};
		class InnieDes
		{
			displayName="Innie Desert #1";
			author="Article 2 Studios";
			textures[]=
			{
				"OPTRE_Vehicles\Pelican\data\innie\pelicanexterior_desert_co.paa"
			};
			factions[]=
			{
				"OPTRE_Ins"
			};
		};
		class InnieDes2
		{
			displayName="Innie Desert #2";
			author="Article 2 Studios";
			textures[]=
			{
				"OPTRE_Vehicles\Pelican\data\innie\pelicanexterior_desert2_co.paa"
			};
			factions[]=
			{
				"OPTRE_Ins"
			};
		};
		class InnieSnow
		{
			displayName="Innie Snow #1";
			author="Article 2 Studios";
			textures[]=
			{
				"OPTRE_Vehicles\Pelican\data\innie\pelicanexterior_snow_co.paa"
			};
			factions[]=
			{
				"OPTRE_Ins"
			};
		};
		class InnieSnow2
		{
			displayName="Innie Snow #2";
			author="Article 2 Studios";
			textures[]=
			{
				"OPTRE_Vehicles\Pelican\data\innie\pelicanexterior_snow2_co.paa"
			};
			factions[]=
			{
				"OPTRE_Ins"
			};
		};
	};
	textureList[]=
	{
		"standard",
		1,
		"colorgreen",
		1,
		"colorblack",
		1,
		"colortan",
		1,
		"colorsnow",
		1
	};
};
class A3U_OPTRE_Pelican_VTOL_Armed_Marine: A3U_OPTRE_Pelican_VTOL_Armed
{
	displayName="D77H-TCI/AV Pelican VTOL (Marine)";
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
class A3U_OPTRE_Pelican_VTOL_Armed_Green: A3U_OPTRE_Pelican_VTOL_Armed
{
	displayName="D77H-TCI/AV Pelican VTOL (Green)";
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
class A3U_OPTRE_Pelican_VTOL_armed_single_seater: A3U_OPTRE_Pelican_VTOL_Armed
{
	displayName="D77H-TCI/AV Pelican (Single Seater) VTOL";
	weapons[]=
	{
		"CMFlareLauncher"
	};
	magazines[]=
	{
		"168Rnd_CMFlare_Chaff_Magazine"
	};
	memoryPointGun="machinegun";
	memoryPointGunnerOutOptics="";
	memoryPointGunnerOptics="gunner1";
	class Components: Components
	{
		class TransportPylonsComponent: TransportPylonsComponent
		{
			class pylons: pylons
			{
				class pylons1: pylons1
				{
					turret[]={};
				};
				class pylons2: pylons2
				{
					turret[]={};
				};
				class pylons3: pylons3
				{
					turret[]={};
				};
				class pylons4: pylons4
				{
					turret[]={};
				};
				class pylonsNoseCannon: pylonsNoseCannon
				{
					turret[]={};
				};
			};
		};
	};
	class Turrets: Turrets
	{
		class CopilotTurret;
		class CargoTurret_01: CargoTurret_01
		{
		};
		class CargoTurret_02: CargoTurret_02
		{
		};
	};
};
// -------------------- 70mm VTOL --------------------
class A3U_OPTRE_Pelican_VTOL_70mm: A3U_OPTRE_Pelican_VTOL_Armed
{
    displayName = "D77H-TCI/AV Pelican 70mm VTOL";
    author = "Article 2 Studios / wersal";
    side=1;
	class Components: Components
	{
		class TransportPylonsComponent: TransportPylonsComponent
		{
			class pylons: pylons
			{
				class pylons1: pylons1
				{
				};
				class pylons2: pylons2
				{
				};
				class pylons3: pylons3
				{
				};
				class pylons4: pylons4
				{
				};
				class pylonsNoseCannon: pylonsNoseCannon
				{
					attachment="OPTRE_750Rnd_70mm_HE";
				};
			};
		};
	};
};

// -------------------- 70mm singleseater VTOL --------------------
class A3U_OPTRE_Pelican_VTOL_70mm_SingleSeater: A3U_OPTRE_Pelican_VTOL_70mm
{
    displayName = "D77H-TCI/AV Pelican 70mm (Single Seater) VTOL";
	weapons[]=
	{
		"CMFlareLauncher"
	};
	magazines[]=
	{
		"168Rnd_CMFlare_Chaff_Magazine"
	};
	memoryPointGun="machinegun";
	memoryPointGunnerOutOptics="";
	memoryPointGunnerOptics="gunner1";
	class Components: Components
	{
		class TransportPylonsComponent: TransportPylonsComponent
		{
			class pylons: pylons
			{
				class pylons1: pylons1
				{
					turret[]={};
				};
				class pylons2: pylons2
				{
					turret[]={};
				};
				class pylons3: pylons3
				{
					turret[]={};
				};
				class pylons4: pylons4
				{
					turret[]={};
				};
				class pylonsNoseCannon: pylonsNoseCannon
				{
					attachment="OPTRE_750Rnd_70mm_HE";
					turret[]={};
				};
			};
		};
	};
	class Turrets: Turrets
	{
		class CopilotTurret;
		class CargoTurret_01: CargoTurret_01
		{
		};
		class CargoTurret_02: CargoTurret_02
		{
		};
	};
};
class A3U_OPTRE_Pelican_VTOL_Armed_tan: A3U_OPTRE_Pelican_VTOL_Armed
{
    displayName = "D77H-TCI/AV Pelican VTOL (Tan)";
    author = "Article 2 Studios";
    scope = 1;
    scopeCurator = 2;
    hiddenSelectionsTextures[] =
    {
        "OPTRE_Vehicles\Pelican\data\PelicanExterior_tan_CO.paa",
        ""
    };
};

class A3U_OPTRE_Pelican_VTOL_Armed_black: A3U_OPTRE_Pelican_VTOL_Armed
{
    displayName = "D77H-TCI/AV Pelican VTOL (Black)";
    author = "Article 2 Studios";
    scope = 1;
    scopeCurator = 2;
    hiddenSelectionsTextures[] =
    {
        "OPTRE_Vehicles\Pelican\data\PelicanExterior_black_CO.paa",
        ""
    };
};

class A3U_OPTRE_Pelican_VTOL_Armed_ins: A3U_OPTRE_Pelican_VTOL_Armed
{
    displayName = "D77H-TCI/AV Pelican VTOL (Ins)";
    author = "Article 2 Studios";
    scope = 2;
    scopeCurator = 2;
    side = 0;
    faction = "OPTRE_Ins";
    crew = "OPTRE_Ins_URF_Crewman";
    vehicleClass = "OPTRE_Ins_Air_class";
    hiddenSelectionsTextures[] =
    {
        "OPTRE_Vehicles\Pelican\data\innie\PelicanExterior_innie_CO.paa",
        ""
    };
};

class A3U_OPTRE_Pelican_VTOL_Armed_CMA: A3U_OPTRE_Pelican_VTOL_Armed
{
    displayName = "D77H-TCI/AV Pelican VTOL [CMA]";
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

// -------------------- 70mm texture variants --------------------
class A3U_OPTRE_Pelican_VTOL_70mm_ins: A3U_OPTRE_Pelican_VTOL_70mm
{
    displayName = "D77H-TCI/AV Pelican 70mm VTOL (Ins)";
    author = "Article 2 Studios";
    scope = 2;
    scopeCurator = 2;
    side = 0;
    faction = "OPTRE_Ins";
    crew = "OPTRE_Ins_URF_Crewman";
    vehicleClass = "OPTRE_Ins_Air_class";
    hiddenSelectionsTextures[] =
    {
        "OPTRE_Vehicles\Pelican\data\innie\PelicanExterior_innie_CO.paa",
        ""
    };
};
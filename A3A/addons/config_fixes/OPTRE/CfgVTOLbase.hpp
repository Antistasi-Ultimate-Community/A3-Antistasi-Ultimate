//OPTRE - CfgVehicles.hpp
///original config comes from https://steamcommunity.com/sharedfiles/filedetails/?id=1797512739&searchtext=optre
class SensorTemplateIR;
class SensorTemplateVisual;
class SensorTemplateMan;
class SensorTemplateActiveRadar;
class SensorTemplatePassiveRadar;
class SensorTemplateAntiRadiation;
class SensorTemplateLaser;
class SensorTemplateNV;
class DefaultVehicleSystemsDisplayManagerLeft
{
	class Components;
};
class DefaultVehicleSystemsDisplayManagerRight
{
	class Components;
};
class Components;
class TransportPylonsComponent;
class pylons;
class CopilotTurret;
class CargoTurret;
class CommanderTurret;
class cfgVehicles
{
	class All
	{
	};
	class Static: All
	{
	};
	class Air;
	class Helicopter: Air
	{
		class HitPoints;
		class Turrets;
	};
	class Helicopter_Base_F: Helicopter
	{
		class HitPoints: HitPoints
		{
			class HitHull;
			class HitFuel;
			class HitEngine;
			class HitAvionics;
			class HitHRotor;
			class HitVRotor;
			class HitTransmission;
		};
		class Turrets: Turrets
		{
			class MainTurret;
		};
		class AnimationSources;
		class EventHandlers;
		class ViewPilot;
		class ViewOptics;
		class CargoTurret;
		class Components;
		class Reflectors
		{
			class Right;
		};
	};
	class Helicopter_Base_H: Helicopter_Base_F
	{
		class EventHandlers;
		class Turrets: Turrets
		{
			class CopilotTurret;
		};
		class HitPoints: HitPoints
		{
			class HitHull;
			class HitFuel;
			class HitEngine;
			class HitAvionics;
			class HitVRotor;
			class HitHRotor;
			class HitGlass1;
			class HitGlass2;
			class HitGlass3;
			class HitGlass4;
			class HitGlass5;
			class HitGlass6;
		};
		class Components;
		class AnimationSources;
		class ViewOptics;
		class RotorLibHelicopterProperties;
	};
	class OPTRE_Pelican_F: Helicopter_Base_H
	{
		class Components: Components 
		{
		};
		class AnimationSources: AnimationSources
		{
		};
		class Turrets: Turrets
		{
			class CopilotTurret;
		};
	};
	class A3U_OPTRE_Pelican_VTOL_Base: OPTRE_Pelican_F
	{
	    scope = 0;
	    author = "Spartanjackwar / wersal";
	    displayName = "D77H-TCI/AV Pelican VTOL";

	    // ========== VTOL-specific parameters ==========
	    simulation = "airplanex";
	    angleOfIndicence = "1*3.1415/180";
	    landingAoa = "10*3.1415/180";
	    stallSpeed = 180;
	    stallWarningTreshold = 0.2;
	    envelope[] = {0,0.0099999998,0.2,4,6,7.5999999,8.3999996,9.1999998,9.3999996,9.6000004,9.6999998,9.8000002,8,1};
	    airBrake = 1;
	    flaps = 0;
	    tailHook = 0;
	    flapsFrictionCoef = 0;
	    aileronSensitivity = 1;
	    aileronCoef[] = {1,1.4,1.9,2,2.05,2.0999999,2.1500001};
	    aileronControlsSensitivityCoef = 1;
	    VTOLRollInfluence = 18;
	    elevatorSensitivity = 1;
	    elevatorCoef[] = {1,1.4,1.9,2,2.05,2.0999999,2.1500001};
	    elevatorControlsSensitivityCoef = 1;
	    VTOLPitchInfluence = 16;
	    rudderInfluence = 0.99900001;
	    rudderCoef[] = {12,12.4,12.9,13,13.05,13.1,13.15};
	    rudderControlsSensitivityCoef = 1;
	    VTOLYawInfluence = 20;
	    draconicForceXCoef = 10;
	    draconicForceYCoef = 1;
	    draconicForceZCoef = 1;
	    draconicTorqueXCoef[] = {0.5,1,2,2.3,3,2.5999999,2.4000001,2.2,2,1.9,1.8};
	    draconicTorqueYCoef[] = {0.5,1,2,2.3,3,2.5999999,2.4000001,2.2,2,1.9,1.8};
	    airFrictionCoefs2[] = {0.001,0.0060000001,7.0000002e-005};
	    airFrictionCoefs1[] = {0.1,0.60000002,0.0066999998};
	    airFrictionCoefs0[] = {0,0,0};
	    maxSpeed = 850;
	    landingSpeed = 0;
	    altNoForce = 100000;
	    altFullForce = 2500;
	    thrustCoef[] = {2};
	    throttleToThrustLogFactor = 2;
	    vtol = 4;
	    maxOmega = 2000;
	    memoryPointLDust = "engine_4";
	    memoryPointRDust = "engine_1";
	    leftDustEffect = "LDustEffects";
	    rightDustEffect = "RDustEffects";
	    memoryPointLMissile = "Rocket_1";
	    memoryPointRMissile = "Rocket_2";
	    memoryPointGun = "kulomet";
	    selectionRotorStill = "vrtule staticka";
	    selectionRotorMove = "vrtule blur";
	    lightOnGear = 1;
	    headGforceLeaningFactor[] = {0.0049999999,0.001,0.025};
	    unitInfoType = "RscUnitInfoAirPlane";
	    minGunElev = 0;
	    maxGunElev = 0;
	    minGunTurn = 0;
	    maxGunTurn = 0;
	    gunAimDown = 0;
	    steerAheadSimul = 1;
	    steerAheadPlan = 2;
	    wheelSteeringSensitivity = 0.69999999;
	    brakeDistance = 500;
	    formationX = 100;
	    formationZ = 100;
	    cabinOpening = 1;
	    getInRadius = 1.2;
	    durationGetIn = 0.99000001;
	    durationGetOut = 0.99000001;
	    ejectSpeed[] = {0,40,0};
	    ejectDamageLimit = 0.44999999;
	    numberPhysicalWheels = 3;
	    fuelExplosionPower = 10;
	    epeImpulseDamageCoef = 0.1;
		armorStructural = 2;
		armor=400;
		damageResistance=0.00039999999;
		explosionShielding=10;
		driveOnComponent[]=
		{
			"wheel_1_1",
			"wheel_2_1",
			"wheel_2_2"
		};

		class HitPoints: HitPoints
		{
			class HitHull: HitHull
			{
				armor=4;
				visual="Hull";
				explosionShielding=5;
				passThrough=0.5;
				minimalHit=0.02;
				depends="Total";
				radius=0.0099999998;
				material=-1;
			};
			class HitFuel: HitFuel
			{
				armor=3;
				radius=0.25;
				minimalHit=0.02;
				passThrough=0.5;
				explosionShielding=4;
			};
			class HitAvionics: HitAvionics
			{
				armor=3;
				radius=0.40000001;
				minimalHit=0.02;
				passThrough=0.2;
				explosionShielding=1.5;
			};
			class HitHRotor: HitHRotor
			{
				armor=2.5999999;
				radius=0.40000001;
				minimalHit=0.0099999998;
				explosionShielding=2.5;
			};
			class HitVRotor: HitVRotor
			{
				armor=2;
				radius=0.059999999;
				minimalHit=0.0099999998;
				explosionShielding=6;
			};
		};
		class Exhausts
		{
			class Exhaust1
			{
				position="exhaust1";
				direction="exhaust1_dir";
				effect="ExhaustsEffectHeliMed";
				engineIndex=0;
			};
			class Exhaust2
			{
				position="exhaust2";
				direction="exhaust2_dir";
				effect="ExhaustsEffectHeliMed";
				engineIndex=0;
			};
			class Exhaust3
			{
				position="exhaust3";
				direction="exhaust3_dir";
				effect="ExhaustsEffectHeliMed";
				engineIndex=0;
			};
			class Exhaust4
			{
				position="exhaust4";
				direction="exhaust4_dir";
				effect="ExhaustsEffectHeliMed";
				engineIndex=0;
			};
			class Exhaust5
			{
				position="exhaust5";
				direction="exhaust5_dir";
				effect="ExhaustsEffectHeliMed";
				engineIndex=1;
			};
			class Exhaust6
			{
				position="exhaust6";
				direction="exhaust6_dir";
				effect="ExhaustsEffectHeliMed";
				engineIndex=1;
			};
			class Exhaust7
			{
				position="exhaust7";
				direction="exhaust7_dir";
				effect="ExhaustsEffectHeliMed";
				engineIndex=1;
			};
			class Exhaust8
			{
				position="exhaust8";
				direction="exhaust8_dir";
				effect="ExhaustsEffectHeliMed";
				engineIndex=1;
			};
		};
		// ========== Wheel Configuration ==========
		class Wheels
		{
		    class Wheel_1_1
			{
			    boneName = "wheel_1_1";           // Bone name in the model
			    steering = 0;                      // 1 if wheel is steerable
			    side = "left";                      // Side
			    center = "wheel_1_1_axis";         // Rotation axis point (must be in Memory LOD)
			    boundary = "wheel_1_1_bound";       // Point for determining wheel radius
			    width = 0.28;                       // Wheel width
			    mass = 150;                         // Wheel mass
			    MOI = 3;                             // Moment of inertia
			    dampingRate = 0.1;                   // Damping
			    dampingRateDamaged = 1;               // Damping when damaged
			    dampingRateDestroyed = 1000;          // Damping when destroyed
			    maxBrakeTorque = 4000;                 // Max brake torque
			    maxHandBrakeTorque = 0;                 // Handbrake (0 if not needed)
			    suspTravelDirection[] = {0, -1, 0};     // Suspension travel direction
			    suspForceAppPointOffset = "wheel_1_1_axis"; // Suspension force application point offset
			    tireForceAppPointOffset = "wheel_1_1_axis"; // Tire force application point offset
			    maxCompression = 0.5;                    // Max suspension compression
			    maxDroop = 0.15;                           // Max suspension droop
			    sprungMass = 439;                           // Unsprung mass
			    springStrength = 173830;                     // Spring strength
			    springDamperRate = 52150.602;                 // Spring damper rate
			    longitudinalStiffnessPerUnitGravity = 5000;   // Longitudinal stiffness per unit gravity
			    latStiffX = 1;                                 // Lateral stiffness coefficient (parameter)
			    latStiffY = 18;                                // Lateral stiffness coefficient (curve)
			    frictionVsSlipGraph[] =                         // Friction vs slip graph
			    {
			        {0, 1},
			        {0.5, 1},
			        {1, 1}
			    };
			};
		    class Wheel_2_1 : Wheel_1_1
		    {
		        boneName = "wheel_2_1";
				steering = 0;
		        center = "wheel_2_1_axis";
		        boundary = "wheel_2_1_bound";
		    };
		    class Wheel_2_2 : Wheel_1_1
		    {
		        boneName = "wheel_2_2";
		        steering = 0;
		        side = "right";
		        center = "wheel_2_2_axis";
		        boundary = "wheel_2_2_bound";
		    };
		};
	    // ========== MFD with full horizon ladder ==========
	    class MFD
	    {
	        class AirplaneHUD
	        {
	            enableParallax = 0;
	            helmetMountedDisplay = 0;
	            helmetPosition[] = {-0.032499999,0.032499999,0.1};
	            helmetRight[] = {0.064999998,0,0};
	            helmetDown[] = {0,-0.064999998,0};
	            topLeft = "HUD LH";
	            topRight = "HUD PH";
	            bottomLeft = "HUD LD";
	            borderLeft = 0;
	            borderRight = 0;
	            borderTop = 0;
	            borderBottom = 0;
	            color[] = {0.082000002,0.40799999,0.039000001,1};
	            class Bones {};
	            class Draw { condition = "1-on * on"; };
	        };
	        class B_Plane_Fighter_01_static_HUD
	        {
	            enableParallax = 0;
	            helmetMountedDisplay = 1;
	            helmetPosition[] = {-0.032499999,0.032499999,0.1};
	            helmetRight[] = {0.064999998,0,0};
	            helmetDown[] = {0,-0.064999998,0};
	            class Pos10Vector
	            {
	                type = "vector";
	                pos0[] = {0.5,0.5};
	                pos10[] = {1.225,1.1};
	            };
	            topLeft = "HUD LH";
	            topRight = "HUD PH";
	            bottomLeft = "HUD LD";
	            borderLeft = 0;
	            borderRight = 0;
	            borderTop = 0;
	            borderBottom = 0;
	            color[] = {0.082000002,0.40799999,0.039000001,1};
	            class Bones
	            {
	                class PlaneW
	                {
	                    type = "fixed";
	                    pos[] = {0.5,0.5};
	                    pos10[] = {0.77399999,0.76999998};
	                };
	                class Velocity: Pos10Vector
	                {
	                    type = "vector";
	                    source = "velocityToView";
	                    pos0[] = {0.5,0.5};
	                    pos10[] = {0.77399999,0.76999998};
	                };
	                class PlaneOrientation
	                {
	                    type = "vector";
	                    source = "forward";
	                    pos[] = {0.5,0.5};
	                    pos0[] = {0.5,0.5};
	                    pos10[] = {0.77399999,0.76999998};
	                };
	                class WeaponAim
	                {
	                    type = "vector";
	                    source = "weaponToView";
	                    pos0[] = {0.5,0.5};
	                    pos10[] = {0.77399999,0.76999998};
	                };
	                class MissileFlightTimeRot1
	                {
	                    type = "rotational";
	                    source = "MissileFlightTime";
	                    sourceScale = 1;
	                    center[] = {0,0};
	                    min = 0;
	                    max = 0.5;
	                    minAngle = 0;
	                    maxAngle = 18;
	                    aspectRatio = 0.98540199;
	                };
	                class MissileFlightTimeRot2: MissileFlightTimeRot1 { maxAngle = 36; max = 1; };
	                class MissileFlightTimeRot3: MissileFlightTimeRot1 { maxAngle = 54; max = 1.5; };
	                class MissileFlightTimeRot4: MissileFlightTimeRot1 { maxAngle = 72; max = 2; };
	                class MissileFlightTimeRot5: MissileFlightTimeRot1 { maxAngle = 90; max = 2.5; };
	                class MissileFlightTimeRot6: MissileFlightTimeRot1 { maxAngle = 108; max = 3; };
	                class MissileFlightTimeRot7: MissileFlightTimeRot1 { maxAngle = 126; max = 3.5; };
	                class MissileFlightTimeRot8: MissileFlightTimeRot1 { maxAngle = 144; max = 4; };
	                class MissileFlightTimeRot9: MissileFlightTimeRot1 { maxAngle = 162; max = 4.5; };
	                class MissileFlightTimeRot10: MissileFlightTimeRot1 { maxAngle = 180; max = 5; };
	                class MissileFlightTimeRot11: MissileFlightTimeRot1 { maxAngle = 198; max = 5.5; };
	                class MissileFlightTimeRot12: MissileFlightTimeRot1 { maxAngle = 216; max = 6; };
	                class MissileFlightTimeRot13: MissileFlightTimeRot1 { maxAngle = 234; max = 6.5; };
	                class MissileFlightTimeRot14: MissileFlightTimeRot1 { maxAngle = 252; max = 7; };
	                class MissileFlightTimeRot15: MissileFlightTimeRot1 { maxAngle = 270; max = 7.5; };
	                class MissileFlightTimeRot16: MissileFlightTimeRot1 { maxAngle = 288; max = 8; };
	                class MissileFlightTimeRot17: MissileFlightTimeRot1 { maxAngle = 306; max = 8.5; };
	                class MissileFlightTimeRot18: MissileFlightTimeRot1 { maxAngle = 324; max = 9; };
	                class MissileFlightTimeRot19: MissileFlightTimeRot1 { maxAngle = 342; max = 9.5; };
	                class MissileFlightTimeRot20: MissileFlightTimeRot1 { maxAngle = 360; max = 10; };
	                // Thrust vectoring bone
	                class ThrustVectoringRotation
	                {
	                    type = "rotational";
	                    source = "vtolvectoring";
	                    sourceScale = 100;
	                    center[] = {0.89899999,0.5};
	                    min = 0;
	                    max = 100;
	                    minAngle = 180;
	                    maxAngle = 270;
	                    aspectRatio = 0.98290598;
	                };
	                class Target
	                {
	                    type = "vector";
	                    source = "targetToView";
	                    pos0[] = {0.5,0.5};
	                    pos10[] = {0.77399999,0.76999998};
	                };
	                class TargetingPodDir
	                {
	                    source = "pilotcameratoview";
	                    type = "vector";
	                    pos0[] = {0.5,0.5};
	                    pos10[] = {0.77399999,0.76999998};
	                };
	                class TargetingPodTarget
	                {
	                    source = "pilotcameratargettoview";
	                    type = "vector";
	                    pos0[] = {0.5,0.5};
	                    pos10[] = {0.77399999,0.76999998};
	                };
	                class ImpactPoint
	                {
	                    type = "vector";
	                    source = "ImpactPointToView";
	                    pos0[] = {0.5,0.5};
	                    pos10[] = {0.77399999,0.76999998};
	                };
	                class ImpactPointRelative
	                {
	                    type = "vector";
	                    source = "impactpointtoviewweaponRelative";
	                    pos0[] = {0.5,0.5};
	                    pos10[] = {0.77399999,0.76999998};
	                };
	                class NormalizeBombCircle
	                {
	                    type = "normalizedorsmaller";
	                    limit = 0.079999998;
	                    aspectRatio = 0.98540199;
	                };
	                class Limit0109
	                {
	                    type = "limit";
	                    limits[] = {0.1,0.1,0.89999998,0.89999998};
	                };
	                class LimitWaypoint
	                {
	                    type = "limit";
	                    limits[] = {0.2,0.1,0.80000001,0.1};
	                };
	                class WPPoint
	                {
	                    type = "vector";
	                    source = "WPPoint";
	                    pos0[] = {0.5,0.5};
	                    pos10[] = {0.77399999,0.76999998};
	                };
	                class WPPointToView: WPPoint
	                {
	                    source = "WPPointToView";
	                };
	                class Airport1
	                {
	                    type = "vector";
	                    source = "airportCorner1ToView";
	                    pos0[] = {0.5,0.5};
	                    pos10[] = {0.77399999,0.76999998};
	                };
	                class Airport2: Airport1 { source = "airportCorner2ToView"; };
	                class Airport3: Airport1 { source = "airportCorner3ToView"; };
	                class Airport4: Airport1 { source = "airportCorner4ToView"; };
	                class ILS_H
	                {
	                    type = "ils";
	                    pos0[] = {0.5,0.5};
	                    pos3[] = {0.58219999,0.5};
	                };
	                class ILS_W: ILS_H
	                {
	                    pos3[] = {0.5,0.58099997};
	                };
	                class HorizonBankRot
	                {
	                    type = "rotational";
	                    source = "horizonBank";
	                    center[] = {0.5,0.5};
	                    min = "-rad(30)";
	                    max = "rad(30)";
	                    minAngle = "180.25-30";
	                    maxAngle = "180.75+30";
	                    aspectRatio = 1;
	                };
	                class Level0: Pos10Vector
	                {
	                    pos0[] = {0.5,0.5};
	                    pos10[] = {0.884,0.88};
	                    type = "horizontoview";
	                    angle = 0;
	                };
	                class LevelP5: Level0 { angle = 5; };
	                class LevelM5: Level0 { angle = -5; };
	                class LevelP10: Level0 { angle = 10; };
	                class LevelM10: Level0 { angle = -10; };
	                class LevelP15: Level0 { angle = 15; };
	                class LevelM15: Level0 { angle = -15; };
	                class LevelP20: Level0 { angle = 20; };
	                class LevelM20: Level0 { angle = -20; };
	                class LevelP25: Level0 { angle = 25; };
	                class LevelM25: Level0 { angle = -25; };
	                class LevelP30: Level0 { angle = 30; };
	                class LevelM30: Level0 { angle = -30; };
	                class LevelP35: Level0 { angle = 35; };
	                class LevelM35: Level0 { angle = -35; };
	                class LevelP40: Level0 { angle = 40; };
	                class LevelM40: Level0 { angle = -40; };
	                class LevelP45: Level0 { angle = 45; };
	                class LevelM45: Level0 { angle = -45; };
	                class LevelP50: Level0 { angle = 50; };
	                class LevelM50: Level0 { angle = -50; };
	                class LevelP60: Level0 { angle = 60; };
	                class LevelM60: Level0 { angle = -60; };
	                class LevelP70: Level0 { angle = 70; };
	                class LevelM70: Level0 { angle = -70; };
	                class LevelP80: Level0 { angle = 80; };
	                class LevelM80: Level0 { angle = -80; };
	                class LevelP90: Level0 { angle = 90; };
	                class LevelM90: Level0 { angle = -90; };
	                class LarAmmoMax
	                {
	                    type = "linear";
	                    source = "LarAmmoMax";
	                    sourceScale = 1;
	                    min = 0;
	                    max = 1;
	                    minPos[] = {0,1};
	                    maxPos[] = {0,0};
	                };
	                class LarAmmoMin: LarAmmoMax { source = "LarAmmoMin"; };
	                class LarTargetDist: LarAmmoMax { source = "LarTargetDist"; };
	            };
	            class Draw
	            {
	                width = 1;
	                alpha = "user3";
	                color[] = {"user0","user1","user2"};
	                condition = "(1 - (cameraHeadingDiffY<=-40) + (abs(cameraHeadingDiffX)>=30))*on";
	                class VelocityLine
	                {
	                    type = "line";
	                    width = 1;
	                    points[] =
	                    {
	                        { "PlaneW", 1 },
	                        { "Velocity", 1 },
	                        {},
	                        { "Velocity", {0,-0.0049145301}, 1 },
	                        { "Velocity", {0.0024999999,-0.0042559798}, 1 },
	                        { "Velocity", {0.0043299999,-0.0024572599}, 1 },
	                        { "Velocity", {0.0049999999,0}, 1 },
	                        { "Velocity", {0.0043299999,0.0024572599}, 1 },
	                        { "Velocity", {0.0024999999,0.0042559798}, 1 },
	                        { "Velocity", {0,0.0049145301}, 1 },
	                        { "Velocity", {-0.0024999999,0.0042559798}, 1 },
	                        { "Velocity", {-0.0043299999,0.0024572599}, 1 },
	                        { "Velocity", {-0.0049999999,0}, 1 },
	                        { "Velocity", {-0.0043299999,-0.0024572599}, 1 },
	                        { "Velocity", {-0.0024999999,-0.0042559798}, 1 },
	                        { "Velocity", {0,-0.0049145301}, 1 },
	                        {}
	                    };
	                };
	                class PlaneW
	                {
	                    clipTL[] = {0,1};
	                    clipBR[] = {1,0};
	                    type = "line";
	                    width = 3;
	                    points[] =
	                    {
	                        { "PlaneOrientation", {-0.039999999,0}, 1 },
	                        { "PlaneOrientation", {-0.015,0}, 1 },
	                        { "PlaneOrientation", {-0.0074999998,0.015}, 1 },
	                        { "PlaneOrientation", {0,0}, 1 },
	                        { "PlaneOrientation", {0.0074999998,0.015}, 1 },
	                        { "PlaneOrientation", {0.015,0}, 1 },
	                        { "PlaneOrientation", {0.039999999,0}, 1 }
	                    };
	                };
	                class PlaneMovementCrosshair
	                {
	                    type = "line";
	                    width = 3;
	                    points[] =
	                    {
	                        { "Velocity", {0,-0.02}, 1 },
	                        { "Velocity", {0.0099999998,-0.01732}, 1 },
	                        { "Velocity", {0.01732,-0.0099999998}, 1 },
	                        { "Velocity", {0.02,0}, 1 },
	                        { "Velocity", {0.01732,0.0099999998}, 1 },
	                        { "Velocity", {0.0099999998,0.01732}, 1 },
	                        { "Velocity", {0,0.02}, 1 },
	                        { "Velocity", {-0.0099999998,0.01732}, 1 },
	                        { "Velocity", {-0.01732,0.0099999998}, 1 },
	                        { "Velocity", {-0.02,0}, 1 },
	                        { "Velocity", {-0.01732,-0.0099999998}, 1 },
	                        { "Velocity", {-0.0099999998,-0.01732}, 1 },
	                        { "Velocity", {0,-0.02}, 1 },
	                        {},
	                        { "Velocity", {0.039999999,0}, 1 },
	                        { "Velocity", {0.02,0}, 1 },
	                        {},
	                        { "Velocity", {-0.039999999,0}, 1 },
	                        { "Velocity", {-0.02,0}, 1 },
	                        {},
	                        { "Velocity", {0,-0.039999999}, 1 },
	                        { "Velocity", {0,-0.02}, 1 }
	                    };
	                };
	                class MachineGunCrosshairGroup
	                {
	                    type = "group";
	                    condition = "-2+(mgun+rocket)*ImpactDistance";
	                    class MachineGunCrosshair
	                    {
	                        type = "line";
	                        width = 1.5;
	                        points[] =
	                        {
	                            { "ImpactPointRelative", {0,-0.088686101}, 1 },
	                            { "ImpactPointRelative", {0,-0.078832097}, 1 },
	                            {},
	                            { "ImpactPointRelative", {0,0.088686101}, 1 },
	                            { "ImpactPointRelative", {0,0.078832097}, 1 },
	                            {},
	                            { "ImpactPointRelative", {-0.090000004,0}, 1 },
	                            { "ImpactPointRelative", {-0.079999998,0}, 1 },
	                            {},
	                            { "ImpactPointRelative", {0.090000004,0}, 1 },
	                            { "ImpactPointRelative", {0.079999998,0}, 1 },
	                            {},
	                            { "ImpactPointRelative", {0,-0.0019708001}, 1 },
	                            { "ImpactPointRelative", {0,0.0019708001}, 1 },
	                            {},
	                            { "ImpactPointRelative", {-0.0020000001,0}, 1 },
	                            { "ImpactPointRelative", {0.0020000001,0}, 1 },
	                            {}
	                        };
	                    };
	                    class Circle
	                    {
	                        type = "line";
	                        width = 4;
	                        points[] =
	                        {
	                            { "ImpactPointRelative", {0,-0.0630657}, 1 },
	                            { "ImpactPointRelative", {0,-0.078832097}, 1 },
	                            { "MissileFlightTimeRot1", {0,0.079999998}, 1, "ImpactPointRelative", 1 },
	                            { "MissileFlightTimeRot2", {0,0.079999998}, 1, "ImpactPointRelative", 1 },
	                            { "MissileFlightTimeRot3", {0,0.079999998}, 1, "ImpactPointRelative", 1 },
	                            { "MissileFlightTimeRot4", {0,0.079999998}, 1, "ImpactPointRelative", 1 },
	                            { "MissileFlightTimeRot5", {0,0.079999998}, 1, "ImpactPointRelative", 1 },
	                            { "MissileFlightTimeRot6", {0,0.079999998}, 1, "ImpactPointRelative", 1 },
	                            { "MissileFlightTimeRot7", {0,0.079999998}, 1, "ImpactPointRelative", 1 },
	                            { "MissileFlightTimeRot8", {0,0.079999998}, 1, "ImpactPointRelative", 1 },
	                            { "MissileFlightTimeRot9", {0,0.079999998}, 1, "ImpactPointRelative", 1 },
	                            { "MissileFlightTimeRot10", {0,0.079999998}, 1, "ImpactPointRelative", 1 },
	                            { "MissileFlightTimeRot11", {0,0.079999998}, 1, "ImpactPointRelative", 1 },
	                            { "MissileFlightTimeRot12", {0,0.079999998}, 1, "ImpactPointRelative", 1 },
	                            { "MissileFlightTimeRot13", {0,0.079999998}, 1, "ImpactPointRelative", 1 },
	                            { "MissileFlightTimeRot14", {0,0.079999998}, 1, "ImpactPointRelative", 1 },
	                            { "MissileFlightTimeRot15", {0,0.079999998}, 1, "ImpactPointRelative", 1 },
	                            { "MissileFlightTimeRot16", {0,0.079999998}, 1, "ImpactPointRelative", 1 },
	                            { "MissileFlightTimeRot17", {0,0.079999998}, 1, "ImpactPointRelative", 1 },
	                            { "MissileFlightTimeRot18", {0,0.079999998}, 1, "ImpactPointRelative", 1 },
	                            { "MissileFlightTimeRot19", {0,0.079999998}, 1, "ImpactPointRelative", 1 },
	                            { "MissileFlightTimeRot20", {0,0.079999998}, 1, "ImpactPointRelative", 1 },
	                            { "MissileFlightTimeRot20", {0,0.064000003}, 1, "ImpactPointRelative", 1 }
	                        };
	                    };
	                    class Circle_Min_Range
	                    {
	                        type = "line";
	                        width = 1.5;
	                        points[] =
	                        {
	                            { "ImpactPointRelative", {0,-0.078832097}, 1 },
	                            { "ImpactPointRelative", {0.013888,-0.077633902}, 1 },
	                            { "ImpactPointRelative", {0.02736,-0.0740785}, 1 },
	                            { "ImpactPointRelative", {0.039999999,-0.068268597}, 1 },
	                            { "ImpactPointRelative", {0.051424,-0.060385399}, 1 },
	                            { "ImpactPointRelative", {0.061280001,-0.050673299}, 1 },
	                            { "ImpactPointRelative", {0.069279999,-0.039416101}, 1 },
	                            { "ImpactPointRelative", {0.075176001,-0.0269606}, 1 },
	                            { "ImpactPointRelative", {0.078783996,-0.0136853}, 1 },
	                            { "ImpactPointRelative", {0.079999998,0}, 1 },
	                            { "ImpactPointRelative", {0.078783996,0.0136853}, 1 },
	                            { "ImpactPointRelative", {0.075176001,0.0269606}, 1 },
	                            { "ImpactPointRelative", {0.069279999,0.039416101}, 1 },
	                            { "ImpactPointRelative", {0.061280001,0.050673299}, 1 },
	                            { "ImpactPointRelative", {0.051424,0.060385399}, 1 },
	                            { "ImpactPointRelative", {0.039999999,0.068268597}, 1 },
	                            { "ImpactPointRelative", {0.02736,0.0740785}, 1 },
	                            { "ImpactPointRelative", {0.013888,0.077633902}, 1 },
	                            { "ImpactPointRelative", {0,0.078832097}, 1 },
	                            { "ImpactPointRelative", {-0.013888,0.077633902}, 1 },
	                            { "ImpactPointRelative", {-0.02736,0.0740785}, 1 },
	                            { "ImpactPointRelative", {-0.039999999,0.068268597}, 1 },
	                            { "ImpactPointRelative", {-0.051424,0.060385399}, 1 },
	                            { "ImpactPointRelative", {-0.061280001,0.050673299}, 1 },
	                            { "ImpactPointRelative", {-0.069279999,0.039416101}, 1 },
	                            { "ImpactPointRelative", {-0.075176001,0.0269606}, 1 },
	                            { "ImpactPointRelative", {-0.078783996,0.0136853}, 1 },
	                            { "ImpactPointRelative", {-0.079999998,0}, 1 },
	                            { "ImpactPointRelative", {-0.078783996,-0.0136853}, 1 },
	                            { "ImpactPointRelative", {-0.075176001,-0.0269606}, 1 },
	                            { "ImpactPointRelative", {-0.069279999,-0.039416101}, 1 },
	                            { "ImpactPointRelative", {-0.061280001,-0.050673299}, 1 },
	                            { "ImpactPointRelative", {-0.051424,-0.060385399}, 1 },
	                            { "ImpactPointRelative", {-0.039999999,-0.068268597}, 1 },
	                            { "ImpactPointRelative", {-0.02736,-0.0740785}, 1 },
	                            { "ImpactPointRelative", {-0.013888,-0.077633902}, 1 },
	                            { "ImpactPointRelative", {0,-0.078832097}, 1 }
	                        };
	                    };
	                    class Distance
	                    {
	                        type = "text";
	                        source = "ImpactDistance";
	                        sourceScale = 0.001;
	                        sourcePrecision = 1;
	                        max = 15;
	                        align = "center";
	                        scale = 1;
	                        pos[] = { "ImpactPointRelative", {-0.0020000001,0.11}, 1 };
	                        right[] = { "ImpactPointRelative", {0.045000002,0.11}, 1 };
	                        down[] = { "ImpactPointRelative", {-0.0020000001,0.15000001}, 1 };
	                    };
	                };
	                class AAMissileCrosshairGroup
	                {
	                    type = "group";
	                    condition = "AAmissile";
	                    class AAMissileCrosshair
	                    {
	                        type = "line";
	                        width = 4;
	                        points[] =
	                        {
	                            { "PlaneOrientation", {0,-0.24635001}, 1 },
	                            { "PlaneOrientation", {0.043400001,-0.242606}, 1 },
	                            { "PlaneOrientation", {0.085500002,-0.23149499}, 1 },
	                            { "PlaneOrientation", {0.125,-0.213339}, 1 },
	                            { "PlaneOrientation", {0.16069999,-0.188704}, 1 },
	                            { "PlaneOrientation", {0.19149999,-0.158354}, 1 },
	                            { "PlaneOrientation", {0.2165,-0.123175}, 1 },
	                            { "PlaneOrientation", {0.234925,-0.084251799}, 1 },
	                            { "PlaneOrientation", {0.2462,-0.0427664}, 1 },
	                            { "PlaneOrientation", {0.25,0}, 1 },
	                            { "PlaneOrientation", {0.2462,0.0427664}, 1 },
	                            { "PlaneOrientation", {0.234925,0.084251799}, 1 },
	                            { "PlaneOrientation", {0.2165,0.123175}, 1 },
	                            { "PlaneOrientation", {0.19149999,0.158354}, 1 },
	                            { "PlaneOrientation", {0.16069999,0.188704}, 1 },
	                            { "PlaneOrientation", {0.125,0.213339}, 1 },
	                            { "PlaneOrientation", {0.085500002,0.23149499}, 1 },
	                            { "PlaneOrientation", {0.043400001,0.242606}, 1 },
	                            { "PlaneOrientation", {0,0.24635001}, 1 },
	                            { "PlaneOrientation", {-0.043400001,0.242606}, 1 },
	                            { "PlaneOrientation", {-0.085500002,0.23149499}, 1 },
	                            { "PlaneOrientation", {-0.125,0.213339}, 1 },
	                            { "PlaneOrientation", {-0.16069999,0.188704}, 1 },
	                            { "PlaneOrientation", {-0.19149999,0.158354}, 1 },
	                            { "PlaneOrientation", {-0.2165,0.123175}, 1 },
	                            { "PlaneOrientation", {-0.234925,0.084251799}, 1 },
	                            { "PlaneOrientation", {-0.2462,0.0427664}, 1 },
	                            { "PlaneOrientation", {-0.25,0}, 1 },
	                            { "PlaneOrientation", {-0.2462,-0.0427664}, 1 },
	                            { "PlaneOrientation", {-0.234925,-0.084251799}, 1 },
	                            { "PlaneOrientation", {-0.2165,-0.123175}, 1 },
	                            { "PlaneOrientation", {-0.19149999,-0.158354}, 1 },
	                            { "PlaneOrientation", {-0.16069999,-0.188704}, 1 },
	                            { "PlaneOrientation", {-0.125,-0.213339}, 1 },
	                            { "PlaneOrientation", {-0.085500002,-0.23149499}, 1 },
	                            { "PlaneOrientation", {-0.043400001,-0.242606}, 1 },
	                            { "PlaneOrientation", {0,-0.24635001}, 1 }
	                        };
	                    };
	                    class Lines
	                    {
	                        type = "line";
	                        width = 4;
	                        points[] =
	                        {
	                            { {0.20999999,0.55000001}, 1 },
	                            { {0.19,0.55000001}, 1 },
	                            { {0.19,0.70999998}, 1 },
	                            { {0.20999999,0.70999998}, 1 },
	                            {},
	                            { {0.20999999,0.67000002}, 1 },
	                            { {0.19,0.67000002}, 1 },
	                            {},
	                            { {0.20999999,0.63}, 1 },
	                            { {0.19,0.63}, 1 },
	                            {},
	                            { {0.20999999,0.58999997}, 1 },
	                            { {0.19,0.58999997}, 1 },
	                            {},
	                            { "LarTargetDist", -0.16, {0.17,0.73000002}, 1 },
	                            { "LarTargetDist", -0.16, {0.19,0.70999998}, 1 },
	                            { "LarTargetDist", -0.16, {0.17,0.69}, 1 },
	                            {}
	                        };
	                    };
	                    class Poly
	                    {
	                        type = "polygon";
	                        points[] =
	                        {
	                            {
	                                { "LarAmmoMin", -0.16, {0.191,0.70999998}, 1 },
	                                { "LarAmmoMax", -0.16, {0.191,0.70999998}, 1 },
	                                { "LarAmmoMax", -0.16, {0.208,0.70999998}, 1 },
	                                { "LarAmmoMin", -0.16, {0.208,0.70999998}, 1 }
	                            }
	                        };
	                    };
	                    class TopText
	                    {
	                        type = "text";
	                        source = "LarTop";
	                        sourceScale = 0.001;
	                        scale = 1;
	                        pos[] = { {0.22,0.52999997}, 1 };
	                        right[] = { {0.25999999,0.52999997}, 1 };
	                        down[] = { {0.22,0.56999999}, 1 };
	                        align = "right";
	                    };
	                    class MiddleText: TopText
	                    {
	                        source = "LarTop";
	                        sourcePrecision = -1;
	                        sourceScale = 0.00050000002;
	                        pos[] = { {0.22,0.61000001}, 1 };
	                        right[] = { {0.25999999,0.61000001}, 1 };
	                        down[] = { {0.22,0.64999998}, 1 };
	                    };
	                    class SpeedText: TopText
	                    {
	                        source = "LarTargetSpeed";
	                        align = "left";
	                        sourceScale = 3.5999999;
	                        pos[] = { "LarTargetDist", -0.16, {0.16,0.69}, 1 };
	                        right[] = { "LarTargetDist", -0.16, {0.2,0.69}, 1 };
	                        down[] = { "LarTargetDist", -0.16, {0.16,0.73000002}, 1 };
	                    };
	                };
	                class ATMissileCrosshairGroup
	                {
	                    condition = "ATmissile";
	                    type = "group";
	                    class ATMissileCrosshair
	                    {
	                        type = "line";
	                        width = 4;
	                        points[] =
	                        {
	                            { "WeaponAim", {-0.15000001,-0.15000001}, 1 },
	                            { "WeaponAim", {-0.15000001,-0.13}, 1 },
	                            {},
	                            { "WeaponAim", {-0.15000001,0.15000001}, 1 },
	                            { "WeaponAim", {-0.15000001,0.13}, 1 },
	                            {},
	                            { "WeaponAim", {0.15000001,-0.15000001}, 1 },
	                            { "WeaponAim", {0.15000001,-0.13}, 1 },
	                            {},
	                            { "WeaponAim", {0.15000001,0.15000001}, 1 },
	                            { "WeaponAim", {0.15000001,0.13}, 1 },
	                            {},
	                            { "WeaponAim", {-0.15000001,-0.15000001}, 1 },
	                            { "WeaponAim", {-0.13,-0.15000001}, 1 },
	                            {},
	                            { "WeaponAim", {-0.15000001,0.15000001}, 1 },
	                            { "WeaponAim", {-0.13,0.15000001}, 1 },
	                            {},
	                            { "WeaponAim", {0.15000001,-0.15000001}, 1 },
	                            { "WeaponAim", {0.13,-0.15000001}, 1 },
	                            {},
	                            { "WeaponAim", {0.15000001,0.15000001}, 1 },
	                            { "WeaponAim", {0.13,0.15000001}, 1 }
	                        };
	                    };
	                };
	                class RocketCrosshairGroup
	                {
	                    type = "group";
	                    condition = "Rocket";
	                    class MachineGunCrosshair
	                    {
	                        type = "line";
	                        width = 3;
	                        points[] =
	                        {
	                            { "ImpactPoint", {0,-0.039416101}, 1 },
	                            { "ImpactPoint", {0,-0.019708}, 1 },
	                            {},
	                            { "ImpactPoint", {0,0.039416101}, 1 },
	                            { "ImpactPoint", {0,0.019708}, 1 },
	                            {},
	                            { "ImpactPoint", {-0.039999999,0}, 1 },
	                            { "ImpactPoint", {-0.02,0}, 1 },
	                            {},
	                            { "ImpactPoint", {0.039999999,0}, 1 },
	                            { "ImpactPoint", {0.02,0}, 1 },
	                            {},
	                            { "ImpactPoint", {0.0099999998,-0.039416101}, 1 },
	                            { "ImpactPoint", {-0.0099999998,-0.039416101}, 1 },
	                            {},
	                            { "ImpactPoint", {0,-0.0019708001}, 1 },
	                            { "ImpactPoint", {0,0.0019708001}, 1 },
	                            {},
	                            { "ImpactPoint", {-0.0020000001,0}, 1 },
	                            { "ImpactPoint", {0.0020000001,0}, 1 },
	                            {}
	                        };
	                    };
	                    class Distance
	                    {
	                        type = "text";
	                        source = "ImpactDistance";
	                        sourceScale = 0.001;
	                        sourcePrecision = 1;
	                        max = 15;
	                        align = "center";
	                        scale = 1;
	                        pos[] = { "ImpactPoint", {-0.0020000001,0.07}, 1 };
	                        right[] = { "ImpactPoint", {0.045000002,0.07}, 1 };
	                        down[] = { "ImpactPoint", {-0.0020000001,0.11}, 1 };
	                    };
	                };
	                class BombCrosshairGroup
	                {
	                    type = "group";
	                    condition = "bomb";
	                    class BombCrosshair
	                    {
	                        width = 4;
	                        type = "line";
	                        points[] =
	                        {
	                            { "ImpactPoint", {0,0.088686101}, 1 },
	                            { "ImpactPoint", {0,0.078832097}, 1 },
	                            {},
	                            { "ImpactPoint", {-0.090000004,0}, 1 },
	                            { "ImpactPoint", {-0.079999998,0}, 1 },
	                            {},
	                            { "ImpactPoint", {0.090000004,0}, 1 },
	                            { "ImpactPoint", {0.079999998,0}, 1 },
	                            {},
	                            { "ImpactPoint", {0,-0.0019708001}, 1 },
	                            { "ImpactPoint", {0,0.0019708001}, 1 },
	                            {},
	                            { "ImpactPoint", {-0.0020000001,0}, 1 },
	                            { "ImpactPoint", {0.0020000001,0}, 1 },
	                            {},
	                            { "ImpactPoint", {0,-0.078832097}, 1 },
	                            { "ImpactPoint", {0.013888,-0.077633902}, 1 },
	                            { "ImpactPoint", {0.02736,-0.0740785}, 1 },
	                            { "ImpactPoint", {0.039999999,-0.068268597}, 1 },
	                            { "ImpactPoint", {0.051424,-0.060385399}, 1 },
	                            { "ImpactPoint", {0.061280001,-0.050673299}, 1 },
	                            { "ImpactPoint", {0.069279999,-0.039416101}, 1 },
	                            { "ImpactPoint", {0.075176001,-0.0269606}, 1 },
	                            { "ImpactPoint", {0.078783996,-0.0136853}, 1 },
	                            { "ImpactPoint", {0.079999998,0}, 1 },
	                            { "ImpactPoint", {0.078783996,0.0136853}, 1 },
	                            { "ImpactPoint", {0.075176001,0.0269606}, 1 },
	                            { "ImpactPoint", {0.069279999,0.039416101}, 1 },
	                            { "ImpactPoint", {0.061280001,0.050673299}, 1 },
	                            { "ImpactPoint", {0.051424,0.060385399}, 1 },
	                            { "ImpactPoint", {0.039999999,0.068268597}, 1 },
	                            { "ImpactPoint", {0.02736,0.0740785}, 1 },
	                            { "ImpactPoint", {0.013888,0.077633902}, 1 },
	                            { "ImpactPoint", {0,0.078832097}, 1 },
	                            { "ImpactPoint", {-0.013888,0.077633902}, 1 },
	                            { "ImpactPoint", {-0.02736,0.0740785}, 1 },
	                            { "ImpactPoint", {-0.039999999,0.068268597}, 1 },
	                            { "ImpactPoint", {-0.051424,0.060385399}, 1 },
	                            { "ImpactPoint", {-0.061280001,0.050673299}, 1 },
	                            { "ImpactPoint", {-0.069279999,0.039416101}, 1 },
	                            { "ImpactPoint", {-0.075176001,0.0269606}, 1 },
	                            { "ImpactPoint", {-0.078783996,0.0136853}, 1 },
	                            { "ImpactPoint", {-0.079999998,0}, 1 },
	                            { "ImpactPoint", {-0.078783996,-0.0136853}, 1 },
	                            { "ImpactPoint", {-0.075176001,-0.0269606}, 1 },
	                            { "ImpactPoint", {-0.069279999,-0.039416101}, 1 },
	                            { "ImpactPoint", {-0.061280001,-0.050673299}, 1 },
	                            { "ImpactPoint", {-0.051424,-0.060385399}, 1 },
	                            { "ImpactPoint", {-0.039999999,-0.068268597}, 1 },
	                            { "ImpactPoint", {-0.02736,-0.0740785}, 1 },
	                            { "ImpactPoint", {-0.013888,-0.077633902}, 1 },
	                            { "ImpactPoint", {0,-0.078832097}, 1 },
	                            {},
	                            {},
	                            { "ImpactPoint", -1, "Velocity", 1, "NormalizeBombCircle", 1, "ImpactPoint", 1, {0,0}, 1 },
	                            { "Velocity", 1, "Limit0109", 1, {0,0}, 1 }
	                        };
	                    };
	                    class Circle
	                    {
	                        type = "line";
	                        width = 6;
	                        points[] =
	                        {
	                            { "ImpactPoint", {0,-0.0630657}, 1 },
	                            { "ImpactPoint", {0,-0.078832097}, 1 },
	                            { "MissileFlightTimeRot1", {0,0.079999998}, 1, "ImpactPoint", 1 },
	                            { "MissileFlightTimeRot2", {0,0.079999998}, 1, "ImpactPoint", 1 },
	                            { "MissileFlightTimeRot3", {0,0.079999998}, 1, "ImpactPoint", 1 },
	                            { "MissileFlightTimeRot4", {0,0.079999998}, 1, "ImpactPoint", 1 },
	                            { "MissileFlightTimeRot5", {0,0.079999998}, 1, "ImpactPoint", 1 },
	                            { "MissileFlightTimeRot6", {0,0.079999998}, 1, "ImpactPoint", 1 },
	                            { "MissileFlightTimeRot7", {0,0.079999998}, 1, "ImpactPoint", 1 },
	                            { "MissileFlightTimeRot8", {0,0.079999998}, 1, "ImpactPoint", 1 },
	                            { "MissileFlightTimeRot9", {0,0.079999998}, 1, "ImpactPoint", 1 },
	                            { "MissileFlightTimeRot10", {0,0.079999998}, 1, "ImpactPoint", 1 },
	                            { "MissileFlightTimeRot11", {0,0.079999998}, 1, "ImpactPoint", 1 },
	                            { "MissileFlightTimeRot12", {0,0.079999998}, 1, "ImpactPoint", 1 },
	                            { "MissileFlightTimeRot13", {0,0.079999998}, 1, "ImpactPoint", 1 },
	                            { "MissileFlightTimeRot14", {0,0.079999998}, 1, "ImpactPoint", 1 },
	                            { "MissileFlightTimeRot15", {0,0.079999998}, 1, "ImpactPoint", 1 },
	                            { "MissileFlightTimeRot16", {0,0.079999998}, 1, "ImpactPoint", 1 },
	                            { "MissileFlightTimeRot17", {0,0.079999998}, 1, "ImpactPoint", 1 },
	                            { "MissileFlightTimeRot18", {0,0.079999998}, 1, "ImpactPoint", 1 },
	                            { "MissileFlightTimeRot19", {0,0.079999998}, 1, "ImpactPoint", 1 },
	                            { "MissileFlightTimeRot20", {0,0.079999998}, 1, "ImpactPoint", 1 },
	                            { "MissileFlightTimeRot20", {0,0.064000003}, 1, "ImpactPoint", 1 }
	                        };
	                    };
	                    class Distance
	                    {
	                        type = "text";
	                        source = "ImpactDistance";
	                        sourceScale = 0.001;
	                        sourcePrecision = 1;
	                        max = 15;
	                        align = "center";
	                        scale = 1;
	                        pos[] = { "ImpactPoint", {-0.0020000001,0.11}, 1 };
	                        right[] = { "ImpactPoint", {0.045000002,0.11}, 1 };
	                        down[] = { "ImpactPoint", {-0.0020000001,0.15000001}, 1 };
	                    };
	                };
	                class WeaponsText
	                {
	                    condition = "1- mgun";
	                    class WeaponsText
	                    {
	                        type = "text";
	                        source = "weapon";
	                        sourceScale = 1;
	                        align = "right";
	                        scale = 1;
	                        pos[] = { {0.032000002,0.83999997}, 1 };
	                        right[] = { {0.086999997,0.83999997}, 1 };
	                        down[] = { {0.032000002,0.88499999}, 1 };
	                    };
	                };
	                class MGunText
	                {
	                    condition = "mgun";
	                    class WeaponsText
	                    {
	                        type = "text";
	                        source = "static";
	                        text = "GUN";
	                        sourceScale = 1;
	                        align = "right";
	                        scale = 1;
	                        pos[] = { {0.032000002,0.83999997}, 1 };
	                        right[] = { {0.086999997,0.83999997}, 1 };
	                        down[] = { {0.032000002,0.88499999}, 1 };
	                    };
	                };
	                class AmmoText
	                {
	                    type = "text";
	                    source = "ammo";
	                    sourceScale = 1;
	                    align = "right";
	                    scale = 1;
	                    pos[] = { {0.032000002,0.88}, 1 };
	                    right[] = { {0.086999997,0.88}, 1 };
	                    down[] = { {0.032000002,0.92500001}, 1 };
	                };
	                class Laser
	                {
	                    condition = "laseron";
	                    class LaserText
	                    {
	                        type = "text";
	                        source = "static";
	                        text = "LASER";
	                        align = "left";
	                        scale = 1;
	                        pos[] = { {0.93199998,0.80000001}, 1 };
	                        right[] = { {0.98699999,0.80000001}, 1 };
	                        down[] = { {0.93199998,0.84500003}, 1 };
	                    };
	                };
	                class ILS
	                {
	                    condition = "ils";
	                    class GearText
	                    {
	                        type = "text";
	                        source = "static";
	                        text = "GEAR";
	                        align = "left";
	                        scale = 1;
	                        pos[] = { {0.93199998,0.80000001}, 1 };
	                        right[] = { {0.98699999,0.80000001}, 1 };
	                        down[] = { {0.93199998,0.84500003}, 1 };
	                    };
	                    class Glideslope
	                    {
	                        clipTL[] = {0,0};
	                        clipBR[] = {1,1};
	                        class ILS
	                        {
	                            type = "line";
	                            width = 2;
	                            points[] =
	                            {
	                                { "ILS_W", {-0.12,0}, 1 },
	                                { "ILS_W", {0.12,0}, 1 },
	                                {},
	                                { "ILS_W", {-0.12,-0.0118248}, 1 },
	                                { "ILS_W", {-0.12,0.0118248}, 1 },
	                                {},
	                                { "ILS_W", {-0.059999999,-0.0088686096}, 1 },
	                                { "ILS_W", {-0.059999999,0.0088686096}, 1 },
	                                {},
	                                { "ILS_W", {0,-0.0118248}, 1 },
	                                { "ILS_W", {0,0.0118248}, 1 },
	                                {},
	                                { "ILS_W", {0.059999999,-0.0088686096}, 1 },
	                                { "ILS_W", {0.059999999,0.0088686096}, 1 },
	                                {},
	                                { "ILS_W", {0.12,-0.0118248}, 1 },
	                                { "ILS_W", {0.12,0.0118248}, 1 },
	                                {},
	                                { "ILS_H", {0,-0.118248}, 1 },
	                                { "ILS_H", {0,0.118248}, 1 },
	                                {},
	                                { "ILS_H", {-0.012,-0.118248}, 1 },
	                                { "ILS_H", {0.012,-0.118248}, 1 },
	                                {},
	                                { "ILS_H", {-0.0089999996,-0.059124101}, 1 },
	                                { "ILS_H", {0.0089999996,-0.059124101}, 1 },
	                                {},
	                                { "ILS_H", {-0.012,0}, 1 },
	                                { "ILS_H", {0.012,0}, 1 },
	                                {},
	                                { "ILS_H", {-0.0089999996,0.059124101}, 1 },
	                                { "ILS_H", {0.0089999996,0.059124101}, 1 },
	                                {},
	                                { "ILS_H", {-0.012,0.118248}, 1 },
	                                { "ILS_H", {0.012,0.118248}, 1 }
	                            };
	                        };
	                        class airport
	                        {
	                            type = "line";
	                            points[] =
	                            {
	                                { "airport1", 1 },
	                                { "airport2", 1 },
	                                { "airport4", 1 },
	                                { "airport3", 1 },
	                                { "airport1", 1 }
	                            };
	                        };
	                    };
	                };
	                class TargetLocking
	                {
	                    condition = "missilelocking";
	                    blinkingPattern[] = {0.2,0.2};
	                    blinkingStartsOn = 1;
	                    class shape
	                    {
	                        type = "line";
	                        width = 4;
	                        points[] =
	                        {
	                            { "Target", 1, "Limit0109", 1, {0,-0.029562}, 1 },
	                            { "Target", 1, "Limit0109", 1, {0.029999999,0}, 1 },
	                            { "Target", 1, "Limit0109", 1, {0,0.029562}, 1 },
	                            { "Target", 1, "Limit0109", 1, {-0.029999999,0}, 1 },
	                            { "Target", 1, "Limit0109", 1, {0,-0.029562}, 1 }
	                        };
	                    };
	                };
	                class TargetLocked
	                {
	                    condition = "missilelocked";
	                    class shape
	                    {
	                        type = "line";
	                        width = 4;
	                        points[] =
	                        {
	                            { "Target", 1, "Limit0109", 1, {0,-0.029562}, 1 },
	                            { "Target", 1, "Limit0109", 1, {0.029999999,0}, 1 },
	                            { "Target", 1, "Limit0109", 1, {0,0.029562}, 1 },
	                            { "Target", 1, "Limit0109", 1, {-0.029999999,0}, 1 },
	                            { "Target", 1, "Limit0109", 1, {0,-0.029562}, 1 }
	                        };
	                    };
	                };
	                class IncomingMissile
	                {
	                    condition = "incomingmissile";
	                    blinkingPattern[] = {0.30000001,0.30000001};
	                    blinkingStartsOn = 1;
	                    color[] = {1,0,0};
	                    class Text
	                    {
	                        type = "text";
	                        source = "static";
	                        text = "!INCOMING MISSILE!";
	                        align = "center";
	                        scale = 1;
	                        pos[] = { {0.48500001,0.21678799}, 1 };
	                        right[] = { {0.54500002,0.21678799}, 1 };
	                        down[] = { {0.48500001,0.266058}, 1 };
	                    };
	                };
	                class TargetingPodGroup
	                {
	                    condition = "1-pilotcameralock";
	                    class TargetingPodDir
	                    {
	                        type = "line";
	                        width = 3;
	                        points[] =
	                        {
	                            { "TargetingPodDir", 1, {0.020805599,0.0040780702}, 1 },
	                            { "TargetingPodDir", 1, {0.020805599,-0.0040780702}, 1 },
	                            {},
	                            { "TargetingPodDir", 1, {0.0176381,-0.0116134}, 1 },
	                            { "TargetingPodDir", 1, {0.0117854,-0.017380601}, 1 },
	                            {},
	                            { "TargetingPodDir", 1, {0.0041384902,-0.0205019}, 1 },
	                            { "TargetingPodDir", 1, {-0.0041384902,-0.0205019}, 1 },
	                            {},
	                            { "TargetingPodDir", 1, {-0.0117854,-0.017380601}, 1 },
	                            { "TargetingPodDir", 1, {-0.0176381,-0.0116134}, 1 },
	                            {},
	                            { "TargetingPodDir", 1, {-0.020805599,-0.0040780702}, 1 },
	                            { "TargetingPodDir", 1, {-0.020805599,0.0040780799}, 1 },
	                            {},
	                            { "TargetingPodDir", 1, {-0.0176381,0.0116134}, 1 },
	                            { "TargetingPodDir", 1, {-0.0117854,0.017380601}, 1 },
	                            {},
	                            { "TargetingPodDir", 1, {-0.0041384902,0.0205019}, 1 },
	                            { "TargetingPodDir", 1, {0.0041384902,0.0205019}, 1 },
	                            {},
	                            { "TargetingPodDir", 1, {0.0117854,0.017380601}, 1 },
	                            { "TargetingPodDir", 1, {0.0176381,0.0116134}, 1 },
	                            {},
	                            { "TargetingPodDir", 1, {0.020805599,0.0040780702}, 1 },
	                            { "TargetingPodDir", 1, {0.020805599,-0.0040780799}, 1 },
	                            {},
	                            { "TargetingPodDir", 1, {0.0176381,-0.0116134}, 1 },
	                            { "TargetingPodDir", 1, {0.0117854,-0.0173807}, 1 },
	                            {},
	                            { "TargetingPodDir", 1, {0.0041384902,-0.0205019}, 1 },
	                            { "TargetingPodDir", 1, {-0.0041385,-0.0205019}, 1 },
	                            {},
	                            { "TargetingPodDir", 1, {-0.0117854,-0.017380601}, 1 },
	                            { "TargetingPodDir", 1, {-0.0176381,-0.0116134}, 1 },
	                            {},
	                            {}
	                        };
	                    };
	                };
	                class TargetingPodGroupOn
	                {
	                    condition = "pilotcameralock";
	                    class TargetingPodDir
	                    {
	                        type = "line";
	                        width = 3;
	                        points[] =
	                        {
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {0.020805599,0.0040780702}, 1 },
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {0.020805599,-0.0040780702}, 1 },
	                            {},
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {0.0176381,-0.0116134}, 1 },
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {0.0117854,-0.017380601}, 1 },
	                            {},
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {0.0041384902,-0.0205019}, 1 },
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {-0.0041384902,-0.0205019}, 1 },
	                            {},
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {-0.0117854,-0.017380601}, 1 },
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {-0.0176381,-0.0116134}, 1 },
	                            {},
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {-0.020805599,-0.0040780702}, 1 },
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {-0.020805599,0.0040780799}, 1 },
	                            {},
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {-0.0176381,0.0116134}, 1 },
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {-0.0117854,0.017380601}, 1 },
	                            {},
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {-0.0041384902,0.0205019}, 1 },
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {0.0041384902,0.0205019}, 1 },
	                            {},
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {0.0117854,0.017380601}, 1 },
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {0.0176381,0.0116134}, 1 },
	                            {},
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {0.020805599,0.0040780702}, 1 },
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {0.020805599,-0.0040780799}, 1 },
	                            {},
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {0.0176381,-0.0116134}, 1 },
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {0.0117854,-0.0173807}, 1 },
	                            {},
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {0.0041384902,-0.0205019}, 1 },
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {-0.0041385,-0.0205019}, 1 },
	                            {},
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {-0.0117854,-0.017380601}, 1 },
	                            { "TargetingPodTarget", 1, "Limit0109", 1, {-0.0176381,-0.0116134}, 1 },
	                            {},
	                            {}
	                        };
	                    };
	                };
	                class MainCenterLine1
	                {
	                    type = "line";
	                    width = 3;
	                    points[] =
	                    {
	                        { "PlaneW", { -0.49000001, "0 + 0.025" }, 1 },
	                        { "PlaneW", { -0.49000001, 0 }, 1 },
	                        { "PlaneW", { -0.44999999, 0 }, 1 }
	                    };
	                };
	                class MainCenterLine2
	                {
	                    type = "line";
	                    width = 3;
	                    points[] =
	                    {
	                        { "PlaneW", { -0.33000001, 0 }, 1 },
	                        { "PlaneW", { -0.25, 0 }, 1 }
	                    };
	                };
	                class MainCenterLine3
	                {
	                    type = "line";
	                    width = 3;
	                    points[] =
	                    {
	                        { "PlaneW", { 0.49000001, "0 + 0.025" }, 1 },
	                        { "PlaneW", { 0.49000001, 0 }, 1 },
	                        { "PlaneW", { 0.25, 0 }, 1 }
	                    };
	                };
	                class SpeedIndicatorBox
	                {
	                    type = "line";
	                    width = 3;
	                    points[] =
	                    {
	                        { "PlaneW", { -0.49000001, -0.25 }, 1 },
	                        { "PlaneW", { -0.49000001, -0.2 }, 1 },
	                        { "PlaneW", { -0.30000001, -0.2 }, 1 },
	                        { "PlaneW", { -0.30000001, -0.25 }, 1 },
	                        { "PlaneW", { -0.49000001, -0.25 }, 1 }
	                    };
	                };
	                class BrakesWarn
	                {
	                    type = "text";
	                    source = "userText";
	                    sourceScale = 1;
	                    sourceIndex = 5;
	                    align = "center";
	                    scale = 1;
	                    pos[] = { "PlaneW", { -0.38, -0.30000001 }, 1 };
	                    right[] = { "PlaneW", { "-0.38 + 0.05", -0.30000001 }, 1 };
	                    down[] = { "PlaneW", { -0.38, "-0.3 + 0.05" }, 1 };
	                };
	                // Thrust vectoring indicators
	                class ThrottleNumber
	                {
	                    type = "text";
	                    source = "throttle";
	                    sourceScale = 100;
	                    align = "left";
	                    scale = 1;
	                    pos[] = { "PlaneW", { 0.40000001, -0.075999998 }, 1 };
	                    right[] = { "PlaneW", { "0.4 + 0.04", -0.075999998 }, 1 };
	                    down[] = { "PlaneW", { 0.40000001, "-0.076 + 0.05" }, 1 };
	                };
	                class ThrottleText
	                {
	                    type = "text";
	                    source = "static";
	                    text = "%";
	                    scale = 1;
	                    sourceScale = 1;
	                    align = "right";
	                    pos[] = { "PlaneW", { 0.43000001, -0.075999998 }, 1 };
	                    right[] = { "PlaneW", { "0.43 + 0.04", -0.075999998 }, 1 };
	                    down[] = { "PlaneW", { 0.43000001, "-0.076 + 0.05" }, 1 };
	                };
	                class ThrustVectoring
	                {
	                    condition = "1+vtolvectoring";
	                    class VectoringNumber
	                    {
	                        type = "text";
	                        source = "vtolvectoring";
	                        sourceScale = 90;
	                        align = "left";
	                        scale = 1;
	                        pos[] = { {0.88,0.5}, 1 };
	                        right[] = { {0.93000001,0.5}, 1 };
	                        down[] = { {0.88,0.53500003}, 1 };
	                    };
	                    class VectoringArrow
	                    {
	                        type = "line";
	                        width = 3;
	                        points[] =
	                        {
	                            { "ThrustVectoringRotation", { -0.034000002, -0.0060000001 }, 1 },
	                            { "ThrustVectoringRotation", { -0.044, 0 }, 1 },
	                            { "ThrustVectoringRotation", { -0.034000002, 0.0060000001 }, 1 },
	                            { "ThrustVectoringRotation", { -0.034000002, -0.0060000001 }, 1 },
	                            {},
	                            { "ThrustVectoringRotation", { -0.044, 0 }, 1 },
	                            { "ThrustVectoringRotation", { -0.0040000002, 0 }, 1 },
	                            {}
	                        };
	                    };
	                };
	                class ThrustVectoringAuto
	                {
	                    condition = "-vtolvectoring";
	                    class VectoringText
	                    {
	                        type = "text";
	                        source = "static";
	                        text = "AUTO";
	                        align = "left";
	                        scale = 1;
	                        pos[] = { {0.889,0.54000002}, 1 };
	                        right[] = { {0.93900001,0.54000002}, 1 };
	                        down[] = { {0.889,0.57499999}, 1 };
	                    };
	                };
	                class AlphaNumber
	                {
	                    type = "text";
	                    source = "AoA";
	                    sourceScale = 57.295799;
	                    align = "right";
	                    scale = 1;
	                    pos[] = { "PlaneW", { -0.38999999, 0.162 }, 1 };
	                    right[] = { "PlaneW", { "-0.39 + 0.04", 0.162 }, 1 };
	                    down[] = { "PlaneW", { -0.38999999, "0.162 + 0.05" }, 1 };
	                };
	                class AlphaText
	                {
	                    type = "text";
	                    source = "static";
	                    text = "AoA:";
	                    align = "left";
	                    scale = 1;
	                    pos[] = { "PlaneW", { -0.41, 0.162 }, 1 };
	                    right[] = { "PlaneW", { "-0.41 + 0.04", 0.162 }, 1 };
	                    down[] = { "PlaneW", { -0.41, "0.162 + 0.05" }, 1 };
	                };
	                class GGroup
	                {
	                    type = "group";
	                    condition = "on";
	                    class GNumber
	                    {
	                        type = "text";
	                        source = "userText";
	                        sourceScale = 1;
	                        sourceIndex = 4;
	                        align = "right";
	                        scale = 1;
	                        pos[] = { "PlaneW", { -0.38999999, 0.213 }, 1 };
	                        right[] = { "PlaneW", { "-0.39 + 0.04", 0.213 }, 1 };
	                        down[] = { "PlaneW", { -0.38999999, "0.213 + 0.05" }, 1 };
	                    };
	                    class GText
	                    {
	                        type = "text";
	                        source = "static";
	                        text = "G:";
	                        align = "left";
	                        scale = 1;
	                        pos[] = { "PlaneW", { -0.41, 0.213 }, 1 };
	                        right[] = { "PlaneW", { "-0.41 + 0.04", 0.213 }, 1 };
	                        down[] = { "PlaneW", { -0.41, "0.213 + 0.05" }, 1 };
	                    };
	                };
	                class SpeedGroup
	                {
	                    type = "group";
	                    condition = "on";
	                    class SpeedNumber
	                    {
	                        type = "text";
	                        source = "speed";
	                        sourceScale = 3.5999999;
	                        align = "center";
	                        scale = 1;
	                        pos[] = { "PlaneW", { -0.40000001, -0.25 }, 1 };
	                        right[] = { "PlaneW", { -0.30000001, -0.25 }, 1 };
	                        down[] = { "PlaneW", { -0.40000001, -0.2 }, 1 };
	                    };
	                };
	                class Grid
	                {
	                    condition = "on";
	                    class CoordXNumber
	                    {
	                        type = "text";
	                        source = "coordinateX";
	                        sourceScale = 0.0099999998;
	                        sourceLength = 3;
	                        sourceOffset = -0.5;
	                        align = "left";
	                        scale = 1;
	                        pos[] = { {0.90600002,0.85399997}, 1 };
	                        right[] = { {0.954,0.85399997}, 1 };
	                        down[] = { {0.90600002,0.89899999}, 1 };
	                    };
	                    class CoordYNumber: CoordXNumber
	                    {
	                        source = "coordinateY";
	                        align = "right";
	                        pos[] = { {0.92199999,0.85399997}, 1 };
	                        right[] = { {0.96700001,0.85399997}, 1 };
	                        down[] = { {0.92199999,0.89899999}, 1 };
	                    };
	                    class Time: CoordXNumber
	                    {
	                        source = "time";
	                        text = "%X";
	                        align = "center";
	                        pos[] = { {0.90700001,0.88}, 1 };
	                        right[] = { {0.95499998,0.88}, 1 };
	                        down[] = { {0.90700001,0.92500001}, 1 };
	                    };
	                };
	                class AltitudeIndicatorBox
	                {
	                    type = "line";
	                    width = 3;
	                    points[] =
	                    {
	                        { "PlaneW", {0.49000001,-0.25}, 1 },
	                        { "PlaneW", {0.49000001,-0.2}, 1 },
	                        { "PlaneW", {0.30000001,-0.2}, 1 },
	                        { "PlaneW", {0.30000001,-0.25}, 1 },
	                        { "PlaneW", {0.49000001,-0.25}, 1 }
	                    };
	                };
	                class AltitudeNumberASL
	                {
	                    type = "text";
	                    source = "altitudeASL";
	                    sourceScale = 1;
	                    align = "center";
	                    scale = 1;
	                    pos[] = { "PlaneW", {0.40000001,-0.25}, 1 };
	                    right[] = { "PlaneW", {0.47999999,-0.25}, 1 };
	                    down[] = { "PlaneW", {0.40000001,-0.2}, 1 };
	                };
	                class AltitudeRadarText
	                {
	                    type = "text";
	                    source = "static";
	                    text = "R";
	                    align = "left";
	                    scale = 1;
	                    sourceScale = 1;
	                    pos[] = { "PlaneW", {0.31999999,-0.192}, 1 };
	                    right[] = { "PlaneW", { "+0.32 + 0.04", -0.192 }, 1 };
	                    down[] = { "PlaneW", { 0.31999999, "-0.192 + 0.041" }, 1 };
	                };
	                class AltitudeNumberAGL
	                {
	                    type = "text";
	                    source = "altitudeAGL";
	                    sourceScale = 1;
	                    sourceLength = 4;
	                    sourceOffset = -2;
	                    align = "left";
	                    scale = 1;
	                    pos[] = { "PlaneW", {0.47999999,-0.19}, 1 };
	                    right[] = { "PlaneW", {0.54000002,-0.19}, 1 };
	                    down[] = { "PlaneW", {0.47999999,-0.15000001}, 1 };
	                };
	                class PitchNumber
	                {
	                    type = "text";
	                    source = "horizonDive";
	                    sourceScale = 57.295799;
	                    align = "right";
	                    scale = 1;
	                    pos[] = { "PlaneW", { -0.38999999, -0.075999998 }, 1 };
	                    right[] = { "PlaneW", { "-0.39 + 0.04", -0.075999998 }, 1 };
	                    down[] = { "PlaneW", { -0.38999999, "-0.076 + 0.05" }, 1 };
	                };
	                class PitchText
	                {
	                    type = "text";
	                    source = "static";
	                    text = "P:";
	                    align = "left";
	                    scale = 1;
	                    pos[] = { "PlaneW", { -0.41, -0.075999998 }, 1 };
	                    right[] = { "PlaneW", { "-0.41 + 0.04", -0.075999998 }, 1 };
	                    down[] = { "PlaneW", { -0.41, "-0.076 + 0.05" }, 1 };
	                };
	                class RollNumber
	                {
	                    type = "text";
	                    source = "horizonBank";
	                    sourceScale = 57.295799;
	                    align = "right";
	                    scale = 1;
	                    pos[] = { "PlaneW", { -0.38999999, -0.025 }, 1 };
	                    right[] = { "PlaneW", { "-0.39 + 0.04", -0.025 }, 1 };
	                    down[] = { "PlaneW", { -0.38999999, "-0.025 + 0.05" }, 1 };
	                };
	                class RollText
	                {
	                    type = "text";
	                    source = "static";
	                    text = "R:";
	                    align = "left";
	                    scale = 1;
	                    pos[] = { "PlaneW", { -0.41, -0.025 }, 1 };
	                    right[] = { "PlaneW", { "-0.41 + 0.04", -0.025 }, 1 };
	                    down[] = { "PlaneW", { -0.41, "-0.025 + 0.05" }, 1 };
	                };
	                class ClimbNumber
	                {
	                    type = "text";
	                    source = "vspeed";
	                    sourceScale = 1;
	                    align = "right";
	                    scale = 1;
	                    pos[] = { "PlaneW", { -0.38999999, 0.026000001 }, 1 };
	                    right[] = { "PlaneW", { "-0.39 + 0.04", 0.026000001 }, 1 };
	                    down[] = { "PlaneW", { -0.38999999, "+0.026 + 0.05" }, 1 };
	                };
	                class ClimbText
	                {
	                    type = "text";
	                    source = "static";
	                    text = "C:";
	                    align = "left";
	                    scale = 1;
	                    pos[] = { "PlaneW", { -0.41, 0.026000001 }, 1 };
	                    right[] = { "PlaneW", { "-0.41 + 0.04", 0.026000001 }, 1 };
	                    down[] = { "PlaneW", { -0.41, "+0.026 + 0.05" }, 1 };
	                };
	                class HeadingArrow
	                {
	                    type = "line";
	                    width = 3;
	                    points[] =
	                    {
	                        { "WPPoint", 1, "LimitWaypoint", 1, { -0.02, 0.041999999 }, 1 },
	                        { "WPPoint", 1, "LimitWaypoint", 1, { 0, 0.022 }, 1 },
	                        { "WPPoint", 1, "LimitWaypoint", 1, { 0.02, 0.041999999 }, 1 }
	                    };
	                };
	                class WP
	                {
	                    condition = "wpvalid";
	                    class WPdist
	                    {
	                        type = "text";
	                        source = "wpdist";
	                        sourceScale = 0.001;
	                        sourcePrecision = 1;
	                        align = "right";
	                        scale = 1;
	                        pos[] = { {0.92400002,0.60501802}, 1 };
	                        down[] = { {0.92400002,0.64246398}, 1 };
	                        right[] = { {0.96399999,0.60501802}, 1 };
	                    };
	                    class WPIndex
	                    {
	                        type = "text";
	                        source = "wpIndex";
	                        sourceScale = 1;
	                        sourceLength = 2;
	                        align = "right";
	                        scale = 1;
	                        pos[] = { {0.87699997,0.60501802}, 1 };
	                        right[] = { {0.917,0.60501802}, 1 };
	                        down[] = { {0.87699997,0.64246398}, 1 };
	                    };
	                    class WPstatic
	                    {
	                        type = "text";
	                        source = "static";
	                        text = "WP";
	                        scale = 1;
	                        sourceScale = 1;
	                        align = "right";
	                        pos[] = { { "0.825+0.01", 0.60650003 }, 1 };
	                        right[] = { {0.875,0.60650003}, 1 };
	                        down[] = { { "0.825+0.01", 0.6415 }, 1 };
	                    };
	                    class WPKM
	                    {
	                        type = "text";
	                        source = "static";
	                        text = ":";
	                        scale = 1;
	                        sourceScale = 1;
	                        align = "left";
	                        pos[] = { { "0.825+0.09", 0.60650003 }, 1 };
	                        right[] = { {0.95499998,0.60650003}, 1 };
	                        down[] = { { "0.825+0.09", 0.6415 }, 1 };
	                    };
						class WP
						{
							width=1;
							type="line";
							points[]=
							{
								
								{
									"wppoint",
									1,
									
									{
										"HorizonBankRotFull",
										0.015,
										-0.035
									},
									1
								},
								
								{
									"wppoint",
									1,
									
									{
										"HorizonBankRotFull",
										0,
										0
									},
									1
								},
								
								{
									"wppoint",
									1,
									
									{
										"HorizonBankRotFull",
										-0.015,
										-0.035
									},
									1
								}
							};
						};
	                };
	                class HeadingRotation
	                {
	                    condition = "abs(cameraDir-heading)*( (abs(heading-cameraDir))<=355)-5";
	                    class HeadingHeadNumber
	                    {
	                        type = "text";
	                        source = "cameraDir";
	                        sourceScale = 1;
	                        align = "center";
	                        scale = 1;
	                        pos[] = { { "0.80-0.302", "0.082+0.065" }, 1 };
	                        right[] = { { "0.83-0.302", "0.082+0.065" }, 1 };
	                        down[] = { { "0.80-0.302", "0.113+0.065" }, 1 };
	                    };
	                    class HeadingArrow
	                    {
	                        type = "line";
	                        width = 3;
	                        points[] =
	                        {
	                            { {0.48800001,0.141}, 1 },
	                            { {0.51200002,0.141}, 1 },
	                            { {0.542,0.161}, 1 },
	                            { {0.51200002,0.18099999}, 1 },
	                            { {0.48800001,0.18099999}, 1 },
	                            { {0.458,0.161}, 1 },
	                            { {0.48800001,0.141}, 1 },
	                            {}
	                        };
	                    };
	                };
	                class HeadingScale
	                {
	                    type = "scale";
	                    NeverEatSeaWeed = 1;
	                    horizontal = 1;
	                    source = "heading";
	                    sourceScale = 1;
	                    width = 3;
	                    top = 0.1;
	                    center = 0.5;
	                    bottom = 0.89999998;
	                    lineXleft = 0.105;
	                    lineYright = 0.115;
	                    lineXleftMajor = 0.094999999;
	                    lineYrightMajor = 0.115;
	                    majorLineEach = 5;
	                    numberEach = 5;
	                    step = "18 / 9";
	                    stepSize = "(0.70 - 0.3) / 15";
	                    align = "center";
	                    scale = 1;
	                    pos[] = {0.096000001,0.0546};
	                    right[] = {0.14300001,0.0546};
	                    down[] = {0.096000001,0.093000002};
	                };
	                class HeadingIndicatorBox
	                {
	                    type = "line";
	                    width = 3;
	                    points[] =
	                    {
	                        { "PlaneW", { -0.035, -0.45500001 }, 1 },
	                        { "PlaneW", { -0.035, -0.5 }, 1 },
	                        { "PlaneW", { 0.035, -0.5 }, 1 },
	                        { "PlaneW", { 0.035, -0.45500001 }, 1 },
	                        { "PlaneW", { -0.035, -0.45500001 }, 1 }
	                    };
	                };
	                class HeadingIndicatorArrow
	                {
	                    type = "polygon";
	                    points[] =
	                    {
	                        {
	                            { "PlaneW", { -0.015, -0.45500001 }, 1 },
	                            { "PlaneW", { 0, -0.44499999 }, 1 },
	                            { "PlaneW", { 0.015, -0.45500001 }, 1 }
	                        }
	                    };
	                };
	                class HeadingNumber
	                {
	                    type = "text";
	                    source = "heading";
	                    sourceScale = 1;
	                    align = "center";
	                    scale = 1;
	                    pos[] = { "PlaneW", { 0, "(-0.5            )" }, 1 };
	                    right[] = { "PlaneW", { 0.029999999, "(-0.5            )" }, 1 };
	                    down[] = { "PlaneW", { 0, "(-0.5 + 0.045    )" }, 1 };
	                };
	                class HorizonBankRot
	                {
	                    type = "line";
	                    width = 2;
	                    points[] =
	                    {
	                        { "HorizonBankRot", { 0, "0.39421001-0.109" }, 1 },
	                        { "HorizonBankRot", { 0.0099999998, "0.41673699-0.109" }, 1 },
	                        { "HorizonBankRot", { -0.0099999998, "0.41673699-0.109" }, 1 },
	                        { "HorizonBankRot", { 0, "0.39421001-0.109" }, 1 }
	                    };
	                };
	                class HorizonBankRotLines
	                {
	                    type = "line";
	                    width = 3;
	                    points[] =
	                    {
	                        { {0.619959,0.71298599}, 1 },
	                        { {0.63143897,0.74420297}, 1 },
	                        {},
	                        { {0.58291,0.73901898}, 1 },
	                        { {0.58808702,0.76077801}, 1 },
	                        {},
	                        { {0.54057401,0.74850398}, 1 },
	                        { {0.54318398,0.77083802}, 1 },
	                        {},
	                        { {0.4975,0.740421}, 1 },
	                        { {0.4975,0.77420998}, 1 },
	                        {},
	                        { {0.45442599,0.74850398}, 1 },
	                        { {0.45181599,0.77083802}, 1 },
	                        {},
	                        { {0.41209,0.73901898}, 1 },
	                        { {0.40691301,0.76077801}, 1 },
	                        {},
	                        { {0.37504101,0.71298599}, 1 },
	                        { {0.363561,0.74420297}, 1 }
	                    };
	                };
	                // FULL HORIZON LADDER (all levels from -90 to +90)
	                class Horizont
	                {
	                    clipTL[] = {0.2,0.2};
	                    clipBR[] = {0.80000001,0.80000001};
	                    class Dimmed
	                    {
	                        class Level0
	                        {
	                            type = "line";
	                            width = 3;
	                            points[] =
	                            {
	                                { "Level0", {0.75,0}, 1 },
	                                { "Level0", {0.064999998,0}, 1 },
	                                {},
	                                { "Level0", {-0.064999998,0}, 1 },
	                                { "Level0", {-0.75,0}, 1 }
	                            };
	                        };
	                    };
	                    class HideOnTurn
	                    {
	                        condition = "20-abs(cameraDir-heading)*( (abs(heading-cameraDir))<=340)) ";
	                        class Limiter
	                        {
	                            class Level0
	                            {
	                                type = "line";
	                                width = 2;
	                                points[] = {};
	                            };
	                            class LevelM5: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelM5", {-0.235,-0.02}, 1 },
	                                    { "LevelM5", {-0.235,0}, 1 },
	                                    {},
	                                    { "LevelM5", {-0.22,0}, 1 },
	                                    { "LevelM5", {-0.205,0}, 1 },
	                                    {},
	                                    { "LevelM5", {-0.19,0}, 1 },
	                                    { "LevelM5", {-0.175,0}, 1 },
	                                    {},
	                                    { "LevelM5", {-0.16,0}, 1 },
	                                    { "LevelM5", {-0.145,0}, 1 },
	                                    {},
	                                    { "LevelM5", {-0.13,0}, 1 },
	                                    { "LevelM5", {-0.115,0}, 1 },
	                                    {},
	                                    { "LevelM5", {-0.1,0}, 1 },
	                                    { "LevelM5", {-0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM5", {-0.07,0}, 1 },
	                                    { "LevelM5", {-0.055,0}, 1 },
	                                    {},
	                                    {},
	                                    { "LevelM5", {0.235,-0.02}, 1 },
	                                    { "LevelM5", {0.235,0}, 1 },
	                                    {},
	                                    { "LevelM5", {0.22,0}, 1 },
	                                    { "LevelM5", {0.205,0}, 1 },
	                                    {},
	                                    { "LevelM5", {0.19,0}, 1 },
	                                    { "LevelM5", {0.175,0}, 1 },
	                                    {},
	                                    { "LevelM5", {0.16,0}, 1 },
	                                    { "LevelM5", {0.145,0}, 1 },
	                                    {},
	                                    { "LevelM5", {0.13,0}, 1 },
	                                    { "LevelM5", {0.115,0}, 1 },
	                                    {},
	                                    { "LevelM5", {0.1,0}, 1 },
	                                    { "LevelM5", {0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM5", {0.07,0}, 1 },
	                                    { "LevelM5", {0.055,0}, 1 },
	                                    {}
	                                };
	                            };
	                            class VALM_1_5
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -5;
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM5", {-0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM5", {-0.2,-0.032000002}, 1 };
	                                down[] = { "LevelM5", {-0.25999999,0.017999999}, 1 };
	                            };
	                            class VALM_1_5_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -5;
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM5", {0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM5", {0.31999999,-0.032000002}, 1 };
	                                down[] = { "LevelM5", {0.25999999,0.017999999}, 1 };
	                            };
	                            class LevelP5: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelP5", { "-0.22-0.015", 0.02 }, 1 },
	                                    { "LevelP5", { "-0.22-0.015", 0 }, 1 },
	                                    { "LevelP5", {-0.059999999,0}, 1 },
	                                    {},
	                                    { "LevelP5", {0.059999999,0}, 1 },
	                                    { "LevelP5", { "+0.22+0.015", 0 }, 1 },
	                                    { "LevelP5", { "+0.22+0.015", 0.02 }, 1 }
	                                };
	                            };
	                            class VALP_1_5
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "5";
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP5", {-0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP5", {-0.2,-0.017000001}, 1 };
	                                down[] = { "LevelP5", {-0.25999999,0.033}, 1 };
	                            };
	                            class VALP_1_5_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "5";
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP5", {0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP5", {0.31999999,-0.017000001}, 1 };
	                                down[] = { "LevelP5", {0.25999999,0.033}, 1 };
	                            };
	                            class LevelM10: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelM10", {-0.235,-0.02}, 1 },
	                                    { "LevelM10", {-0.235,0}, 1 },
	                                    {},
	                                    { "LevelM10", {-0.22,0}, 1 },
	                                    { "LevelM10", {-0.205,0}, 1 },
	                                    {},
	                                    { "LevelM10", {-0.19,0}, 1 },
	                                    { "LevelM10", {-0.175,0}, 1 },
	                                    {},
	                                    { "LevelM10", {-0.16,0}, 1 },
	                                    { "LevelM10", {-0.145,0}, 1 },
	                                    {},
	                                    { "LevelM10", {-0.13,0}, 1 },
	                                    { "LevelM10", {-0.115,0}, 1 },
	                                    {},
	                                    { "LevelM10", {-0.1,0}, 1 },
	                                    { "LevelM10", {-0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM10", {-0.07,0}, 1 },
	                                    { "LevelM10", {-0.055,0}, 1 },
	                                    {},
	                                    {},
	                                    { "LevelM10", {0.235,-0.02}, 1 },
	                                    { "LevelM10", {0.235,0}, 1 },
	                                    {},
	                                    { "LevelM10", {0.22,0}, 1 },
	                                    { "LevelM10", {0.205,0}, 1 },
	                                    {},
	                                    { "LevelM10", {0.19,0}, 1 },
	                                    { "LevelM10", {0.175,0}, 1 },
	                                    {},
	                                    { "LevelM10", {0.16,0}, 1 },
	                                    { "LevelM10", {0.145,0}, 1 },
	                                    {},
	                                    { "LevelM10", {0.13,0}, 1 },
	                                    { "LevelM10", {0.115,0}, 1 },
	                                    {},
	                                    { "LevelM10", {0.1,0}, 1 },
	                                    { "LevelM10", {0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM10", {0.07,0}, 1 },
	                                    { "LevelM10", {0.055,0}, 1 },
	                                    {}
	                                };
	                            };
	                            class VALM_1_10
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -10;
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM10", {-0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM10", {-0.2,-0.032000002}, 1 };
	                                down[] = { "LevelM10", {-0.25999999,0.017999999}, 1 };
	                            };
	                            class VALM_1_10_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -10;
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM10", {0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM10", {0.31999999,-0.032000002}, 1 };
	                                down[] = { "LevelM10", {0.25999999,0.017999999}, 1 };
	                            };
	                            class LevelP10: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelP10", { "-0.22-0.015", 0.02 }, 1 },
	                                    { "LevelP10", { "-0.22-0.015", 0 }, 1 },
	                                    { "LevelP10", {-0.059999999,0}, 1 },
	                                    {},
	                                    { "LevelP10", {0.059999999,0}, 1 },
	                                    { "LevelP10", { "+0.22+0.015", 0 }, 1 },
	                                    { "LevelP10", { "+0.22+0.015", 0.02 }, 1 }
	                                };
	                            };
	                            class VALP_1_10
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "10";
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP10", {-0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP10", {-0.2,-0.017000001}, 1 };
	                                down[] = { "LevelP10", {-0.25999999,0.033}, 1 };
	                            };
	                            class VALP_1_10_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "10";
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP10", {0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP10", {0.31999999,-0.017000001}, 1 };
	                                down[] = { "LevelP10", {0.25999999,0.033}, 1 };
	                            };
	                            class LevelM15: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelM15", {-0.235,-0.02}, 1 },
	                                    { "LevelM15", {-0.235,0}, 1 },
	                                    {},
	                                    { "LevelM15", {-0.22,0}, 1 },
	                                    { "LevelM15", {-0.205,0}, 1 },
	                                    {},
	                                    { "LevelM15", {-0.19,0}, 1 },
	                                    { "LevelM15", {-0.175,0}, 1 },
	                                    {},
	                                    { "LevelM15", {-0.16,0}, 1 },
	                                    { "LevelM15", {-0.145,0}, 1 },
	                                    {},
	                                    { "LevelM15", {-0.13,0}, 1 },
	                                    { "LevelM15", {-0.115,0}, 1 },
	                                    {},
	                                    { "LevelM15", {-0.1,0}, 1 },
	                                    { "LevelM15", {-0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM15", {-0.07,0}, 1 },
	                                    { "LevelM15", {-0.055,0}, 1 },
	                                    {},
	                                    {},
	                                    { "LevelM15", {0.235,-0.02}, 1 },
	                                    { "LevelM15", {0.235,0}, 1 },
	                                    {},
	                                    { "LevelM15", {0.22,0}, 1 },
	                                    { "LevelM15", {0.205,0}, 1 },
	                                    {},
	                                    { "LevelM15", {0.19,0}, 1 },
	                                    { "LevelM15", {0.175,0}, 1 },
	                                    {},
	                                    { "LevelM15", {0.16,0}, 1 },
	                                    { "LevelM15", {0.145,0}, 1 },
	                                    {},
	                                    { "LevelM15", {0.13,0}, 1 },
	                                    { "LevelM15", {0.115,0}, 1 },
	                                    {},
	                                    { "LevelM15", {0.1,0}, 1 },
	                                    { "LevelM15", {0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM15", {0.07,0}, 1 },
	                                    { "LevelM15", {0.055,0}, 1 },
	                                    {}
	                                };
	                            };
	                            class VALM_1_15
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -15;
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM15", {-0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM15", {-0.2,-0.032000002}, 1 };
	                                down[] = { "LevelM15", {-0.25999999,0.017999999}, 1 };
	                            };
	                            class VALM_1_15_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -15;
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM15", {0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM15", {0.31999999,-0.032000002}, 1 };
	                                down[] = { "LevelM15", {0.25999999,0.017999999}, 1 };
	                            };
	                            class LevelP15: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelP15", { "-0.22-0.015", 0.02 }, 1 },
	                                    { "LevelP15", { "-0.22-0.015", 0 }, 1 },
	                                    { "LevelP15", {-0.059999999,0}, 1 },
	                                    {},
	                                    { "LevelP15", {0.059999999,0}, 1 },
	                                    { "LevelP15", { "+0.22+0.015", 0 }, 1 },
	                                    { "LevelP15", { "+0.22+0.015", 0.02 }, 1 }
	                                };
	                            };
	                            class VALP_1_15
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "15";
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP15", {-0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP15", {-0.2,-0.017000001}, 1 };
	                                down[] = { "LevelP15", {-0.25999999,0.033}, 1 };
	                            };
	                            class VALP_1_15_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "15";
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP15", {0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP15", {0.31999999,-0.017000001}, 1 };
	                                down[] = { "LevelP15", {0.25999999,0.033}, 1 };
	                            };
	                            class LevelM20: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelM20", {-0.235,-0.02}, 1 },
	                                    { "LevelM20", {-0.235,0}, 1 },
	                                    {},
	                                    { "LevelM20", {-0.22,0}, 1 },
	                                    { "LevelM20", {-0.205,0}, 1 },
	                                    {},
	                                    { "LevelM20", {-0.19,0}, 1 },
	                                    { "LevelM20", {-0.175,0}, 1 },
	                                    {},
	                                    { "LevelM20", {-0.16,0}, 1 },
	                                    { "LevelM20", {-0.145,0}, 1 },
	                                    {},
	                                    { "LevelM20", {-0.13,0}, 1 },
	                                    { "LevelM20", {-0.115,0}, 1 },
	                                    {},
	                                    { "LevelM20", {-0.1,0}, 1 },
	                                    { "LevelM20", {-0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM20", {-0.07,0}, 1 },
	                                    { "LevelM20", {-0.055,0}, 1 },
	                                    {},
	                                    {},
	                                    { "LevelM20", {0.235,-0.02}, 1 },
	                                    { "LevelM20", {0.235,0}, 1 },
	                                    {},
	                                    { "LevelM20", {0.22,0}, 1 },
	                                    { "LevelM20", {0.205,0}, 1 },
	                                    {},
	                                    { "LevelM20", {0.19,0}, 1 },
	                                    { "LevelM20", {0.175,0}, 1 },
	                                    {},
	                                    { "LevelM20", {0.16,0}, 1 },
	                                    { "LevelM20", {0.145,0}, 1 },
	                                    {},
	                                    { "LevelM20", {0.13,0}, 1 },
	                                    { "LevelM20", {0.115,0}, 1 },
	                                    {},
	                                    { "LevelM20", {0.1,0}, 1 },
	                                    { "LevelM20", {0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM20", {0.07,0}, 1 },
	                                    { "LevelM20", {0.055,0}, 1 },
	                                    {}
	                                };
	                            };
	                            class VALM_1_20
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -20;
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM20", {-0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM20", {-0.2,-0.032000002}, 1 };
	                                down[] = { "LevelM20", {-0.25999999,0.017999999}, 1 };
	                            };
	                            class VALM_1_20_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -20;
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM20", {0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM20", {0.31999999,-0.032000002}, 1 };
	                                down[] = { "LevelM20", {0.25999999,0.017999999}, 1 };
	                            };
	                            class LevelP20: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelP20", { "-0.22-0.015", 0.02 }, 1 },
	                                    { "LevelP20", { "-0.22-0.015", 0 }, 1 },
	                                    { "LevelP20", {-0.059999999,0}, 1 },
	                                    {},
	                                    { "LevelP20", {0.059999999,0}, 1 },
	                                    { "LevelP20", { "+0.22+0.015", 0 }, 1 },
	                                    { "LevelP20", { "+0.22+0.015", 0.02 }, 1 }
	                                };
	                            };
	                            class VALP_1_20
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "20";
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP20", {-0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP20", {-0.2,-0.017000001}, 1 };
	                                down[] = { "LevelP20", {-0.25999999,0.033}, 1 };
	                            };
	                            class VALP_1_20_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "20";
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP20", {0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP20", {0.31999999,-0.017000001}, 1 };
	                                down[] = { "LevelP20", {0.25999999,0.033}, 1 };
	                            };
	                            class LevelM25: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelM25", {-0.235,-0.02}, 1 },
	                                    { "LevelM25", {-0.235,0}, 1 },
	                                    {},
	                                    { "LevelM25", {-0.22,0}, 1 },
	                                    { "LevelM25", {-0.205,0}, 1 },
	                                    {},
	                                    { "LevelM25", {-0.19,0}, 1 },
	                                    { "LevelM25", {-0.175,0}, 1 },
	                                    {},
	                                    { "LevelM25", {-0.16,0}, 1 },
	                                    { "LevelM25", {-0.145,0}, 1 },
	                                    {},
	                                    { "LevelM25", {-0.13,0}, 1 },
	                                    { "LevelM25", {-0.115,0}, 1 },
	                                    {},
	                                    { "LevelM25", {-0.1,0}, 1 },
	                                    { "LevelM25", {-0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM25", {-0.07,0}, 1 },
	                                    { "LevelM25", {-0.055,0}, 1 },
	                                    {},
	                                    {},
	                                    { "LevelM25", {0.235,-0.02}, 1 },
	                                    { "LevelM25", {0.235,0}, 1 },
	                                    {},
	                                    { "LevelM25", {0.22,0}, 1 },
	                                    { "LevelM25", {0.205,0}, 1 },
	                                    {},
	                                    { "LevelM25", {0.19,0}, 1 },
	                                    { "LevelM25", {0.175,0}, 1 },
	                                    {},
	                                    { "LevelM25", {0.16,0}, 1 },
	                                    { "LevelM25", {0.145,0}, 1 },
	                                    {},
	                                    { "LevelM25", {0.13,0}, 1 },
	                                    { "LevelM25", {0.115,0}, 1 },
	                                    {},
	                                    { "LevelM25", {0.1,0}, 1 },
	                                    { "LevelM25", {0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM25", {0.07,0}, 1 },
	                                    { "LevelM25", {0.055,0}, 1 },
	                                    {}
	                                };
	                            };
	                            class VALM_1_25
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -25;
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM25", {-0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM25", {-0.2,-0.032000002}, 1 };
	                                down[] = { "LevelM25", {-0.25999999,0.017999999}, 1 };
	                            };
	                            class VALM_1_25_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -25;
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM25", {0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM25", {0.31999999,-0.032000002}, 1 };
	                                down[] = { "LevelM25", {0.25999999,0.017999999}, 1 };
	                            };
	                            class LevelP25: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelP25", { "-0.22-0.015", 0.02 }, 1 },
	                                    { "LevelP25", { "-0.22-0.015", 0 }, 1 },
	                                    { "LevelP25", {-0.059999999,0}, 1 },
	                                    {},
	                                    { "LevelP25", {0.059999999,0}, 1 },
	                                    { "LevelP25", { "+0.22+0.015", 0 }, 1 },
	                                    { "LevelP25", { "+0.22+0.015", 0.02 }, 1 }
	                                };
	                            };
	                            class VALP_1_25
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "25";
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP25", {-0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP25", {-0.2,-0.017000001}, 1 };
	                                down[] = { "LevelP25", {-0.25999999,0.033}, 1 };
	                            };
	                            class VALP_1_25_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "25";
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP25", {0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP25", {0.31999999,-0.017000001}, 1 };
	                                down[] = { "LevelP25", {0.25999999,0.033}, 1 };
	                            };
	                            class LevelM30: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelM30", {-0.235,-0.02}, 1 },
	                                    { "LevelM30", {-0.235,0}, 1 },
	                                    {},
	                                    { "LevelM30", {-0.22,0}, 1 },
	                                    { "LevelM30", {-0.205,0}, 1 },
	                                    {},
	                                    { "LevelM30", {-0.19,0}, 1 },
	                                    { "LevelM30", {-0.175,0}, 1 },
	                                    {},
	                                    { "LevelM30", {-0.16,0}, 1 },
	                                    { "LevelM30", {-0.145,0}, 1 },
	                                    {},
	                                    { "LevelM30", {-0.13,0}, 1 },
	                                    { "LevelM30", {-0.115,0}, 1 },
	                                    {},
	                                    { "LevelM30", {-0.1,0}, 1 },
	                                    { "LevelM30", {-0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM30", {-0.07,0}, 1 },
	                                    { "LevelM30", {-0.055,0}, 1 },
	                                    {},
	                                    {},
	                                    { "LevelM30", {0.235,-0.02}, 1 },
	                                    { "LevelM30", {0.235,0}, 1 },
	                                    {},
	                                    { "LevelM30", {0.22,0}, 1 },
	                                    { "LevelM30", {0.205,0}, 1 },
	                                    {},
	                                    { "LevelM30", {0.19,0}, 1 },
	                                    { "LevelM30", {0.175,0}, 1 },
	                                    {},
	                                    { "LevelM30", {0.16,0}, 1 },
	                                    { "LevelM30", {0.145,0}, 1 },
	                                    {},
	                                    { "LevelM30", {0.13,0}, 1 },
	                                    { "LevelM30", {0.115,0}, 1 },
	                                    {},
	                                    { "LevelM30", {0.1,0}, 1 },
	                                    { "LevelM30", {0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM30", {0.07,0}, 1 },
	                                    { "LevelM30", {0.055,0}, 1 },
	                                    {}
	                                };
	                            };
	                            class VALM_1_30
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -30;
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM30", {-0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM30", {-0.2,-0.032000002}, 1 };
	                                down[] = { "LevelM30", {-0.25999999,0.017999999}, 1 };
	                            };
	                            class VALM_1_30_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -30;
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM30", {0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM30", {0.31999999,-0.032000002}, 1 };
	                                down[] = { "LevelM30", {0.25999999,0.017999999}, 1 };
	                            };
	                            class LevelP30: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelP30", { "-0.22-0.015", 0.02 }, 1 },
	                                    { "LevelP30", { "-0.22-0.015", 0 }, 1 },
	                                    { "LevelP30", {-0.059999999,0}, 1 },
	                                    {},
	                                    { "LevelP30", {0.059999999,0}, 1 },
	                                    { "LevelP30", { "+0.22+0.015", 0 }, 1 },
	                                    { "LevelP30", { "+0.22+0.015", 0.02 }, 1 }
	                                };
	                            };
	                            class VALP_1_30
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "30";
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP30", {-0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP30", {-0.2,-0.017000001}, 1 };
	                                down[] = { "LevelP30", {-0.25999999,0.033}, 1 };
	                            };
	                            class VALP_1_30_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "30";
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP30", {0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP30", {0.31999999,-0.017000001}, 1 };
	                                down[] = { "LevelP30", {0.25999999,0.033}, 1 };
	                            };
	                            class LevelM35: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelM35", {-0.235,-0.02}, 1 },
	                                    { "LevelM35", {-0.235,0}, 1 },
	                                    {},
	                                    { "LevelM35", {-0.22,0}, 1 },
	                                    { "LevelM35", {-0.205,0}, 1 },
	                                    {},
	                                    { "LevelM35", {-0.19,0}, 1 },
	                                    { "LevelM35", {-0.175,0}, 1 },
	                                    {},
	                                    { "LevelM35", {-0.16,0}, 1 },
	                                    { "LevelM35", {-0.145,0}, 1 },
	                                    {},
	                                    { "LevelM35", {-0.13,0}, 1 },
	                                    { "LevelM35", {-0.115,0}, 1 },
	                                    {},
	                                    { "LevelM35", {-0.1,0}, 1 },
	                                    { "LevelM35", {-0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM35", {-0.07,0}, 1 },
	                                    { "LevelM35", {-0.055,0}, 1 },
	                                    {},
	                                    {},
	                                    { "LevelM35", {0.235,-0.02}, 1 },
	                                    { "LevelM35", {0.235,0}, 1 },
	                                    {},
	                                    { "LevelM35", {0.22,0}, 1 },
	                                    { "LevelM35", {0.205,0}, 1 },
	                                    {},
	                                    { "LevelM35", {0.19,0}, 1 },
	                                    { "LevelM35", {0.175,0}, 1 },
	                                    {},
	                                    { "LevelM35", {0.16,0}, 1 },
	                                    { "LevelM35", {0.145,0}, 1 },
	                                    {},
	                                    { "LevelM35", {0.13,0}, 1 },
	                                    { "LevelM35", {0.115,0}, 1 },
	                                    {},
	                                    { "LevelM35", {0.1,0}, 1 },
	                                    { "LevelM35", {0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM35", {0.07,0}, 1 },
	                                    { "LevelM35", {0.055,0}, 1 },
	                                    {}
	                                };
	                            };
	                            class VALM_1_35
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -35;
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM35", {-0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM35", {-0.2,-0.032000002}, 1 };
	                                down[] = { "LevelM35", {-0.25999999,0.017999999}, 1 };
	                            };
	                            class VALM_1_35_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -35;
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM35", {0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM35", {0.31999999,-0.032000002}, 1 };
	                                down[] = { "LevelM35", {0.25999999,0.017999999}, 1 };
	                            };
	                            class LevelP35: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelP35", { "-0.22-0.015", 0.02 }, 1 },
	                                    { "LevelP35", { "-0.22-0.015", 0 }, 1 },
	                                    { "LevelP35", {-0.059999999,0}, 1 },
	                                    {},
	                                    { "LevelP35", {0.059999999,0}, 1 },
	                                    { "LevelP35", { "+0.22+0.015", 0 }, 1 },
	                                    { "LevelP35", { "+0.22+0.015", 0.02 }, 1 }
	                                };
	                            };
	                            class VALP_1_35
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "35";
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP35", {-0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP35", {-0.2,-0.017000001}, 1 };
	                                down[] = { "LevelP35", {-0.25999999,0.033}, 1 };
	                            };
	                            class VALP_1_35_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "35";
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP35", {0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP35", {0.31999999,-0.017000001}, 1 };
	                                down[] = { "LevelP35", {0.25999999,0.033}, 1 };
	                            };
	                            class LevelM40: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelM40", {-0.235,-0.02}, 1 },
	                                    { "LevelM40", {-0.235,0}, 1 },
	                                    {},
	                                    { "LevelM40", {-0.22,0}, 1 },
	                                    { "LevelM40", {-0.205,0}, 1 },
	                                    {},
	                                    { "LevelM40", {-0.19,0}, 1 },
	                                    { "LevelM40", {-0.175,0}, 1 },
	                                    {},
	                                    { "LevelM40", {-0.16,0}, 1 },
	                                    { "LevelM40", {-0.145,0}, 1 },
	                                    {},
	                                    { "LevelM40", {-0.13,0}, 1 },
	                                    { "LevelM40", {-0.115,0}, 1 },
	                                    {},
	                                    { "LevelM40", {-0.1,0}, 1 },
	                                    { "LevelM40", {-0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM40", {-0.07,0}, 1 },
	                                    { "LevelM40", {-0.055,0}, 1 },
	                                    {},
	                                    {},
	                                    { "LevelM40", {0.235,-0.02}, 1 },
	                                    { "LevelM40", {0.235,0}, 1 },
	                                    {},
	                                    { "LevelM40", {0.22,0}, 1 },
	                                    { "LevelM40", {0.205,0}, 1 },
	                                    {},
	                                    { "LevelM40", {0.19,0}, 1 },
	                                    { "LevelM40", {0.175,0}, 1 },
	                                    {},
	                                    { "LevelM40", {0.16,0}, 1 },
	                                    { "LevelM40", {0.145,0}, 1 },
	                                    {},
	                                    { "LevelM40", {0.13,0}, 1 },
	                                    { "LevelM40", {0.115,0}, 1 },
	                                    {},
	                                    { "LevelM40", {0.1,0}, 1 },
	                                    { "LevelM40", {0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM40", {0.07,0}, 1 },
	                                    { "LevelM40", {0.055,0}, 1 },
	                                    {}
	                                };
	                            };
	                            class VALM_1_40
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -40;
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM40", {-0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM40", {-0.2,-0.032000002}, 1 };
	                                down[] = { "LevelM40", {-0.25999999,0.017999999}, 1 };
	                            };
	                            class VALM_1_40_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -40;
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM40", {0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM40", {0.31999999,-0.032000002}, 1 };
	                                down[] = { "LevelM40", {0.25999999,0.017999999}, 1 };
	                            };
	                            class LevelP40: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelP40", { "-0.22-0.015", 0.02 }, 1 },
	                                    { "LevelP40", { "-0.22-0.015", 0 }, 1 },
	                                    { "LevelP40", {-0.059999999,0}, 1 },
	                                    {},
	                                    { "LevelP40", {0.059999999,0}, 1 },
	                                    { "LevelP40", { "+0.22+0.015", 0 }, 1 },
	                                    { "LevelP40", { "+0.22+0.015", 0.02 }, 1 }
	                                };
	                            };
	                            class VALP_1_40
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "40";
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP40", {-0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP40", {-0.2,-0.017000001}, 1 };
	                                down[] = { "LevelP40", {-0.25999999,0.033}, 1 };
	                            };
	                            class VALP_1_40_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "40";
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP40", {0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP40", {0.31999999,-0.017000001}, 1 };
	                                down[] = { "LevelP40", {0.25999999,0.033}, 1 };
	                            };
	                            class LevelM45: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelM45", {-0.235,-0.02}, 1 },
	                                    { "LevelM45", {-0.235,0}, 1 },
	                                    {},
	                                    { "LevelM45", {-0.22,0}, 1 },
	                                    { "LevelM45", {-0.205,0}, 1 },
	                                    {},
	                                    { "LevelM45", {-0.19,0}, 1 },
	                                    { "LevelM45", {-0.175,0}, 1 },
	                                    {},
	                                    { "LevelM45", {-0.16,0}, 1 },
	                                    { "LevelM45", {-0.145,0}, 1 },
	                                    {},
	                                    { "LevelM45", {-0.13,0}, 1 },
	                                    { "LevelM45", {-0.115,0}, 1 },
	                                    {},
	                                    { "LevelM45", {-0.1,0}, 1 },
	                                    { "LevelM45", {-0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM45", {-0.07,0}, 1 },
	                                    { "LevelM45", {-0.055,0}, 1 },
	                                    {},
	                                    {},
	                                    { "LevelM45", {0.235,-0.02}, 1 },
	                                    { "LevelM45", {0.235,0}, 1 },
	                                    {},
	                                    { "LevelM45", {0.22,0}, 1 },
	                                    { "LevelM45", {0.205,0}, 1 },
	                                    {},
	                                    { "LevelM45", {0.19,0}, 1 },
	                                    { "LevelM45", {0.175,0}, 1 },
	                                    {},
	                                    { "LevelM45", {0.16,0}, 1 },
	                                    { "LevelM45", {0.145,0}, 1 },
	                                    {},
	                                    { "LevelM45", {0.13,0}, 1 },
	                                    { "LevelM45", {0.115,0}, 1 },
	                                    {},
	                                    { "LevelM45", {0.1,0}, 1 },
	                                    { "LevelM45", {0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM45", {0.07,0}, 1 },
	                                    { "LevelM45", {0.055,0}, 1 },
	                                    {}
	                                };
	                            };
	                            class VALM_1_45
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -45;
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM45", {-0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM45", {-0.2,-0.032000002}, 1 };
	                                down[] = { "LevelM45", {-0.25999999,0.017999999}, 1 };
	                            };
	                            class VALM_1_45_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -45;
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM45", {0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM45", {0.31999999,-0.032000002}, 1 };
	                                down[] = { "LevelM45", {0.25999999,0.017999999}, 1 };
	                            };
	                            class LevelP45: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelP45", { "-0.22-0.015", 0.02 }, 1 },
	                                    { "LevelP45", { "-0.22-0.015", 0 }, 1 },
	                                    { "LevelP45", {-0.059999999,0}, 1 },
	                                    {},
	                                    { "LevelP45", {0.059999999,0}, 1 },
	                                    { "LevelP45", { "+0.22+0.015", 0 }, 1 },
	                                    { "LevelP45", { "+0.22+0.015", 0.02 }, 1 }
	                                };
	                            };
	                            class VALP_1_45
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "45";
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP45", {-0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP45", {-0.2,-0.017000001}, 1 };
	                                down[] = { "LevelP45", {-0.25999999,0.033}, 1 };
	                            };
	                            class VALP_1_45_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "45";
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP45", {0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP45", {0.31999999,-0.017000001}, 1 };
	                                down[] = { "LevelP45", {0.25999999,0.033}, 1 };
	                            };
	                            class LevelM50: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelM50", {-0.235,-0.02}, 1 },
	                                    { "LevelM50", {-0.235,0}, 1 },
	                                    {},
	                                    { "LevelM50", {-0.22,0}, 1 },
	                                    { "LevelM50", {-0.205,0}, 1 },
	                                    {},
	                                    { "LevelM50", {-0.19,0}, 1 },
	                                    { "LevelM50", {-0.175,0}, 1 },
	                                    {},
	                                    { "LevelM50", {-0.16,0}, 1 },
	                                    { "LevelM50", {-0.145,0}, 1 },
	                                    {},
	                                    { "LevelM50", {-0.13,0}, 1 },
	                                    { "LevelM50", {-0.115,0}, 1 },
	                                    {},
	                                    { "LevelM50", {-0.1,0}, 1 },
	                                    { "LevelM50", {-0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM50", {-0.07,0}, 1 },
	                                    { "LevelM50", {-0.055,0}, 1 },
	                                    {},
	                                    {},
	                                    { "LevelM50", {0.235,-0.02}, 1 },
	                                    { "LevelM50", {0.235,0}, 1 },
	                                    {},
	                                    { "LevelM50", {0.22,0}, 1 },
	                                    { "LevelM50", {0.205,0}, 1 },
	                                    {},
	                                    { "LevelM50", {0.19,0}, 1 },
	                                    { "LevelM50", {0.175,0}, 1 },
	                                    {},
	                                    { "LevelM50", {0.16,0}, 1 },
	                                    { "LevelM50", {0.145,0}, 1 },
	                                    {},
	                                    { "LevelM50", {0.13,0}, 1 },
	                                    { "LevelM50", {0.115,0}, 1 },
	                                    {},
	                                    { "LevelM50", {0.1,0}, 1 },
	                                    { "LevelM50", {0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM50", {0.07,0}, 1 },
	                                    { "LevelM50", {0.055,0}, 1 },
	                                    {}
	                                };
	                            };
	                            class VALM_1_50
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -50;
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM50", {-0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM50", {-0.2,-0.032000002}, 1 };
	                                down[] = { "LevelM50", {-0.25999999,0.017999999}, 1 };
	                            };
	                            class VALM_1_50_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -50;
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM50", {0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM50", {0.31999999,-0.032000002}, 1 };
	                                down[] = { "LevelM50", {0.25999999,0.017999999}, 1 };
	                            };
	                            class LevelP50: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelP50", { "-0.22-0.015", 0.02 }, 1 },
	                                    { "LevelP50", { "-0.22-0.015", 0 }, 1 },
	                                    { "LevelP50", {-0.059999999,0}, 1 },
	                                    {},
	                                    { "LevelP50", {0.059999999,0}, 1 },
	                                    { "LevelP50", { "+0.22+0.015", 0 }, 1 },
	                                    { "LevelP50", { "+0.22+0.015", 0.02 }, 1 }
	                                };
	                            };
	                            class VALP_1_50
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "50";
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP50", {-0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP50", {-0.2,-0.017000001}, 1 };
	                                down[] = { "LevelP50", {-0.25999999,0.033}, 1 };
	                            };
	                            class VALP_1_50_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "50";
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP50", {0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP50", {0.31999999,-0.017000001}, 1 };
	                                down[] = { "LevelP50", {0.25999999,0.033}, 1 };
	                            };
	                            class LevelM60: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelM60", {-0.235,-0.02}, 1 },
	                                    { "LevelM60", {-0.235,0}, 1 },
	                                    {},
	                                    { "LevelM60", {-0.22,0}, 1 },
	                                    { "LevelM60", {-0.205,0}, 1 },
	                                    {},
	                                    { "LevelM60", {-0.19,0}, 1 },
	                                    { "LevelM60", {-0.175,0}, 1 },
	                                    {},
	                                    { "LevelM60", {-0.16,0}, 1 },
	                                    { "LevelM60", {-0.145,0}, 1 },
	                                    {},
	                                    { "LevelM60", {-0.13,0}, 1 },
	                                    { "LevelM60", {-0.115,0}, 1 },
	                                    {},
	                                    { "LevelM60", {-0.1,0}, 1 },
	                                    { "LevelM60", {-0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM60", {-0.07,0}, 1 },
	                                    { "LevelM60", {-0.055,0}, 1 },
	                                    {},
	                                    {},
	                                    { "LevelM60", {0.235,-0.02}, 1 },
	                                    { "LevelM60", {0.235,0}, 1 },
	                                    {},
	                                    { "LevelM60", {0.22,0}, 1 },
	                                    { "LevelM60", {0.205,0}, 1 },
	                                    {},
	                                    { "LevelM60", {0.19,0}, 1 },
	                                    { "LevelM60", {0.175,0}, 1 },
	                                    {},
	                                    { "LevelM60", {0.16,0}, 1 },
	                                    { "LevelM60", {0.145,0}, 1 },
	                                    {},
	                                    { "LevelM60", {0.13,0}, 1 },
	                                    { "LevelM60", {0.115,0}, 1 },
	                                    {},
	                                    { "LevelM60", {0.1,0}, 1 },
	                                    { "LevelM60", {0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM60", {0.07,0}, 1 },
	                                    { "LevelM60", {0.055,0}, 1 },
	                                    {}
	                                };
	                            };
	                            class VALM_1_60
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -60;
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM60", {-0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM60", {-0.2,-0.032000002}, 1 };
	                                down[] = { "LevelM60", {-0.25999999,0.017999999}, 1 };
	                            };
	                            class VALM_1_60_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -60;
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM60", {0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM60", {0.31999999,-0.032000002}, 1 };
	                                down[] = { "LevelM60", {0.25999999,0.017999999}, 1 };
	                            };
	                            class LevelP60: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelP60", { "-0.22-0.015", 0.02 }, 1 },
	                                    { "LevelP60", { "-0.22-0.015", 0 }, 1 },
	                                    { "LevelP60", {-0.059999999,0}, 1 },
	                                    {},
	                                    { "LevelP60", {0.059999999,0}, 1 },
	                                    { "LevelP60", { "+0.22+0.015", 0 }, 1 },
	                                    { "LevelP60", { "+0.22+0.015", 0.02 }, 1 }
	                                };
	                            };
	                            class VALP_1_60
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "60";
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP60", {-0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP60", {-0.2,-0.017000001}, 1 };
	                                down[] = { "LevelP60", {-0.25999999,0.033}, 1 };
	                            };
	                            class VALP_1_60_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "60";
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP60", {0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP60", {0.31999999,-0.017000001}, 1 };
	                                down[] = { "LevelP60", {0.25999999,0.033}, 1 };
	                            };
	                            class LevelM70: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelM70", {-0.235,-0.02}, 1 },
	                                    { "LevelM70", {-0.235,0}, 1 },
	                                    {},
	                                    { "LevelM70", {-0.22,0}, 1 },
	                                    { "LevelM70", {-0.205,0}, 1 },
	                                    {},
	                                    { "LevelM70", {-0.19,0}, 1 },
	                                    { "LevelM70", {-0.175,0}, 1 },
	                                    {},
	                                    { "LevelM70", {-0.16,0}, 1 },
	                                    { "LevelM70", {-0.145,0}, 1 },
	                                    {},
	                                    { "LevelM70", {-0.13,0}, 1 },
	                                    { "LevelM70", {-0.115,0}, 1 },
	                                    {},
	                                    { "LevelM70", {-0.1,0}, 1 },
	                                    { "LevelM70", {-0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM70", {-0.07,0}, 1 },
	                                    { "LevelM70", {-0.055,0}, 1 },
	                                    {},
	                                    {},
	                                    { "LevelM70", {0.235,-0.02}, 1 },
	                                    { "LevelM70", {0.235,0}, 1 },
	                                    {},
	                                    { "LevelM70", {0.22,0}, 1 },
	                                    { "LevelM70", {0.205,0}, 1 },
	                                    {},
	                                    { "LevelM70", {0.19,0}, 1 },
	                                    { "LevelM70", {0.175,0}, 1 },
	                                    {},
	                                    { "LevelM70", {0.16,0}, 1 },
	                                    { "LevelM70", {0.145,0}, 1 },
	                                    {},
	                                    { "LevelM70", {0.13,0}, 1 },
	                                    { "LevelM70", {0.115,0}, 1 },
	                                    {},
	                                    { "LevelM70", {0.1,0}, 1 },
	                                    { "LevelM70", {0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM70", {0.07,0}, 1 },
	                                    { "LevelM70", {0.055,0}, 1 },
	                                    {}
	                                };
	                            };
	                            class VALM_1_70
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -70;
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM70", {-0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM70", {-0.2,-0.032000002}, 1 };
	                                down[] = { "LevelM70", {-0.25999999,0.017999999}, 1 };
	                            };
	                            class VALM_1_70_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -70;
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM70", {0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM70", {0.31999999,-0.032000002}, 1 };
	                                down[] = { "LevelM70", {0.25999999,0.017999999}, 1 };
	                            };
	                            class LevelP70: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelP70", { "-0.22-0.015", 0.02 }, 1 },
	                                    { "LevelP70", { "-0.22-0.015", 0 }, 1 },
	                                    { "LevelP70", {-0.059999999,0}, 1 },
	                                    {},
	                                    { "LevelP70", {0.059999999,0}, 1 },
	                                    { "LevelP70", { "+0.22+0.015", 0 }, 1 },
	                                    { "LevelP70", { "+0.22+0.015", 0.02 }, 1 }
	                                };
	                            };
	                            class VALP_1_70
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "70";
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP70", {-0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP70", {-0.2,-0.017000001}, 1 };
	                                down[] = { "LevelP70", {-0.25999999,0.033}, 1 };
	                            };
	                            class VALP_1_70_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "70";
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP70", {0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP70", {0.31999999,-0.017000001}, 1 };
	                                down[] = { "LevelP70", {0.25999999,0.033}, 1 };
	                            };
	                            class LevelM80: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelM80", {-0.235,-0.02}, 1 },
	                                    { "LevelM80", {-0.235,0}, 1 },
	                                    {},
	                                    { "LevelM80", {-0.22,0}, 1 },
	                                    { "LevelM80", {-0.205,0}, 1 },
	                                    {},
	                                    { "LevelM80", {-0.19,0}, 1 },
	                                    { "LevelM80", {-0.175,0}, 1 },
	                                    {},
	                                    { "LevelM80", {-0.16,0}, 1 },
	                                    { "LevelM80", {-0.145,0}, 1 },
	                                    {},
	                                    { "LevelM80", {-0.13,0}, 1 },
	                                    { "LevelM80", {-0.115,0}, 1 },
	                                    {},
	                                    { "LevelM80", {-0.1,0}, 1 },
	                                    { "LevelM80", {-0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM80", {-0.07,0}, 1 },
	                                    { "LevelM80", {-0.055,0}, 1 },
	                                    {},
	                                    {},
	                                    { "LevelM80", {0.235,-0.02}, 1 },
	                                    { "LevelM80", {0.235,0}, 1 },
	                                    {},
	                                    { "LevelM80", {0.22,0}, 1 },
	                                    { "LevelM80", {0.205,0}, 1 },
	                                    {},
	                                    { "LevelM80", {0.19,0}, 1 },
	                                    { "LevelM80", {0.175,0}, 1 },
	                                    {},
	                                    { "LevelM80", {0.16,0}, 1 },
	                                    { "LevelM80", {0.145,0}, 1 },
	                                    {},
	                                    { "LevelM80", {0.13,0}, 1 },
	                                    { "LevelM80", {0.115,0}, 1 },
	                                    {},
	                                    { "LevelM80", {0.1,0}, 1 },
	                                    { "LevelM80", {0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM80", {0.07,0}, 1 },
	                                    { "LevelM80", {0.055,0}, 1 },
	                                    {}
	                                };
	                            };
	                            class VALM_1_80
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -80;
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM80", {-0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM80", {-0.2,-0.032000002}, 1 };
	                                down[] = { "LevelM80", {-0.25999999,0.017999999}, 1 };
	                            };
	                            class VALM_1_80_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -80;
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM80", {0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM80", {0.31999999,-0.032000002}, 1 };
	                                down[] = { "LevelM80", {0.25999999,0.017999999}, 1 };
	                            };
	                            class LevelP80: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelP80", { "-0.22-0.015", 0.02 }, 1 },
	                                    { "LevelP80", { "-0.22-0.015", 0 }, 1 },
	                                    { "LevelP80", {-0.059999999,0}, 1 },
	                                    {},
	                                    { "LevelP80", {0.059999999,0}, 1 },
	                                    { "LevelP80", { "+0.22+0.015", 0 }, 1 },
	                                    { "LevelP80", { "+0.22+0.015", 0.02 }, 1 }
	                                };
	                            };
	                            class VALP_1_80
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "80";
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP80", {-0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP80", {-0.2,-0.017000001}, 1 };
	                                down[] = { "LevelP80", {-0.25999999,0.033}, 1 };
	                            };
	                            class VALP_1_80_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "80";
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP80", {0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP80", {0.31999999,-0.017000001}, 1 };
	                                down[] = { "LevelP80", {0.25999999,0.033}, 1 };
	                            };
	                            class LevelM90: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelM90", {-0.235,-0.02}, 1 },
	                                    { "LevelM90", {-0.235,0}, 1 },
	                                    {},
	                                    { "LevelM90", {-0.22,0}, 1 },
	                                    { "LevelM90", {-0.205,0}, 1 },
	                                    {},
	                                    { "LevelM90", {-0.19,0}, 1 },
	                                    { "LevelM90", {-0.175,0}, 1 },
	                                    {},
	                                    { "LevelM90", {-0.16,0}, 1 },
	                                    { "LevelM90", {-0.145,0}, 1 },
	                                    {},
	                                    { "LevelM90", {-0.13,0}, 1 },
	                                    { "LevelM90", {-0.115,0}, 1 },
	                                    {},
	                                    { "LevelM90", {-0.1,0}, 1 },
	                                    { "LevelM90", {-0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM90", {-0.07,0}, 1 },
	                                    { "LevelM90", {-0.055,0}, 1 },
	                                    {},
	                                    {},
	                                    { "LevelM90", {0.235,-0.02}, 1 },
	                                    { "LevelM90", {0.235,0}, 1 },
	                                    {},
	                                    { "LevelM90", {0.22,0}, 1 },
	                                    { "LevelM90", {0.205,0}, 1 },
	                                    {},
	                                    { "LevelM90", {0.19,0}, 1 },
	                                    { "LevelM90", {0.175,0}, 1 },
	                                    {},
	                                    { "LevelM90", {0.16,0}, 1 },
	                                    { "LevelM90", {0.145,0}, 1 },
	                                    {},
	                                    { "LevelM90", {0.13,0}, 1 },
	                                    { "LevelM90", {0.115,0}, 1 },
	                                    {},
	                                    { "LevelM90", {0.1,0}, 1 },
	                                    { "LevelM90", {0.085000001,0}, 1 },
	                                    {},
	                                    { "LevelM90", {0.07,0}, 1 },
	                                    { "LevelM90", {0.055,0}, 1 },
	                                    {}
	                                };
	                            };
	                            class VALM_1_90
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -90;
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM90", {-0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM90", {-0.2,-0.032000002}, 1 };
	                                down[] = { "LevelM90", {-0.25999999,0.017999999}, 1 };
	                            };
	                            class VALM_1_90_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = -90;
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelM90", {0.25999999,-0.032000002}, 1 };
	                                right[] = { "LevelM90", {0.31999999,-0.032000002}, 1 };
	                                down[] = { "LevelM90", {0.25999999,0.017999999}, 1 };
	                            };
	                            class LevelP90: Level0
	                            {
	                                type = "line";
	                                points[] =
	                                {
	                                    { "LevelP90", { "-0.22-0.015", 0.02 }, 1 },
	                                    { "LevelP90", { "-0.22-0.015", 0 }, 1 },
	                                    { "LevelP90", {-0.059999999,0}, 1 },
	                                    {},
	                                    { "LevelP90", {0.059999999,0}, 1 },
	                                    { "LevelP90", { "+0.22+0.015", 0 }, 1 },
	                                    { "LevelP90", { "+0.22+0.015", 0.02 }, 1 }
	                                };
	                            };
	                            class VALP_1_90
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "90";
	                                align = "left";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP90", {-0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP90", {-0.2,-0.017000001}, 1 };
	                                down[] = { "LevelP90", {-0.25999999,0.033}, 1 };
	                            };
	                            class VALP_1_90_R
	                            {
	                                type = "text";
	                                source = "static";
	                                text = "90";
	                                align = "right";
	                                scale = 1;
	                                sourceScale = 1;
	                                pos[] = { "LevelP90", {0.25999999,-0.017000001}, 1 };
	                                right[] = { "LevelP90", {0.31999999,-0.017000001}, 1 };
	                                down[] = { "LevelP90", {0.25999999,0.033}, 1 };
	                            };
	                        };
	                    };
	                    class UnhideOnTurn
	                    {
	                        condition = "abs(cameraDir-heading)*( (abs(heading-cameraDir))<=340)-20";
	                        class Cross
	                        {
	                            type = "line";
	                            width = 3;
	                            points[] =
	                            {
	                                { "PlaneW", {-0.02,0}, 1 },
	                                { "PlaneW", {-0.039999999,0}, 1 },
	                                {},
	                                { "PlaneW", {0.02,0}, 1 },
	                                { "PlaneW", {0.039999999,0}, 1 },
	                                {},
	                                { "PlaneW", {0,-0.019708}, 1 },
	                                { "PlaneW", {0,-0.039416101}, 1 },
	                                {},
	                                { "PlaneW", {0,0.019708}, 1 },
	                                { "PlaneW", {0,0.039416101}, 1 },
	                                {}
	                            };
	                        };
	                    };
	                };
	                class RadarBoxes
	                {
	                    type = "radartoview";
	                    pos0[] = {0.5,0.5};
	                    pos10[] = {0.773,0.773};
	                    width = 4;
	                    points[] =
	                    {
	                        { {-0.0020000001,-0.0020000001}, 1 },
	                        { {0.0020000001,-0.0020000001}, 1 },
	                        { {0.0020000001,0.0020000001}, 1 },
	                        { {-0.0020000001,0.0020000001}, 1 },
	                        { {-0.0020000001,-0.0020000001}, 1 }
	                    };
	                };
	                class TargetDiamond
	                {
	                    class shape
	                    {
	                        type = "line";
	                        width = 4;
	                        points[] =
	                        {
	                            { "Target", 1, "Limit0109", 1, {0.02,0.02}, 1 },
	                            { "Target", 1, "Limit0109", 1, {-0.02,0.02}, 1 },
	                            { "Target", 1, "Limit0109", 1, {-0.02,-0.02}, 1 },
	                            { "Target", 1, "Limit0109", 1, {0.02,-0.02}, 1 },
	                            { "Target", 1, "Limit0109", 1, {0.02,0.02}, 1 }
	                        };
	                    };
	                };
	            };
	        };
	    };

	    // ========== Sounds from VTOL version ==========
	    class Sounds
	    {
	        class EngineLowOut
	        {
	            sound[] = {"A3\Sounds_F_Exp\vehicles\air\VTOL_02\VTOL_02_engine_idle_ext",1,1,2100};
	            frequency = "1.0 min (rpm + 0.5)";
	            volume = "camPos*1*(rpm factor[0.95, 0])*(rpm factor[0, 0.95])";
	        };
	        class EngineHighOut
	        {
	            sound[] = {"A3\Sounds_F_Exp\vehicles\air\VTOL_02\VTOL_02_engine_max_ext",1,1.2,2500};
	            frequency = 1;
	            volume = "camPos*2*(rpm factor[0.5, 1.1])*(rpm factor[1.1, 0.5])";
	        };
	        class ForsageOut
	        {
	            sound[] = {"A3\Sounds_F_Exp\vehicles\air\VTOL_02\VTOL_02_forsage_ext",1.41254,1.2,2800};
	            frequency = "1";
	            volume = "engineOn*camPos*(thrust factor[0.4, 1.0])";
	            cone[] = {3.1400001,3.9200001,2,0.5};
	        };
	        class TurbineOut
	        {
	            sound[] = {"A3\Sounds_F_Exp\vehicles\air\VTOL_02\VTOL_02_turbine_ext",1,1,1800};
	            frequency = "rpm * (thrust/4 + 0.5)";
	            volume = "camPos * 1 * rpm * thrust * (rpm factor[0, 0.4])";
	        };
	        class TurbineHighOut
	        {
	            sound[] = {"A3\Sounds_F_Exp\vehicles\air\VTOL_02\VTOL_02_turbine_ext",1,1,1800};
	            frequency = "1.7 * (rpm factor[-5,1])";
	            volume = "0.8 * camPos * (rpm factor[-1,1]) * (rpm factor[0, 0.4])";
	        };
	        class WindNoiseOut
	        {
	            sound[] = {"A3\Sounds_F_EPC\CAS_02\noise",0.56234097,1,150};
	            frequency = "(0.1+(1.2*(speed factor[1, 150])))";
	            volume = "camPos*(speed factor[1, 150])";
	        };
	        class EngineLowInt
	        {
	            sound[] = {"A3\Sounds_F_Exp\vehicles\air\VTOL_02\VTOL_02_engine_idle_int",0.63095701,1,2100};
	            frequency = "1.0 min (rpm + 0.5)";
	            volume = "(1-camPos)*1*(rpm factor[0.95, 0])*(rpm factor[0, 0.95])";
	        };
	        class EngineHighInt
	        {
	            sound[] = {"A3\Sounds_F_Exp\vehicles\air\VTOL_02\VTOL_02_engine_max_int",0.63095701,1.2,2500};
	            frequency = 1;
	            volume = "(1-camPos)*2*(rpm factor[0.5, 1.1])*(rpm factor[1.1, 0.5])";
	        };
	        class ForsageInt
	        {
	            sound[] = {"A3\Sounds_F_Exp\vehicles\air\VTOL_02\VTOL_02_forsage_int",0.79432797,1.2,2800};
	            frequency = "1";
	            volume = "engineOn*(1-camPos)*(thrust factor[0.4, 1.0])";
	            cone[] = {3.1400001,3.9200001,2,0.5};
	        };
	        class TurbineInt
	        {
	            sound[] = {"A3\Sounds_F_Exp\vehicles\air\VTOL_02\VTOL_02_turbine_int",0.63095701,1,1800};
	            frequency = "rpm * (thrust/4 + 0.5)";
	            volume = "(1-camPos) * 1 * rpm * thrust * (rpm factor[0, 0.4])";
	        };
	        class TurbineHighInt
	        {
	            sound[] = {"A3\Sounds_F_Exp\vehicles\air\VTOL_02\VTOL_02_turbine_int",0.63095701,1,1800};
	            frequency = "1.7 * (rpm factor[-5,1])";
	            volume = "0.8 * (1-camPos) * (rpm factor[-1,1]) * (rpm factor[0, 0.4])";
	        };
	        class scrubLandInt
	        {
	            sound[] = {"A3\Sounds_F\vehicles\air\noises\wheelsInt",1,1,100};
	            frequency = 1;
	            volume = "2 * (1-camPos) * (scrubLand factor[0.02, 0.05]) * (1 - (lateralMovement factor [0.7,1]))";
	        };
	        class scrubLandExt
	        {
	            sound[] = {"A3\Sounds_F\dummysound",1,1,100};
	            frequency = 1;
	            volume = "camPos * (scrubLand factor[0.02, 0.05]) * (1 - (lateralMovement factor [0.7,1]))";
	        };
	        class RainExt
	        {
	            sound[] = {"A3\Sounds_F\vehicles\noises\rain1_ext",1.77828,1,100};
	            frequency = 1;
	            volume = "camPos * rain * (speed factor[50, 0])";
	        };
	        class RainInt
	        {
	            sound[] = {"A3\Sounds_F\vehicles\noises\rain1_int",1,1,100};
	            frequency = 1;
	            volume = "(1-camPos) * rain * (speed factor[50, 0])";
	        };
	        class WindInt
	        {
	            sound[] = {"A3\Sounds_F\vehicles\air\noises\wind_closed",0.56234097,1,50};
	            frequency = 1;
	            volume = "(1-camPos)*(speed factor[5, 50])*(speed factor[5, 50])";
	        };
	        class GStress
	        {
	            sound[] = {"A3\Sounds_F\vehicles\noises\vehicle_stress2c",1.99526,1,50};
	            frequency = 1;
	            volume = "engineOn * (1-camPos) * (gmeterZ factor[1.0, 2.5])";
	        };
	        class SpeedStress
	        {
	            sound[] = {"A3\Sounds_F\vehicles\noises\vehicle_stress3",0.50118703,1,50};
	            frequency = 1;
	            volume = "(1-camPos)*(speed factor[60,80])";
	        };
	    };

	    class AnimationSources: AnimationSources
	    {
	        class AddCargoHook
	        {
	            animPeriod = 1e-07;
	            initPhase = 0;
	            isComponent = 1;
	            source = "user";
	        };
	        class AddCargoHook_COver
	        {
	            animPeriod = 1e-07;
	            initPhase = 1;
	            isComponent = 1;
	            source = "user";
	        };
	        class cargoDoors
	        {
	            animPeriod = 5;
	            displayname = "Toggle Door";
	            initPhase = 0;
	            mass = 1;
	            onPhaseChanged = "_this call OPTRE_FC_fnc_pelican_toggleDoor;";
	            sound = "ServoRampSound_2";
	            source = "user";
	        };
	        class CollisionLightRed_source
	        {
	            markerLight = "CollisionRed";
	            source = "MarkerLight";
	        };
	        class CollisionLightWhite_source
	        {
	            markerLight = "CollisionWhite";
	            source = "MarkerLight";
	        };
	        class Gatling
	        {
	            source = "revolving";
	            weapon = "gatling_30mm";
	        };
	        class Gatling_flash
	        {
	            source = "ammorandom";
	            weapon = "gatling_30mm";
	        };
	        class gunHorz
	        {
	            animPeriod = 1;
	            initPhase = 0;
	            source = "user";
	        };
	        class gunVert
	        {
	            animPeriod = 1;
	            initPhase = 0;
	            source = "user";
	        };
	        class HideWeapon
	        {
	            animPeriod = 1e-05;
	            initPhase = 0;
	            source = "user";
	        };
	        class HitBatteries
	        {
	            hitpoint = "HitBatteries";
	            raw = 1;
	            source = "hit";
	        };
	        class HitEngine
	        {
	            hitpoint = "HitEngine";
	            raw = 1;
	            source = "hit";
	        };
	        class HitEngine1
	        {
	            hitpoint = "HitEngine1";
	            raw = 1;
	            source = "hit";
	        };
	        class HitEngine2
	        {
	            hitpoint = "HitEngine2";
	            raw = 1;
	            source = "hit";
	        };
	        class HitFuel
	        {
	            hitpoint = "HitFuel";
	            raw = 1;
	            source = "hit";
	        };
	        class HitGlass1
	        {
	            hitpoint = "HitGlass1";
	            raw = 1;
	            source = "Hit";
	        };
	        class HitGlass2
	        {
	            hitpoint = "HitGlass2";
	            raw = 1;
	            source = "Hit";
	        };
	        class HitGlass3
	        {
	            hitpoint = "HitGlass3";
	            raw = 1;
	            source = "Hit";
	        };
	        class HitGlass4
	        {
	            hitpoint = "HitGlass4";
	            raw = 1;
	            source = "Hit";
	        };
	        class HitGlass5
	        {
	            hitpoint = "HitGlass5";
	            raw = 1;
	            source = "Hit";
	        };
	        class HitGlass6
	        {
	            hitpoint = "HitGlass6";
	            raw = 1;
	            source = "Hit";
	        };
	        class HitHRotor
	        {
	            hitpoint = "HitHRotor";
	            raw = 1;
	            source = "hit";
	        };
	        class HitHydraulics
	        {
	            hitpoint = "HitHydraulics";
	            raw = 1;
	            source = "hit";
	        };
	        class HitTransmission
	        {
	            hitpoint = "HitTransmission";
	            raw = 1;
	            source = "hit";
	        };
	        class HitVRotor
	        {
	            hitpoint = "HitVRotor";
	            raw = 1;
	            source = "hit";
	        };
	        class HitWinch_Source
	        {
	            hitpoint = "HitWinch";
	            raw = 1;
	            source = "hit";
	        };
	        class Missiles_revolving
	        {
	            source = "revolving";
	            weapon = "missiles_DAGR";
	        };
	        class Proxy
	        {
	            animPeriod = 1;
	            initPhase = 0;
	            source = "user";
	        };
	        class wingControl
	        {
	            animPeriod = 1;
	            initPhase = 0;
	            source = "user";
	        };
	    };
		class Components: Components
		{
		    class SensorsManagerComponent
		    {
		        class Components
		        {
		            class IRSensorComponent: SensorTemplateIR
		            {
		                class AirTarget
		                {
		                    minRange = 500;
		                    maxRange = 4000;
		                    objectDistanceLimitCoef = -1;
		                    viewDistanceLimitCoef = 1;
		                };
		                class GroundTarget
		                {
		                    minRange = 500;
		                    maxRange = 3000;
		                    objectDistanceLimitCoef = -1;
		                    viewDistanceLimitCoef = 1;
		                };
		                angleRangeHorizontal = 90;
		                angleRangeVertical = 80;
		                maxTrackableSpeed = 1000;
		                animDirection = "mainGun";
						aimdown=-0.25;
		            };
					class VisualSensorComponent: SensorTemplateVisual
					{
						class AirTarget
						{
							minRange=500;
							maxRange=2000;
							objectDistanceLimitCoef=1;
							viewDistanceLimitCoef=1;
						};
						class GroundTarget
						{
							minRange=500;
							maxRange=1500;
							objectDistanceLimitCoef=1;
							viewDistanceLimitCoef=1;
						};
						maxTrackableSpeed=100;
						animDirection="mainGun";
						angleRangeHorizontal=46;
						angleRangeVertical=34;
						aimdown=-0.25;
					};
		            class ActiveRadarSensorComponent: SensorTemplateActiveRadar
		            {
		                class AirTarget
		                {
		                    minRange = 5000;
		                    maxRange = 6000;
		                    objectDistanceLimitCoef = -1;
		                    viewDistanceLimitCoef = -1;
		                };
		                class GroundTarget
		                {
		                    minRange = 4000;
		                    maxRange = 5000;
		                    objectDistanceLimitCoef = -1;
		                    viewDistanceLimitCoef = -1;
		                };
						angleRangeHorizontal=180;
		                angleRangeVertical = 90;
		                maxTrackableSpeed = 2000;
		                aimDown = 30;
						groundNoiseDistanceCoef=-1;
						maxGroundNoiseDistance=-1;
						minSpeedThreshold=0;
						maxSpeedThreshold=0;
		            };
					class PassiveRadarSensorComponent: SensorTemplatePassiveRadar
					{
					};
					class LaserSensorComponent: SensorTemplateLaser
					{
					};
					class NVSensorComponent: SensorTemplateNV
					{
					};
		        };
		    };
		};

	    // ========== Turrets with commented gunnerCompartments ==========
	    class Turrets: Turrets
	    {
	        class CopilotTurret: CopilotTurret
	        {
	            gunnerAction = "OPTRE_Pelican_Gunner";
	            gunnerInAction = "OPTRE_Pelican_Gunner";
	            precisegetinout = 1;
	            gunnerGetInAction = "pilot_Heli_Light_02_Enter";
	            gunnerGetOutAction = "pilot_Heli_Light_02_Exit";
	            memoryPointsGetInGunner = "Pos_Gunner";
	            memoryPointsGetInGunnerDir = "Pos_Gunner_dir";
	            canEject = 0;
	            body = "mainTurret";
	            gun = "mainGun";
	            animationSourceBody = "mainTurret";
	            animationSourceGun = "mainGun";
	            gunnerLeftHandAnimName = "";
	            gunnerRightHandAnimName = "";
	            maxHorizontalRotSpeed = 5;
	            maxVerticalRotSpeed = 5;
	            proxyindex = 1;
	            isCopilot = 1;
	            gunnerName = "Co-Pilot";
	            // gunnerCompartments = "Compartment0";
	            primaryGunner = 1;
	            visionMode[] = {"Normal","NVG","Ti"};
	            weapons[] = {"Laserdesignator_mounted"};
	            magazines[] = {"Laserbatteries"};
	            minElev = -90;
	            maxElev = 40;
	            initElev = -45;
	            minTurn = -180;
	            maxTurn = 180;
	            initTurn = 0;
	            stabilizedInAxes = "StabilizedInAxesBoth";
	            startEngine = 0;
	            class Viewoptics
	            {
	                minAngleX = -360;
	                maxAngleX = 360;
	                initAngleX = 0;
	                minAngleY = -360;
	                maxAngleY = 360;
	                initAngleY = 0;
	                initFov = 0.75;
	                minFov = 0.25;
	                maxFov = 0.75;
	                visionMode[] = {"Normal","NVG","Ti"};
	            };
	            class OpticsIn
	            {
	                class Wide
	                {
	                    initAngleX = 0;
	                    minAngleX = -30;
	                    maxAngleX = 30;
	                    initAngleY = 0;
	                    minAngleY = -100;
	                    maxAngleY = 100;
	                    initFov = 0.46599999;
	                    minFov = 0.46599999;
	                    maxFov = 0.46599999;
	                    directionStabilized = 1;
	                    opticsDisplayName = "W";
	                    visionMode[] = {"Normal","NVG","Ti"};
	                    thermalMode[] = {0,1};
	                    gunnerOpticsModel = "\A3\Weapons_F_Beta\Reticle\Heli_Attack_01_Optics_Gunner_wide_F";
	                };
	                class Medium: Wide
	                {
	                    initFov = 0.093000002;
	                    minFov = 0.093000002;
	                    maxFov = 0.093000002;
	                    opticsDisplayName = "M";
	                    gunnerOpticsModel = "\A3\Weapons_F_Beta\Reticle\Heli_Attack_01_Optics_Gunner_medium_F";
	                };
	                class Narrow: Wide
	                {
	                    initFov = 0.028999999;
	                    minFov = 0.028999999;
	                    maxFov = 0.028999999;
	                    opticsDisplayName = "N";
	                    gunnerOpticsModel = "\A3\Weapons_F_Beta\Reticle\Heli_Attack_01_Optics_Gunner_narrow_F";
	                };
	            };
	            class OpticsOut
	            {
	                class Monocular
	                {
	                    initAngleX = 0;
	                    minAngleX = -30;
	                    maxAngleX = 30;
	                    initAngleY = 0;
	                    minAngleY = -100;
	                    maxAngleY = 100;
	                    minFov = 0.25;
	                    maxFov = 1.25;
	                    initFov = 0.75;
	                    visionMode[] = {"Normal","NVG"};
	                    gunnerOpticsModel = "";
	                    gunnerOpticsEffect[] = {};
	                };
	            };
	            class Components
	            {
	                class VehicleSystemsDisplayManagerComponentLeft: DefaultVehicleSystemsDisplayManagerLeft
	                {
	                    class Components: Components
	                    {
	                        class VehiclePrimaryGunnerDisplay
	                        {
	                            componentType = "TransportFeedDisplayComponent";
	                            source = "PrimaryGunner";
	                        };
	                        class VehicleMissileDisplay
	                        {
	                            componentType = "TransportFeedDisplayComponent";
	                            source = "Missile";
	                        };
	                        class SensorDisplay
	                        {
	                            componentType = "SensorsDisplayComponent";
	                            range[] = {4000,2000,16000,8000};
	                            resource = "RscCustomInfoSensors";
	                        };
	                    };
	                };
	                class VehicleSystemsDisplayManagerComponentRight: DefaultVehicleSystemsDisplayManagerRight
	                {
	                    defaultDisplay = "SensorDisplay";
	                    class Components: Components
	                    {
	                        class VehiclePrimaryGunnerDisplay
	                        {
	                            componentType = "TransportFeedDisplayComponent";
	                            source = "PrimaryGunner";
	                        };
	                        class VehicleMissileDisplay
	                        {
	                            componentType = "TransportFeedDisplayComponent";
	                            source = "Missile";
	                        };
	                        class SensorDisplay
	                        {
	                            componentType = "SensorsDisplayComponent";
	                            range[] = {4000,2000,16000,8000};
	                            resource = "RscCustomInfoSensors";
	                        };
	                    };
	                };
	            };
	            soundServo[] = {"",0.0099999998,1};
	            outGunnerMayFire = 1;
	            commanding = -1;
	            gunBeg = "S_start";
	            gunEnd = "S_end";
	            memoryPointGunnerOptics = "gunner1";
	            selectionFireAnim = "";
	            castGunnerShadow = 0;
	            viewGunnerShadow = 0;
	            turretAxis = "axisturret1";
	            gunnerOpticsModel = "";
	            gunnerOpticsEffect[] = {"TankCommanderOptics1","BWTV"};
	            gunnerForceOptics = 0;
	            turretInfoType = "RscOptics_Heli_Attack_01_gunner";
	        };
	        class CargoTurret_01: CargoTurret
	        {
	            gunnerAction = "passenger_inside_2";
	            gunnerCompartments = "Compartment2";
	            memoryPointsGetInGunner = "pos_cargo_l";
	            memoryPointsGetInGunnerDir = "pos_cargo_l_dir";
	            gunnerName = "Passenger (Left door)";
	            proxyIndex = 1;
	            maxElev = 15;
	            minElev = -25;
	            maxTurn = 10;
	            minTurn = -50;
	            isPersonTurret = 1;
	            ejectDeadGunner = 0;
	            enabledByAnimationSource = "cargoDoors";
	            memoryPointGunnerOptics = "";
	        };
	        class CargoTurret_02: CargoTurret_01
	        {
	            memoryPointsGetInGunner = "pos_cargo_r";
	            memoryPointsGetInGunnerDir = "pos_cargo_r_dir";
	            gunnerName = "Passenger (Right door)";
	            proxyIndex = 2;
	            maxTurn = 50;
	            minTurn = -10;
	        };
	    };

	    // ========== Wing Vortices ==========
	    class WingVortices
	    {
	        class WingTipLeft
	        {
	            effectName = "WingVortices";
	            position = "positionlight_red_1_pos";
	        };
	        class WingTipRight
	        {
	            effectName = "WingVortices";
	            position = "positionlight_green_1_pos";
	        };
	    };
	};
	#include "VTOL_unarmed.hpp"
	#include "VTOL_armed.hpp"
	#include "VTOL_socom.hpp"
	//OPTRE FC spirit
	#include "covenant_VTOL.hpp"
};
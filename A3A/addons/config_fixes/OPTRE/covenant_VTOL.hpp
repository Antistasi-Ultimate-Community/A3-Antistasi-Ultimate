// config for converting Spirit into VTOL
class OPTRE_FC_Spirit_F: Helicopter_Base_F 
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
}
class A3U_OPTRE_Spirit_VTOL_Base: OPTRE_FC_Spirit_F
{
    scope = 0;
    author = "Spartanjackwar / wersal";
    displayName = "Type-25 Spirit VTOL Base";

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
    maxSpeed = 900; //I dunno
    landingSpeed = 0;
    altNoForce = 100000;
    altFullForce = 100000;
    thrustCoef[] = {2};
    throttleToThrustLogFactor = 2;
    vtol = 4;
    maxOmega = 2000;
    lightOnGear = 0;
    headGforceLeaningFactor[] = {0.0049999999,0.001,0.025};
	memoryPointLDust = "engine_4";
	memoryPointRDust = "engine_1";
	leftDustEffect = "LDustEffects";
	rightDustEffect = "RDustEffects";
	selectionRotorStill = "vrtule staticka";
	selectionRotorMove = "vrtule blur";
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
    numberPhysicalWheels = 0;
    fuelExplosionPower = 10;
    epeImpulseDamageCoef = 0.1;
    crewCrashProtection = 0.5;
    explosionShielding = 0.5;

    class MFD
	{
	    class AirplaneHUD
	    {
	        topLeft="HUD_top_left";
	        topRight="HUD_top_right";
	        bottomLeft="HUD_bottom_left";
	        borderLeft=0;
	        borderRight=0;
	        borderTop=0;
	        borderBottom=0;
	        color[]={0.15000001,0.15000001,1,1};
	        helmetMountedDisplay=1;
	        helmetPosition[]={-0.037500001,0.037500001,0.1};
	        helmetRight[]={0.075000003,0,0};
	        helmetDown[]={0,-0.075000003,0};
	        enableParallax=1;
	        font="LucidaConsoleB";
	        class Bones
	        {
	            class HUDCenter
	            {
	                type="fixed";
	                pos[]={0.5,0.5};
	            };
	            class HorizonBankSource
	            {
	                type="rotational";
	                source="HorizonBank";
	                center[]={0.5,0.5};
	                min=-6.2831001;
	                max=6.2831001;
	                minAngle=-360;
	                maxAngle=360;
	            };
	            class HorizonDiveSource
	            {
	                source="horizonDive";
	                type="linear";
	                min=-1;
	                max=1;
	                minPos[]={0.5,2.5};
	                maxPos[]={0.5,-1.5};
	            };
	            class VelocityVector
	            {
	                type="vector";
	                source="velocityToView";
	                pos0[]={0.5,0.5};
	                pos10[]={0.73400003,0.73000002};
	            };
	            class ForwardVector
	            {
	                type="vector";
	                source="forward";
	                pos0[]={0,0};
	                pos10[]={0.234,0.23};
	            };
	            class GunnerAim
	            {
	                type="vector";
	                source="weapon";
	                pos0[]={0,-0.0024999999};
	                pos10[]={0.0099999998,0.0024999999};
	            };
	            class WeaponAim
	            {
	                type="vector";
	                source="weaponToView";
	                pos0[]={0.5,0.5};
	                pos10[]={0.73400003,0.73000002};
	            };
	            class SliderDiveSource
	            {
	                type="linear";
	                source="horizonDive";
	                min="RAD(-10)";
	                max="RAD(10)";
	                minPos[]={0.105,0.38};
	                maxPos[]={0.105,0.54000002};
	            };
	            class SliderDiveSource30: SliderDiveSource
	            {
	                min="RAD(10)";
	                max="RAD(30)";
	                minPos[]={0,-0.039999999};
	                maxPos[]=
	                {
	                    0,
	                    "0)"
	                };
	            };
	            class SliderDiveSource90: SliderDiveSource30
	            {
	                min="RAD(30)";
	                max="RAD(90)";
	                minPos[]={0,-0.039999999};
	            };
	            class SliderDiveSource30m: SliderDiveSource
	            {
	                min="RAD(-30)";
	                max="RAD(-10)";
	                minPos[]={0,0};
	                maxPos[]={0,0.039999999};
	            };
	            class SliderDiveSource90m: SliderDiveSource30m
	            {
	                min="RAD(-90)";
	                max="RAD(-30)";
	                maxPos[]={0,0.039999999};
	            };
	            class SliderAltitudeSource
	            {
	                type="linear";
	                source="altitudeAGL";
	                sourceOffset=-3;
	                min=0;
	                max=1000;
	                minPos[]={0.88499999,0.2};
	                maxPos[]={0.88499999,0.375};
	            };
	            class GForceSource
	            {
	                type="linear";
	                source="gmeter";
	                sourceScale=0.15000001;
	                min=-1;
	                max=3;
	                minPos[]={0.105,0.69999999};
	                maxPos[]={0.105,0.86000001};
	            };
	            class SliderVSpeedSource
	            {
	                type="linear";
	                source="vspeed";
	                min=-15;
	                max=15;
	                minPos[]={0.79500002,0.60000002};
	                maxPos[]={0.79500002,0.83999997};
	            };
	            class ImpactPoint
	            {
	                type="vector";
	                source="ImpactPointToView";
	                pos0[]={0.5,0.5};
	                pos10[]={0.73400003,0.73000002};
	            };
	            class WPPoint
	            {
	                type="vector";
	                source="WPPointToView";
	                pos0[]={0.5,0.5};
	                pos10[]={0.73400003,0.73000002};
	            };
	            class rtdRPM1
	            {
	                type="linear";
	                source="rpm";
	                min=0.1;
	                max=1;
	                minPos[]={0,-0.075000003};
	                maxPos[]={0,0};
	            };
	            class rtdRPM2: rtdRPM1
	            {
	                source="rpm";
	            };
	            class Limit0109
	            {
	                type="limit";
	                limits[]={0.1,0.1,0.89999998,0.89999998};
	            };
	            class Target
	            {
	                source="targettoview";
	                type="vector";
	                pos0[]={0.5,0.5};
	                pos10[]={0.73400003,0.73000002};
	            };
	            class MissileFlightTimeRot1
	            {
	                type="rotational";
	                source="MissileFlightTime";
	                sourceScale=0.46000001;
	                center[]={0,0};
	                min=0;
	                max=0.5;
	                minAngle=0;
	                maxAngle=18;
	                aspectRatio=0.98290598;
	            };
	            class MissileFlightTimeRot2: MissileFlightTimeRot1
	            {
	                maxAngle=36;
	                max=1;
	            };
	            class MissileFlightTimeRot3: MissileFlightTimeRot1
	            {
	                maxAngle=54;
	                max=1.5;
	            };
	            class MissileFlightTimeRot4: MissileFlightTimeRot1
	            {
	                maxAngle=72;
	                max=2;
	            };
	            class MissileFlightTimeRot5: MissileFlightTimeRot1
	            {
	                maxAngle=90;
	                max=2.5;
	            };
	            class MissileFlightTimeRot6: MissileFlightTimeRot1
	            {
	                maxAngle=108;
	                max=3;
	            };
	            class MissileFlightTimeRot7: MissileFlightTimeRot1
	            {
	                maxAngle=126;
	                max=3.5;
	            };
	            class MissileFlightTimeRot8: MissileFlightTimeRot1
	            {
	                maxAngle=144;
	                max=4;
	            };
	            class MissileFlightTimeRot9: MissileFlightTimeRot1
	            {
	                maxAngle=162;
	                max=4.5;
	            };
	            class MissileFlightTimeRot10: MissileFlightTimeRot1
	            {
	                maxAngle=180;
	                max=5;
	            };
	            class MissileFlightTimeRot11: MissileFlightTimeRot1
	            {
	                maxAngle=198;
	                max=5.5;
	            };
	            class MissileFlightTimeRot12: MissileFlightTimeRot1
	            {
	                maxAngle=216;
	                max=6;
	            };
	            class MissileFlightTimeRot13: MissileFlightTimeRot1
	            {
	                maxAngle=234;
	                max=6.5;
	            };
	            class MissileFlightTimeRot14: MissileFlightTimeRot1
	            {
	                maxAngle=252;
	                max=7;
	            };
	            class MissileFlightTimeRot15: MissileFlightTimeRot1
	            {
	                maxAngle=270;
	                max=7.5;
	            };
	            class MissileFlightTimeRot16: MissileFlightTimeRot1
	            {
	                maxAngle=288;
	                max=8;
	            };
	            class MissileFlightTimeRot17: MissileFlightTimeRot1
	            {
	                maxAngle=306;
	                max=8.5;
	            };
	            class MissileFlightTimeRot18: MissileFlightTimeRot1
	            {
	                maxAngle=324;
	                max=9;
	            };
	            class MissileFlightTimeRot19: MissileFlightTimeRot1
	            {
	                maxAngle=342;
	                max=9.5;
	            };
	            class MissileFlightTimeRot20: MissileFlightTimeRot1
	            {
	                maxAngle=360;
	                max=10;
	            };
	            class HorizonBankRotFull
	            {
	                type="rotational";
	                source="horizonBank";
	                center[]={0,0};
	                min=-3.1415999;
	                max=3.1415999;
	                minAngle=-180;
	                maxAngle=180;
	                aspectRatio=1;
	            };
	            class Airport1
	            {
	                type="vector";
	                source="airportCorner1";
	                pos0[]={0.5,0.5};
	                pos10[]={0.73400003,0.73000002};
	            };
	            class Airport2: Airport1
	            {
	                source="airportCorner2";
	            };
	            class Airport3: Airport1
	            {
	                source="airportCorner3";
	            };
	            class Airport4: Airport1
	            {
	                source="airportCorner4";
	            };
	            class ILS_H
	            {
	                type="ils";
	                pos0[]={0.5,0.5};
	                pos3[]={0.57020003,0.5};
	            };
	            class ILS_W: ILS_H
	            {
	                pos3[]={0.5,0.56900001};
	            };
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
	        };
	        class Draw
	        {
	            alpha=1;
	            color[]={0.15000001,0.15000001,1,1};
	            condition="on";
	            class VelocityLine
	            {
	                type="line";
	                width=2;
	                points[]=
	                {
	                    { "HUDCenter", 1 },
	                    { "VelocityVector", 1 },
	                    {},
	                    { "VelocityVector", {0,-0.0049145301}, 1 },
	                    { "VelocityVector", {0.0024999999,-0.0042559798}, 1 },
	                    { "VelocityVector", {0.0043299999,-0.0024572599}, 1 },
	                    { "VelocityVector", {0.0049999999,0}, 1 },
	                    { "VelocityVector", {0.0043299999,0.0024572599}, 1 },
	                    { "VelocityVector", {0.0024999999,0.0042559798}, 1 },
	                    { "VelocityVector", {0,0.0049145301}, 1 },
	                    { "VelocityVector", {-0.0024999999,0.0042559798}, 1 },
	                    { "VelocityVector", {-0.0043299999,0.0024572599}, 1 },
	                    { "VelocityVector", {-0.0049999999,0}, 1 },
	                    { "VelocityVector", {-0.0043299999,-0.0024572599}, 1 },
	                    { "VelocityVector", {-0.0024999999,-0.0042559798}, 1 },
	                    { "VelocityVector", {0,-0.0049145301}, 1 },
	                    {}
	                };
	            };
	            class Static
	            {
	                type="line";
	                width=3;
	                points[]=
	                {
	                    { "SliderDiveSource90", 1, "SliderDiveSource30", 1, "SliderDiveSource", 1, "SliderDiveSource30m", 1, "SliderDiveSource90m", 1, {0.015,0.0099999998}, 1 },
	                    { "SliderDiveSource90", 1, "SliderDiveSource30", 1, "SliderDiveSource", 1, "SliderDiveSource30m", 1, "SliderDiveSource90m", 1, {0,0}, 1 },
	                    { "SliderDiveSource90", 1, "SliderDiveSource30", 1, "SliderDiveSource", 1, "SliderDiveSource30m", 1, "SliderDiveSource90m", 1, {0.015,-0.0099999998}, 1 },
	                    { "SliderDiveSource90", 1, "SliderDiveSource30", 1, "SliderDiveSource", 1, "SliderDiveSource30m", 1, "SliderDiveSource90m", 1, {0.015,0.0099999998}, 1 },
	                    {},
	                    { "SliderDiveSource90", 1, "SliderDiveSource30", 1, "SliderDiveSource", 1, "SliderDiveSource30m", 1, "SliderDiveSource90m", 1, {0.029999999,0.015}, 1 },
	                    { "SliderDiveSource90", 1, "SliderDiveSource30", 1, "SliderDiveSource", 1, "SliderDiveSource30m", 1, "SliderDiveSource90m", 1, {0.088,0.015}, 1 },
	                    { "SliderDiveSource90", 1, "SliderDiveSource30", 1, "SliderDiveSource", 1, "SliderDiveSource30m", 1, "SliderDiveSource90m", 1, {0.088,-0.015}, 1 },
	                    { "SliderDiveSource90", 1, "SliderDiveSource30", 1, "SliderDiveSource", 1, "SliderDiveSource30m", 1, "SliderDiveSource90m", 1, {0.029999999,-0.015}, 1 },
	                    { "SliderDiveSource90", 1, "SliderDiveSource30", 1, "SliderDiveSource", 1, "SliderDiveSource30m", 1, "SliderDiveSource90m", 1, {0.029999999,0.015}, 1 },
	                    {},
	                    { {0.1,0.30000001}, 1 },
	                    { {0.1,0.62}, 1 },
	                    {},
	                    { {0.1,0.30000001}, 1 },
	                    { {0.079999998,0.30000001}, 1 },
	                    {},
	                    { {0.1,0.34}, 1 },
	                    { {0.079999998,0.34}, 1 },
	                    {},
	                    { {0.1,0.38}, 1 },
	                    { {0.079999998,0.38}, 1 },
	                    {},
	                    { {0.1,0.46000001}, 1 },
	                    { {0.079999998,0.46000001}, 1 },
	                    {},
	                    { {0.1,0.54000002}, 1 },
	                    { {0.079999998,0.54000002}, 1 },
	                    {},
	                    { {0.1,0.57999998}, 1 },
	                    { {0.079999998,0.57999998}, 1 },
	                    {},
	                    { {0.1,0.62}, 1 },
	                    { {0.079999998,0.62}, 1 },
	                    {},
	                    { "GForceSource", {0.015,0.0099999998}, 1 },
	                    { "GForceSource", {0,0}, 1 },
	                    { "GForceSource", {0.015,-0.0099999998}, 1 },
	                    { "GForceSource", {0.015,0.0099999998}, 1 },
	                    {},
	                    { {0.1,0.68800002}, 1 },
	                    { {0.1,0.81999999}, 1 },
	                    {},
	                    { {0.1,0.69999999}, 1 },
	                    { {0.079999998,0.69999999}, 1 },
	                    {},
	                    { {0.1,0.74000001}, 1 },
	                    { {0.079999998,0.74000001}, 1 },
	                    {},
	                    { {0.1,0.77999997}, 1 },
	                    { {0.079999998,0.77999997}, 1 },
	                    {},
	                    { {0.1,0.81999999}, 1 },
	                    { {0.079999998,0.81999999}, 1 },
	                    {},
	                    { {0.40000001,0.86000001}, 1 },
	                    { {0.40000001,0.94}, 1 },
	                    { {0.60000002,0.94}, 1 },
	                    { {0.60000002,0.86000001}, 1 },
	                    { {0.40000001,0.86000001}, 1 },
	                    {},
	                    { {0.40000001,0.88499999}, 1 },
	                    { {0.40799999,0.88499999}, 1 },
	                    {},
	                    { {0.60000002,0.88499999}, 1 },
	                    { {0.59200001,0.88499999}, 1 },
	                    {},
	                    { {0.5,0.86000001}, 1 },
	                    { {0.5,0.86799997}, 1 },
	                    {},
	                    { {0.5,0.94}, 1 },
	                    { {0.5,0.93199998}, 1 },
	                    {},
	                    { {0.51999998,0.079999998}, 1 },
	                    { {0.5,0.11}, 1 },
	                    { {0.47999999,0.079999998}, 1 },
	                    { {0.51999998,0.079999998}, 1 },
	                    {},
	                    { {0.46000001,0.07}, 1 },
	                    { {0.54000002,0.07}, 1 },
	                    { {0.54000002,0.035}, 1 },
	                    { {0.46000001,0.035}, 1 },
	                    { {0.46000001,0.07}, 1 },
	                    {},
	                    { {0.15000001,0.115}, 1 },
	                    { {0.85000002,0.115}, 1 },
	                    {},
	                    { {0,0.95999998}, 1 },
	                    { {1.1,0.95999998}, 1 },
	                    {},
	                    { {0.47999999,0.5}, 1 },
	                    { {0.49000001,0.5}, 1 },
	                    {},
	                    { {0.50999999,0.5}, 1 },
	                    { {0.51999998,0.5}, 1 },
	                    {},
	                    { {0.5,0.49000001}, 1 },
	                    { {0.5,0.47999999}, 1 },
	                    {},
	                    { {0.5,0.50999999}, 1 },
	                    { {0.5,0.51999998}, 1 },
	                    {},
	                    { "WeaponAim", 1, {-0.02,0}, 1 },
	                    { "WeaponAim", 1, {-0.0099999998,0}, 1 },
	                    {},
	                    { "WeaponAim", 1, {0.0099999998,0}, 1 },
	                    { "WeaponAim", 1, {0.02,0}, 1 },
	                    {},
	                    { "WeaponAim", 1, {0,-0.0099999998}, 1 },
	                    { "WeaponAim", 1, {0,-0.02}, 1 },
	                    {},
	                    { "WeaponAim", 1, {0,0.0099999998}, 1 },
	                    { "WeaponAim", 1, {0,0.02}, 1 },
	                    {},
	                    { "HUDCenter", {-0.16500001,7.0890902e-009}, 1 },
	                    { "HUDCenter", {-0.22,9.45212e-009}, 1 },
	                    {},
	                    { "HUDCenter", {0.16500001,-1.9339701e-009}, 1 },
	                    { "HUDCenter", {0.22,-2.57863e-009}, 1 },
	                    {},
	                    { "HUDCenter", {-0.082500003,0.140452}, 1 },
	                    { "HUDCenter", {-0.096249998,0.16385999}, 1 },
	                    {},
	                    { "HUDCenter", {0.082500003,0.140452}, 1 },
	                    { "HUDCenter", {0.096249998,0.16385999}, 1 },
	                    {},
	                    { "HUDCenter", {-0.142894,0.081089802}, 1 },
	                    { "HUDCenter", {-0.16671,0.094604701}, 1 },
	                    {},
	                    { "HUDCenter", {0.142894,0.081089698}, 1 },
	                    { "HUDCenter", {0.16671,0.094604701}, 1 },
	                    {},
	                    { "HUDCenter", {-0.116673,0.114678}, 1 },
	                    { "HUDCenter", {-0.155564,0.152904}, 1 },
	                    {},
	                    { "HUDCenter", {0.116673,0.114678}, 1 },
	                    { "HUDCenter", {0.155563,0.152904}, 1 },
	                    {},
	                    {}
	                };
	            };
	            class Gunner
	            {
	                type="line";
	                width=4;
	                points[]=
	                {
	                    { "GunnerAim", {0.48500001,0.89200002}, 1 },
	                    { "GunnerAim", {0.48500001,0.90799999}, 1 },
	                    { "GunnerAim", {0.51499999,0.90799999}, 1 },
	                    { "GunnerAim", {0.51499999,0.89200002}, 1 },
	                    { "GunnerAim", {0.48500001,0.89200002}, 1 }
	                };
	            };
	            class DiveNumber
	            {
	                type="text";
	                source="horizondive";
	                sourceScale=57.29578;
	                sourceOffset=0;
	                align="left";
	                scale=1;
	                pos[]={ "SliderDiveSource90",1,"SliderDiveSource30",1,"SliderDiveSource",1,"SliderDiveSource30m",1,"SliderDiveSource90m",1, {0.085000001,"0.00-0.011"},1 };
	                right[]={ "SliderDiveSource90",1,"SliderDiveSource30",1,"SliderDiveSource",1,"SliderDiveSource30m",1,"SliderDiveSource90m",1, {0.12,"0.00-0.011"},1 };
	                down[]={ "SliderDiveSource90",1,"SliderDiveSource30",1,"SliderDiveSource",1,"SliderDiveSource30m",1,"SliderDiveSource90m",1, {0.085000001,"0.03-0.011"},1 };
	            };
	            class VSpeedGroup
	            {
	                condition="on";
	                class VSpeedNumber
	                {
	                    type="text";
	                    source="vspeed";
	                    sourceScale=1;
	                    align="center";
	                    scale=1;
	                    pos[]={ { "0.82+0.07", 0.72799999 }, 1 };
	                    right[]={ { "0.86+0.07", 0.72799999 }, 1 };
	                    down[]={ { "0.82+0.07", 0.76300001 }, 1 };
	                };
	                class Static
	                {
	                    type="line";
	                    width=3;
	                    points[]=
	                    {
	                        { {0.84899998,0.75999999}, 1 },
	                        { {0.92900002,0.75999999}, 1 },
	                        { {0.92900002,0.72500002}, 1 },
	                        { {0.84899998,0.72500002}, 1 },
	                        { {0.84899998,0.75999999}, 1 },
	                        {}
	                    };
	                };
	            };
	            class VSpeedGroupUp
	            {
	                condition="vspeed";
	                class Static
	                {
	                    type="line";
	                    width=3;
	                    points[]=
	                    {
	                        { {0.86900002,0.71499997}, 1 },
	                        { {0.90899998,0.71499997}, 1 },
	                        { {0.889,0.69499999}, 1 },
	                        { {0.86900002,0.71499997}, 1 },
	                        {}
	                    };
	                };
	            };
	            class VSpeedGroupDown
	            {
	                condition="-vspeed";
	                class Static
	                {
	                    type="line";
	                    width=3;
	                    points[]=
	                    {
	                        { {0.86900002,0.76999998}, 1 },
	                        { {0.90899998,0.76999998}, 1 },
	                        { {0.889,0.79000002}, 1 },
	                        { {0.86900002,0.76999998}, 1 },
	                        {}
	                    };
	                };
	            };
	            class AltGroup
	            {
	                condition="1000 - altitudeAGL";
	                class Static
	                {
	                    type="line";
	                    width=3;
	                    points[]=
	                    {
	                        { "SliderAltitudeSource", {0.024,0.0099999998}, 1 },
	                        { "SliderAltitudeSource", {0.0089999996,0}, 1 },
	                        { "SliderAltitudeSource", {0.024,-0.0099999998}, 1 },
	                        { "SliderAltitudeSource", {0.024,0.0099999998}, 1 },
	                        {},
	                        { "SliderAltitudeSource", {0.035,0.015}, 1 },
	                        { "SliderAltitudeSource", {0.093000002,0.015}, 1 },
	                        { "SliderAltitudeSource", {0.093000002,-0.015}, 1 },
	                        { "SliderAltitudeSource", {0.035,-0.015}, 1 },
	                        { "SliderAltitudeSource", {0.035,0.015}, 1 },
	                        {},
	                        { {0.889,0.2}, 1 },
	                        { {0.889,0.375}, 1 },
	                        {},
	                        { {0.87900001,0.2}, 1 },
	                        { {0.89899999,0.2}, 1 },
	                        {},
	                        { {0.87900001,0.375}, 1 },
	                        { {0.89899999,0.375}, 1 },
	                        {}
	                    };
	                };
	                class AltNumber
	                {
	                    type="text";
	                    source="altitudeAGL";
	                    sourceScale=1;
	                    sourceOffset=-3;
	                    align="left";
	                    scale=1;
	                    pos[]={ "SliderAltitudeSource", {0.085000001,"0.00-0.011"}, 1 };
	                    right[]={ "SliderAltitudeSource", {0.11,"0.00-0.011"}, 1 };
	                    down[]={ "SliderAltitudeSource", {0.085000001,"0.03-0.011"}, 1 };
	                };
	                class AltStatic50
	                {
	                    type="text";
	                    source="static";
	                    text="1000";
	                    scale=1;
	                    sourceScale=1;
	                    align="center";
	                    pos[]={ {0.88499999,0.171}, 1 };
	                    right[]={ {0.92500001,0.171}, 1 };
	                    down[]={ {0.88499999,0.20100001}, 1 };
	                };
	            };
	            class SpeedNumber
	            {
	                type="text";
	                source="speed";
	                sourceScale=3.5999999;
	                sourceLength=3;
	                align="left";
	                scale=1;
	                pos[]={ {0.13,0.22}, 1 };
	                down[]={ {0.13,0.25999999}, 1 };
	                right[]={ {0.2,0.22}, 1 };
	            };
	            class HeadingNumber
	            {
	                type="text";
	                source="heading";
	                sourceScale=1;
	                align="center";
	                scale=1;
	                pos[]={ { "0.80-0.302", "0.082-0.043" }, 1 };
	                right[]={ { "0.84-0.302", "0.082-0.043" }, 1 };
	                down[]={ { "0.80-0.302", "0.117-0.043" }, 1 };
	            };
	            class Angle_90
	            {
	                type="text";
	                source="static";
	                text="90";
	                scale=1;
	                sourceScale=1;
	                align="left";
	                pos[]={ {0.07,0.285}, 1 };
	                right[]={ {0.11,0.285}, 1 };
	                down[]={ {0.07,0.315}, 1 };
	            };
	            class Angle_30
	            {
	                type="text";
	                source="static";
	                text="30";
	                scale=1;
	                sourceScale=1;
	                align="left";
	                pos[]={ {0.07,0.32499999}, 1 };
	                right[]={ {0.11,0.32499999}, 1 };
	                down[]={ {0.07,0.35499999}, 1 };
	            };
	            class Angle_10
	            {
	                type="text";
	                source="static";
	                text="10";
	                scale=1;
	                sourceScale=1;
	                align="left";
	                pos[]={ {0.07,0.36500001}, 1 };
	                right[]={ {0.11,0.36500001}, 1 };
	                down[]={ {0.07,0.39500001}, 1 };
	            };
	            class Angle_0
	            {
	                type="text";
	                source="static";
	                text="0";
	                scale=1;
	                sourceScale=1;
	                align="left";
	                pos[]={ {0.07,0.44499999}, 1 };
	                right[]={ {0.11,0.44499999}, 1 };
	                down[]={ {0.07,0.47499999}, 1 };
	            };
	            class Angle_10m
	            {
	                type="text";
	                source="static";
	                text="-10";
	                scale=1;
	                sourceScale=1;
	                align="left";
	                pos[]={ {0.07,0.52499998}, 1 };
	                right[]={ {0.11,0.52499998}, 1 };
	                down[]={ {0.07,0.55500001}, 1 };
	            };
	            class Angle_30m
	            {
	                type="text";
	                source="static";
	                text="-30";
	                scale=1;
	                sourceScale=1;
	                align="left";
	                pos[]={ {0.07,0.565}, 1 };
	                right[]={ {0.11,0.565}, 1 };
	                down[]={ {0.07,0.59500003}, 1 };
	            };
	            class Angle_90m
	            {
	                type="text";
	                source="static";
	                text="-90";
	                scale=1;
	                sourceScale=1;
	                align="left";
	                pos[]={ {0.07,0.60500002}, 1 };
	                right[]={ {0.11,0.60500002}, 1 };
	                down[]={ {0.07,0.63499999}, 1 };
	            };
	            class GMeterStatic3
	            {
	                type="text";
	                source="static";
	                text="3";
	                scale=1;
	                sourceScale=1;
	                align="left";
	                pos[]={ {0.07,0.68300003}, 1 };
	                right[]={ {0.11,0.68300003}, 1 };
	                down[]={ {0.07,0.713}, 1 };
	            };
	            class GMeterStatic2
	            {
	                type="text";
	                source="static";
	                text="2";
	                scale=1;
	                sourceScale=1;
	                align="left";
	                pos[]={ {0.07,0.72299999}, 1 };
	                right[]={ {0.11,0.72299999}, 1 };
	                down[]={ {0.07,0.75300002}, 1 };
	            };
	            class GMeterStatic1
	            {
	                type="text";
	                source="static";
	                text="1";
	                scale=1;
	                sourceScale=1;
	                align="left";
	                pos[]={ {0.07,0.76300001}, 1 };
	                right[]={ {0.11,0.76300001}, 1 };
	                down[]={ {0.07,0.79299998}, 1 };
	            };
	            class GMeterStatic0
	            {
	                type="text";
	                source="static";
	                text="0";
	                scale=1;
	                sourceScale=1;
	                align="left";
	                pos[]={ {0.07,0.80299997}, 1 };
	                right[]={ {0.11,0.80299997}, 1 };
	                down[]={ {0.07,0.833}, 1 };
	            };
	            class CollectiveNumber
	            {
	                type="text";
	                source="throttle";
	                sourceScale=100;
	                align="left";
	                scale=1;
	                pos[]={ {0.889,0.46000001}, 1 };
	                right[]={ {0.93900001,0.46000001}, 1 };
	                down[]={ {0.889,0.495}, 1 };
	            };
	            class CollectiveText
	            {
	                type="text";
	                source="static";
	                text="%";
	                scale=1;
	                sourceScale=1;
	                align="right";
	                pos[]={ {0.89899999,0.46000001}, 1 };
	                right[]={ {0.949,0.46000001}, 1 };
	                down[]={ {0.89899999,0.495}, 1 };
	            };
	            class HeadingScale
	            {
	                type="scale";
	                horizontal=1;
	                source="heading";
	                sourceScale=0.1;
	                sourceoffset=0;
	                width=3;
	                NeverEatSeaWeed=1;
	                top=0.15000001;
	                center=0.5;
	                bottom=0.85000002;
	                lineXleft=0.114;
	                lineYright=0.12;
	                lineXleftMajor=0.114;
	                lineYrightMajor=0.13;
	                majorLineEach=2;
	                numberEach=6;
	                step=0.5;
	                stepSize=0.034482799;
	                align="center";
	                scale=1;
	                pos[]={0.15000001,0.13};
	                right[]={0.20999999,0.13};
	                down[]={0.15000001,0.17};
	            };
	            class HorizonBanking
	            {
	                type="line";
	                width=3;
	                clipTL[]={0,0.1};
	                clipBR[]={1,0.89999998};
	                points[]=
	                {
	                    { "HorizonBankSource", {0.16,0}, 1 },
	                    { "HorizonBankSource", {0.1,0}, 1 },
	                    { "HorizonBankSource", {0.085000001,-0.015}, 1 },
	                    { "HorizonBankSource", {0.07,0}, 1 },
	                    { "HorizonBankSource", {0.050000001,0}, 1 },
	                    {},
	                    { "HorizonBankSource", {-0.16,0}, 1 },
	                    { "HorizonBankSource", {-0.1,0}, 1 },
	                    { "HorizonBankSource", {-0.085000001,-0.015}, 1 },
	                    { "HorizonBankSource", {-0.07,0}, 1 },
	                    { "HorizonBankSource", {-0.050000001,0}, 1 },
	                    {}
	                };
	            };
	            class CoordXNumber
	            {
	                type="text";
	                source="coordinateX";
	                sourceScale=0.0099999998;
	                sourceLength=3;
	                sourceOffset=-0.5;
	                align="right";
	                scale=1;
	                pos[]={ {0.80900002,0.96100003}, 1 };
	                right[]={ {0.85900003,0.96100003}, 1 };
	                down[]={ {0.80900002,0.99599999}, 1 };
	            };
	            class CoordYNumber: CoordXNumber
	            {
	                source="coordinateY";
	                pos[]={ {0.89899999,0.96100003}, 1 };
	                right[]={ {0.949,0.96100003}, 1 };
	                down[]={ {0.89899999,0.99599999}, 1 };
	            };
	            class Time: CoordXNumber
	            {
	                source="time";
	                text="%X";
	                align="left";
	                pos[]={ {0.60500002,0.96100003}, 1 };
	                right[]={ {0.65499997,0.96100003}, 1 };
	                down[]={ {0.60500002,0.99599999}, 1 };
	            };
	            class CurrentWeapon
	            {
	                type="text";
	                source="weapon";
	                sourceScale=1;
	                align="left";
	                scale=1;
	                pos[]={ {0.97899997,0.889}, 1 };
	                right[]={ {1.029,0.889}, 1 };
	                down[]={ {0.97899997,0.92400002}, 1 };
	            };
	            class CurrentAmmo: CurrentWeapon
	            {
	                source="ammo";
	                align="left";
	                pos[]={ {0.97899997,0.921}, 1 };
	                right[]={ {1.029,0.921}, 1 };
	                down[]={ {0.97899997,0.95599997}, 1 };
	            };
	            class CoordXText
	            {
	                type="text";
	                source="static";
	                text="GRID:";
	                scale=1;
	                sourceScale=1;
	                align="right";
	                pos[]={ {0.65499997,0.96100003}, 1 };
	                right[]={ {0.70499998,0.96100003}, 1 };
	                down[]={ {0.65499997,0.99599999}, 1 };
	            };
	            class CoordYText
	            {
	                type="text";
	                source="static";
	                text="";
	                scale=1;
	                sourceScale=1;
	                align="right";
	                pos[]={ {0.875,0.96100003}, 1 };
	                right[]={ {0.92500001,0.96100003}, 1 };
	                down[]={ {0.875,0.99599999}, 1 };
	            };
	            class LightsGroup
	            {
	                condition="lights";
	                class LightsText
	                {
	                    type="text";
	                    source="static";
	                    text="LIGHT";
	                    align="left";
	                    scale=1;
	                    pos[]={ {0.149,0.96100003}, 1 };
	                    right[]={ {0.199,0.96100003}, 1 };
	                    down[]={ {0.149,0.99599999}, 1 };
	                };
	            };
	            class CollisionLights
	            {
	                condition="collisionlights";
	                class CollisionLightsText
	                {
	                    type="text";
	                    source="static";
	                    text="COLL";
	                    align="left";
	                    scale=1;
	                    pos[]={ {0.30899999,0.96100003}, 1 };
	                    right[]={ {0.359,0.96100003}, 1 };
	                    down[]={ {0.30899999,0.99599999}, 1 };
	                };
	            };
	            class WeaponsLocking
	            {
	                condition="missilelocking";
	                blinkingPattern[]={0.2,0.2};
	                blinkingStartsOn=1;
	                class Text
	                {
	                    type="text";
	                    source="static";
	                    text="LOCKING";
	                    align="center";
	                    scale=1;
	                    pos[]={ {0.215,0.87970102}, 1 };
	                    right[]={ {0.27500001,0.87970102}, 1 };
	                    down[]={ {0.215,0.928846}, 1 };
	                };
	            };
	            class TargetInfo
	            {
	                condition="missilelocked";
	                class TargetLockedText
	                {
	                    type="text";
	                    source="static";
	                    text="TARGET ACQUIRED";
	                    scale=1;
	                    sourceScale=1;
	                    align="center";
	                    pos[]={ {0.19499999,0.85900003}, 1 };
	                    right[]={ {0.235,0.85900003}, 1 };
	                    down[]={ {0.19499999,0.88999999}, 1 };
	                };
	                class TimeOfFlightText
	                {
	                    type="text";
	                    source="static";
	                    text="TOF:";
	                    scale=1;
	                    sourceScale=1;
	                    align="left";
	                    pos[]={ { "0.127+0.13", 0.889 }, 1 };
	                    right[]={ {0.30199999,0.889}, 1 };
	                    down[]={ { "0.127+0.13", 0.92400002 }, 1 };
	                };
	                class DistanceText
	                {
	                    type="text";
	                    source="static";
	                    text="DISTANCE:";
	                    scale=1;
	                    sourceScale=1;
	                    align="left";
	                    pos[]={ { "0.125+0.13", 0.921 }, 1 };
	                    right[]={ {0.30000001,0.921}, 1 };
	                    down[]={ { "0.125+0.13", 0.95599997 }, 1 };
	                };
	                class TOF_source: CurrentWeapon
	                {
	                    source="missileflighttime";
	                    align="right";
	                    pos[]={ {0.26899999,0.889}, 1 };
	                    right[]={ {0.31900001,0.889}, 1 };
	                    down[]={ {0.26899999,0.92400002}, 1 };
	                };
	                class TargetDistance: CurrentWeapon
	                {
	                    source="targetDist";
	                    sourceLength=0;
	                    sourcePrecision=1;
	                    sourceScale=0.001;
	                    align="right";
	                    pos[]={ {0.26899999,0.921}, 1 };
	                    right[]={ {0.31900001,0.921}, 1 };
	                    down[]={ {0.26899999,0.95599997}, 1 };
	                };
	            };
	            class IncomingMissile
	            {
	                condition="incomingmissile";
	                blinkingPattern[]={0.30000001,0.30000001};
	                blinkingStartsOn=1;
	                class Text
	                {
	                    type="text";
	                    source="static";
	                    text="!INCOMING MISSILE!";
	                    align="center";
	                    scale=1;
	                    pos[]={ {0.48500001,0.21623901}, 1 };
	                    right[]={ {0.54500002,0.21623901}, 1 };
	                    down[]={ {0.48500001,0.265385}, 1 };
	                };
	            };
	            class GearGroup
	            {
	                type="group";
	                condition="ils";
	                class GearText
	                {
	                    type="text";
	                    source="static";
	                    text="GEAR";
	                    align="center";
	                    scale=1;
	                    pos[]={ {0.5,0.82564098}, 1 };
	                    right[]={ {0.54000002,0.82564098}, 1 };
	                    down[]={ {0.5,0.85512799}, 1 };
	                };
	            };
	            class MGun
	            {
	                condition="mgun+rocket";
	                class Cross
	                {
	                    type="line";
	                    width=3;
	                    points[]=
	                    {
	                        { "ImpactPoint", {0,-0.0294872}, 1 },
	                        { "ImpactPoint", {0,-0.0393162}, 1 },
	                        {},
	                        { "ImpactPoint", {0.02,-0.024}, 1 },
	                        { "ImpactPoint", {0.025,-0.030999999}, 1 },
	                        {},
	                        { "ImpactPoint", {0,-0.0020000001}, 1 },
	                        { "ImpactPoint", {0,0.0020000001}, 1 },
	                        {},
	                        { "ImpactPoint", {-0.0020000001,0}, 1 },
	                        { "ImpactPoint", {0.0020000001,0}, 1 },
	                        {}
	                    };
	                };
	                class Circle
	                {
	                    type="line";
	                    width=3;
	                    points[]=
	                    {
	                        { "ImpactPoint", {0,-0.0344017}, 1 },
	                        { "MissileFlightTimeRot1", {0,0.035}, 1, "ImpactPoint", 1 },
	                        { "MissileFlightTimeRot2", {0,0.035}, 1, "ImpactPoint", 1 },
	                        { "MissileFlightTimeRot3", {0,0.035}, 1, "ImpactPoint", 1 },
	                        { "MissileFlightTimeRot4", {0,0.035}, 1, "ImpactPoint", 1 },
	                        { "MissileFlightTimeRot5", {0,0.035}, 1, "ImpactPoint", 1 },
	                        { "MissileFlightTimeRot6", {0,0.035}, 1, "ImpactPoint", 1 },
	                        { "MissileFlightTimeRot7", {0,0.035}, 1, "ImpactPoint", 1 },
	                        { "MissileFlightTimeRot8", {0,0.035}, 1, "ImpactPoint", 1 },
	                        { "MissileFlightTimeRot9", {0,0.035}, 1, "ImpactPoint", 1 },
	                        { "MissileFlightTimeRot10", {0,0.035}, 1, "ImpactPoint", 1 },
	                        { "MissileFlightTimeRot11", {0,0.035}, 1, "ImpactPoint", 1 },
	                        { "MissileFlightTimeRot12", {0,0.035}, 1, "ImpactPoint", 1 },
	                        { "MissileFlightTimeRot13", {0,0.035}, 1, "ImpactPoint", 1 },
	                        { "MissileFlightTimeRot14", {0,0.035}, 1, "ImpactPoint", 1 },
	                        { "MissileFlightTimeRot15", {0,0.035}, 1, "ImpactPoint", 1 },
	                        { "MissileFlightTimeRot16", {0,0.035}, 1, "ImpactPoint", 1 },
	                        { "MissileFlightTimeRot17", {0,0.035}, 1, "ImpactPoint", 1 },
	                        { "MissileFlightTimeRot18", {0,0.035}, 1, "ImpactPoint", 1 },
	                        { "MissileFlightTimeRot19", {0,0.035}, 1, "ImpactPoint", 1 },
	                        { "MissileFlightTimeRot20", {0,0.035}, 1, "ImpactPoint", 1 }
	                    };
	                };
	                class Circle_Min_Range
	                {
	                    type="line";
	                    width=3;
	                    points[]=
	                    {
	                        { "ImpactPoint", {0,-0.0294872}, 1 },
	                        { "ImpactPoint", {0.0052080001,-0.029038999}, 1 },
	                        { "ImpactPoint", {0.01026,-0.0277091}, 1 },
	                        { "ImpactPoint", {0.015,-0.0255359}, 1 },
	                        { "ImpactPoint", {0.019284001,-0.022587201}, 1 },
	                        { "ImpactPoint", {0.022980001,-0.0189544}, 1 },
	                        { "ImpactPoint", {0.025979999,-0.0147436}, 1 },
	                        { "ImpactPoint", {0.028191,-0.0100846}, 1 },
	                        { "ImpactPoint", {0.029544,-0.0051189698}, 1 },
	                        { "ImpactPoint", {0.029999999,0}, 1 },
	                        { "ImpactPoint", {0.029544,0.0051189698}, 1 },
	                        { "ImpactPoint", {0.028191,0.0100846}, 1 },
	                        { "ImpactPoint", {0.025979999,0.0147436}, 1 },
	                        { "ImpactPoint", {0.022980001,0.0189544}, 1 },
	                        { "ImpactPoint", {0.019284001,0.022587201}, 1 },
	                        { "ImpactPoint", {0.015,0.0255359}, 1 },
	                        { "ImpactPoint", {0.01026,0.0277091}, 1 },
	                        { "ImpactPoint", {0.0052080001,0.029038999}, 1 },
	                        { "ImpactPoint", {0,0.0294872}, 1 },
	                        { "ImpactPoint", {-0.0052080001,0.029038999}, 1 },
	                        { "ImpactPoint", {-0.01026,0.0277091}, 1 },
	                        { "ImpactPoint", {-0.015,0.0255359}, 1 },
	                        { "ImpactPoint", {-0.019284001,0.022587201}, 1 },
	                        { "ImpactPoint", {-0.022980001,0.0189544}, 1 },
	                        { "ImpactPoint", {-0.025979999,0.0147436}, 1 },
	                        { "ImpactPoint", {-0.028191,0.0100846}, 1 },
	                        { "ImpactPoint", {-0.029544,0.0051189698}, 1 },
	                        { "ImpactPoint", {-0.029999999,0}, 1 },
	                        { "ImpactPoint", {-0.029544,-0.0051189698}, 1 },
	                        { "ImpactPoint", {-0.028191,-0.0100846}, 1 },
	                        { "ImpactPoint", {-0.025979999,-0.0147436}, 1 },
	                        { "ImpactPoint", {-0.022980001,-0.0189544}, 1 },
	                        { "ImpactPoint", {-0.019284001,-0.022587201}, 1 },
	                        { "ImpactPoint", {-0.015,-0.0255359}, 1 },
	                        { "ImpactPoint", {-0.01026,-0.0277091}, 1 },
	                        { "ImpactPoint", {-0.0052080001,-0.029038999}, 1 },
	                        { "ImpactPoint", {0,-0.0294872}, 1 }
	                    };
	                };
	                class Distance
	                {
	                    type="text";
	                    source="ImpactDistance";
	                    sourceScale=0.001;
	                    sourcePrecision=1;
	                    max=15;
	                    align="center";
	                    scale=1;
	                    pos[]={ "ImpactPoint", {-0.0020000001,-0.079999998}, 1 };
	                    right[]={ "ImpactPoint", {0.045000002,-0.079999998}, 1 };
	                    down[]={ "ImpactPoint", {-0.0020000001,-0.039999999}, 1 };
	                };
	            };
	            class WP
	            {
	                condition="wpvalid";
	                class WPdist
	                {
	                    type="text";
	                    source="wpdist";
	                    sourceScale=0.001;
	                    sourcePrecision=1;
	                    align="left";
	                    scale=1;
	                    pos[]={ {0.935,0.81089699}, 1 };
	                    right[]={ {0.995,0.81089699}, 1 };
	                    down[]={ {0.935,0.86004299}, 1 };
	                };
	                class WPstatic
	                {
	                    type="text";
	                    source="static";
	                    text=">";
	                    align="center";
	                    scale=2;
	                    pos[]={ {0.94999999,0.81089699}, 1 };
	                    right[]={ {0.97000003,0.81089699}, 1 };
	                    down[]={ {0.94999999,0.86004299}, 1 };
	                };
	                class WPIndex
	                {
	                    type="text";
	                    source="wpIndex";
	                    sourceScale=1;
	                    align="right";
	                    scale=1;
	                    pos[]={ {0.95999998,0.81089699}, 1 };
	                    right[]={ {1.02,0.81089699}, 1 };
	                    down[]={ {0.95999998,0.86004299}, 1 };
	                };
	                class WP
	                {
	                    width=1;
	                    type="line";
	                    points[]=
	                    {
	                        { "wppoint", 1, { "HorizonBankRotFull", 0.015, -0.035 }, 1 },
	                        { "wppoint", 1, { "HorizonBankRotFull", 0, 0 }, 1 },
	                        { "wppoint", 1, { "HorizonBankRotFull", -0.015, -0.035 }, 1 }
	                    };
	                };
	            };
	            class RadarBoxes
	            {
	                type="radartoview";
	                pos0[]={0.5,0.5};
	                pos10[]={0.73400003,0.73000002};
	                width=2;
	                points[]=
	                {
	                    { {-0.0020000001,-0.0019658101}, 1 },
	                    { {0.0020000001,-0.0019658101}, 1 },
	                    { {0.0020000001,0.0019658101}, 1 },
	                    { {-0.0020000001,0.0019658101}, 1 },
	                    { {-0.0020000001,-0.0019658101}, 1 }
	                };
	            };
	            class TargetDiamond
	            {
	                class shape
	                {
	                    type="line";
	                    width=4;
	                    points[]=
	                    {
	                        { "Target", 1, "Limit0109", 1, {0.02,0.0196581}, 1 },
	                        { "Target", 1, "Limit0109", 1, {-0.02,0.0196581}, 1 },
	                        { "Target", 1, "Limit0109", 1, {-0.02,-0.0196581}, 1 },
	                        { "Target", 1, "Limit0109", 1, {0.02,-0.0196581}, 1 },
	                        { "Target", 1, "Limit0109", 1, {0.02,0.0196581}, 1 }
	                    };
	                };
	            };
	            class TargetLocked
	            {
	                condition="missilelocked";
	                class shape
	                {
	                    type="line";
	                    width=4;
	                    points[]=
	                    {
	                        { "Target", 1, "Limit0109", 1, {0,-0.0294872}, 1 },
	                        { "Target", 1, "Limit0109", 1, {0.029999999,0}, 1 },
	                        { "Target", 1, "Limit0109", 1, {0,0.0294872}, 1 },
	                        { "Target", 1, "Limit0109", 1, {-0.029999999,0}, 1 },
	                        { "Target", 1, "Limit0109", 1, {0,-0.0294872}, 1 }
	                    };
	                };
	            };
	            // ========== ДОБАВЛЕНО: Throttle and thrust vectoring indicators ==========
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
	        };
	    };
	};

    // ========== Turrets copied over ==========
    class Turrets: Turrets
    {
        class CopilotTurret: MainTurret
        {
            gunnerAction="pilot_Heli_Light_02";
            gunnerInAction="pilot_Heli_Light_02";
            precisegetinout=1;
            gunnerGetInAction="pilot_Heli_Light_02_Enter";
            gunnerGetOutAction="pilot_Heli_Light_02_Exit";
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
            gunnerLeftLegAnimName="";
            gunnerRightLegAnimName="";
            maxHorizontalRotSpeed=5;
            maxVerticalRotSpeed=5;
            proxyindex=1;
            isCopilot=1;
            gunnerName="Gunner";
            primaryGunner=1;
            visionMode[]={"Normal","NVG","Ti"};
            minElev=-90;
            maxElev=30;
            initElev=0;
            minTurn=-180;
            maxTurn=180;
            initTurn=0;
            stabilizedInAxes="StabilizedInAxesBoth";
            startEngine=0;
            soundServo[]={"",0.0099999998,1};
            outGunnerMayFire=1;
            commanding=-1;
            memoryPointGunnerOptics="gunner1";
            castGunnerShadow=0;
            viewGunnerShadow=0;
            turretAxis="axisturret1";
            gunnerOpticsModel="\A3\Weapons_F_Beta\Reticle\Heli_Attack_01_Optics_Gunner_wide_F";
            gunnerOpticsEffect[]={"TankCommanderOptics1","BWTV"};
            gunnerForceOptics=1;
            turretInfoType="RscOptics_Heli_Attack_01_gunner";
            discreteDistance[]={100,200,300,400,500,600,700,800,1000,1200,1500,1800,2100};
            discreteDistanceInitIndex=5;
            showAllTargets=4;
            weapons[]={"OPTRE_FC_T29B_NVar"};
            magazines[]={"OPTRE_FC_T29B_NVar_Battery","OPTRE_FC_T29B_NVar_Battery"};
            gunnerNotSpawned=0;
            memoryPointsGetInGunner="pos driver";
            memoryPointsGetInGunnerDir="pos driver dir";
            turretCanSee="1 + 2 + 4 + 8 + 32";
            gunnerOutForceOptics=1;
            optics=1;
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
                visionMode[]={"Normal","NVG","Ti"};
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
                    opticsDisplayName="W";
                    visionMode[]={"Normal","NVG","Ti"};
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
                    visionMode[]={"Normal","NVG"};
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
        };
        class CargoTurret_01: CargoTurret
        {
            gunnerAction="passenger_inside_6";
            gunnerInAction="passenger_inside_6";
            outGunnerMayFire=1;
            inGunnerMayFire=1;
            gunnerCompartments="Compartment2";
            memoryPointsGetInGunner="pos pas1";
            memoryPointsGetInGunnerDir="pos pas1 dir";
            gunnerName="Passenger";
            proxyIndex=1;
            maxElev=20;
            minElev=-50;
            maxTurn=50;
            minTurn=-50;
            isPersonTurret=2;
            canEject=0;
            ejectDeadGunner=0;
            enabledByAnimationSource="cargoDoors";
            memoryPointGunnerOptics="";
            gunnerGetInAction="GetInHigh";
            gunnerGetOutAction="GetOutHighHemtt";
        };
        class CargoTurret_02: CargoTurret_01
        {
            memoryPointsGetInGunner="pos pas2";
            memoryPointsGetInGunnerDir="pos pas2 dir";
            proxyIndex=2;
        };
        class CargoTurret_03: CargoTurret_01
        {
            memoryPointsGetInGunner="pos pas3";
            memoryPointsGetInGunnerDir="pos pas3 dir";
            proxyIndex=3;
        };
        class CargoTurret_04: CargoTurret_01
        {
            memoryPointsGetInGunner="pos pas4";
            memoryPointsGetInGunnerDir="pos pas4 dir";
            proxyIndex=4;
        };
        class CargoTurret_05: CargoTurret_01
        {
            memoryPointsGetInGunner="pos pas5";
            memoryPointsGetInGunnerDir="pos pas5 dir";
            proxyIndex=5;
        };
        class CargoTurret_06: CargoTurret_01
        {
            memoryPointsGetInGunner="pos pas6";
            memoryPointsGetInGunnerDir="pos pas6 dir";
            proxyIndex=6;
        };
        class CargoTurret_07: CargoTurret_01
        {
            memoryPointsGetInGunner="pos pas7";
            memoryPointsGetInGunnerDir="pos pas7 dir";
            proxyIndex=7;
        };
        class CargoTurret_08: CargoTurret_01
        {
            memoryPointsGetInGunner="pos pas8";
            memoryPointsGetInGunnerDir="pos pas8 dir";
            proxyIndex=8;
        };
        class CargoTurret_09: CargoTurret_01
        {
            memoryPointsGetInGunner="pos pas9";
            memoryPointsGetInGunnerDir="pos pas9 dir";
            proxyIndex=9;
        };
        class CargoTurret_10: CargoTurret_01
        {
            memoryPointsGetInGunner="pos pas10";
            memoryPointsGetInGunnerDir="pos pas10 dir";
            proxyIndex=10;
        };
        class CargoTurret_11: CargoTurret_01
        {
            memoryPointsGetInGunner="pos pas11";
            memoryPointsGetInGunnerDir="pos pas11 dir";
            proxyIndex=11;
        };
        class CargoTurret_12: CargoTurret_01
        {
            memoryPointsGetInGunner="pos pas12";
            memoryPointsGetInGunnerDir="pos pas12 dir";
            proxyIndex=12;
        };
        class CargoTurret_13: CargoTurret_01
        {
            memoryPointsGetInGunner="pos pas13";
            memoryPointsGetInGunnerDir="pos pas13 dir";
            proxyIndex=13;
        };
        class CargoTurret_14: CargoTurret_01
        {
            memoryPointsGetInGunner="pos pas14";
            memoryPointsGetInGunnerDir="pos pas14 dir";
            proxyIndex=14;
        };
        class CargoTurret_15: CargoTurret_01
        {
            memoryPointsGetInGunner="pos pas15";
            memoryPointsGetInGunnerDir="pos pas15 dir";
            proxyIndex=15;
        };
        class CargoTurret_16: CargoTurret_01
        {
            memoryPointsGetInGunner="pos pas16";
            memoryPointsGetInGunnerDir="pos pas16 dir";
            proxyIndex=16;
        };
        class CargoTurret_17: CargoTurret
        {
            gunnerAction="Mortar_Gunner";
            gunnerInAction="Mortar_Gunner";
            outGunnerMayFire=0;
            inGunnerMayFire=0;
            gunnerCompartments="Compartment2";
            memoryPointsGetInGunner="pos pas1";
            memoryPointsGetInGunnerDir="pos pas1 dir";
            gunnerName="Passenger";
            proxyIndex=17;
            maxElev=20;
            minElev=-50;
            maxTurn=50;
            minTurn=-50;
            isPersonTurret=2;
            ejectDeadGunner=0;
            canEject=0;
            enabledByAnimationSource="cargoDoors";
            memoryPointGunnerOptics="";
            gunnerGetInAction="GetInHigh";
            gunnerGetOutAction="GetOutHighHemtt";
        };
        class CargoTurret_18: CargoTurret_17
        {
            memoryPointsGetInGunner="pos pas1";
            memoryPointsGetInGunnerDir="pos pas1 dir";
            proxyIndex=18;
        };
        class CargoTurret_19: CargoTurret_17
        {
            memoryPointsGetInGunner="pos pas1";
            memoryPointsGetInGunnerDir="pos pas1 dir";
            proxyIndex=19;
        };
        class CargoTurret_20: CargoTurret_17
        {
            memoryPointsGetInGunner="pos pas1";
            memoryPointsGetInGunnerDir="pos pas1 dir";
            proxyIndex=20;
        };
        class CargoTurret_21: CargoTurret_17
        {
            memoryPointsGetInGunner="pos pas1";
            memoryPointsGetInGunnerDir="pos pas1 dir";
            proxyIndex=21;
        };
        class CargoTurret_22: CargoTurret_17
        {
            memoryPointsGetInGunner="pos pas1";
            memoryPointsGetInGunnerDir="pos pas1 dir";
            proxyIndex=22;
        };
        class CargoTurret_24: CargoTurret_17
        {
            memoryPointsGetInGunner="pos pas1";
            memoryPointsGetInGunnerDir="pos pas1 dir";
            proxyIndex=24;
        };
    };

    // ========== Wing Vortices ==========
    class WingVortices
    {
        class WingTipLeft
        {
            effectName = "WingVortices";
            position = "wingtip_left_pos";
        };
        class WingTipRight
        {
            effectName = "WingVortices";
            position = "wingtip_right_pos";
        };
    };
};

class A3U_OPTRE_Spirit_VTOL: A3U_OPTRE_Spirit_VTOL_Base
{
    displayName = "Type-25 Spirit VTOL";
    scope=2;
	scopecurator=2;
	scopeArsenal=2;
	side=0;
	vehicleClass="OPTRE_UNSC_Air_class";
	faction="OPTRE_FC_Covenant";
	crew="OPTRE_FC_Elite_Minor";
	editorSubcategory="OPTRE_FC_EditorSubcategory_CovAir";
};

class A3U_OPTRE_Spirit_VTOL_Concussion: A3U_OPTRE_Spirit_VTOL_Base
{
    displayName = "Type-25 Spirit VTOL (Concussion)";
	scope=2;
	scopecurator=2;
	scopeArsenal=2;
	side=0;
	vehicleClass="OPTRE_UNSC_Air_class";
	faction="OPTRE_FC_Covenant";
	crew="OPTRE_FC_Elite_Minor";
	editorSubcategory="OPTRE_FC_EditorSubcategory_CovAir";
    class Turrets: Turrets
    {
        class CopilotTurret: CopilotTurret
        {
            weapons[] = { "OPTRE_FC_T50_ConcussionRifle_Slower" };
            magazines[] = { "OPTRE_FC_T50_100rnd_mag", "OPTRE_FC_T50_100rnd_mag" };
        };
    };
};
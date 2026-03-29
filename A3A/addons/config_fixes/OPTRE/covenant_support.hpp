class OPTRE_FC_Spectre_Recovery;
class OPTRE_FC_Spectre_Recovery_Needler;
class OPTRE_FC_Spectre_Recovery_Ultra;
class OPTRE_FC_Spectre_Transport_Ultra;

class a3a_OPTRE_FC_Spectre_Recovery_repair : OPTRE_FC_Spectre_Recovery
{
    displayName = "Type-46R Recovery (Repair)";
    supplyRadius = 10;
	transportRepair = 2e+08;
};
class a3a_OPTRE_FC_Spectre_Recovery_Needler_ammo : OPTRE_FC_Spectre_Recovery_Needler
{
    displayName = "Type-46R Recovery (Ammo)";
    supplyRadius = 10;
	transportAmmo = 30000;
};
class a3a_OPTRE_FC_Spectre_Recovery_Ultra_fuel : OPTRE_FC_Spectre_Recovery_Ultra
{
    displayName = "Type-46R Recovery (Fuel)";
    supplyRadius = 10;
	transportFuel = 3000;
};
class a3a_OPTRE_FC_Spectre_Transport_Ultra_medical : OPTRE_FC_Spectre_Transport_Ultra
{
    displayName = "Type-46R Transport (Medical)";
	threat[] = {0,0,0};
    attendant = 1;
};
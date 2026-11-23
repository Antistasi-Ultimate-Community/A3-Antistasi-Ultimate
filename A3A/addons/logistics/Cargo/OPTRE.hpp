class OPTRE_Static_M247H_Tripod : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,-0.5,1.7}; // this was sinking into the truck before... I swear to god if it floats now
    rotation[] = {0,1,0};
    size = 2;
    recoil = 2000;
    isWeapon = 1;
};
// class OPTRE_Static_Gauss : OPTRE_Static_M247H_Tripod {}; // Ask for forgiveness not permission
// class OPTRE_Static_AA : OPTRE_Static_M247H_Tripod {};
class OPTRE_FC_T26_AT : OPTRE_Static_M247H_Tripod {}; // If this works I will be legitimately surprised...
class OPTRE_FC_T26_AA : OPTRE_Static_M247H_Tripod {};
class Plasma_Mortar : OPTRE_Static_M247H_Tripod {};
//class OPTRE_Lance : OPTRE_Static_M247H_Tripod {}; // Yeah, the lance is NOT being loaded into vehicles (it's like 10ft tall)

class OPTRE_M274_ATV : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0, 0, 1.41};
    rotation[] = {0,1,0};
    size = 2;
    recoil = 0;
    isWeapon = 0;
};

class OPTRE_M274_ATV_Ins : OPTRE_M274_ATV {}; // they're the same model, so inherit

// class A3_Supplies_F_Heli_Fuel_FlexibleTank_01_F_p3d;

class Land_OPTRE_barrel_hydrogen: A3_Supplies_F_Heli_Fuel_FlexibleTank_01_F_p3d {};

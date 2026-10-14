class A3_Supplies_F_Heli_CargoNets_CargoNet_01_ammo_F_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0,0.51};
    rotation[] = {1,0,0};
    size = 2;
    cargoValue = 1000; // 500 per slot generally
}; // Pallet Crate (Hardshell)

class A3_Weapons_F_Ammoboxes_AmmoVeh_F : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0,0.81};
    rotation[] = {1,0,0};
    size = 2;
    cargoValue = 2000;
    isExplosive = 1;
}; // Vehicle crate

class A3_Supplies_F_Heli_CargoNets_CargoNet_01_barrels_F_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,-0.8,0.53};
    rotation[] = {1,0,0};
    size = 2;
    cargoValue = 1000;
}; // Barrels

class A3_Weapons_F_Ammoboxes_Supplydrop_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0,0.89};
    rotation[] = {1,0,0};
    size = 2;
    cargoValue = 1000;
}; // Crate (Fabric)

class A3_Props_F_Orange_Humanitarian_Supplies_PaperBox_01_open_boxes_F_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0,0.62};
    rotation[] = {1,0,0};
    size = 2;
    cargoValue = 1000;
};

class A3_Props_F_Orange_Humanitarian_Supplies_PaperBox_01_open_water_F_p3d : A3_Props_F_Orange_Humanitarian_Supplies_PaperBox_01_open_boxes_F_p3d {};
class A3_Props_F_Orange_Humanitarian_Supplies_PaperBox_01_small_stacked_F_p3d : A3_Props_F_Orange_Humanitarian_Supplies_PaperBox_01_open_boxes_F_p3d {}; // General cardboard pallet
class A3_Props_F_Orange_Humanitarian_Supplies_WaterBottle_01_stack_F_p3d : A3_Props_F_Orange_Humanitarian_Supplies_PaperBox_01_open_boxes_F_p3d {}; // Water bottle pallet

class A3_Props_F_Orange_Humanitarian_Supplies_FoodSacks_01_cargonet_F_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0,0.51};
    rotation[] = {1,0,0};
    size = 2;
    cargoValue = 1000;
}; // Food sack pallets

class A3_Structures_F_Argo_Industrial_Materials_WoodenPlanks_01_pine_F_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,-0.1,0.75};
    rotation[] = {1,0,0};
    size = 4;
    cargoValue = 3000;
}; // Wooden planks

class A3_Structures_F_Civ_Constructions_IronPipes_F_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0.1,0.3,0.6};
    rotation[] = {1,0,0};
    size = 6;
    cargoValue = 4000;
}; // Iron pipes

class a3_Props_F_Tank_Military_TankAcc_TankTracks_01_long_F_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,-0.2,0.48};
    rotation[] = {0,1,0};
    size = 2;
    cargoValue = 1000;
}; // Tank tracks

class a3_Props_F_Tank_Military_TankAcc_TankEngine_01_F_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0.2,0.7};
    rotation[] = {0,1,0};
    size = 4;
    cargoValue = 2000;
}; // Literal tank engine

class A3_Structures_F_Heli_Ind_Machines_JetEngineStarter_01_F_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0.4,1};
    rotation[] = {0,1,0};
    size = 6;
    cargoValue = 5000; // Quite literally dies to a fly, very volatile
    isExplosive = 1;
}; // Jet starter engine

class A3_Structures_F_Civ_Constructions_Bricks_V4_F_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0,0};
    rotation[] = {0,0,0};
    size = 2;
    cargoValue = 1000;
}; // Pallet bricks (partially used)

class A3_Structures_F_Civ_Constructions_Bricks_V1_F_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0,0};
    rotation[] = {0,0,0};
    size = 2;
    cargoValue = 1000;
}; // Pallet bricks (full)

class A3_Structures_F_Argo_Military_Fortifications_CzechHedgehog_01_old_F_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0,0.7};
    rotation[] = {0,0,0};
    size = 2;
    cargoValue = 1000;
}; // Czech hedgehod (old)

// class A3_Props_F_Orange_Humanitarian_Supplies_FoodSacks_01_large_F_p3d : TRIPLES(ADDON,Cargo,Base)
// {
//     offset[] = {0,0,0.47};
//     rotation[] = {0,0,0};
//     size = 2;
//     cargoValue = 1000;
// }; // Food sacks (non cargo net, brown)

class A3_Structures_F_Civ_Market_Sacks_goods_F_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0,0.47};
    rotation[] = {0,0,0};
    size = 2;
    cargoValue = 1000;
}; // Food sacks (old, baskets)

class A3_Props_F_Exp_Commercial_Market_WoodenCrate_01_stack_x3_F_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0,0.7};
    rotation[] = {0,0,0};
    size = 2;
    cargoValue = 1000;
}; // Wooden cargo crates (Tanoa, 3)

class A3_Props_F_Exp_Commercial_Market_WoodenCrate_01_stack_x5_F_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0,0.95};
    rotation[] = {0,0,0};
    size = 2;
    cargoValue = 1000;
}; // Wooden cargo crates (Tanoa, 5)

class A3_Props_F_Exp_Commercial_Market_WoodenCrate_01_F_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0,0.3};
    rotation[] = {1,0,0};
    size = 1;
    cargoValue = 500;
}; // Wooden cargo crate (Tanoa, 1)

class A3_Structures_F_Civ_Constructions_Pipes_large_F_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0,-0.03};
    rotation[] = {1,0,0};
    size = 6;
    cargoValue = 4000;
}; // Iron pipes from altis

class A3_Structures_F_Civ_Constructions_WoodenBox_F_p3d : TRIPLES(ADDON,Cargo,Base)
{
    offset[] = {0,0,0};
    rotation[] = {0,0,0};
    size = 1;
    cargoValue = 500;
}; // Old looking wooden rectangle box
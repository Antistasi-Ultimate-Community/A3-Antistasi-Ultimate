class Pricing {
    class Vehicle {
        class Base {
            scope = 0;
            moniker = "";

            class Groups {};
            class Vehicles {};
        };

        class FactionDefault: Base {
            scope = 1;
            moniker = "all";

            class Groups {
                vehiclesBoats = 3000;
                vehiclesLight = 1500;
                vehiclesLightAPCs = 3000;
            };

            class Vehicles {
                Land_RepairDepot_01_green_F = 10000;
            };
        };

        class Rebel: Base {
            scope = 1;
            moniker = "reb";

            class Groups: Groups {
                rallyPoint = 100;

                unitAA = 500;
                unitAT = 500;
                unitEng = 100;
                unitExp = 100;
                unitCrew = 50;
                unitGL = 75;
                unitLAT = 75;
                unitMedic = 100;
                unitMG = 75;
                unitRifle = 50;
                unitSL = 150;
                unitSniper = 150;

                vehiclesAA = 13000;
                vehiclesAPCs = 5000;
                vehiclesArtillery = 13000;
                vehiclesHelisAttack = 13000;
                vehiclesHelisLightAttack = 5000;
                vehiclesHelisLight = 6000;
                vehiclesIFVs = 5000;
                vehiclesLightTanks = 7000;
                vehiclesPlanesAA = 15000;
                vehiclesPlanesCAS = 15000;
                vehiclesPlanesGunship = 20000;
                vehiclesPlanesLargeAA = 15000;
                vehiclesPlanesLargeCAS = 15000;
                vehiclesTanks = 13000;
                vehiclesTransportAir = 5000;
                vehiclesTruck = 1500;
                vehiclesUAVs = 5000;
            };
        };

        class Civilian: Base {
        };

        class Occupier: Base {
            class Groups {
                vehiclesAmmoTrucks = 3000;
                vehiclesCargoTrucks = 1500;
                vehiclesFuelTrucks = 3000;
                vehiclesMedical = 3000;
                vehiclesMilitiaTrucks = 1500;
                vehiclesRepairTrucks = 3000;
                vehiclesTrucks = 1500;
            };
        };

        class Invader: Occupier {};
    };
};

class CfgFunctions
{
    class ADDON
    {
        class init
        {
            file = QPATHTOFOLDER(functions\init);
            class initUnit {};
            class initVehicle {};
            class initModule {};
        };
        class modules
        {
            file = QPATHTOFOLDER(functions\modules);
            class addToHC {};
        };
    };
};

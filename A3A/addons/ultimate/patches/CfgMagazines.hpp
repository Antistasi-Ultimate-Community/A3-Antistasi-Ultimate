class CfgMagazines {
    class CA_Magazine;

    class GVAR(LockpickKitBase) : CA_Magazine {
        author = "goreSplatter";
        scope = 0;
        count = 0;
        model = "\A3\Structures_F\Items\Tools\DrillAku_F.p3d";
        picture = "\x\A3A\addons\ultimate\data\A3A_ultimate_LockpickKitBase.paa";
    };

    class GVAR(LockpickKit_MultiUse) : GVAR(LockpickKitBase) {
        scope = 1;
        count = 5;
        mass = 25;
        displayname = "$STR_A3AU_Asset_LockpickKit_MultiUse";
        descriptionShort = "$STR_A3AU_Asset_LockpickKit_MultiUse_Desc";
    };

    class GVAR(LockpickKit_SingleUse) : GVAR(LockpickKitBase) {
        scope = 1;
        count = 1;
        mass = 7.5;
        displayname = "$STR_A3AU_Asset_LockpickKit_SingleUse";
        descriptionShort = "$STR_A3AU_Asset_LockpickKit_SingleUse_Desc";
    };
};

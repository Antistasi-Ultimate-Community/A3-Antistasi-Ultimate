#define SCOPESTATICS scope = 0; scopeCurator = 0

class Land_HelipadCircle_F;
class Land_HelipadSquare_F;
class A3AU_RebHelipad_Circle_F: Land_HelipadCircle_F {};
class A3AU_RebHelipad_Square_F: Land_HelipadSquare_F {};

class HouseBase;
class A3U_StaticHolderBase: HouseBase
{
    destrType = "DestructNo";
    scope = 0;
    scopeCurator = 0;
    editorCategory = "A3U_EditorCategory";
    editorSubcategory = "A3U_EditorSubcategoryStatics";
};

class A3U_StaticHolderSmall: A3U_StaticHolderBase
{
    model = QPATHTOFOLDER(data\staticHolders\static_small);
    displayName = "Static Holder (Small)";
    scope = 2;
};

class A3U_StaticHolderMediumAT: A3U_StaticHolderSmall
{
    model = QPATHTOFOLDER(data\staticHolders\static_medium);
    displayName = "Static Holder (Medium, AT)";
};

class A3U_StaticHolderMediumAA: A3U_StaticHolderSmall
{
    model = QPATHTOFOLDER(data\staticHolders\static_medium);
    displayName = "Static Holder (Medium, AA)";
};

class A3U_StaticHolderLargeAT: A3U_StaticHolderMediumAT
{
    model = QPATHTOFOLDER(data\staticHolders\static_large);
    displayName = "Static Holder (Large, AT)";
};

class A3U_StaticHolderLargeAA: A3U_StaticHolderMediumAA
{
    model = QPATHTOFOLDER(data\staticHolders\static_large);
    displayName = "Static Holder (Large, AA)";
};
/*
    Author: [Håkon]
    [Description]
        Returns the category index of a class

    Arguments:
    0. <String> Class you want to know the category index of

    Return Value:
    <Int> category index or -1 if it has no category

    Scope: Any
    Environment: unscheduled
    Public: [Yes]
    Dependencies:

    Example: [_class] call HR_GRG_fnc_getCatIndex;

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params [["_class", "_vehicle", [""]]]; //
if ( !isClass (configFile >> "CfgVehicles" >> _class) ) exitWith { Error_1("Invalid Input: %1", _class); -1 };
//if (!(_class isKindOf "Car") && !(_class isKindOf "Tank") && !(_class isKindOf "Helicopter") && !(_class isKindOf "Plane") && !(_class isKindOf "Ship") && !(_class isKindOf "Static")) exitWith { Error_1("Invalid Input: %1", _class); -1 };

private _vtol = "getNumber (_x >> 'vtol') >= 0" configClasses (configFile >> "CfgVehicles");

//&& (getNumber (configOf _vehicle >> "isUav") == 0)
//case (getNumber (configOf _vehicle >> "isUav") > 0): { 2 };

private _editorCat = cfgEditorCat(_class);
switch (true) do {
    //vanilla
    case (_editorCat isEqualTo "EdSubcat_Cars"): { 0 };
    case (_editorCat in ["EdSubcat_Tanks","EdSubcat_APCs","EdSubcat_AAs","EdSubcat_Artillery"]): { 1 };
    case (_editorCat in ["EdSubcat_Helicopters"]): { 2 };
    case (getNumber (configOf _vehicle >> "vtol") > 0): { 3 };
    case (_editorCat in ["EdSubcat_Planes"] && (getNumber (configOf _vehicle >> "vtol") == 0)): { 4 };
    case (_editorCat isEqualTo "EdSubcat_Boats"): { 5 };
    case (_editorCat isEqualTo "EdSubcat_Turrets"): { 6 };
    case (_class isKindOf "staticWeapon"): {6}; //some non-vanilla artillery is statics

    //rhs
    case (_editorCat in ["rhs_EdSubcat_car","rhs_EdSubcat_truck","rhs_EdSubcat_mrap"]): {0};
    case (_editorCat in ["rhs_EdSubcat_apc","rhs_EdSubcat_ifv","rhs_EdSubcat_tank","rhs_EdSubcat_aa","rhs_EdSubcat_artillery"]): {1};
    case (_editorCat in ["rhs_EdSubcat_helicopter","rhs_EdSubcat_helicopter_d","rhs_EdSubcat_helicopter_wd"]): { 2 };
    case (_editorCat in ["rhs_EdSubcat_aircraft"]): { 4 };
    case (_editorCat isEqualTo "rhs_EdSubcat_boat"): { 5 };

    //cup
    case (_editorCat in ["CUP_EdSubcat_Bikes","CUP_EdSubCat_Cars_Woodland","CUP_EdSubCat_UpHMMWV_Cars_Desert","CUP_EdSubCat_Cars_Winter"]): { 0 };

    //Fallback
    case (_class isKindOf "Car"): { 0 };
    case (_class isKindOf "Tank"): { 1 };
    case (_class isKindOf "Helicopter"): { 2 };
    case (_class isKindOf "Plane"): { 4 };
    case (_class isKindOf "Ship"): { 5 };
    //case (_class isKindOf "Static"): { 6 };

    default { -1 };
};

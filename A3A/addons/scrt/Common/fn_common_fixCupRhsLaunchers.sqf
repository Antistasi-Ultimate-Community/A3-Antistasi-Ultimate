#include "..\defines.inc"
FIX_LINE_NUMBERS()

if (!("specialCUP" in A3A_factionEquipFlags) && !("specialRHS" in A3A_factionEquipFlags)) exitWith {};

//looks like this is needed to grab weapons from arsenal
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

private _brokenLaunchers = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON) select {
    private _weaponClass = toLowerANSI (_x select 0);
    "_loaded" in _weaponClass || {"_used" in _weaponClass}
};

Debug_1("Broken launchers to remove: %1",str _brokenLaunchers);

{
    private _item = _x select 0;
    private _arsenalTab = [_item] call jn_fnc_arsenal_itemType;
    [_arsenalTab, _item, -1] call jn_fnc_arsenal_removeItem;
} forEach _brokenLaunchers;

Debug("Broken launchers clearance pass finished.");

params ["_vehicle"];

private _locked = locked _vehicle;

(_locked >= 2 || {_locked isEqualTo -1 && {lockedInventory _vehicle}});

params ["_cargoClass", "_cargoType", "_pos"];

private _cargo = _cargoClass createVehicle [0,0,0];
_cargo setPos _pos;
_cargo setDir (random 360);

clearItemCargoGlobal _cargo;
clearMagazineCargoGlobal _cargo;
clearWeaponCargoGlobal _cargo;
clearBackpackCargoGlobal _cargo;

// add action to "acknowledge" them (triggers next phase), action to carry
_cargo setVariable ["A3A_cargo_acknowledged", false, true];

[_cargo, "cargo"] remoteExec ["A3A_fnc_flagaction", [teamPlayer, civilian], _cargo];

if ([_cargo] call A3U_fnc_LOG_delivery_isCargoExplosive) then {
    // Add EH to BLOW that shit up if shot
};

_cargo;
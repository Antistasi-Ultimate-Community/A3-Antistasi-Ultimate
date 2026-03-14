#include "..\..\script_component.hpp"
/*  
	Author: wersal

	[Description]
		Checks if the vehicle should switch to attack mode after paradrop.

    Params:
        _vehicle : OBJECT : The aircraft
        _groupPilot : GROUP : Pilot group
        _targetPos : ARRAY : Target position
 
    Returns:
        BOOL : True if attack heli script was spawned

	Lisence: VPN-DPC
*/

params ["_vehicle", "_groupPilot", "_targetPos"];

private _vehType = typeOf _vehicle;
private _weapons = count weapons _vehicle;
private _driverturret = _vehicle weaponsTurret [0];
private _gunnerturret = _vehicle weaponsTurret [-1];
private _weaponsturret = count _driverturret + count _gunnerturret;

if (
    alive _vehicle && (
        _vehType in FactionGet(all,"vehiclesHelisAttack") + FactionGet(all,"vehiclesHelisLightAttack") ||
        {_vehType in FactionGet(all,"vehiclesTransportAir") && {_weapons > 2 || _weaponsturret > 2}} //assuming first 2 are laserdesignator and flares
    )
) then {
    [_vehicle, _groupPilot, _targetPos] spawn A3A_fnc_attackHeli;
    true
} else {
    false
};
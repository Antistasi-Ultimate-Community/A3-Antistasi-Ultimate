#include "..\..\script_component.hpp"
/*  
	Author: wersal

	[Description]
		Fires a burst of three types of countermeasure flares from the given vehicle.
    Params:
        _vehicle : OBJECT : The vehicle that will launch the flares
        _delay : NUMBER (optional, default 0.3) : Time in seconds to sleep after firing
        _cycles : NUMBER or ARRAY (optional, default 1) : 
                  - NUMBER: fixed number of cycles
                  - Array [min, max]: random amount of cycles in the given range
 
    Returns:
        Nothing
	
	Lisence: VPN-DPC
*/

params ["_vehicle", ["_delay", 0.3], ["_cycles", 1]];

if (_cycles isEqualType []) then {
    _cycles = (_cycles select 0) + floor random ((_cycles select 1) - (_cycles select 0) + 1);
};

if !(alive _vehicle) exitWith {};

[_vehicle, _delay, _cycles] spawn {
    params ["_vehicle", "_delay", "_cycles"];
    for "_i" from 1 to _cycles do {
        [_vehicle, "CMFlareLauncher"] call BIS_fnc_fire;
        [_vehicle, "CMFlareLauncher_Triples"] call BIS_fnc_fire;
        [_vehicle, "CMFlareLauncher_Singles"] call BIS_fnc_fire;
        [_vehicle, "CMFlareLauncherCOV"] call BIS_fnc_fire; ///OPTRE compatibility

        sleep _delay;
    };
};
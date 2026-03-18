#include "..\..\script_component.hpp"
/*  
	Author: wersal

	[Description]
		Fires a burst of three types of countermeasure flares from the given vehicle.
    Params:
        _vehicle : OBJECT : The vehicle that will launch the flares
        _delay : NUMBER (optional, default 0.3) : Time in seconds to sleep after firing
 
    Returns:
        Nothing
	
	Lisence: VPN-DPC
*/

params ["_vehicle", ["_delay", 0.3]];
[_vehicle, "CMFlareLauncher"] call BIS_fnc_fire;
[_vehicle, "CMFlareLauncher_Triples"] call BIS_fnc_fire;
[_vehicle, "CMFlareLauncher_Singles"] call BIS_fnc_fire;
[_vehicle, "CMFlareLauncherCOV"] call BIS_fnc_fire; ///OPTRE compatibility
sleep _delay;

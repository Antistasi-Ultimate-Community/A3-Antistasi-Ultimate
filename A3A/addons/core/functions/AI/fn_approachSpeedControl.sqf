#include "..\..\script_component.hpp"
/*  
	Author: wersal

	[Description]
		Gradually reduces vehicle speed based on distance to drop point.
   	Params:
       _vehicle : OBJECT : The aircraft
       _dropPos : ARRAY : Target drop position
       _isPlane : BOOL (optional) : Whether the vehicle is a plane (affects thresholds)

   	Returns:
       Nothing
*/
params ["_vehicle", "_dropPos", ["_isPlane", false]];
if (_isPlane) then {
    waitUntil {sleep 1; !alive _vehicle || (_vehicle distance2D _dropPos) < 3000};
    if (!alive _vehicle) exitWith {};
    _vehicle limitSpeed ((0.8 * (getNumber(configOf _vehicle >> "maxSpeed"))) min 500);

    waitUntil {sleep 1; !alive _vehicle || (_vehicle distance2D _dropPos) < 2000};
    if (!alive _vehicle) exitWith {};
    _vehicle limitSpeed ((0.7 * (getNumber(configOf _vehicle >> "maxSpeed"))) min 400);

    waitUntil {sleep 1; !alive _vehicle || (_vehicle distance2D _dropPos) < 1500};
    if (!alive _vehicle) exitWith {};
    _vehicle limitSpeed ((0.6 * (getNumber(configOf _vehicle >> "maxSpeed"))) min 250);
} else {
    waitUntil {sleep 1; !alive _vehicle || (_vehicle distance2D _dropPos) < 1000};
    if (!alive _vehicle) exitWith {};
    _vehicle limitSpeed ((0.6 * (getNumber(configOf _vehicle >> "maxSpeed"))) min 250);
};
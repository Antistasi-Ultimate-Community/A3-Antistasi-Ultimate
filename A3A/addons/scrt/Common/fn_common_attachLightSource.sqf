//	Author: Socrates
// 
//	Description:
//	Attachs the light to an object.
//
//	Returns:
//	Nothing
//
// 	How to use: 
// 	[object, _lightPosition, ] spawn scrt_fnc_attachLightSource;
//

params ["_object", "_lightPos", ["_luminosity", 0.4]];

_light = "#lightpoint" createVehicleLocal (position _object);
_light lightAttachObject [_object, _lightPos];

_light setLightBrightness _luminosity;
_light setLightAmbient [1.0, 1.0, 1.0];
_light setLightColor [1.0, 1.0, 1.0];


waitUntil {sleep 5; isNil "_object" || {!alive _object || isNull _object}};
deleteVehicle _light;

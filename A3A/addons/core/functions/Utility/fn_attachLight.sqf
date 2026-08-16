#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_attachLight

Description:
    Attach light to an object.

Parameters:
    0: _object -  Object to which the light will be attached <OBJECT>
    1: _lightColor - Color of the light (RGB) <ARRAY>
    2: _lightAmbient - Ambient color of the light (RGB) <ARRAY>
    3: _lightIntensity - Intensity of the light <NUMBER>

Optional:
    4: _useFlare - Whether to use flare effect <BOOL> (default: false)
    5: _flareSize - Size of the flare <NUMBER> (default: 0)
    6: _flareDistance - Maximum distance of the flare <NUMBER> (default: 0)
    7: _showInDaylight - Whether the light is visible in daylight <BOOL> (default: false)

Example:
    (begin example)
    [myObject1, [1,0.8,0.6,1], [0.2,0.16,0.12,1], 5, true, 1, 50] call A3A_fnc_attachLight;
    (end example)

Returns:
    The created light object <OBJECT>

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Debug_2("%1(%2)",QFUNCMAIN(attachLight),_this);

if !assert(params[
    ["_object", nil, [objNull]],
    ["_lightColor", nil, [[]], 3],
    ["_lightAmbient", nil, [[]], 3],
    ["_lightIntensity", nil, [0]]
]) exitWith {};
if !assert(!isNull _object) exitWith {};

private _useFlare = param[4, false, [false]];
private _flareSize = param[5, 0, [0]];
private _flareDistance = param[6, 0, [0]];
private _showInDaylight = param[7, false, [false]];

private _light = '#lightpoint' createVehicleLocal[0,0,0];

_light setLightDayLight _showInDaylight;
_light setLightColor _lightColor;
_light setLightAmbient _lightAmbient;
_light setLightUseFlare _useFlare;
if (_useFlare) then {
	_light setLightFlareSize _flareSize;
	_light setLightFlareMaxDistance _flareDistance;
};
_light setLightIntensity _lightIntensity;
_light lightAttachObject[_object, [0,0,0]];

_light;

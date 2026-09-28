if !assert(params[
	["_siteX", nil, [""]]
]) exitWith {""};

if (_siteX in citiesX) exitWith { _siteX };
if (_siteX in ["CSAT_carrier", "NATO_carrier"]) exitWith { localize "STR_localizar_supportcorridor" };

[_siteX, true] call A3A_fnc_getLocationName;

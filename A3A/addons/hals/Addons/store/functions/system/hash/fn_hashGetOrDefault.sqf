/*
	Function: HALs_store_fnc_hashGetOrDefault
	Author: HallyG
	

	Argument(s):
	0: None

	Return Value:
	None

	Example:
	[] call HALs_store_fnc_hashGetOrDefault;
__________________________________________________________________*/
params ["_c", "_k", "_default"];
	
if (_k isEqualTo "") exitWith {_default};

private _val = [_c, _k] call HALs_store_fnc_hashGet;

if (isNil "_val") then {_default} else {_val}

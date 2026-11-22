/*
	Function: HALs_fnc_getModuleSettings
	Author: HallyG
	Returns and sets the settings for a module.
	
	Argument(s):
	0: Component name <STRING>
	1: Prefix <STRING>
	2: Settings <ARRAY> (see example)
	
	Return Value:
	None
	
	Example:
	[
		["CfgHALsTimeAcceleration"],
		"HALs_timeAcceleration_",
		[
			["multiplierDawn", 9, {_this max 1}],
			["multiplierDay", 18, {_this max 1}],
			["multiplierDusk", 9, {_this max 1}],
			["multiplierNight", 30, {_this max 1}],
			["debug", 0, {_this isEqualTo 1}]
		]
	] call HALs_fnc_getModuleSettings;
__________________________________________________________________*/
params [
	["_component", [""], [[]]],
	["_prefix", "HALs_", [""]],
	["_settings", [], [[]]]
];

private _configPath = configFile >> "cfgHALsAddons";
{_configPath = _configPath >> _x} forEach _component;

{
	_x params [
		["_setting", "", [""]],
		"_default",
		["_code", {_this}, [{}]],
		["_broadcast", false, [false]]
	];

	if (count _setting > 0) then {
		private _value = [_configPath >> _setting, _default] call HALs_fnc_getConfigValue;
		missionNamespace setVariable [
			format ["%1%2", _prefix, _setting],
			_value call _code,
			_broadcast
		];
	};
} forEach _settings;

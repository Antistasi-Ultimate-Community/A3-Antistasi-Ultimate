/*
	Function: HALs_store_fnc_getItemStats
	Author: HallyG, BIS
	Gets the stats of an item compared to global values.

	Argument(s):
	0: Item Config Path <CONFIG>

	Return Value:
	<ARRAY>

	Example:
	["acc_flashlight"] call HALs_store_fnc_getItemStats;
__________________________________________________________________*/
params [
	["_config", configNull, [configNull]]
];

if (isNil "HALs_store_stats_weapons") exitWith {
	// Taken from BIS_fnc_arsenal, modified by HallyG
	HALs_store_stats_weapons = [
		("getNumber (_x >> 'scope') isEqualTo 2 && getNumber (_x >> 'type') < 5") configClasses (configFile >> "cfgWeapons"),
		["reloadtime","dispersion","maxzeroing","hit","initSpeed"],
		[true,true,false,true,false]
	] call bis_fnc_configExtremes;

	private _statsEquipment = [
		("getNumber (_x >> 'scope') isEqualTo 2 && getNumber (_x >> 'itemInfo' >> 'type') in [605,701,801]") configClasses (configFile >> "cfgWeapons"),
		["passthrough","armor","maximumLoad"],
		[false,false,false]
	] call bis_fnc_configExtremes;

	private _statsBackpacks = [
		("getNumber (_x >> 'scope') isEqualTo 2 && getNumber (_x >> 'isBackpack') isEqualTo 1") configClasses (configFile >> "cfgVehicles"),
		["passthrough","armor","maximumLoad"],
		[false,false,false]
	] call bis_fnc_configExtremes;

	private _statsEquipmentMin = _statsEquipment select 0;
	private _statsEquipmentMax = _statsEquipment select 1;
	private _statsBackpacksMin = _statsBackpacks select 0;
	private _statsBackpacksMax = _statsBackpacks select 1;
	for "_i" from 2 to 3 do { //--- Ignore backpack armor and passThrough, has no effect
		_statsEquipmentMin set [_i,(_statsEquipmentMin select _i) min (_statsBackpacksMin select _i)];
		_statsEquipmentMax set [_i,(_statsEquipmentMax select _i) max (_statsBackpacksMax select _i)];
	};

	HALs_store_stats_equipment = [_statsEquipmentMin, _statsEquipmentMax];

	private _statsOpticsMin = ("isClass (_x >> 'ItemInfo' >> 'OpticsModes')" configClasses (configFile >> "CfgWeapons")) apply {
		selectMax (("true" configClasses (_x >> "ItemInfo" >> "OpticsModes")) apply {getNumber (_x >> "distanceZoomMax")})
	};
	private _statsOpticsMax = ("isClass (_x >> 'ItemInfo' >> 'OpticsModes')" configClasses (configFile >> "CfgWeapons")) apply {
		selectMax (("true" configClasses (_x >> "ItemInfo" >> "OpticsModes")) apply {getNumber (_x >> "distanceZoomMax")})
	};

	HALs_store_stats_optics = [selectMin _statsOpticsMin, selectMax _statsOpticsMax];
};

call {
	if (getNumber (_config >> "type") in [1, 2, 4] && {getNumber (_config >> "isbackpack") != 1}) exitWith {
		HALs_store_stats_weapons params ["_statsMin", "_statsMax"];

		private _stats = ([[_config], ["reloadtime","dispersion","maxzeroing","hit","initSpeed"], [true,true,false,true,false], _statsMin] call bis_fnc_configExtremes) select 1;
		private _barMax = 1;
		private _barMin = 0.01;

		private _statReloadSpeed = linearConversion [_statsMin select 0,_statsMax select 0,_stats select 0, _barMax,_barMin];
		private _statDispersion = linearConversion [_statsMin select 1,_statsMax select 1,_stats select 1, _barMax,_barMin];
		private _statMaxRange = linearConversion [_statsMin select 2,_statsMax select 2,_stats select 2, _barMin,_barMax];
		private _statHit = linearConversion [_statsMin select 3,_statsMax select 3,_stats select 3, _barMin,_barMax];
		private _statInitSpeed = linearConversion [_statsMin select 4,_statsMax select 4,_stats select 4, _barMin, _barMax];

		if (getNumber (_config >> "type") isEqualTo 4) then {
			[
				[_statMaxRange, localize "str_a3_rscdisplayarsenal_stat_range"],
				[_statHit, localize "str_a3_rscdisplayarsenal_stat_impact"],
				[],
				[],
				[]
			]
		} else {
			_statHit = sqrt (_statHit^2 * _statInitSpeed);

			[
				[_statReloadSpeed, localize "str_a3_rscdisplayarsenal_stat_rof"],
				[_statDispersion, localize "str_a3_rscdisplayarsenal_stat_dispersion"],
				[_statMaxRange, localize "str_a3_rscdisplayarsenal_stat_range"],
				[_statHit, localize "str_a3_rscdisplayarsenal_stat_impact"],
				[]
			]
		};
	};

	if (getNumber (_config >> "itemInfo" >> "type") in [605,701,801] || (getNumber (_config >> "type") isEqualTo 1 && getNumber (_config >> "isbackpack") isEqualTo 1)) exitWith {
		HALs_store_stats_equipment params ["_statsMin", "_statsMax"];

		private _stats = ([[_config], ["passthrough", "armor", "maximumLoad"], [false,false,false], _statsMin] call bis_fnc_configExtremes) select 1;
		private _barMax = 1;
		private _barMin = 0.01;

		private _statArmorShot = linearConversion [_statsMin select 0, _statsMax select 0, _stats select 0, _barMin, _barMax];
		private _statArmorExpl = linearConversion [_statsMin select 1, _statsMax select 1, _stats select 1, _barMin, _barMax];
		private _statMaximumLoad = linearConversion [_statsMin select 2, _statsMax select 2, _stats select 2, _barMin, _barMax];

		//--- Force no backpack armor
		if (getNumber (_config >> "isbackpack") isEqualTo 1) then {
			_statArmorShot = _barMin;
			_statArmorExpl = _barMin;
		};

		[
			[_statArmorShot, localize "str_a3_rscdisplayarsenal_stat_passthrough"],
			[_statArmorExpl, localize "str_a3_rscdisplayarsenal_stat_armor"],
			[_statMaximumLoad, localize "str_a3_rscdisplayarsenal_stat_load"],
			[],
			[]
		]
	};

	if (isClass (_config >> 'ItemInfo' >> 'OpticsModes')) exitWith {
		private _zoom = selectMax (("true" configClasses (_config >> "ItemInfo" >> "OpticsModes")) apply {getNumber (_x >> "distanceZoomMax")});
		private _statZoom = linearConversion [HALs_store_stats_optics select 0, HALs_store_stats_optics select 1, _zoom, 0.01, 1, true];

		[
			[_statZoom, "Zoom"],
			[],
			[],
			[],
			[]
		]
	};

	[[],[],[],[],[]]
};

//////////////////////////
// VehiclesData Hashmap //
//////////////////////////

private _vehiclesData = call _fnc_createLoadoutData;

//////////////////////////
//       Loadout        //
//////////////////////////

// All of below are optional overrides.
["firstAidKits", ["FirstAidKit"]] call _fnc_saveToTemplate;  // However, item is tested for for help and reviving.
["mediKits", ["Medikit"]] call _fnc_saveToTemplate;  // However, item is tested for for help and reviving.

["animations", []] call _fnc_saveToTemplate;
["variants", []] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

private _faces = switch (true) do {
	case (toLowerANSI worldName in ["cam_lao_nam", "vn_khe_sanh"]): {
		[
			"AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03",
			"AsianHead_A3_04","AsianHead_A3_05","AsianHead_A3_06",
			"AsianHead_A3_07"
		];
	};
	case ((toLowerANSI worldName) isEqualTo "tanoa"): {
		[
			"AsianHead_A3_01", "AsianHead_A3_02", "AsianHead_A3_03", "AsianHead_A3_04", "AsianHead_A3_06", "AsianHead_A3_07",
			"TanoanHead_A3_01", "TanoanHead_A3_02", "TanoanHead_A3_03", "TanoanHead_A3_04", "TanoanHead_A3_05", "TanoanHead_A3_06",
			"TanoanHead_A3_07", "TanoanHead_A3_08", "TanoanBossHead"
		];
	};
	case ((toLowerANSI worldName) isEqualTo "takistan"): {
		[
			"PersianHead_A3_01", "PersianHead_A3_02", "PersianHead_A3_03"
		];
	};
	case ((toLowerANSI worldName) isEqualTo "sefrouramal"): {
		[
			"AfricanHead_01", "AfricanHead_02", "AfricanHead_03", 
			"lxWS_African_Head_01", "lxWS_African_Head_02", "lxWS_African_Head_03", "lxWS_African_Head_04", "lxWS_African_Head_Old_Bard", "lxWS_African_Head_05"
		];
	};
	case (toLowerANSI worldName in ["enoch", "cup_chernarus_a3", "taviana", "esseker", "brf_sumava"]): {
		[
			"LivonianHead_1", "LivonianHead_2", "LivonianHead_3", "LivonianHead_4",
			"LivonianHead_5", "LivonianHead_6", "LivonianHead_7", "LivonianHead_8",
			"LivonianHead_9", "LivonianHead_10",
			"RussianHead_1", "RussianHead_2", "RussianHead_3", "RussianHead_4", "RussianHead_5"
		]
	};
	case (toLowerANSI worldName in ["altis", "malden"]): {
		[
			"GreekHead_A3_02", "GreekHead_A3_03", "GreekHead_A3_04", "GreekHead_A3_05", "GreekHead_A3_06",
			"GreekHead_A3_07", "GreekHead_A3_08", "GreekHead_A3_09", "Ioannou", "Barklem", "AfricanHead_02",
			"AsianHead_A3_02", "AsianHead_A3_03", "WhiteHead_05"
		];
	};
	default {
		[
			"WhiteHead_01","WhiteHead_02",
			"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
			"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
			"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
			"WhiteHead_21", "WhiteHead_23",
			"AfricanHead_01", "AfricanHead_02", "AfricanHead_03",
			"AsianHead_A3_01", "AsianHead_A3_02", "AsianHead_A3_03",
			"PersianHead_A3_01", "PersianHead_A3_02", "PersianHead_A3_03",
			"Sturrock", "Mavros"
		];
	};
};

["faces", _faces] call _fnc_saveToTemplate;

private _currencySymbol = switch (true) do {
	case (toLowerANSI worldName in ["cam_lao_nam", "vn_khe_sanh"]): {
		"đ"
	};
	case (toLowerANSI worldName in ["tanoa", "takistan", "sehreno", "sefrouramal"]): {
		"$"
	};
    case ((toLowerANSI worldName) isEqualTo "enoch"): {
        "zł"
    };
    case ((toLowerANSI worldName) in ["cup_chernarus_a3", "brf_sumava"]): {
        "ČRK"
    };
    case ((toLowerANSI worldName) isEqualTo "taviana"): {
        "₽"
    };
	default {
        "€"
	};
};

["currencySymbol", _currencySymbol] call _fnc_saveToTemplate;

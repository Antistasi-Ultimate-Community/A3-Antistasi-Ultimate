params ["_siteX"];

private _pos = getMarkerPos _siteX;
private _textX = "";

if (_siteX in citiesX) then {
	_textX = format ["STR_CITY_%1",_siteX];
} else {
	private _city = "STR_CITY_" + _siteX;

	switch (true) do {
		case (_siteX in airportsX): {
			_textX = [ "STR_localizar_airbase",_city];
		};
		case (_siteX in milbases): {
			_textX = [ "STR_localizar_milbase",_city];
		};
		case (_siteX in resourcesX): {
			_textX = [ "STR_localizar_resource",_city];
		};
		case (_siteX in factories): {
			_textX = [ "STR_localizar_factory",_city];
		};
		case (_siteX in outposts): {
			_textX = [ "STR_localizar_outpost",_city];
		};
		case (_siteX in seaports): {
			if (toLowerANSI worldName in ["enoch", "vn_khe_sanh", "esseker", "sefrouramal"]) then {
				_textX = [ "STR_localizar_riverport",_city];
			} else {
				_textX = [ "STR_localizar_seaport",_city];
			};
		};
		case (_siteX in controlsX): {
			if (isOnRoad getMarkerPos _siteX) then {
				_textX = [ "STR_localizar_roadblock",_city];
			} else {
				_textX = [ "STR_localizar_outskirts",_city];
			};
		};
		case (_siteX in milAdministrationsX): {
			_textX = [ "STR_milAdministration",_city];
		};
		case (_siteX == "CSAT_carrier");
		case (_siteX == "NATO_carrier"): {
			_textX = ["STR_localizar_supportcorridor"];
		};
	};
};


_textX

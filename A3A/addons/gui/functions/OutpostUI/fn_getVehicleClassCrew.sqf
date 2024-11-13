private _className = param [0];

private _c = configFile >> "cfgVehicles" >> _className;
private _crew = [];

private _classesWithPath = {
	private _root = param [0];
	private _basePath = param [1];

	private _clss = "true" configClasses (_root >> "Turrets");
	private _result = [];

	{
		_result pushBack [_basePath + [_foreachIndex], _x];
	} foreach _clss;

	_result;
};

private _toScan = [_c, []] call _classesWithPath;
while { count(_toScan) > 0 } do {
	private _item = _toScan call BIS_fnc_arrayPop;
	private _path = _item#0;
	private _cls = _item#1;

	if (!(getNumber (_cls >> "showAsCargo") > 0)) then {
		_crew pushBack [getText(_cls >> "gunnerName"), "turret", _path];
	};

	if (isClass (_cls >> "Turrets")) then {
		_toScan = _toScan + ([_cls, _path] call _classesWithPath); /*(("true" configClasses (_cls >> "Turrets")) apply { [_path + [_foreachIndex], _x] });*/
	};
};

if (getNumber (_c >> "hasDriver") > 0) then {
	_crew pushBack ["Водитель", "driver"];
};

_crew;

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
		_toScan = _toScan + ([_cls, _path] call _classesWithPath);
	};
};

if (getNumber (_c >> "hasDriver") > 0) then {
	_crew pushBack ["Водитель", "driver"];
};

private _coPilot = 0;
private _commander = 0;
private _transportSoldier = getNumber (_c >> "transportSoldier");
private _turrets = 0; // gunners or commanders, does not include ffv
private _ffvTurrets = 0; // turrets with showAsCargo = 1
private _allTurrets = 0;

private _fnc_turrets =
{
	{
    _allTurrets = _allTurrets + 1;
		if !(getNumber (_x >> "showAsCargo") > 0) then
		{
			if (getNumber (_x >> "isCopilot") > 0 ) then
			{
				_coPilot = _coPilot + 1;
			};
			_turrets = _turrets + 1
		} else {
			_ffvTurrets = _ffvTurrets + 1
		};
    if (getNumber (_x >> "primaryObserver") > 0) then {_commander = _commander + 1};
		if (isClass (_x >> "Turrets")) then {_x call _fnc_turrets};
	}
	forEach ("true" configClasses (_this >> "Turrets"));
};
_c call _fnc_turrets;

_gunners = _turrets - _commander - _coPilot;
_passengers = _allTurrets + _transportSoldier - _commander - _gunners - _coPilot;
_ffvCount = _passengers - _transportSoldier;

if (_passengers > 0) then {
	_crew pushBack ["Пассажиры " + str _passengers, "passenger"];
};
if (_ffvCount > 0) then {
	_crew pushBack ["Пассажиры с FFV " + str _ffvCount, "ffv"];
};

_crew;

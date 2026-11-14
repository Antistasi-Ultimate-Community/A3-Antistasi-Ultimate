params ["_unit", "_enemyX"];

private _small= [];
private _big = [];
private _objectX = objNull;
private _pos = [];
private _posBehind = (position _unit) getPos [5,_enemyX getDir _unit];
private _groupX = group _unit;
private _objectsX = (nearestObjects [_posBehind, [], 30]) select {!(_x in (_groupX getVariable ["usedForCover",[]]))};
private _roads = _posBehind nearRoads 30;

private _checkTypes = ["#crater","#crateronvehicle","#soundonvehicle","#particlesource","#lightpoint","#slop","#mark","HoneyBee","Mosquito","HouseFly","FxWindPollen1","ButterFly_random","Snake_random_F","Rabbit_F","FxWindGrass2","FxWindLeaf1","FxWindGrass1","FxWindLeaf3","FxWindLeaf2"];

{
	private _typeX = typeOf _x;
	if !(_typeX in _checkTypes) then {
		if (!(_x isKindOf "Man") && {!(_x isKindOf "Bird")} && {!(_x isKindOf "BulletCore")} && {!(_x isKindOf "Grenade")} && {!(_x isKindOf "WeaponHolder")} && {(_x distance _enemyX > 5)}) then {
			private _p1 = (boundingBoxReal _x) select 0;
			private _p2 = (boundingBoxReal _x) select 1;
			private _ancho = abs ((_p2 select 0) - (_p1 select 0));
			private _grueso = abs ((_p2 select 1) - (_p1 select 1));
			private _alto = abs ((_p2 select 2) - (_p1 select 2));
			if (_ancho > 2 && _grueso > 0.5 && _alto > 2) then {
				if (_typeX isEqualTo "") then {
					_small pushBack _x
				} else {
					_big pushBack _x;
				};
			};
		};
	};
} forEach (_objectsX - _roads);

if ((_big isEqualTo []) and (_small isEqualTo [])) exitWith {[]};
if (_big isNotEqualTo []) then {_objectX = [_big,_unit] call BIS_fnc_nearestPosition} else {_objectX = [_small,_unit] call BIS_fnc_nearestPosition};
if (isNull _objectX) exitWith {_pos};

if !(_objectX isKindOf "House") then {
	private _arr = _groupX getVariable ["usedForCover",[]];
	_arr pushBack _objectX;
	_groupX setVariable ["usedForCover",_arr];
	[_objectX,_groupX] spawn {
		params ["_objectX", "_groupX"];
		sleep 60;
		private ["_objectX","_groupX","_arr"];
		if (!(isNull _groupX) and {!(isNull _objectX)}) then {
			private _arr = _groupX getVariable ["usedForCover",[]];
			_arr = _arr - [_objectX];
			_groupX setVariable ["usedForCover",_arr];
		};
	};
};
private _posEnemy = position _enemyX;
private _pos = _posEnemy getPos [(_objectX distance _posEnemy) + 2, _posEnemy getDir _objectX];


_pos

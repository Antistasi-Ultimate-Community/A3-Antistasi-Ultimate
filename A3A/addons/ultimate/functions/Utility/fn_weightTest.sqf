params ["_values", "_weights"];

private _valuesResult = [];

for "_i" from 0 to 10000 do {
    private _result = _values selectRandomWeighted _weights;

    _valuesResult pushBack _result;

    // [format["Weighted Test. Result was %1", _result], _fnc_scriptName] call A3U_fnc_log;
};

{
    private _value = _x;

    private _count = { _x == _value } count _valuesResult;

    [format["Weighted Test. %1 was present %2 times.", _value, _count], _fnc_scriptName] call A3U_fnc_log;
} forEach _values;

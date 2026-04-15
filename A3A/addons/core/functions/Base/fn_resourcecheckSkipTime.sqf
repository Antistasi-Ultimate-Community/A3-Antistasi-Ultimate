params [["_hours", 6]];

cutText [format [localize "STR_params_rest", _hours],"BLACK",5];
sleep 10;
skiptime _hours;
//forceWeatherChange;
cutText [localize "STR_params_time_to_go","BLACK IN",10];

/* params [["_hours", 6]];

private _realDuration = 5.0;
private _steps = 150;                   // enough for a smooth curve
private _updateInterval = _realDuration / _steps;

// Speed-up profile: 0 at the begining, 1 in the middle, 0 in the end
fnc_profile = {
    params ["_t"];
    // smooth parabolic curve
    4 * _t * (1 - _t)
};

private _gameSecondsNeeded = _hours * 3600;

cutText [format [localize "STR_params_rest", _hours], "PLAIN", 1];
sleep 1;

// calculatings weights for each step
private _weights = [];
private _sumWeights = 0;
for "_i" from 1 to _steps do {
    private _t = (_i - 0.5) / _steps;
    private _w = _t call fnc_profile;
    _weights pushBack _w;
    _sumWeights = _sumWeights + _w;
};

// Playng transition with unequil steps
{
    private _fraction = _x / _sumWeights;
    private _skipHours = (_gameSecondsNeeded * _fraction) / 3600;
    skipTime _skipHours;
    sleep _updateInterval;
} forEach _weights;

cutText [localize "STR_params_time_to_go", "PLAIN", 8]; */
params [["_hours", 6]];

cutText [format [localize "STR_params_rest", _hours],"BLACK",5];
sleep 10;
skiptime _hours;
forceWeatherChange;
cutText [localize "STR_params_time_to_go","BLACK IN",10];

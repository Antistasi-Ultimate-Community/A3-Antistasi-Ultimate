params ["_vehicle"]

if (locked _vehicle in [0, 1]) exitWith {false};

true;
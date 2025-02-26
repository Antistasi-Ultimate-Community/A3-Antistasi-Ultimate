params ["_pos"];

private _soundSourceRoar = "#particlesource" createVehicle ASLToAGL _pos;
private _roars = [
    "Goliath_V_Roar_1", 
    "Goliath_V_Roar_2", 
    "Goliath_V_Roar_Dist_1", 
    "Goliath_V_Roar_Dist_2", 
    "Goliath_V_idle_1", 
    "Goliath_V_idle_2", 
    "Goliath_V_idle_3", 
    "Goliath_V_idle_4",
    "Goliath_V_idle_5",
    "Goliath_V_idle_6"
];
[_soundSourceRoar, [(selectRandom _roars), 3000, 0.01, 0, 0]] remoteExec ["say3D", 0];

_soundSourceRoar;
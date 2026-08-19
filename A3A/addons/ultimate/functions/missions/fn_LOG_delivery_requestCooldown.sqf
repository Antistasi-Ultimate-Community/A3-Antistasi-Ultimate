params ["_time"];

missionNamespace setVariable ["A3A_cargo_hasBeenRequested", true];

uiSleep _time; // 30 mins cooldown

missionNamespace setVariable ["A3A_cargo_hasBeenRequested", false];
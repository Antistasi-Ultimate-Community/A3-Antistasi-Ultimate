params ["_object", "_time"];

[
    _object,
    localize "STR_antistasi_actions_destroy_radio",
    "\a3\ui_f\data\igui\cfg\simpletasks\types\destroy_ca.paa", "\a3\ui_f\data\igui\cfg\simpletasks\types\destroy_ca.paa",
    "true", "true",
    {},
    {},
    {
        private _object = _target;
        deleteVehicle _object;
    },
    {},
    [], _time, nil, true, false
] call BIS_fnc_holdActionAdd;
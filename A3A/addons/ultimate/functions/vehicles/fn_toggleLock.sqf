params [
    ["_vehicle", ObjNull]
];

if (_vehicle isEqualTo ObjNull || {isNil "_vehicle"}) exitWith {false};

switch (locked _vehicle) do
{
    case 0:
    {
        [_vehicle, true] call A3U_fnc_setLock;
    };
    case 1;
    case 2;
    case 3:
    {
        [_vehicle, false] call A3U_fnc_setLock;
    };
    default
    {
        diag_log format["Vehicle %1 lock state was not recognized. Perhaps it is null?", typeOf _vehicle];
    };
};

true;
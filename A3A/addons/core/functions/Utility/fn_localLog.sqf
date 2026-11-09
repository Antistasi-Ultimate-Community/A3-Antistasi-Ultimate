/*
    Author: [Håkon]
    Description:
        logs argument as text

    Argument: <Array|String> Text(s) to log

    Return Value:
    <nil>

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example: "Some string to log" call A3A_fnc_localLog;

    License: MIT License
*/
if (_this isEqualType []) exitWith {
    {diag_log text _x} forEach _this;
};

diag_log text _this;
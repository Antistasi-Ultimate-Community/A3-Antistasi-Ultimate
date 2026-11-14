/*
    Author: Socrates
    Returns an array with objects loaded with logistics.


    Arguments:
    0. <OBJECT> Vehicle with cargo.

    Return Value:
    <OBJECT>

    Scope: Any
    Environment: Scheduled
    Public: [No]
    Dependencies:

    Example:
*/

private _vehicle = _this;
private _cargo = _vehicle getVariable ["Cargo", []];

if (_cargo isNotEqualTo []) then {
	_cargo = (flatten _cargo) select {_x isEqualType _vehicle};	
};

_cargo

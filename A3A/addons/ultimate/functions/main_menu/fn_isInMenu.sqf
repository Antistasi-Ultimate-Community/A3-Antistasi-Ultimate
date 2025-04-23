/*
	Execution On: Client
	
	Purpose: Checks if player is in main menu, prevents setting changes from bricking game until restart

	Made by: Silence

    Arguments:
    _unit	<OBJECT>
	
	Example:
	[player] call menu_framework_fnc_isInMenu;
*/

params ["_unit"];

if (_unit getVariable ["menu_framework_canPlay", false]) exitWith {true};

false
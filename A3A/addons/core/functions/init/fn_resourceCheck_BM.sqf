#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {
    Error("Server-only function miscalled");
};

params ["_blackMarketConditions"];

if (isTraderQuestCompleted) then {
    private _vehicleTypesUnlocked = unlockedVehicleTypes;
    private _vehicleTypesUnlockedNotify = [];

    if (isNil "_vehicleTypesUnlocked") then {
        _vehicleTypesUnlocked = [];
    };

    {
        private _condition = compile (_x#0);

        private _alreadyUnlocked = ((_x#1) in _vehicleTypesUnlocked);
        if (_alreadyUnlocked) then {continue};

        if (call _condition) then {
            private _text = format["%1 is now unlocked in the Arms Dealer.", (_x#1)];

            _vehicleTypesUnlocked pushBack (_x#1);
            _vehicleTypesUnlockedNotify pushBack (_x#1);
            
            Info(_text);
        };
    } forEach _blackMarketConditions;

    if (_vehicleTypesUnlockedNotify isEqualTo []) exitWith {false};

    private _unlockedMessages = "The following vehicles have been unlocked at the Arms Dealer.<br/>"; // To-Do: Localize

    {
        private _vehicleType = _x;
        _unlockedMessages = _unlockedMessages + "<br/>" + _vehicleType; // <br/> vehicleType <br/>
    } forEach _vehicleTypesUnlocked;

    [localize "STR_marker_arms_dealer", _unlockedMessages] remoteExec ["A3A_fnc_customHint", 0, false];

    unlockedVehicleTypes = _vehicleTypesUnlocked;
    
    publicVariable "unlockedVehicleTypes";
};
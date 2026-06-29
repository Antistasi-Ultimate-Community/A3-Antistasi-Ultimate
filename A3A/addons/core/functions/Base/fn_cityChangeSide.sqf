#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_city", ""], ["_rebel", false]];

if (!isServer) exitWith {Error("Server-only function miscalled")};

if (isNil "_city" || {_city isEqualTo ""}) exitWith {Error("Function was called incorrectly. _city param must be a city marker.")};

if (_city in townSkirmishes) exitWith {nil};

if (_rebel) then {
    ["TaskSucceeded", ["", format [localize "STR_notifiers_city_joined",_city,FactionGet(reb,"name")]]] remoteExec ["BIS_fnc_showNotification",teamPlayer];
    sidesX setVariable [_city,teamPlayer,true];
    [Occupants, 10, 60] remoteExec ["A3A_fnc_addAggression",2];
    garrison setVariable [_city,[],true];
    [_city] call A3A_fnc_mrkUpdate;
    [0,100,_city,false] spawn A3A_fnc_citySupportChange;

    private _closestAdminMarker = [milAdministrationsX, _city] call BIS_fnc_nearestPosition;
    if (_closestAdminMarker isEqualType "" && {(getMarkerPos _closestAdminMarker) distance2D (getMarkerPos _city) < 800}) then {
        private _milAdministration = [A3A_milAdministrations, _closestAdminMarker] call BIS_fnc_nearestPosition;
        [_milAdministration, "SILENT"] call SCRT_fnc_location_removeMilAdmin;
    };

    sleep 5;
    {_nul = [_city,_x] spawn A3A_fnc_deleteControls} forEach controlsX;
    [] call A3A_fnc_tierCheck;
} else {
    ["TaskFailed", ["", format [localize "STR_notifiers_city_joined",_city,FactionGet(occ,"name")]]] remoteExec ["BIS_fnc_showNotification",teamPlayer];
    sidesX setVariable [_city,Occupants,true];
    [Occupants, -10, 45] remoteExec ["A3A_fnc_addAggression",2];
    garrison setVariable [_city,[],true];
    [_city] call A3A_fnc_mrkUpdate;
    sleep 5;
    [] call A3A_fnc_tierCheck;
};
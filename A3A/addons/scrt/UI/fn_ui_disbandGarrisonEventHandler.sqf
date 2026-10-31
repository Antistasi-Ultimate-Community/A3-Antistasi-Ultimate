params ["_mode"];

if(_mode == "ADD") then {
    [
        "disbandGarrison",
        "onMapSingleClick",
        {
            playSound "readoutClick";

            private _site = [markersX, _pos] call BIS_fnc_nearestPosition;
            if (getMarkerPos _site distance _pos > 50) exitWith {
                [
                    localize "STR_notifiers_fail_type",
                    localize "STR_notifiers_disband_header",  
                    parseText (localize "STR_notifiers_disband_click"), 
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            };

            private _side = sidesX getVariable [_site, sideUnknown];
            if (_side != teamPlayer) exitWith {
                [
                    localize "STR_notifiers_fail_type",
                    localize "STR_notifiers_disband_header",  
                    parseText format [localize "STR_notifiers_disband_not_belong", A3A_faction_reb get "name"], 
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            };

            if ([_positionX] call A3A_fnc_enemyNearCheck) exitWith {
                [
                    localize "STR_notifiers_fail_type",
                    localize "STR_notifiers_disband_header",  
                    parseText (localize "STR_notifiers_disband_enemies_nearby"), 
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            };

            ["rem", _site] spawn A3A_fnc_garrisonDialog;
        },
        []
	] call BIS_fnc_addStackedEventHandler;
} else {
    ["disbandGarrison", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
};

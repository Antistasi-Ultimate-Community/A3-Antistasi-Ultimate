params ["_mode"];

if(_mode == "ADD") then {
    [
        "assignRivalsAttackLocation",
        "onMapSingleClick",
        {
            playSound "readoutClick";

			private _knownLocations = ["KNOWN"] call SCRT_fnc_rivals_getLocations;

			private _location = [_knownLocations, _pos] call BIS_fnc_nearestPosition;
			if (getMarkerPos _location distance _pos > 50) exitWith {
                [
					localize "STR_notifiers_fail_type",
                    localize "STR_antistasi_rivals_destroy_hideoutcell_header",
                    parseText (localize "STR_antistasi_rivals_destroy_hideoutcell_click_miss_text"),  
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            };

            if ((spawner getVariable [_location, 0]) != 2) exitWith {
                [
					localize "STR_notifiers_fail_type",
                    localize "STR_antistasi_rivals_destroy_hideoutcell_header",
                    parseText (format [localize "STR_antistasi_rivals_destroy_hideoutcell_no_spawner_text", A3A_faction_riv get "name", str distanceSPWN]),  
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            };

			if (_location in citiesX) then {
				[[_location],"A3A_fnc_RIV_ATT_Cell"] remoteExec ["A3A_fnc_scheduler",2];
            } else {
                if !(areInvadersDefeated) then {
                    private _roll = round random 100;
                    if (_roll >= 55) then { ///65
                        [[_location],"A3A_fnc_RIV_ATT_Transfer"] remoteExec ["A3A_fnc_scheduler",2];	
                    } else {
                        [[_location],"A3A_fnc_RIV_ATT_Hideout"] remoteExec ["A3A_fnc_scheduler",2];
                    };
			    };
			["REMOVE"] call SCRT_fnc_ui_assignRivalsAttackLocationEventHandler;
			closeDialog 0;
			closeDialog 0;
            [] call SCRT_fnc_ui_clearRivals;
            };
        },
        []
	] call BIS_fnc_addStackedEventHandler;
} else {
    ["assignRivalsAttackLocation", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
};

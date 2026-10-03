#include "..\defines.inc"
FIX_LINE_NUMBERS()


params ["_mode"];

if(_mode == "ADD") then {
    [
        "establishOutpost",
        "onMapSingleClick",
        {
            playSound "readoutClick";

            if ([] call FUNCMAIN(isTeardownEnabled)) exitWith {
                [localize "STR_notifiers_fail_type", localize "STR_A3A_base_teardownMode_OFF", parseText localize "STR_A3A_Dialogs_teardownActivePleaseDisable_text", 30] spawn SCRT_fnc_ui_showMessage;
            };

            if (outpostType == "WATCHPOST" && {isOnRoad _pos}) exitWith {
                [
                    localize "STR_notifiers_fail_type",
                    localize "STR_notifiers_trader_establish_outpost_header",  
                    parseText (localize "STR_notifiers_trader_establish_outpost_watchpost_warning"), 
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            };

            if (outpostType == "WATCHPOST") exitWith {
                [_pos, outpostCost select 0, outpostCost select 1, clientOwner] remoteExec ["SCRT_fnc_outpost_createWatchpost", 2];

                ["REMOVE"] call SCRT_fnc_ui_establishOutpostEventHandler;
                ctrlSetFocus ((findDisplay 60000) displayCtrl 2700);
                [] spawn {
                    sleep 0.01;
                    closeDialog 0;
                    closeDialog 0;
                };
            };

            if (outpostType == "ROADBLOCK" && {!isOnRoad _pos}) exitWith {
                [
                    localize "STR_notifiers_fail_type",
                    localize "STR_notifiers_trader_establish_outpost_header",  
                    parseText (localize "STR_notifiers_trader_establish_outpost_roadblock_warning"), 
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            };

            if (outpostType == "ROADBLOCK") exitWith {
                [_pos, outpostCost select 0, outpostCost select 1, clientOwner] remoteExec ["SCRT_fnc_outpost_createRoadblock", 2];

                ["REMOVE"] call SCRT_fnc_ui_establishOutpostEventHandler;
                ctrlSetFocus ((findDisplay 60000) displayCtrl 2700);
                [] spawn {
                    sleep 0.01;
                    closeDialog 0;
                    closeDialog 0;
                };
            };

            if (isNil "outpostOrigin") then {
                outpostOrigin = createMarkerLocal ["BRStart", _pos];
                outpostOrigin setMarkerShapeLocal "ICON";
                outpostOrigin setMarkerTypeLocal "hd_end";
                outpostOrigin setMarkerTextLocal format [localize "STR_marker_outpost_position", outpostType];

                [
                    localize "STR_notifiers_info_type",
                    localize "STR_notifiers_trader_establish_outpost_header",
                    parseText (localize "STR_notifiers_trader_establish_outpost_set_direction"), 
                    30
                ] spawn SCRT_fnc_ui_showMessage;
            } else {           
                outpostDirection = createMarkerLocal ["BRFin", _pos];
                outpostDirection setMarkerShapeLocal "ICON";
                outpostDirection setMarkerTypeLocal "hd_dot";
                outpostDirection setMarkerTextLocal format [localize "STR_marker_outpost_direction", outpostType];

                private _direction = [(getMarkerPos outpostOrigin), (getMarkerPos outpostDirection)] call BIS_fnc_dirTo;

                switch (outpostType) do {
                    case "AA": {
                        [(getMarkerPos outpostOrigin), _direction, outpostCost select 0, outpostCost select 1, clientOwner] remoteExec ["SCRT_fnc_outpost_createAa", 2];
                    };
                    case "AT": {
                        [(getMarkerPos outpostOrigin), _direction, outpostCost select 0, outpostCost select 1, clientOwner] remoteExec ["SCRT_fnc_outpost_createAt", 2];
                    };
                    case "HMG": {
                        [(getMarkerPos outpostOrigin), _direction, outpostCost select 0, outpostCost select 1, clientOwner] remoteExec ["SCRT_fnc_outpost_createHmg", 2];
                    };
                    default {
                        Error("Bad outpost type.");
                    };
                };

                ["REMOVE"] call SCRT_fnc_ui_establishOutpostEventHandler;
                ctrlSetFocus ((findDisplay 60000) displayCtrl 2700);
                [] spawn {
                    sleep 0.01;
                    closeDialog 0;
                    closeDialog 0;
                };
            };
        },
        []
	] call BIS_fnc_addStackedEventHandler;
} else {
    ["establishOutpost", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
};
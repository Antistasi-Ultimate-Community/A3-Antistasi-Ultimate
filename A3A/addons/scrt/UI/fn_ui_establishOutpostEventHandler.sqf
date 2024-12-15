#include "..\defines.inc"
FIX_LINE_NUMBERS()


params ["_mode"];
myGlobalResult = nil;
if(_mode == "ADD") then {
    [
        "establishOutpost",
        "onMapSingleClick",
        {
            playSound "readoutClick";

            myGlobalResult = _pos;
            outpostCostmoney = outpostCost select 0; 
            outpostCosthr = outpostCost select 1;

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
                //[_pos, outpostCost select 0, outpostCost select 1, clientOwner] remoteExec ["SCRT_fnc_outpost_createRoadblock", 2]; /// probably we can open choise diaglog here and after choise we open either additional dialog and in that we select vehicle and send a selected vehicle as parametr
                ///
                [myGlobalResult,_outpostCostmoney,_outpostCosthr] spawn
                { 
                    myGlobalResult = _this select 0;
                    _outpostCostmoney = _this select 1;
                    _outpostCosthr = _this select 2;
                	private _result = [(format["<t>%1</t><br />", localize "STR_A3A_GarageOrStore"]), "", localize "STR_A3A_Garage", localize "STR_A3A_Store"] call BIS_fnc_guiMessage;
                	// Use _result here
                    if (_result) then {
                        createDialog "A3A_VehiclesFromGarageDisplay";
                    } else {
                        createDialog "A3A_BuyVehicleRoadblockDialog";
                    };
                };

                
                ///

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

                turretDirection = [(getMarkerPos outpostOrigin), (getMarkerPos outpostDirection)] call BIS_fnc_dirTo;

                switch (outpostType) do {
                    case "AA": {
                        //[(getMarkerPos outpostOrigin), _direction, outpostCost select 0, outpostCost select 1, clientOwner] remoteExec ["SCRT_fnc_outpost_createAa", 2]; /// probably we can open choise diaglog here and after choise we open either additional dialog and in that we select vehicle and send a selected vehicle as parametr
                        ///
                        [myGlobalResult, outpostCostmoney, outpostCosthr, turretDirection] spawn
                        { 
                            myGlobalResult = _this select 0;
                            outpostCostmoney = _this select 1;
                            outpostCosthr = _this select 2;
                            turretDirection = _this select 3;
                        	private _result = [(format["<t>%1</t><br />", localize "STR_A3A_GarageOrStore"]), "", localize "STR_A3A_Garage", localize "STR_A3A_Store"] call BIS_fnc_guiMessage;
                        	// Use _result here
                            if (_result) then {
                                createDialog "A3A_StaticAAFromGarageDisplay";
                            } else {
                                createDialog "A3A_BuyVehicleAADialog";
                            };
                        };
                        ///
                    };
                    case "AT": {
                        //[(getMarkerPos outpostOrigin), _direction, outpostCost select 0, outpostCost select 1, clientOwner] remoteExec ["SCRT_fnc_outpost_createAt", 2]; /// probably we can open choise diaglog here and after choise we open either additional dialog and in that we select vehicle and send a selected vehicle as parametr
                        ///
                        [myGlobalResult, outpostCostmoney, outpostCosthr, turretDirection] spawn
                        { 
                            myGlobalResult = _this select 0;
                            outpostCostmoney = _this select 1;
                            outpostCosthr = _this select 2;
                            turretDirection = _this select 3;
                        	private _result = [(format["<t>%1</t><br />", localize "STR_A3A_GarageOrStore"]), "", localize "STR_A3A_Garage", localize "STR_A3A_Store"] call BIS_fnc_guiMessage;
                        	// Use _result here
                            if (_result) then {
                                createDialog "A3A_StaticATFromGarageDisplay";
                            } else {
                                createDialog "A3A_BuyVehicleATDialog";
                            };
                        };
                        ///
                    };
                    case "HMG": {
                        //[(getMarkerPos outpostOrigin), _direction, outpostCost select 0, outpostCost select 1, clientOwner] remoteExec ["SCRT_fnc_outpost_createHmg", 2]; /// probably we can open choise diaglog here and after choise we open either additional dialog and in that we select vehicle and send a selected vehicle as parametr
                        ///
                        [myGlobalResult, outpostCostmoney, outpostCosthr, turretDirection] spawn
                        { 
                            myGlobalResult = _this select 0;
                            outpostCostmoney = _this select 1;
                            outpostCosthr = _this select 2;
                            turretDirection = _this select 3;
                        	private _result = [(format["<t>%1</t><br />", localize "STR_A3A_GarageOrStore"]), "", localize "STR_A3A_Garage", localize "STR_A3A_Store"] call BIS_fnc_guiMessage;
                        	// Use _result here
                            if (_result) then {
                                createDialog "A3A_StaticMGFromGarageDisplay";
                            } else {
                                createDialog "A3A_BuyVehicleMGDialog";
                            };
                        };
                        ///
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
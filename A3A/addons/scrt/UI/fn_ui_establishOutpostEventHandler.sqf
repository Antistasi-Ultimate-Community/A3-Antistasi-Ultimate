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
                [myGlobalResult,outpostCostmoney,outpostCosthr] spawn ///step 1
                { 
                    myGlobalResult = _this select 0;
                    outpostCostmoney = _this select 1;
                    outpostCosthr = _this select 2;
                	private _result = [(format["<t>%1</t><br />", localize "STR_A3A_GarageOrStore"]), "", localize "STR_A3A_Garage", localize "STR_A3A_Store"] call BIS_fnc_guiMessage; ///step 1.5
                    private _hasValidVehicles = false;
                    private _categoriesToCheck = [1, 2]; // Номера категорий для проверки

                    // Проверяем каждую категорию из списка
                    {
                        private _categoryID = _x;
                        private _categoryVehicles = HR_GRG_Vehicles param [_categoryID, []];

                        // Перебираем технику в категории
                        {
                            _y params [
                                ["_displayName", ""],
                                ["_class", ""],
                                ["_lockedUID", ""],
                                ["_checkedOut", false],
                                ["", ""],
                                ["_lockName", ""],
                                ["_stateData", []],
                                ["_customisation", []]
                            ];

                            // Если нашли валидный класс - прерываем проверку
                            if (_class != "" && {isClass (configFile >> "CfgVehicles" >> _class)}) exitWith {
                                _hasValidVehicles = true;
                            };
                        } forEach _categoryVehicles;

                        // Если уже нашли валидную технику - прерываем проверку категорий
                        if (_hasValidVehicles) exitWith {};

                    } forEach _categoriesToCheck;
                    if (_result) then {
                        if (!_hasValidVehicles) then {
                            _result = false;
                            ["Гараж пуст, будет открыто окно магазина", "", true, true] call BIS_fnc_guiMessage;
                            createDialog "A3A_RoadblockFromStore";
                        } else {
                            createDialog "A3A_RoadblockFromGarage"; ///step 1.7
                        };
                    } else {
                        createDialog "A3A_RoadblockFromStore";
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

                [
                    outpostType,
                    myGlobalResult,
                    outpostCostmoney,
                    outpostCosthr,
                    turretDirection
                ] spawn {
                    private _outpostType = _this select 0;
                    myGlobalResult = _this select 1;
                    outpostCostmoney = _this select 2;
                    outpostCosthr = _this select 3;
                    turretDirection = _this select 4;

                    private _result = [
                        format["<t>%1</t><br />", localize "STR_A3A_GarageOrStore"], 
                        "", 
                        localize "STR_A3A_Garage", 
                        localize "STR_A3A_Store"
                    ] call BIS_fnc_guiMessage;

                    private _hasValidVehicles = false;
                    {  
                        _y params ["_displayName", "_class", "_lockedUID", "_checkedOut", "", ["_lockName", ""],"_stateData", "_customisation"];                        // Объявляем все переменные внутри итерации  
                                                    
                        if (_class != "" && {isClass (configFile >> "CfgVehicles" >> _class)}) exitwith {  
                            _hasValidVehicles = true; 
                        }; 
                    } forEach HR_GRG_Vehicles#7;

                    if (!_hasValidVehicles) then {
                        _result = false;
                        ["Гараж пуст, будет открыто окно магазина", "", true, true] call BIS_fnc_guiMessage;
                    };

                    private _dialog = format [
                        ["A3A_Static%1FromStore", "A3A_Static%1FromGarage"] select _result, 
                        _outpostType
                    ];
                    createDialog _dialog;  ///step 1.7
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
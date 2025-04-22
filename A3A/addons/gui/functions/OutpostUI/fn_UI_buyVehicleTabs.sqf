/*
Maintainer: DoomMetal, killerswin2
    Handles the initialization and updating of the Buy item dialog.
    This function should only be called from Buyvehicle onLoad and control activation EHs.

Arguments:
    <STRING> Mode, only possible value for this dialog is "onLoad"
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Return Value:
    Nothing

Scope: Clients, Local Arguments, Local Effect
Environment: Scheduled for onLoad mode
Public: No
Dependencies:
    None

Example:
    ["logistics"] call A3A_fnc_buyVehicleTab;
*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_groupIDC", "_IDD", "_outpostType"];

private _display = findDisplay _IDD;

Debug("BuyVehicleTab starting...");

// Setup Object render
private _objPreview = _display displayCtrl A3A_IDC_BUYOBJECTRENDER;  // 9303;
_objPreview ctrlShow false;

// Add stuff to the buyable vehicles list
private _typeMap = createHashMapFromArray [
    ["AA", "staticAA"],
    ["AT", "staticAT"],
    ["MG", "staticMG"],
    ["RB_LA", "militarylightarmed"],
    ["RB_AT", "militaryat"],
    ["RB_AA", "militaryaa"]
];
private _buyableVehiclesList = [_typeMap get _outpostType] call SCRT_fnc_ui_populateVehicleBox;
private _vehiclesControlsGroup = _display displayCtrl _groupIDC;

private _added = 0;
{
    _x params ["_className", "_price", "_canGoUndercover"];
    private _configClass = configFile >> "CfgVehicles" >> _className;
    if (!isClass _configClass) then { continue };

    private _crewCount = [_className] call A3A_fnc_getVehicleCrewCount;
    _crewCount params ["_driver", "_coPilot", "_commander", "_gunners", "_passengers", "_passengersFFV"];

    private _displayName = getText (_configClass >> "displayName");
    private _editorPreview = getText (_configClass >> "editorPreview");
    //private _vehicleIcon= getText (_configClass >> "Icon");
    private _model = getText (_configClass >> "model");

    private _hasVehiclePreview = fileExists _editorPreview;
    /* Turn on if you want the icons as a midway fallback
    if (!_hasVehiclePreview && fileExists _vehicleIcon) then {
        _editorPreview = _vehicleIcon;
        _hasVehiclePreview = true;
    };
    */

    // Add some extra padding to the top if there are 2 rows or less
    private _topPadding = if (count _buyableVehiclesList < 7) then {5 * GRID_H} else {0};

    private _itemXpos = 7 * GRID_W + ((7 * GRID_W + 44 * GRID_W) * (_added mod 3));
    private _itemYpos = (floor (_added / 3)) * (44 * GRID_H) + _topPadding;

    private _itemControlsGroup = _display ctrlCreate ["A3A_ControlsGroupNoScrollbars", -1, _vehiclesControlsGroup];
    _itemControlsGroup ctrlSetPosition[_itemXpos, _itemYpos, 44 * GRID_W, 37 * GRID_H];
    _itemControlsGroup ctrlSetFade 1;
    _itemControlsGroup ctrlCommit 0;

    private _previewPicture = _display ctrlCreate ["A3A_Picture", A3A_IDC_BUYVEHICLEPREVIEW, _itemControlsGroup];
    _previewPicture ctrlSetPosition [0, 0, 44 * GRID_W, 25 * GRID_H];
    _previewPicture ctrlSetText _editorPreview;
    _previewPicture ctrlCommit 0;

    private _button = _display ctrlCreate ["A3A_ShortcutButton", -1, _itemControlsGroup];
    _button ctrlSetPosition [0, 25 * GRID_H, 44 * GRID_W, 12 * GRID_H];
    _button ctrlSetText _displayName;
    _button ctrlSetTooltip format [localize "STR_antistasi_dialogs_buy_vehicle_button_tooltip", _displayName, _price, "€"];
    _button setVariable ["className", _className];
    _button setVariable ["model", _model];
    _button setVariable ["outpostType", _outpostType];
    _button ctrlAddEventHandler ["ButtonClick", {
        params ["_control"];
        closeDialog 2;
        _onetimevehicle = [(_control getVariable "className") createVehicleLocal [0, 0, 10000]];
        currentlySelectedVehicleCustomization = _onetimevehicle call BIS_fnc_getVehicleCustomization;
        deleteVehicle _onetimevehicle;
        outpostCostmoney = outpostCost select 0;
        private _cost = [_carcar] call A3A_fnc_vehiclePrice;
        outpostCostmoney = outpostCostmoney + _cost;
        outpostCosthr = outpostCost select 1;
        [
            _control getVariable "outpostType",
            _control getVariable "className",
            myGlobalResult,
            turretDirection,
            currentlySelectedVehicleCustomization,
            outpostCostMoney,
            outpostCostHR            
        ] spawn {
            params ["_outpostType", "_vehicle", "_pos", "_direction", "_vehCustomization", "_costMoney", "_costHR"];
            
            private ["_createFnc"];
            switch (_outpostType) do {
                case ("AA"): { _createFnc = "SCRT_fnc_outpost_createAA" };
                case ("AT"): { _createFnc = "SCRT_fnc_outpost_createAT" };
                case ("MG"): { _createFnc = "SCRT_fnc_outpost_createHMG" };
                case ("RB_LA");
                case ("RB_AT");
                case ("RB_AA"): {
                    _createFnc = "SCRT_fnc_outpost_createRoadblock";
                    _direction = [90, 0] select ([(format["<t>%1</t><br />", localize "STR_antistasi_dialogs_parallel"]), "", true, true] call BIS_fnc_guiMessage);
                };
            };
            [_vehicle, _pos, _direction, _vehCustomization, _costMoney, _costHR, objNull, objNull, clientOwner] remoteExec [_createFnc, 2];
        };
    }];
    _button ctrlCommit 0;

    // Object Render
    if (!_hasVehiclePreview) then {
        _button ctrlAddEventHandler ["MouseEnter", {
            params ["_control"];
            if (true || isNil "Dev_GUI_prevInjectEnter") then {
                params ["_control"];
                private _UIScaleAdjustment = (0.55/getResolution#5);  // I tweaked this on UI Small, so that's why the 0.55 is the base size.
                private _model = _control getVariable "model";
                private _className = _control getVariable "className";
                private _display = ctrlParent _control;
                private _objPreview = _display displayCtrl A3A_IDC_BUYOBJECTRENDER;  // 9303;
                _objPreview ctrlSetModel _model;
                private _boundingDiameter = [_className] call FUNC(sizeOf);
                _objPreview ctrlSetModelScale (2.25/(_boundingDiameter) * _UIScaleAdjustment);
                _objPreview ctrlSetModelDirAndUp [[-0.6283,0.3601,0.6896],[-0.0125,-0.5015,0.8651]];  // x y z

                private _editorPreviewPicture = ctrlParentControlsGroup _control controlsGroupCtrl A3A_IDC_BUYVEHICLEPREVIEW;  // 9304;

                private _mouseAbsolutePos = getMousePosition;
                private _mouseRelativePos = ctrlMousePosition _editorPreviewPicture;
                _mouseAbsolutePos vectorDiff _mouseRelativePos params ["_objPreview_x", "_objPreview_y"];


                private _yAdjustment = 0.25 * _UIScaleAdjustment;
                _objPreview ctrlSetPosition [_objPreview_x + 0.5 * (22 * pixelW * pixelGridNoUIScale), 4, _objPreview_y - 0.5 * (12.5 * pixelW * pixelGridNoUIScale) + _yAdjustment];
                _editorPreviewPicture ctrlShow false;
                _editorPreviewPicture ctrlCommit 1;
                _objPreview ctrlShow true;
                _objPreview ctrlEnable false;  // Prevent the user dragging it.
            } else {
                _control call Dev_GUI_prevInjectEnter;
            };
        }];
        _button ctrlAddEventHandler ["MouseExit", {
            params ["_control"];
            if (true || isNil "Dev_GUI_prevInjectExit") then {
                params ["_control"];
                private _display = ctrlParent _control;
                private _objPreview = _display displayCtrl A3A_IDC_BUYOBJECTRENDER;  // 9303;

                private _editorPreviewPicture = ctrlParentControlsGroup _control controlsGroupCtrl A3A_IDC_BUYVEHICLEPREVIEW;  // 9304;

                _editorPreviewPicture ctrlShow true;
                _editorPreviewPicture ctrlCommit 1;

                _objPreview ctrlShow false;
            } else {
                _control call Dev_GUI_prevInjectExit;
            };
        }];
    };

    private _priceText = _display ctrlCreate ["A3A_InfoTextRight", -1, _itemControlsGroup];
    _priceText ctrlSetPosition[23 * GRID_W, 21 * GRID_H, 20 * GRID_W, 3 * GRID_H];
    _priceText ctrlSetText format ["%1 €",_price];
    _priceText ctrlCommit 0;

    // Undercover icon
    if (_canGoUndercover) then
    {
        private _undercoverIcon = _display ctrlCreate ["A3A_PictureStroke", -1, _itemControlsGroup];
        _undercoverIcon ctrlSetPosition [1 * GRID_W, 1 * GRID_H, 4 * GRID_W, 4 * GRID_H];
        _undercoverIcon ctrlSetText A3A_Icon_HideVic;
        _underCoverIcon ctrlSetTooltip localize "STR_antistasi_dialogs_buy_vehicle_undercover_tooltip";
        _undercoverIcon ctrlCommit 0;
    };

    // Crew icons and counts
    private _hasGunners = if (_gunners > 0) then {1} else {0}; // Is there a better way to just return all positive numbers as 1?
    private _hasPassengers = if (_passengers > 0) then {1} else {0}; // Too sleepy to think of one right now...
    private _numberOfCrewTypes = (_driver + _commander + _hasGunners + _hasPassengers);
    private _crewCountHeight = _numberOfCrewTypes * 4.5 * GRID_H;
    private _crewCountYpos = 24 * GRID_H - _crewCountHeight;

    // Using an inner controlsGroup here so the coordinate calculations don't get completely unreadable
    private _crewControlsGroup = _display ctrlCreate ["A3A_ControlsGroupNoScrollbars", -1, _itemControlsGroup];
    _crewControlsGroup ctrlSetPosition[1 * GRID_W, _crewCountYpos, 20 * GRID_W, _crewCountHeight];
    _crewControlsGroup ctrlCommit 0;

    private _crewInfoAdded = 0;
    if (_driver > 0) then
    {
        private _driverIcon = _display ctrlCreate ["A3A_PictureStroke", -1, _crewControlsGroup];
        _driverIcon ctrlSetPosition [0, _crewInfoAdded * 4.5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
        _driverIcon ctrlSetText A3A_Icon_Driver;
        _driverIcon ctrlSetTooltip localize "STR_antistasi_dialogs_buy_vehicle_driver_tooltip";
        _driverIcon ctrlCommit 0;
    };

    if (_coPilot > 0) then
    {
        private _coPilotIcon = _display ctrlCreate ["A3A_PictureStroke", -1, _crewControlsGroup];
        _coPilotIcon ctrlSetPosition [5 * GRID_W, _crewInfoAdded * 4.5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
        _coPilotIcon ctrlSetText A3A_Icon_Driver;
        _coPilotIcon ctrlSetTextColor [0.8,0.8,0.8,1];
        _coPilotIcon ctrlSetTooltip localize "STR_antistasi_dialogs_buy_vehicle_copilot_tooltip";
        _coPilotIcon ctrlCommit 0;
    };

    if (_driver > 0 || _coPilot > 0) then
    {
        _crewInfoAdded = _crewInfoAdded + 1;
    };

    if (_commander > 0) then
    {
        private _commanderIcon = _display ctrlCreate ["A3A_PictureStroke", -1, _crewControlsGroup];
        _commanderIcon ctrlSetPosition [0, _crewInfoAdded * 4.5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
        _commanderIcon ctrlSetText A3A_Icon_Commander;
        _commanderIcon ctrlSetTooltip localize "STR_antistasi_dialogs_buy_vehicle_commander_tooltip";
        _commanderIcon ctrlCommit 0;

        _crewInfoAdded = _crewInfoAdded + 1;
    };

    if (_gunners > 0) then
    {
        private _gunnerIcon = _display ctrlCreate ["A3A_PictureStroke", -1, _crewControlsGroup];
        _gunnerIcon ctrlSetPosition [0, _crewInfoAdded * 4.5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
        _gunnerIcon ctrlSetText A3A_Icon_Gunner;
        _gunnerIcon ctrlSetTooltip localize "STR_antistasi_dialogs_buy_vehicle_gunner_tooltip";
        _gunnerIcon ctrlCommit 0;

        if (_gunners > 1) then
        {
            private _gunnersText = _display ctrlCreate ["A3A_InfoTextLeft", -1, _crewControlsGroup];
            _gunnersText ctrlSetPosition [3 * GRID_W, _crewInfoAdded * 4.5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
            _gunnersText ctrlSetText str _gunners;
            _gunnersText ctrlCommit 0;
            _gunnerIcon ctrlSetTooltip format[localize "STR_antistasi_dialogs_buy_vehicle_gunner_amount_tooltip", _gunners];
            _gunnerIcon ctrlCommit 0;
        };
        _crewInfoAdded = _crewInfoAdded + 1;
    };

    if (_passengers > 0) then
    {
        private _passengerIcon = _display ctrlCreate ["A3A_PictureStroke", -1, _crewControlsGroup];
        _passengerIcon ctrlSetPosition [0, _crewInfoAdded * 4.5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
        _passengerIcon ctrlSetText A3A_Icon_Cargo;
        _passengerIcon ctrlSetTooltip localize "STR_antistasi_dialogs_buy_vehicle_passenger_tooltip";
        _passengerIcon ctrlCommit 0;

        if (_passengers > 1) then
        {
            private _passengersText = _display ctrlCreate ["A3A_InfoTextLeft", -1, _crewControlsGroup];
            _passengersText ctrlSetPosition [3 * GRID_W, _crewInfoAdded * 4.5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
            _passengersText ctrlSetText str _passengers;
            _passengersText ctrlCommit 0;
            _passengerIcon ctrlSetTooltip format[localize "STR_antistasi_dialogs_buy_vehicle_passenger_amount_tooltip", _passengers];
            _passengerIcon ctrlCommit 0;
        };
        // _crewInfoAdded placement incremented later
    };

    if (_passengersFFV > 0) then
    {
        private _ffvIcon = _display ctrlCreate ["A3A_PictureStroke", -1, _crewControlsGroup];
        _ffvIcon ctrlSetPosition [7 * GRID_W, _crewInfoAdded * 4.5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
        _ffvIcon ctrlSetText A3A_Icon_FFV;
        _ffvIcon ctrlSetTextColor [0.8,0.8,0.8,1];
        _ffvIcon ctrlSetTooltip localize "STR_antistasi_dialogs_buy_vehicle_ffv_tooltip";
        _ffvIcon ctrlCommit 0;

        if (_passengersFFV > 1) then
        {
            private _ffvText = _display ctrlCreate ["A3A_InfoTextLeft", -1, _crewControlsGroup];
            _ffvText ctrlSetPosition [10 * GRID_W, _crewInfoAdded * 4.5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
            _ffvText ctrlSetText str _passengersFFV;
            _ffvText ctrlSetTextColor [0.8,0.8,0.8,1];
            _ffvText ctrlCommit 0;
            _ffvIcon ctrlSetTooltip format[localize "STR_antistasi_dialogs_buy_vehicle_ffv_amount_tooltip", _passengersFFV];
            _ffvIcon ctrlCommit 0;
        };
            // _crewInfoAdded placement incremented later
    };

    if (_passengers > 0 || _passengersFFV > 0) then
    {
        _crewInfoAdded = _crewInfoAdded + 1;
    };

    // Show item
    _itemControlsGroup ctrlSetFade 0;
    _itemControlsGroup ctrlCommit 0.1;

    _added = _added + 1;
} forEach _buyableVehiclesList;

Debug("BuyVehicleTab complete.");

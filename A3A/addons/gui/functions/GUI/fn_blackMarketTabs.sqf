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
    ["logistics"] call A3A_fnc_blackMarketTab;
*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_tab", "_group", "_category"];

private _display = findDisplay A3A_IDD_BLACKMARKETVEHICLEDIALOG;
private _tabBuildState = uiNamespace getVariable ["A3U_BM_tabBuildState", createHashMap];
if ((_tabBuildState getOrDefault [_category, 0]) isEqualTo 2) exitWith {};

Debug("blackMarketTabs starting...");

private _selectedTabCtrl = _display displayCtrl _tab;
_selectedTabCtrl ctrlShow true;

// Setup Object render
private _objPreview = _display displayCtrl A3A_IDC_BLACKMARKETBUYOBJECTRENDER;
_objPreview ctrlShow false;

// Add stuff to the buyable vehicles list
private _buyableVehiclesHM = [_category] call SCRT_fnc_ui_populateBlackMarket;
private _vehiclesControlsGroup = _display displayCtrl _group;
private _vehicleMetadataCache = uiNamespace getVariable ["A3U_BM_vehicleMetadataCache", createHashMap];
private _dlcMetadataCache = uiNamespace getVariable ["A3U_BM_dlcMetadataCache", createHashMap];
private _currencySymbol = A3A_faction_civ get "currencySymbol";
private _vehicleCount = count keys _buyableVehiclesHM;
private _topPadding = if (_vehicleCount < 7) then {5 * GRID_H} else {1 * GRID_H};

private _added = 0;
{
    private _className = _x;
    private _price = _y;
    private _canGoUndercover = false;

    private _vehicleMetadata = _vehicleMetadataCache getOrDefault [_className, []];
    if (_vehicleMetadata isEqualTo []) then {
        private _configClass = configFile >> "CfgVehicles" >> _className;
        if (!isClass _configClass) then { continue };

        private _crewCount = [_className] call A3A_fnc_getVehicleCrewCount;
        private _displayName = getText (_configClass >> "displayName");
        private _editorPreview = getText (_configClass >> "editorPreview");
        private _model = getText (_configClass >> "model");

        private _hasVehiclePreview = fileExists _editorPreview;
        if (!_hasVehiclePreview) then {
            _editorPreview = A3A_PlaceHolder_NoVehiclePreview;
            _hasVehiclePreview = true;
        };

        private _dlc = "";
        private _addons = configsourceaddonlist _configClass;
        if (count _addons > 0) then {
            private _mods = configsourcemodlist (configfile >> "CfgPatches" >> (_addons select 0));
            if (count _mods > 0) then {
                _dlc = _mods select 0;
            };
        };

        _vehicleMetadata = createHashMapFromArray [
            ["crewCount", _crewCount],
            ["displayName", _displayName],
            ["editorPreview", _editorPreview],
            ["model", _model],
            ["hasVehiclePreview", _hasVehiclePreview],
            ["dlc", _dlc]
        ];
        _vehicleMetadataCache set [_className, _vehicleMetadata];
    };

    private _configClass = configFile >> "CfgVehicles" >> _className;
    if (!isClass _configClass) then { continue };

    private _crewCount = _vehicleMetadata get "crewCount";
    _crewCount params ["_driver", "_coPilot", "_commander", "_gunners", "_passengers", "_passengersFFV"];

    private _displayName = _vehicleMetadata get "displayName";
    private _editorPreview = _vehicleMetadata get "editorPreview";
    private _model = _vehicleMetadata get "model";
    private _hasVehiclePreview = _vehicleMetadata get "hasVehiclePreview";
    /* Turn on if you want the icons as a midway fallback
    if (!_hasVehiclePreview && fileExists _vehicleIcon) then {
        _editorPreview = _vehicleIcon;
        _hasVehiclePreview = true;
    };
    */

    private _itemXpos = 7 * GRID_W + ((7 * GRID_W + 44 * GRID_W) * (_added mod 3)); /// space between first row(?) and left border
    private _itemYpos = (floor (_added / 3)) * (38 * GRID_H) + _topPadding; ///spacer between vehicles

    private _itemControlsGroup = _display ctrlCreate ["A3A_ControlsGroupNoScrollbars", -1, _vehiclesControlsGroup];
    _itemControlsGroup ctrlSetPosition[_itemXpos, _itemYpos, 44 * GRID_W, 37 * GRID_H];
    _itemControlsGroup ctrlSetFade 1;
    _itemControlsGroup ctrlCommit 0;

    private _previewPicture = _display ctrlCreate ["A3A_Picture", A3A_IDC_BLACKMARKETPREVIEW, _itemControlsGroup];
    _previewPicture ctrlSetPosition [0, 0, 44 * GRID_W, 25 * GRID_H];
    _previewPicture ctrlSetText _editorPreview;
    _previewPicture ctrlCommit 0;

    private _label = _display ctrlCreate ["A3A_SectionStructuredLabelLeft", -1, _itemControlsGroup];
    _label ctrlSetPosition [0, 0, 44 * GRID_W, 4 * GRID_H];
    private _dlc = _vehicleMetadata get "dlc";
    private _dlcMetadata = _dlcMetadataCache getOrDefault [_dlc, []];
    if (_dlcMetadata isEqualTo []) then {
        private _dlcParams = modParams [_dlc, ["logo", "logoOver"]];
        _dlcMetadata = createHashMapFromArray [
            ["logo", _dlcParams param [0, ""]],
            ["fieldManualTopicAndHint", getArray (configfile >> "CfgMods" >> _dlc >> "fieldManualTopicAndHint")]
        ];
        _dlcMetadataCache set [_dlc, _dlcMetadata];
    };
    private _logo = _dlcMetadata get "logo";
    private _fieldManualTopicAndHint = _dlcMetadata get "fieldManualTopicAndHint";
    _label ctrlseteventhandler ["buttonclick",format ["if (count %1 > 0) then {(%1 + [ctrlparent (_this select 0)]) call bis_fnc_openFieldManual;};",_fieldManualTopicAndHint]];
    private _OriginsText = composeText [
        _displayName," ",image _logo
    ];
    _label ctrlSetStructuredText _OriginsText;
    _label ctrlSetBackgroundColor [0,0,0,0.5];
    _label ctrlCommit 0;

    private _buttonTakeout = _display ctrlCreate ["A3A_ShortcutButtonSmall", -1, _itemControlsGroup];
    _buttonTakeout ctrlSetPosition [0, 25 * GRID_H, 22 * GRID_W, 6 * GRID_H];
    _buttonTakeout ctrlSetText (localize "STR_antistasi_dialogs_buy_vehicle_button");
    _buttonTakeout ctrlSetTooltip format [localize "STR_antistasi_dialogs_buy_vehicle_button_tooltip", _displayName, _price, _currencySymbol];
    _buttonTakeout setVariable ["className", _className];
    _buttonTakeout setVariable ["model", _model];
    _buttonTakeout ctrlAddEventHandler ["ButtonClick", {
        closeDialog 2; [(_this # 0) getVariable "className", false] spawn A3A_fnc_addBlackMarketVeh;
    }];
    _buttonTakeout ctrlCommit 0;

    private _buttonDelivery = _display ctrlCreate ["A3A_ShortcutButtonSmall", -1, _itemControlsGroup];
    _buttonDelivery ctrlSetPosition [22 * GRID_W, 25 * GRID_H, 22 * GRID_W, 6 * GRID_H];
    _buttonDelivery ctrlSetText (localize "STR_antistasi_dialogs_buy_vehicle_deliver_button");
    _buttonDelivery ctrlSetFontHeight GUI_TEXT_SIZE_SMALL;
    _buttonDelivery ctrlSetTooltip format [localize "STR_antistasi_dialogs_buy_vehicle_deliver_button_tooltip", _displayName, _price, _currencySymbol];
    _buttonDelivery setVariable ["className", _className];
    _buttonDelivery setVariable ["model", _model];
    _buttonDelivery ctrlAddEventHandler ["ButtonClick", {
        [(_this # 0) getVariable "className", true] spawn A3A_fnc_addBlackMarketVeh;
    }];
    _buttonDelivery ctrlCommit 0;

    // Object Render
    if (!_hasVehiclePreview) then {
        _buttonTakeout ctrlAddEventHandler ["MouseEnter", {
            params ["_control"];
            if (true || isNil "Dev_GUI_prevInjectEnter") then {
                params ["_control"];
                private _UIScaleAdjustment = (0.55/getResolution#5);  // I tweaked this on UI Small, so that's why the 0.55 is the base size.

                private _model = _control getVariable "model";
                private _className = _control getVariable "className";
                private _display = findDisplay A3A_IDD_BLACKMARKETVEHICLEDIALOG;
                private _objPreview = _display displayCtrl A3A_IDC_BLACKMARKETBUYOBJECTRENDER;
                _objPreview ctrlSetModel _model;
                private _boundingDiameter = [_className] call FUNC(sizeOf);
                _objPreview ctrlSetModelScale (2.25/(_boundingDiameter) * _UIScaleAdjustment);
                _objPreview ctrlSetModelDirAndUp [[-0.6283,0.3601,0.6896],[-0.0125,-0.5015,0.8651]];  // x y z

                private _editorPreviewPicture = ctrlParentControlsGroup _control controlsGroupCtrl A3A_IDC_BLACKMARKETPREVIEW;

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
        _buttonTakeout ctrlAddEventHandler ["MouseExit", {
            params ["_control"];
            if (true || isNil "Dev_GUI_prevInjectExit") then {
                params ["_control"];
                private _display = findDisplay A3A_IDD_BLACKMARKETVEHICLEDIALOG;
                private _objPreview = _display displayCtrl A3A_IDC_BLACKMARKETBUYOBJECTRENDER;

                private _editorPreviewPicture = ctrlParentControlsGroup _control controlsGroupCtrl A3A_IDC_BLACKMARKETPREVIEW;

                _editorPreviewPicture ctrlShow true;
                _editorPreviewPicture ctrlCommit 1;

                _objPreview ctrlShow false;
            } else {
                _control call Dev_GUI_prevInjectExit;
            };
        }];
    };

    // Handles showing price
    private _priceText = _display ctrlCreate ["A3A_InfoTextRight", -1, _itemControlsGroup];
    _priceText ctrlSetPosition[23 * GRID_W, 21 * GRID_H, 20 * GRID_W, 3 * GRID_H];
    _priceText ctrlSetText format ["%1 %2", _price, _currencySymbol];
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

    // Crew cluster collapsed to one structured-text control to reduce ctrlCreate overhead.
    private _crewRows = [];
    if (_driver > 0) then { _crewRows pushBack [A3A_Icon_Driver, _driver, false, localize "STR_antistasi_dialogs_buy_vehicle_driver_tooltip"]; };
    if (_coPilot > 0) then { _crewRows pushBack [A3A_Icon_Driver, _coPilot, true, localize "STR_antistasi_dialogs_buy_vehicle_copilot_tooltip"]; };
    if (_commander > 0) then { _crewRows pushBack [A3A_Icon_Commander, _commander, false, localize "STR_antistasi_dialogs_buy_vehicle_commander_tooltip"]; };
    if (_gunners > 0) then { _crewRows pushBack [A3A_Icon_Gunner, _gunners, false, localize "STR_antistasi_dialogs_buy_vehicle_gunner_tooltip"]; };
    if (_passengers > 0) then { _crewRows pushBack [A3A_Icon_Cargo, _passengers, false, localize "STR_antistasi_dialogs_buy_vehicle_passenger_tooltip"]; };
    if (_passengersFFV > 0) then { _crewRows pushBack [A3A_Icon_FFV, _passengersFFV, true, localize "STR_antistasi_dialogs_buy_vehicle_ffv_tooltip"]; };

    if (count _crewRows > 0) then {
        private _crewCountHeight = (count _crewRows) * (3.6 * GRID_H);
        private _crewCountYpos = 7 * GRID_H;
        private _maxCrewYpos = (24 * GRID_H) - _crewCountHeight;
        if (_crewCountYpos > _maxCrewYpos) then {
            _crewCountYpos = _maxCrewYpos;
        };

        private _crewInfo = _display ctrlCreate ["A3A_SectionStructuredLabelLeft", -1, _itemControlsGroup];
        _crewInfo ctrlSetPosition [1 * GRID_W, _crewCountYpos, 20 * GRID_W, _crewCountHeight];
        _crewInfo ctrlSetBackgroundColor [0, 0, 0, 0];

        private _crewLines = [];
        private _crewTooltipLines = [];
        {
            _x params ["_icon", "_count", "_isSecondary", "_tooltipText"];
            private _linePrefix = if (_isSecondary) then {"<t align='left' color='#CCCCCC'>"} else {"<t align='left'>"};
            _crewLines pushBack format ["%1<img image='%2' size='0.8'/> x%3</t>", _linePrefix, _icon, _count];
            _crewTooltipLines pushBack format ["%1: %2", _tooltipText, _count];
        } forEach _crewRows;

        _crewInfo ctrlSetStructuredText parseText (_crewLines joinString "<br/>");
        _crewInfo ctrlSetTooltip (_crewTooltipLines joinString "\n");
        _crewInfo ctrlCommit 0;
    };

    // Show item
    _itemControlsGroup ctrlSetFade 0;
    _itemControlsGroup ctrlCommit 0.1;

    _added = _added + 1;
} forEach _buyableVehiclesHM;

uiNamespace setVariable ["A3U_BM_vehicleMetadataCache", _vehicleMetadataCache];
uiNamespace setVariable ["A3U_BM_dlcMetadataCache", _dlcMetadataCache];

_tabBuildState set [_category, 2];
uiNamespace setVariable ["A3U_BM_tabBuildState", _tabBuildState];

Debug("blackMarketTabs complete.");

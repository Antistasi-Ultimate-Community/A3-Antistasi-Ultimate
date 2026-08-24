/*
Author: [Killerswin2, Hakon (Stole his bb code)]
    creates the controls for the dialog. Picture and Button are created. Data Saved to buttons. 
Arguments:
1. <string> string for initilizer
Return Value:
NONE
Scope: Client
Environment: scheduled
Public: 
no
Example:
["onLoad"] spawn A3A_fnc_teamLeaderRTSPlacerDialog
*/




#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
#include "\x\A3A\addons\core\functions\Builder\placerDefines.hpp"
#define BOTTOM safeZoneH + safeZoneY
FIX_LINE_NUMBERS()

params[["_mode","onLoad"], ["_params",[]]];

switch (_mode) do
{
    case ("updateMoney"):
    {
        private _display = findDisplay A3A_IDD_TEAMLEADERDIALOG;
        private _moneyCtrl = _display displayCtrl A3A_IDC_TEAMLEADERBUILDERMONEY;

        _moneyCtrl ctrlSetText format ["%1 %2", A3A_building_EHDB get AVAILABLE_MONEY, A3A_faction_civ get "currencySymbol"];
    };
    case ("onLoad"):
    {
        _params params[
            ["_buildableObjects", EGVAR(core,tlDialogBuildableObjects), [[]]],
            ["_createBackButton", false, [true]],
            ["_restoreScrollValues", [0,0], [[]], 2]
        ];

        // First call for top-level menu, reset menu stack
        if !(_createBackButton) then {
            GVAR(builderMenuStack) = [];
        };

        private _display = findDisplay A3A_IDD_TEAMLEADERDIALOG;
        private _parent = (_display displayCtrl A3A_IDC_TEAMLEADERBUILDERMAIN);
        private _buildControlsGroup = _parent controlsGroupCtrl A3A_IDC_TEAMLEADERBUILDINGGROUP;

        private _moneyCtrl = _display displayCtrl A3A_IDC_TEAMLEADERBUILDERMONEY;
        _moneyCtrl ctrlSetText format ["%1 %2", A3A_building_EHDB get AVAILABLE_MONEY, A3A_faction_civ get "currencySymbol"];

        private _boxWidth = round ((ctrlPosition _buildControlsGroup # 2) / GRID_W);
        private _itemsPerRow = floor ((_boxWidth - 6) / 36);			// minimum 32 + 4 grids per tile
        private _itemWidth = floor ((_boxWidth - 6 - 4*_itemsPerRow) / _itemsPerRow);
        private _itemIndex = -1;
        private _buildMeATile = {
            if !assert(params[
                ["_displayName", nil, [""]],
                ["_className", nil, [""]],
                ["_price", 0, [0]],
                ["_editorPreview", nil, [""]],
                ["_model", nil, [""]]
            ]) exitWith {};
            private _subMenuItems = param[5, nil, [[]]];
    
            private _itemXpos = (4 + (4 + _itemWidth) * (_itemIndex % _itemsPerRow)) * GRID_W;
            private _itemYpos = (floor (_itemIndex / _itemsPerRow)) * (34 * GRID_H);

            //diag_log format ["Builder: Item %1, xpos %2, ypos %3", _itemIndex, _itemXpos, _itemYPos];

            private _itemControlsGroup = _display ctrlCreate ["A3A_ControlsGroupNoScrollbars", A3A_IDC_TEAMLEADERBUILDITEMGROUP, _buildControlsGroup];
            _itemControlsGroup ctrlSetPosition[_itemXpos, _itemYpos, _itemWidth * GRID_W, 30 * GRID_H];
            _itemControlsGroup ctrlSetFade 1;
            _itemControlsGroup ctrlCommit 0;

            private _previewPicture = _display ctrlCreate ["A3A_Picture", A3A_IDC_TEAMLEADERBUILDIMAGEPREVIEW, _itemControlsGroup];
            _previewPicture ctrlSetPosition [0, 0, _itemWidth * GRID_W, 24 * GRID_H];
            _previewPicture ctrlSetText _editorPreview;
            _previewPicture ctrlCommit 0;
    
            private _button = _display ctrlCreate ["A3A_ButtonSmallText", A3A_IDC_TEAMLEADERBUILDBUTTON, _itemControlsGroup];
            _button ctrlSetPosition [0, 24 * GRID_H, _itemWidth * GRID_W, 6 * GRID_H];
            _button ctrlSetText _displayName;
            _button setVariable ["className", _className];
            _button setVariable ["model", _model];
            _button setVariable ["price", _price];
            _button setVariable ["subMenu", RETNIL(_subMenuItems)];
            _button ctrlCommit 0;

            if (_price isNotEqualTo 0) then {
                private _priceText = _display ctrlCreate ["A3A_InfoTextRight", -1, _itemControlsGroup];
                _priceText ctrlSetPosition[(_itemWidth - 21) * GRID_W, 20 * GRID_H, 20 * GRID_W, 3 * GRID_H];
                _priceText ctrlSetText format ["%1 %2",_price,A3A_faction_civ get "currencySymbol"];
                _priceText ctrlCommit 0;
            };

            if (isNil "_subMenuItems") then {
                private _buildTime = _display ctrlCreate ["A3A_PictureStroke", -1, _itemControlsGroup];
                _buildTime ctrlSetPosition[1 * GRID_W, 19 * GRID_H, 4 * GRID_W, 4 * GRID_H];
                _buildTime ctrlSetText A3A_Icon_Construct;
                _buildTime ctrlCommit 0;
            };

            // show stuff
            _itemControlsGroup ctrlSetFade 0;
            _itemControlsGroup ctrlCommit 0.1;

            [_button];
        };

        [{
            params["_control","_scrollValues"];
            _control ctrlSetScrollValues _scrollValues;
        }, [_buildControlsGroup, _restoreScrollValues]] call CBA_fnc_execNextFrame;

        allControls _buildControlsGroup apply { ctrlDelete _x };

        if (_createBackButton) then {
            _itemIndex = _itemIndex + 1;
            ([format["<<< %1", localize "STR_antistasi_dialogs_build_button_no_text"], "", 0, "#(rgb,8,8,3)color(0,0,0,1)", "", []] call _buildMeATile) params["_button"];
            _button ctrlAddEventHandler ["ButtonClick", {
                params["_control"];

                // Stack underflow
                if (GVAR(builderMenuStack) isEqualTo []) exitWith {
                    Warning("Builder menu stack underflow. This should never happen. Closing dialog.");
                    while { dialog } do { closeDialog 1 };
                };

                // Have to execute in the next frame because deleting a
                // control (this button) in its own event handler causes Arma to
                // throw a hissy fit and CTD.
                [{
                    call A3A_fnc_teamLeaderRTSPlacerDialog;
                }, ["onLoad", GVAR(builderMenuStack) deleteAt 0]] call CBA_fnc_execNextFrame;
            }];
        };

        _buildableObjects = _buildableObjects select {
            private _callback = configFile >> "CfgVehicles" >> (_x select 0) >> QEGVAR(core,buildingPlacerCanPlace);
            // sub-menu definition
            (count _x isNotEqualTo 2) ||
            // no callback available -> always show
            { !isText(_callback) } ||
            // let's see what the callback has to say
            { [_x] call compile getText(_callback) isEqualTo true }
        };

        _buildableObjects apply {
            _itemIndex = _itemIndex + 1;

            private _config = if (count _x isNotEqualTo 2) then {
                _x params["_displayName", "_editorPreview", "_subMenuItems"];
                [format["%1 >>>", _displayName], "", 0, _editorPreview, "", _subMenuItems];
            } else {
                _x params [
                    ["_className", "Land_Tyres_F"],
                    ["_price", 0]
                ];

                private _configClass = configFile >> "CfgVehicles" >> _className;
                private _displayName = getText (_configClass >> "displayName");
                private _editorPreview = getText (_configClass >> "editorPreview");
                private _model = getText (_configClass >> "model");
        
                private _hasVehiclePreview = fileExists _editorPreview;

                if (!_hasVehiclePreview) then {
                    _editorPreview = A3A_PlaceHolder_NoVehiclePreview;
                };

                [_displayName, _className, _price, _editorPreview, _model];
            };

            private _return = _config call _buildMeATile;
            _return params[
                ["_button", nil, [controlNull]]
            ];

            if !(isNil { _button getVariable "subMenu" }) then {
                _button setVariable["returnMenu", [_buildableObjects, _createBackButton]];
                _button setVariable["hostControl", _buildControlsGroup];
                _button ctrlAddEventHandler["ButtonClick", {
                    params["_control"];
                    private _scrollValues = ctrlScrollValues(_control getVariable "hostControl");
                    private _returnMenu = _control getVariable "returnMenu";
                    _returnMenu params["_buildableObjects","_createBackButton"];
                    GVAR(builderMenuStack) = [[_buildableObjects, _createBackButton, _scrollValues]] + GVAR(builderMenuStack);
                }];
            };

            _button ctrlAddEventHandler ["ButtonClick", {
                params ["_control"];

                if(isNil "A3A_building_EHDB") then {
                    // how the fuck did you do this? No databases?
                    call A3A_fnc_initPlacerDB;
                };

                if !(isNil { _control getVariable "subMenu" }) exitWith {
                    ["onLoad", [_control getVariable "subMenu", true]] call A3A_fnc_teamLeaderRTSPlacerDialog;
                };

                private _object = (A3A_building_EHDB get BUILD_OBJECT_TEMP_OBJECT);
                private _className = _control getVariable ["className", "Land_Tyres_F"];
                if (_className == typeof _object) exitWith {};			// refire, potentially caused by hitting space

                private _price = _control getVariable ["price", 0];
                private _supply = A3A_building_EHDB get AVAILABLE_MONEY;
                if (_price > _supply) exitWith {};			// TODO: Should disable buttons based on available money?

                A3A_building_EHDB set [BUILD_OBJECT_SELECTED_STRING, _className];		// why does this exist?
                A3A_building_EHDB set [OBJECT_PRICE, _price];

                private _vehPos =  getPosATL _object;
                private _vehDir = getDir _object;
                deleteVehicle _object;

                _object = _className createVehicleLocal [0,0,0];
                _object enableSimulation false;
                _object hideObject true;			// Otherwise it might not get checked, with some weird input combo
                _object setPos _vehPos;
                _object setDir _vehDir;
                _object setVariable[QEGVAR(core,isTempObject), true];
                _object setVariable[QEGVAR(core,uuid), [] call CBA_fnc_createUUID];
                A3A_building_EHDB set [BUILD_OBJECT_TEMP_OBJECT, _object];
                call (A3A_building_EHDB get UPDATE_BB);
            }];
        };
    
        // EH to block camera zoom while mouse is over the selection dialog
        if (isNil { _display getVariable QGVAR(ehMouseMoving) }) then {
            _display setVariable[QGVAR(ehMouseMoving), _display displayAddEventHandler ["MouseMoving", {
                params[ "_display" ];

                private _scrollArea = _display displayCtrl A3A_IDC_TEAMLEADERBUILDERMAIN;
                ctrlPosition _scrollArea params ["_xpos", "_ypos", "_width", "_height"];

                private _isMouseInArea = getMousePosition inArea [[_xpos + _width/2, _ypos + _height/2], _width/2, _height/2, 0, true];

                if (_isMouseInArea) then {
                    A3A_cam camCommand "manual off";
                } else {
                    A3A_cam camCommand "manual on";
                };
                
            }]];
        };

        // _txt = _display ctrlCreate[ "A3A_StructuredText", -1];
        // _txt ctrlSetPosition[ (1.4 * safeZoneX) + safeZoneW, -0.65 * safeZoneY, 0.5, 0.3];			// funkiness because I don't want to deal with dialogs anymore tonight
        // _txt ctrlCommit 0;
        // _txt ctrlSetStructuredText parseText localize "STR_antistasi_teamleader_placer_placer_info";
    };
    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("Mode does not exist: %1", _mode);
    };
};

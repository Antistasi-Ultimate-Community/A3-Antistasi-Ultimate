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
['off'] call SCRT_fnc_ui_toggleMenuBlur;
params ["_category"];
_categoty = _this select 0;
private _display = findDisplay A3A_IDD_DISPLAYGARAGEVEHICLES;
private _vehicleListBox = _display displayCtrl A3A_IDC_GARAGE_CATCAR;
_vehicleListBox ctrlCommit 0;

// Создание области для предварительного просмотра
private _display = findDisplay A3A_IDD_DISPLAYGARAGEVEHICLES;
private _previewArea = _display displayCtrl A3A_IDC_GARAGEStructuredText;
_previewArea ctrlCommit 0;
private _selectButton = _display displayCtrl A3A_IDC_GARAGEselectbutton;

lbClear _vehicleListBox;
lbClear A3A_IDC_GARAGE_CATCAR;
_currentPreviewVeh = objNull;

Debug("BuyVehicleTab starting...");    

//diag_log HR_GRG_Vehicles#0;
//diag_log HR_GRG_Vehicles#0;
//diag_log HR_GRG_Vehicles#0;
{
    deleteVehicle _x;
} forEach previewVehicles;

vehicleToOutpost = "";
curentlySelectedVehicleUID = 0;
curentlySelectedVehicleState = [];
curentlySelectedVehicleCustomization = [];
garageCategoryToremoveVehicleFrom = [];

_selectButton ctrlRemoveAllEventHandlers "ButtonClick";
/////or instead of all this use _getSaveData (probably)

// also can check vehicle type here fn_common_vehicle_getVehicleType

// Получение списка доступных транспортных средств
switch (_categoty) do 
{
    case ("light"): {
        {  
            _y params ["_displayName", "_class", "_lockedUID", "_checkedOut", "", ["_lockName", ""],"_stateData", "_customisation"];
            //diag_log _y;
            //diag_log str _y;
            //diag_log _x;
            private _UID = _x;
            private _displayName = _displayName;
            private _index = _vehicleListBox lbAdd _displayName;
            _vehicleListBox lbSetData [_index, "[" + str _x + "," + str _y + "]" ];
            _vehicleListBox lbSetValue [_index, _x];
            _vehicleListBox lbSetPicture [_index, cfgIcon(_class)];
            _vehicleListBox lbSetPictureColor [_index, [1, 1, 1, 1]];
            _vehicleListBox lbSetPictureColorSelected [_index, [0.85, 0.85, 0.55, 1]];
            _vehicleListBox lbSetPictureRightColorSelected [_index, [0.85,0.85,0.55,1]];
            garageCategoryToremoveVehicleFrom = HR_GRG_Vehicles#0;
        } forEach (HR_GRG_Vehicles#0);
    };
    case ("heavy"): {
        {
            _y params ["_displayName", "_class", "_lockedUID", "_checkedOut", "", ["_lockName", ""],"_stateData", "_customisation"];
            //diag_log _y;
            //diag_log str _y;
            //diag_log _x;
            private _UID = _x;
            private _displayName = _displayName;
            private _index = _vehicleListBox lbAdd _displayName;
            _vehicleListBox lbSetData [_index, "[" + str _x + "," + str _y + "]" ];
            _vehicleListBox lbSetValue [_index, _x];
            _vehicleListBox lbSetPicture [_index, cfgIcon(_class)];
            _vehicleListBox lbSetPictureColor [_index, [1, 1, 1, 1]];
            _vehicleListBox lbSetPictureColorSelected [_index, [0.85, 0.85, 0.55, 1]];
            _vehicleListBox lbSetPictureRightColorSelected [_index, [0.85,0.85,0.55,1]];
            garageCategoryToremoveVehicleFrom = HR_GRG_Vehicles#1;
        } forEach (HR_GRG_Vehicles#1);
    };
};

A3U_fnc_displaystuff = {
    _data params ["_control","_selectedIndex","_vehFullData"];
    //diag_log _data;

    vehicleToOutpost = "";
    curentlySelectedVehicleUID = 0;
    curentlySelectedVehicleState = [];
    curentlySelectedVehicleCustomization = [];

    _vehFullData = _vehFullData;
    //diag_log _vehFullData;
    _vehFullData params ["_UID", "_data"];
    curentlySelectedVehicleUID = _vehFullData select 0;
    //diag_log _UID;
    _vehData = _data;
    //diag_log _vehData;
    _vehData params ["_displayName", "_class", "_lockedUID", "_checkedOut", "", ["_lockName", ""],"_stateData", "_customisation"];
    _selectedClassName = _class;
    {
        deleteVehicle _x;
    } forEach previewVehicles;
    
    // Получение информации о выбранной технике
    private _configPath = configFile >> "CfgVehicles" >> _selectedClassName;
    if (!isClass _configClass) exitWith {};

    private _display = findDisplay A3A_IDD_DISPLAYGARAGEVEHICLES;

    private _crewCount = [_selectedClassName] call A3A_fnc_getVehicleCrewCount;
    _crewCount params ["_driver", "_coPilot", "_commander", "_gunners", "_passengers", "_passengersFFV"];
    
    //to set _canGoUndercover need to check if vehicleclass in undercoverVehicles
    // Undercover icon
    if (_selectedClassName in undercoverVehicles) then
    {
        private _undercoverIcon = _display displayCtrl A3A_IDC_GARAGEundercoverIcon;
        //_undercoverIcon ctrlSetPosition [1 * GRID_W, 1 * GRID_H, 4 * GRID_W, 4 * GRID_H];
        _undercoverIcon ctrlShow true;
        _undercoverIcon ctrlSetText A3A_Icon_HideVic;
        _underCoverIcon ctrlSetTooltip localize "STR_antistasi_dialogs_buy_vehicle_undercover_tooltip";
        _undercoverIcon ctrlCommit 0;
    };
    private _crewInfoAdded = 0;

    if (_driver > 0) then
    {
        private _driverIcon = _display displayCtrl A3A_IDC_GARAGEdriverIcon;
        //_driverIcon ctrlSetPosition [0, _crewInfoAdded * 4.5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
        _driverIcon ctrlShow true;
        _driverIcon ctrlSetText A3A_Icon_Driver;
        _driverIcon ctrlSetTooltip localize "STR_antistasi_dialogs_buy_vehicle_driver_tooltip";
        _driverIcon ctrlCommit 0;

        /* private _driverGunsText = _display displayCtrl A3A_IDC_GARAGEdriverGunsText;
        _driverGunsText ctrlSetPosition [0, _crewInfoAdded * 5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
        _driverGunsText ctrlSetText A3A_Icon_Driver;
        _driverGunsText ctrlCommit 0; */
    };
    
    _coPilotIcon ctrlCommit 0;
    if (_coPilot > 0) then
    {
        private _coPilotIcon = _display displayCtrl A3A_IDC_GARAGEcoPilotIcon;
        //_coPilotIcon ctrlSetPosition [5 * GRID_W, _crewInfoAdded * 4.5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
        _coPilotIcon ctrlShow true;
        _coPilotIcon ctrlSetText A3A_Icon_Driver;
        _coPilotIcon ctrlSetTextColor [0.8,0.8,0.8,1];
        _coPilotIcon ctrlSetTooltip localize "STR_antistasi_dialogs_buy_vehicle_copilot_tooltip";
        _coPilotIcon ctrlCommit 0;

        /* private _coPilotGunsText = _display displayCtrl A3A_IDC_GARAGEcoPilotGunsText;
        //_coPilotGunsText ctrlSetPosition [0, _crewInfoAdded * 5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
        _coPilotGunsText ctrlSetText A3A_Icon_Driver;
        _coPilotGunsText ctrlCommit 0; */
    };

    if (_driver > 0 || _coPilot > 0) then
    {
        _crewInfoAdded = _crewInfoAdded + 1;
    };

    if (_commander > 0) then
    {
        private _commanderIcon = _display displayCtrl A3A_IDC_GARAGEcommanderIcon;
        //_commanderIcon ctrlSetPosition [0, _crewInfoAdded * 4.5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
        _commanderIcon ctrlShow true;
        _commanderIcon ctrlSetText A3A_Icon_Commander;
        _commanderIcon ctrlSetTooltip localize "STR_antistasi_dialogs_buy_vehicle_commander_tooltip";
        _commanderIcon ctrlCommit 0;
        _crewInfoAdded = _crewInfoAdded + 1;

        /* private _commanderGunsText = _display displayCtrl A3A_IDC_GARAGEcommanderGunsText;
        //_commanderGunsText ctrlSetPosition [0, _crewInfoAdded * 5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
        _commanderGunsText ctrlSetText A3A_Icon_Commander;
        _commanderGunsText ctrlCommit 0; */
    };

    if (_gunners > 0) then
    {
        private _gunnerIcon = _display displayCtrl A3A_IDC_GARAGEgunnerIcon;
        //_gunnerIcon ctrlSetPosition [0, _crewInfoAdded * 4.5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
        _gunnerIcon ctrlShow true;
        _gunnerIcon ctrlSetText A3A_Icon_Gunner;
        _gunnerIcon ctrlSetTooltip localize "STR_antistasi_dialogs_buy_vehicle_gunner_tooltip";
        _gunnerIcon ctrlCommit 0;

        /* private _gunnerGunsText = _display displayCtrl A3A_IDC_GARAGEgunnerGunsText;
        //_gunnerGunsText ctrlSetPosition [0, _crewInfoAdded * 5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
        _gunnerGunsText ctrlSetText A3A_Icon_Gunner; ///get driver guns
        _gunnerGunsText ctrlCommit 0; */
        if (_gunners > 1) then
        {
            private _gunnersText = _display displayCtrl A3A_IDC_GARAGEgunnerText;
            //_gunnersText ctrlSetPosition [3 * GRID_W, _crewInfoAdded * 4.5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
            _gunnersText ctrlShow true;
            _gunnersText ctrlSetText str _gunners;
            _gunnersText ctrlCommit 0;
            _gunnerIcon ctrlSetTooltip format[localize "STR_antistasi_dialogs_buy_vehicle_gunner_amount_tooltip", _gunners];
            _gunnerIcon ctrlCommit 0;

            /* private _gunnerGunsText = _display displayCtrl A3A_IDC_GARAGEgunnerGunsText;
            //_gunnerGunsText ctrlSetPosition [0, _crewInfoAdded * 5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
            _gunnerGunsText ctrlSetText A3A_Icon_Gunner; ///get driver guns
            _gunnerGunsText ctrlCommit 0; */
        };
        _crewInfoAdded = _crewInfoAdded + 1;
    };

    if (_passengers > 0) then
    {
        private _passengerIcon = _display displayCtrl A3A_IDC_GARAGEpassengerIcon;
        //_passengerIcon ctrlSetPosition [0, _crewInfoAdded * 4.5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
        _passengerIcon ctrlShow true;
        _passengerIcon ctrlSetText A3A_Icon_Cargo;
        _passengerIcon ctrlSetTooltip localize "STR_antistasi_dialogs_buy_vehicle_passenger_tooltip";
        _passengerIcon ctrlCommit 0;
        if (_passengers > 1) then
        {
            private _passengersText = _display displayCtrl A3A_IDC_GARAGEpassengersText;
            //_passengersText ctrlSetPosition [3 * GRID_W, _crewInfoAdded * 4.5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
            _passengersText ctrlShow true;
            _passengersText ctrlSetText str _passengers;
            _passengersText ctrlCommit 0;
            _passengerIcon ctrlSetTooltip format[localize "STR_antistasi_dialogs_buy_vehicle_passenger_amount_tooltip", _passengers];
            _passengerIcon ctrlCommit 0;
        };
        // _crewInfoAdded placement incremented later
    };

    if (_passengersFFV > 0) then
    {
        private _ffvIcon = _display displayCtrl A3A_IDC_GARAGEffvIcon;
        //_ffvIcon ctrlSetPosition [7 * GRID_W, _crewInfoAdded * 4.5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
        _ffvIcon ctrlShow true;
        _ffvIcon ctrlSetText A3A_Icon_FFV;
        _ffvIcon ctrlSetTextColor [0.8,0.8,0.8,1];
        _ffvIcon ctrlSetTooltip localize "STR_antistasi_dialogs_buy_vehicle_ffv_tooltip";
        _ffvIcon ctrlCommit 0;
        if (_passengersFFV > 1) then
        {
            private _ffvText = _display displayCtrl A3A_IDC_GARAGEffvText;
            //_ffvText ctrlSetPosition [10 * GRID_W, _crewInfoAdded * 4.5 * GRID_H, 3 * GRID_W, 3 * GRID_H];
            _ffvText ctrlShow true;
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
    // creating vehicle for the preview
    _currentPreviewVeh = _selectedClassName createVehicleLocal [0, 0, 10000];
    _currentPreviewVeh enableSimulation false;
    vehicleToOutpost = _selectedClassName;

    _currentPreviewVeh setPos [0, 1000, 100000];

    //diag_log getPos _currentPreviewVeh;
    //diag_log previewVehicles;

    previewVehicles pushBack _currentPreviewVeh;
    //diag_log previewVehicles;

    private _previewCamera = "camera" camCreate [0, 1000, 100000];
    _previewCamera enableSimulation false;
    _previewCamera cameraEffect ["Internal", "Back"]; ///maybe we don't need this one and only need one below
    showCinemaBorder false;
    enableEnvironment false;
    _previewCamera camSetTarget _currentPreviewVeh;
    _previewCamera camSetRelPos [10, 10, 1];
    _previewCamera camCommit 0;
    _previewCamera cameraEffect ["Internal", "Back"];

    //preview cam rotation events
    /* HR_GRG_RMouseBtnDown = false;
    _disp displayAddEventHandler ["MouseButtonDown", "if ((_this#1) isEqualTo 1) then {HR_GRG_RMouseBtnDown = true};"];
    _disp displayAddEventHandler ["MouseButtonUp", "if ((_this#1) isEqualTo 1) then {HR_GRG_RMouseBtnDown = false};"];
    _disp displayAddEventHandler ["MouseMoving", "if (HR_GRG_RMouseBtnDown) then {_this call HR_GRG_fnc_updateCamPos};"];
    _disp displayAddEventHandler ["MouseZChanged","if !(HR_GRG_RMouseBtnDown) exitWith {};
    HR_GRG_camDist = 0.9 max (HR_GRG_camDist - (_this#1)*0.1) min 2; [nil,0,0] call HR_GRG_fnc_updateCamPos;
    HR_GRG_previewLight setLightBrightness 1.1 * HR_GRG_camDist;"]; */ 
    ///would been nice to use this but it's too much code under you know what

    //diag_log camTarget _previewCamera;
    //camTarget _previewCamera;
    //diag_log camTarget _previewCamera;

    // Получение данных о технике
    curentlySelectedVehicleState = _vehData select 4; // vehicle status
    Trace_1("Preview vehicle State: %1", _vehState);
    
    // setting vehicle state
    [_currentPreviewVeh, _vehState] call HR_GRG_fnc_setState; ///setting vehicle state
    _currentPreviewVeh allowDamage false;
    // vehicle customization
    curentlySelectedVehicleCustomization = _vehData param [6, [false, false]];
    ([_currentPreviewVeh] + curentlySelectedVehicleCustomization) call BIS_fnc_initVehicle;
    
    // Обновление информации в области предварительного просмотра
    //private _description = getText (configFile >> "CfgVehicles" >> _selectedClassName >> "description");
    _description2 = [_configPath >> "Library" >> "libTextDesc", ""] call HALs_fnc_getConfigValue;
    //private _description3 = [_configPath >> "descriptionShort", ""] call HALs_fnc_getConfigValue;
    //diag_log _description2;
    //diag_log parseText _description2;
    //diag_log parseText str _description2;

    private _previewArea = _display displayCtrl A3A_IDC_GARAGEStructuredText;
    _previewArea ctrlSetText _description2;
    /* _previewArea ctrlSetStructuredText (parseText str [
        getText (configFile >> "CfgVehicles" >> _selectedClassName >> "description"),
        [_configPath >> "Library" >> "libTextDesc", ""] call HALs_fnc_getConfigValue,
        [_configPath >> "descriptionShort", ""] call HALs_fnc_getConfigValue
    ] select {_x != ""} param [0, ""]); */
    
    _previewArea ctrlCommit 0;

    private _description = "";

    private _weapons = [_selectedClassName] call A3A_fnc_getVehicleWeapons;
    //diag_log _weapons;

    private _crew = ([_selectedClassName] call A3A_fnc_getVehicleClassCrew);
    _description = _description + "<t size='1.2' color='#D9D98C'>ЭКИПАЖ</t><br />" + ((_crew apply { _x#0 }) joinString "<br />") + "<br />";
    _description = _description + "<t size='1.2' color='#D9D98C'>ОРУЖИЕ</t><br />";

    {
        //diag_log _x;
		_description = _description + getText(configFile >> "cfgWeapons" >> _x >> "displayName") + "<br/>";
	} foreach _weapons;

    ///вместо камуфляж использовать стрингтейбл который перед этим передан в переменную с localize
    _description = _description + "<t size='1.2' color='#D9D98C'>КАМУФЛЯЖ</t><br />";
    _description = _description + ((([_selectedClassName] call A3A_fnc_getVehicleClassSkins) apply { _x#1 }) joinString "<br />");

    //diag_log _description;
    private _descriptionBox = _display displayCtrl A3A_IDC_GARAGEinfo;
    //_descriptionBox ctrlSetText _description + "<br /> ";
    _descriptionBox ctrlSetStructuredText parseText(_description + "<br /> ");
    //([_descriptionBox, "detail_info"] call A3A_fnc_getControlById) ctrlSetStructuredText parseText(_description + "<br /> ");
    _descriptionBox ctrlCommit 0;
};

_vehicleListBox lbSetCurSel 0;
//[_vehicleListBox, _edcategory] call HR_GRG_fnc_reloadCategory;

// Обработчик события выбора техники из листбокса
_vehicleListBox ctrlAddEventHandler ["LBSelChanged", {  /// if only one vehicle in list box, should use this onLBDblClick
    private _control = _this select 0;

    private _display = findDisplay A3A_IDD_DISPLAYGARAGEVEHICLES;
    private _undercoverIcon = _display displayCtrl A3A_IDC_GARAGEundercoverIcon;
    private _driverIcon = _display displayCtrl A3A_IDC_GARAGEdriverIcon;
    private _coPilotIcon = _display displayCtrl A3A_IDC_GARAGEcoPilotIcon;
    private _commanderIcon = _display displayCtrl A3A_IDC_GARAGEcommanderIcon;
    private _gunnerIcon = _display displayCtrl A3A_IDC_GARAGEgunnerIcon;
    private _gunnersText = _display displayCtrl A3A_IDC_GARAGEgunnerText;
    private _passengerIcon = _display displayCtrl A3A_IDC_GARAGEpassengerIcon;
    private _passengersText = _display displayCtrl A3A_IDC_GARAGEpassengersText;
    private _ffvIcon = _display displayCtrl A3A_IDC_GARAGEffvIcon;
    private _ffvText = _display displayCtrl A3A_IDC_GARAGEffvText;
    _undercoverIcon ctrlShow false;
    _driverIcon ctrlShow false;
    _coPilotIcon ctrlShow false;
    _commanderIcon ctrlShow false;
    _gunnerIcon ctrlShow false;
    _gunnersText ctrlShow false;
    _passengerIcon ctrlShow false;
    _passengersText ctrlShow false;
    _ffvIcon ctrlShow false;
    _ffvText ctrlShow false;

    private _selectedIndex = lbCurSel _control;
    //diag_log lbCurSel _control;
    private _indexText = _control lbText _selectedIndex;
    //diag_log _indexText;
    private _vehdatastring = _control lbData _selectedIndex;
    //diag_log _vehdatastring;
    private _vehFullData = parseSimpleArray _vehdatastring;
    //diag_log _vehFullData;
    [_control,_selectedIndex,_vehFullData] call A3U_fnc_displaystuff;
}];

// Кнопка для закрытия диалога
_selectButton ctrlAddEventHandler ["ButtonClick", {
    closeDialog 2; // Закрытие диалога
    // Завершение работы камеры и закрытие диалога
    camDestroy _previewCamera; // Уничтожаем камеру
    {
        deleteVehicle _x;
    } forEach previewVehicles;

    _carcar = vehicleToOutpost; ///this probably doubles as it spawns 2 groups 
    _pos = myGlobalResult;
    _vehicledirection = nil;
    [_pos,_carcar,outpostCost] spawn
        { 
            _pos = _this select 0;
            _carcar = _this select 1;
            outpostCost = _this select 2;
            diag_log outpostCost;
        	private _result = [(format["Do you want vehicle to be parallel to the road?"]), "Confirm", true, true] call BIS_fnc_guiMessage;
            if (_result) then {
                _vehicledirection = 90;
                [_carcar, _pos, _vehicledirection,outpostCost select 0, outpostCost select 1, clientOwner] remoteExec ["SCRT_fnc_outpost_createRoadblock", 2];
            } else {
                _vehicledirection = 0;
                [_carcar, _pos, _vehicledirection,outpostCost select 0, outpostCost select 1, clientOwner] remoteExec ["SCRT_fnc_outpost_createRoadblock", 2];
            };
        };
}];
Debug("BuyVehicleTab complete.");
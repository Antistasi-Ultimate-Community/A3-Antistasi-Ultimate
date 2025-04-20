/*
Maintainer: wersal
*/


#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_category", "_staticType"];

// Общая часть инициализации
['off'] call SCRT_fnc_ui_toggleMenuBlur;
private _display = findDisplay A3A_IDD_DISPLAYGARAGEVEHICLES;
private _vehicleListBox = _display displayCtrl A3A_IDC_GARAGE_CATCAR;
_vehicleListBox ctrlCommit 0;

private _previewArea = _display displayCtrl A3A_IDC_GARAGEStructuredText;
_previewArea ctrlCommit 0;
private _selectButton = _display displayCtrl A3A_IDC_GARAGEselectbutton;

lbClear _vehicleListBox;
lbClear A3A_IDC_GARAGE_CATCAR;
_currentPreviewVeh = objNull;

Debug("BuyVehicleTab starting...");    

{
    deleteVehicle _x;
} forEach previewVehicles;

vehicleToOutpost = "";
curentlySelectedVehicleUID = 0;
curentlySelectedVehicleState = [];
curentlySelectedVehicleCustomization = [];
garageCategoryToremoveVehicleFrom = 22;

_selectButton ctrlRemoveAllEventHandlers "ButtonClick";
/////or instead of all this use _getSaveData (probably)

// also can check vehicle type here fn_common_vehicle_getVehicleType

[_vehicleListBox,_category] call A3A_fnc_processVehicleCategory;

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
    
    private _configPath = configFile >> "CfgVehicles" >> _selectedClassName;
    if (!isClass _configClass) exitWith {};

    private _display = findDisplay A3A_IDD_DISPLAYGARAGEVEHICLES;
    
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

    // Show item
    // creating vehicle for the preview
    _currentPreviewVeh = _selectedClassName createVehicleLocal [0, 0, 10000];
    _currentPreviewVeh enableSimulation false;
    vehicleToOutpost = _selectedClassName;

    _currentPreviewVeh setPos [0, 1000, 100000];
    previewVehicles pushBack _currentPreviewVeh;

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

    curentlySelectedVehicleState = _vehData select 4; // vehicle status
    Trace_1("Preview vehicle State: %1", _vehState);
    
    // setting vehicle state
    [_currentPreviewVeh, _vehState] call HR_GRG_fnc_setState; ///setting vehicle state
    _currentPreviewVeh allowDamage false;
    // vehicle customization
    curentlySelectedVehicleCustomization = _vehData param [6, [false, false]];
    ([_currentPreviewVeh] + curentlySelectedVehicleCustomization) call BIS_fnc_initVehicle;
    
    _description2 = [_configPath >> "Library" >> "libTextDesc", ""] call HALs_fnc_getConfigValue;

    private _previewArea = _display displayCtrl A3A_IDC_GARAGEStructuredText;
    _previewArea ctrlSetText _description2;
    
    _previewArea ctrlCommit 0;

    private _description = "";

    private _weapons = [_selectedClassName] call A3A_fnc_getVehicleWeapons;

    private _crew = ([_selectedClassName] call A3A_fnc_getVehicleClassCrew);
    _description = _description + format ["<t size='1.2' color='#D9D98C'>%1</t><br />", localize "STR_antistasi_dialogs_crew"] + ((_crew apply { _x#0 }) joinString "<br />") + "<br />";
    _description = _description + format ["<t size='1.2' color='#D9D98C'>%1</t><br />", localize "STR_antistasi_dialogs_weapons"];

    {
		_description = _description + getText(configFile >> "cfgWeapons" >> _x >> "displayName") + "<br/>";
	} foreach _weapons;

    _description = _description + format ["<t size='1.2' color='#D9D98C'>%1</t><br />", localize "STR_antistasi_dialogs_camo"];
    _description = _description + ((([_selectedClassName] call A3A_fnc_getVehicleClassSkins) apply { _x#1 }) joinString "<br />") + "<br />";

    _description = _description + format ["<t size='1.2' color='#D9D98C'>%1</t><br />", localize "STR_antistasi_dialogs_animations"];
    {
        _configName = configname _x;
        _displayName = getText (_x >> "displayName");
        if (_displayName != "") then {
            _description = _description + _displayName + "<br/>";
        };
    } foreach (configProperties [(configfile >> "CfgVehicles" >> _selectedClassName >> "animationSources"),"isclass _x",true]);

    private _descriptionBox = _display displayCtrl A3A_IDC_GARAGEinfo;
    _descriptionBox ctrlSetStructuredText parseText(_description + "<br /> ");
    _descriptionBox ctrlCommit 0;

    //update Origins panel
    private _Origins = _display displayCtrl HR_GRG_IDC_OriginsPanel;
    private _itemCfg = configfile >> "cfgvehicles" >> _selectedClassName;
    private _dlc = "";
    private _addons = configsourceaddonlist _itemCfg;
    if (count _addons > 0) then {
    	private _mods = configsourcemodlist (configfile >> "CfgPatches" >> _addons select 0);
    	if (count _mods > 0) then {
    		_dlc = _mods select 0;
    	};
    };
    private _dlcParams = modParams [_dlc,["logo","logoOver"]];
    private _logo = _dlcParams param [0,""];
    private _logoOver = _dlcParams param [1,""];
    private _fieldManualTopicAndHint = getarray (configfile >> "cfgMods" >> _dlc >> "fieldManualTopicAndHint");
    _Origins ctrlsetfade 0;
    _Origins ctrlseteventhandler ["buttonclick",format ["if (count %1 > 0) then {(%1 + [ctrlparent (_this select 0)]) call bis_fnc_openFieldManual;};",_fieldManualTopicAndHint]];
    private _OriginsText = composeText [
        image _logo, " ",[_itemCfg,_Origins] call bis_fnc_overviewauthor
    ];
    _Origins ctrlSetStructuredText _OriginsText;
    _Origins ctrlCommit 0;
};

_vehicleListBox lbSetCurSel 0;

_vehicleListBox ctrlAddEventHandler ["LBSelChanged", {  /// if only one vehicle in list box, should use this onLBDblClick
    private _control = _this select 0;

    private _display = findDisplay A3A_IDD_DISPLAYGARAGEVEHICLES;

    private _selectedIndex = lbCurSel _control;
    private _indexText = _control lbText _selectedIndex;
    private _vehdatastring = _control lbData _selectedIndex;
    //diag_log _vehdatastring;
    private _vehFullData = parseSimpleArray _vehdatastring;
    //diag_log _vehFullData;
    [_control,_selectedIndex,_vehFullData] call A3U_fnc_displaystuff;
}];

_selectButton ctrlAddEventHandler ["ButtonClick", {
    closeDialog 2;
    camDestroy _previewCamera;
    {
        deleteVehicle _x;
    } forEach previewVehicles;

    _carcar = vehicleToOutpost;
    _pos = myGlobalResult;
    _vehicledirection = nil;
    outpostCostmoney = outpostCost select 0;
    outpostCosthr = outpostCost select 1;
    [_pos,_carcar,curentlySelectedVehicleCustomization,outpostCostmoney,outpostCosthr,garageCategoryToremoveVehicleFrom,curentlySelectedVehicleUID] spawn ///step 3
        { 
            _pos = _this select 0;
            _carcar = _this select 1;
            curentlySelectedVehicleCustomization = _this select 2;
            outpostCostmoney = _this select 3;
            outpostCosthr = _this select 4;
            _garageCategoryToremoveVehicleFrom = _this select 5;
            _curentlySelectedVehicleUID = _this select 6;
            _turretDirection = turretDirection;
            [_pos, _carcar,outpostCostmoney,outpostCosthr,_turretDirection,_garageCategoryToremoveVehicleFrom,_curentlySelectedVehicleUID] spawn
            { 
                _pos = _this select 0;
                _carcar = _this select 1;
                outpostCostmoney = _this select 2;
                outpostCosthr = _this select 3;
                _turretDirection = _this select 4;
                _garageCategoryToremoveVehicleFrom = _this select 5;
                _curentlySelectedVehicleUID = _this select 6;
                [_carcar, _pos, _turretDirection,curentlySelectedVehicleCustomization,outpostCostmoney, outpostCosthr, _garageCategoryToremoveVehicleFrom, _curentlySelectedVehicleUID, clientOwner] remoteExec ["SCRT_fnc_outpost_createAa", 2];
            };
        };
}];
Debug("BuyVehicleTab complete.");

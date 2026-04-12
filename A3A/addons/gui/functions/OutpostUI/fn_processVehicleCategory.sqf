#include "..\..\dialogues\defines.hpp"
params ["_vehicleListBox","_category"];

processVehicleCategory = {
    params ["_vehicleListBox", "_categoryVehicles", "_categoryIndex"];
    
    {
    	_y params ["_displayName", "_class", "_lockedUID", "_checkedOut", "", ["_lockName", ""],"_stateData", "_customisation"];
	
    	private _UID = _x;
    	private _displayName = _displayName;
    	private _index = _vehicleListBox lbAdd _displayName;
	
    	_vehicleListBox lbSetData [_index, "[" + str _x + "," + str _y + "]" ];
    	_vehicleListBox lbSetValue [_index, _x];
    	_vehicleListBox lbSetPicture [_index, cfgIcon(_class)];
	
    	_vehicleListBox lbSetPictureColor [_index, [1, 1, 1, 1]];
    	_vehicleListBox lbSetPictureColorSelected [_index, [0.85, 0.85, 0.55, 1]];
    	_vehicleListBox lbSetPictureRightColorSelected [_index, [0.85,0.85,0.55,1]];
	
    	garageCategoryToremoveVehicleFrom = _categoryIndex;
    } forEach _categoryVehicles;
};

switch (_category) do {
    case ("light"): {
        [_vehicleListBox, HR_GRG_Vehicles#1, 1] call processVehicleCategory;
    };
    case ("heavy"): {
        [_vehicleListBox, HR_GRG_Vehicles#2, 2] call processVehicleCategory;
    };
    case ("Static"): {
        [_vehicleListBox, HR_GRG_Vehicles#7, 7] call processVehicleCategory;
    };
};
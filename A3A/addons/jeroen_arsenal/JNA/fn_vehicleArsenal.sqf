/*
    By: Jeroen Notenbomer

	overwrites default arsenal script, original arsenal needs to be running first in order to initilize the display.

    fuctions:
    ["Preload"] call jn_fnc_arsenal;
    	preloads the arsenal like the default arsenal but it doesnt have "BIS_fnc_endLoadingScreen" so you dont have errors
    ["customInit", "arsenalDisplay"] call jn_fnc_arsenal;
    	overwrites all functions in the arsenal with JNA ones.
*/


#include "\A3\ui_f\hpp\defineDIKCodes.inc"
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

#define FADE_DELAY	0.15

#define MODLIST ["","curator","kart","heli","mark","expansion","expansionpremium"]

#define GETDLC\
	{\
		private _dlc = "";\
		private _addons = configsourceaddonlist _this;\
		if (_addons isNotEqualTo []) then {\
			private _mods = configsourcemodlist (configfile >> "CfgPatches" >> _addons select 0);\
			if (_mods isNotEqualTo []) then {\
				_dlc = _mods select 0;\
			};\
		};\
		_dlc\
	};

#define ADDMODICON\
	{\
		private _dlcName = _this call GETDLC;\
		if (_dlcName != "") then {\
			_ctrlList lbsetpictureright [_lbAdd,(modParams [_dlcName,["logo"]]) param [0,""]];\
			_modID = MODLIST find _dlcName;\
			if (_modID < 0) then {_modID = MODLIST pushback _dlcName;};\
			_ctrlList lbsetvalue [_lbAdd,_modID];\
		};\
	};

#define IDCS_LEFT\
	IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON,\
	IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON,\
	IDC_RSCDISPLAYARSENAL_TAB_HANDGUN,\
	IDC_RSCDISPLAYARSENAL_TAB_UNIFORM,\
	IDC_RSCDISPLAYARSENAL_TAB_VEST,\
	IDC_RSCDISPLAYARSENAL_TAB_BACKPACK,\
	IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR,\
	IDC_RSCDISPLAYARSENAL_TAB_GOGGLES,\
	IDC_RSCDISPLAYARSENAL_TAB_NVGS,\
	IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS,\
	IDC_RSCDISPLAYARSENAL_TAB_MAP,\
	IDC_RSCDISPLAYARSENAL_TAB_GPS,\
	IDC_RSCDISPLAYARSENAL_TAB_RADIO,\
	IDC_RSCDISPLAYARSENAL_TAB_COMPASS,\
	IDC_RSCDISPLAYARSENAL_TAB_WATCH

#define IDCS_RIGHT\
	IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC,\
	IDC_RSCDISPLAYARSENAL_TAB_ITEMACC,\
	IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE,\
	IDC_RSCDISPLAYARSENAL_TAB_ITEMBIPOD,\
	IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG,\
	IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL,\
	IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW,\
	IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT,\
	IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC\

#define IDCS	[IDCS_LEFT,IDCS_RIGHT]

#define INITTYPES\
		_types = [];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_UNIFORM,["Uniform"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_VEST,["Vest"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_BACKPACK,["Backpack"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR,["Headgear"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_GOGGLES,["Glasses"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_NVGS,["NVGoggles"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS,["Binocular","LaserDesignator"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON,["AssaultRifle","MachineGun","SniperRifle","Shotgun","Rifle","SubmachineGun"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON,["Launcher","MissileLauncher","RocketLauncher"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_HANDGUN,["Handgun"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_MAP,["Map"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_GPS,["GPS","UAVTerminal"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_RADIO,["Radio"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_COMPASS,["Compass"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_WATCH,["Watch"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_FACE,[]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_VOICE,[]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_INSIGNIA,[]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC,["AccessorySights"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_ITEMACC,["AccessoryPointer"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE,["AccessoryMuzzle"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_ITEMBIPOD,["AccessoryBipod"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG,[]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL,[]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW,[/*"Grenade","SmokeShell"*/]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT,[/*"Mine","MineBounding","MineDirectional"*/]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC,["FirstAidKit","Medikit","MineDetector","ToolKit"]];

#define STATS_WEAPONS\
	["reloadtime","dispersion","maxzeroing","hit","mass","initSpeed"],\
	[true,true,false,true,false,false]

#define STATS_EQUIPMENT\
	["passthrough","armor","maximumLoad","mass"],\
	[false,false,false,false]

#define ERROR if !(_item in _disabledItems) then {_disabledItems set [count _disabledItems,_item];};

disableSerialization;

// Calculate the minimum number of an item needed before non-members can take it
private _minItemsMember = {
	params ["_index", "_item"];					// Arsenal tab index, item classname
	private _min = jna_minItemMember select _index;
	_min = A3A_arsenalLimits getOrDefault [_item, _min];
	if (_index == IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG || _index == IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL) then {
		_min = _min * getNumber (configFile >> "CfgMagazines" >> _item >> "count");
	};
	_min;
};

params [["_mode", "Open", [displayNull, ""]], ["_params", [], [[],""]]];

switch _mode do {

	///////////////////////////////////////////////////////////////////////////////////////////
	case "CustomInit":{
		_params params ["_display"];
		private _objectSelected = uiNamespace getVariable "jn_object_selected";

		missionNamespace setVariable ["bis_fnc_arsenal_center",_objectSelected];

		//save crap in array
		jnva_loadout = (_objectSelected call jn_fnc_arsenal_cargoToArray);
		jnva_loadout_mass = ["getMass"] call jn_fnc_vehicleArsenal;
       	clearMagazineCargoGlobal _objectSelected;
        clearItemCargoGlobal _objectSelected;
        clearWeaponCargoGlobal _objectSelected;
        clearBackpackCargoGlobal _objectSelected;

		["customGUI",[_display]] call jn_fnc_vehicleArsenal;
		["customEvents",[_display]] call jn_fnc_vehicleArsenal;
		["ColorTabs",[_display]] call jn_fnc_vehicleArsenal;

		['showMessage',[_display,(localize "STR_JNA_ACT_VEHICLE_INVENTORY")]] call jn_fnc_arsenal;
		["jn_fnc_arsenal"] call BIS_fnc_endLoadingScreen;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "getMass":{
		_massTotal = 0;

		private _objectSelected = uiNamespace getVariable "jn_object_selected";
		
		_loadout = (_objectSelected call jn_fnc_arsenal_cargoToArray);
		{
			_index = _forEachIndex;
			{
				_item = _x select 0;
				_amount = _x select 1;
				_mass = ["getMassItem",[_item,_amount,_index]] call jn_fnc_vehicleArsenal;
				_massTotal = _massTotal + _mass;
			} forEach _x;
		}forEach _loadout;
		_massTotal;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "getMassItem":{
		_params params ["_item","_amount","_index"];

		_magCount = 1;
		_cfg = switch _index do {
			case IDC_RSCDISPLAYARSENAL_TAB_BACKPACK:	{configFile >> "cfgvehicles" 	>> _item >> "mass"};
			case IDC_RSCDISPLAYARSENAL_TAB_GOGGLES:		{configFile >> "cfgglasses" 	>> _item >> "mass"};
			case IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG;
			case IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL;
			case IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW;
			case IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT: 	{	_magCount = getNumber (configFile >> "cfgmagazines" 	>> _item >> "count");
															configFile >> "cfgmagazines" 	>> _item >> "mass"};
			case IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON;
			case IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON;
			case IDC_RSCDISPLAYARSENAL_TAB_HANDGUN:		{configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo" >> "mass"};
			default										{configFile >> "cfgweapons" 	>> _item >> "ItemInfo" >> "mass"};
		};

		_amount = ceil (_amount/_magCount);

		_mass = (getNumber _cfg) * _amount;
		_mass;//return
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "customGUI":{
		_params params ["_display"];

		//move CARGOMAGALL to left so we can use it there
		{
			_index = _x;
			_ctrlRight = _display displayCtrl (IDC_RSCDISPLAYARSENAL_TAB + _index);
			_ctrlRight ctrlEnable true;
			_ctrlRight ctrlSetFade 0;
			_ctrlRight ctrlCommit 0;//FADE_DELAY;
			_ctrlLeft = _display displayCtrl (IDC_RSCDISPLAYARSENAL_TAB + _forEachIndex);
			_height = ctrlPosition _ctrlLeft select 1;
			_pos = ctrlPosition _ctrlRight;
			_pos set [1, _height];
			_ctrlRight ctrlSetPosition _pos;
			_ctrlRight ctrlCommit 0;

		} forEach [IDCS_RIGHT];
		_ctrlLeft = _display displayCtrl (IDC_RSCDISPLAYARSENAL_LIST + IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON);
		_ctrlRight = _display displayCtrl (IDC_RSCDISPLAYARSENAL_LIST + IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL);
		_pos = ctrlPosition _ctrlLeft;
		_pos set [1, ctrlPosition _ctrlRight select 1];
		_ctrlRight ctrlSetPosition _pos;
		_ctrlRight ctrlCommit 0;

		//hide icons on player
		{
			_tab = _x;
			{
				_ctrl = _display displayCtrl (_tab + _x);
				_ctrl ctrlShow false;
				_ctrl ctrlEnable false;
				_ctrl ctrlRemoveAllEventHandlers "ButtonClick";
				_ctrl ctrlRemoveAllEventHandlers "MouseZChanged";
				_ctrl ctrlRemoveAllEventHandlers "LBSelChanged";
				_ctrl ctrlRemoveAllEventHandlers "LBDblClick";
				_ctrl ctrlSetPosition [0,0,0,0];
				_ctrl ctrlCommit 0;
			} forEach [IDC_RSCDISPLAYARSENAL_ICON,IDC_RSCDISPLAYARSENAL_ICONBACKGROUND];
		} forEach IDCS;

		//loadbar middle
		_ctrlLoadCargo = _display displayCtrl IDC_RSCDISPLAYARSENAL_LOADCARGO;

		//right background set
		_ctrlList = _display displayCtrl (IDC_RSCDISPLAYARSENAL_LIST + IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG);
		_ctrFrameRight = _display displayCtrl IDC_RSCDISPLAYARSENAL_FRAMERIGHT;
		_ctrBackgroundRight = _display displayCtrl IDC_RSCDISPLAYARSENAL_BACKGROUNDRIGHT;
		_ctrlListPos = ctrlPosition _ctrlList;
		_ctrlListPos set [3,(_ctrlListPos select 3)];
		{
			_x ctrlSetPosition _ctrlListPos;
			_x ctrlCommit 0;
		} forEach [_ctrFrameRight,_ctrBackgroundRight];
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "customEvents":{
		_params params ["_display"];



		//Keys
		_display displayRemoveAllEventHandlers "KeyDown";
		_display displayRemoveAllEventHandlers "KeyUp";
		_display displayAddEventHandler ["KeyDown",{['KeyDown',_this] call jn_fnc_arsenal;}];
		_display displayAddEventHandler ["KeyUp",{['KeyUp',_this] call jn_fnc_arsenal;}];

		//--- UI event handlers
		_ctrlButtonRandom = _display displayCtrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONRANDOM;
		_ctrlButtonRandom ctrlRemoveAllEventHandlers "ButtonClick";
		_ctrlButtonRandom ctrlAddEventHandler ["ButtonClick",{["Unload",[ctrlParent (_this select 0)]] call jn_fnc_vehicleArsenal;}];
		_ctrlButtonRandom ctrlSetText localize "STR_JNA_ACT_MOVE_FROM_VEHICLE_TO_ARSENAL_BUTTON";
		_ctrlButtonRandom ctrlSetTooltip localize "STR_JNA_ACT_MOVE_FROM_VEHICLE_TO_ARSENAL";

		_ctrlButtonExport = _display displayCtrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONEXPORT;
		_ctrlButtonExport ctrlRemoveAllEventHandlers "ButtonClick";
		_ctrlButtonExport ctrlSetText "";

		_ctrlButtonImport = _display displayCtrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONIMPORT;
		_ctrlButtonImport ctrlRemoveAllEventHandlers "ButtonClick";
		_ctrlButtonImport ctrlSetText "";

		_ctrlArrowLeft = _display displayCtrl IDC_RSCDISPLAYARSENAL_ARROWLEFT;
		_ctrlArrowLeft ctrlRemoveAllEventHandlers "ButtonClick";
		_ctrlArrowLeft ctrlAddEventHandler ["ButtonClick",{["buttonCargo",[ctrlParent (_this select 0),-1]] call jn_fnc_vehicleArsenal;}];

		_ctrlArrowRight = _display displayCtrl IDC_RSCDISPLAYARSENAL_ARROWRIGHT;
		_ctrlArrowRight ctrlRemoveAllEventHandlers "ButtonClick";
		_ctrlArrowRight ctrlAddEventHandler ["ButtonClick",{["buttonCargo",[ctrlParent (_this select 0),+1]] call jn_fnc_vehicleArsenal;}];

		_ctrlButtonLoad = _display displayCtrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONLOAD;
		_ctrlButtonLoad ctrlRemoveAllEventHandlers "ButtonClick";
		_ctrlButtonLoad ctrlSetTextColor [1,0,0,1];
		//_ctrlButtonLoad ctrladdeventhandler ["buttonclick",{["buttonLoad",[ctrlparent (_this select 0)]] call jn_fnc_vehicleArsenal;}];

		_ctrlButtonSave = _display displayCtrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONSAVE;
		_ctrlButtonSave ctrlRemoveAllEventHandlers "ButtonClick";
		_ctrlButtonSave ctrlSetTextColor [1,0,0,1];
		//_ctrlButtonSave ctrladdeventhandler ["buttonclick",{["buttonSave",[ctrlparent (_this select 0)]] call jn_fnc_vehicleArsenal;}];

		//disable annoying deselecting of tabs when you misclick
		_ctrlMouseArea = _display displayCtrl IDC_RSCDISPLAYARSENAL_MOUSEAREA;
		_ctrlMouseArea ctrlRemoveEventHandler ["MouseButtonClick",0];

		_ctrlButtonInterface = _display displayCtrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONINTERFACE;
		_ctrlButtonInterface ctrlRemoveAllEventHandlers "ButtonClick";

		{
			_idc = _x;

			_ctrlList = _display displayCtrl (IDC_RSCDISPLAYARSENAL_LIST + _idc);
			_ctrlList ctrlRemoveAllEventHandlers "LBSelChanged";
			_ctrlList ctrlAddEventHandler ["MouseButtonUp",	{uiNamespace setVariable ['jna_userInput',true];}];
			_ctrlList ctrlAddEventHandler ["LBSelChanged",	format ["
				if(uiNamespace getvariable ['jna_userInput',false])then{
					['SelectItem',[ctrlparent (_this select 0),(_this select 0),%1]] call jn_fnc_vehicleArsenal;
					uiNamespace setvariable ['jna_userInput',false];
				};
			",_idc]];


			_ctrlTab = _display displayCtrl (IDC_RSCDISPLAYARSENAL_TAB + _idc);
			_ctrlTab ctrlRemoveAllEventHandlers "ButtonClick";
			_ctrlTab ctrlAddEventHandler ["ButtonClick",format ["['TabSelect',[ctrlparent (_this select 0),%1],true] call jn_fnc_vehicleArsenal;",_idc]];


		} forEach IDCS;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "ColorTabs":{
		_params params ["_display"];
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "TabSelect": {
		_params params ["_display","_index"];
		_ctrlList = ctrlnull;
		jnca_tab_selected = _index;
		
		private _objectSelected = uiNamespace getVariable "jn_object_selected";

		_isSelectedLeft = _index in [IDCS_LEFT];
		_listSelected = [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG,IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL] select _isSelectedLeft;

		//add items to list that are in the vehicle
		_inventory = if(_index == IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG) then {

			// Find compatible magazines for all primary weapons in vehicle
			// Use toLower because modsets are bugged, eg. rhs_45Rnd_545x39_AK vs rhs_45Rnd_545X39_AK
			private _usableMagazines = [];
			{
				private _weapons = jnva_loadout select _x;
				{
					_usableMagazines append ((compatibleMagazines (_x select 0)) apply {toLower _x});
				} forEach _weapons;
			}forEach [
				IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON,
				IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON,
				IDC_RSCDISPLAYARSENAL_TAB_HANDGUN
			];
			_usableMagazines =_usableMagazines arrayIntersect _usableMagazines;

			// Add compatible vehicle magazines for 3CB-style ammunition systems
			private _cfgVehicle = configOf _objectSelected;
			private _vehMagTypes = _cfgVehicle call A3A_fnc_allMagazines;
			{ _usableMagazines pushBackUnique toLower _x } forEach _vehMagTypes;


			//loop all magazines and find usable
			//First, search mags in Arsenal
			_magazines = [];
			{
				_itemAvailable = _x select 0;
				_amountAvailable = _x select 1;

				if(_itemAvailable in _usableMagazines)then{
					_magazines pushBack [_itemAvailable, _amountAvailable];
				};
			} forEach (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL);
			
			//Then add mags in the car, but say we have none available - we'll add available number later
			{
				_itemAvailable = _x select 0;

				if(_itemAvailable in _usableMagazines)then{
					//Use addToArray to avoid duplicating the type if they're already in the arsenal
					_magazines = [_magazines, [_itemAvailable,0]] call jn_fnc_arsenal_addToArray
				};
			} forEach (jnva_loadout select IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL);
			//return
			_magazines;
		}else{
			(jna_dataList select _index);
		};

		//update list
		["CreateList",[_display,_index,_inventory,_listSelected]] call jn_fnc_vehicleArsenal;
		["updateItemInfo",[ _display,_ctrlList,_index]] call jn_fnc_arsenal;


		//add items to list that are in the vehicle
		if(_index == IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG)then{
			_items = jnva_loadout select IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL;

			_itemsUnique = [];
			{
				_itemsUnique pushBackUnique (_x select 0);
			}forEach _items;

			_itemsUnique2 = [];
			{
				_weapons = jnva_loadout select _x;
				{
					_weapon = _x select 0;
					{

						if(_x in _itemsUnique)then{
							_itemsUnique2 pushBackUnique _x;
							["UpdateItemAdd",[_index,_x,0]] call jn_fnc_arsenal;
						}
					} forEach (getArray (configFile >> "cfgweapons" >> _weapon >> "magazines"));
				} forEach _weapons;
			}forEach [
				IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON,
				IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON,
				IDC_RSCDISPLAYARSENAL_TAB_HANDGUN
			];
			
			private _magazineItemsInTab = [];
			{
				_item = _x;
				_amount = [_items, _item] call jn_fnc_arsenal_itemCount;
				_magazineItemsInTab	= [_magazineItemsInTab, [_item,_amount]] call jn_fnc_arsenal_addToArray;
			} forEach _itemsUnique2;
			jnva_loadout set [_index,_magazineItemsInTab];

		}else{
			{
				_item = _x select 0;
				["UpdateItemAdd",[_index,_item,0]] call jn_fnc_arsenal;
			} forEach (jnva_loadout select _index);
		};

		{
			_idc = _x;
			_active = _idc == _listSelected;
			{
				_ctrl = _display displayCtrl (_x + _idc);
				_ctrl ctrlEnable _active;
				_ctrl ctrlSetFade ([1,0] select _active);
				_ctrl ctrlCommit FADE_DELAY;
			} forEach [IDC_RSCDISPLAYARSENAL_LIST,IDC_RSCDISPLAYARSENAL_LISTDISABLED,IDC_RSCDISPLAYARSENAL_SORT];
		}forEach [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG,IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL];

		//show correct list
		{
			_idc = _x;
			_active = _idc == _index;
			_isLeft = _idc in [IDCS_LEFT];
			_list = [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG,IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL] select _isLeft;

			_ctrlTab = _display displayCtrl (IDC_RSCDISPLAYARSENAL_TAB + _idc);
			_ctrlTab ctrlEnable !_active;

			_ctrlList = _display displayCtrl (IDC_RSCDISPLAYARSENAL_LIST + _list);

			if (_active) then {
				_ctrlLineTab = _display displayCtrl ([IDC_RSCDISPLAYARSENAL_LINETABRIGHT,IDC_RSCDISPLAYARSENAL_LINETABLEFT] select _isLeft);

				_ctrlLineTab ctrlSetFade 0;
				_ctrlTabPos = ctrlPosition _ctrlTab;

				if(_isLeft)then{
					_ctrlLineTabPosX = (_ctrlTabPos select 0) + (_ctrlTabPos select 2) - 0.01;
					_ctrlLineTabPosY = (_ctrlTabPos select 1);
					_ctrlLineTab ctrlSetPosition [
						safeZoneX,//_ctrlLineTabPosX,
						_ctrlLineTabPosY,
						(ctrlPosition _ctrlList select 0) - safeZoneX,//_ctrlLineTabPosX,
						ctrlPosition _ctrlTab select 3
					];
				}else{
					_ctrlLineTabPosX = (ctrlPosition _ctrlList select 0) + (ctrlPosition _ctrlList select 2);
					_ctrlLineTabPosY = (_ctrlTabPos select 1);
					_ctrlLineTab ctrlSetPosition [
						_ctrlLineTabPosX,
						_ctrlLineTabPosY,
						safeZoneX + safeZoneW - _ctrlLineTabPosX,//(_ctrlTabPos select 0) - _ctrlLineTabPosX + 0.01,
						ctrlPosition _ctrlTab select 3
					];
				};
				_ctrlLineTab ctrlCommit 0;
				ctrlSetFocus _ctrlList;

				//set right item counters
				_items = jnva_loadout select _idc;
				for "_l" from 0 to ((lnbSize _ctrlList select 0) - 1) do {
					_dataStr = _ctrlList lnbData [_l,0];
					_data = call compile _dataStr;
					_item = _data select 0;
					_amount = 0;
					{
						_itemX = _x select 0;
						_amountX = _x select 1;
						if(_itemX == _item)then{
							_amount = _amount + _amountX;
						}
					} forEach _items;

					_ctrlList lnbSetText [[_l,2],str (_amount)];
				};

				//["SelectItemRight",[_display,_ctrlList,_idc]] call jn_fnc_vehicleArsenal;



			};
		}forEach IDCS;



		//Show or hide background
		{
			_ctrl = _display displayCtrl _x;
			_ctrl ctrlSetFade (parseNumber !(_index in [IDCS_LEFT]));
			_ctrl ctrlCommit FADE_DELAY;
		} forEach [
			IDC_RSCDISPLAYARSENAL_LINETABLEFT,
			IDC_RSCDISPLAYARSENAL_FRAMELEFT,
			IDC_RSCDISPLAYARSENAL_BACKGROUNDLEFT
		];

		{
			_ctrl = _display displayCtrl _x;
			_ctrl ctrlSetFade (parseNumber !(_index in [IDCS_RIGHT]));
			_ctrl ctrlCommit FADE_DELAY;
		} forEach [
			IDC_RSCDISPLAYARSENAL_LINETABRIGHT,
			IDC_RSCDISPLAYARSENAL_FRAMERIGHT,
			IDC_RSCDISPLAYARSENAL_BACKGROUNDRIGHT
		];
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	// This function isn't used here. Colouring is done by updateItemGui in fn_arsenal
	case "SelectItemRight": {
		_params params ["_display","_ctrlList","_index"];
		_center = (missionNamespace getVariable ["BIS_fnc_arsenal_center",player]);
		_type = (ctrlType _ctrlList == 102);

		private _objectSelected = uiNamespace getVariable "jn_object_selected";

		_maximumLoad = maxLoad _objectSelected;

		_ctrlLoadCargo = _display displayCtrl IDC_RSCDISPLAYARSENAL_LOADCARGO;
		_load = _maximumLoad * (1 - progressPosition _ctrlLoadCargo);


		//-- Disable too heavy items
		_rows = lnbSize _ctrlList select 0;
		_columns = lnbSize _ctrlList select 1;
		_colorWarning = ["IGUI","WARNING_RGB"] call bis_fnc_displayColorGet;
		_columns = count lnbGetColumnsPosition _ctrlList;

		for "_r" from 0 to (_rows - 1) do {
			_dataStr = _ctrlList lnbData [_r,0];
			_data = call compile _dataStr;
			_item = _data select 0;
			_amount = _data select 1;
			_grayout = false;

			_min = [_index, _item] call _minItemsMember;
			if ((_amount <= _min) AND (_amount != -1) AND (_amount !=0) AND !(player call A3A_fnc_isMember)) then{_grayout = true};

			_isIncompatible = _ctrlList lnbValue [_r,1];
			_mass = _ctrlList lbValue (_r * _columns);
			_alpha = [1.0,0.25] select (_mass > parseNumber (str _load));
			_color = [[1,1,1,_alpha],[1,0.5,0,_alpha]] select _isIncompatible;
			if(_grayout)then{_color = [1,1,0,0.60];};
			_ctrlList lnbSetColor [[_r,1],_color];
			_ctrlList lnbSetColor [[_r,2],_color];
			_text = _ctrlList lnbText [_r,1];
			_ctrlList lbSetTooltip [_r * _columns,[_text,_text + "\n(Not compatible with currently equipped weapons)"] select _isIncompatible];
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "CreateList":{
		_params params ["_display","_index","_inventory","_indexList"];		
		_ctrlList = _display displayCtrl (IDC_RSCDISPLAYARSENAL_LIST + _indexList);

		lnbClear _ctrlList;

		{
			_item = _x select 0;
			_amount = _x select 1;
			["CreateItem",[_display,_ctrlList,_index,_item,_amount]] call jn_fnc_arsenal;
		} forEach _inventory;

		["UpdateListGui",[ _display,_ctrlList, _index]] call jn_fnc_arsenal;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "SelectItem":{
		_params params ["_display","_ctrlList"];
		_index = jnca_tab_selected;

		["updateItemInfo",[ _display,_ctrlList,_index]] call jn_fnc_arsenal;
	};

	/////////////////////////////////////////////////////////////////////////////////////////// event
	case "buttonCargo": {
		_params params ["_display","_add"];

		private _objectSelected = uiNamespace getVariable "jn_object_selected";

		_index = jnca_tab_selected;

		if(_index == IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG)then{_index = IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL};

		_indexList = [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG,IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL] select (_index in [IDCS_LEFT]);
		_ctrlList = _display displayCtrl (IDC_RSCDISPLAYARSENAL_LIST + _indexList);
		_lbcursel = lbCurSel _ctrlList;


		_dataStr = _ctrlList lnbData [_lbcursel,0];
		_data = call compile _dataStr;
		_item = _data select 0;
		_amount = _data select 1;

		_load = 0;
		_items = [];

		_ctrlLoadCargo = _display displayCtrl IDC_RSCDISPLAYARSENAL_LOADCARGO;
		//save old weight
		_max = maxLoad _objectSelected;

		_amountOld = parseNumber (_ctrlList lnbText [_lbcursel,2]);
		//remove or add
		_count = 1;

		private _shift = uiNamespace getVariable ["arsenalShift", false];
		private _ctrl = uiNamespace getVariable ["arsenalCtrl", false];

		if(_shift && !_ctrl) then {
			_count = _count * 5;
		};
		if(!_shift && _ctrl) then {
			_count = _count * 10;
		};
		if(_shift && _ctrl) then {
			_count = _count * 25;
		};

		if (_add > 0 && {_count > _amount && {_amount != -1}}) then {
			_count = _amount;
		};

		if(((_amount > 0 || _amount == -1) || _add < 0) && (_add != 0))then{

			if (_add > 0) then {//add

				//non-member limits
				_min = [_index, _item] call _minItemsMember;
				if((_amount <= _min) AND (_amount != -1) AND !(player call A3A_fnc_isMember)) exitWith{
					['showMessage',[_display,(localize "STR_JNA_ACT_ONLY_MEMBERS")]] call jn_fnc_arsenal;
				};

				//magazines are handeld by bullet count
				if(_index in [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG,IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL])then{
					//check if full mag can be optaind
					_count = getNumber (configFile >> "CfgMagazines" >> _item >> "count");
					if(_amount != -1)then{
						if(_amount<_count)then{_count = _amount};
					};
				};

				if(_count > 0)then{
					_mass = jnva_loadout_mass + (["getMassItem",[_item,_count,_index]] call jn_fnc_vehicleArsenal);
					if(_mass <= _max)then{
						_ctrlList lnbSetText [[_lbcursel,2],str (_amountOld + _count)];

						jnva_loadout set [_index,[jnva_loadout select _index,[_item,_count]] call jn_fnc_arsenal_addToArray];
						jnva_loadout_mass = _mass;
						//[_index, _item, _count] remoteExecCall ["jn_fnc_arsenal_removeItem"];
						[_index, _item, _count] call jn_fnc_arsenal_removeItem; //Sparker: why execute it on all clients?
					};
				};

			}else{
				if(_index in [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG,IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL])then{
					_count = getNumber (configFile >> "CfgMagazines" >> _item >> "count");
				};

				if(_count>_amountOld)then{
					_count = _amountOld;
				};

				if(_count > 0)then{
					_ctrlList lnbSetText [[_lbcursel,2],str (_amountOld - _count)];

					jnva_loadout set [_index,[jnva_loadout select _index,[_item,_count]] call jn_fnc_arsenal_removeFromArray];
					_mass = ["getMassItem",[_item,_count,_index]] call jn_fnc_vehicleArsenal;
					jnva_loadout_mass = jnva_loadout_mass - _mass;
					//[_index, _item, _count] remoteExecCall ["jn_fnc_arsenal_addItem"];
					[_index, _item, _count] call jn_fnc_arsenal_addItem; //Sparker: why execute it on all clients?
				};
			};
		};

		["ColorTabs",[_display]] call jn_fnc_vehicleArsenal;
		['showMessage',[_display,("Load"+str round (jnva_loadout_mass/_max *100)+"%")]] call jn_fnc_arsenal;
	};

	/////////////////////////////////////////////////////////////////////////////////////////// event
	case "KeyDown": {
		_params params ["_display","_key","_shift","_ctrl","_alt"];		
		_center = (missionNamespace getVariable ["BIS_fnc_arsenal_center",player]);
		_return = false;
		_ctrlTemplate = _display displayCtrl IDC_RSCDISPLAYARSENAL_TEMPLATE_TEMPLATE;
		_inTemplate = ctrlFade _ctrlTemplate == 0;

		switch true do {
			case (_key == DIK_ESCAPE): {
				if (_inTemplate) then {
					_ctrlTemplate ctrlSetFade 1;
					_ctrlTemplate ctrlCommit 0;
					_ctrlTemplate ctrlEnable false;

					_ctrlMouseBlock = _display displayCtrl IDC_RSCDISPLAYARSENAL_MOUSEBLOCK;
					_ctrlMouseBlock ctrlEnable false;
				} else {
					if (true) then {["buttonClose",[_display]] spawn jn_fnc_arsenal;} else {_display closeDisplay 2;};
				};
				_return = true;
			};

			//--- Enter
			case (_key in [DIK_RETURN,DIK_NUMPADENTER]): {
				_ctrlTemplate = _display displayCtrl IDC_RSCDISPLAYARSENAL_TEMPLATE_TEMPLATE;
				if (ctrlFade _ctrlTemplate == 0) then {
					if (BIS_fnc_arsenal_type == 0) then {
						//["buttonTemplateOK",[_display]] spawn jn_fnc_arsenal;
					} else {
						//["buttonTemplateOK",[_display]] spawn jn_fnc_arsenal;
					};
					_return = true;
				};
			};

			//--- Prevent opening the commanding menu
			case (_key == DIK_1);
			case (_key == DIK_2);
			case (_key == DIK_3);
			case (_key == DIK_4);
			case (_key == DIK_5);
			case (_key == DIK_6);
			case (_key == DIK_7);
			case (_key == DIK_8);
			case (_key == DIK_9);
			case (_key == DIK_0);

			//--- Tab to browse tabs
			case (_key == DIK_TAB): {
			};

			case (_key == DIK_LSHIFT): {
				uiNamespace setVariable ["arsenalShift", true];
				_return = true;
			};
			case (_key == DIK_LCONTROL): {
				uiNamespace setVariable ["arsenalCtrl", true];
				_return = true;
			};
			case (_key == DIK_LALT): {
				uiNamespace setVariable ["arsenalAlt", true];
				_return = true;
			};

			//--- Save
			case (_key == DIK_S): {
				//if (_ctrl) then {['buttonSave',[_display]] call jn_fnc_arsenal;};
			};
			//--- Open
			case (_key == DIK_O): {
				//if (_ctrl) then {['buttonLoad',[_display]] call jn_fnc_arsenal;};
			};

			//--- Vision mode
			case (_key in (actionKeys "nightvision") && !_inTemplate): {
				_mode = missionNamespace getVariable ["BIS_fnc_arsenal_visionMode",-1];
				_mode = (_mode + 1) % 3;
				missionNamespace setVariable ["BIS_fnc_arsenal_visionMode",_mode];
				switch _mode do {
					//--- Normal
					case 0: {
						camUseNVG false;
						false setCamUseTI 0;
					};
					//--- NVG
					case 1: {
						camUseNVG true;
						false setCamUseTI 0;
					};
					//--- TI
					default {
						camUseNVG false;
						true setCamUseTI 0;
					};
				};
				playSound ["RscDisplayCurator_visionMode",true];
				_return = true;

			};
		};
		_return
	};

    /////////////////////////////////////////////////////////////////////////////////////////// event
 	case "KeyUp": {
		_params params ["_display","_key","_shift","_ctrl","_alt"];
		private _return = false;
		switch true do {
			case (_key == DIK_LSHIFT): {
				uiNamespace setVariable ["arsenalShift", false];
				_return = true;
			};
			case (_key == DIK_LCONTROL): {
				uiNamespace setVariable ["arsenalCtrl", false];
				_return = true;
			};
			case (_key == DIK_LALT): {
				uiNamespace setVariable ["arsenalAlt", false];
				_return = true;
			};
		};
		_return
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Unload":{
		_params params ["_display"];

		private _objectSelected = uiNamespace getVariable "jn_object_selected";

		jnva_loadout_mass = 0;
        jnva_loadout remoteExecCall ["jn_fnc_arsenal_addItem",2];

       	jnva_loadout = (_objectSelected call jn_fnc_arsenal_cargoToArray);

       	_list = missionNamespace getVariable ["jnca_tab_selected",-1];
       	if(_list != -1)then{
       		["TabSelect",[_display, _list]] call jn_fnc_vehicleArsenal;
       	};
       	["ColorTabs",[_display]] call jn_fnc_vehicleArsenal;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Close": {
		jnva_loadout_mass = nil;
		private _objectSelected = uiNamespace getVariable "jn_object_selected";
		jnca_tab_selected = nil;
		//weapons
		{
			_list = jnva_loadout select _x;
			{
				_item = _x select 0;
				_amount = _x select 1;
				_objectSelected addWeaponCargoGlobal [_item,_amount];
			} forEach _list;
		} forEach [
			IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON,
			IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON,
			IDC_RSCDISPLAYARSENAL_TAB_HANDGUN
		];

		//items
		{
			_list = jnva_loadout select _x;
			{
				_item = _x select 0;
				_amount = _x select 1;
				_objectSelected addItemCargoGlobal [_item,_amount];
			} forEach _list;
		} forEach [
			IDC_RSCDISPLAYARSENAL_TAB_UNIFORM,
			IDC_RSCDISPLAYARSENAL_TAB_VEST,
			IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR,
			IDC_RSCDISPLAYARSENAL_TAB_GOGGLES,
			IDC_RSCDISPLAYARSENAL_TAB_NVGS,
			IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS,
			IDC_RSCDISPLAYARSENAL_TAB_MAP,
			IDC_RSCDISPLAYARSENAL_TAB_GPS,
			IDC_RSCDISPLAYARSENAL_TAB_RADIO,
			IDC_RSCDISPLAYARSENAL_TAB_COMPASS,
			IDC_RSCDISPLAYARSENAL_TAB_WATCH,
			IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC,
			IDC_RSCDISPLAYARSENAL_TAB_ITEMACC,
			IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE,
			IDC_RSCDISPLAYARSENAL_TAB_ITEMBIPOD,
			IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC
		];

		//magazines
		{
			_list = jnva_loadout select _x;
			{
				_item = _x select 0;
				_amount = _x select 1;
				_count = getNumber (configFile >> "CfgMagazines" >> _item >> "count");

				while{_amount>0}do{
					_objectSelected addMagazineAmmoCargo [_item,1,_amount];
					_amount = _amount - _count;
				};
			} forEach _list;
		} forEach [
			IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL,
			IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW,
			IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT
		];

		//backpack
		{
			_list = jnva_loadout select _x;
			{
				_item = _x select 0;
				_amount = _x select 1;
				_objectSelected addBackpackCargoGlobal [_item,_amount];
			} forEach _list;
		} forEach [
			IDC_RSCDISPLAYARSENAL_TAB_BACKPACK
		];


		jnva_loadout = nil;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	default {
		["Error: wrong input given '%1' for mode '%2'",_params,_mode] call BIS_fnc_error;
	};
};


#include "..\..\..\script_component.hpp"

outlw_MR_createDialog =
{
	private ["_stance", "_raised", "_weapon"];

	outlw_MR_sourceType = "";
	outlw_MR_sourceCount = 0;
	outlw_MR_sourceCap = 0;

	outlw_MR_targetType = "";
	outlw_MR_targetCount = 0;
	outlw_MR_targetCap = 0;

	outlw_MR_listDragging = false;
	outlw_MR_sourceDragging = false;
	outlw_MR_targetDragging = false;

	outlw_MR_doAddToMagazines = true;
	outlw_MR_canCreateDialog = false;

	outlw_MR_dragType = "";
	outlw_MR_dragCount = 0;
	outlw_MR_dragCap = 0;

	outlw_MR_currentFilter = "";
	outlw_MR_isRepacking = false;
	outlw_MR_optionsOpen = false;

	createDialog "MagRepack_Dialog_Main";

	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1001) ctrlSetText ("Mag Repack [" + outlw_MR_version + "]");

	outlw_MR_blur = ppEffectCreate ["DynamicBlur", 401];
	outlw_MR_blur ppEffectEnable true;
	outlw_MR_blur ppEffectAdjust [1.5];
	outlw_MR_blur ppEffectCommit 0;

	if (isNull objectParent player) then
	{
		_stance = "Pknl";
		_raised = "Sras";
		_weapon = "Wpst";

		if (stance player == "PRONE") then
		{
			_stance = "Ppne";
		};

		switch (currentWeapon player) do
		{
			case (""): {_raised = "Snon"; _weapon = "Wnon";};
			case (primaryWeapon player): {_weapon = "Wrfl";};
			case (secondaryWeapon player): {_weapon = "Wlnr";};
		};

		player playMove ("Ainv" + _stance + "Mstp" + _raised + _weapon + "Dnon");
	};

	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 22170) lbAdd (localize "STR_magRepack_all_ammo");
	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 22170) lbSetData [0, ""];
	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 22170) lbSetCurSel 0;

	call outlw_MR_populateMagListBox;
	call outlw_MR_populateMagComboBox;

	[true] call outlw_MR_sourceEnabled;
	[true] call outlw_MR_targetEnabled;

	if (outlw_MR_debugMode) then
	{
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 9002) ctrlSetStructuredText parseText ([localize "STR_magRepack_debug", ": ", format ["<t align='right'>%1</t>", localize "STR_info_bar_on2"]] joinString "");
	}
	else
	{
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 9002) ctrlSetStructuredText parseText ([localize "STR_magRepack_debug", ": ", format ["<t align='right'>%1</t>", localize "STR_info_bar_off"]] joinString "");
	};

	if (outlw_MR_doHideFull) then
	{
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 9004) ctrlSetStructuredText parseText ([localize "STR_magRepack_full", " ", format ["<t align='right'>%1</t>", localize "STR_info_bar_off"]] joinString "");
	}
	else
	{
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 9004) ctrlSetStructuredText parseText ([localize "STR_magRepack_full", " ", format ["<t align='right'>%1</t>", localize "STR_info_bar_on2"]] joinString "");
	};

	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 9003) ctrlSetStructuredText parseText (localize "STR_magRepack_keybindings");
	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 9005) ctrlSetStructuredText parseText (localize "STR_magRepack_about_header");

	outlw_MR_startingInfo = call outlw_MR_debugInfo;

	[] spawn
	{
		private ["_a", "_b"];

		_a = magazinesAmmo player;

		while {!(isNull (uiNamespace getVariable "outlw_MR_Dialog_Main"))} do
		{
			uiSleep 0.05;

			_b = magazinesAmmo player;

			if (_a isNotEqualTo _b) then
			{
				call outlw_MR_populateMagListBox;
				_a =+ _b;
			};

			if !(alive player) then
			{
				closeDialog 0;
			};
		};
	};
};

outlw_MR_populateMagComboBox =
{
	private ["_this", "_magTypes", "_ammoTypes", "_n", "_a"];

	_magTypes = (call outlw_MR_magInfo) select 0;
	_ammoTypes = [];
	_a = 0;

	for "_n" from 0 to ((count _magTypes) - 1) do
	{
		if !((getText(configFile >> "cfgMagazines" >> (_magTypes select _n) >> "ammo")) in _ammoTypes) then
		{
			((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 22170) lbAdd ([([(getText(configFile >> "cfgMagazines" >> (_magTypes select _n) >> "ammo"))] call outlw_MR_ammoDisplayName), 25] call outlw_MR_shortString);
			((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 22170) lbSetData [_a, (getText(configFile >> "cfgMagazines" >> (_magTypes select _n) >> "ammo"))];
			_ammoTypes pushBack getText(configFile >> "cfgMagazines" >> (_magTypes select _n) >> "ammo");

			_a = _a + 1;
		};
	};
};

outlw_MR_populateMagListBox =
{
	private ["_this", "_args", "_magListTitle", "_magTypes", "_magAmmoCounts", "_magAmmoCaps", "_magCounts", "_bgrndPos", "_n", "_a"];

	_args = call outlw_MR_magInfo;
	_magListTitle = localize "STR_magRepack_all_mags";

	if (outlw_MR_sourceType != "" || {outlw_MR_targetType != ""} || {outlw_MR_currentFilter != ""}) then
	{
		_args = (_args) call outlw_MR_filter;
		_magListTitle = localize "STR_magRepack_compatible_mags";
	};

	lnbClear ((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1500);

	_args = (_args) call outlw_MR_uniqueMags;

	if (outlw_MR_doHideFull) then
	{
		_args = (_args) call outlw_MR_hideFull;
		_magListTitle = localize "STR_magRepack_nonfull_mags";

		if (outlw_MR_sourceType != "" || {outlw_MR_targetType != ""} || {outlw_MR_currentFilter != ""}) then
		{
			_magListTitle = localize "STR_magRepack_nonfullcompat_mags";
		};
	};

	_magTypes = _args select 0;
	_magAmmoCounts = _args select 1;
	_magAmmoCaps = _args select 2;
	_magCounts = _args select 3;

	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1000) ctrlSetStructuredText parseText _magListTitle;

	_bgrndPos = ctrlPosition ((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1500);

	if (count _magTypes > 9) then
	{
		["outlw_MR_Dialog_Main", 1500, [(_bgrndPos select 0), (_bgrndPos select 1), 0.3375, (_bgrndPos select 3)], 0] call outlw_MR_ctrlSetPos;
		["outlw_MR_Dialog_Main", 2217, [(_bgrndPos select 0), (_bgrndPos select 1), 0.321, (_bgrndPos select 3) + 0.003], 0] call outlw_MR_ctrlSetPos;

		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1500) lnbDeleteColumn 3;
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1500) lnbAddColumn 0.83;
	}
	else
	{
		["outlw_MR_Dialog_Main", 1500, [(_bgrndPos select 0), (_bgrndPos select 1), 0.325, (_bgrndPos select 3)], 0] call outlw_MR_ctrlSetPos;
		["outlw_MR_Dialog_Main", 2217, [(_bgrndPos select 0), (_bgrndPos select 1), 0.325, (_bgrndPos select 3) + 0.003], 0] call outlw_MR_ctrlSetPos;

		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1500) lnbDeleteColumn 3;
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1500) lnbAddColumn 0.89;

	};

	_a = 0;

	for "_n" from 0 to ((count _magTypes) - 1) do
	{
		_magCountStr = str(_magCounts select _n);

		if (_magCounts select _n < 10) then
		{
			_magCountStr = " " + _magCountStr;
		};
		
		//Added: ListBox version for 1.48 - GiPPO
		private ["_magname","_text"];
		_magName = ([(getText(configFile >> "cfgMagazines" >> _magTypes select _n >> "DisplayName")), 25] call outlw_MR_shortString);
		_text = (format ["%1x  %2",_magCountStr,_magname]);


		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1500) lbAdd _text;
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1500) lbSetPicture [_n, format [QPATHTOFOLDER(Scripts\MagRepack\Images\bulletCount\%1.paa), round((_magAmmoCounts select _n)/(_magAmmoCaps select _n)*30)]];
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1500)	lbSetPictureColor [_n,[1,1,1,1]];
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1500)	lbSetPictureColorSelected [_n,[1,1,1,1]];

		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1500) lbSetValue [_n, _magAmmoCounts select _n];
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1500) lbSetData [_n, _magTypes select _n];
	};
};

outlw_MR_filter =
{
	// Added additional tracer check to avoid repacks between some tracer and non-tracer variants - GiPPO
	
	private ["_this", "_magTypes", "_magAmmoCounts", "_magAmmoCaps", "_ammoType", "_returnTypes", "_returnCounts", "_returnCaps", "_ammoTracer","_userFilter"];

	_magTypes = _this select 0;
	_magAmmoCounts = _this select 1;
	_magAmmoCaps = _this select 2;

	_ammoType = (getText(configFile >> "cfgMagazines" >> outlw_MR_sourceType >> "ammo"));
	_ammoTracer = 0;
	_ammoTracer = (getNumber(configFile >> "cfgMagazines" >> outlw_MR_sourceType >> "tracersEvery"));
	_userfilter = false;
	
	if (_ammoType == "") then
	{
		_ammoType = (getText(configFile >> "cfgMagazines" >> outlw_MR_targetType >> "ammo"));
		_ammoTracer = (getNumber(configFile >> "cfgMagazines" >> outlw_MR_targetType >> "tracersEvery"));
	};

	if (_ammoType == "") then
	{
		_ammoType = outlw_MR_currentFilter;
		_userFilter = true;
	};

	_returnTypes = [];
	_returnCounts = [];
	_returnCaps = [];

	for "_n" from 0 to ((count _magTypes) - 1) do
	{
		if (((getText (configFile >> "cfgMagazines" >> _magTypes select _n >> "ammo")) == _ammoType) && (((getNumber (configFile >> "cfgMagazines" >> _magTypes select _n >> "tracersEvery")) == _ammoTracer) || {_userFilter}  )) then
		{
			_returnTypes pushBack (_magTypes select _n);
			_returnCounts pushBack (_magAmmoCounts select _n);
			_returnCaps pushBack (_magAmmoCaps select _n);
		};
	};

	[_returnTypes, _returnCounts, _returnCaps];
};

outlw_MR_hideFull =
{
	private ["_this", "_magTypes", "_magAmmoCounts", "_magAmmoCaps", "_magCounts", "_returnMagTypes", "_returnAmmoCaps", "_returnAmmoCaps", "_returnMagCounts", "_n", "_a"];

	_magTypes = _this select 0;
	_magAmmoCounts = _this select 1;
	_magAmmoCaps = _this select 2;
	_magCounts = _this select 3;

	_returnMagTypes = [];
	_returnMagAmmoCounts = [];
	_returnMagAmmoCaps = [];
	_returnMagCounts = [];

	_a = 0;

	for "_n" from 0 to ((count _magTypes) - 1) do
	{
		if ((_magAmmoCounts select _n) != (_magAmmoCaps select _n)) then
		{
			_returnMagTypes set [_a, _magTypes select _n];
			_returnMagAmmoCounts set [_a, _magAmmoCounts select _n];
			_returnMagAmmoCaps set [_a, _magAmmoCaps select _n];
			_returnMagCounts set [_a, _magCounts select _n];

			_a = _a + 1;
		};
	};

	[_returnMagTypes, _returnMagAmmoCounts, _returnMagAmmoCaps, _returnMagCounts];
};

outlw_MR_repack =
{
	private ["_sourceCap", "_targetCap", "_refreshRate", "_refreshCount", "_magCode", "_keepRepacking", "_sleepTime", "_n"];

	outlw_MR_isRepacking = true;

	_refreshRate = outlw_MR_bulletTime;
	_refreshCount = 1;

	_magCode =
	{
		outlw_MR_sourceCount = outlw_MR_sourceCount - 1;
		outlw_MR_targetCount = outlw_MR_targetCount + 1;
	};

	if ([outlw_MR_sourceType] call outlw_MR_isBeltMagazine && {[outlw_MR_targetType] call outlw_MR_isBeltMagazine}) then
	{
		_refreshRate = outlw_MR_beltTime;
		_magCode =
		{
			outlw_MR_sourceCount = outlw_MR_sourceCount - (outlw_MR_targetCap - outlw_MR_targetCount);
			outlw_MR_targetCount = outlw_MR_targetCount + (outlw_MR_targetCap - outlw_MR_targetCount) + outlw_MR_sourceCount;
			if (outlw_MR_targetCount > outlw_MR_targetCap) then {outlw_MR_targetCount = outlw_MR_targetCap};
			if (outlw_MR_sourceCount < 0) then {outlw_MR_sourceCount = 0};
		};
	}
	else
	{
		if (outlw_MR_sourceCount >= (outlw_MR_targetCap - outlw_MR_targetCount)) then
		{
			_refreshCount = (outlw_MR_targetCap - outlw_MR_targetCount);
		}
		else
		{
			_refreshCount = outlw_MR_sourceCount;
		};
	};

	[] spawn outlw_MR_repackingText;

	["outlw_MR_Dialog_Main", 10002, [0,0], (_refreshCount * _refreshRate)] call outlw_MR_ctrlSetPos;

	_keepRepacking = {outlw_MR_sourceType != "" && outlw_MR_targetType != "" && outlw_MR_sourceCount > 0 && outlw_MR_targetCount < outlw_MR_targetCap};
	_sleepTime = (time + (_refreshRate));

	while {time < _sleepTime && call _keepRepacking} do
	{
		uiSleep 0.05;
	};

	while _keepRepacking do
	{
		call _magCode;

		["outlw_MR_Dialog_Main", 22180, [0,((0.12/outlw_MR_sourceCap) * (outlw_MR_sourceCap - outlw_MR_sourceCount))], 0] call outlw_MR_ctrlSetPos;
		["outlw_MR_Dialog_Main", 22190, [0,((0.12/outlw_MR_targetCap) * (outlw_MR_targetCap - outlw_MR_targetCount))], 0] call outlw_MR_ctrlSetPos;

		_sleepTime = (time + (_refreshRate));

		while {time < _sleepTime && call _keepRepacking} do
		{
			uiSleep 0.05;
		};
	};

	if (outlw_MR_sourceCount <= 0) then
	{
		call outlw_MR_clearSource;
	};

	if (outlw_MR_targetCount == outlw_MR_targetCap) then
	{
		call outlw_MR_clearTarget;
	};

	outlw_MR_isRepacking = false;
	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1008) ctrlSetText "";

	["outlw_MR_Dialog_Main", 10002, [-0.325,0], 0] call outlw_MR_ctrlSetPos;
};

outlw_MR_repackingText =
{
	private ["_repacking"];

	_repacking = localize "STR_magRepack_repacking";

	while {outlw_MR_isRepacking} do
	{
		_repacking = _repacking + ".";

		if (_repacking == localize "STR_magRepack_repacking") then
		{
			_repacking = localize "STR_magRepack_repacking2";
		};

		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1008) ctrlSetText _repacking;

		uiSleep 1;
	};

	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1008) ctrlSetText "";
};

outlw_MR_debugInfo =
{
	private ["_magsAmmo", "_totalMagCount", "_totalAmmo", "_typeCountAmmo", "_magType", "_magAmmo", "_index", "_inArray", "_n", "_a"];

	_magsAmmo = magazinesAmmo player;
	_totalMagCount = 0;
	_totalAmmo = 0;
	_typeCountAmmo = [];

	for "_n" from 0 to ((count _magsAmmo) - 1) do
	{
		_magType = ((_magsAmmo select _n) select 0);
		_magAmmo = ((_magsAmmo select _n) select 1);

		if (getNumber(configFile >> "CfgMagazines" >> _magType >> "count") > 1 || {[_magType] call outlw_MR_isConvertable}) then
		{
			_index = 0;
			_inArray = false;

			for [{_a = 0}, {_a < count _typeCountAmmo && !_inArray}, {_a = _a + 1}] do
			{
				if (_magType == ((_typeCountAmmo select _a) select 0)) then
				{
					_inArray = true;
					_index = _a;
				};
			};

			if (_inArray) then
			{
				(_typeCountAmmo select _index) set [1, ((_typeCountAmmo select _index) select 1) + 1];
				(_typeCountAmmo select _index) set [2, ((_typeCountAmmo select _index) select 2) + _magAmmo];
			}
			else
			{
				_typeCountAmmo pushBack [_magType, 1, _magAmmo];
			};

			_totalMagCount = _totalMagCount + 1;
			_totalAmmo = _totalAmmo + _magAmmo;
		};
	};

	[[_totalMagCount, _totalAmmo], _typeCountAmmo];
};

outlw_MR_block =
{
	private ["_doBlockSource", "_doBlockTarget"];

	_doBlockSource = true;
	_doBlockTarget = true;

	switch (true) do
	{
		case (outlw_MR_sourceType != ""): {((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2215) ctrlSetTooltip (localize "STR_magRepack_source_defined");};
		case (outlw_MR_dragCount == 0): {((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2215) ctrlSetTooltip (localize "STR_magRepack_source_notempty");};
		case (outlw_MR_dragCap < 100 && (outlw_MR_targetType != "" && outlw_MR_targetCap >= 100)):
		{
			((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2215) ctrlSetTooltip (localize "STR_magRepack_target_belt");
		};
		default {_doBlockSource = false;};
	};

	if (_doBlockSource) then
	{
		if (outlw_MR_sourceDragging) then
		{
			((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2215) ctrlSetBackgroundColor [1,1,1,0.3];
			((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2215) ctrlSetTooltip "";
		}
		else
		{
			((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2215) ctrlSetBackgroundColor [1,0,0,0.3];
		};

		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2215) ctrlEnable false;
	}
	else
	{
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2215) ctrlSetBackgroundColor [1,1,1,0.3];
	};

	switch (true) do
	{
		case (outlw_MR_targetType != ""): {((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2216) ctrlSetTooltip (localize "STR_magRepack_target_defined");};
		case (outlw_MR_dragCount == outlw_MR_dragCap && outlw_MR_dragCap != 1): {((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2216) ctrlSetTooltip (localize "STR_magRepack_target_notfull");};
		case (outlw_MR_dragCap >= 100 && (outlw_MR_sourceType != "" && outlw_MR_sourceCap < 100)):
		{
			((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2216) ctrlSetTooltip (localize "STR_magRepack_target_belt");
		};
		default {_doBlockTarget = false;};
	};

	if (_doBlockTarget) then
	{
		if (outlw_MR_targetDragging) then
		{
			((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2216) ctrlSetBackgroundColor [1,1,1,0.3];
			((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2216) ctrlSetTooltip "";
		}
		else
		{
			((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2216) ctrlSetBackgroundColor [1,0,0,0.3];
		};

		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2216) ctrlEnable false;
	}
	else
	{
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2216) ctrlSetBackgroundColor [1,1,1,0.3];
	};

	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2217) ctrlSetBackgroundColor [1,1,1,0.3];
};

outlw_MR_onDrag =
{
	private ["_this", "_magInfo"];

	outlw_MR_listDragging = false;
	outlw_MR_sourceDragging = false;
	outlw_MR_targetDragging = false;

	outlw_MR_dragType = _this select 1;
	outlw_MR_dragCount = _this select 0;
	outlw_MR_dragCap = getNumber(configFile >> "CfgMagazines" >> outlw_MR_dragType >> "count");

	switch (_this select 2) do
	{
		case "source": {outlw_MR_dragCount = outlw_MR_sourceCount; outlw_MR_dragCap = outlw_MR_sourceCap; outlw_MR_sourceDragging = true; ((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2217) ctrlEnable true;};
		case "target": {outlw_MR_dragCount = outlw_MR_targetCount; outlw_MR_dragCap = outlw_MR_targetCap; outlw_MR_targetDragging = true; ((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2217) ctrlEnable true;};
		default {outlw_MR_listDragging = true;};
	};

	call outlw_MR_block;
};

outlw_MR_onMouseButtonUp =
{
	outlw_MR_dragType = "";
	outlw_MR_dragCount = 0;
	outlw_MR_dragCap = 0;

	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2215) ctrlSetBackgroundColor [1,0,0,0];
	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2215) ctrlSetTooltip "";

	if (outlw_MR_sourceType == "") then
	{
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2215) ctrlEnable true;
	};

	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2216) ctrlSetBackgroundColor [1,0,0,0];
	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2216) ctrlSetTooltip "";

	if (outlw_MR_targetType == "") then
	{
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2216) ctrlEnable true;
	};

	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2217) ctrlSetBackgroundColor [0,0,0,0];

	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2217) ctrlEnable false;
};

outlw_MR_sourceEnabled =
{
	private ["_this"];

	if (_this select 0) then
	{
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2215) ctrlEnable true;
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1600) ctrlEnable false;
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1600) ctrlSetText "";
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1600) ctrlSetTooltip "";
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1201) ctrlSetText "";
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1100) ctrlSetStructuredText parseText "";
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2215) ctrlSetTooltip "";
	}
	else
	{
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2215) ctrlEnable false;

		if ([outlw_MR_sourceType] call outlw_MR_isConvertable) then
		{
			((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1600) ctrlSetText "Convert";
			((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1600) ctrlSetTooltip (getText(configFile >> "CfgMagazines" >> ([outlw_MR_sourceType] call outlw_MR_getConversion) >> "DisplayName"));
			((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1600) ctrlEnable true;
		};
	};

	if (outlw_MR_dragType != "") then
	{
		call outlw_MR_block;
	};
};

outlw_MR_targetEnabled =
{
	private ["_this"];

	if (_this select 0) then
	{
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2216) ctrlEnable true;
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1601) ctrlEnable false;
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1601) ctrlSetText "";
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1601) ctrlSetTooltip "";
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1203) ctrlSetText "";
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1101) ctrlSetStructuredText parseText "";
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2216) ctrlSetTooltip "";
	}
	else
	{
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 2216) ctrlEnable false;

		if ([outlw_MR_targetType] call outlw_MR_isConvertable) then
		{
			((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1601) ctrlSetText "Convert";
			((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1601) ctrlSetTooltip (getText(configFile >> "CfgMagazines" >> ([outlw_MR_targetType] call outlw_MR_getConversion) >> "DisplayName"));
			((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1601) ctrlEnable true;
		};
	};

	if (outlw_MR_dragType != "") then
	{
		call outlw_MR_block;
	};
};

outlw_MR_addSource =
{
	private ["_this", "_doExit", "_magInfo"];

	_doExit = false;

	if (outlw_MR_listDragging) then
	{
		if ([_this select 2, _this select 1] call outlw_MR_magVerified) then
		{
			outlw_MR_sourceType = _this select 2;
			outlw_MR_sourceCount = _this select 1;
			outlw_MR_sourceCap = getNumber(configFile >> "CfgMagazines" >> outlw_MR_sourceType >> "count");

			[outlw_MR_sourceType, outlw_MR_sourceCount] call outlw_MR_removeMag;
			call outlw_MR_populateMagListBox;
		}
		else
		{
			_doExit = true;
		};
	}
	else
	{
		outlw_MR_sourceType = outlw_MR_targetType;
		outlw_MR_sourceCount = outlw_MR_targetCount;
		outlw_MR_sourceCap = outlw_MR_targetCap;

		outlw_MR_doAddToMagazines = false;

		call outlw_MR_clearTarget;
	};

	if (_doExit) exitWith {};

	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1501) lbAdd (getText (configFile >> "cfgMagazines" >> outlw_MR_sourceType >> "DisplayName"));

	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1201) ctrlSetText (getText (configFile >> "cfgMagazines" >> outlw_MR_sourceType >> "picture"));

	["outlw_MR_Dialog_Main", 22180, [0,((0.12/outlw_MR_sourceCap) * (outlw_MR_sourceCap - outlw_MR_sourceCount))], 0] call outlw_MR_ctrlSetPos;

	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1100) ctrlSetStructuredText parseText format
	[
		"<t size='0.65 * GUI_GRID_H' align='left'>%1<br/>%2</t>",
		(getText (configFile >> "cfgMagazines" >> outlw_MR_sourceType >> "DisplayName")),
		(getText (configFile >> "cfgMagazines" >> outlw_MR_sourceType >> "descriptionshort"))
	];

	[false] call outlw_MR_sourceEnabled;

	if (outlw_MR_targetType != "") then
	{
		[] spawn outlw_MR_repack;
	};
};

outlw_MR_clearSource =
{
	private ["_doPopulate"];

	_doPopulate = false;

	if (outlw_MR_doAddToMagazines) then
	{
		if (outlw_MR_sourceCount > 0) then
		{
			player addMagazine [outlw_MR_sourceType, outlw_MR_sourceCount];
			_doPopulate = true;
		};
	};

	lnbClear ((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1501);

	outlw_MR_sourceType = "";
	outlw_MR_sourceCount = 0;

	if (_doPopulate) then
	{
		call outlw_MR_populateMagListBox;
	};

	[true] call outlw_MR_sourceEnabled;
	outlw_MR_doAddToMagazines = true;

	["outlw_MR_Dialog_Main", 22180, [0,0.12], 0] call outlw_MR_ctrlSetPos;
};

outlw_MR_addTarget =
{
	private ["_this", "_doExit", "_magInfo"];

	_doExit = false;

	if (outlw_MR_listDragging) then
	{
		if ([_this select 2, _this select 1] call outlw_MR_magVerified) then
		{
			outlw_MR_targetType = _this select 2;
			outlw_MR_targetCount = _this select 1;
			outlw_MR_targetCap = getNumber(configFile >> "CfgMagazines" >> outlw_MR_targetType >> "count");

			[outlw_MR_targetType, outlw_MR_targetCount] call outlw_MR_removeMag;
			call outlw_MR_populateMagListBox;
		}
		else
		{
			_doExit = true;
		};
	}
	else
	{
		outlw_MR_targetType = outlw_MR_sourceType;
		outlw_MR_targetCount = outlw_MR_sourceCount;
		outlw_MR_targetCap = outlw_MR_sourceCap;

		outlw_MR_doAddToMagazines = false;

		call outlw_MR_clearSource;
	};

	if (_doExit) exitWith {};

	if (outlw_MR_targetCap == 1) then
	{
		if ([outlw_MR_targetType] call outlw_MR_isConvertable) then
		{
			outlw_MR_targetType = [outlw_MR_targetType] call outlw_MR_getConversion;
			outlw_MR_targetCap = getNumber(configFile >> "CfgMagazines" >> outlw_MR_targetType >> "count");
		};
	};

	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1502) lbAdd (getText (configFile >> "cfgMagazines" >> outlw_MR_targetType >> "DisplayName"));

	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1203) ctrlSetText (getText (configFile >> "cfgMagazines" >> outlw_MR_targetType >> "picture"));

	["outlw_MR_Dialog_Main", 22190, [0,((0.12/outlw_MR_targetCap) * (outlw_MR_targetCap - outlw_MR_targetCount))], 0] call outlw_MR_ctrlSetPos;

	((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1101) ctrlSetStructuredText parseText format
	[
		"<t size='0.65 * GUI_GRID_H' align='right'>%1<br/>%2</t>",
		(getText (configFile >> "cfgMagazines" >> outlw_MR_targetType >> "DisplayName")),
		(getText (configFile >> "cfgMagazines" >> outlw_MR_targetType >> "descriptionshort"))
	];

	[false] call outlw_MR_targetEnabled;

	if (outlw_MR_sourceType != "") then
	{
		[] spawn outlw_MR_repack;
	};
};

outlw_MR_clearTarget =
{
	if (outlw_MR_doAddToMagazines) then
	{
			player addMagazine [outlw_MR_targetType, outlw_MR_targetCount];
	};

	lnbClear ((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 1502);

	outlw_MR_targetType = "";
	outlw_MR_targetCount = 0;

	call outlw_MR_populateMagListBox;

	[true] call outlw_MR_targetEnabled;
	outlw_MR_doAddToMagazines = true;

	["outlw_MR_Dialog_Main", 22190, [0,0.12], 0] call outlw_MR_ctrlSetPos;
};

outlw_MR_moveToList =
{
	switch (true) do
	{
		case (outlw_MR_sourceDragging): {call outlw_MR_clearSource;};
		case (outlw_MR_targetDragging): {call outlw_MR_clearTarget;};
	};
};

outlw_MR_optionsMenu =
{
	_posGroup = ctrlPosition ((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 9000);
	_posBottom = ctrlPosition ((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 8998);
	_posTop = ctrlPosition ((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 8997);

	if ([9006,9001,9000,8999,8998,8997] call outlw_MR_isAnimating) exitWith {};

	if (outlw_MR_optionsOpen) then
	{
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 9006) ctrlSetPosition [0,0.21];
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 9001) ctrlSetPosition [0,0];
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 9000) ctrlSetPosition [(_posGroup select 0) - 0.00625, (_posGroup select 1), 0, (_posGroup select 3)];
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 8999) ctrlSetPosition [(_posGroup select 0), (_posGroup select 1) + 0.055];
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 8998) ctrlSetPosition [(_posBottom select 0), (_posBottom select 1) - 0.01];
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 8997) ctrlSetPosition [(_posTop select 0), (_posTop select 1) + 0.055];

		outlw_MR_optionsOpen = false;

		[] spawn
		{
			{((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl _x) ctrlCommit 0.15;} forEach [9006,9001,9000,8999];
			uiSleep 0.15;
			{((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl _x) ctrlCommit 0.1;} forEach [8998,8997];
		};
	}
	else
	{
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 9006) ctrlSetPosition [0.1125,0.21];
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 9001) ctrlSetPosition [0.04375,0];
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 9000) ctrlSetPosition [(_posGroup select 0) + 0.00625, (_posGroup select 1), 0.2, (_posGroup select 3)];
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 8999) ctrlSetPosition [(_posGroup select 0) + 0.2125, (_posGroup select 1) + 0.055];
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 8998) ctrlSetPosition [(_posBottom select 0), (_posBottom select 1) + 0.01];
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 8997) ctrlSetPosition [(_posTop select 0), (_posTop select 1) - 0.055];

		outlw_MR_optionsOpen = true;

		[] spawn
		{
			{((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl _x) ctrlCommit 0.1;} forEach [8998,8997];
			uiSleep 0.1;
			{((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl _x) ctrlCommit 0.15;} forEach [9006,9001,9000,8999];
		};
	};
};

outlw_MR_debugSwitch =
{
	if (outlw_MR_debugMode) then
	{
		outlw_MR_debugMode = false;
		profileNamespace setVariable ["outlw_MR_debugMode_profile", false];
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 9002) ctrlSetStructuredText parseText ([localize "STR_magRepack_debug", ": ", format ["<t align='right'>%1</t>", localize "STR_info_bar_off"]] joinString "");
	}
	else
	{
		outlw_MR_debugMode = true;
		profileNamespace setVariable ["outlw_MR_debugMode_profile", true];
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 9002) ctrlSetStructuredText parseText ([localize "STR_magRepack_debug", ": ", format ["<t align='right'>%1</t>", localize "STR_info_bar_on2"]] joinString "");
	};
};

outlw_MR_showFullSwitch =
{
	if (outlw_MR_doHideFull) then
	{
		outlw_MR_doHideFull = false;
		profileNamespace setVariable ["outlw_MR_doHideFull_profile", false];
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 9004) ctrlSetStructuredText parseText ([localize "STR_magRepack_full", " ", format ["<t align='right'>%1</t>", localize "STR_info_bar_on2"]] joinString "");
	}
	else
	{
		outlw_MR_doHideFull = true;
		profileNamespace setVariable ["outlw_MR_doHideFull_profile", true];
		((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl 9004) ctrlSetStructuredText parseText ([localize "STR_magRepack_full", " ", format ["<t align='right'>%1</t>", localize "STR_info_bar_off"]] joinString "");
	};

	call outlw_MR_populateMagListBox;
};

outlw_MR_onDialogDestroy =
{
	private ["_endingInfo", "_sTCA", "_eTCA", "_snTCA", "_enTCA", "_output", "_toAdd", "_dif", "_difStr", "_n", "_a"];

	ppEffectDestroy outlw_MR_blur;
	
		if (outlw_MR_sourceType != "") then
		{
			call outlw_MR_clearSource;
		};

		if (outlw_MR_targetType != "") then
		{
			call outlw_MR_clearTarget;
		};
		
	if (outlw_MR_debugMode) then
	{
		_endingInfo = call outlw_MR_debugInfo;

		_sTCA = outlw_MR_startingInfo select 1;
		_eTCA = _endingInfo select 1;
		_output = "";

		for "_n" from 0 to ((count _sTCA) - 1) do
		{
			_snTCA = _sTCA select _n;
			_toAdd = ((getText (configFile >> "cfgMagazines" >> _snTCA select 0 >> "DisplayName")) + "<br/>[" + str(_snTCA select 1) + "] >> [0]<br/>" + localize "STR_magRepack_ammo" + " <t color='#FC1010'>-" + str(_snTCA select 2) + "</t>");

			for "_a" from 0 to ((count _eTCA) - 1) do
			{
				_enTCA = _eTCA select _a;

				if ((_snTCA select 0) == (_enTCA select 0)) then
				{
					_toAdd = ((getText (configFile >> "cfgMagazines" >> _snTCA select 0 >> "DisplayName")) + "<br/>[" + str(_snTCA select 1) + "] >> [" + str(_enTCA select 1) + "]<br/>");

					_dif = (_enTCA select 2) - (_snTCA select 2);

					switch (true) do
					{
						case (_dif > 0): {_toAdd = (_toAdd + localize "STR_magRepack_ammo" + " <t color='#15E612'>+" + str(_dif) + "</t>")};
						case (_dif < 0): {_toAdd = (_toAdd + localize "STR_magRepack_ammo" + " <t color='#FC1010'>" + str(_dif) + "</t>")};
						default {_toAdd = (_toAdd + localize "STR_magRepack_ammo_nochange")};
					};
				};
			};

			_output = (_output + _toAdd + "<br/><br/>");
		};

		for "_n" from 0 to ((count _eTCA) - 1) do
		{
			_enTCA = _eTCA select _n;
			_toAdd = ((getText (configFile >> "cfgMagazines" >> _enTCA select 0 >> "DisplayName")) + "<br/>[0] >> [" + str(_enTCA select 1) + "]<br/>" + localize "STR_magRepack_ammo" + " <t color='#15E612'>+" + str(_enTCA select 2) + "</t><br/><br/>");

			for "_a" from 0 to ((count _sTCA) - 1) do
			{
				_snTCA = _sTCA select _a;

				if ((_snTCA select 0) == (_enTCA select 0)) then
				{
					_toAdd = "";
					_a = count _sTCA;
				};
			};

			_output = (_output + _toAdd);
		};

		_dif = ((_endingInfo select 0) select 1) - ((outlw_MR_startingInfo select 0) select 1);
		_difStr = "";

		switch (true) do
		{
			case (_dif > 0): {_difStr = ("<t color='#15E612'>+" + str(_dif) + "</t>")};
			case (_dif < 0): {_difStr = ("<t color='#FC1010'>" + str(_dif) + "</t>")};
			default {_difStr = localize "STR_magRepack_nochange"};
		};

		hint parseText ("<br/><t size='1.05'>Mag Repack Debug</t><t size='0.95'><br/><br/>All Mags<br/>[" + str((outlw_MR_startingInfo select 0) select 0) + "] >> [" + str((_endingInfo select 0) select 0) + "]<br/>Ammo: " + _difStr + "<br/><br/>" + _output + "</t>");
	};

	[] spawn
	{
		uiSleep 0.5;
		outlw_MR_canCreateDialog = true;
	};
};





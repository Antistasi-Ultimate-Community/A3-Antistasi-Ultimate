
outlw_MR_modifierCheck =
{
	_shift = _this select 2;
	_ctrl = _this select 3;
	_alt = _this select 4;

	if (outlw_MR_shift && {!_shift}) then
	{
		false;
	}
	else
	{
		if (outlw_MR_ctrl && {!_ctrl}) then
		{
			false;
		}
		else
		{
			!(outlw_MR_alt && {!_alt});
		};
	};
};
outlw_MR_keyDown =
{
	_isWounded = player getVariable ["incapacitated", false];
	_key = _this select 1;
	
	if (_key == outlw_MR_keybinding && {_this call outlw_MR_modifierCheck}) then
	{
		if (outlw_MR_canCreateDialog && !(_isWounded)) then
		{
			call outlw_MR_createDialog;
			true;
		}
		else
		{
			if (!outlw_MR_keybindingMenuActive) then
			{
				closeDialog 0;
				true;
			};
		};
	}
	else
	{		
		if (_key == 14 && {_this select 2} && {_this select 3} && {_this select 4} && {outlw_MR_canCreateDialog}) then
		{
			[outlw_MR_defaultKeybinding, true] call outlw_MR_applyKeybinding;
			true;
		};
	};
};

outlw_MR_getIDCs =
{
	private ["_this", "_config", "_ctrlCount", "_returnList", "_ctrl", "_n"];
	
	_config = _this select 0;
	_filter = {true};
	
	if (count _this > 1) then
	{
		_filter = _this select 1;
	};
	
	_ctrlCount = count(_config);
	_returnList = [];
	
	for "_n" from 0 to (_ctrlCount - 1) do
	{
		_ctrl = configName((_config) select _n);
		
		if (call _filter) then
		{
			_returnList pushBack getNumber(_config >> _ctrl >> "idc");
		};
		
		if (isClass(_config >> _ctrl >> "Controls")) then
		{
			_returnList = _returnList + ([(_config >> _ctrl >> "Controls"), _filter] call outlw_MR_getIDCs);
		};
	};
	
	_returnList;
};

outlw_MR_isAnimating =
{
	private ["_listIDCs", "_ctrlCount", "_returnBool", "_idc", "_n"];
	
	_listIDCs = outlw_MR_listIDCs;
	
	if ((count _this) > 0) then
	{
		_listIDCs = _this;
	};
	
	_ctrlCount = count _listIDCs;
	_returnBool = false;
	
	for "_n" from 0 to (_ctrlCount - 1) do
	{
		_idc = _listIDCs select _n;
		
		if !(ctrlCommitted ((uiNamespace getVariable "outlw_MR_Dialog_Main") displayCtrl _idc)) then
		{
			_n = _ctrlCount;
			_returnBool = true;
		};
	};
	
	_returnBool;
};

outlw_MR_ctrlSetPos =
{
	((uiNamespace getVariable (_this select 0)) displayCtrl (_this select 1)) ctrlSetPosition (_this select 2);
	((uiNamespace getVariable (_this select 0)) displayCtrl (_this select 1)) ctrlCommit (_this select 3);
};

outlw_MR_shortString =
{
	private ["_this", "_inputString", "_limit", "_uniray", "_n"];
	
	_inputString = _this select 0;
	_limit = _this select 1;
	_uniray = toArray(_inputString);
	
	if (count(_uniray) > _limit) then
	{
		for [{_n = (count(_uniray) - 1);}, {_n >= _limit}, {_n = _n - 1}] do
		{
			_uniray set [_n, -42];
		};
	
		_uniray = _uniray - [-42];
	
		(toString(_uniray) + "...");
	}
	else
	{
		_inputString;
	};
};

outlw_MR_ammoDisplayName =
{
	private ["_this", "_uniray", "_n"];
	
	_uniray = toArray(_this select 0);
	
	for "_n" from 0 to ((count _uniray) - 1) do
	{
		if (_n < 2) then
		{
			_uniray set [_n, -42];
		};
		
		if ((_uniray select _n) == 95) then
		{
			_uniray set [_n, 32];
		};
	};
	
	_uniray = _uniray - [-42];
	
	toString(_uniray);
};

outlw_MR_magInfo =
{
	private ["_this", "_magsAmmo", "_magTypes", "_magAmmoCounts", "_magAmmoCaps", "_magType", "_n", "_a"];
	
	_magsAmmo = magazinesAmmo player;
	_magTypes = [];
	_magAmmoCounts = [];
	_magAmmoCaps = [];
	_a = 0;
	
	for "_n" from 0 to ((count _magsAmmo) - 1) do
	{
		_magType = ((_magsAmmo select _n) select 0);
		
		if (getNumber(configFile >> "CfgMagazines" >> _magType >> "count") > 1 || {[_magType] call outlw_MR_isConvertable}) then
		{
			_magTypes set [_a, _magType];
			_magAmmoCounts set [_a, ((_magsAmmo select _n) select 1)];
			_magAmmoCaps set [_a, getNumber(configFile >> "CfgMagazines" >> _magType >> "count")];
			_a = _a + 1;
		};
	};
	
	[_magTypes, _magAmmoCounts, _magAmmoCaps];
};

outlw_MR_removeMag =
{
	private ["_this", "_toRemove", "_ammoCount", "_magInfo", "_n"];
	
	_toRemove = _this select 0;
	_ammoCount = _this select 1;
	_magInfo = call outlw_MR_magInfo;
	
	{player removeMagazine _x} forEach (_magInfo select 0);
	
	for "_n" from 0 to ((count (_magInfo select 0)) - 1) do
	{
		if (((_magInfo select 0) select _n) != _toRemove || {((_magInfo select 1) select _n) != _ammoCount}) then
		{
			player addMagazine [((_magInfo select 0) select _n), ((_magInfo select 1) select _n)];
		}
		else
		{
			_toRemove = "";
		};
	};
};

outlw_MR_magVerified =
{
	private ["_this", "_toVerify", "_ammoCount", "_magInfo", "_returnBool", "_n"];
	
	_toVerify = _this select 0;
	_ammoCount = _this select 1;
	_magInfo = call outlw_MR_magInfo;
	_returnBool = false;
	
	for "_n" from 0 to ((count (_magInfo select 0)) - 1) do
	{
		if (((_magInfo select 0) select _n) == _toVerify && {((_magInfo select 1) select _n) == _ammoCount}) then
		{
			_n = count (_magInfo select 0);
			_returnBool = true;
		};
	};
	
	_returnBool;
};

outlw_MR_uniqueMags =
{
	private ["_this", "_magTypes", "_magAmmoCounts", "_magAmmoCaps", "_returnMagTypes", "_returnAmmoCaps", "_returnAmmoCaps", "_returnMagCounts", "_n", "_a", "_p"];
	
	_magTypes = _this select 0;
	_magAmmoCounts = _this select 1;
	_magAmmoCaps = _this select 2;
	
	_returnMagTypes = [];
	_returnAmmoCounts = [];
	_returnAmmoCaps = [];
	_returnMagCounts = [];
	
	_isUnique = true;
	_a = 0;
	_p = 0;
	
	for "_n" from 0 to ((count _magTypes) - 1) do
	{		
		_isUnique = true;
		
		for [{_a = 0}, {(_a < count _returnMagTypes) && _isUnique}, {_a = _a + 1}] do
		{
			if ((_magTypes select _n) == (_returnMagTypes select _a) && {(_magAmmoCounts select _n) == (_returnAmmoCounts select _a)}) then
			{
				_isUnique = false;
			}
		};
		
		if (_isUnique) then
		{
			_returnMagTypes set [_p, _magTypes select _n];
			_returnAmmoCounts set [_p, _magAmmoCounts select _n];
			_returnAmmoCaps set [_p, _magAmmoCaps select _n];
			_returnMagCounts set [_p, 1];
			
			_p = _p + 1;
		}
		else
		{
			_returnMagCounts set [(_a - 1), ((_returnMagCounts select (_a - 1)) + 1)];
		};
	};
	
	[_returnMagTypes, _returnAmmoCounts, _returnAmmoCaps, _returnMagCounts];
};

outlw_MR_isBeltMagazine =
{
	private ["_magType", "_cap", "_nameSound", "_returnBool"];
	
	_magType = _this select 0;
	_cap = getNumber(configFile >> "CfgMagazines" >> _magType >> "count");
	_nameSound = getText(configFile >> "CfgMagazines" >> _magType >> "nameSound");
	
	_returnBool = false;
	
	//if (_nameSound == "mGun" || {(_nameSound != "magazine" && _cap >= 100)}) then - Not returning true on DLC magazines - GiPPO
	
	if (_nameSound == "mGun" || {_cap >= 100}) then
	{
		_returnBool = true;
	};
	
	_returnBool;
};

outlw_MR_isConvertable =
{
	(([_this select 0] call outlw_MR_getConversion) != "");
};

outlw_MR_getConversion =
{
	private ["_magType", "_returnType", "_magTypeArray"];
	
	_magType = _this select 0;
	_returnType = "";
	
	if (getNumber(configFile >> "CfgMagazines" >> _magType >> "count") == 3) then
	{
		_returnType = configName(inheritsFrom(configFile >> "CfgMagazines" >> _magType));
	}
	else
	{
		_magTypeArray = toArray(_magType);
		
		if ((_magTypeArray select 0) == 49) then
		{
			_magTypeArray set [0, 51];
			_returnType = toString(_magTypeArray);
		}
		else
		{
			_returnType = ("3Rnd_" + _magType);
		};
	};
	
	if !(isClass(configFile >> "CfgMagazines" >> _returnType)) then
	{
		_returnType = "";
	};
	
	_returnType;
};

outlw_MR_convert =
{
	private ["_this", "_magType", "_ammoCount", "_toAdd", "_n"];
	
	_magType = outlw_MR_sourceType;
	_ammoCount = outlw_MR_sourceCount;
	
	if ((_this select 0) == "Target") then
	{
		_magType = outlw_MR_targetType;
		_ammoCount = outlw_MR_targetCount;
	};
	
	_toAdd = [_magType] call outlw_MR_getConversion;
	outlw_MR_doAddToMagazines = false;
	
	for "_n" from 0 to (_ammoCount - 1) do
	{
		player addMagazine [_toAdd, 1];
	};
	
	call outlw_MR_populateMagListBox;
	
	if ((_this select 0) == "Source") then
	{
		call outlw_MR_clearSource;
	}
	else
	{
		call outlw_MR_clearTarget;
	};
};

outlw_MR_keyListToString =
{
	private ["_shift", "_ctrl", "_alt", "_key", "_returnString", "_q"];
	
	if (count _this == 4) then
	{
		_shift = (_this select 0);
		_ctrl = (_this select 1);
		_alt = (_this select 2);
		_key = (_this select 3);
	}
	else
	{
		_shift = outlw_MR_shift;
		_ctrl = outlw_MR_ctrl;
		_alt = outlw_MR_alt;
		_key = outlw_MR_keybinding;
	};
	
	_returnString = "";
	_q = '"';
	
	if (_shift) then
	{
		_returnString = _returnString + "Shift+";
	};
	
	if (_ctrl) then
	{
		_returnString = _returnString + "Ctrl+";
	};
	
	if (_alt) then
	{
		_returnString = _returnString + "Alt+";
	};
	
	_returnString = (_returnString + (keyName _key));
	
	(_q + toString(toArray(_returnString) - [34]) + _q);
};

outlw_MR_openAbout =
{
	createDialog "MagRepack_Dialog_About";
	
	((uiNamespace getVariable "outlw_MR_Dialog_About") displayCtrl 1001) ctrlSetText ("Version: " + outlw_MR_version);
	((uiNamespace getVariable "outlw_MR_Dialog_About") displayCtrl 1003) ctrlSetText ("Updated: " + outlw_MR_date);
	((uiNamespace getVariable "outlw_MR_Dialog_About") displayCtrl 2400) ctrlSetStructuredText parseText "M<t size='0.8'>MKAY</t>";
};






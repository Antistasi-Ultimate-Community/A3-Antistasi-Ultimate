/*
    Author:
    Silence

    Description:
    Grabs all the weapons out of a crate, grabs mags for them, then puts it into a formatted config array for the arms dealer.

    Params:
	_object    <OBJECT> <DEFAULT: cursorObject>
	_prefix    <STRING> <DEFAULT: "mod">
	_category  <STRING> <DEFAULT: "default">

    Usage:
    [cursorObject, "RHS", "rifles"] call A3U_fnc_exportCrate;

    Return:
    _wepsText   <FORMATTED TEXT>

    It also copies it to your clipboard, so if you wanted to you could set up 3 crates, and add an action for each one so you can do it one by one. For example:
    this addAction ["copy", {[(_this select 0), "RHS", "Rifles"] call A3U_fnc_exportCrate}];
    this addAction ["copy", {[(_this select 0), "RHS", "Sniper Rifles"] call A3U_fnc_exportCrate}];
*/

// I am aware this script looks like hot dogshit, it works for it's given purpose and it's not intended to be used for anyone other than devs

params [
	["_object", cursorObject],
	["_prefix", "mod"],
	["_category", "default"]
];

private _wepCargo = weaponCargo _object;
// private _magCargo = magazineCargo _object;

private _wepsText = format [ // Formatted like this so it can be put straight into a config, any changes to the indentation will break it
'		class %1%2 
		{
            displayName = "%2 %1";
		    picture = "";', _category, _prefix
];

private _magsText = format [
'		class magazines%1%2
		{
            displayName = "%2 Magazines";
		    picture = "";', _category, _prefix
];

{
	if (_x in _wepsText) then {} else {
		private _wepText = format [
		"	
			ITEM(%1, _PRICE_, _STOCKTYPE_);", _x
		];
		_wepsText = _wepsText + _wepText;
	};
    private _mag = getArray (configFile >> "CfgWeapons" >> _x >> "magazines") select 0;
    if (_mag in _magsText) then {} else {
        private _magText = format [
        "	
            ITEM(%1, _PRICE_, MAGAZINE_STOCK);", _mag
        ];
        _magsText = _magsText + _magText;
    };
} forEach _wepCargo;

// Formatted like this so it can be put straight into a config, any changes to the indentation will break it
_wepsText = _wepsText + "		
		};";

_magsText = _magsText + "
        };";

_wepsText = formatText [
"%1 

%2", _wepsText, _magsText];

copyToClipboard str _wepsText;

_wepsText

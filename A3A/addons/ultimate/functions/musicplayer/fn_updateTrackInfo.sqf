// fn_updateTrackInfo.sqf
/*  
    Author: wersal

    Description:
        Updates the displayed track name and the mod icon in the player UI.

    Params:
        None

    Returns:
        Nothing

    License: VPN-DPC
*/

#include "..\..\script_component.hpp"

private _display = findDisplay 85000;
if (isNull _display) exitWith {};

// Current item name
private _trackInfo = _display displayCtrl 85110;
private _text = if (count A3U_currentTrack > 0) then {
    format ["<t align='center' size='1.1'>%1</t>", A3U_currentTrack#0]
} else {
    format ["<t align='center' size='1.1'>%1</t>", localize "STR_A3U_select_track"]
};
_trackInfo ctrlSetStructuredText parseText _text;

// Mod icon control
private _iconCtrl = _display displayCtrl 85111;

if (count A3U_currentTrack > 0) then {
    private _itemClass = A3U_currentTrack#1;
    private _modInfo = [_itemClass] call A3U_fnc_getTrackModIcon; // one function for both modes
    _modInfo params ["_icon", "_modName"];
    
    if (_icon != "") then {
        _iconCtrl ctrlSetText _icon;
        _iconCtrl ctrlSetTooltip (if (_modName != "") then {_modName} else {localize "STR_A3U_unknown_mod"});
        _iconCtrl ctrlShow true;
    } else {
        // No icon – show placeholder (e.g., standard question mark)
        _iconCtrl ctrlSetText "\a3\ui_f\data\gui\cfg\hints\icon_unknown_ca.paa";
        _iconCtrl ctrlSetTooltip (if (_modName != "") then {_modName} else {localize "STR_A3U_unknown_mod"});
        _iconCtrl ctrlShow true;
    };
} else {
    // No track – hide icon
    _iconCtrl ctrlShow false;
};

_trackInfo ctrlCommit 0;
_iconCtrl ctrlCommit 0;
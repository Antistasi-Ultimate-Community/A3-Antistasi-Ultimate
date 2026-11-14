#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

#define DELAY 4
#define DURATION 4

private _credits = [
	[ (call SCRT_fnc_misc_getMissionTitle), [QUOTE(VERSION)], "<img image='Pictures\Mission\logo.paa' size='1.6' />"],
	[ (localize "STR_antistasi_credits_authors_ultimate"), ["Antistasi Ultimate Team"]],
	[ (localize "STR_antistasi_credits_authors_plus"), ["Socrates"]],
	[ (localize "STR_antistasi_credits_authors"), ["Barbolani","Official Antistasi Community"]]
];

// if ("coldWar" in A3A_factionEquipFlags) then {
// 	_credits pushBack [[localize "STR_antistasi_credits_cw_mode", "<t size=1.5 font='PuristaBold' color='#B6020B'>%1</t>"], [""]];
// };

private _layer = "credits1" call bis_fnc_rscLayer;

{
	_title = _x param [0,""];
	_names = _x select 1;
	_icon = _x param [2,""];

	private _formatting = "";
	if (_title isEqualType []) then {
		_formatting = _title#1;
		_title = _title#0;
	};

	_text = format [[_formatting, "<t size=1.5 font='PuristaBold'>%1</t>"] select (_formatting isEqualTo ""), toUpper _title] + "<br />";
	_text = [
		_text,
		(_icon + "<br />" + _text)
	] select (_icon isNotEqualTo "");

	{
		//Second line break controls size of gap between authors. &#160; is a non-breaking space character, which prevents the size being ignored.
		_text = _text + _x + "<br /><t size='0.2'>&#160;</t><br />";
	} forEach _names;

	_text = format ["<t size='1' shadow='2'>%1</t>",_text];
	_index = _foreachindex % 2;
	[_layer,_text,_index, DURATION] spawn {
		disableSerialization;
		params ["_layer", "_text", "_index", "_duration"];
		_fadeTime = 0.5;
		_time = time + _duration - _fadeTime;
		_layer cutRsc ["RscDynamicText","plain"];
		_display = uiNamespace getVariable ["BIS_dynamicText",displayNull];
		_ctrlText = _display displayCtrl 9999;
		_ctrlText ctrlSetStructuredText parseText _text;
		_offsetX = 0.1;
		_offsetY = 0.3;

		_width = safeZoneW;
		_height = ctrlTextHeight _ctrlText;
		_pos = [safeZoneX, safeZoneY + _offsetY,_width,_height];

		_ctrlText ctrlSetPosition _pos;
		_ctrlText ctrlSetFade 1;
		_ctrlText ctrlCommit 0;
		_ctrlText ctrlSetFade 0;
		_ctrlText ctrlCommit _fadeTime;
		waitUntil {time > _time};
		_ctrlText ctrlSetFade 1;
		_ctrlText ctrlCommit _fadeTime;
	};
	_time = time + DELAY;
	waitUntil {time > _time};
} forEach _credits;

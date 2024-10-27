#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_unitType"];

private _hr = server getVariable "hr";

if (_hr < 1) exitWith {
	[localize "STR_garrison_garrison_header", localize "STR_garrison_error_no_hr", localize "STR_notifiers_fail_type"] call SCRT_fnc_ui_showDynamicTextMessage;
};

private _markerX = positionXGarr;

private _resourcesFIA = server getVariable "resourcesFIA";
private _costs = server getVariable _unitType;
private _warningText = nil;

if (_costs > _resourcesFIA) exitWith {
	[localize "STR_garrison_garrison_header",  format [localize "STR_garrison_error_no_money", _costs, A3A_faction_civ get "currencySymbol"], localize "STR_notifiers_fail_type"] call SCRT_fnc_ui_showDynamicTextMessage;
};

if (_unitType == FactionGet(reb, "unitCrew") && _markerX in (watchpostsFIA + roadblocksFIA + aapostsFIA + atpostsFIA + hmgpostsFIA)) exitWith {
	[localize "STR_garrison_garrison_header", localize "STR_garrison_error_no_mortar", localize "STR_notifiers_fail_type"] call SCRT_fnc_ui_showDynamicTextMessage;
};

_positionX = getMarkerPos _markerX;

if (surfaceIsWater _positionX) exitWith {
	[localize "STR_garrison_garrison_header", localize "STR_garrison_error_still_updating", localize "STR_notifiers_fail_type"] call SCRT_fnc_ui_showDynamicTextMessage;
};

if ([_positionX] call A3A_fnc_enemyNearCheck) exitWith {
	[localize "STR_garrison_garrison_header", localize "STR_garrison_error_enemies_near", localize "STR_notifiers_fail_type"] call SCRT_fnc_ui_showDynamicTextMessage;
};

private _garrison = garrison getVariable [_markerX,[]];
private _limit = [_markerX] call A3A_fnc_getGarrisonLimit;

if (_limit != -1 && {count _garrison >= _limit}) exitWith {
	[localize "STR_A3A_garrisons_header", localize "STR_A3A_garrison_reached_limit"] call SCRT_fnc_ui_showDynamicTextMessage;
};


[-1,-_costs] remoteExec ["A3A_fnc_resourcesFIA",2];

private _countX = count _garrison;
[_unitType,teamPlayer,_markerX,1] remoteExec ["A3A_fnc_garrisonUpdate",2];
waitUntil {(_countX < count (garrison getVariable [_markerX, []])) or (sidesX getVariable [_markerX,sideUnknown] != teamPlayer)};

if(((server getVariable ["hr",0]) <= 10) && (loseHROnDeath isEqualTo 2)) then { 
	_warningText = "<t font ='PuristaBold' align = 'center' size='0.8' color='#bd0000'>" + localize "STR_A3AU_respawn_warning" +"</t>"+"<br />"+"<t font ='PuristaSemibold' align = 'center' size='0.55' color='#ebebeb'>" + format [localize "STR_A3AU_HR_warning_info", (A3A_faction_reb get "name"), (server getVariable ["hr",0])]+"</t>";
	[_warningText,0,safezoneY+0.05] remoteExec ["BIS_fnc_dynamicText"];
};

if (sidesX getVariable [_markerX,sideUnknown] == teamPlayer) then {
	private _garrisonInfo = format [localize "STR_garrison_recruit_success", [_markerX] call A3A_fnc_garrisonInfo];
	[localize "STR_garrison_garrison_header", _garrisonInfo] call SCRT_fnc_ui_showDynamicTextMessage;

	if (spawner getVariable _markerX != 2) then {
		[_markerX,_unitType] remoteExec ["A3A_fnc_createSDKGarrisonsTemp",2];
	};
};

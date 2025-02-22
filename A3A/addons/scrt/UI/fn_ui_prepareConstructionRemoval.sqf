if (!(player call A3A_fnc_isEngineer)) exitWith {
    [localize "STR_antistasi_dialogs_construction_removal_title", localize "STR_antistasi_dialogs_construction_removal_no_trait"] call SCRT_fnc_misc_deniedHint;
    closeDialog 0;
};

if (count constructionsToSave < 1) exitWith {
    closeDialog 0;
};

private _construction = cursorTarget;
if(isNil "_construction" || {isNull _construction}) then {
    private _constuctions = +constructionsToSave;
    private _closeConstructions = [_constuctions, [], { player distance _x }, "ASCEND"] call BIS_fnc_sortBy;

    if (count _closeConstructions > 0 && {player distance2D (_closeConstructions select 0) < 3}) then {
        _construction = _closeConstructions select 0;
    };
};

if(isNil "_construction" || {isNull _construction}) exitWith {
    closeDialog 0;
};

private _buildingIndex = constructionsToSave find _construction;

if (_buildingIndex == -1) exitWith {
    [localize "STR_antistasi_dialogs_construction_removal_title", localize "STR_antistasi_dialogs_construction_removal_no_valid_construction"] call SCRT_fnc_misc_deniedHint;
    closeDialog 0;
};

createDialog "constructionRemovalConfirmation";

private _display = findDisplay 123;

if (str (_display) != "no display") then {
	private _childControl = _display displayCtrl 1244;
    private _name = getText (configFile >> "CfgVehicles" >> typeOf _construction >> "displayName");
	_childControl ctrlSetText format ["%1 (%2)?",localize "STR_antistasi_dialogs_remove_construction", _name];
};

waitUntil {(!dialog) || {!isNil "removeConstruction"}};
if ((!dialog) && {isNil "removeConstruction"}) exitWith {
    closeDialog 0;
};

removeConstruction = nil;

[_construction] remoteExecCall ["SCRT_fnc_build_removeConstruction", 2];

sleep 0.5;

[localize "STR_antistasi_dialogs_construction_removal_title", localize "STR_antistasi_dialogs_construction_removal_success"] call A3A_fnc_customHint;
playSound "A3AP_UiSuccess";
closeDialog 0;
closeDialog 0;
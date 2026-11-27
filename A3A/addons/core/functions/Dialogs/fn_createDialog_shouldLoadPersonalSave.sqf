private _saveString = [
    localize "STR_A3A_Dialogs_create_dialog_save_personal_save_1",
    localize "STR_A3A_Dialogs_create_dialog_save_personal_save_2"
] joinString "";
_saveString = if (autoSave) then { 
    [
        _saveString,
        localize "STR_A3A_Dialogs_create_dialog_save_personal_save_3",
        (autoSaveInterval/60) toFixed 0,
        " ",
        localize "STR_A3A_Dialogs_create_dialog_save_personal_save_4"
    ] joinString "" 
} else { 
    [_saveString,localize "STR_A3A_Dialogs_create_dialog_save_personal_save_5"] joinString "" 
};

private _enableInitMessages = profileNamespace getVariable ["A3U_setting_enableInitMessages", true];
if (_enableInitMessages) then { [localize "STR_A3A_Dialogs_create_dialog_save_personal_save_header", _saveString] call A3A_fnc_customHint };

[getPlayerUID player, player] remoteExecCall ["A3A_fnc_loadPlayer", 2];

[] spawn A3A_fnc_credits;

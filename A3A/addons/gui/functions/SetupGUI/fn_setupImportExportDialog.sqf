/*
function: A3A_fnc_setupImportExportDialog
    Handles the display and import / export funcionality of saved game data introduced with JSON saves.
    This function should only be called from setupImportExportDialog onLoad and control activation EHs.

Author: Creep'nCrunch / jwoodruff40

Environment: Scheduled for onLoad mode / Unscheduled for everything else unless specified

Arguments:
    <STRING> Mode, e.g. "onLoad", "importData", etc
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Modes:
    - onload called on creation to setup dialog
    - onUnload called on deletion to handle deletion of dialog

Return Value:
    Nothing

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_mode", "_params"];

Debug_1("Setup Import/Export dialog called with mode %1", _mode);

private _display = findDisplay A3A_IDD_SETUP_IMPORTEXPORTDIALOG;
private _parent = displayParent _display;
private _saveDataBox = _display displayCtrl A3A_IDC_SETUP_IMPORTEXPORT_SAVEDATABOX;

switch (_mode) do
{
    case ("onLoad"):
    {
        // Check if we have save data, and if so retrieve it
        private "_saveData";
        private _saveIndex = uiNamespace getVariable ["A3U_saveIndex", -1];
        
        if (_saveIndex != -1) then {
            private _serverID = (A3A_setup_saveData select _saveIndex) get "serverID";
            private _campaignID = (A3A_setup_saveData select _saveIndex) get "gameID";
            _saveData = missionProfileNamespace getVariable ("savedata" + _campaignID);
            if (isNil "_saveData") then { _saveData = profileNamespace getVariable format["savedata%1%2%3%4", _serverID, _campaignID, "Antistasi", worldName] };
        };

        private _hasData = !isNil "_saveData";
        
        if (_hasData) then {
            // TODO (MAYBE): convert save data to JSON if it's not already
            // if (_saveData isEqualType createHashMap) then { _saveData = toJSON _saveData };
            _saveDataBox ctrlSetText _saveData;
        };

        (_display displayCtrl A3A_IDC_SETUP_IMPORTEXPORT_IMPORTBUTTON) ctrlEnable !_hasData;
        (_display displayCtrl A3A_IDC_SETUP_IMPORTEXPORT_EXPORTBUTTON) ctrlEnable _hasData;
        _saveDataBox ctrlEnable !_hasData;
    };

    case ("onUnload"):
    {
        
    };

    case ("importData"):
    {
        private _saveData = ctrlText _saveDataBox;
        if (_saveData isEqualTo "") exitWith {
            [localize "STR_antistasi_dialogs_setup_import_export", localize "STR_antistasi_dialogs_setup_ie_import_empty"] call A3A_fnc_customHint;
        };

        private _saveDataHM = fromJSON _saveData;
        if (isNil "_saveDataHM" || {!(_saveDataHM isEqualType createHashMap)}) exitWith {
            [localize "STR_antistasi_dialogs_setup_import_export", localize "STR_antistasi_dialogs_setup_ie_import_invalid"] call A3A_fnc_customHint;
        };

        ["importSave", [_saveDataHM]] call A3A_fnc_setupImportExportDialog;
    };

    case ("importSave"):
    {
        _params params ["_saveDataHM"];

        private _campaignID = _saveDataHM get "campaignID";
        private _serverID = _saveDataHM get "serverID";

        // Generate a new campaign ID and convert back to JSON
        private _newID = [] call A3A_fnc_generateSaveID;
        _saveDataHM set ["campaignID", _newID];
        _saveData = toJSON _saveDataHM;

        // Save the JSON back to the appropriate namespace and update the list of saved games
        private _namespace = [profileNamespace, missionProfileNamespace] select (_serverID isEqualTo false);
        private _saveDataKey = format ([["savedata%1%2%3%4", _serverID, _newID, "Antistasi", worldName], ["savedata%1", _newID]] select (_serverID isEqualTo false));
        _namespace setVariable [_saveDataKey, _saveData];

        // Update the list of saved games
        private _saveList = [_namespace getVariable "antistasiUltimate2SavedGames"] param [0, [], [[]]];
        _saveList pushBack [_newID, worldName, "Greenfor"];
        _namespace setVariable ["antistasiUltimate2SavedGames", _saveList];

        if (_serverID isEqualTo false) then { saveMissionProfileNamespace } else { saveProfileNamespace };

        // Show success message
        [localize "STR_antistasi_dialogs_setup_import_export", localize "STR_antistasi_dialogs_setup_ie_import_success"] call A3A_fnc_customHint;
    };

    case ("exportData"):
    {
        copyToClipboard ctrlText _saveDataBox;
        [localize "STR_antistasi_dialogs_setup_import_export", localize "STR_antistasi_dialogs_setup_ie_copied"] call A3A_fnc_customHint;
    };

    case ("toggleEdit"):
    {
        _saveDataBox ctrlEnable !(ctrlEnabled _saveDataBox);
    };
};

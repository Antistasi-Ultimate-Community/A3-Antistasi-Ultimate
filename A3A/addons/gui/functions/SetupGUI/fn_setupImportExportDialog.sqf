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
private _importBtn = _display displayCtrl A3A_IDC_SETUP_IMPORTEXPORT_IMPORTBUTTON;
private _exportBtn = _display displayCtrl A3A_IDC_SETUP_IMPORTEXPORT_EXPORTBUTTON;
private _pythiaImportBtn = _display displayCtrl A3A_IDC_SETUP_IMPORTEXPORT_PYTHIA_IMPORTBUTTON;
private _pythiaExportBtn = _display displayCtrl A3A_IDC_SETUP_IMPORTEXPORT_PYTHIA_EXPORTBUTTON;
private _inidbi2ImportBtn = _display displayCtrl A3A_IDC_SETUP_IMPORTEXPORT_INIDBI2_IMPORTBUTTON;
private _inidbi2ExportBtn = _display displayCtrl A3A_IDC_SETUP_IMPORTEXPORT_INIDBI2_EXPORTBUTTON;
private _fileTree = _display displayCtrl A3A_IDC_SETUP_IMPORTEXPORT_FILETREE;

switch (_mode) do
{
    case ("onLoad"):
    {
        // Enable / disable extension controls
        if (isClass (configFile >> "CfgPatches" >> "PY3_Pythia")) then {
            _pythiaImportBtn ctrlEnable true;
            _pythiaExportBtn ctrlEnable true;
            _fileTree ctrlEnable true;
        } else {
            _pythiaImportBtn ctrlEnable false;
            _pythiaExportBtn ctrlEnable false;
            _fileTree ctrlEnable false;
        };

        if  (isClass (configFile >> "CfgPatches" >> "inidbi2")) then {
            _inidbi2ImportBtn ctrlEnable true;
            _inidbi2ExportBtn ctrlEnable true;
        } else {
            _inidbi2ImportBtn ctrlEnable false;
            _inidbi2ExportBtn ctrlEnable false;
        };

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
        
        if (_hasData) then { _saveDataBox ctrlSetText _saveData };

        _importBtn ctrlEnable !_hasData;
        _exportBtn ctrlEnable _hasData;
        _saveDataBox ctrlEnable !_hasData;
    };

    case ("onUnload"):
    {
        // ! Stub in case we need to do any cleanup when the dialog is closed
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

        ["registerSaveData", [_saveDataHM]] call A3A_fnc_setupImportExportDialog;
    };

    case ("registerSaveData"):
    {
        _params params ["_saveDataHM"];

        private _campaignID = _saveDataHM get "campaignID";
        private _serverID = _saveDataHM get "serverID";

        // Generate a new campaign ID and convert back to JSON
        // TODO: create a dialog asking whether to keep the same save ID (overwrite save in place, making it not loadable in previous / pre-JSON save versions) or generate a new one
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

    case ("clearData"):
    {
        _saveDataBox ctrlSetText "";
    };

    case ("toggleEdit"):
    {
        _saveDataBox ctrlEnable !(ctrlEnabled _saveDataBox);
    };

    case ("importPythia"):
    {
        // Clear and repopulate the file tree with available Pythia export files
        tvClear _fileTree;

        private _basePath = "a3u_exports/pythia";
        private _files = ["py3u.filesys.get_files", [_basePath, "^savedata.*\.json$"]] call py3_fnc_callExtension;
        if (isNil "_files" || {!(_files isEqualType [])}) exitWith {};

        // Group by subfolder; files directly in the base folder use ""
        private _baseDepth = count (_basePath splitString "/\");
        private _byFolder = createHashMap;
        {
            private _relative = (_x splitString "/\") select [_baseDepth];
            private _folder = ["", _relative#0] select (count _relative > 1);
            (_byFolder getOrDefault [_folder, [], true]) pushBack _x;
        } forEach _files;

        {
            private _folder = _x;
            private _folderFiles = _byFolder getOrDefault [_folder, []];
            if (_folderFiles isEqualTo []) then { continue };
            _folderFiles sort false;                    // timestamped names, newest first

            private _parentPath = [];
            if (_folder != "") then {
                _parentPath = [_fileTree tvAdd [[], _folder]];
            };
            {
                private _name = (_x splitString "/\") select -1;
                private _itemPath = _fileTree tvAdd [_parentPath, _name];
                _fileTree tvSetData [_parentPath + [_itemPath], _x];
            } forEach _folderFiles;
        } forEach ["", "daily", "weekly", "monthly", "yearly"];

        tvExpandAll _fileTree;
    };

    case ("exportPythia"):
    {
        // TODO: export save data to a JSON file via Pythia
        // should create a dialog asking whether to keep the same save ID or generate a new one
    };

    case ("importInidbi2"):
    {
        // TODO: import save data from an inidbi2 database
    };

    case ("exportInidbi2"):
    {
        // TODO: export save data to an inidbi2 database
    };

    case ("treeSelChanged"):
    {
        _params params ["_control", "_selectionPath"];

        private _filePath = _control tvData _selectionPath;
        private _saveData = ["py3u.filesys.read_data", [_filePath]] call py3_fnc_callExtension;
        
        if (_saveData isEqualTo "") exitWith {
            Error_1("File could not be read or returned empty data: %1",_filePath);
        };

        _saveDataBox ctrlSetText _saveData;
    };
};

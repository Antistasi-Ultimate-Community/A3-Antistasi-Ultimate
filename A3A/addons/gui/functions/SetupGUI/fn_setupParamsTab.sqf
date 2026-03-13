/*

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params["_mode", "_params"];

Debug("Params dialog called with mode %1", _mode);

// Get display
private _display = findDisplay A3A_IDD_SETUPDIALOG;
private _paramsTable = _display displayCtrl A3A_IDC_SETUP_PARAMSTABLE;
private _paramsType = _display displayCtrl A3A_IDC_SETUP_PARAMSTYPE;
private _presetSizeCtrl = _display displayCtrl A3A_IDC_SETUP_PARAMSPRESETS_SIZE;
private _presetDiffCtrl = _display displayCtrl A3A_IDC_SETUP_PARAMSPRESETS_DIFF;
private _presetCstmCtrl = _display displayCtrl A3A_IDC_SETUP_PARAMSPRESETS_CSTM;

switch (_mode) do
{
    case ("onLoad"):
    {
        // * Populate the preset dropdowns
        { ["populatePresetLB", [_x]] call A3A_fnc_setupParamsTab } forEach [_presetSizeCtrl, _presetDiffCtrl, _presetCstmCtrl];

        { ctrlEnable [_x, false] } forEach [A3A_IDC_SETUP_PARAMSPRESETS_CSTM_SAVEBUTTON, A3A_IDC_SETUP_PARAMSPRESETS_CSTM_RENAMEBUTTON, A3A_IDC_SETUP_PARAMSPRESETS_CSTM_DELETEBUTTON];

        // * Add event handler for custom preset name edit box
        private _presetNameCtrl = _display displayCtrl A3A_IDC_SETUP_PARAMSPRESETS_CSTM_NAME;
        _presetNameCtrl ctrlAddEventHandler ["EditChanged", {
            params ["_control", "_newText"];

            private _display = findDisplay A3A_IDD_SETUPDIALOG;
            private _presetSaveBtn = _display displayCtrl A3A_IDC_SETUP_PARAMSPRESETS_CSTM_SAVEBUTTON;
            private _presetRenameBtn = _display displayCtrl A3A_IDC_SETUP_PARAMSPRESETS_CSTM_RENAMEBUTTON;

            private _newTextValid = (trim _newText) isNotEqualTo "";
            _presetSaveBtn ctrlEnable (_newTextValid || {lbCurSel _presetCstmCtrl isNotEqualTo -1});
            _presetRenameBtn ctrlEnable _newTextValid;
        }];

        // * Populate the Parameter Type Dropdown
        private _basicParamsIndex =  _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_basic_label");
        private _balParamsIndex = _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_bal_label");
        private _eqpParamsIndex = _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_eqp_label");
        private _bldParamsIndex = _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_bld_label");
        private _devParamsIndex = _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_dev_label");
        private _extParamsIndex = _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_ext_label");

        _paramsType lbSetValue [_basicParamsIndex, 0];
        _paramsType lbSetValue [_balParamsIndex, 1];
        _paramsType lbSetValue [_eqpParamsIndex, 2];
        _paramsType lbSetValue [_bldParamsIndex, 3];
        _paramsType lbSetValue [_devParamsIndex, 4];
        _paramsType lbSetValue [_extParamsIndex, 5];
        
        _paramsType lbSetCurSel _basicParamsIndex;

        // * Create ALL the param controls
        private _allCtrls = [];
        private _allTextCtrls = [];
        private _allValsCtrls = [];
        {
            private _type = getText (_x/"type");
            private _title = getText (_x/"title");
            private _tooltip = getText (_x/"tooltip");
            private _texts = getArray (_x/"texts");
            private _vals = getArray (_x/"values");
            private _default = getNumber (_x/"default");
            private _defaultIndex = _vals find _default;

            if (!isNil "_title") then {
                private _textCtrl = _display ctrlCreate ["A3A_Text_Small", A3A_IDC_SETUP_PARAMSTEXT + _forEachIndex, _paramsTable];
                _allTextCtrls pushBack [configName _x, _textCtrl];
                _textCtrl ctrlEnable false;
                _textCtrl ctrlSetFade 1;
                _textCtrl ctrlSetText _title;
                if (_tooltip isNotEqualTo "") then {
                    _textCtrl ctrlSetTooltip _tooltip;
                };
                _textCtrl setVariable ["type", _type];
                _textCtrl ctrlCommit 0;
            };

            if (_title isNotEqualTo "" && {_texts isNotEqualTo []}) then {
                private _valsCtrl = _display ctrlCreate ["A3A_ComboBox_Small", A3A_IDC_SETUP_PARAMSVALS + _forEachIndex, _paramsTable];
                _allValsCtrls pushBack [configName _x, _valsCtrl];
                _valsCtrl ctrlEnable false;
                _valsCtrl ctrlSetFade 1;
                _valsCtrl setVariable ["config", _x];
                _valsCtrl setVariable ["locked", false];
                {
                    private _index = _valsCtrl lbAdd (_texts select _forEachIndex);
                    _valsCtrl lbSetValue [_index, _x];
                    if (_index isNotEqualTo _defaultIndex) then { _valsCtrl lbSetColor [_index, [0.85, 0.85, 0, 1]] };
                } forEach (_vals);
                _valsCtrl lbSetCurSel _defaultIndex;
                _valsCtrl ctrlCommit 0;
                _allCtrls pushBack _valsCtrl;

                _valsCtrl ctrlAddEventHandler ["LBSelChanged", { ["paramChangedHandler", _this] call A3A_fnc_setupParamsTab; }];
            };
        } forEach ("true" configClasses (A3A_SETUP_CONFIGFILE/"A3A"/"Params"));

        _paramsTable setVariable ["allCtrls", _allCtrls];
        _paramsTable setVariable ["allTextCtrls", _allTextCtrls];
        _paramsTable setVariable ["allValsCtrls", _allValsCtrls];

        ["update", [0]] call A3A_fnc_setupParamsTab;
    };

	case ("update"):
    {
        if (isNil "_params") then { _params = [lbCurSel A3A_IDC_SETUP_PARAMSTYPE] };
        _params params ["_filter"]; // * <SCALAR> (lbCurSel A3A_IDC_SETUP_PARAMSTYPE) if switching tabs, <STRING> (_searchString) if using parameter search; default to last tab (or first tab)

        private _filterExpression = if (_filter isEqualType 0) then {{
            private _shownTypes = (createHashMapFromArray[
                [0, ["Basic", "Scenario", "Member", "Script", "Timer"]],
                [1, ["AI", "Balance", "RebelBalance", "AIBalance", "MiscBalance"]],
                [2, ["BlackMarket", "Loot", "Unlocks", "Crates", "VehicleLoot", "MiscLoot"]],
                [3, ["Builder"]],
                [4, ["Experimental", "Development"]],
                [5, ["Extender"]]
            ]) getOrDefault[_filter, []];
            ((_this select 1) getVariable "type") in _shownTypes
        }} else {{
            params ["_cfgName", "_textCtrl"];
            private _allTextCtrls = _paramsTable getVariable "allTextCtrls";
            private _searchString = toLower _filter;
            private _searchResults = _allTextCtrls select {
                // find search string in (already localized) param title
                private _title = toLower ctrlText (_x select 1);
                (_title find _searchString) isNotEqualTo -1
            } apply {
                // result is the config name of the param
                _x select 0 
            };
            (_cfgName in _searchResults) 
        }};

        private _rowCount = -1;
        private _allValsCtrls = createHashMapFromArray (_paramsTable getVariable "allValsCtrls");
        {
            _x params ["_cfgName", "_textCtrl"];
            private _valsCtrl = _allValsCtrls get _cfgName;

            if (_x call _filterExpression) then {
                _rowCount = _rowCount + 1;
                _textCtrl ctrlEnable true;
                _textCtrl ctrlSetPosition [0, GRID_H*_rowCount*4, GRID_W*112, GRID_H*4];
                _textCtrl ctrlSetFade 0;

                if (!isNil "_valsCtrl") then {
                    _valsCtrl ctrlEnable !(_valsCtrl getVariable "locked");
                    _valsCtrl ctrlSetPosition [GRID_W*82, GRID_H*_rowCount*4, GRID_W*32, GRID_H*4];
                    _valsCtrl ctrlSetFade 0;
                };
            } else {
                _textCtrl ctrlEnable false;
                _textCtrl ctrlSetPosition [0, 0, 0, 0];
                _textCtrl ctrlSetFade 1;

                if (!isNil "_valsCtrl") then {
                    _valsCtrl ctrlEnable false;
                    _valsCtrl ctrlSetPosition [0, 0, 0, 0];
                    _valsCtrl ctrlSetFade 1;
                };
            };
            _textCtrl ctrlCommit 0;
            if (!isNil "_valsCtrl") then { _valsCtrl ctrlCommit 0 };
        } forEach (_paramsTable getVariable "allTextCtrls");   

        _paramsTable ctrlSetScrollValues [0,-1];
    };

    case ("fillParams"):
    {
        private _newGameCtrl = _display displayCtrl A3A_IDC_SETUP_NEWGAMECHECKBOX;
        private _copyGameCtrl = _display displayCtrl A3A_IDC_SETUP_COPYGAMECHECKBOX;

        
        private _selectedPreset = switch (true) do {
            case (lbCurSel _presetDiffCtrl isNotEqualTo -1): { [lbCurSel _presetSizeCtrl, lbCurSel _presetDiffCtrl] };
            case (lbCurSel _presetCstmCtrl isNotEqualTo -1): { [lbCurSel _presetCstmCtrl] };
        };
        private _presetParams = if (_selectedPreset isEqualType []) then { ["getPresetParams", [_selectedPreset]] call A3A_fnc_setupParamsTab };
        private _presetParamsHM = if (!isNil "_presetParams") then { createHashmapFromArray _presetParams } else { nil };
        
        // Should be array of [varname, value] pairs
        // Written by setupLoadgameTab
		private _savedParams = _display getVariable ["savedParams", []];
        private _savedParamsHM = createHashMapFromArray _savedParams;

        {
            private _saveExists = !isNil {serverInitDone} || {_savedParams isNotEqualTo [] && {!cbChecked _newGameCtrl || cbChecked _copyGameCtrl}};
            private _thisCtrl = _x;
            private _cfg = _x getVariable "config";
            private _vals = getArray (_cfg/"values");
            private _lockOnSave = (getNumber (_cfg/"lockOnSave")) isNotEqualTo 0;
            /*private _lockInGame = !isNil {serverInitDone} && {(getNumber (_cfg/"lockInGame")) isNotEqualTo 0};
            private _locked = _lockOnSave || _lockInGame;*/
            
            // clear old saved value if not in config options
            if (lbSize _x > count _vals) then { _x lbDelete (lbSize _x - 1) };

            private _saved = if (isNil "_presetParamsHM" || {_lockOnSave && _saveExists}) then { _savedParamsHM } else { _presetParamsHM } getOrDefault [configName _cfg, getNumber (_cfg/"default")];
            if (_saved isEqualType true) then { _saved = [0, 1] select _saved };            // bool -> number conversion

            private "_index";
            if !(_saved in _vals) then {
                // add saved value if not in config options 
                _index = _x lbAdd str _saved;
                _x lbSetValue [_index, _saved];
                _x lbSetCurSel _index;
            } else {
                _index = _vals find _saved; 
                _x lbSetCurSel _index;
            };

            {
                _thisCtrl lbSetColor [_forEachIndex, [[0.85, 0.85, 0, 1], [1, 1, 1, 1]] select (_forEachIndex isEqualTo _index)]
            } forEach _vals;

            ["updateParamLock", [[_x], _saveExists]] call A3A_fnc_setupParamsTab;
        } forEach (_paramsTable getVariable "allCtrls");
    };

    case ("getParams"):
    {
        private _params = (_paramsTable getVariable "allCtrls") apply {
            private _cfg = _x getVariable "config";
            private _val = _x lbValue lbCurSel _x;
            [configName _cfg, _val];
        };
        _params;
    };

    case ("getPresetParams"):
    {
        _params params ["_index"];
        
        private _presetParams = [];

        if (count _index > 1) then {
            _index params ["_sizeIndex", "_diffIndex"];
            private _presetSize = ["solo", "small", "medium", "large"] select (_sizeIndex);
            private _presetDiff = ["easy", "medium", "hard"] select (_diffIndex);
            
            {
                private _thisCtrl = _x;
                private _cfg = _x getVariable "config";
                private _presetClass = _cfg >> "difficulty" >> _presetSize;
                private _val = getNumber ([_cfg >> "default", _presetClass >> _presetDiff] select (isClass _presetClass));
                _presetParams pushBackUnique [configName _cfg, _val];
            } forEach (_paramsTable getVariable "allCtrls");
        } else {
            _presetParams = (parseSimpleArray (lbData [A3A_IDC_SETUP_PARAMSPRESETS_CSTM, _index select 0])) select 1;
        };

        _presetParams;
    };

    case ("populatePresetLB"):
    {
        _params params ["_lb"];

        switch (true) do {
            case (_lb isEqualTo _presetSizeCtrl): {
                private _presetSizeCtrl = _display displayCtrl A3A_IDC_SETUP_PARAMSPRESETS_SIZE;
                private _soloSizePrefix = _presetSizeCtrl lbAdd (localize "STR_antistasi_dialogs_setup_params_soloSize_label");
                private _smallSizePrefix = _presetSizeCtrl lbAdd (localize "STR_antistasi_dialogs_setup_params_smallSize_label");
                private _medSizePrefix = _presetSizeCtrl lbAdd (localize "STR_antistasi_dialogs_setup_params_medSize_label");
                private _largeSizePrefix = _presetSizeCtrl lbAdd (localize "STR_antistasi_dialogs_setup_params_largeSize_label");

                _presetSizeCtrl lbSetValue [_soloSizePrefix, 0];
                _presetSizeCtrl lbSetValue [_smallSizePrefix, 1];
                _presetSizeCtrl lbSetValue [_medSizePrefix, 2];
                _presetSizeCtrl lbSetValue [_largeSizePrefix, 3];
            };
            case (_lb isEqualTo _presetDiffCtrl): {
                private _presetDiffCtrl = _display displayCtrl A3A_IDC_SETUP_PARAMSPRESETS_DIFF;
                private _easyDiffPrefix = _presetDiffCtrl lbAdd (localize "STR_antistasi_dialogs_setup_params_easyDiff_label");
                private _medDiffPrefix = _presetDiffCtrl lbAdd (localize "STR_antistasi_dialogs_setup_params_medDiff_label");
                private _hardDiffPrefix = _presetDiffCtrl lbAdd (localize "STR_antistasi_dialogs_setup_params_hardDiff_label");

                _presetDiffCtrl lbSetValue [_easyDiffPrefix, 0];
                _presetDiffCtrl lbSetValue [_medDiffPrefix, 1];
                _presetDiffCtrl lbSetValue [_hardDiffPrefix, 2];
            };
            case (_lb isEqualTo _presetCstmCtrl): {
                private _customPresets = [] call A3A_fnc_collectParamPresetData;
                { ["addPresetToLB", [_x, _y]] call A3A_fnc_setupParamsTab } forEach (_customPresets);
            };
        };
    };

    case ("clearLBSelection"):
    {
        _params params ["_listboxes"];
        if !(_listboxes isEqualType []) then { _listboxes = [_listboxes] };

        {
            private _lb = _x;
            lbClear _lb;
            _lb lbSetCurSel -1;
            ["populatePresetLB", [_lb]] call A3A_fnc_setupParamsTab;
        } forEach _listboxes;
    };

    case ("updatePresetSelections"):
    {
        _params params ["_control", "_lbCurSel"];

        private _presetRenameBtn = _display displayCtrl A3A_IDC_SETUP_PARAMSPRESETS_CSTM_RENAMEBUTTON;
        private _presetDeleteBtn = _display displayCtrl A3A_IDC_SETUP_PARAMSPRESETS_CSTM_DELETEBUTTON;

        switch (true) do {
            case (_control isEqualTo _presetSizeCtrl && {_lbCurSel isNotEqualTo -1}): {
                private _diffIndex = lbCurSel _presetDiffCtrl;
                if (_diffIndex isEqualTo -1) then { _presetDiffCtrl lbSetCurSel 0 };
                ["clearLBSelection", [_presetCstmCtrl]] call A3A_fnc_setupParamsTab;
            };
            case (_control isEqualTo _presetDiffCtrl && {_lbCurSel isNotEqualTo -1}): {
                private _sizeIndex = lbCurSel _presetSizeCtrl;
                if (_sizeIndex isEqualTo -1) then { _presetSizeCtrl lbSetCurSel 0 };
                ["clearLBSelection", [_presetCstmCtrl]] call A3A_fnc_setupParamsTab;
            };
            case (_control isEqualTo _presetCstmCtrl && {_lbCurSel isNotEqualTo -1}): {
                ["clearLBSelection", [[_presetSizeCtrl, _presetDiffCtrl]]] call A3A_fnc_setupParamsTab;
            };
        };

        ctrlEnable [A3A_IDC_SETUP_PARAMSPRESETS_CSTM_SAVEBUTTON, lbCurSel _presetCstmCtrl isNotEqualTo -1 || {(trim ctrlText A3A_IDC_SETUP_PARAMSPRESETS_CSTM_NAME) isNotEqualTo ""}];
        ctrlEnable [A3A_IDC_SETUP_PARAMSPRESETS_CSTM_DELETEBUTTON, lbCurSel _presetCstmCtrl isNotEqualTo -1];

        ['fillParams'] call A3A_fnc_setupParamsTab;
    };

    case ("addPresetToLB"):
    {
        _params params ["_presetName", "_presetParams"];
        
        private _index = _presetCstmCtrl lbAdd _presetName;
        _presetCstmCtrl lbSetValue [_index, lbSize _presetCstmCtrl];
        _presetCstmCtrl lbSetData [_index, str [_presetName, _presetParams]]; // put the preset in lbData so we don't have to call collectParamPresetData again when selecting a preset
    };

    case ("savePreset"):
    {
        _params params ["_presetName", "_presetParams", ["_renamePreset", false]];

        private _newPreset = true;
        if (isNil "_presetName") then {
            _presetName = trim (ctrlText A3A_IDC_SETUP_PARAMSPRESETS_CSTM_NAME);
            if (_presetName isEqualTo "" && {lbcursel _presetCstmCtrl isNotEqualTo -1}) then {
                _presetName = (parseSimpleArray (lbData [A3A_IDC_SETUP_PARAMSPRESETS_CSTM, lbCurSel _presetCstmCtrl])) select 0;
                _newPreset = false;
            };
        };
        if (_presetName isEqualTo "") then { _presetName = format ["Preset %1", (lbSize _presetCstmCtrl) + 1] };
        if (isNil "_presetParams") then { _presetParams = ["getParams"] call A3A_fnc_setupParamsTab };
        [_presetName, _presetParams] call A3A_fnc_saveParamPreset;
        
        // Add the new preset to the custom presets dropdown and select it
        if (_newPreset || _renamePreset) then {
            ["addPresetToLB", [_presetName, _presetParams]] call A3A_fnc_setupParamsTab;
            _presetCstmCtrl lbSetCurSel ((lbSize _presetCstmCtrl) -1);
        };

        ctrlSetText [A3A_IDC_SETUP_PARAMSPRESETS_CSTM_NAME, ""];
    };

    case ("renamePreset"):
    {
        private _presetIndex = lbCurSel A3A_IDC_SETUP_PARAMSPRESETS_CSTM;
        private _presetData = parseSimpleArray (lbData [A3A_IDC_SETUP_PARAMSPRESETS_CSTM, _presetIndex]);
        private _presetParams = _presetData select 1;
        private _presetName = _presetData select 0;
        private _presetNameNew = ctrlText A3A_IDC_SETUP_PARAMSPRESETS_CSTM_NAME;

        ["deletePreset", [_presetName, _presetIndex]] call A3A_fnc_setupParamsTab;
        ["savePreset", [_presetNameNew, _presetParams, true]] call A3A_fnc_setupParamsTab;
    };

    case ("deletePreset"):
    {
        _params params ["_presetName", "_presetIndex"];

        if (isNil "_presetIndex") then { _presetIndex = lbCurSel A3A_IDC_SETUP_PARAMSPRESETS_CSTM };
        private _presetData = parseSimpleArray (lbData [A3A_IDC_SETUP_PARAMSPRESETS_CSTM, _presetIndex]);
        if (isNil "_presetName") then { _presetName = _presetData select 0 };
        [_presetName, [], true] call A3A_fnc_saveParamPreset;
        lbDelete [A3A_IDC_SETUP_PARAMSPRESETS_CSTM, _presetIndex];
    };

    case ("updateParamLock"):
    {
        _params params ["_controls", ["_saveExists", false]];
        _controls params ["_thisCtrl", "_depCtrl"];

        private _fnc_setLock = {
            params ["_lock", "_lockReason"];
            _thisCtrl setVariable ["locked", _lock];
            _thisCtrl ctrlEnable !(_lock);
            _thisCtrl ctrlSetTooltip _lockReason;
        };

        private _cfg = _thisCtrl getVariable "config";

        switch true do {
            case (_saveExists && {getNumber (_cfg/"lockOnSave") isEqualTo 1}): { [true, localize "STR_antistasi_dialogs_setup_param_locked_saveexists"] };
            case (!isNil {serverInitDone} && {getNumber (_cfg/"lockInGame") isEqualTo 1}): { [true, localize "STR_antistasi_dialogs_setup_param_locked_ingame"] };
            case (_thisCtrl getVariable ["lockedByDependency", false]): {
                private _dependencyTooltip = if (!isNil "_depCtrl") then { getTextRaw ((_depCtrl getVariable "config")/"dependencies"/(configName _cfg)/"dependencyTooltip") } else { "" };
                if (isNil "_dependencyTooltip" || {_dependencyTooltip isEqualTo ""}) then { _dependencyTooltip = "STR_antistasi_dialogs_setup_param_locked_bydependency" };
                [true, localize _dependencyTooltip]
            };
            case (call compile getText (_cfg/"lockCondition")): {
                private _lockCondTooltip = getTextRaw (_cfg/"lockConditionTooltip");
                if (isNil "_lockCondTooltip" || {_lockCondTooltip isEqualTo ""}) then { _lockCondTooltip = "STR_antistasi_dialogs_setup_param_locked_bycondition" };
                [true, localize _lockCondTooltip]
            };
            default { [false, ""] }
        } call _fnc_setLock;
    };

    case ("paramChangedHandler"):
    {
        _params params ["_thisCtrl", "_index"];

        // set the params changed variable for use when switching between saves or to / from new game
        private _newGame = cbChecked (_display displayCtrl A3A_IDC_SETUP_NEWGAMECHECKBOX);
        _display setVariable ["paramsChangedSinceReset", _newGame];
        
        // update dependent param values
        private _allValsCtrls = _paramsTable getVariable "allValsCtrls";
        private _dependencies = "true" configClasses ((_thisCtrl getVariable "config")/"dependencies");
        
        {
            private _cfg = _x;
            private _cfgName = configName _cfg;
            private _value = getNumber (_cfg/"value");
            private _depVal = [_cfg, "dependentValue"] call BIS_fnc_returnConfigEntry;
            private _lockByDep = getNumber (_cfg/"lockedByDependency") isEqualTo 1;

            private _depCtrl = _allValsCtrls select {_x select 0 isEqualTo _cfgName } select 0 select 1;
            private _depCfg = _depCtrl getVariable "config";
            
            if ((_thisCtrl lbValue _index) isEqualTo _value) then {
                private _depVals = getArray (_depCfg/"values");
                private _depIdx = _depVals find _depVal;
                if (!isNil "_depVal" && {_depIdx isNotEqualTo -1}) then { _depCtrl lbSetCurSel _depIdx };
                _depCtrl setVariable ["lockedByDependency", _lockByDep];
            } else {
                _depCtrl setVariable ["lockedByDependency", false];
            };

            ["updateParamLock", [[_depCtrl, _thisCtrl]]] call A3A_fnc_setupParamsTab;
        } forEach (_dependencies);

        // specific cases that change available faction selections
        // these are evaluated after dependencies mostly for different tooltip handling
        if (configName (_thisCtrl getVariable "config") isEqualTo "gameMode") then {
            private _invDisabled = (_thisCtrl lbValue _index) isEqualTo 3;
            private _invSelCtrl = _display displayCtrl A3A_IDC_SETUP_INVADERSLISTBOX;
            private _rivEnaCtrl = _allValsCtrls select {_x select 0 isEqualTo "areRivalsEnabled" } select 0 select 1;

            _invSelCtrl ctrlEnable !_invDisabled;
            _invSelCtrl ctrlSetTooltip (localize (["", "STR_antistasi_dialogs_setup_inv_disabled"] select _invDisabled));
            _rivEnaCtrl ctrlSetTooltip (localize (["", "STR_antistasi_dialogs_setup_riv_param_warning"] select _invDisabled));
        };

        if (configName (_thisCtrl getVariable "config") isEqualTo "areRivalsEnabled") then {
            private _rivDisabled = (_thisCtrl lbValue _index) isEqualTo 0;
            private _rivSelCtrl = _display displayCtrl A3A_IDC_SETUP_RIVALSLISTBOX;

            _rivSelCtrl ctrlEnable !_rivDisabled;
            _rivSelCtrl ctrlSetTooltip (localize (["", "STR_antistasi_dialogs_setup_riv_disabled"] select _rivDisabled));
        };
    };

    case ("updateSearch"):
    {
        private _searchEditBox = _display displayCtrl A3A_IDC_SETUP_PARAMSSEARCH_EDITBOX;
        private _searchButton = _display displayCtrl A3A_IDC_SETUP_PARAMSSEARCH_BUTTON;
        private _searchString = ctrlText _searchEditBox;
        private _searchActive = _searchButton getVariable ["active", true];


        if (_searchActive && {_searchString isNotEqualTo ""}) then {
            _searchEditBox ctrlEnable false;
            _searchButton setVariable ["active", false];
            _searchButton ctrlSetText ("\A3\ui_f\data\GUI\RscCommon\RscButtonSearch\search_end_ca.paa");
            ["update", [_searchString]] call A3A_fnc_setupParamsTab;
        } else {
            _searchEditBox ctrlSetText "";
            _searchEditBox ctrlEnable true;
            _searchButton setVariable ["active", true];
            _searchButton ctrlSetText ("\A3\ui_f\data\GUI\RscCommon\RscButtonSearch\search_start_ca.paa");
            ["update", [lbCurSel A3A_IDC_SETUP_PARAMSTYPE]] call A3A_fnc_setupParamsTab;
        };
    };
};

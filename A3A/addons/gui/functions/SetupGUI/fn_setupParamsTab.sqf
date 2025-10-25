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

switch (_mode) do
{
    case ("onLoad"):
    {
        // * Populate the preset dropdowns
        private _presetSizeCtrl = _display displayCtrl A3A_IDC_SETUP_PARAMSPRESETS_SIZE;
        private _soloSizePrefix = _presetSizeCtrl lbAdd (localize "STR_antistasi_dialogs_setup_params_soloSize_label");
        private _smallSizePrefix = _presetSizeCtrl lbAdd (localize "STR_antistasi_dialogs_setup_params_smallSize_label");
        private _medSizePrefix = _presetSizeCtrl lbAdd (localize "STR_antistasi_dialogs_setup_params_medSize_label");
        private _largeSizePrefix = _presetSizeCtrl lbAdd (localize "STR_antistasi_dialogs_setup_params_largeSize_label");

        _presetSizeCtrl lbSetValue [_soloSizePrefix, 0];
        _presetSizeCtrl lbSetValue [_smallSizePrefix, 1];
        _presetSizeCtrl lbSetValue [_medSizePrefix, 2];
        _presetSizeCtrl lbSetValue [_largeSizePrefix, 3];

        private _presetDiffCtrl = _display displayCtrl A3A_IDC_SETUP_PARAMSPRESETS_DIFF;
        private _easyDiffPrefix = _presetDiffCtrl lbAdd (localize "STR_antistasi_dialogs_setup_params_easyDiff_label");
        private _medDiffPrefix = _presetDiffCtrl lbAdd (localize "STR_antistasi_dialogs_setup_params_medDiff_label");
        private _hardDiffPrefix = _presetDiffCtrl lbAdd (localize "STR_antistasi_dialogs_setup_params_hardDiff_label");

        _presetDiffCtrl lbSetValue [_easyDiffPrefix, 0];
        _presetDiffCtrl lbSetValue [_medDiffPrefix, 1];
        _presetDiffCtrl lbSetValue [_hardDiffPrefix, 2];

        // * Populate the Parameter Type Dropdown
        private _basicParamsIndex =  _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_basic_label");
        private _advParamsIndex = _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_adv_label");
        private _expParamsIndex = _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_exp_label");
        private _extParamsIndex = _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_ext_label");
        private _devParamsIndex = _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_dev_label");

        _paramsType lbSetValue [_basicParamsIndex, 0];
        _paramsType lbSetValue [_advParamsIndex, 1];
        _paramsType lbSetValue [_expParamsIndex, 2];
        _paramsType lbSetValue [_extParamsIndex, 3];
        _paramsType lbSetValue [_devParamsIndex, 4];

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

            if (_title isNotEqualTo "" && {_texts isNotEqualTo [""]}) then {
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

                _valsCtrl ctrlAddEventHandler ["LBSelChanged", {
                    private _display = findDisplay A3A_IDD_SETUPDIALOG;
                    private _newGame = cbChecked (_display displayCtrl A3A_IDC_SETUP_NEWGAMECHECKBOX);
                    _display setVariable ["paramsChangedSinceReset", _newGame];
                }];

                if (configName _x isEqualTo "gameMode") then {
                    _valsCtrl ctrlAddEventHandler ["LBSelChanged", {
                        params ["_thisCtrl", "_index"];
                        private _display = findDisplay A3A_IDD_SETUPDIALOG;
                        private _invDisabled = (_thisCtrl lbValue _index) isEqualTo 3;
                        private _invSelCtrl = _display displayCtrl A3A_IDC_SETUP_INVADERSLISTBOX;
                        private _rivEnaCtrl = _display displayCtrl (ctrlIDC _thisCtrl + 1);

                        if (_invDisabled) then {
                            _invSelCtrl ctrlEnable false;
                            _invSelCtrl ctrlSetTooltip (localize "STR_antistasi_dialogs_setup_inv_disabled");
                            _rivEnaCtrl lbSetCurSel 0;
                            _rivEnaCtrl ctrlSetTooltip (localize "STR_antistasi_dialogs_setup_riv_param_warning");
                        } else {
                            _invSelCtrl ctrlEnable true;
                            _invSelCtrl ctrlSetTooltip "";
                            _rivEnaCtrl ctrlSetTooltip "";
                        };
                    }];
                };

                if (configName _x isEqualTo "areRivalsEnabled") then {
                    _valsCtrl ctrlAddEventHandler ["LBSelChanged", {
                        params ["_thisCtrl", "_index"];
                        private _display = findDisplay A3A_IDD_SETUPDIALOG;
                        private _rivDisabled = (_thisCtrl lbValue _index) isEqualTo 0;
                        private _rivSelCtrl = _display displayCtrl A3A_IDC_SETUP_RIVALSLISTBOX;

                        if (_rivDisabled) then {
                            _rivSelCtrl ctrlEnable false;
                            _rivSelCtrl ctrlSetTooltip (localize "STR_antistasi_dialogs_setup_riv_disabled");
                        } else {
                            _rivSelCtrl ctrlEnable true;
                            _rivSelCtrl ctrlSetTooltip "";
                        };
                    }];
                };

                if (configName _x isEqualTo "minWeaps") then {
                    _valsCtrl ctrlAddEventHandler ["LBSelChanged", {
                        params ["_thisCtrl", "_index"];
                        private _display = findDisplay A3A_IDD_SETUPDIALOG;
                        private _unlocksDisabled = (_thisCtrl lbValue _index) isEqualTo -1;
                        private _unlockMagazinesCtrl = _display displayCtrl (ctrlIDC _thisCtrl + 2);
                        private _unlockGLaunchersCtrl = _display displayCtrl (ctrlIDC _thisCtrl + 3);
                        private _unlockExplosivesCtrl = _display displayCtrl (ctrlIDC _thisCtrl + 4);

                        if (_unlocksDisabled) then {
                            for "_i" from 2 to 4 do {
                                private _ctrl = _display displayCtrl (ctrlIDC _thisCtrl + _i);
                                _ctrl lbSetCurSel 1;
                                _ctrl ctrlSetTooltip (localize "STR_antistasi_dialogs_setup_unlocks_disabled");
                                _ctrl setVariable ["locked", true];
                                _ctrl ctrlEnable false;
                            };
                        } else {
                            for "_i" from 2 to 4 do {
                                private _ctrl = _display displayCtrl (ctrlIDC _thisCtrl + _i);
                                _ctrl ctrlSetTooltip "";
                                _ctrl setVariable ["locked", false];
                                _ctrl ctrlEnable true;
                            };
                        };
                    }];
                };

                if (configName _x isEqualTo "minWeaps") then {
                    _valsCtrl ctrlAddEventHandler ["LBSelChanged", {
                        params ["_thisCtrl", "_index"];
                        private _display = findDisplay A3A_IDD_SETUPDIALOG;
                        private _unlocksDisabled = (_thisCtrl lbValue _index) isEqualTo -1;
                        private _unlockMagazinesCtrl = _display displayCtrl (ctrlIDC _thisCtrl + 2);
                        private _unlockGLaunchersCtrl = _display displayCtrl (ctrlIDC _thisCtrl + 3);
                        private _unlockExplosivesCtrl = _display displayCtrl (ctrlIDC _thisCtrl + 4);

                        if (_unlocksDisabled) then {
                            for "_i" from 2 to 4 do {
                                private _ctrl = _display displayCtrl (ctrlIDC _thisCtrl + _i);
                                _ctrl lbSetCurSel 1;
                                _ctrl ctrlSetTooltip (localize "STR_antistasi_dialogs_setup_unlocks_disabled");
                                _ctrl setVariable ["locked", true];
                                _ctrl ctrlEnable false;
                            };
                        } else {
                            for "_i" from 2 to 4 do {
                                private _ctrl = _display displayCtrl (ctrlIDC _thisCtrl + _i);
                                _ctrl ctrlSetTooltip "";
                                _ctrl setVariable ["locked", false];
                                _ctrl ctrlEnable true;
                            };
                        };
                    }];
                };
            };
        } forEach ("true" configClasses (A3A_SETUP_CONFIGFILE/"A3A"/"Params"));

        _paramsTable setVariable ["allCtrls", _allCtrls];
        _paramsTable setVariable ["allTextCtrls", _allTextCtrls];
        _paramsTable setVariable ["allValsCtrls", _allValsCtrls];

        ["update"] call A3A_fnc_setupParamsTab;
    };

	case ("update"):
    {
        private _shownTypes = switch (lbCurSel A3A_IDC_SETUP_PARAMSTYPE) do {
            case (-1): { [] }; // lbCurSel is -1 until params tab is loaded
            case (0): { ["Basic"] };
            case (1): { ["Ultimate", "Script", "Plus", "Member", "Builder", "Balance", "Equipment", "Loot"] };
            case (2): { ["Experimental"] };
            case (3): { ["Extender"] };
            case (4): { ["Development"] };
        };

        private _rowCount = -1;
        private _allValsCtrls = createHashMapFromArray (_paramsTable getVariable "allValsCtrls");
        {
            private _textCtrl = _x select 1;
            private _valsCtrl = _allValsCtrls get (_x select 0);

            if ((_textCtrl getVariable "type") in _shownTypes) then {
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

        private _presetSizeCtrl = _display displayCtrl A3A_IDC_SETUP_PARAMSPRESETS_SIZE;
        private _presetDiffCtrl = _display displayCtrl A3A_IDC_SETUP_PARAMSPRESETS_DIFF;
        private _presetCstmCtrl = _display displayCtrl A3A_IDC_SETUP_PARAMSPRESETS_CSTM;

        private _selectedPreset = switch (true) do {
            //case (lbCurSel _presetCstmCtrl isNotEqualTo -1): { /* what follows is pseudo-code */ (saveData get ["customParamPresets", createHashMap]) get (lbValue lbCurSel _presetCstmCtrl)};
            case (lbCurSel _presetDiffCtrl isNotEqualTo -1): { ["getPresetParams", [lbCurSel _presetSizeCtrl, lbCurSel _presetDiffCtrl]] call A3A_fnc_setupParamsTab };
        };
        
        // Should be array of [varname, value] pairs
        // Written by setupLoadgameTab
		private _savedParams = [_display getVariable ["savedParams", []], _selectedPreset] select (_selectedPreset isEqualType []);
        private _savedParamsHM = createHashMapFromArray _savedParams;

        {
            private _thisCtrl = _x;
            private _cfg = _x getVariable "config";
            private _vals = getArray (_cfg/"values");
            // clear old saved value if not in config options
            if (lbSize _x > count _vals) then { _x lbDelete (lbSize _x - 1) };

            private _saved = _savedParamsHM getOrDefault [configName _cfg, getNumber (_cfg/"default")];
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

            if (_savedParams isNotEqualTo [] && {!cbChecked _newGameCtrl || cbChecked _copyGameCtrl}) then { // we're loading an existing save
                private _locked = (getNumber (_cfg/"lockOnSave")) isNotEqualTo 0;
                _x setVariable ["locked", _locked];

                if (_locked) then {
                    _x ctrlEnable false;
                    _x ctrlSetTooltip (localize "STR_antistasi_dialogs_setup_param_locked");
                };
            } else {
                // reset params to enabled if we're creating a new game or if all we did was load old params (to create a new game)
                _x setVariable ["locked", false];
                _x ctrlEnable true;
                _x ctrlSetTooltip "";
            };
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
        _params params ["_sizeIndex", "_diffIndex"];
        private _presetSize = ["solo", "small", "medium", "large"] select (_sizeIndex);
        private _presetDiff = ["easy", "medium", "hard"] select (_diffIndex);
        
        private _presetParams = [];
        {
            private _thisCtrl = _x;
            private _cfg = _x getVariable "config";
            private _presetClass = _cfg >> "difficulty" >> _presetSize;
            private _val = getNumber ([_cfg >> "default", _presetClass >> _presetDiff] select (isClass _presetClass));
            _presetParams pushBackUnique [configName _cfg, _val];
        } forEach (_paramsTable getVariable "allCtrls");

        _presetParams;
    };

    case ("updatePresetSelections"):
    {
        _params params ["_control", "_lbCurSel"];

        private _presetSizeCtrl = _display displayCtrl A3A_IDC_SETUP_PARAMSPRESETS_SIZE;
        private _presetDiffCtrl = _display displayCtrl A3A_IDC_SETUP_PARAMSPRESETS_DIFF;
        private _presetCstmCtrl = _display displayCtrl A3A_IDC_SETUP_PARAMSPRESETS_CSTM;

        switch (true) do {
            case (_control isEqualTo _presetSizeCtrl && {_lbCurSel isNotEqualTo -1}): {
                private _diffIndex = lbCurSel _presetDiffCtrl;
                if (_diffIndex isEqualTo -1) then { _presetDiffCtrl lbSetCurSel 0 };
                _presetCstmCtrl lbSetCurSel -1;
            };
            case ((_control isEqualTo _presetCstmCtrl && {_lbCurSel isNotEqualTo -1}) || {!(_control in [_presetSizeCtrl, _presetDiffCtrl, _presetCstmCtrl])}): {
                _presetSizeCtrl lbSetCurSel -1;
                _presetDiffCtrl lbSetCurSel -1;
            };
        };
    };

    /*
    case ("savePreset"):
    {
        //
    };

    case ("renamePreset"):
    {
        //
    };

    case ("deletePreset"):
    {
        //
    };
    */
};


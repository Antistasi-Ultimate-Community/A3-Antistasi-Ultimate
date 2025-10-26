
class A3A_SetupDialog : A3A_TabbedDialog
{
    idd = A3A_IDD_SETUPDIALOG;
    onLoad = "['on'] call SCRT_fnc_ui_toggleMenuBlur;['onLoad'] spawn A3A_fnc_setupDialog";
    onUnload = "['off'] call SCRT_fnc_ui_toggleMenuBlur;['onUnload'] call A3A_fnc_setupDialog";

    class Controls
    {
        class TitlebarText : A3A_TitlebarText
        {
            idc = A3A_IDC_SETUP_TITLEBAR;
            text = $STR_antistasi_dialogs_setup_titlebar;
            x = DIALOG_X;
            y = DIALOG_Y - 10 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;
        };

        class TabButtons : A3A_ControlsGroupNoScrollbars
        {
            idc = A3A_IDC_SETUP_TABBUTTONS;
            x = DIALOG_X;
            y = DIALOG_Y - 5 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;

            class Controls
            {
                class LoadgameTabButton : A3A_Button
                {
                    idc = A3A_IDC_SETUP_LOADGAMETABBUTTON;
                    text = $STR_antistasi_dialogs_setup_loadgame_tab_button;
                    onButtonClick = "['switchTab', ['loadgame']] call A3A_fnc_setupDialog;";
                    x = 0;
                    y = 0;
                    w = 30 * GRID_W;
                    h = 5 * GRID_H;
                };

                class FactionTabButton : A3A_Button
                {
                    idc = A3A_IDC_SETUP_FACTIONTABBUTTON;
                    text = $STR_antistasi_dialogs_setup_faction_tab_button;
                    onButtonClick = "['switchTab', ['factions']] call A3A_fnc_setupDialog;";
                    x = 30 * GRID_W;
                    y = 0;
                    w = 30 * GRID_W;
                    h = 5 * GRID_H;
                };

                class ParamsTabButton : A3A_Button
                {
                    idc = A3A_IDC_SETUP_PARAMSTABBUTTON;
                    text = $STR_antistasi_dialogs_setup_params_tab_button;
                    onButtonClick = "['switchTab', ['params']] call A3A_fnc_setupDialog;";
                    x = 60 * GRID_W;
                    y = 0;
                    w = 30 * GRID_W;
                    h = 5 * GRID_H;
                };

                class StartGame: A3A_Button {
                    idc = A3A_IDC_SETUP_STARTBUTTON;
                    text = $STR_antistasi_dialogs_setup_start_game;
                    onButtonClick = "['startGame'] call A3A_fnc_setupLoadgameTab";
                    x = 90 * GRID_W;
                    y = 0 * GRID_H;
                    w = 32 * GRID_W;
                    h = 5 * GRID_H;
                };

                class SaveInfoText : A3A_Text
                {
                    idc = A3A_IDC_SETUP_SAVEINFOTEXT;
                    x = 122 * GRID_W;
                    y = 0;
                    w = 38 * GRID_W;
                    h = 5 * GRID_H;
                    colorBackground[] = A3A_COLOR_BUTTON_BACKGROUND;
                    style = ST_CENTER;
                    font = A3A_BUTTON_FONT;
                };
            };
        };


        ///////////////
        // MAIN TABS //
        ///////////////

        class LoadgameTab : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_SETUP_LOADGAMETAB;
            onLoad = "['onLoad'] spawn A3A_fnc_setupLoadgameTab";
            show = false;

            class Controls
            {
                class SavedGamesLabel: A3A_SectionLabelRight {
                    idc = -1;
                    text = $STR_antistasi_dialogs_setup_saved_games;
                    x = 4 * GRID_W;
                    y = 4 * GRID_H;
                    w = 118 * GRID_W;
                    h = 4 * GRID_H;
                };
                class SavedGamesBackground: A3A_Background {
                    idc = -1;
                    x = 4 * GRID_W;
                    y = 8 * GRID_H;
                    w = 118 * GRID_W;
                    h = 80 * GRID_H;
                };
                class SavedGamesHeader : A3A_ControlsGroupNoScrollbars
                {
                    idc = A3A_IDC_SETUP_SAVESHEADER;
                    x = 4 * GRID_W;
                    y = 8 * GRID_H;
                    w = 118 * GRID_W;
                    h = 4 * GRID_H;
                };
                class SavedGamesTable : A3A_ControlsGroup       // hopefully has scrollbars
                {
                    idc = A3A_IDC_SETUP_SAVESLISTBOX;
                    onMouseButtonUp = "['saveListClick', _this] call A3A_fnc_setupLoadgameTab";
                    onMouseButtonDblClick = "['saveListDoubleClick', _this] call A3A_fnc_setupLoadgameTab";
                    x = 4 * GRID_W;
                    y = 12 * GRID_H;
                    w = 118 * GRID_W;
                    h = 76 * GRID_H;

                    class Controls
                    {
                        class SavedGamesSelector: A3A_Background {
                            idc = A3A_IDC_SETUP_GAMESELECTBOX;
                            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
                            x = 0 * GRID_W;
                            y = 0 * GRID_H;
                            w = 118 * GRID_W;
                            h = 4 * GRID_H;
                        };
                    };
                };

                class SaveNameLabel: A3A_SectionLabelRight {
                    idc = -1;
                    text = $STR_antistasi_dialogs_setup_new_save_name;
                    x = 4 * GRID_W;
                    y = 91 * GRID_H;
                    w = 24 * GRID_W;
                    h = 5 * GRID_H;
                };
                class SaveNameEditBox: A3A_Edit {
                    idc = A3A_IDC_SETUP_NAMEEDITBOX;
                    x = 28 * GRID_W;
                    y = 91 * GRID_H;
                    w = 94 * GRID_W;
                    h = 5 * GRID_H;
                };

                // Game load options
                class GameOptionsGroup : A3A_ControlsGroupNoScrollbars {
                    x = 126 * GRID_W;
                    y = 4 * GRID_H;
                    w = 30 * GRID_W;
                    h = 37 * GRID_H;

                    class controls {
                        class GameOptions: A3A_Text {
                            idc = A3A_IDC_SETUP_LOADGAMEOPTIONS;
                            text = $STR_antistasi_dialogs_setup_load_game_options;
                            x = 0;
                            y = 0;
                            w = 30 * GRID_W;
                            h = 4 * GRID_H;
                            colorBackground[] = A3A_COLOR_BUTTON_BACKGROUND;
                            style = ST_CENTER + ST_UPPERCASE;
                            font = A3A_BUTTON_FONT;
                        };
                        class GameOptionsBackground: A3A_Background {
                            idc = -1;
                            x = 0;
                            y = 4 * GRID_H;
                            w = 30 * GRID_W;
                            h = 26 * GRID_H;
                        };
                        class NewGameCheck: A3A_Checkbox {
                            idc = A3A_IDC_SETUP_NEWGAMECHECKBOX;
                            onCheckedChanged = "['newGameCheck'] call A3A_fnc_setupLoadgameTab";
                            x = 0;
                            y = 6 * GRID_H;
                            w = 4 * GRID_W;
                            h = 4 * GRID_H;
                        };
                        class NewGameText: A3A_text {
                            idc = -1;
                            text = $STR_antistasi_dialogs_setup_create_new_game;
                            x = 4 * GRID_W;
                            y = 6 * GRID_H;
                            w = 26 * GRID_W;
                            h = 4 * GRID_H;
                        };
                        class CopyGameCheck: NewGameCheck {
                            idc = A3A_IDC_SETUP_COPYGAMECHECKBOX;
                            onCheckedChanged = "['copyGameCheck'] call A3A_fnc_setupLoadgameTab";
                            y = 12 * GRID_H;
                        };
                        class CopyGameText: NewGameText {
                            idc = A3A_IDC_SETUP_COPYGAMETEXT;
                            text = $STR_antistasi_dialogs_setup_copy_old_game;
                            y = 12 * GRID_H;
                        };
                        class OldParamsCheck: NewGameCheck {
                            idc = A3A_IDC_SETUP_OLDPARAMSCHECKBOX;
                            onCheckedChanged = "['oldParamsCheck'] call A3A_fnc_setupLoadgameTab";
                            y = 18 * GRID_H;
                        };
                        class OldParamsText: NewGameText {
                            idc = A3A_IDC_SETUP_OLDPARAMSTEXT;
                            text = $STR_antistasi_dialogs_setup_load_old_params;
                            y = 18 * GRID_H;
                        };
                        class NewNamespaceCheck: NewGameCheck {
                            idc = A3A_IDC_SETUP_NAMESPACECHECKBOX;
                            onCheckedChanged = "['newNamespaceCheck'] call A3A_fnc_setupLoadgameTab";
                            y = 24 * GRID_H;
                        };
                        class NewNamespaceText: NewGameText {
                            idc = A3A_IDC_SETUP_NAMESPACETEXT;
                            text = $STR_antistasi_dialogs_setup_use_new_namespace;
                            y = 24 * GRID_H;
                        };
                        class SetHQPosButton: A3A_Button {
                            idc = A3A_IDC_SETUP_HQPOSBUTTON;
                            text = $STR_antistasi_dialogs_setup_set_hq_position;
                            onButtonClick = "['setHQPos'] call A3A_fnc_setupLoadgameTab";
                            x = 0;
                            y = 32 * GRID_H;
                            w = 30 * GRID_W;
                            h = 5 * GRID_H;
                        };
                    };
                };

                class DeleteButton: A3A_Button {
                    idc = A3A_IDC_SETUP_DELETEBUTTON;
                    text = $STR_antistasi_dialogs_setup_delete_game;
                    onButtonClick = "['deleteGame'] call A3A_fnc_setupLoadgameTab";
                    x = 126 * GRID_W;
                    y = 84 * GRID_H;
                    w = 30 * GRID_W;
                    h = 5 * GRID_H;
                };
                class RenameButton: A3A_Button {
                    idc = A3A_IDC_SETUP_RENAMEBUTTON;
                    text = $STR_antistasi_dialogs_setup_rename_game;
                    onButtonClick = "['renameGame'] call A3A_fnc_setupLoadgameTab";
                    x = 126 * GRID_W;
                    y = 91 * GRID_H;
                    w = 30 * GRID_W;
                    h = 5 * GRID_H;
                };
            };
        };

        class FactionsTab : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_SETUP_FACTIONSTAB;
            //onLoad = "['onLoad'] spawn A3A_fnc_setupFactionsTab";
            show = false;

            class Controls
            {
                class RebelsLabel: A3A_SectionLabelRight {
                    idc = A3A_IDC_SETUP_REBELSLABEL;
                    text = $STR_antistasi_dialogs_setup_rebels;
                    x = 4 * GRID_W;
                    y = 4 * GRID_H;
                    w = 38 * GRID_W;
                    h = 4 * GRID_H;
                };
                class RebelsListBox: A3A_Listbox_Small {
                    idc = A3A_IDC_SETUP_REBELSLISTBOX;
                    onLBSelChanged = "['factionSelected', _this] call A3A_fnc_setupFactionsTab";
                    x = 4 * GRID_W;
                    y = 8 * GRID_H;
                    w = 38 * GRID_W;
                    h = 40 * GRID_H;
                };

                class CiviliansLabel: RebelsLabel {
                    idc = A3A_IDC_SETUP_CIVILIANSLABEL;
                    text = $STR_antistasi_dialogs_setup_civilians;
                    y = 50 * GRID_H;
                };
                class CiviliansListBox: RebelsListBox {
                    idc = A3A_IDC_SETUP_CIVILIANSLISTBOX;
                    y = 54 * GRID_H;
                    h = 42 * GRID_H;
                };

                class OccupantsLabel: RebelsLabel {
                    idc = A3A_IDC_SETUP_OCCUPANTSLABEL;
                    text = $STR_antistasi_dialogs_setup_occupants;
                    x = 44 * GRID_W;
                };
                class OccupantsListBox: RebelsListBox {
                    idc = A3A_IDC_SETUP_OCCUPANTSLISTBOX;
                    x = 44 * GRID_W;
                    h = 88 * GRID_H;
                };

                class InvadersLabel: RebelsLabel {
                    idc = A3A_IDC_SETUP_INVADERSLABEL;
                    text = $STR_antistasi_dialogs_setup_invaders;
                    x = 84 * GRID_W;
                };
                class InvadersListBox: RebelsListBox {
                    idc = A3A_IDC_SETUP_INVADERSLISTBOX;
                    x = 84 * GRID_W;
                };

                class RivalsLabel: RebelsLabel {
                    idc = A3A_IDC_SETUP_RIVALSLABEL;
                    text = $STR_antistasi_dialogs_setup_rivals;
                    x = 84 * GRID_W;
                    y = 50 * GRID_H;
                };
                class RivalsListBox: RebelsListBox {
                    idc = A3A_IDC_SETUP_RIVALSLISTBOX;
                    x = 84 * GRID_W;
                    y = 54 * GRID_H;
                    h = 42 * GRID_H;
                };

                // Faction Availability Modifiers
                class ModifiersGroup : A3A_ControlsGroupNoScrollbars {
                    idc = A3A_IDC_SETUP_OVERRIDES;
                    x = 124 * GRID_W;
                    y = 4 * GRID_H;
                    w = 32 * GRID_W;
                    h = 20 * GRID_H;

                    class controls {
                        class Label: A3A_SectionLabelRight {
                            idc = -1;
                            text = $STR_antistasi_dialogs_setup_overrides;
                            x = 0;
                            y = 0;
                            w = 32 * GRID_W;
                            h = 4 * GRID_H;
                        };
                        class Background: A3A_Background {
                            idc = -1;
                            x = 0;
                            y = 4 * GRID_H;
                            w = 32 * GRID_W;
                            h = 16 * GRID_H;
                        };
                        class SwitchEnemyCheck: A3A_Checkbox {
                            idc = A3A_IDC_SETUP_SWITCHENEMYCHECK;
                            onCheckedChanged = "['fillFactions'] call A3A_fnc_setupFactionsTab";
                            x = 0;
                            y = 4 * GRID_H;
                            w = 4 * GRID_W;
                            h = 4 * GRID_H;
                        };
                        class SwitchEnemyText: A3A_text {
                            idc = -1;
                            text = $STR_antistasi_dialogs_setup_switch_enemy_sides;
                            x = 4 * GRID_W;
                            y = 4 * GRID_H;
                            w = 28 * GRID_W;
                            h = 4 * GRID_H;
                        };
                        class AnyEnemyCheck: SwitchEnemyCheck {
                            idc = A3A_IDC_SETUP_ANYENEMYCHECK;
                            y = 8 * GRID_H;
                        };
                        class AnyEnemyText: SwitchEnemyText {
                            text = $STR_antistasi_dialogs_setup_override_side_limits;
                            y = 8 * GRID_H;
                        };
                        class IgnoreCamoCheck: SwitchEnemyCheck {
                            idc = A3A_IDC_SETUP_IGNORECAMOCHECK;
                            y = 12 * GRID_H;
                        };
                        class IgnoreCamoText: SwitchEnemyText {
                            text = $STR_antistasi_dialogs_setup_override_camo_limits;
                            y = 12 * GRID_H;
                        };
                        class ShowMissingCheck: SwitchEnemyCheck {
                            idc = A3A_IDC_SETUP_SHOWMISSINGCHECK;
                            y = 16 * GRID_H;
                        };
                        class ShowMissingText: SwitchEnemyText {
                            text = $STR_antistasi_dialogs_setup_show_missing_mods;
                            y = 16 * GRID_H;
                        };
                    };
                };                

                // DLC Content
                class DLCContentGroup : ModifiersGroup {
                    idc = A3A_IDC_SETUP_DLCCONTENT;
                    y = 26 * GRID_H;
                    h = 22 * GRID_H;

                    class controls : controls {
                        class Label: Label {
                            idc = A3A_IDC_SETUP_DLCCONTENT_LABEL;
                            text = $STR_antistasi_dialogs_setup_dlc;
                        };
                        class Background: Background {
                            idc = A3A_IDC_SETUP_DLCCONTENT_BG;
                            h = 18 * GRID_H;
                        };
                        class Box: A3A_ControlsGroupNoHScrollbars {
                            idc = A3A_IDC_SETUP_DLCCONTENT_BOX;
                            x = 0;
                            y = 4 * GRID_H;
                            w = 32 * GRID_W;
                            h = 18 * GRID_H;
                        };
                    };
                };

                // Addon Content
                class AddonContentGroup : DLCContentGroup {
                    idc = A3A_IDC_SETUP_ADDONCONTENT;
                    y = 50 * GRID_H;
                    h = 46 * GRID_H;

                    class controls : controls {
                        class Label: Label {
                            idc = A3A_IDC_SETUP_ADDONCONTENT_LABEL;
                            text = $STR_antistasi_dialogs_setup_addonvics;
                        };
                        class Background: Background {
                            idc = A3A_IDC_SETUP_ADDONCONTENT_BG;
                            h = 42 * GRID_H;
                        };
                        class Box: Box {
                            idc = A3A_IDC_SETUP_ADDONCONTENT_BOX;
                            h = 42 * GRID_H;
                        };
                    };
                };
            };
        };

        class ParamsTab : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_SETUP_PARAMSTAB;
            onLoad = "['onLoad'] spawn A3A_fnc_setupParamsTab";
            show = false;

            class Controls
            {
                class ParamsTypesComboBox: A3A_ComboBox {
                    idc = A3A_IDC_SETUP_PARAMSTYPE;
                    colorBackground[] = {0,0,0,1};
                    onLBSelChanged = "['update'] call A3A_fnc_setupParamsTab";
                    x = 4 * GRID_W;
                    y = 4 * GRID_H;
                    w = 118 * GRID_W;
                    h = 4 * GRID_H;
                };
                class ParamsBackground: A3A_Background {
                    idc = -1;
                    x = 4 * GRID_W;
                    y = 8 * GRID_H;
                    w = 118 * GRID_W;
                    h = 88 * GRID_H;
                };
                class ParamsTable: A3A_ControlsGroup {
                    idc = A3A_IDC_SETUP_PARAMSTABLE;
                    x = 4 * GRID_W;
                    y = 8 * GRID_H;
                    w = 118 * GRID_W;
                    h = 88 * GRID_H;
                };

                // Parameter presets (pre-defined)
                class ParamsPresetsGroup : A3A_ControlsGroupNoScrollbars {
                    x = 124 * GRID_W;
                    y = 4 * GRID_H;
                    w = 30 * GRID_W;
                    h = 20 * GRID_H;

                    class controls {
                        class ParamsPresets: A3A_Text {
                            idc = A3A_IDC_SETUP_PARAMSPRESETS_TEXT;
                            text = $STR_antistasi_dialogs_setup_params_presets;
                            x = 0;
                            y = 0;
                            w = 30 * GRID_W;
                            h = 4 * GRID_H;
                            colorBackground[] = A3A_COLOR_BUTTON_BACKGROUND;
                            style = ST_CENTER + ST_UPPERCASE;
                            font = A3A_BUTTON_FONT;
                        };
                        class ParamsPresetsBackground: A3A_Background {
                            idc = -1;
                            x = 0;
                            y = 4 * GRID_H;
                            w = 30 * GRID_W;
                            h = 16 * GRID_H;
                        };
                        class ParamsGroupSizeText : A3A_Text {
                            idc = -1;
                            text = $STR_antistasi_dialogs_setup_params_preset_size;
                            x = 0;
                            y = 8 * GRID_H;
                            w = 12 * GRID_W;
                            h = 4 * GRID_H;
                            colorBackground[] = A3A_COLOR_BUTTON_BACKGROUND;
                            font = A3A_BUTTON_FONT;
                        };
                        class ParamsGroupSize: A3A_ComboBox_Small {
                            idc = A3A_IDC_SETUP_PARAMSPRESETS_SIZE;
                            colorBackground[] = {0,0,0,1};
                            onLBSelChanged = "['updatePresetSelections', [_this select 0, _this select 1]] call A3A_fnc_setupParamsTab";
                            x = 12 * GRID_W;
                            y = 8 * GRID_H;
                            w = 18 * GRID_W;
                            h = 4 * GRID_H;
                        };
                        class ParamsDifficultyText : ParamsGroupSizeText {
                            text = $STR_antistasi_dialogs_setup_params_preset_diff;
                            y = 12 * GRID_H;
                        };
                        class ParamsDifficulty: ParamsGroupSize {
                            idc = A3A_IDC_SETUP_PARAMSPRESETS_DIFF;
                            y = 12 * GRID_H;
                        };
                        class ParamsCustomText : ParamsGroupSizeText {
                            text = $STR_antistasi_dialogs_setup_params_preset_cstm;
                            y = 16 * GRID_H;
                        };
                        class ParamsCustomPreset: ParamsGroupSize {
                            idc = A3A_IDC_SETUP_PARAMSPRESETS_CSTM;
                            y = 16 * GRID_H;
                        };
                    };
                };
                
                // Parameter presets (save/rename/delete custom)
                class ParamsPresetsCustomGroup : A3A_ControlsGroupNoScrollbars {
                    x = 124 * GRID_W;
                    y = 32 * GRID_H;
                    w = 30 * GRID_W;
                    h = 26 * GRID_H;

                    class controls {
                        class PresetNameLabel: A3A_SectionLabelRight {
                            idc = A3A_IDC_SETUP_PARAMSPRESETS_CSTM_NAME_TEXT;
                            text = $STR_antistasi_dialogs_setup_params_presets_new_preset_name;
                            x = 0;
                            y = 0;
                            w = 30 * GRID_W;
                            h = 4 * GRID_H;
                            colorBackground[] = A3A_COLOR_BUTTON_BACKGROUND;
                            style = ST_CENTER + ST_UPPERCASE;
                            font = A3A_BUTTON_FONT;
                        };
                        class PresetNameEditBox: A3A_Edit {
                            idc = A3A_IDC_SETUP_PARAMSPRESETS_CSTM_NAME;
                            x = 0;
                            y = 4 * GRID_H;
                            w = 30 * GRID_W;
                            h = 4 * GRID_H;
                        };
                        class PresetSaveButton: A3A_Button {
                            idc = A3A_IDC_SETUP_PARAMSPRESETS_CSTM_SAVEBUTTON;
                            text = $STR_antistasi_dialogs_setup_params_presets_save_preset;
                            onButtonClick = "['savePreset'] call A3A_fnc_setupParamsTab";
                            x = 0;
                            y = 10 * GRID_H;
                            w = 30 * GRID_W;
                            h = 4 * GRID_H;
                        };
                        class PresetRenameButton: A3A_Button {
                            idc = A3A_IDC_SETUP_PARAMSPRESETS_CSTM_RENAMEBUTTON;
                            text = $STR_antistasi_dialogs_setup_params_presets_rename_preset;
                            onButtonClick = "['renamePreset'] call A3A_fnc_setupParamsTab";
                            x = 0;
                            y = 16 * GRID_H;
                            w = 30 * GRID_W;
                            h = 4 * GRID_H;
                        };
                        class PresetDeleteButton: A3A_Button {
                            idc = A3A_IDC_SETUP_PARAMSPRESETS_CSTM_DELETEBUTTON;
                            text = $STR_antistasi_dialogs_setup_params_presets_delete_preset;
                            onButtonClick = "['deletePreset'] call A3A_fnc_setupParamsTab";
                            x = 0;
                            y = 22 * GRID_H;
                            w = 30 * GRID_W;
                            h = 4 * GRID_H;
                        };
                    };
                };
            };
        };

    };
};

class A3A_SetupHQPosDialog
{
    idd = A3A_IDD_SETUPHQPOSDIALOG;
    onLoad = "['onLoad'] spawn A3A_fnc_setupHQPosDialog";
    onUnload = "['onUnload'] call A3A_fnc_setupHQPosDialog";

    class ControlsBackground
    {
        class HQMap : A3A_MapControl
        {
            idc = -1;
            onMouseButtonUp = "['mouseUp', _this] spawn A3A_fnc_setupHQPosDialog";
            x = safeZoneX;
            y = safeZoneY;
            w = safeZoneW;
            h = safeZoneH;
        };
    };
    class Controls
    {
        class CloseButton : A3A_Button
        {
            idc = -1;
            text = $STR_antistasi_dialogs_hqpos_close;
            onButtonClick = "closeDialog 0";
            x = safeZoneX;
            y = safeZoneY;
            w = 30 * GRID_W;
            h = 6 * GRID_H;
        };
    };
};

class A3A_TextMultiCenter: A3A_Text
{
    style = ST_CENTER + ST_MULTI + ST_NO_RECT;
};

class A3A_SetupConfirmDialog
{
    idd = A3A_IDD_SETUPCONFIRMDIALOG;
    onLoad = "['onLoad'] spawn A3A_fnc_setupConfirmDialog";
    //onUnload = "['onUnload'] call A3A_fnc_setupConfirmDialog";        // nothing to do on cancel?

    #define DIALOG_X CENTER_X(80) // Global x pos of dialog
    #define DIALOG_Y CENTER_Y(40) // Global y pos of dialog

    class Controls
    {
        class Titlebar : A3A_TitlebarText
        {
            idc = -1;
            text = $STR_antistasi_dialogs_setup_confirm_title;
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
            x = DIALOG_X;
            y = DIALOG_Y - 5 * GRID_H;
            w = 80 * GRID_W;
            h = 5 * GRID_H;
        };
        class Background : A3A_Background
        {
            idc = -1;
            x = DIALOG_X;
            y = DIALOG_Y;
            w = 80 * GRID_W;
            h = 40 * GRID_H;
        };
        class ConfirmText : A3A_TextMultiCenter
        {
            idc = A3A_IDC_SETUP_CONFIRMTEXT;
            x = DIALOG_X + 4 * GRID_W;
            y = DIALOG_Y + 4 * GRID_H;
            w = 72 * GRID_W;
            h = 20 * GRID_H;
        };
        class CancelButton : A3A_Button
        {
            idc = A3A_IDC_SETUP_CONFIRMCANCEL;
            text = $STR_antistasi_dialogs_setup_confirm_cancel;
            onButtonClick = "closeDialog 0";
            x = DIALOG_X + 4 * GRID_W;
            y = DIALOG_Y + 28 * GRID_H;
            w = 30 * GRID_W;
            h = 5 * GRID_H;
        };
        class YesButton : A3A_Button
        {
            idc = A3A_IDC_SETUP_CONFIRMYES;
            text = $STR_antistasi_dialogs_setup_confirm_yes;
            onButtonClick = "['confirm'] call A3A_fnc_setupConfirmDialog";
            x = DIALOG_X + 46 * GRID_W;
            y = DIALOG_Y + 28 * GRID_H;
            w = 30 * GRID_W;
            h = 5 * GRID_H;
        };
    };
};

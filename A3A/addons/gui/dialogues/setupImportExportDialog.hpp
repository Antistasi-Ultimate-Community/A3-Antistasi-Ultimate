class A3A_SetupImportExportDialog
{
    idd = A3A_IDD_SETUP_IMPORTEXPORTDIALOG;
    onLoad = "['onLoad'] spawn A3A_fnc_setupImportExportDialog";
    onUnload = "['onUnload'] call A3A_fnc_setupImportExportDialog";

    #undef DIALOG_X
    #undef DIALOG_Y
    #define DIALOG_X CENTER_X(160)
    #define DIALOG_Y CENTER_Y(92)

    class Controls
    {
        class Titlebar : A3A_Text {
            idc = -1;
            moving = 1;
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
            text = "$STR_antistasi_dialogs_setup_import_export";
            style = ST_CENTER + ST_UPPERCASE;
            font = A3A_BUTTON_FONT;
            x = QUOTE(DIALOG_X);
            y = QUOTE(DIALOG_Y);
            w = QUOTE(142 * GRID_W);
            h = QUOTE(4 * GRID_H);
        };
        class CloseButton : A3A_Button {
            idc = -1;
            text = "$STR_antistasi_dialogs_setup_ie_close";
            onButtonClick = "closeDialog 0";
            x = QUOTE(DIALOG_X + 142 * GRID_W);
            y = QUOTE(DIALOG_Y);
            w = QUOTE(18 * GRID_W);
            h = QUOTE(4 * GRID_H);
        };
        class Background : A3A_Background {
            idc = -1;
            x = QUOTE(DIALOG_X);
            y = QUOTE(DIALOG_Y + 4 * GRID_H);
            w = QUOTE(160 * GRID_W);
            h = QUOTE(88 * GRID_H);
        };

        class SaveDataBoxGroup : A3A_ControlsGroupNoScrollbars {
            x = QUOTE(DIALOG_X);
            y = QUOTE(DIALOG_Y + 6 * GRID_H);
            w = QUOTE(80 * GRID_W);
            h = QUOTE(86 * GRID_H);

            class Controls {
                class SaveDataTitle : A3A_Text {
                    idc = -1;
                    text = "$STR_antistasi_dialogs_setup_ie_savedata";
                    colorBackground[] = A3A_COLOR_BLACK;
                    style = ST_CENTER + ST_UPPERCASE;
                    font = A3A_BUTTON_FONT;
                    x = QUOTE(2 * GRID_W);
                    y = 0;
                    w = QUOTE(58 * GRID_W);
                    h = QUOTE(4 * GRID_H);
                };
                class EditButton : A3A_Button {
                    idc = A3A_IDC_SETUP_IMPORTEXPORT_EDITBUTTON;
                    text = "$STR_antistasi_dialogs_setup_ie_edit";
                    onButtonClick = "['toggleEdit'] call A3A_fnc_setupImportExportDialog";
                    x = QUOTE(60 * GRID_W);
                    y = 0;
                    w = QUOTE(10 * GRID_W);
                    h = QUOTE(4 * GRID_H);
                };
                class ClearButton : EditButton {
                    idc = A3A_IDC_SETUP_IMPORTEXPORT_CLEARBUTTON;
                    text = "$STR_antistasi_dialogs_setup_ie_clear";
                    onButtonClick = "['clearData'] call A3A_fnc_setupImportExportDialog";
                    x = QUOTE(70 * GRID_W);
                };

                class SaveDataBoxGroup : A3A_ControlsGroupNoScrollbars {
                    idc = A3A_IDC_SETUP_IMPORTEXPORT_SAVEDATAGROUP;
                    x = QUOTE(2 * GRID_W);
                    y = QUOTE(4 * GRID_H);
                    w = QUOTE(78 * GRID_W);
                    h = QUOTE(80 * GRID_H);

                    class Controls {
                        class SaveDataBox : A3A_Edit {
                            idc = A3A_IDC_SETUP_IMPORTEXPORT_SAVEDATABOX;
                            style = ST_LEFT + ST_MULTI;
                            colorDisabled[] = A3A_COLOR_TEXT;
                            font = "EtelkaMonospacePro";
                            sizeEx = QUOTE(GUI_TEXT_SIZE_EXTRA_SMALL);
                            x = 0;
                            y = 0;
                            w = QUOTE(78 * GRID_W);
                            h = QUOTE(80 * GRID_H);
                        };
                    };
                };
            };
        };
        
        class BasicImportExportGroup : A3A_ControlsGroupNoScrollbars {
            x = QUOTE(DIALOG_X + 82 * GRID_W);
            y = QUOTE(DIALOG_Y + 10 * GRID_H);
            w = QUOTE(28 * GRID_W);
            h = QUOTE(12 * GRID_H);

            class Controls {
                class ImportButton : A3A_Button {
                    idc = A3A_IDC_SETUP_IMPORTEXPORT_IMPORTBUTTON;
                    text = "$STR_antistasi_dialogs_setup_ie_import";
                    tooltip = "$STR_antistasi_dialogs_setup_ie_import_tooltip";
                    onButtonClick = "['importData'] call A3A_fnc_setupImportExportDialog";
                    x = 0;
                    y = 0;
                    w = QUOTE(28 * GRID_W);
                    h = QUOTE(5 * GRID_H);
                };
                class ExportButton : ImportButton {
                    idc = A3A_IDC_SETUP_IMPORTEXPORT_EXPORTBUTTON;
                    text = "$STR_antistasi_dialogs_setup_ie_export";
                    tooltip = "$STR_antistasi_dialogs_setup_ie_export_tooltip";
                    onButtonClick = "['exportData'] call A3A_fnc_setupImportExportDialog";
                    y = QUOTE(7 * GRID_H);
                };
            };
        };

        class SaveListGroup : A3A_ControlsGroupNoScrollbars {
            x = QUOTE(DIALOG_X + 110 * GRID_W);
            y = QUOTE(DIALOG_Y + 2 * GRID_H);
            w = QUOTE(50 * GRID_W);
            h = QUOTE(90 * GRID_H);

            class Controls {
                class SaveListText : A3A_Text {
                    idc = -1;
                    text = "$STR_antistasi_dialogs_setup_ie_savelist_text";
                    tooltip = "$STR_antistasi_dialogs_setup_ie_savelist_tooltip";
                    colorBackground[] = A3A_COLOR_BLACK;
                    style = ST_CENTER + ST_UPPERCASE;
                    font = A3A_BUTTON_FONT;
                    x = QUOTE(2 * GRID_W);
                    y = QUOTE(4 * GRID_H);
                    w = QUOTE(46 * GRID_W);
                    h = QUOTE(4 * GRID_H);
                };
                class SaveListBox : A3A_Listbox {
                    idc = A3A_IDC_SETUP_IMPORTEXPORT_SAVELB;
                    x = QUOTE(2 * GRID_W);
                    y = QUOTE(8 * GRID_H);
                    w = QUOTE(46 * GRID_W);
                    h = QUOTE(80 * GRID_H);
                    onLoad = "['getSavesFromServer', []] remoteExec ['A3A_fnc_setupImportExportDialog', 2]";
                    onLBSelChanged = "['saveLBSelChanged', _this] spawn A3A_fnc_setupImportExportDialog";
                };
            };
        };
    };
};

class A3A_SetupImportExportParamsDialog : A3A_SetupImportExportDialog {
    class Controls : Controls {
        class Titlebar : Titlebar {
            text = "$STR_antistasi_dialogs_setup_import_export_params";
        };
        class CloseButton : CloseButton {};
        class Background : Background {};

        class ParamDataBoxGroup : SaveDataBoxGroup {

            class Controls : Controls {
                class ParamDataTitle : SaveDataTitle {
                    text = "$STR_antistasi_dialogs_setup_ie_paramdata";
                };
                class EditButton : EditButton {};
                class ClearButton : ClearButton {};

                class ParamDataBoxGroup : SaveDataBoxGroup {};
            };
        };
        
        class BasicImportExportGroup : BasicImportExportGroup {

            class Controls : Controls {
                class ImportButton : ImportButton {
                    tooltip = "$STR_antistasi_dialogs_setup_ie_import_params_tooltip";
                    onButtonClick = "['importParamData'] remoteExecCall ['A3A_fnc_setupImportExportDialog', 2]";
                };
                class ExportButton : ExportButton {
                    tooltip = "$STR_antistasi_dialogs_setup_ie_export_params_tooltip";
                    onButtonClick = "['exportParamData'] call A3A_fnc_setupImportExportDialog";
                };
            };
        };

        class ParamListGroup : SaveListGroup {

            class Controls : Controls{
                class ParamListText : SaveListText {
                    text = "$STR_antistasi_dialogs_setup_ie_paramlist_text";
                };
                class ParamListBox : SaveListBox {
                    onLoad = "['paramLBPopulate', _this] call A3A_fnc_setupImportExportDialog";
                    onLBSelChanged = "['paramLBSelChanged', _this] spawn A3A_fnc_setupImportExportDialog";
                };
            };
        };
    };
};

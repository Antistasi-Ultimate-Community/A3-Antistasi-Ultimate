class A3A_SetupImportExportDialog
{
    idd = A3A_IDD_SETUP_IMPORTEXPORTDIALOG;
    onLoad = "['onLoad'] spawn A3A_fnc_setupImportExportDialog";
    onUnload = "['onUnload'] call A3A_fnc_setupImportExportDialog";

    #define DIALOG_X CENTER_X(160)
    #define DIALOG_Y CENTER_Y(92)

    class Controls
    {
        class Titlebar : A3A_Text {
            idc = -1;
            moving = true;
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
            text = $STR_antistasi_dialogs_setup_import_export;
            style = ST_CENTER + ST_UPPERCASE;
            font = A3A_BUTTON_FONT;
            x = DIALOG_X;
            y = DIALOG_Y;
            w = 142 * GRID_W;
            h = 4 * GRID_H;
        };
        class CloseButton : A3A_Button {
            idc = -1;
            text = $STR_antistasi_dialogs_setup_ie_close;
            onButtonClick = "closeDialog 0";
            x = DIALOG_X + 142 * GRID_W;
            y = DIALOG_Y;
            w = 18 * GRID_W;
            h = 4 * GRID_H;
        };
        class Background : A3A_Background {
            idc = -1;
            x = DIALOG_X;
            y = DIALOG_Y + 4 * GRID_H;
            w = 160 * GRID_W;
            h = 88 * GRID_H;
        };

        class SaveDataBoxGroup : A3A_ControlsGroupNoScrollbars {
            x = DIALOG_X;
            y = DIALOG_Y + 6 * GRID_H;
            w = 80 * GRID_W;
            h = 86 * GRID_H;

            class Controls {
                class SaveDataTitle : A3A_Text {
                    idc = -1;
                    text = $STR_antistasi_dialogs_setup_ie_savedata;
                    colorBackground[] = A3A_COLOR_BLACK;
                    style = ST_CENTER + ST_UPPERCASE;
                    font = A3A_BUTTON_FONT;
                    x = 2 * GRID_W;
                    y = 0;
                    w = 58 * GRID_W;
                    h = 4 * GRID_H;
                };
                class EditButton : A3A_Button {
                    idc = A3A_IDC_SETUP_IMPORTEXPORT_EDITBUTTON;
                    text = $STR_antistasi_dialogs_setup_ie_edit;
                    onButtonClick = "['toggleEdit'] call A3A_fnc_setupImportExportDialog";
                    x = 60 * GRID_W;
                    y = 0;
                    w = 10 * GRID_W;
                    h = 4 * GRID_H;
                };
                class ClearButton : EditButton {
                    idc = A3A_IDC_SETUP_IMPORTEXPORT_CLEARBUTTON;
                    text = $STR_antistasi_dialogs_setup_ie_clear;
                    onButtonClick = "['clearData'] call A3A_fnc_setupImportExportDialog";
                    x = 70 * GRID_W;
                };

                class SaveDataBoxGroup : A3A_ControlsGroupNoScrollbars {
                    idc = A3A_IDC_SETUP_IMPORTEXPORT_SAVEDATAGROUP;
                    x = 2 * GRID_W;
                    y = 4 * GRID_H;
                    w = 78 * GRID_W;
                    h = 80 * GRID_H;

                    class Controls {
                        class SaveDataBox : A3A_Edit {
                            idc = A3A_IDC_SETUP_IMPORTEXPORT_SAVEDATABOX;
                            style = ST_LEFT + ST_MULTI;
                            colorDisabled[] = A3A_COLOR_TEXT;
                            font = "EtelkaMonospacePro";
                            sizeEx = GUI_TEXT_SIZE_EXTRA_SMALL;
                            x = 0;
                            y = 0;
                            w = 78 * GRID_W;
                            h = 80 * GRID_H;
                        };
                    };
                };
            };
        };
        
        class BasicImportExportGroup : A3A_ControlsGroupNoScrollbars {
            x = DIALOG_X + 82 * GRID_W;
            y = DIALOG_Y + 10 * GRID_H;
            w = 28 * GRID_W;
            h = 12 * GRID_H;

            class Controls {
                class ImportButton : A3A_Button {
                    idc = A3A_IDC_SETUP_IMPORTEXPORT_IMPORTBUTTON;
                    text = $STR_antistasi_dialogs_setup_ie_import;
                    tooltip = $STR_antistasi_dialogs_setup_ie_import_tooltip;
                    onButtonClick = "['importData'] call A3A_fnc_setupImportExportDialog";
                    x = 0;
                    y = 0;
                    w = 28 * GRID_W;
                    h = 5 * GRID_H;
                };
                class ExportButton : ImportButton {
                    idc = A3A_IDC_SETUP_IMPORTEXPORT_EXPORTBUTTON;
                    text = $STR_antistasi_dialogs_setup_ie_export;
                    tooltip = $STR_antistasi_dialogs_setup_ie_export_tooltip;
                    onButtonClick = "['exportData'] call A3A_fnc_setupImportExportDialog";
                    y = 7 * GRID_H;
                };
            };
        };

        class SaveListGroup : A3A_ControlsGroupNoScrollbars {
            x = DIALOG_X + 110 * GRID_W;
            y = DIALOG_Y + 2 * GRID_H;
            w = 50 * GRID_W;
            h = 90 * GRID_H;

            class Controls {
                class SaveListText : A3A_Text {
                    idc = -1;
                    text = $STR_antistasi_dialogs_setup_ie_savelist_text;
                    colorBackground[] = A3A_COLOR_BLACK;
                    style = ST_CENTER + ST_UPPERCASE;
                    font = A3A_BUTTON_FONT;
                    x = 2 * GRID_W;
                    y = 4 * GRID_H;
                    w = 46 * GRID_W;
                    h = 4 * GRID_H;
                };
                class SaveListBox : A3A_ListBox {
                    idc = A3A_IDC_SETUP_IMPORTEXPORT_SAVELB;
                    x = 2 * GRID_W;
                    y = 8 * GRID_H;
                    w = 46 * GRID_W;
                    h = 80 * GRID_H;
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
            text = $STR_antistasi_dialogs_setup_import_export_params;
        };
        class CloseButton : CloseButton {};
        class Background : Background {};

        class ParamDataBoxGroup : SaveDataBoxGroup {

            class Controls : Controls {
                class ParamDataTitle : SaveDataTitle {
                    text = $STR_antistasi_dialogs_setup_ie_paramdata;
                };
                class EditButton : EditButton {};
                class ClearButton : ClearButton {};

                class ParamDataBoxGroup : SaveDataBoxGroup {};
            };
        };
        
        class BasicImportExportGroup : BasicImportExportGroup {

            class Controls : Controls {
                class ImportButton : ImportButton {
                    tooltip = $STR_antistasi_dialogs_setup_ie_import_params_tooltip;
                    onButtonClick = "['importParamData'] remoteExecCall ['A3A_fnc_setupImportExportDialog', 2]";
                };
                class ExportButton : ExportButton {
                    tooltip = $STR_antistasi_dialogs_setup_ie_export_params_tooltip;
                    onButtonClick = "['exportParamData'] call A3A_fnc_setupImportExportDialog";
                };
            };
        };

        class ParamListGroup : SaveListGroup {

            class Controls : Controls{
                class ParamListText : SaveListText {
                    text = $STR_antistasi_dialogs_setup_ie_paramlist_text;
                };
                class ParamListBox : SaveListBox {
                    onLoad = "['paramLBPopulate', _this] call A3A_fnc_setupImportExportDialog";
                    onLBSelChanged = "['paramLBSelChanged', _this] spawn A3A_fnc_setupImportExportDialog";
                };
            };
        };
    };
};

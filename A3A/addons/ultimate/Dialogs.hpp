//dialogs.hpp
#include "defines.hpp"

#define COMPONENT musicPlayer

// Дополнительные настройки 
#define TRACK_UPDATE_INTERVAL 0.1
#define TRACK_END_THRESHOLD 0.98

#define MIN_VOLUME 0
#define MAX_VOLUME 1
#define DEFAULT_VOLUME 0.5

GVAR(currentTrack) = [];
GVAR(isPlaying) = false;
GVAR(trackProgress) = 0;
GVAR(volume) = DEFAULT_VOLUME;

class RscDisplayMusicPlayer: A3A_DefaultDialog {
    idd = 85000;
    movingEnable = 1;
    moving = true;
    enableSimulation = 1;
    
    class ControlsBackground {
        class TitleBarBackground: A3A_Background {
            moving = 1;
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
            x = DIALOG_X; ///x = DIALOG_X + GRID_X(0);
            y = DIALOG_Y - 5 * GRID_H; /// y = DIALOG_Y + GRID_Y(-4);
            w = GRID_X(DIALOG_W);
            h = 5 * GRID_H; ///h = GRID_Y(4);
        };

        class Background: A3A_Background {
            moving = 1;
            idc = -1;
            x = DIALOG_X;
            y = DIALOG_Y;
            w = GRID_X(DIALOG_W);
            h = GRID_Y(DIALOG_H);
            colorBackground[] = {0.1, 0.1, 0.1, 0.95};
        };

        class DebugBackground: A3A_Background {
            idc = 85120;
            x = DIALOG_X - GRID_X(40);  // слева от основного окна
            y = DIALOG_Y;
            w = GRID_X(38);
            h = GRID_Y(DIALOG_H);
            colorBackground[] = {0.05, 0.05, 0.05, 0.9};
        };

        // Сам текст отладки
        class DebugInfo: A3A_StructuredText {
            idc = 85121;
            x = DIALOG_X - GRID_X(39);
            y = DIALOG_Y + GRID_Y(1);
            w = GRID_X(36);
            h = GRID_Y(DIALOG_H - 2);
            size = 0.8 * GUI_TEXT_SIZE_LARGE;
            colorText[] = {0.9,0.9,0.9,1};
        };
        class DebugCopyButton: A3A_ClickablePicture {
            idc = 85123;                     // новый IDC
            style = ST_PICTURE;
            x = DIALOG_X - GRID_X(6);        // правая граница панели: -40 + 38 = -2, отступим ещё 1 влево
            y = DIALOG_Y + GRID_Y(1);         // верхняя граница панели
            w = GRID_X(4);
            h = GRID_Y(4);
            text = "";
            animTextureNormal = "x\zen\addons\context_actions\ui\copy_ca.paa";
            animTextureDisabled = "x\zen\addons\context_actions\ui\copy_ca.paa";
            animTextureOver = "x\zen\addons\context_actions\ui\copy_ca.paa";
            animTextureFocused = "x\zen\addons\context_actions\ui\copy_ca.paa";
            animTexturePressed = "x\zen\addons\context_actions\ui\copy_ca.paa";
            animTextureDefault = "x\zen\addons\context_actions\ui\copy_ca.paa";
            tooltip = "Копировать информацию в буфер обмена";
            onButtonClick = "call A3U_fnc_copyDebugToClipboard";
            autoAdjustTexture = true;
            colorBackground[] = {1,1,1,1};
            class AttributesImage {
                font = "RobotoCondensed";
                color = "#FFFFFF";
                align = "left";
            };
        };
    };
    
    class Controls {
        class Title: A3A_Text {
            text = "JUKEBOX"; //MUSIC PLAYER music
            x = DIALOG_X + GRID_X(0);
            y = DIALOG_Y + GRID_Y(-4);
            w = GRID_X(DIALOG_W);
            h = GRID_Y(4);
            style = ST_LEFT;
            font = "PuristaBold";
            sizeEx = 1.2 * GUI_TEXT_SIZE_LARGE;
            colorText[] = {1,1,1,1};
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
        };

        // Тумблер (можно добавить в правую часть заголовка)
        class DebugToggle: A3A_ClickablePicture {
            idc = 85122;
            style = ST_PICTURE;
            x = DIALOG_X + GRID_X(72);
            y = DIALOG_Y - GRID_Y(4);
            w = GRID_X(4);
            h = GRID_Y(4);
            text = ""; //"\A3\ui_f\data\map\vehicleicons\iconVehicle_ca.paa"
            animTextureNormal = "\A3\ui_f\data\map\vehicleicons\iconobject_ca.paa";
            animTextureDisabled = "\A3\ui_f\data\map\vehicleicons\iconobject_ca.paa";
            animTextureOver = "\A3\ui_f\data\map\vehicleicons\iconobject_ca.paa";
            animTextureFocused = "\A3\ui_f\data\map\vehicleicons\iconobject_ca.paa";
            animTexturePressed = "\A3\ui_f\data\map\vehicleicons\iconobject_ca.paa";
            animTextureDefault = "\A3\ui_f\data\map\vehicleicons\iconobject_ca.paa";
            onButtonClick = "call A3U_fnc_toggleDebug";
            tooltip = "Показать/скрыть отладочную информацию";
            autoAdjustTexture = true;
            class AttributesImage
            {
                font = "RobotoCondensed";
                color = "#FFFFFF";
                align = "left";
            };
        };

        class CategoriesList: A3A_Listbox {
            idc = 85101;
            x = DIALOG_X + GRID_X(1);
            y = DIALOG_Y + GRID_Y(6);
            w = GRID_X(18);
            h = GRID_Y(33);
            sizeEx = 0.8 * GUI_TEXT_SIZE_MEDIUM;
            rowHeight = 1.8 * GUI_TEXT_SIZE_MEDIUM;
            colorBackground[] = {0.15,0.15,0.15,1};
            colorSelectBackground[] = {0.25,0.25,0.25,1};
            onLBSelChanged = "call A3U_fnc_categoryChanged";
        };
        
        class TracksList: A3A_Listbox {
            idc = 85102;
            x = DIALOG_X + GRID_X(20);
            y = DIALOG_Y + GRID_Y(6);
            w = GRID_X(36);
            h = GRID_Y(33);
            sizeEx = 0.8 * GUI_TEXT_SIZE_MEDIUM;
            rowHeight = 1.8 * GUI_TEXT_SIZE_MEDIUM;
            colorSelect[] = {0.2,0.7,0.9,1};
            onLBSelChanged = "call A3U_fnc_trackChanged";
        };

        class PlayButton: A3A_ClickablePicture {
            idc = 85103;
            style = ST_PICTURE;
            x = DIALOG_X + GRID_X(26);
            y = DIALOG_Y + GRID_Y(42.5);
            w = GRID_X(7);
            h = GRID_Y(7);
            text = "";
            //textureNoShortcut = "\A3\Ui_f\data\GUI\Cfg\KeyframeAnimation\IconTimeline_CA.paa"; //"\A3\Ui_f\data\GUI\Cfg\KeyframeAnimation\IconTimeline_CA.paa"; //"a3\modules_f_curator\data\portraitendmission_ca.paa";
            animTextureNormal = "a3\modules_f_curator\data\iconendmission_ca.paa";
            animTextureDisabled = "a3\modules_f_curator\data\iconendmission_ca.paa";
            animTextureOver = "a3\modules_f_curator\data\iconendmission_ca.paa";
            animTextureFocused = "a3\modules_f_curator\data\iconendmission_ca.paa";
            animTexturePressed = "a3\modules_f_curator\data\iconendmission_ca.paa";
            animTextureDefault = "a3\modules_f_curator\data\iconendmission_ca.paa";
            tooltip = "Воспроизвести";
            color[] = {1,1,1,1};
            // Text
            color2[] = {1,1,1,1}; // Blinking
            colorFocused[] = {1,1,1,1}; // Focused (selected with keyboard?)
            colorDisabled[] ={1,1,1,1}; // Disabled

            // TextSecondary
            colorSecondary[] = {1,1,1,1}; // Normal
            color2Secondary[] = {1,1,1,1}; // Blinking
            colorFocusedSecondary[] = {1,1,1,1}; // Focused
            colorDisabledSecondary[] = {1,1,1,1}; // Disabled

            // Background
            colorBackground[] = {1,1,1,1}; // Normal background, or pressed ? gets way darker for some reason
            colorBackground2[] = {1,1,1,1}; // Blinking background
            colorBackgroundFocused[] = {1,1,1,1}; // Focused
            onButtonClick = "call A3U_fnc_playPause";
            autoAdjustTexture = true;
            class AttributesImage
            {
                font = "RobotoCondensed";
                color = "#FFFFFF";
                align = "left";
            };
        };
        
        class PrevButton: A3A_ClickablePicture {
            idc = 85104;
            style = ST_PICTURE;
            x = DIALOG_X + GRID_X(19);
            y = DIALOG_Y + GRID_Y(42.5);
            w = GRID_X(7);
            h = GRID_Y(7);
            text = "";
            animTextureNormal = "\a3\ui_f_orange\data\cfgorange\missions\action_fragment_ca.paa";
            animTextureDisabled = "\a3\ui_f_orange\data\cfgorange\missions\action_fragment_ca.paa";
            animTextureOver = "\a3\ui_f_orange\data\cfgorange\missions\action_fragment_ca.paa";
            animTextureFocused = "\a3\ui_f_orange\data\cfgorange\missions\action_fragment_ca.paa";
            animTexturePressed = "\a3\ui_f_orange\data\cfgorange\missions\action_fragment_ca.paa";
            animTextureDefault = "\a3\ui_f_orange\data\cfgorange\missions\action_fragment_ca.paa";
            tooltip = "Предыдущий трек";
            onButtonClick = "call A3U_fnc_prevTrack";
            autoAdjustTexture = true;
            class AttributesImage
            {
                font = "RobotoCondensed";
                color = "#FFFFFF";
                align = "left";
            };
            //colorBackground[] = {0.2,0.2,0.2,1};
        };
        
        class NextButton: A3A_ClickablePicture {
            idc = 85105;
            style = ST_PICTURE;
            x = DIALOG_X + GRID_X(33);
            y = DIALOG_Y + GRID_Y(42.5);
            w = GRID_X(7);
            h = GRID_Y(7);
            text = "";
            animTextureNormal = "\a3\ui_f_orange\data\cfgorange\missions\action_fragment_back_ca.paa";
            animTextureDisabled = "\a3\ui_f_orange\data\cfgorange\missions\action_fragment_back_ca.paa";
            animTextureOver = "\a3\ui_f_orange\data\cfgorange\missions\action_fragment_back_ca.paa";
            animTextureFocused = "\a3\ui_f_orange\data\cfgorange\missions\action_fragment_back_ca.paa";
            animTexturePressed = "\a3\ui_f_orange\data\cfgorange\missions\action_fragment_back_ca.paa";
            animTextureDefault = "\a3\ui_f_orange\data\cfgorange\missions\action_fragment_back_ca.paa";
            tooltip = "Следующий трек";
            onButtonClick = "call A3U_fnc_nextTrack";
            autoAdjustTexture = true;
            class AttributesImage
            {
                font = "RobotoCondensed";
                color = "#FFFFFF";
                align = "left";
            };
            //colorBackground[] = {0.2,0.2,0.2,1};
        };

        class LoopButton: A3A_ClickablePicture {
            idc = 85113;
            style = ST_PICTURE;
            x = DIALOG_X + GRID_X(40);
            y = DIALOG_Y + GRID_Y(42.5);
            w = GRID_X(7);
            h = GRID_Y(7);
            text = "";
            animTextureNormal = "a3\modules_f_beta\data\firingdrills\restart_ca.paa"; // иконка повтора //"a3\missions_f_exp\data\img\lobby\ui_campaign_lobby_icon_player_connecting_ca.paa"
            animTextureDisabled = "a3\modules_f_beta\data\firingdrills\restart_ca.paa"; 
            animTextureOver = "a3\modules_f_beta\data\firingdrills\restart_ca.paa";
            animTextureFocused = "a3\modules_f_beta\data\firingdrills\restart_ca.paa";
            animTexturePressed = "a3\modules_f_beta\data\firingdrills\restart_ca.paa";
            animTextureDefault = "a3\modules_f_beta\data\firingdrills\restart_ca.paa";
            tooltip = "Повтор трека (выкл)";
            onButtonClick = "call A3U_fnc_toggleLoop";
            autoAdjustTexture = true;
            colorBackground[] = {1,1,1,1};
            // можно добавить подсветку при включении позже через скрипт
            class AttributesImage {
                font = "RobotoCondensed";
                color = "#FFFFFF";
                align = "left";
            };
        };

        class ShuffleButton: A3A_ClickablePicture {
            idc = 85114;
            style = ST_PICTURE;
            x = DIALOG_X + GRID_X(12.5);
            y = DIALOG_Y + GRID_Y(43);
            w = GRID_X(6);
            h = GRID_Y(6);
            text = "";
            animTextureNormal = "x\zen\addons\compositions\ui\randomize_ca.paa"; // иконка повтора
            animTextureDisabled = "x\zen\addons\compositions\ui\randomize_ca.paa";
            animTextureOver = "x\zen\addons\compositions\ui\randomize_ca.paa";
            animTextureFocused = "x\zen\addons\compositions\ui\randomize_ca.paa";
            animTexturePressed = "x\zen\addons\compositions\ui\randomize_ca.paa";
            animTextureDefault = "x\zen\addons\compositions\ui\randomize_ca.paa";
            tooltip = "Случайный порядок (вкл)";
            onButtonClick = "call A3U_fnc_toggleShuffle";
            autoAdjustTexture = true;
            colorBackground[] = {1,1,1,1};
            // можно добавить подсветку при включении позже через скрипт
            class AttributesImage {
                font = "RobotoCondensed";
                color = "#FFFFFF";
                align = "left";
            };
        };
        
        class TrackProgress: A3A_Progress {
            idc = 85106;
            x = DIALOG_X + GRID_X(1);
            y = DIALOG_Y + GRID_Y(40);
            w = GRID_X(55);
            h = GRID_Y(2);
            colorBar[] = {0.2,0.6,1,0.8};
            texture = "#(argb,8,8,3)color(1,1,1,1)"; // Явное указание текстуры
        };

        /* class TrackProgressClickCatcher: A3A_Button {
            idc = 85124;                 // новый IDC
            x = DIALOG_X + GRID_X(1);
            y = DIALOG_Y + GRID_Y(40);
            w = GRID_X(55);
            h = GRID_Y(2);
            text = "";
            colorBackground[] = {0,0,0,0}; // полностью прозрачный
            onButtonClick = "call A3U_fnc_onProgressClick";
        }; */
        
        class VolumeControl: A3A_Slider {
            idc = 85107;
            style = SL_HORZ;
	        //type = CT_SLIDER;
            x = DIALOG_X + GRID_X(56.5);
            y = DIALOG_Y + GRID_Y(39);
            w = GRID_X(23);
            h = GRID_Y(4);
            onSliderPosChanged = "call A3U_fnc_volumeChanged";
            tooltip = "Изменение громкости";
        };

        /* class VolumeIcon: A3A_Picture {
            idc = 85108;
            x = DIALOG_X + GRID_X(65);
            y = DIALOG_Y + GRID_Y(43.5);
            w = GRID_X(6);
            h = GRID_Y(6);
            text = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_on_ca.paa"; //"\A3\ui_f\data\map\vehicleicons\iconSound_ca.paa";
            tooltip = "Громкость";
        }; */
        class VolumeIconOn: A3A_ClickablePicture {
            idc = 85108;
            style = ST_PICTURE;
            x = DIALOG_X + GRID_X(65);
            y = DIALOG_Y + GRID_Y(43.5);
            w = GRID_X(6);
            h = GRID_Y(6);
            text = "";
            animTextureNormal = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_on_ca.paa";
            animTextureDisabled = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_on_ca.paa";
            animTextureOver = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_on_ca.paa";
            animTextureFocused = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_on_ca.paa";
            animTexturePressed = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_off_ca.paa";
            animTextureDefault = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_on_ca.paa";
            tooltip = "Выкл звук";
            onButtonClick = "call A3U_fnc_toggleMute";
            autoAdjustTexture = true;
            colorBackground[] = {1,1,1,1};
            class AttributesImage {
                font = "RobotoCondensed";
                color = "#FFFFFF";
                align = "left";
            };
        };
        class VolumeIconOff: A3A_ClickablePicture {
            idc = 85109;
            style = ST_PICTURE;
            x = DIALOG_X + GRID_X(65);
            y = DIALOG_Y + GRID_Y(43.5);
            w = GRID_X(6);
            h = GRID_Y(6);
            text = "";
            animTextureNormal = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_off_ca.paa";
            animTextureDisabled = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_off_ca.paa";
            animTextureOver = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_off_ca.paa";
            animTextureFocused = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_off_ca.paa";
            animTexturePressed = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_on_ca.paa";
            animTextureDefault = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_off_ca.paa";
            tooltip = "Вкл звук";
            onButtonClick = "call A3U_fnc_toggleMute";
            autoAdjustTexture = true;
            colorBackground[] = {1,1,1,1};
            class AttributesImage {
                font = "RobotoCondensed";
                color = "#FFFFFF";
                align = "left";
            };
        };

        class TrackInfo: A3A_StructuredText {
            idc = 85110;
            x = DIALOG_X + GRID_X(0);
            y = DIALOG_Y + GRID_Y(0.5);
            w = GRID_X(DIALOG_W);
            h = GRID_Y(5);
            
            class Attributes {
                align = "center";
                font = "PuristaMedium";
                size = 0.4;
            };
        };

        class TrackModIcon: A3A_Picture {
            idc = 85111;                     // IDC для иконки мода
            x = DIALOG_X + GRID_X(57);       // справа от TrackInfo (TrackInfo: x=30, w=50 → 30+50+1)
            y = DIALOG_Y + GRID_Y(10);         // немного ниже верхней границы (под Title)
            w = GRID_X(22);                    // ширина 4 клетки
            h = GRID_Y(22);                    // высота 4 клетки
            /* text = "";                         // начальное значение пустое
            tooltip = "";                       // будет заполняться позже
            colorText[] = {1,1,1,1};            // обычный цвет
            colorBackground[] = {0,0,0,0.5};    // полупрозрачный фон для отсутствующей иконки (опционально) */
        };

        class CloseButton : A3A_CloseButton
        {
            idc = -1;
            x = DIALOG_X + GRID_X(76);
            y = DIALOG_Y - GRID_Y(4);
            w = GRID_X(4);
            h = GRID_Y(4);
        };
    };
};
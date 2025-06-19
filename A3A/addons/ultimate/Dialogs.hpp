#include "defines.hpp"

#define COMPONENT musicPlayer

// Дополнительные настройки
#define TRACK_UPDATE_INTERVAL 0.1
#define TRACK_END_THRESHOLD 0.98

#define MIN_VOLUME 0
#define MAX_VOLUME 1
#define DEFAULT_VOLUME 0.5

#define CarIcon "\a3\ui_f\data\GUI\Rsc\RscDisplayGarage\car_ca.paa"
#define ArmoredIcon "\a3\ui_f\data\GUI\Rsc\RscDisplayGarage\tank_ca.paa"
#define AirIcon "\a3\ui_f\data\GUI\Rsc\RscDisplayGarage\helicopter_ca.paa"

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
        class Background: A3A_Background {
            idc = -1;
            x = DIALOG_X;
            y = DIALOG_Y;
            w = GRID_X(DIALOG_W);
            h = GRID_Y(DIALOG_H);
            colorBackground[] = {0.1, 0.1, 0.1, 0.95};
        };
        
        class TitleBarBackground: A3A_Background {
            moving = 1;
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
            x = DIALOG_X;
            y = DIALOG_Y - 5 * GRID_H;
            w = GRID_X(DIALOG_W);
            h = 5 * GRID_H;
        };
    };
    
    class Controls {
        class Title: A3A_Text {
            text = "MUSIC PLAYER";
            x = DIALOG_X + GRID_X(1);
            y = DIALOG_Y + GRID_Y(1);
            w = GRID_X(38);
            h = GRID_Y(4);
            style = ST_CENTER;
            font = "PuristaBold";
            sizeEx = 1.2 * GUI_TEXT_SIZE_LARGE;
            colorText[] = {1,1,1,1};
        };

        class CategoriesList: A3A_Listbox {
            idc = 85101;
            x = DIALOG_X + GRID_X(1);
            y = DIALOG_Y + GRID_Y(6);
            w = GRID_X(18);
            h = GRID_Y(30);
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
            h = GRID_Y(30);
            sizeEx = 0.8 * GUI_TEXT_SIZE_MEDIUM;
            rowHeight = 1.8 * GUI_TEXT_SIZE_MEDIUM;
            colorSelect[] = {0.2,0.7,0.9,1};
            onLBSelChanged = "call A3U_fnc_trackChanged";
        };

        class PlayButton: A3A_ShortcutButton {
            idc = 85103;
            x = DIALOG_X + GRID_X(19);
            y = DIALOG_Y + GRID_Y(42);
            w = GRID_X(6);
            h = GRID_Y(3);
            text = "▶";
            colorBackground[] = {0,0.5,0,1};
            action = "call A3U_fnc_playPause";
        };
        
        class PrevButton: A3A_ShortcutButton {
            idc = 85104;
            x = DIALOG_X + GRID_X(12);
            y = DIALOG_Y + GRID_Y(42);
            w = GRID_X(6);
            h = GRID_Y(3);
            text = "⏮";
            action = "call A3U_fnc_prevTrack";
        };
        
        class NextButton: A3A_ShortcutButton {
            idc = 85105;
            x = DIALOG_X + GRID_X(26);
            y = DIALOG_Y + GRID_Y(42);
            w = GRID_X(6);
            h = GRID_Y(3);
            text = "⏭";
            action = "call A3U_fnc_nextTrack";
        };
        
        class TrackProgress: A3A_Progress {
            idc = 85106;
            x = DIALOG_X + GRID_X(1);
            y = DIALOG_Y + GRID_Y(38);
            w = GRID_X(38);
            h = GRID_Y(1);
            colorBar[] = {0.2,0.6,1,0.8};
            texture = "#(argb,8,8,3)color(1,1,1,1)"; // Явное указание текстуры
        };
        
        class VolumeControl: A3A_Slider {
            idc = 85107;
            x = DIALOG_X + GRID_X(64);
            y = DIALOG_Y + GRID_Y(10);
            w = GRID_X(20);
            h = GRID_Y(5);
            onSliderPosChanged = "call A3U_fnc_volumeChanged";
        };

        class VolumeIcon: A3A_Picture {
            idc = 85108;
            x = DIALOG_X + GRID_X(50);
            y = DIALOG_Y + GRID_Y(25);
            w = GRID_X(4);
            h = GRID_Y(4);
            text = "▶";
        };

        class TrackInfo: A3A_StructuredText {
            idc = 85110;
            x = DIALOG_X + GRID_X(26.5);
            y = DIALOG_Y + GRID_Y(0.5);
            w = GRID_X(13);
            h = GRID_Y(3);
            
            class Attributes {
                align = "center";
                font = "PuristaMedium";
                size = 1.1;
            };
        };
    };
};
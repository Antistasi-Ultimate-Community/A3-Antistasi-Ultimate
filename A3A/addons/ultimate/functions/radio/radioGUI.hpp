// music_player.hpp
/* #include "script_component.hpp"

#define IDD_MUSIC_PLAYER         85000
#define IDC_LIST_CATEGORIES      85101
#define IDC_LIST_TRACKS          85102
#define IDC_BTN_PLAY             85103
#define IDC_BTN_PREV             85104
#define IDC_BTN_NEXT             85105
#define IDC_TRACK_PROGRESS       85106
#define IDC_VOLUME_SLIDER        85107
#define IDC_CURRENT_TRACK        85108

class RscDisplayMusicPlayer {
    idd = IDD_MUSIC_PLAYER;
    movingEnable = 1;
    enableSimulation = 1;
    
    class ControlsBackground {
        class Background: RscItemText {
            idc = -1;
            x = DIALOG_X;
            y = DIALOG_Y;
            w = GRID_X(DIALOG_W);
            h = GRID_Y(DIALOG_H);
            colorBackground[] = {0.1, 0.1, 0.1, 0.95};
        };
    };
    
    class Controls {
        class CategoriesList: RscItemListBoxCategories {
            idc = IDC_LIST_CATEGORIES;
            x = DIALOG_X + GRID_X(2);
            y = DIALOG_Y + GRID_Y(4);
            w = GRID_X(40);
            h = GRID_Y(70);
            onLBSelChanged = "call A3U_fnc_categoryChanged";
        };
        
        class TracksList: RscItemListBox {
            idc = IDC_LIST_TRACKS;
            x = DIALOG_X + GRID_X(44);
            y = DIALOG_Y + GRID_Y(4);
            w = GRID_X(80);
            h = GRID_Y(70);
            colorSelect[] = {0.2, 0.7, 0.9, 1};
            onLBSelChanged = "call A3U_fnc_trackChanged";
        };
        
        class PlayButton: RscItemButtonAction {
            idc = IDC_BTN_PLAY;
            x = DIALOG_X + GRID_X(60);
            y = DIALOG_Y + GRID_Y(76);
            w = GRID_X(20);
            h = GRID_Y(8);
            text = "▶";
            action = "call A3U_fnc_playPause";
        };
        
        class PrevButton: RscItemButtonAction {
            idc = IDC_BTN_PREV;
            x = DIALOG_X + GRID_X(30);
            y = DIALOG_Y + GRID_Y(76);
            w = GRID_X(20);
            h = GRID_Y(8);
            text = "⏮";
            action = "call A3U_fnc_prevTrack";
        };
        
        class NextButton: RscItemButtonAction {
            idc = IDC_BTN_NEXT;
            x = DIALOG_X + GRID_X(90);
            y = DIALOG_Y + GRID_Y(76);
            w = GRID_X(20);
            h = GRID_Y(8);
            text = "⏭";
            action = "call A3U_fnc_nextTrack";
        };
        
        class TrackProgress: RscItemProgress {
            idc = IDC_TRACK_PROGRESS;
            x = DIALOG_X + GRID_X(2);
            y = DIALOG_Y + GRID_Y(86);
            w = GRID_X(150);
            h = GRID_Y(2);
            colorBar[] = {0.2, 0.6, 1, 0.8};
        };
        
        class VolumeControl: RscItemSlider {
            idc = IDC_VOLUME_SLIDER;
            x = DIALOG_X + GRID_X(160);
            y = DIALOG_Y + GRID_Y(76);
            w = GRID_X(10);
            h = GRID_Y(15);
            onSliderPosChanged = "call A3U_fnc_volumeChanged";
        };

		// Иконка громкости
    	class VolumeIcon: RscItemPicture {
    	    idc = IDC_VOLUME_ICON;
    	    x = DIALOG_X + GRID_X(172);
    	    y = DIALOG_Y + GRID_Y(76);
    	    w = GRID_X(8);
    	    h = GRID_Y(8);
    	    text = "\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_volume_mid_ca.paa";
    	};
	
    	// Группа прогресса
    	class ProgressGroup: RscItemCtrlGroup {
    	    idc = IDC_PLAYER_GROUP;
    	    x = DIALOG_X + GRID_X(2);
    	    y = DIALOG_Y + GRID_Y(86);
    	    w = GRID_X(174);
    	    h = GRID_Y(10);
    	};
        
        class TrackInfo: RscItemStructuredText {
            idc = IDC_CURRENT_TRACK;
            x = DIALOG_X + GRID_X(126);
            y = DIALOG_Y + GRID_Y(56);
            w = GRID_X(50);
            h = GRID_Y(15);
            
            class Attributes {
                align = "center";
                color = "#FFFFFF";
                shadow = 1;
                font = "PuristaMedium";
                size = 1.1;
            };
        };
    };
}; */
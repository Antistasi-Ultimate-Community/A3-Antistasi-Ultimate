// dialogs.hpp
#include "defines.hpp"

#define COMPONENT musicPlayer

class RscDisplayMusicPlayer: A3A_DefaultDialog {
    idd = 85000;
    movingEnable = 1;
    moving = true;
    enableSimulation = 1;
    
    class ControlsBackground {
        class TitleBarBackground: A3A_Background {
            moving = 1;
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
            x = DIALOG_X;
            y = DIALOG_Y - 5 * GRID_H;
            w = GRID_X(DIALOG_W);
            h = 5 * GRID_H;
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
            x = DIALOG_X - GRID_X(40);  // left of the main window
            y = DIALOG_Y;
            w = GRID_X(38);
            h = GRID_Y(DIALOG_H);
            colorBackground[] = {0.05, 0.05, 0.05, 0.9};
        };

        // Debug text itself
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
            idc = 85123;                     // new IDC
            style = ST_PICTURE;
            x = DIALOG_X - GRID_X(6);        // right edge of the panel: -40 + 38 = -2, offset another 1 left
            y = DIALOG_Y + GRID_Y(0);         // top edge of the panel
            w = GRID_X(4);
            h = GRID_Y(4);
            text = "";
            animTextureNormal = "x\zen\addons\context_actions\ui\copy_ca.paa";
            animTextureDisabled = "x\zen\addons\context_actions\ui\copy_ca.paa";
            animTextureOver = "x\zen\addons\context_actions\ui\copy_ca.paa";
            animTextureFocused = "x\zen\addons\context_actions\ui\copy_ca.paa";
            animTexturePressed = "x\zen\addons\context_actions\ui\copy_ca.paa";
            animTextureDefault = "x\zen\addons\context_actions\ui\copy_ca.paa";
            tooltip = "$STR_A3U_debug_copy_tooltip";
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
            text = "$STR_A3U_dialog_title";
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

        // Toggle button (can be placed in the right part of the title bar)
        class DebugToggle: A3A_ClickablePicture {
            idc = 85122;
            style = ST_PICTURE;
            x = DIALOG_X + GRID_X(72);
            y = DIALOG_Y - GRID_Y(4);
            w = GRID_X(4);
            h = GRID_Y(4);
            text = "";
            animTextureNormal = "\A3\ui_f\data\map\vehicleicons\iconobject_ca.paa";
            animTextureDisabled = "\A3\ui_f\data\map\vehicleicons\iconobject_ca.paa";
            animTextureOver = "\A3\ui_f\data\map\vehicleicons\iconobject_ca.paa";
            animTextureFocused = "\A3\ui_f\data\map\vehicleicons\iconobject_ca.paa";
            animTexturePressed = "\A3\ui_f\data\map\vehicleicons\iconobject_ca.paa";
            animTextureDefault = "\A3\ui_f\data\map\vehicleicons\iconobject_ca.paa";
            onButtonClick = "call A3U_fnc_toggleDebug";
            tooltip = "$STR_A3U_debug_toggle_tooltip";
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
            tooltip = "$STR_A3U_play_tooltip";
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
            tooltip = "$STR_A3U_prev_tooltip";
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
            tooltip = "$STR_A3U_next_tooltip";
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
            animTextureNormal = "a3\modules_f_beta\data\firingdrills\restart_ca.paa"; // repeat icon
            animTextureDisabled = "a3\modules_f_beta\data\firingdrills\restart_ca.paa"; 
            animTextureOver = "a3\modules_f_beta\data\firingdrills\restart_ca.paa";
            animTextureFocused = "a3\modules_f_beta\data\firingdrills\restart_ca.paa";
            animTexturePressed = "a3\modules_f_beta\data\firingdrills\restart_ca.paa";
            animTextureDefault = "a3\modules_f_beta\data\firingdrills\restart_ca.paa";
            tooltip = "$STR_A3U_loop_off_tooltip";
            onButtonClick = "call A3U_fnc_toggleLoop";
            autoAdjustTexture = true;
            colorBackground[] = {1,1,1,1};
            // can add highlight when enabled later via script
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
            animTextureNormal = "x\zen\addons\compositions\ui\randomize_ca.paa"; // shuffle icon
            animTextureDisabled = "x\zen\addons\compositions\ui\randomize_ca.paa";
            animTextureOver = "x\zen\addons\compositions\ui\randomize_ca.paa";
            animTextureFocused = "x\zen\addons\compositions\ui\randomize_ca.paa";
            animTexturePressed = "x\zen\addons\compositions\ui\randomize_ca.paa";
            animTextureDefault = "x\zen\addons\compositions\ui\randomize_ca.paa";
            tooltip = "$STR_A3U_shuffle_on_tooltip";
            onButtonClick = "call A3U_fnc_toggleShuffle";
            autoAdjustTexture = true;
            colorBackground[] = {1,1,1,1};
            // can add highlight when enabled later via script
            class AttributesImage {
                font = "RobotoCondensed";
                color = "#FFFFFF";
                align = "left";
            };
        };

        // Loudspeaker button (increased range)
        class LoudspeakerButton: A3A_ClickablePicture {
            idc = 85118;
            style = ST_PICTURE;
            x = DIALOG_X + GRID_X(59); // adjust position as needed
            y = DIALOG_Y + GRID_Y(42.5);
            w = GRID_X(7);
            h = GRID_Y(7);
            text = "";
            animTextureNormal = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsUp_ca.paa"; // speaker icon
            animTextureDisabled = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsUp_ca.paa";
            animTextureOver = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsUp_ca.paa";
            animTextureFocused = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsUp_ca.paa";
            animTexturePressed = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsUp_ca.paa";
            animTextureDefault = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsUp_ca.paa";
            tooltip = "$STR_A3U_loudspeaker_tooltip";
            onButtonClick = "call A3U_fnc_toggleLoudspeaker";
            autoAdjustTexture = true;
            colorBackground[] = {1,1,1,1};
            class AttributesImage {
                font = "RobotoCondensed";
                color = "#FFFFFF";
                align = "left";
            };
        };
        
        // Boost slider
        class BoostSlider: A3A_Slider {
            idc = 85119;
            x = DIALOG_X + GRID_X(56.5); // adjust position as needed
            y = DIALOG_Y + GRID_Y(40);
            w = GRID_X(20);
            h = GRID_Y(2);
            style = SL_HORZ;
            sliderRange[] = {0, 4}; // 0..4 for five positions
            sliderPosition = 0;
            lineSize = 1;
            tooltip = "$STR_A3U_boost_tooltip_long";
            onSliderPosChanged = "call A3U_fnc_boostChanged";
        };

        class CategoryModeButton: A3A_ClickablePicture {
            idc = 85116;
            style = ST_PICTURE;
            x = DIALOG_X + GRID_X(0);
            y = DIALOG_Y + GRID_Y(47);
            w = GRID_X(3);
            h = GRID_Y(3);
            text = "";
            animTextureNormal = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa"; // filter icon
            animTextureDisabled = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa";
            animTextureOver = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa";
            animTextureFocused = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa";
            animTexturePressed = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa";
            animTextureDefault = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa";
            tooltip = "$STR_A3U_category_mode_all";
            onButtonClick = "call A3U_fnc_toggleCategoryMode";
            autoAdjustTexture = true;
            colorBackground[] = {1,1,1,1};
            class AttributesImage {
                font = "RobotoCondensed";
                color = "#FFFFFF";
                align = "left";
            };
        };

        class TrackProgress: A3A_Slider {
            idc = 85106;
            x = DIALOG_X + GRID_X(1);
            y = DIALOG_Y + GRID_Y(40);
            w = GRID_X(55);
            h = GRID_Y(2);
            color[] = {0.2,0.6,1,0.8};
            style = SL_HORZ;
            texture = "#(argb,8,8,3)color(1,1,1,1)"; // Explicit texture definition
        };
        class SoundTrackProgress: A3A_Progress {
            idc = 85117;
            x = DIALOG_X + GRID_X(1);
            y = DIALOG_Y + GRID_Y(40);
            w = GRID_X(55);
            h = GRID_Y(2);
            colorBar[] = {0.2,0.6,1,0.8};
            texture = "#(argb,8,8,3)color(1,1,1,1)"; // Explicit texture definition
        };

        class TrackTimer: A3A_Text {
            idc = 85115;
            x = DIALOG_X + GRID_X(56);
            y = DIALOG_Y + GRID_Y(30);
            w = GRID_X(24);
            h = GRID_Y(4);               // increase height to prevent text clipping
            style = ST_CENTER;
            sizeEx = 1.8 * GUI_TEXT_SIZE_LARGE;
            colorText[] = {0.8,0.8,0.8,1};
            text = "00:00 / 00:00";
        };
        
        class VolumeControl: A3A_Slider {
            idc = 85107;
            style = SL_HORZ;
	        //type = CT_SLIDER;
            x = DIALOG_X + GRID_X(56.5);
            y = DIALOG_Y + GRID_Y(35);
            w = GRID_X(23);
            h = GRID_Y(4);
            onSliderPosChanged = "call A3U_fnc_volumeChanged";
            tooltip = "$STR_A3U_volume_change";
        };

        class VolumeIconOn: A3A_ClickablePicture {
            idc = 85108;
            style = ST_PICTURE;
            x = DIALOG_X + GRID_X(65);
            y = DIALOG_Y + GRID_Y(43);
            w = GRID_X(6);
            h = GRID_Y(6);
            text = "";
            animTextureNormal = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_on_ca.paa";
            animTextureDisabled = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_on_ca.paa";
            animTextureOver = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_on_ca.paa";
            animTextureFocused = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_on_ca.paa";
            animTexturePressed = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_off_ca.paa";
            animTextureDefault = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_on_ca.paa";
            tooltip = "$STR_A3U_mute_off";
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
            y = DIALOG_Y + GRID_Y(43);
            w = GRID_X(6);
            h = GRID_Y(6);
            text = "";
            animTextureNormal = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_off_ca.paa";
            animTextureDisabled = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_off_ca.paa";
            animTextureOver = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_off_ca.paa";
            animTextureFocused = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_off_ca.paa";
            animTexturePressed = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_on_ca.paa";
            animTextureDefault = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_off_ca.paa";
            tooltip = "$STR_A3U_mute_on";
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
            idc = 85111;                     // IDC for mod icon
            x = DIALOG_X + GRID_X(57);       // to the right of TrackInfo
            y = DIALOG_Y + GRID_Y(6);         // slightly below the top edge (under Title)
            w = GRID_X(22);
            h = GRID_Y(22);
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
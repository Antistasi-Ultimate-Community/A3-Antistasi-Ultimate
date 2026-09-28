/*
Maintainer: DoomMetal
    Contains constants and macros for the GUI.
*/

//////////////////
// HEADER GUARD //
//////////////////

#define INCLUDED_DEFINES_HPP

/////////////
// IMPORTS //
/////////////

#ifndef GUI_BCG_COLOR
    #include "\a3\ui_f\hpp\definecommoncolors.inc"
#endif


////////////////////
// GENERIC MACROS //
////////////////////
#define REFLECT(Text) Text
#define SHARP REFLECT(#)
#define QUOTE(Text) #Text

#include "\x\A3A\addons\core\ui_const.hpp"

///////////////
// PIXELGRID //
///////////////

#define pixelScale 0.5  // Was originally 0.5.
#define PixelGridScaler pixelGridNoUIScale
#define GRID_W (pixelW * PixelGridScaler * pixelScale)
#define GRID_H (pixelH * PixelGridScaler * pixelScale)

// Converts pixelGrid units to GUI coordinates
#define PX_W(n) n*GRID_W
#define PX_H(n) n*GRID_H

// Gets origin (top-left) in GUI coordinates of a centered box defined by pixelGrid units
#define CENTER_X(n) ((getResolution select 2) * 0.5 * pixelW) - (0.5 * (PX_W(n)))
#define CENTER_Y(n) ((getResolution select 3) * 0.5 * pixelH) - (0.5 * (PX_H(n)))

// Text sizes
#define GUI_TEXT_SIZE_EXTRA_SMALL (GRID_H * 2.5)
#define GUI_TEXT_SIZE_SMALL (GRID_H * 3.2) // Fits inside 3*GRID_H
#define GUI_TEXT_SIZE_SPECIAL (GRID_H * 3.5) // Fits inside alright)
#define GUI_TEXT_SIZE_MEDIUM (GRID_H * 4.2)  // Fits inside 4*GRID_H
#define GUI_TEXT_SIZE_LARGE (GRID_H * 5) // Fits inside 6*GRID_H


////////////
// COLORS //
////////////

// Background
#define A3A_COLOR_BACKGROUND {0.2,0.2,0.2,0.75}

// Titlebar background
#define A3A_COLOR_TITLEBAR_BACKGROUND GUI_BCG_COLOR
#define A3A_COLOR_TITLEBAR_BACKGROUND_SQF [GUI_BCG_RGB, GUI_BCG_ALPHA]

// Tabs Background
#define A3A_COLOR_TABS_BACKGROUND {0.2,0.2,0.2,0.9}

// Default text
#define A3A_COLOR_TEXT {1,1,1,1}

// Default text
#define A3A_COLOR_TITLEBAR_TEXT GUI_TITLETEXT_COLOR

// Darker text
#define A3A_COLOR_TEXT_DARKER {0.7,0.7,0.7,1}
#define A3A_COLOR_TEXT_DARKER_SQF [0.7,0.7,0.7,1]

// Active elements ("selection color")
#define A3A_COLOR_ACTIVE {0.95,0.95,0.95,1}

// Warning / Accents
#define A3A_COLOR_WARNING IGUI_WARNING_COLOR

// Error / Strong accents
#define A3A_COLOR_ERROR IGUI_ERROR_COLOR

// Shadows / Outlines
#define A3A_COLOR_SHADOW {0,0,0,0.5}

// Transparent, defined explicitly for readability
#define A3A_COLOR_TRANSPARENT {0,0,0,0}

// Other useful colors
#define A3A_COLOR_BLACK {0,0,0,1}
#define A3A_COLOR_WHITE {1,1,1,1}

// Tooltips
#define A3A_COLOR_TOOLTIP_TEXT {1,1,1,1}
#define A3A_COLOR_TOOLTIP_BOX {1,1,1,1}
#define A3A_COLOR_TOOLTIP_BACKGROUND {0,0,0,0.65}

// Buttons
#define A3A_COLOR_BUTTON_TEXT A3A_COLOR_TEXT
#define A3A_COLOR_BUTTON_TEXT_DISABLED {1,1,1,0.25}
#define A3A_COLOR_BUTTON_BACKGROUND {0,0,0,1}
#define A3A_COLOR_BUTTON_BACKGROUND_DISABLED {0,0,0,0.5}
#define A3A_COLOR_BUTTON_ACTIVE A3A_COLOR_TITLEBAR_BACKGROUND
#define A3A_COLOR_BUTTON_FOCUSED A3A_COLOR_TITLEBAR_BACKGROUND

// Map select marker
#define A3A_COLOR_SELECT_MARKER {1,1,1,0.75}

// Commander display
#define A3A_COLOR_COMMANDER {1,0.9,0.5,1}
#define A3A_COLOR_ELIGIBLE {0.7,0.7,0.7,1}
#define A3A_COLOR_INELIGIBLE {0.5,0.5,0.5,1}


///////////
// FONTS //
///////////

#define A3A_DEFAULT_FONT "RobotoCondensed"
#define A3A_BUTTON_FONT "PuristaLight"
#define A3A_TITLEBAR_FONT "PuristaMedium"
#define A3A_NOTIFICATION_FONT "PuristaSemiBold"

//////////////
// TEXTURES //
//////////////

#define A3A_GUI_TEXTURE_PATH_OF(Filename) x\A3A\addons\GUI\dialogues\textures\##Filename
#define A3A_GUI_QTEXTURE_PATH_OF(Filename) QUOTE(A3A_GUI_TEXTURE_PATH_OF(Filename))

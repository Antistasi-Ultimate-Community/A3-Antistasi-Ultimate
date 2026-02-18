#include "ui_const.hpp"

////////////////
//Base Classes//
////////////////

class A3A_core_BattleMenuText
{
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_MULTI;
    linespacing = 1;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,.5};
    text = "";
    shadow = 2;
    font = "PuristaMedium";
    SizeEx = 0.02300;
    fixedWidth = 0;
    x = 0;
    y = 0;
    h = 0;
    w = 0;

};

class A3A_core_BattleMenuPicture
{
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_PICTURE;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    font = "PuristaMedium";
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.2;
    h = 0.15;
};

class A3A_core_BattleMenuRedButton
{

access = 0;
    type = CT_BUTTON;
    text = "";
    colorText[] = {0.73,0,0,1};
    colorDisabled[] = {0.4,0.4,0.4,0};
    colorBackground[] =  {0.247,0.243,0.243,1};
    colorBackgroundDisabled[] = {0,0.0,0};
    colorBackgroundActive[] = {0.247,0.243,0.243,1};
    colorFocused[] = {0.247,0.243,0.243,1};
    colorShadow[] = {0.023529,0,0.0313725,1};
    colorBorder[] = {0.023529,0,0.0313725,1};
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
    style = 2;
    x = 0;
    y = 0;
    w = 0.055589;
    h = 0.039216;
    shadow = 2;
    font = "PuristaMedium";
    sizeEx = 0.05;
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
    onMouseEnter = "(_this select 0) ctrlSetTextColor [1,0.969,0,1]";
    onMouseExit = "(_this select 0) ctrlSetTextColor [0.73,0,0,1]";
};

class A3A_core_BattleMenuFrame
{
    type = CT_STATIC;
    idc = -1;
    style = ST_FRAME;
    shadow = 2;
    colorBackground[] = {1,1,1,1};//{1,1,1,1}
    colorText[] = {1,1,1,0.9};
    font = "PuristaMedium";
    sizeEx = 0.03;
    text = "";
};
class A3A_core_BattleMenuBOX
{
   type = CT_STATIC;
    idc = -1;
    style = ST_CENTER;
    shadow = 2;
    colorText[] = {1,1,1,1};
    font = "PuristaMedium";
    sizeEx = 0.02;
    colorBackground[] = { 0.2,0.2,0.2, 0.9 };
    text = "";
};
/*
class ScrollBar
 {
  arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
  arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
  border = "#(argb,8,8,3)color(1,1,1,1)";
  color[] = {1,1,1,0.6};
  colorActive[] = {1,1,1,1};
  colorDisabled[] = {1,1,1,0.3};
  thumb = "#(argb,8,8,3)color(1,1,1,1)";
 };
*/
class A3A_core_BattleMenuListBox
{
     access = 0;
     type = 5;
     style = 0;
     w = 0.4;
     h = 0.4;
     font = "TahomaB";
     sizeEx = 0.04;
     rowHeight = 0;
     colorText[] = {1,1,1,1};
     colorScrollbar[] = {1,1,1,1};
     colorSelect[] = {0,0,0,1};
     colorSelect2[] = {1,0.5,0,1};
     colorSelectBackground[] = {0.6,0.6,0.6,1};
     colorSelectBackground2[] = {0.2,0.2,0.2,1};
     colorBackground[] = {0.2,0.2,0.2,0.9};
     maxHistoryDelay = 1.0;
     soundSelect[] = {"",0.1,1};
     period = 1;
     autoScrollSpeed = -1;
     autoScrollDelay = 5;
     autoScrollRewind = 0;
     arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
     arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
     shadow = 0;
     class ListScrollBar// : ScrollBar //ListScrollBar is class name required for Arma 3
     {
          color[] = {1,1,1,0.6};
          colorActive[] = {1,1,1,1};
          colorDisabled[] = {1,1,1,0.3};
          thumb = "#(argb,8,8,3)color(1,1,1,1)";
          arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
          arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
          border = "#(argb,8,8,3)color(1,1,1,1)";
          shadow = 0;
     };
};

#include "defines.hpp"
#include "idcs.hpp"
#include "sizes.hpp"

class RscDisplayStore {
	idd = IDD_DISPLAY_STORE;
	onLoad = "['onLoad', _this] call HALs_store_fnc_main";
	onUnload = "['onUnload', _this] call HALs_store_fnc_main";
	
	class controlsBackground { 
		class TitleBackground: RscItemText {
			moving = true;
			x = DIALOG_X;
			y = DIALOG_Y;
			w = GRID_X(STORE_W);
			h = GRID_Y(BAR_H);
			colorBackground[] = {0.1, 0.1, 0.1, 1};
		};

		class StoreBackground: RscItemText {
			moving = true;
			x = DIALOG_X;
			y = DIALOG_Y + GRID_Y(BAR_H + SPACE_H2);
			w = GRID_X(STORE_W);
			h = GRID_Y(STORE_H - (BAR_H + SPACE_H2));
			colorBackground[] = {0.05, 0.05, 0.05, 0.7};
		};
	};

	class controls {
		class CloseButton: RscItemButtonClose {
			x = DIALOG_X + GRID_X(STORE_W - BAR_W);
			y = DIALOG_Y;
			w = GRID_X(BAR_W);
			h = GRID_Y(BAR_H);
	
			action = "['onUnload'] call HALs_store_fnc_main;";
			colorText[] = {1, 1, 1, 0.7};
			color[] = {1, 1, 1, 0.7};
		};
		
		class TitleFunds: RscItemStructuredText {
			idc = IDC_FUNDS;

			x = DIALOG_X + GRID_X(STORE_W - BAR_W - BAR_W - FUNDS_W);
			y = DIALOG_Y;
			w = GRID_X(FUNDS_W);
			h = GRID_Y(FUNDS_H);

			colorText[] = {0.66666666666, 1, 0.66666666666, 1};
			class Attributes {
				align = "right";
				font = "PuristaMedium";
				color = "#aaffaa";
				valign = "bottom";
				shadow='1';
			};
		};

		class TitleText: RscItemText {
			idc = IDC_TITLE;
					
			x = DIALOG_X;
			y = DIALOG_Y;
			w = GRID_X(STORE_W);
			h = GRID_Y(BAR_H);
					
			colorText[] = {0.95, 0.95, 0.95, 1};
			colorShadow[] = {0, 0, 0, 0.5};
			sizeEx = FONT(1);
			font = "RobotoCondensed";
			style = 0;
			shadow = 1;
		};

		class HelpButton {
			idc = -1;
			x = DIALOG_X + GRID_X(STORE_W - BAR_W - BAR_W);
			y = DIALOG_Y;
			w = GRID_X(BAR_W);
			h = GRID_Y(BAR_H);
			
			type = 11;
			style = 48;
			colorText[] = {1, 1, 1, 0.7};
			color[] = {1, 1, 1, 0.7};
			colorActive[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,0.25};
			soundEnter[] = {"",0.1,1};
			soundPush[] = {"",0.1,1};
			soundClick[] = {"",0.1,1};
			soundEscape[] = {"",0.1,1};
			text = "\a3\Ui_f\data\GUI\RscCommon\RscDebugConsole\biki_ca.paa";
			default = 0;
			font = "RobotoCondensed";
			shadow = 2;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			url = "https://github.com/HallyG/HALs_Store/wiki/Usage";
			tooltip = "Open the Usage page on the wiki.";
			tooltipColorShade[] = {0, 0, 0, 0.65};
			tooltipColorText[] = {1, 1, 1, 1};
			tooltipColorBox[] = {1, 1, 1, 0};
		};
		
		class ContainerGroup: RscItemCtrlGroupNoScrollbars {
			idc = IDC_GROUP_TRADER;
			x = TRADER_X;
			y = DIALOG_Y + GRID_Y(BAR_H + SPACE_H2);
			w = GRID_X(TRADER_W);
			h = GRID_Y(TRADER_H);
			
			class controls {
				#include "ui\container.hpp"
			};
		};
			
		class HALs_store_dialog: RscItemCtrlGroupNoScrollbars {
			idc = IDC_GROUP_ITEMS;
			x = DIALOG_X;
			y = DIALOG_Y + GRID_Y(BAR_H + SPACE_H + SPACE_H2);
			w = GRID_X(BUFFER_W + LIST_W);
			h = GRID_Y(STORE_H);

			class controls {
				#include "ui\items.hpp"
			};
		};
	
		class SelectedItemGroup: RscItemCtrlGroupNoScrollbars {
			idc = IDC_GROUP_SELECTED;
			
			x = DIALOG_X + GRID_X(ITEM_X);
			y = DIALOG_Y + GRID_Y(ITEM_Y);
			w = GRID_X(ITEM_W);
			h = GRID_Y(STORE_H);

			class controls {
				#include "ui\itemStats.hpp"
			};
		};
	};
};

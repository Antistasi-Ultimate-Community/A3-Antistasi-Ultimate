#include "\x\A3A\addons\core\ui_define.hpp"
#include "\x\A3A\addons\scrt\defines.hpp"
#include "RscDefine.hpp"

class GVAR(headerBase): headerBase {
	fade = 0;
	colorBackground[] = {0,0,0,0.8};
};

class GVAR(ButtonBase): ButtonBase {
	fade = 0;
};

class GVAR(RscEdit): RscEdit {
	UI_FONT_DEFAULT;
};

class GVAR(RscStructuredText): RscStructuredText {
	class Attributes {
		color = "#ffffff";
		UI_FONT_DEFAULT;
	};
};

class GVAR(RscText): RscText {
	UI_FONT_DEFAULT;
};

// Replace attributes:
//  Search: (^\s*(?:sizeEx|[xywh])) = ([^;]+)
//  Replace: $1 = QUOTE($2)
// Text:
//  Search: (^\s*(?:text|tooltip)\s*=\s*)[$]STR_A3_([^;]+)
//  Replace: $1CSTRING($2)

/* #Kagevu
$[
	1.063,
	["RscA3USPCMStoreSellDialog",[[0,0,1,1],0.025,0.04,"GUI_GRID"],2,1,1],
	[1000,"StaticTitle",[1,"A3USPCM Faster Loot Selling",["0.215375 * safezoneW + safezoneX","0.181 * safezoneH + safezoneY","0.551719 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0,0.8,0,1],[-1,-1,-1,-1],"","-1"],["moving = 1;"]],
	[1001,"StaticBackground",[1,"",["0.215313 * safezoneW + safezoneX","0.219 * safezoneH + safezoneY","0.5775 * safezoneW","0.561 * safezoneH"],[-1,-1,-1,-1],[0,0,0,0.8],[-1,-1,-1,-1],"","-1"],[]],
	[1800,"FrameItemInfo",[1,"Item name goes here",["0.62375 * safezoneW + safezoneX","0.236 * safezoneH + safezoneY","0.159844 * safezoneW","0.44 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["sizeEx = 0.03;"]],
	[1602,"BtnClose",[1,"X",["0.77225 * safezoneW + safezoneX","0.181 * safezoneH + safezoneY","0.020625 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1603,"BtnSell",[1,"Sell",["0.630969 * safezoneW + safezoneX","0.621 * safezoneH + safezoneY","0.0721875 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0,0.8,0,1],[-1,-1,-1,-1],"","-1"],["wantSelectionData = 1;"]],
	[1200,"PictureSellItemSquare",[1,"#(argb,8,8,3)color(0,0,0,0)",["0.732031 * safezoneW + safezoneX","0.258 * safezoneH + safezoneY","0.04125 * safezoneW","0.077 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2100,"DropFilterSelect",[1,"",["0.220531 * safezoneW + safezoneX","0.236 * safezoneH + safezoneY","0.391875 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"ListContainerContent",[1,"",["0.22053 * safezoneW + safezoneX","0.269 * safezoneH + safezoneY","0.391875 * safezoneW","0.495 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["type = CT_LISTNBOX;","drawSideArrows = true;","idcLeft = -1;","idcRight = -1;","tooltipPerColumn = true;","sizeEx = 0.08;"]],
	[1002,"LabelShowUnsellable",[1,"Show unsellable items",["0.649531 * safezoneW + safezoneX","0.7222 * safezoneH + safezoneY","0.118594 * safezoneW","0.055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2800,"CheckShowUnsellable",[1,"",["0.62375 * safezoneW + safezoneX","0.7332 * safezoneH + safezoneY","0.020625 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1003,"LabelAmount",[1,"Amount:",["0.628906 * safezoneW + safezoneX","0.577 * safezoneH + safezoneY","0.0464063 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1400,"EditAmount",[1,"",["0.670156 * safezoneW + safezoneX","0.5836 * safezoneH + safezoneY","0.0309375 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[0,0,0,0],[-1,-1,-1,-1],"","-1"],["style = ST_RIGHT;"]],
	[1005,"LabelItemSalePrice",[1,"Item sale price:",["0.628906 * safezoneW + safezoneX","0.511 * safezoneH + safezoneY","0.0876563 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1007,"TextItemPrice",[1,"0",["0.737188 * safezoneW + safezoneX","0.5132 * safezoneH + safezoneY","0.04125 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["style = ST_RIGHT;"]],
	[1004,"LabelItemInfoCount",[1,"Amount in container:",["0.628906 * safezoneW + safezoneX","0.4824 * safezoneH + safezoneY","0.0876563 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1006,"TextItemCount",[1,"0",["0.737188 * safezoneW + safezoneX","0.4846 * safezoneH + safezoneY","0.04125 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["style = ST_RIGHT;"]],
	[1008,"LabelTotalSale",[1,"Total sale:",["0.628906 * safezoneW + safezoneX","0.5396 * safezoneH + safezoneY","0.0876563 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1009,"TextTotalSale",[1,"0",["0.737188 * safezoneW + safezoneX","0.5418 * safezoneH + safezoneY","0.04125 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["style = ST_RIGHT;"]],
	[1010,"StaticWaitForBreakdown",[1,"Please wait a moment while box contents are broken down.",["0.62375 * safezoneW + safezoneX","0.676 * safezoneH + safezoneY","0.159844 * safezoneW","0.066 * safezoneH"],[1,0,0,1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["style = ST_CENTER + ST_MULTI;"]],
	[1100,"TextItemDescription",[1,"",["0.628906 * safezoneW + safezoneX","0.335 * safezoneH + safezoneY","0.149531 * safezoneW","0.143 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["sizeEx = 0.02;"]],
	[1600,"BtnSellAll",[1,"Sell all",["0.70625 * safezoneW + safezoneX","0.621 * safezoneH + safezoneY","0.0721875 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0,0.8,0,1],[-1,-1,-1,-1],"","-1"],["wantSelectionData = 1;"]],
	[1601,"BtnProtect",[1,"Protect",["0.70625 * safezoneW + safezoneX","0.577 * safezoneH + safezoneY","0.0721875 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0,0.8,0,1],[-1,-1,-1,-1],"Protect an item from being sold when using sell all","-1"],["wantSelectionData = 1;"]]
]
*/
class GVAR(sellDialog) {
    idd = 6119821;
    onLoad = QUOTE(call FUNC(onSellDialogOpen));
    onUnload = QUOTE(call FUNC(onSellDialogClose));
	movingEnable = 1;

    class Filters {
        class GroupedByType {
            displayName = CSTRING(RscA3USPCMStoreSellDialog_FilterSelect_GroupedByType);
            function = QUOTE(call FUNC(filterGroupedByType));
        };

        class SortAlphabetically {
            displayName = CSTRING(RscA3USPCMStoreSellDialog_FilterSelect_SortAlphabetically);
            function = QUOTE(call FUNC(filterSortAlphabetically));
        };

        class SortByAmount {
            displayName = CSTRING(RscA3USPCMStoreSellDialog_FilterSelect_SortByAmount);
            function = QUOTE(call FUNC(filterSortByAmount));
        };

        class SortByPrice {
            displayName = CSTRING(RscA3USPCMStoreSellDialog_FilterSelect_SortByPrice);
            function = QUOTE(call FUNC(filterSortByPrice));
        };
    };

    class Controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by goreSplatter, v1.063, #Kagevu)
		////////////////////////////////////////////////////////

		class StaticTitle: GVAR(headerBase)
		{
			idc = IDC_RSCA3USPCMSTORESELLDIALOG_STATICTITLE;
			text = CSTRING(RscA3USPCMStoreSellDialog_StaticTitle);
			x = QUOTE(0.215375 * safezoneW + safezoneX);
			y = QUOTE(0.181 * safezoneH + safezoneY);
			w = QUOTE(0.551719 * safezoneW);
			h = QUOTE(0.033 * safezoneH);
			moving = 1;
		};
		class StaticBackground: GVAR(RscText)
		{
			idc = IDC_RSCA3USPCMSTORESELLDIALOG_STATICBACKGROUND;
			x = QUOTE(0.215313 * safezoneW + safezoneX);
			y = QUOTE(0.219 * safezoneH + safezoneY);
			w = QUOTE(0.5775 * safezoneW);
			h = QUOTE(0.561 * safezoneH);
			colorBackground[] = {0,0,0,0.8};
		};
		class FrameItemInfo: RscFrame
		{
			sizeEx = QUOTE(0.03);

			idc = IDC_RSCA3USPCMSTORESELLDIALOG_FRAMEITEMINFO;
			text = CSTRING(RscA3USPCMStoreSellDialog_FrameItemInfo);
			x = QUOTE(0.62375 * safezoneW + safezoneX);
			y = QUOTE(0.236 * safezoneH + safezoneY);
			w = QUOTE(0.159844 * safezoneW);
			h = QUOTE(0.44 * safezoneH);

			UI_FONT_DEFAULT;
		};
		class BtnClose: GVAR(ButtonBase)
		{
			idc = IDC_RSCA3USPCMSTORESELLDIALOG_BTNCLOSE;
			text = CSTRING(RscA3USPCMStoreSellDialog_BtnClose);
			x = QUOTE(0.77225 * safezoneW + safezoneX);
			y = QUOTE(0.181 * safezoneH + safezoneY);
			w = QUOTE(0.020625 * safezoneW);
			h = QUOTE(0.033 * safezoneH);
		};
		class BtnSell: GVAR(ButtonBase)
		{
			wantSelectionData = 1;

			idc = IDC_RSCA3USPCMSTORESELLDIALOG_BTNSELL;
			text = CSTRING(RscA3USPCMStoreSellDialog_BtnSell);
			x = QUOTE(0.630969 * safezoneW + safezoneX);
			y = QUOTE(0.621 * safezoneH + safezoneY);
			w = QUOTE(0.0721875 * safezoneW);
			h = QUOTE(0.033 * safezoneH);
		};
		class PictureSellItemSquare: RscPictureKeepAspect
		{
			idc = IDC_RSCA3USPCMSTORESELLDIALOG_PICTURESELLITEMSQUARE;
			text = "#(argb,8,8,3)color(0,0,0,0)";
			x = QUOTE(0.732031 * safezoneW + safezoneX);
			y = QUOTE(0.258 * safezoneH + safezoneY);
			w = QUOTE(0.04125 * safezoneW);
			h = QUOTE(0.077 * safezoneH);
		};
		class DropFilterSelect: RscCombo
		{
			idc = IDC_RSCA3USPCMSTORESELLDIALOG_DROPFILTERSELECT;
			x = QUOTE(0.220531 * safezoneW + safezoneX);
			y = QUOTE(0.236 * safezoneH + safezoneY);
			w = QUOTE(0.391875 * safezoneW);
			h = QUOTE(0.022 * safezoneH);
		
			UI_FONT_DEFAULT;
		};
		class ListContainerContent: RscListbox
		{
			type = CT_LISTNBOX;
			drawSideArrows = true;
			idcLeft = -1;
			idcRight = -1;
			tooltipPerColumn = true;
			sizeEx = QUOTE(0.08);

			idc = IDC_RSCA3USPCMSTORESELLDIALOG_LISTCONTAINERCONTENT;
			x = QUOTE(0.22053 * safezoneW + safezoneX);
			y = QUOTE(0.269 * safezoneH + safezoneY);
			w = QUOTE(0.391875 * safezoneW);
			h = QUOTE(0.495 * safezoneH);

			UI_FONT_DEFAULT;
		};
		class LabelShowUnsellable: GVAR(RscText)
		{
			idc = IDC_RSCA3USPCMSTORESELLDIALOG_LABELSHOWUNSELLABLE;
			text = CSTRING(RscA3USPCMStoreSellDialog_LabelShowUnsellable);
			x = QUOTE(0.649531 * safezoneW + safezoneX);
			y = QUOTE(0.7222 * safezoneH + safezoneY);
			w = QUOTE(0.118594 * safezoneW);
			h = QUOTE(0.055 * safezoneH);
		};
		class CheckShowUnsellable: RscCheckbox
		{
			idc = IDC_RSCA3USPCMSTORESELLDIALOG_CHECKSHOWUNSELLABLE;
			x = QUOTE(0.62375 * safezoneW + safezoneX);
			y = QUOTE(0.7332 * safezoneH + safezoneY);
			w = QUOTE(0.020625 * safezoneW);
			h = QUOTE(0.033 * safezoneH);
		};
		class LabelAmount: GVAR(RscText)
		{
			idc = IDC_RSCA3USPCMSTORESELLDIALOG_LABELAMOUNT;
			text = CSTRING(RscA3USPCMStoreSellDialog_LabelAmount);
			x = QUOTE(0.628906 * safezoneW + safezoneX);
			y = QUOTE(0.577 * safezoneH + safezoneY);
			w = QUOTE(0.0464063 * safezoneW);
			h = QUOTE(0.033 * safezoneH);
		};
		class EditAmount: GVAR(RscEdit)
		{
			style = ST_RIGHT;

			idc = IDC_RSCA3USPCMSTORESELLDIALOG_EDITAMOUNT;
			x = QUOTE(0.670156 * safezoneW + safezoneX);
			y = QUOTE(0.5836 * safezoneH + safezoneY);
			w = QUOTE(0.0309375 * safezoneW);
			h = QUOTE(0.022 * safezoneH);
			colorBackground[] = {0,0,0,0};
		};
		class LabelItemSalePrice: GVAR(RscText)
		{
			idc = IDC_RSCA3USPCMSTORESELLDIALOG_LABELITEMSALEPRICE;
			text = CSTRING(RscA3USPCMStoreSellDialog_LabelItemSalePrice);
			x = QUOTE(0.628906 * safezoneW + safezoneX);
			y = QUOTE(0.511 * safezoneH + safezoneY);
			w = QUOTE(0.0876563 * safezoneW);
			h = QUOTE(0.033 * safezoneH);
		};
		class TextItemPrice: GVAR(RscText)
		{
			style = ST_RIGHT;

			idc = IDC_RSCA3USPCMSTORESELLDIALOG_TEXTITEMPRICE;
			text = CSTRING(RscA3USPCMStoreSellDialog_TextItemPrice);
			x = QUOTE(0.737188 * safezoneW + safezoneX);
			y = QUOTE(0.5132 * safezoneH + safezoneY);
			w = QUOTE(0.04125 * safezoneW);
			h = QUOTE(0.033 * safezoneH);
		};
		class LabelItemInfoCount: GVAR(RscText)
		{
			idc = IDC_RSCA3USPCMSTORESELLDIALOG_LABELITEMINFOCOUNT;
			text = CSTRING(RscA3USPCMStoreSellDialog_LabelItemInfoCount);
			x = QUOTE(0.628906 * safezoneW + safezoneX);
			y = QUOTE(0.4824 * safezoneH + safezoneY);
			w = QUOTE(0.0876563 * safezoneW);
			h = QUOTE(0.033 * safezoneH);
		};
		class TextItemCount: GVAR(RscText)
		{
			style = ST_RIGHT;

			idc = IDC_RSCA3USPCMSTORESELLDIALOG_TEXTITEMCOUNT;
			text = CSTRING(RscA3USPCMStoreSellDialog_TextItemCount);
			x = QUOTE(0.737188 * safezoneW + safezoneX);
			y = QUOTE(0.4846 * safezoneH + safezoneY);
			w = QUOTE(0.04125 * safezoneW);
			h = QUOTE(0.033 * safezoneH);
		};
		class LabelTotalSale: GVAR(RscText)
		{
			idc = IDC_RSCA3USPCMSTORESELLDIALOG_LABELTOTALSALE;
			text = CSTRING(RscA3USPCMStoreSellDialog_LabelTotalSale);
			x = QUOTE(0.628906 * safezoneW + safezoneX);
			y = QUOTE(0.5396 * safezoneH + safezoneY);
			w = QUOTE(0.0876563 * safezoneW);
			h = QUOTE(0.033 * safezoneH);
		};
		class TextTotalSale: GVAR(RscText)
		{
			style = ST_RIGHT;

			idc = IDC_RSCA3USPCMSTORESELLDIALOG_TEXTTOTALSALE;
			text = CSTRING(RscA3USPCMStoreSellDialog_TextTotalSale);
			x = QUOTE(0.737188 * safezoneW + safezoneX);
			y = QUOTE(0.5418 * safezoneH + safezoneY);
			w = QUOTE(0.04125 * safezoneW);
			h = QUOTE(0.033 * safezoneH);
		};
		class StaticWaitForBreakdown: GVAR(RscText)
		{
			style = ST_CENTER + ST_MULTI;

			idc = IDC_RSCA3USPCMSTORESELLDIALOG_STATICWAITFORBREAKDOWN;
			text = CSTRING(RscA3USPCMStoreSellDialog_StaticWaitForBreakdown);
			x = QUOTE(0.62375 * safezoneW + safezoneX);
			y = QUOTE(0.676 * safezoneH + safezoneY);
			w = QUOTE(0.159844 * safezoneW);
			h = QUOTE(0.066 * safezoneH);
			colorText[] = {1,0,0,1};
		};
		class TextItemDescription: GVAR(RscStructuredText)
		{
			sizeEx = QUOTE(0.02);

			idc = IDC_RSCA3USPCMSTORESELLDIALOG_TEXTITEMDESCRIPTION;
			x = QUOTE(0.628906 * safezoneW + safezoneX);
			y = QUOTE(0.335 * safezoneH + safezoneY);
			w = QUOTE(0.149531 * safezoneW);
			h = QUOTE(0.143 * safezoneH);
		};
		class BtnSellAll: GVAR(ButtonBase)
		{
			wantSelectionData = 1;

			idc = IDC_RSCA3USPCMSTORESELLDIALOG_BTNSELLALL;
			text = CSTRING(RscA3USPCMStoreSellDialog_BtnSellAll);
			x = QUOTE(0.70625 * safezoneW + safezoneX);
			y = QUOTE(0.621 * safezoneH + safezoneY);
			w = QUOTE(0.0721875 * safezoneW);
			h = QUOTE(0.033 * safezoneH);
		};
		class BtnProtect: GVAR(ButtonBase)
		{
			wantSelectionData = 1;

			idc = IDC_RSCA3USPCMSTORESELLDIALOG_BTNPROTECT;
			text = CSTRING(RscA3USPCMStoreSellDialog_BtnProtect);
			x = QUOTE(0.70625 * safezoneW + safezoneX);
			y = QUOTE(0.577 * safezoneH + safezoneY);
			w = QUOTE(0.0721875 * safezoneW);
			h = QUOTE(0.033 * safezoneH);
			tooltip = CSTRING(RscA3USPCMStoreSellDialog_BtnProtect_tooltip);
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
    };
};

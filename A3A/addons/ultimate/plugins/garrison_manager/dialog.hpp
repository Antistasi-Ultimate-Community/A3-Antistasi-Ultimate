#include "\z\a3uspcm\addons\main\ui_define.hpp"
#include "mapcontrol.hpp"
#include "RscDefine.hpp"

FORWARD(RscButton);
FORWARD(RscCheckbox);
FORWARD(RscFrame);
FORWARD(RscListbox);
FORWARD(RscText);

// Replace attributes:
//  Search: (^\s*(?:sizeEx|[xywh])) = ([^;]+)
//  Replace: $1 = QUOTE($2)
// Text:
//  Search: (^\s*(?:text|tooltip)\s*=\s*)[$]STR_A3_([^;]+)
//  Replace: $1CSTRING($2)

/* #Kudyky
$[
	1.063,
	["RscA3USPCMGarrisonManagerDialog",[["safezoneX","safezoneY","safezoneW","safezoneH"],"safezoneW / 40","safezoneH / 25","GUI_GRID"],2,1,1],
	[-1000,"StaticBackground",[1,"",["0.15 * safezoneW + safezoneX","0.16 * safezoneH + safezoneY","0.7 * safezoneW","0.72 * safezoneH"],[-1,-1,-1,-1],[0,0,0,0.8],[-1,-1,-1,-1],"","-1"],[]],
	[-1001,"StaticTitle",[1,"Title",["0.15 * safezoneW + safezoneX","0.116 * safezoneH + safezoneY","0.7 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[0,0.8,0,1],[-1,-1,-1,-1],"","-1"],["moving = 1;"]],
	[-1600,"BtnClose",[1,"X",["0.8325 * safezoneW + safezoneX","0.128 * safezoneH + safezoneY","0.0125 * safezoneW","0.02 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2800,"CheckShowBLUFOR",[1,"",["0.1625 * safezoneW + safezoneX","0.788 * safezoneH + safezoneY","0.025 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Show locations of BLUFOR faction (usually NATO)","-1"],[]],
	[1002,"StaticLabelBLUFOR",[1,"BLUFOR",["0.1875 * safezoneW + safezoneX","0.78 * safezoneH + safezoneY","0.04125 * safezoneW","0.055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2801,"CheckShowOPFOR",[1,"",["0.235 * safezoneW + safezoneX","0.788 * safezoneH + safezoneY","0.025 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Show locations of OPFOR faction (usually CSAT)","-1"],[]],
	[1003,"StaticLabelOPFOR",[1,"OPFOR",["0.26 * safezoneW + safezoneX","0.78 * safezoneH + safezoneY","0.04125 * safezoneW","0.055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2802,"CheckShowINDEP",[1,"",["0.305 * safezoneW + safezoneX","0.788 * safezoneH + safezoneY","0.025 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Show locations of INDEP faction (usually: you)","-1"],[]],
	[1004,"StaticLabelINDEP",[1,"INDEP",["0.33 * safezoneW + safezoneX","0.78 * safezoneH + safezoneY","0.04125 * safezoneW","0.055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2803,"CheckShowBases",[1,"",["0.525 * safezoneW + safezoneX","0.788 * safezoneH + safezoneY","0.025 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Show military bases/airports","-1"],[]],
	[1005,"StaticLabelBases",[1,"Bases",["0.55 * safezoneW + safezoneX","0.78 * safezoneH + safezoneY","0.075 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2804,"CheckShowOutposts",[1,"",["0.525 * safezoneW + safezoneX","0.832 * safezoneH + safezoneY","0.025 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Show outposts","-1"],[]],
	[1006,"StaticLabelOutposts",[1,"Outposts",["0.55 * safezoneW + safezoneX","0.82 * safezoneH + safezoneY","0.075 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2805,"CheckShowResources",[1,"",["0.625 * safezoneW + safezoneX","0.788 * safezoneH + safezoneY","0.025 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Show resources","-1"],[]],
	[1007,"StaticLabelResources",[1,"Resources",["0.65 * safezoneW + safezoneX","0.776 * safezoneH + safezoneY","0.0875 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2806,"CheckShowTowns",[1,"",["0.7375 * safezoneW + safezoneX","0.788 * safezoneH + safezoneY","0.025 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Show towns/villages","-1"],[]],
	[1008,"StaticLabelTowns",[1,"Towns/villages",["0.76 * safezoneW + safezoneX","0.776 * safezoneH + safezoneY","0.0875 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"ListOverview",[1,"",["0.1625 * safezoneW + safezoneX","0.18 * safezoneH + safezoneY","0.675 * safezoneW","0.3 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["type = CT_LISTNBOX;","drawSideArrows = 0;","idcLeft = -1;","idcRight = -1;","tooltipPerColumn = 1;"]],
	[1602,"BtnRecruit",[1,"Recruit",["0.3425 * safezoneW + safezoneX","0.728 * safezoneH + safezoneY","0.075 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[0,0.6,0,1],[-1,-1,-1,-1],"","-1"],[]],
	[-1800,"StaticRecruitFrame",[1,"Recruit reinforcements",["0.1625 * safezoneW + safezoneX","0.5 * safezoneH + safezoneY","0.2625 * safezoneW","0.28 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["sizeEx = 0.03;"]],
	[-1801,"StaticMapFrame",[1,"Map view",["0.4375 * safezoneW + safezoneX","0.5 * safezoneH + safezoneY","0.4 * safezoneW","0.28 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["sizeEx = 0.03;"]],
	[1501,"ListRecruitTypes",[1,"",["0.1675 * safezoneW + safezoneX","0.52 * safezoneH + safezoneY","0.25 * safezoneW","0.2 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["type = CT_LISTNBOX;","drawSideArrows = 0;","idcLeft = -1;","idcRight = -1;"]],
	[1009,"MapControl",[1,"",["0.45 * safezoneW + safezoneX","0.52 * safezoneH + safezoneY","0.375 * safezoneW","0.24 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2807,"CheckHideFull",[1,"",["0.7375 * safezoneW + safezoneX","0.832 * safezoneH + safezoneY","0.025 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Show towns/villages","-1"],[]],
	[1010,"StaticLabelFull",[1,"Hide full",["0.76 * safezoneW + safezoneX","0.82 * safezoneH + safezoneY","0.0875 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2808,"CheckShowPosts",[1,"",["0.625 * safezoneW + safezoneX","0.832 * safezoneH + safezoneY","0.025 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Show towns/villages","-1"],[]],
	[1011,"StaticLabelPosts",[1,"Posts",["0.65 * safezoneW + safezoneX","0.82 * safezoneH + safezoneY","0.0875 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/
class GVAR(dialog) {
    idd = 6119820;
    onLoad = QUOTE(call FUNC(onMenuOpen));
    onUnload = QUOTE(call FUNC(onMenuClose));
	movingEnable = 1;

    class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by goreSplatter, v1.063, #Hyvygo)
		////////////////////////////////////////////////////////

		class StaticBackground: RscText
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_STATICBACKGROUND;
			x = QUOTE(0.15 * safezoneW + safezoneX);
			y = QUOTE(0.16 * safezoneH + safezoneY);
			w = QUOTE(0.7 * safezoneW);
			h = QUOTE(0.72 * safezoneH);
			colorBackground[] = {0,0,0,0.8};
		};
		class StaticTitle: RscText
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_STATICTITLE;
			text = CSTRING(RscA3USPCMGarrisonManagerDialog_StaticTitle);
			x = QUOTE(0.15 * safezoneW + safezoneX);
			y = QUOTE(0.116 * safezoneH + safezoneY);
			w = QUOTE(0.7 * safezoneW);
			h = QUOTE(0.04 * safezoneH);
			colorBackground[] = {0,0.8,0,1};
			moving = 1;
		};
		class BtnClose: RscButton
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_BTNCLOSE;
			text = CSTRING(RscA3USPCMGarrisonManagerDialog_BtnClose);
			x = QUOTE(0.8325 * safezoneW + safezoneX);
			y = QUOTE(0.128 * safezoneH + safezoneY);
			w = QUOTE(0.0125 * safezoneW);
			h = QUOTE(0.02 * safezoneH);
		};
		class CheckShowBLUFOR: RscCheckbox
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_CHECKSHOWBLUFOR;
			x = QUOTE(0.1625 * safezoneW + safezoneX);
			y = QUOTE(0.788 * safezoneH + safezoneY);
			w = QUOTE(0.025 * safezoneW);
			h = QUOTE(0.04 * safezoneH);
			tooltip = CSTRING(RscA3USPCMGarrisonManagerDialog_CheckShowBLUFOR_tooltip);
		};
		class StaticLabelBLUFOR: RscText
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_STATICLABELBLUFOR;
			text = CSTRING(RscA3USPCMGarrisonManagerDialog_StaticLabelBLUFOR);
			x = QUOTE(0.1875 * safezoneW + safezoneX);
			y = QUOTE(0.78 * safezoneH + safezoneY);
			w = QUOTE(0.04125 * safezoneW);
			h = QUOTE(0.055 * safezoneH);
		};
		class CheckShowOPFOR: RscCheckbox
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_CHECKSHOWOPFOR;
			x = QUOTE(0.235 * safezoneW + safezoneX);
			y = QUOTE(0.788 * safezoneH + safezoneY);
			w = QUOTE(0.025 * safezoneW);
			h = QUOTE(0.04 * safezoneH);
			tooltip = CSTRING(RscA3USPCMGarrisonManagerDialog_CheckShowOPFOR_tooltip);
		};
		class StaticLabelOPFOR: RscText
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_STATICLABELOPFOR;
			text = CSTRING(RscA3USPCMGarrisonManagerDialog_StaticLabelOPFOR);
			x = QUOTE(0.26 * safezoneW + safezoneX);
			y = QUOTE(0.78 * safezoneH + safezoneY);
			w = QUOTE(0.04125 * safezoneW);
			h = QUOTE(0.055 * safezoneH);
		};
		class CheckShowINDEP: RscCheckbox
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_CHECKSHOWINDEP;
			x = QUOTE(0.305 * safezoneW + safezoneX);
			y = QUOTE(0.788 * safezoneH + safezoneY);
			w = QUOTE(0.025 * safezoneW);
			h = QUOTE(0.04 * safezoneH);
			tooltip = CSTRING(RscA3USPCMGarrisonManagerDialog_CheckShowINDEP_tooltip);
		};
		class StaticLabelINDEP: RscText
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_STATICLABELINDEP;
			text = CSTRING(RscA3USPCMGarrisonManagerDialog_StaticLabelINDEP);
			x = QUOTE(0.33 * safezoneW + safezoneX);
			y = QUOTE(0.78 * safezoneH + safezoneY);
			w = QUOTE(0.04125 * safezoneW);
			h = QUOTE(0.055 * safezoneH);
		};
		class CheckShowBases: RscCheckbox
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_CHECKSHOWBASES;
			x = QUOTE(0.525 * safezoneW + safezoneX);
			y = QUOTE(0.788 * safezoneH + safezoneY);
			w = QUOTE(0.025 * safezoneW);
			h = QUOTE(0.04 * safezoneH);
			tooltip = CSTRING(RscA3USPCMGarrisonManagerDialog_CheckShowBases_tooltip);
		};
		class StaticLabelBases: RscText
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_STATICLABELBASES;
			text = CSTRING(RscA3USPCMGarrisonManagerDialog_StaticLabelBases);
			x = QUOTE(0.55 * safezoneW + safezoneX);
			y = QUOTE(0.78 * safezoneH + safezoneY);
			w = QUOTE(0.075 * safezoneW);
			h = QUOTE(0.06 * safezoneH);
		};
		class CheckShowOutposts: RscCheckbox
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_CHECKSHOWOUTPOSTS;
			x = QUOTE(0.525 * safezoneW + safezoneX);
			y = QUOTE(0.832 * safezoneH + safezoneY);
			w = QUOTE(0.025 * safezoneW);
			h = QUOTE(0.04 * safezoneH);
			tooltip = CSTRING(RscA3USPCMGarrisonManagerDialog_CheckShowOutposts_tooltip);
		};
		class StaticLabelOutposts: RscText
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_STATICLABELOUTPOSTS;
			text = CSTRING(RscA3USPCMGarrisonManagerDialog_StaticLabelOutposts);
			x = QUOTE(0.55 * safezoneW + safezoneX);
			y = QUOTE(0.82 * safezoneH + safezoneY);
			w = QUOTE(0.075 * safezoneW);
			h = QUOTE(0.06 * safezoneH);
		};
		class CheckShowResources: RscCheckbox
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_CHECKSHOWRESOURCES;
			x = QUOTE(0.625 * safezoneW + safezoneX);
			y = QUOTE(0.788 * safezoneH + safezoneY);
			w = QUOTE(0.025 * safezoneW);
			h = QUOTE(0.04 * safezoneH);
			tooltip = CSTRING(RscA3USPCMGarrisonManagerDialog_CheckShowResources_tooltip);
		};
		class StaticLabelResources: RscText
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_STATICLABELRESOURCES;
			text = CSTRING(RscA3USPCMGarrisonManagerDialog_StaticLabelResources);
			x = QUOTE(0.65 * safezoneW + safezoneX);
			y = QUOTE(0.776 * safezoneH + safezoneY);
			w = QUOTE(0.0875 * safezoneW);
			h = QUOTE(0.06 * safezoneH);
		};
		class CheckShowTowns: RscCheckbox
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_CHECKSHOWTOWNS;
			x = QUOTE(0.7375 * safezoneW + safezoneX);
			y = QUOTE(0.788 * safezoneH + safezoneY);
			w = QUOTE(0.025 * safezoneW);
			h = QUOTE(0.04 * safezoneH);
			tooltip = CSTRING(RscA3USPCMGarrisonManagerDialog_CheckShowTowns_tooltip);
		};
		class StaticLabelTowns: RscText
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_STATICLABELTOWNS;
			text = CSTRING(RscA3USPCMGarrisonManagerDialog_StaticLabelTowns);
			x = QUOTE(0.76 * safezoneW + safezoneX);
			y = QUOTE(0.776 * safezoneH + safezoneY);
			w = QUOTE(0.0875 * safezoneW);
			h = QUOTE(0.06 * safezoneH);
		};
		class ListOverview: RscListbox
		{
			type = CT_LISTNBOX;
			drawSideArrows = 0;
			idcLeft = -1;
			idcRight = -1;
			tooltipPerColumn = 1;

			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_LISTOVERVIEW;
			x = QUOTE(0.1625 * safezoneW + safezoneX);
			y = QUOTE(0.18 * safezoneH + safezoneY);
			w = QUOTE(0.675 * safezoneW);
			h = QUOTE(0.3 * safezoneH);
		};
		class BtnRecruit: RscButton
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_BTNRECRUIT;
			text = CSTRING(RscA3USPCMGarrisonManagerDialog_BtnRecruit);
			x = QUOTE(0.3425 * safezoneW + safezoneX);
			y = QUOTE(0.728 * safezoneH + safezoneY);
			w = QUOTE(0.075 * safezoneW);
			h = QUOTE(0.04 * safezoneH);
			colorBackground[] = {0,0.6,0,1};
		};
		class StaticRecruitFrame: RscFrame
		{
			sizeEx = QUOTE(0.03);

			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_STATICRECRUITFRAME;
			text = CSTRING(RscA3USPCMGarrisonManagerDialog_StaticRecruitFrame);
			x = QUOTE(0.1625 * safezoneW + safezoneX);
			y = QUOTE(0.5 * safezoneH + safezoneY);
			w = QUOTE(0.2625 * safezoneW);
			h = QUOTE(0.28 * safezoneH);
		};
		class StaticMapFrame: RscFrame
		{
			sizeEx = QUOTE(0.03);

			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_STATICMAPFRAME;
			text = CSTRING(RscA3USPCMGarrisonManagerDialog_StaticMapFrame);
			x = QUOTE(0.4375 * safezoneW + safezoneX);
			y = QUOTE(0.5 * safezoneH + safezoneY);
			w = QUOTE(0.4 * safezoneW);
			h = QUOTE(0.28 * safezoneH);
		};
		class ListRecruitTypes: RscListbox
		{
			type = CT_LISTNBOX;
			drawSideArrows = 0;
			idcLeft = -1;
			idcRight = -1;

			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_LISTRECRUITTYPES;
			x = QUOTE(0.1675 * safezoneW + safezoneX);
			y = QUOTE(0.52 * safezoneH + safezoneY);
			w = QUOTE(0.25 * safezoneW);
			h = QUOTE(0.2 * safezoneH);
		};
		class MapControl: A3A_MapControl
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_MAPCONTROL;
			x = QUOTE(0.45 * safezoneW + safezoneX);
			y = QUOTE(0.52 * safezoneH + safezoneY);
			w = QUOTE(0.375 * safezoneW);
			h = QUOTE(0.24 * safezoneH);
		};
		class CheckHideFull: RscCheckbox
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_CHECKHIDEFULL;
			x = QUOTE(0.7375 * safezoneW + safezoneX);
			y = QUOTE(0.832 * safezoneH + safezoneY);
			w = QUOTE(0.025 * safezoneW);
			h = QUOTE(0.04 * safezoneH);
			tooltip = CSTRING(RscA3USPCMGarrisonManagerDialog_CheckHideFull_tooltip);
		};
		class StaticLabelFull: RscText
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_STATICLABELFULL;
			text = CSTRING(RscA3USPCMGarrisonManagerDialog_StaticLabelFull);
			x = QUOTE(0.76 * safezoneW + safezoneX);
			y = QUOTE(0.82 * safezoneH + safezoneY);
			w = QUOTE(0.0875 * safezoneW);
			h = QUOTE(0.06 * safezoneH);
		};
		class CheckShowPosts: RscCheckbox
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_CHECKSHOWPOSTS;
			x = QUOTE(0.625 * safezoneW + safezoneX);
			y = QUOTE(0.832 * safezoneH + safezoneY);
			w = QUOTE(0.025 * safezoneW);
			h = QUOTE(0.04 * safezoneH);
			tooltip = CSTRING(RscA3USPCMGarrisonManagerDialog_CheckShowPosts_tooltip);
		};
		class StaticLabelPosts: RscText
		{
			idc = IDC_RSCA3USPCMGARRISONMANAGERDIALOG_STATICLABELPOSTS;
			text = CSTRING(RscA3USPCMGarrisonManagerDialog_StaticLabelPosts);
			x = QUOTE(0.65 * safezoneW + safezoneX);
			y = QUOTE(0.82 * safezoneH + safezoneY);
			w = QUOTE(0.0875 * safezoneW);
			h = QUOTE(0.06 * safezoneH);
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
    };
};

#include "\x\A3A\addons\core\ui_define.hpp"
#include "\x\A3A\addons\scrt\defines.hpp"
#include "RscDefine.hpp"

// Replace attributes:
//  Search: (^\s*(?:sizeEx|[xywh])) = ([^;]+)
//  Replace: $1 = QUOTE($2)
// Text:
//  Search: (^\s*(?:text|tooltip)\s*=\s*)[$]STR_A3_([^;]+)
//  Replace: $1CSTRING($2)

/* #Gegiti
$[
	1.063,
	["RscA3USPCMTracklistEditorDialog",[[0,0,1,1],0.025,0.04,"GUI_GRID"],2,1,1],
	[-1000,"StaticTitle",[1,"A3USPCM Playlist Editor",["0.215375 * safezoneW + safezoneX","0.181 * safezoneH + safezoneY","0.551719 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0,0.8,0,1],[-1,-1,-1,-1],"","-1"],["moving = 1;"]],
	[-1001,"StaticBackground",[1,"",["0.215313 * safezoneW + safezoneX","0.219 * safezoneH + safezoneY","0.5775 * safezoneW","0.561 * safezoneH"],[-1,-1,-1,-1],[0,0,0,0.8],[-1,-1,-1,-1],"","-1"],[]],
	[-1602,"BtnClose",[1,"X",["0.77225 * safezoneW + safezoneX","0.181 * safezoneH + safezoneY","0.020625 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-1400,"EditCopyPaste",[1,"",["0.226719 * safezoneW + safezoneX","0.236 * safezoneH + safezoneY","0.33 * safezoneW","0.528 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["style = ST_MULTI;","fade = 1;","font = |EtelkaMonospacePro|;","sizeEx = 0.025;"]],
	[1500,"ListAllTracks",[1,"",["0.226719 * safezoneW + safezoneX","0.236 * safezoneH + safezoneY","0.33 * safezoneW","0.528 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["type = CT_LISTNBOX;","idcLeft = -1;","idcRight = -1;","drawSideArrows = false;"]],
	[1002,"StaticTreePosition",[1,"",["0.561875 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.221719 * safezoneW","0.44 * safezoneH"],[-1,-1,-1,-1],[0.4,0,0,1],[-1,-1,-1,-1],"","-1"],["deletable = 1;","onLoad = QUOTE(_this spawn FUNC(onInitPlaylistTree));","fade = 1;"]],
	[1600,"BtnRemove",[1,"<<",["0.675312 * safezoneW + safezoneX","0.236 * safezoneH + safezoneY","0.108281 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0,0.8,0,1],[-1,-1,-1,-1],"Remove selection","-1"],[]],
	[1601,"BtnAddSelection",[1,">>",["0.561875 * safezoneW + safezoneX","0.236 * safezoneH + safezoneY","0.108281 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0,0.8,0,1],[-1,-1,-1,-1],"Add to selection from track list","-1"],[]],
	[1603,"BtnSavePlaylist",[1,"Save playlist",["0.695937 * safezoneW + safezoneX","0.731 * safezoneH + safezoneY","0.0876563 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0,0.8,0,1],[-1,-1,-1,-1],"","-1"],[]],
	[1604,"BtnExport",[1,"Export",["0.561875 * safezoneW + safezoneX","0.731 * safezoneH + safezoneY","0.0567187 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0,0.8,0,1],[-1,-1,-1,-1],"","-1"],[]],
	[1605,"BtnImport",[1,"Import",["0.62375 * safezoneW + safezoneX","0.731 * safezoneH + safezoneY","0.0567187 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[0,0.8,0,1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class GVAR(headerBase): headerBase {
	fade = 0;
	colorBackground[] = {0,0,0,0.8};
};

class GVAR(ButtonBase): ButtonBase {
	fade = 0;
};

class GVAR(dialog) {
    idd = 6119822;
    onLoad = QUOTE(call FUNC(onDialogOpen));
    onUnload = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(menuDisplay),nil)]);
	movingEnable = 1;

    class Controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by goreSplatter, v1.063, #Gegiti)
		////////////////////////////////////////////////////////

		class StaticTitle: GVAR(headerBase)
		{
			idc = IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_STATICTITLE;
			text = CSTRING(RscA3USPCMTracklistEditorDialog_StaticTitle);
			x = QUOTE(0.215375 * safezoneW + safezoneX);
			y = QUOTE(0.181 * safezoneH + safezoneY);
			w = QUOTE(0.551719 * safezoneW);
			h = QUOTE(0.033 * safezoneH);
			moving = 1;
		};
		class StaticBackground: RscText
		{
			idc = IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_STATICBACKGROUND;
			x = QUOTE(0.215313 * safezoneW + safezoneX);
			y = QUOTE(0.219 * safezoneH + safezoneY);
			w = QUOTE(0.5775 * safezoneW);
			h = QUOTE(0.561 * safezoneH);
			colorBackground[] = {0,0,0,0.8};
		};
		class BtnClose: GVAR(ButtonBase)
		{
			idc = IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNCLOSE;
			text = CSTRING(RscA3USPCMTracklistEditorDialog_BtnClose);
			x = QUOTE(0.77225 * safezoneW + safezoneX);
			y = QUOTE(0.181 * safezoneH + safezoneY);
			w = QUOTE(0.020625 * safezoneW);
			h = QUOTE(0.033 * safezoneH);
		};
		class EditCopyPaste: RscEdit
		{
			style = ST_MULTI;
			fade = 1;
			font = "EtelkaMonospacePro";
			sizeEx = 0.025;

			idc = IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_EDITCOPYPASTE;
			x = QUOTE(0.226719 * safezoneW + safezoneX);
			y = QUOTE(0.236 * safezoneH + safezoneY);
			w = QUOTE(0.33 * safezoneW);
			h = QUOTE(0.528 * safezoneH);
		};
		class ListAllTracks: RscListbox
		{
			type = CT_LISTNBOX;
			idcLeft = -1;
			idcRight = -1;
			drawSideArrows = false;

			font = "PuristaMedium";

			idc = IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_LISTALLTRACKS;
			x = QUOTE(0.226719 * safezoneW + safezoneX);
			y = QUOTE(0.236 * safezoneH + safezoneY);
			w = QUOTE(0.33 * safezoneW);
			h = QUOTE(0.528 * safezoneH);
		};
		class StaticTreePosition: RscText
		{
			deletable = 1;
			onLoad = QUOTE(_this spawn FUNC(onInitPlaylistTree));
			fade = 1;

			font = "PuristaMedium";

			idc = IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_STATICTREEPOSITION;
			x = QUOTE(0.561875 * safezoneW + safezoneX);
			y = QUOTE(0.28 * safezoneH + safezoneY);
			w = QUOTE(0.221719 * safezoneW);
			h = QUOTE(0.44 * safezoneH);
			colorBackground[] = {0.4,0,0,1};
		};
		class BtnRemove: GVAR(ButtonBase)
		{
			idc = IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNREMOVE;
			text = CSTRING(RscA3USPCMTracklistEditorDialog_BtnRemove);
			x = QUOTE(0.675312 * safezoneW + safezoneX);
			y = QUOTE(0.236 * safezoneH + safezoneY);
			w = QUOTE(0.108281 * safezoneW);
			h = QUOTE(0.033 * safezoneH);
			tooltip = CSTRING(RscA3USPCMTracklistEditorDialog_BtnRemove_tooltip);
		};
		class BtnAddSelection: GVAR(ButtonBase)
		{
			idc = IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNADDSELECTION;
			text = CSTRING(RscA3USPCMTracklistEditorDialog_BtnAddSelection);
			x = QUOTE(0.561875 * safezoneW + safezoneX);
			y = QUOTE(0.236 * safezoneH + safezoneY);
			w = QUOTE(0.108281 * safezoneW);
			h = QUOTE(0.033 * safezoneH);
			tooltip = CSTRING(RscA3USPCMTracklistEditorDialog_BtnAddSelection_tooltip);
		};
		class BtnSavePlaylist: GVAR(ButtonBase)
		{
			idc = IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNSAVEPLAYLIST;
			text = CSTRING(RscA3USPCMTracklistEditorDialog_BtnSavePlaylist);
			x = QUOTE(0.695937 * safezoneW + safezoneX);
			y = QUOTE(0.731 * safezoneH + safezoneY);
			w = QUOTE(0.0876563 * safezoneW);
			h = QUOTE(0.033 * safezoneH);
		};
		class BtnExport: GVAR(ButtonBase)
		{
			idc = IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNEXPORT;
			text = CSTRING(RscA3USPCMTracklistEditorDialog_BtnExport);
			x = QUOTE(0.561875 * safezoneW + safezoneX);
			y = QUOTE(0.731 * safezoneH + safezoneY);
			w = QUOTE(0.0567187 * safezoneW);
			h = QUOTE(0.033 * safezoneH);
		};
		class BtnImport: GVAR(ButtonBase)
		{
			idc = IDC_RSCA3USPCMTRACKLISTEDITORDIALOG_BTNIMPORT;
			text = CSTRING(RscA3USPCMTracklistEditorDialog_BtnImport);
			x = QUOTE(0.62375 * safezoneW + safezoneX);
			y = QUOTE(0.731 * safezoneH + safezoneY);
			w = QUOTE(0.0567187 * safezoneW);
			h = QUOTE(0.033 * safezoneH);
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
    };
};

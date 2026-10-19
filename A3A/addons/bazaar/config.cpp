////////////////////////////////////////////////////////////////////
// Antistasi Bazaar (ABZ)
// Companion mod: black-market kiosks with rotating stock and
// bulk crates you have to haul home. Built for Antistasi Ultimate
// co-op sessions. Requires CBA_A3.
////////////////////////////////////////////////////////////////////

class CfgPatches
{
	class ABZ_main
	{
		name = "Antistasi Bazaar";
		author = "Firewalk";
		url = "";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.9;
		requiredAddons[] = {"cba_main", "A3_Functions_F", "A3_Structures_F"};
		version = "1.1.2";
	};
};

class Extended_PreInit_EventHandlers
{
	class ABZ_main
	{
		init = "call compile preprocessFileLineNumbers '\antistasi_bazaar\XEH_preInit.sqf'";
	};
};

class Extended_PostInit_EventHandlers
{
	class ABZ_main
	{
		init = "call compile preprocessFileLineNumbers '\antistasi_bazaar\XEH_postInit.sqf'";
	};
};

class CfgFunctions
{
	class ABZ
	{
		class main
		{
			file = "\antistasi_bazaar\functions";

			// --- shared helpers ---
			class isAntistasi {};
			class saveKey {};
			class getMoney {};
			class addMoney {};
			class getFactionMoney {};
			class getFunds {};
			class itemKind {};
			class itemPrice {};
			class tierOf {};
			class rarityInfo {};
			class classValid {};
			class displayNameOf {};
			class pictureOf {};
			class bulkSize {};
			class unlocksEnabled {};
			class atHQ {};
			class enemySides {};
			class enemiesNear {};
			class townName {};
			class notify {};

			// --- stock pool (server) ---
			class buildPool {};
			class poolFromFactions {};
			class poolFromConfigs {};
			class isUnlocked {};
			class rollStock {};
			class buildVehPool {};
			class vehReq {};
			class vehPrice {};
			class vehResale {};
			class vehSpot {};
			class waterNear {};
			class rollJob {};
			class tierFactor {};

			// --- vendors (server) ---
			class civClass {};
			class vendorNames {};
			class vendorEntry {};
			class vendorUnit {};
			class vendorPick {};
			class vendorPos {};
			class vendorCreate {};
			class vendorSpawn {};
			class vendorPrep {};
			class publishStalls {};
			class vendorDespawn {};
			class vendorKilled {};
			class vendorRestock {};
			class vendorRelocate {};
			class vendorMarker {};
			class vendorLoop {};
			class vendorTick {};

			// --- trade (server) ---
			class serverCanTrade {};
			class undercoverOk {};
			class serverDeliverVeh {};
			class serverShopReq {};
			class serverBuy {};
			class serverCharge {};
			class serverDeliverCrate {};
			class serverSell {};
			class serverPay {};
			class serverOpenCrate {};
			class addCargo {};
			class serverUnpack {};
			class serverRumours {};
			class serverReset {};
			class serverCrateLoad {};
			class serverCrateUnload {};
			class seizureLoop {};

			// --- persistence (server) ---
			class save {};
			class load {};
			class queueSave {};
			class saveStamp {};
			class syncCommit {};

			// --- v1.1.0 ---
			class entryPad {};
			class shopPayload {};
			class runFind {};
			class crateRelease {};
			class crateRemove {};
			class makeCrate {};
			class dropSpot {};
			class runSpawnCrate {};
			class runEnemyShare {};
			class runAllowance {};
			class runOffer {};
			class runPublish {};
			class runNews {};
			class serverRunAccept {};
			class serverRunDeliver {};
			class runFail {};
			class runCheck {};
			class progressGate {};
			class announceRoll {};
			class wantedList {};
			class wantedValid {};
			class wantedToggle {};
			class wantedCheck {};
			class wantedFind {};
			class factionPays {};
			class receiptAdd {};
			class receiptSync {};
			class unpackCrate {};
			class serverUnpackAll {};
			class shopPin {};
			class shopRun {};
			class runWatch {};
			class runPay {};
			class wantedBase {};

			// --- v1.1.1 ---
			class handsCheck {};
			class weaponParts {};
			class weaponSplit {};
			class weaponStored {};
			class cargoTakeWeapon {};
			class sellBoxOk {};
			class sellSource {};
			class cargoInventory {};
			class cargoGive {};
			class serverSellCargo {};
			class shopSellCargo {};

			// --- client ---
			class applyPlayerActions {};
			class openShop {};
			class shopFill {};
			class shopFillList {};
			class shopUpdateInfo {};
			class shopBuy {};
			class shopSell {};
			class sellCheck {};
			class sellClass {};
			class isWeaponType {};
			class dealerPrice {};
			class unitPrice {};
			class isUnlockedAny {};
			class switchFamily {};
			class turnsInto {};
			class yields {};
			class dealerReach {};
			class cratePrice {};
			class dealerMap {};
			class repriceRows {};
			class myInventory {};
			class removeMine {};
			class sellPrice {};
			class jobPrice {};
			class nearVendor {};
			class shopTick {};
			// --- v1.1.2 (the menu fills the screen) ---
			class uiFit {};
			class uiScale {};
			class uiText {};
			class receiveItems {};
			class crateInfo {};
			class loadTarget {};
			class cargoTarget {};
			class rumours {};
		};
	};
};

////////////////////////////////////////////////////////////////////
// UI: screen frame, fonts (v1.1.2 - the menu fills the screen)
// The dialog is laid out in its own 0..1 design numbers and the macros
// below put them on the whole screen: design 0..1 maps to the safe zone
// less a 1.5 % margin left and right and 2 % top and bottom. The frame is
// at most 1.75 x as wide as it is high (21:9) and centred, so a 32:9 screen
// does not stretch it. Fonts follow the frame's height: 0.96 x the smaller
// of safeZoneH and safeZoneW, times the player's "UI scale" (ABZ_uiScale,
// clamped 0.7-1.8). Each factor is applied in exactly ONE place - here:
// fn_uiScale only shrinks a label whose text would be cut, and fn_uiText
// adds no <t size>.
//   ABZ_F   lists and structured text: rows (rowHeight 0) and lines grow
//           with the font, so nothing overlaps
//   ABZ_FC  single-line labels, buttons, combos and edit boxes: the same,
//           capped at 95 % of the control's own height (2nd argument)
//   ABZ_FL  a short list: ABZ_F, capped so at least 3 rows show (2nd
//           argument = the list's height)
//   wholeHeight (combo drop-downs) is screen height only, no UI scale, and
//   the low combo is capped so the open list ends on the screen.
// The game reads this file as text (the PBO holds config.cpp, not a
// config.bin), so these expressions reach the dialog loader as STRINGS and
// are evaluated with createDialog. Keep the macro bodies UNQUOTED (or use
// QUOTE): a body written as "..." is not parameter-substituted and would
// ship a literal (NUM). Inside a body only single quotes. missionNamespace
// is named on purpose - UI expressions may be evaluated in uiNamespace.
// SQF precedence: * and / bind tighter than + - min max, which bind tighter
// than getVariable. Checked by _tools\ui_check.py (expression rule, layout
// at every aspect ratio / Interface Size / UI scale).
////////////////////////////////////////////////////////////////////

#define QUOTE(s) #s
#define ABZ_FW (safeZoneW min (safeZoneH * 1.75))
#define ABZ_X(NUM) safeZoneX + (safeZoneW - ABZ_FW) / 2 + ABZ_FW * (0.015 + 0.97 * (NUM))
#define ABZ_Y(NUM) safeZoneY + safeZoneH * (0.02 + 0.96 * (NUM))
#define ABZ_W(NUM) 0.97 * (NUM) * ABZ_FW
#define ABZ_H(NUM) 0.96 * (NUM) * safeZoneH
#define ABZ_S (((missionNamespace getVariable ['ABZ_uiScale', 1]) max 0.7) min 1.8)
#define ABZ_F(NUM) 0.96 * (NUM) * (safeZoneH min safeZoneW) * ABZ_S
#define ABZ_FC(NUM,BOX) 0.96 * (NUM) * (safeZoneH min safeZoneW) * ABZ_S min (0.912 * (BOX) * safeZoneH)
#define ABZ_FL(NUM,BOX) 0.96 * (NUM) * (safeZoneH min safeZoneW) * ABZ_S min (0.32 * (BOX) * safeZoneH)
// a scrolling text panel's text is this much narrower than the panel (its scrollbar)
#define ABZ_SBW 0.021

////////////////////////////////////////////////////////////////////
// UI base classes
// sizeEx / size / wholeHeight here are the inherited defaults; x / y / w / h
// defaults are placeholders.
////////////////////////////////////////////////////////////////////

class ABZ_RscText
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	text = "";
	fixedWidth = 0;
	x = ABZ_X(0);
	y = ABZ_Y(0);
	h = ABZ_H(0.037);
	w = ABZ_W(0.3);
	style = 0;
	shadow = 1;
	colorShadow[] = {0,0,0,0.5};
	font = "PuristaMedium";
	sizeEx = ABZ_F(0.04);
	linespacing = 1;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};

class ABZ_RscStructuredText
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 13;
	idc = -1;
	style = 0;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
	x = ABZ_X(0);
	y = ABZ_Y(0);
	h = ABZ_H(0.035);
	w = ABZ_W(0.1);
	text = "";
	size = ABZ_F(0.035);
	shadow = 1;
	class Attributes
	{
		font = "PuristaLight";
		color = "#ffffff";
		align = "left";
		shadow = 1;
	};
};

class ABZ_RscPicture
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 0;
	idc = -1;
	style = "0x30 + 0x800";	// picture, aspect ratio kept
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "TahomaB";
	sizeEx = ABZ_F(0.03);
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
	x = ABZ_X(0);
	y = ABZ_Y(0);
	w = ABZ_W(0.2);
	h = ABZ_H(0.15);
};

class ABZ_RscButton
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 1;
	text = "";
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {0.2,0.2,0.2,0.9};
	colorBackgroundDisabled[] = {0,0,0,0.5};
	colorBackgroundActive[] = {0.75,0.5,0.15,1};
	colorFocused[] = {0.45,0.33,0.15,1};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {0,0,0,1};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
	idc = -1;
	style = 2;
	x = ABZ_X(0);
	y = ABZ_Y(0);
	w = ABZ_W(0.095589);
	h = ABZ_H(0.039216);
	shadow = 2;
	font = "PuristaMedium";
	sizeEx = ABZ_F(0.03921);
	url = "";
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0;
	offsetPressedY = 0;
	borderSize = 0;
};

class ABZ_RscCombo
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 4;
	colorSelect[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,1};
	colorScrollbar[] = {1,0,0,1};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,0.25};
	colorPictureRight[] = {1,1,1,1};
	colorPictureRightSelected[] = {1,1,1,1};
	colorPictureRightDisabled[] = {1,1,1,0.25};
	colorTextRight[] = {1,1,1,1};
	colorSelectRight[] = {0,0,0,1};
	colorSelect2Right[] = {0,0,0,1};
	class ComboScrollBar
	{
		color[] = {1,1,1,1};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		shadow = 0;
		scrollSpeed = 0.06;
		width = 0;
		height = 0;
		autoScrollEnabled = 0;
		autoScrollDelay = 5;
		autoScrollSpeed = -1;
		autoScrollRewind = 0;
	};
	style = 16;
	font = "PuristaMedium";
	sizeEx = ABZ_F(0.03921);
	shadow = 0;
	x = ABZ_X(0);
	y = ABZ_Y(0);
	w = ABZ_W(0.12);
	h = ABZ_H(0.035);
	colorActive[] = {1,0,0,1};
	colorDisabled[] = {1,1,1,0.25};
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	wholeHeight = ABZ_H(0.45);
	maxHistoryDelay = 1;
	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
	idc = -1;
};

class ABZ_RscListNBox
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 102;
	style = 16;
	x = ABZ_X(0);
	y = ABZ_Y(0);
	w = ABZ_W(0.4);
	h = ABZ_H(0.4);
	font = "PuristaMedium";
	sizeEx = ABZ_F(0.032);
	shadow = 0;
	rowHeight = 0;		// rows follow the font
	color[] = {1,1,1,1};
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorScrollbar[] = {1,0,0,0};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelectBackground[] = {0.95,0.95,0.95,1};
	colorSelectBackground2[] = {1,1,1,0.5};
	colorBackground[] = {0,0,0,0.6};
	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	columns[] = {0.0, 0.56, 0.76};	// name | price | status ("SOLD OUT", "HERE (crate)", "120 min" fit at UI scale 1 on every aspect; fn_uiFit cuts a name that would run on)
	drawSideArrows = 0;
	idcLeft = -1;
	idcRight = -1;
	maxHistoryDelay = 1;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	class ListScrollBar
	{
		color[] = {1,1,1,1};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		shadow = 0;
		scrollSpeed = 0.06;
		width = 0;
		height = 0;
		autoScrollEnabled = 0;
		autoScrollDelay = 5;
		autoScrollSpeed = -1;
		autoScrollRewind = 0;
	};
	idc = -1;
};

class ABZ_RscEdit
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 2;
	style = "0x00 + 0x40";
	x = ABZ_X(0);
	y = ABZ_Y(0);
	w = ABZ_W(0.3);
	h = ABZ_H(0.04);
	font = "PuristaMedium";
	sizeEx = ABZ_F(0.036);
	shadow = 0;
	text = "";
	colorBackground[] = {0,0,0,0.6};
	colorText[] = {0.95,0.95,0.95,1};
	colorDisabled[] = {1,1,1,0.25};
	colorSelection[] = {0.75,0.5,0.15,1};
	autocomplete = "";
	canModify = 1;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	idc = -1;
};

// A scrolling text panel: a controls group holding one structured text.
// fn_uiText [text, control] makes the text as tall as its lines, so the
// panel scrolls instead of cutting the last lines at a large UI scale.
// Children are placed relative to the group (x / y "0"); the text is
// ABZ_SBW narrower than the group, the room of the vertical scrollbar.
class ABZ_RscControlsGroup
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 15;
	idc = -1;
	style = 16;
	shadow = 0;
	x = ABZ_X(0);
	y = ABZ_Y(0);
	w = ABZ_W(0.2);
	h = ABZ_H(0.2);
	class VScrollbar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		shadow = 0;
		scrollSpeed = 0.06;
		width = 0.021;
		height = 0;
		autoScrollEnabled = 0;
		autoScrollDelay = 5;
		autoScrollSpeed = -1;
		autoScrollRewind = 0;
	};
	class HScrollbar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		shadow = 0;
		scrollSpeed = 0.06;
		width = 0;
		height = 0;
		autoScrollEnabled = 0;
		autoScrollDelay = 5;
		autoScrollSpeed = -1;
		autoScrollRewind = 0;
	};
	class Controls {};
};

////////////////////////////////////////////////////////////////////
// Bazaar dialog (v1.1.2: fills the screen)
// Layout in design units: title bar 0-0.055; left column x 0.015-0.515
// (category combo 0.075, item list 0.13-0.79, under it the restock line -
// or, in the Wanted List, the name box and PIN IT); right column x
// 0.535-0.985 (preview 0.075-0.345, info panel 0.355-0.675 (scrolls), money
// line 0.683, help panel 0.73-0.84 (scrolls)); bottom bar y 0.86-0.915
// (quantity, destination, BUY, PIN, RUMOURS, CLOSE). The Wanted List's
// name box takes the restock line's slot (fn_shopFillList shows one or the
// other, never both - ui_check.py knows the pair); nothing else overlaps.
////////////////////////////////////////////////////////////////////

class ABZ_Shop
{
	idd = 78800;
	movingEnable = 0;
	enableSimulation = 1;
	onUnload = "uiNamespace setVariable ['ABZ_shop', nil];";
	// Enter never closes the menu: in the Wanted List name box it searches,
	// anywhere else it does nothing (a typed quantity is confirmed with BUY/SELL)
	onKeyDown = "params ['_d', '_k']; if !(_k in [28, 156]) exitWith { false }; if (ctrlIDC (focusedCtrl _d) == 78815 && {ctrlEnabled (_d displayCtrl 78816)}) then { [ctrlText (_d displayCtrl 78815)] spawn ABZ_fnc_wantedFind }; true";

	class ControlsBackground
	{
		class Background: ABZ_RscText
		{
			idc = -1;
			x = ABZ_X(0);
			y = ABZ_Y(0);
			w = ABZ_W(1);
			h = ABZ_H(0.935);
			colorBackground[] = {0.05,0.05,0.05,0.85};
		};
		class TitleBar: ABZ_RscText
		{
			idc = 78807;
			text = "ANTISTASI BAZAAR";
			x = ABZ_X(0);
			y = ABZ_Y(0);
			w = ABZ_W(1);
			h = ABZ_H(0.055);
			sizeEx = ABZ_FC(0.045,0.055);
			colorBackground[] = {0.75,0.5,0.15,0.9};
			colorText[] = {0,0,0,1};
		};
	};

	class Controls
	{
		// ---- left column: what's on the table ----
		class CategoryCombo: ABZ_RscCombo
		{
			idc = 78801;
			x = ABZ_X(0.015);
			y = ABZ_Y(0.075);
			w = ABZ_W(0.5);
			h = ABZ_H(0.045);
			sizeEx = ABZ_FC(0.036,0.045);
			wholeHeight = ABZ_H(0.56);	// 11 categories at UI scale 1.8 without a scroll
			onLBSelChanged = "call ABZ_fnc_shopFillList";
		};
		class ItemList: ABZ_RscListNBox
		{
			idc = 78802;
			x = ABZ_X(0.015);
			y = ABZ_Y(0.13);
			w = ABZ_W(0.5);
			h = ABZ_H(0.66);
			onLBSelChanged = "call ABZ_fnc_shopUpdateInfo";
			onLBDblClick = "call ABZ_fnc_shopBuy";
		};
		class RestockText: ABZ_RscText
		{
			idc = 78808;
			x = ABZ_X(0.015);
			y = ABZ_Y(0.795);
			w = ABZ_W(0.22);
			h = ABZ_H(0.045);
			sizeEx = ABZ_FC(0.032,0.045);
			colorText[] = {1,0.85,0.5,1};
		};
		class WantedEdit: ABZ_RscEdit
		{
			idc = 78815;
			tooltip = "Type part of an item's name (as the arsenal shows it), then PIN IT.";
			text = "";
			x = ABZ_X(0.015);
			y = ABZ_Y(0.795);
			w = ABZ_W(0.405);
			h = ABZ_H(0.045);
			sizeEx = ABZ_FC(0.034,0.045);
		};
		class ButtonWantedAdd: ABZ_RscButton
		{
			idc = 78816;
			text = "PIN IT";
			tooltip = "Search every loaded mod for gear with this name and pin the best match.";
			x = ABZ_X(0.43);
			y = ABZ_Y(0.795);
			w = ABZ_W(0.085);
			h = ABZ_H(0.045);
			sizeEx = ABZ_FC(0.034,0.045);
			action = "[ctrlText ((findDisplay 78800) displayCtrl 78815)] spawn ABZ_fnc_wantedFind";
		};

		// ---- right column: the selected item ----
		class PreviewPic: ABZ_RscPicture
		{
			idc = 78803;
			x = ABZ_X(0.535);
			y = ABZ_Y(0.075);
			w = ABZ_W(0.45);
			h = ABZ_H(0.27);
		};
		class InfoPanel: ABZ_RscControlsGroup
		{
			x = ABZ_X(0.535);
			y = ABZ_Y(0.355);
			w = ABZ_W(0.45);
			h = ABZ_H(0.32);
			class Controls
			{
				class InfoText: ABZ_RscStructuredText
				{
					idc = 78804;
					x = QUOTE(0);
					y = QUOTE(0);
					w = ABZ_W(0.45) - ABZ_SBW;
					h = ABZ_H(0.32);
					size = ABZ_F(0.031);
				};
			};
		};
		class MoneyText: ABZ_RscText
		{
			idc = 78805;
			x = ABZ_X(0.535);
			y = ABZ_Y(0.683);
			w = ABZ_W(0.45);
			h = ABZ_H(0.04);
			sizeEx = ABZ_FC(0.034,0.04);
			colorText[] = {0.6,1,0.6,1};
		};
		class HelpPanel: ABZ_RscControlsGroup
		{
			x = ABZ_X(0.535);
			y = ABZ_Y(0.73);
			w = ABZ_W(0.45);
			h = ABZ_H(0.11);
			class Controls
			{
				class HelpText: ABZ_RscStructuredText
				{
					idc = 78806;
					x = QUOTE(0);
					y = QUOTE(0);
					w = ABZ_W(0.45) - ABZ_SBW;
					h = ABZ_H(0.11);
					size = ABZ_F(0.026);
					text = "<t color='#f1c27d'>THE BAZAAR</t><br/>Stock rotates on the timer - what you see is what they have today. Single items go straight into your kit. <t color='#d98cff'>BULK CRATES</t> are sealed: haul them to HQ and unpack them into the arsenal. Lose the crate, lose the goods.";
				};
			};
		};

		// ---- bottom bar ----
		class QtyEdit: ABZ_RscEdit
		{
			idc = 78809;
			tooltip = "How many to buy - type any number up to what the trader has left. Bulk crates are always one per buy.";
			text = "1";
			x = ABZ_X(0.015);
			y = ABZ_Y(0.86);
			w = ABZ_W(0.075);
			h = ABZ_H(0.055);
			sizeEx = ABZ_FC(0.036,0.055);
		};
		class DestCombo: ABZ_RscCombo
		{
			idc = 78812;
			tooltip = "Where single-item purchases go: straight into your kit, into the cargo of a vehicle parked within 15m of you, or into an open crate beside the stall (repeat buys fill the same crate). Bulk crates always come sealed.";
			x = ABZ_X(0.1);
			y = ABZ_Y(0.86);
			w = ABZ_W(0.255);
			h = ABZ_H(0.055);
			sizeEx = ABZ_FC(0.034,0.055) min (0.0336 * safeZoneH);	// 3 rows in the drop-down at any UI scale
			wholeHeight = ABZ_H(0.16);	// the open list ends on the screen
		};
		class ButtonBuy: ABZ_RscButton
		{
			idc = 78810;
			text = "BUY";
			x = ABZ_X(0.365);
			y = ABZ_Y(0.86);
			w = ABZ_W(0.14);
			h = ABZ_H(0.055);
			sizeEx = ABZ_FC(0.038,0.055);
			colorBackground[] = {0.55,0.35,0.1,0.9};
			action = "call ABZ_fnc_shopBuy";
		};
		class ButtonPin: ABZ_RscButton
		{
			idc = 78814;
			text = "PIN";
			tooltip = "Wanted List: pin the selected item and hear in chat the moment any trader has it (as a single, a sealed crate, or a job asking for it). Up to 10 pins, kept in your profile. Press again to unpin.";
			x = ABZ_X(0.515);
			y = ABZ_Y(0.86);
			w = ABZ_W(0.1);
			h = ABZ_H(0.055);
			sizeEx = ABZ_FC(0.036,0.055);
			action = "call ABZ_fnc_shopPin";
		};
		class ButtonRumours: ABZ_RscButton
		{
			idc = 78811;
			text = "RUMOURS";
			tooltip = "Where else are traders set up right now, when do they restock, who has your Wanted List pins, and how are the smuggling runs going?";
			x = ABZ_X(0.625);
			y = ABZ_Y(0.86);
			w = ABZ_W(0.17);
			h = ABZ_H(0.055);
			sizeEx = ABZ_FC(0.036,0.055);
			action = "call ABZ_fnc_rumours";
		};
		class ButtonClose: ABZ_RscButton
		{
			idc = 78813;
			text = "CLOSE";
			x = ABZ_X(0.805);
			y = ABZ_Y(0.86);
			w = ABZ_W(0.18);
			h = ABZ_H(0.055);
			sizeEx = ABZ_FC(0.036,0.055);
			action = "closeDialog 0";
		};
	};
};

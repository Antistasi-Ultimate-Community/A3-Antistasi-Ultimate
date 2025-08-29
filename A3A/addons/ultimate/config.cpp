#include "script_component.hpp"

class CfgPatches 
{
    class ADDON 
    {
        name = COMPONENT_NAME;
        magazines[] = {QGVAR(LockpickKit_MultiUse), QGVAR(LockpickKit_SingleUse)};
        units[] = {};
        weapons[] = {"TFAR_SCR536"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3A_Events"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "CfgFunctions.hpp"
#include "patches\CfgMagazines.hpp"

class cfgWeapons
{
    class ItemRadio;
    #include "patches\cfgWeapons.hpp"
};

class cfgVehicles
{
    class Item_Base_F;
    class Thing;
    #include "patches\cfgVehicles.hpp"
};

class RscBackPicture;
class RscEditLCD;
class HiddenButton;
class HiddenRotator;
class HiddenFlip;

/* #Mosecu
$[
	1.063,
	["ree",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[-1200,"background: RscBackPicture",[1,"x\A3A\addons\ultimate\patches\data\radio_co.paa",["0.123594 * safezoneW + safezoneX","0.00499991 * safezoneH + safezoneY","0.252656 * safezoneW","0.781 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-1201,"image: RscBackPicture",[1,"x\A3A\addons\ultimate\patches\data\radio_paper_background_ca.paa",["0.304062 * safezoneW + safezoneX","0.225 * safezoneH + safezoneY","0.175313 * safezoneW","0.154 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"enter: HiddenButton",[1,"",["0.438125 * safezoneW + safezoneX","0.346 * safezoneH + safezoneY","0.020625 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Set frequency","-1"],["idc = 100300;","onButtonClick = |[((ctrlParent (_this select 0))) displayCtrl 100500] call TFAR_handhelds_fnc_onButtonClick_Enter;|;","action = ||;"]],
	[1003,"clear: HiddenButton",[1,"",["0.324687 * safezoneW + safezoneX","0.335 * safezoneH + safezoneY","0.0309375 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Clear frequency","-1"],["idc = 100400;","action = |ctrlSetText [100500,^^]; ctrlSetFocus ((findDisplay 100400) displayCtrl 100500);|;"]],
	[1004,"edit: RscEditLCD",[1,"",["0.365937 * safezoneW + safezoneX","0.236 * safezoneH + safezoneY","0.0928125 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Current frequency","-1"],["idc = 100500;","canModify = 1;","onKeyUp = |if (_this select 1 in [28,156]) then { [((ctrlParent (_this select 0))) displayCtrl 100500] call TFAR_handhelds_fnc_onButtonClick_Enter; };|;"]],
	[1005,"channel_edit: RscEditLCD",[1,"",["0.407187 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.061875 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Current channel","-1"],["idc = 100600;","canModify = 0;"]],
	[1006,"channel_up: HiddenButton",[1,"",["0.396875 * safezoneW + safezoneX","0.335 * safezoneH + safezoneY","0.020625 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Next channel","-1"],["idc = 100700;","action = |[1, false] call TFAR_fnc_setChannelViaDialog;|;"]],
	[1007,"channel_down: HiddenButton",[1,"",["0.371094 * safezoneW + safezoneX","0.346 * safezoneH + safezoneY","0.020625 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Previous channel","-1"],["idc = 100800;","action = |[0, false] call TFAR_fnc_setChannelViaDialog;|;"]]
]
*/

class scr536_radio_dialog
{
	idd=100000;
	movingEnable=1;
	controlsBackground[]={};
	objects[]={};
	onUnload="['OnRadioOpen', [player, TF_sw_dialog_radio, false, 'scr536_radio_dialog', false]] call TFAR_fnc_fireEventHandlers;";
	// onLoad="if (sunOrMoon < 0.2) then { ((_this select 0) displayCtrl 67676) ctrlSetText '\z\tfar\addons\handhelds\fadak\ui\fadak_n.paa';};";
	controls[]=
	{
		"background",
        "image",
        "enter",
        "clear",
        "edit",
        // "channel_edit",
        "channel_up",
        "channel_down"
	};
    class background: RscBackPicture
    {
        idc = 100100;
        text = "x\A3A\addons\ultimate\patches\data\radio_ca.paa";
        moving = 1;
        x = 0.0978125 * safezoneW + safezoneX;
        y = -0.00599999 * safezoneH + safezoneY;
        w = 0.252656 * safezoneW;
        h = 0.891 * safezoneH;
    };
    class image: RscBackPicture
    {
        idc = 100200;
        text = "x\A3A\addons\ultimate\patches\data\radio_paper_background_ca.paa";
        moving = 1;
        x = 0.304062 * safezoneW + safezoneX;
        y = 0.225 * safezoneH + safezoneY;
        w = 0.175313 * safezoneW;
        h = 0.154 * safezoneH;
    };
    class edit: RscEditLCD
    {
        idc = 100500;
        canModify = 1;
        onKeyUp = "if (_this select 1 in [28,156]) then { [((ctrlParent (_this select 0))) displayCtrl 100500] call TFAR_handhelds_fnc_onButtonClick_Enter; };";

        x = 0.365937 * safezoneW + safezoneX;
        y = 0.247 * safezoneH + safezoneY;
        w = 0.0979687 * safezoneW;
        h = 0.033 * safezoneH;
        tooltip = "Current frequency";
    };
    // class channel_edit: RscEditLCD
    // {
    //     idc = 100600;
    //     canModify = 0;

    //     x = 0.407187 * safezoneW + safezoneX;
    //     y = 0.291 * safezoneH + safezoneY;
    //     w = 0.061875 * safezoneW;
    //     h = 0.033 * safezoneH;
    //     tooltip = "Current channel";
    // };
    class enter: HiddenButton
    {
        idc = 100300;
        onButtonClick = "[((ctrlParent (_this select 0))) displayCtrl 100500] call TFAR_handhelds_fnc_onButtonClick_Enter;";
        action = "";

        x = 0.438125 * safezoneW + safezoneX;
        y = 0.335 * safezoneH + safezoneY;
        w = 0.020625 * safezoneW;
        h = 0.022 * safezoneH;
        tooltip = "Set frequency";
    };
    class clear: HiddenButton
    {
        idc = 100400;
        action = "ctrlSetText [100500,'']; ctrlSetFocus ((findDisplay 100400) displayCtrl 100500);";

        x = 0.324687 * safezoneW + safezoneX;
        y = 0.335 * safezoneH + safezoneY;
        w = 0.0309375 * safezoneW;
        h = 0.022 * safezoneH;
        tooltip = "Clear frequency";
    };
    class channel_up: HiddenButton
    {
        idc = 100700;
        action = "[1, false] call TFAR_fnc_setChannelViaDialog;";

        x = 0.396875 * safezoneW + safezoneX;
        y = 0.335 * safezoneH + safezoneY;
        w = 0.020625 * safezoneW;
        h = 0.022 * safezoneH;
        tooltip = "Next channel";
    };
    class channel_down: HiddenButton
    {
        idc = 100800;
        action = "[0, false] call TFAR_fnc_setChannelViaDialog;";

        x = 0.371094 * safezoneW + safezoneX;
        y = 0.335 * safezoneH + safezoneY;
        w = 0.020625 * safezoneW;
        h = 0.022 * safezoneH;
        tooltip = "Previous channel";
    };
};

// to-do: move the radio stuff into a seperate folder inside patches, let arma load it as its own addon

class A3U
{
    #include "config\plane\cfgPlaneLoadouts.hpp"
    #include "config\cfgForbiddenItems.hpp"
    #include "config\trader\cfgTraderMods.hpp"
};

class Extended_PostInit_EventHandlers 
{
    class ADDON
	{
        init = "call A3U_fnc_postInit";
    };
};

class Extended_PreInit_EventHandlers 
{
    class ADDON
	{
        init = "call A3U_fnc_init";
    };
};

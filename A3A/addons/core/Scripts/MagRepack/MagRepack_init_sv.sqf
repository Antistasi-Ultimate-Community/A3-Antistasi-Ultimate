
/*
	|----
		-Author: Outlawled (updated to 3.1.2 by GiPPO)
		-Created: 7 March 2013
		-Updated: 31 August 2015
		-Version: 3.1.3 (Script)
		-Description:	- Allows the player to repack the ammo in his magazines.
						- Default keybinding to open the Mag Repack dialog is "Ctrl+R", this can be customized via the options menu in the Mag Repack dialog.
						- Pressing "Shift+Ctrl+Alt+Backspace" will reset the keybinding to the default setting (in case the player forgets what he changed his keybinding to).
						- The player may choose a magazine from a list of all of his magazines to be the "Source" magazine and then he may choose a magazine
						from a list of all of his magazines of the same ammo type as the Source magazine to be the "Target" magazine (or vice versa). As soon
						as the Source and Target are both defined, bullets from the Source magazine will automatically start repacking into the	Target magazine.
	|----
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

outlw_MR_bulletTime = 0.8; // Seconds per individual bullet.
outlw_MR_beltTime = 4; // Seconds per belt magazine.

////////////////////////////////////////////////////////////////////////////////////////////////////

if (isClass(configFile >> "CfgPatches" >> "outlw_magRepack")) exitWith {};

disableSerialization;

outlw_MR_version = "3.1.3";
outlw_MR_date = "31 August 2015";

outlw_MR_defaultKeybinding = [false, true, false, 19];

outlw_MR_canCreateDialog = true;
outlw_MR_keybindingMenuActive = false;
outlw_MR_debugMode = profileNamespace getVariable ["outlw_MR_debugMode_profile", false];
outlw_MR_doHideFull = profileNamespace getVariable ["outlw_MR_doHideFull_profile", false];
outlw_MR_keyList = profileNamespace getVariable ["outlw_MR_keyList_profile", outlw_MR_defaultKeybinding];

if (typeName(outlw_MR_keyList select 0) != "BOOL") then
{
	profileNamespace setVariable ["outlw_MR_keyList_profile", outlw_MR_defaultKeybinding];
	outlw_MR_keyList =+ outlw_MR_defaultKeybinding;
};

outlw_MR_shift = outlw_MR_keyList select 0;
outlw_MR_ctrl = outlw_MR_keyList select 1;
outlw_MR_alt = outlw_MR_keyList select 2;
outlw_MR_keybinding = outlw_MR_keyList select 3;

[] execVM QPATHTOFOLDER(Scripts\MagRepack\Scripts\MagRepack_Main.sqf);
[] execVM QPATHTOFOLDER(Scripts\MagRepack\Scripts\MagRepack_Keybindings.sqf);
[] execVM QPATHTOFOLDER(Scripts\MagRepack\Scripts\MagRepack_Misc.sqf);


waitUntil {!(isNil "outlw_MR_getIDCs")};

outlw_MR_listIDCs = [(missionConfigFile >> "MR_Dialog" >> "Controls")] call outlw_MR_getIDCs;

waitUntil {!(isNull (findDisplay 46))};

(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call outlw_MR_keyDown;"];

systemChat (localize "STR_magRepack_init");
systemChat ([localize "STR_magRepack_keybind","", (call outlw_MR_keyListToString)] joinString "");

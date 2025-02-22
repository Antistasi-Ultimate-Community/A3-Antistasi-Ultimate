class garrisonRecruit: SimpleMenuBigger 
{
	idd = 100;
	
	onUnload = "";

	class Controls
	{
		class closeButton: ScrtRscCloseButton
		{
			idc = 103;
			x = 0.674 * safezoneW + safezoneX;
			y = 0.223941 * safezoneH + safezoneY;
			w = 0.02 * safezoneW;
			h = 0.02 * safezoneH;
			action = "closeDialog 0";
		};

		class title: SimpleTitle
		{
			idc = -1;
			text = $STR_antistasi_dialogs_garrison_recruit_frame_text;
		};

		class riflemanButton: SimpleButton
		{
			idc = 104;
			text = $STR_antistasi_dialogs_garrison_spawn_rifleman_text;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			action = "[A3A_faction_reb get 'unitRifle'] spawn A3A_fnc_garrisonAdd";
		};

		class autoriflemanButton: SimpleButton
		{
			idc = 105;
			text = $STR_antistasi_dialogs_garrison_spawn_autorifleman_text;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			action = "[A3A_faction_reb get 'unitMG'] spawn A3A_fnc_garrisonAdd";
		};

		class medicButton: SimpleButton
		{
			idc = 126;
			text = $STR_antistasi_dialogs_garrison_spawn_medic_text;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			action = "[A3A_faction_reb get 'unitMedic'] spawn A3A_fnc_garrisonAdd";
		};

		class squadleaderButton: SimpleButton
		{
			idc = 107;
			text = $STR_antistasi_dialogs_garrison_spawn_squad_lead_text;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			action = "[A3A_faction_reb get 'unitSL'] spawn A3A_fnc_garrisonAdd";
		};

		class aaButton: SimpleButton
		{
			idc = 112;
			text = $STR_antistasi_dialogs_unit_recruit_aamissile_text;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.680 * safezoneH + safezoneY;
			action = "[A3A_faction_reb get 'unitAA'] spawn A3A_fnc_garrisonAdd";
		};

		class latButton: SimpleButton
		{
			idc = 108;
			text = $STR_antistasi_dialogs_garrison_spawn_at_text;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			action = "[A3A_faction_reb get 'unitLAT'] spawn A3A_fnc_garrisonAdd";
		};

		class grenadierButton: SimpleButton
		{
			idc = 109;
			text = $STR_antistasi_dialogs_garrison_spawn_grenadier_text;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			action = "[A3A_faction_reb get 'unitGL'] spawn A3A_fnc_garrisonAdd";
		};

		class sniperButton: SimpleButton
		{
			idc = 110;
			text = $STR_antistasi_dialogs_garrison_spawn_marksman_text;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			action = "[A3A_faction_reb get 'unitSniper'] spawn A3A_fnc_garrisonAdd";
		};
		
		class atButton: SimpleButton
		{
			idc = 111;
			text = $STR_antistasi_dialogs_unit_recruit_atmissile_text;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			action = "[A3A_faction_reb get 'unitAT'] spawn A3A_fnc_garrisonAdd";
		};
	};
};

class unitRecruit: SimpleMenuBigger 
{
	idd=100;
	
	class Controls
	{
		class closeButton: ScrtRscCloseButton
		{
			idc = -1;
			x = 0.674 * safezoneW + safezoneX;
			y = 0.223941 * safezoneH + safezoneY;
			w = 0.02 * safezoneW;
			h = 0.02 * safezoneH;
			action = "closeDialog 0";
		};

		class title: SimpleTitle
		{
			idc = -1;
			text = $STR_antistasi_dialogs_unit_recruit_frame_text;
		};

		class riflemanButton: SimpleButton
		{
			idc = 104;
			text = $STR_antistasi_dialogs_unit_recruit_rifleman_text;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			action = "[A3A_faction_reb get 'unitRifle'] spawn A3A_fnc_reinfPlayer";
		};

		class autoriflemanButton: SimpleButton
		{
			idc = 105;
			text = $STR_antistasi_dialogs_unit_recruit_mg_text;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			action = "[A3A_faction_reb get 'unitMG'] spawn A3A_fnc_reinfPlayer";
		};

		class medicButton: SimpleButton
		{
			idc = 126;
			text = $STR_antistasi_dialogs_unit_recruit_medic_text;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			action = "[A3A_faction_reb get 'unitMedic'] spawn A3A_fnc_reinfPlayer";
		};

		class engineerButton: SimpleButton
		{
			idc = 107;
			text = $STR_antistasi_dialogs_unit_recruit_engineer_text;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			action = "[A3A_faction_reb get 'unitEng'] spawn A3A_fnc_reinfPlayer";
		};

		class atButton: SimpleButton
		{
			idc = 112;
			text = $STR_antistasi_dialogs_unit_recruit_atmissile_text;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.680 * safezoneH + safezoneY;
			action = "[A3A_faction_reb get 'unitAT'] spawn A3A_fnc_reinfPlayer";
		};
		
		class explButton: SimpleButton
		{
			idc = 108;
			text = $STR_antistasi_dialogs_unit_recruit_explosive_text;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			action = "[A3A_faction_reb get 'unitExp'] spawn A3A_fnc_reinfPlayer";
		};

		class grenadierButton: SimpleButton
		{
			idc = 109;
			text = $STR_antistasi_dialogs_unit_recruit_grenadier_text;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			action = "[A3A_faction_reb get 'unitGL'] spawn A3A_fnc_reinfPlayer";
		};

		class sniperButton: SimpleButton
		{
			idc = 110;
			text = $STR_antistasi_dialogs_unit_recruit_marksman_text;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			action = "[A3A_faction_reb get 'unitSniper'] spawn A3A_fnc_reinfPlayer";
		};

		class latButton: SimpleButton
		{
			idc = 111;
			text = $STR_antistasi_dialogs_unit_recruit_antitank_text;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			action = "[A3A_faction_reb get 'unitLAT'] spawn A3A_fnc_reinfPlayer";
		};

		class aaButton: SimpleButton
		{
			idc = 113;
			text = $STR_antistasi_dialogs_unit_recruit_aamissile_text;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.680 * safezoneH + safezoneY;
			action = "[A3A_faction_reb get 'unitAA'] spawn A3A_fnc_reinfPlayer";
		};
	};
};

class missionMenu: SimpleMenuBig
{
	idd = 100;
	
	class Controls
	{
		class closeButton: ScrtRscCloseButton
		{
			idc = -1;
			x = 0.674 * safezoneW + safezoneX;
			y = 0.223941 * safezoneH + safezoneY;
			w = 0.02 * safezoneW;
			h = 0.02 * safezoneH;
			action = "closeDialog 0;";
		};

		class title: SimpleTitle
		{
			idc = -1;
			text = $STR_antistasi_dialogs_available_missions_frame_text;
		};

		class asButton: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_assassination_text;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			action = "closeDialog 0;if ((player call A3A_fnc_isMember) or (!(isPlayer theBoss))) then {[""AS"", clientOwner] remoteExec [""A3A_fnc_missionRequest"", 2]} else {[localize 'STR_mission_request_header', localize 'STR_generic_commander_only'] call SCRT_fnc_misc_deniedHint;};";
		};

		class convoyButton: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_convoy_text;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			action = "closeDialog 0;if ((player call A3A_fnc_isMember) or (!(isPlayer theBoss))) then {[""CONVOY"", clientOwner] remoteExec [""A3A_fnc_missionRequest"", 2]} else {[localize 'STR_mission_request_header', localize 'STR_generic_commander_only'] call SCRT_fnc_misc_deniedHint;};";
		};

		class destroyButton: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_destroy_text;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			action = "closeDialog 0;if ((player call A3A_fnc_isMember) or (!(isPlayer theBoss))) then {[""DES"", clientOwner] remoteExec [""A3A_fnc_missionRequest"", 2]} else {[localize 'STR_mission_request_header', localize 'STR_generic_commander_only'] call SCRT_fnc_misc_deniedHint;};";
		};

		class logButton: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_logistics_text;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			action = "closeDialog 0;if ((player call A3A_fnc_isMember) or (!(isPlayer theBoss))) then {[""LOG"", clientOwner] remoteExec [""A3A_fnc_missionRequest"", 2]} else {[localize 'STR_mission_request_header', localize 'STR_generic_commander_only'] call A3A_fnc_customHint;};";
		};

		class resButton: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_rescue_text;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			action = "closeDialog 0;if ((player call A3A_fnc_isMember) or (!(isPlayer theBoss))) then {[""RES"", clientOwner] remoteExec [""A3A_fnc_missionRequest"", 2]} else {[localize 'STR_mission_request_header', localize 'STR_generic_commander_only'] call A3A_fnc_customHint;};";
		};

		class conButton: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_conquest_text;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			action = "closeDialog 0;if ((player call A3A_fnc_isMember) or (!(isPlayer theBoss))) then {[""CON"", clientOwner] remoteExec [""A3A_fnc_missionRequest"", 2]} else {[localize 'STR_mission_request_header', localize 'STR_generic_commander_only'] call A3A_fnc_customHint;};";
		};

		class suppButton: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_supply_text;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			action = "closeDialog 0;if ((player call A3A_fnc_isMember) or (!(isPlayer theBoss))) then {[""SUPP"", clientOwner] remoteExec [""A3A_fnc_missionRequest"", 2]} else {[localize 'STR_mission_request_header', localize 'STR_generic_commander_only'] call A3A_fnc_customHint;};";
		};
	};
};

class radioComm: SimpleMenuBigger
{
	idd=100;

	class Controls
	{
		class closeButton: ScrtRscCloseButton
		{
			idc = -1;
			x = 0.674 * safezoneW + safezoneX;
			y = 0.223941 * safezoneH + safezoneY;
			w = 0.02 * safezoneW;
			h = 0.02 * safezoneH;
			action = "closeDialog 0";
		};

		class title: SimpleTitle
		{
			idc = -1;
			text = $STR_antistasi_dialogs_battle_options_frame_text;
		};

		class l1Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_journal_entry_header_Features_11;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_fast_travel_tooltip;
			action = "closeDialog 0; [] spawn A3A_fnc_fastTravelRadio;";
		};

		class l2Button: SimpleButton
		{
			idc = 105;
			text = $STR_antistasi_dialogs_undercover_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_undercover_tooltip;
			action = "closeDialog 0; [] spawn A3A_fnc_goUndercover";
		};

		class l3Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_put_garage_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_put_garage_tooltip;
			action = "closeDialog 0; [cursorObject, clientOwner, call HR_GRG_dLock, player] remoteExecCall ['HR_GRG_fnc_addVehicle',2];";
		};

		class l4Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_ai_management_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_ai_management_tooltip;
			action = "if (player == leader group player) then {closeDialog 0;createDialog ""aiManagement""} else {[localize 'STR_antistasi_dialogs_ai_management_title', localize 'STR_generic_group_leader_only'] call A3A_fnc_customHint;};";
		};

		class l5Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_flip_vehicle_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.682 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_flip_vehicle_tooltip;
			action = "closeDialog 0; [] call SCRT_fnc_common_unflipVehicle";
		};
		
		class r1Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_players_money_title;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_players_money_tooltip;
			action = "closeDialog 0; createDialog 'playerMoney';";
		};

		// class r2Button: SimpleButton
		// {
		// 	idc = -1;
		// 	text = $STR_antistasi_dialogs_construction_menu_frame_text;
		// 	x = 0.477 * safezoneW + safezoneX;
		// 	y = 0.388 * safezoneH + safezoneY;
		// 	tooltip = $STR_antistasi_dialogs_construction_tooltip;
		// 	action = "closeDialog 0; [] call SCRT_fnc_ui_createConstructionMenu;";
		// };

		class r3Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_unlock_vehicle_title;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_unlock_vehicle_tooltip;
			action = "closeDialog 0;[] call A3A_fnc_unlockVehicle";
		};

		class r4Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_actions_commander_text;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_commander_tooltip;
			action = "closeDialog 0; createDialog 'commanderComm';";
		};

		class r5Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_move_veh_title;
			x = 0.477 * safezoneW + safezoneX	;
			y = 0.682 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_move_veh_tooltip;
			action = "closeDialog 0; [cursorObject] spawn SCRT_fnc_common_moveStatic;";
		};
	};
};

class vehQuery: SimpleMenuSmall
{
	idd=100;

	class Controls
	{
		class title: SimpleTitle
		{
			idc = -1;
			text = $STR_antistasi_dialogs_add_vehicle_to_squad_frame_text;
		};

		class yesButton: SimpleButton
		{
			idc = 104;
			text = $STR_antistasi_dialogs_generic_button_yes_text;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.376])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.125])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.043])",0.9};
			action = "closeDialog 0; vehQuery = true;";
		};
		
		class noButton: SimpleButton
		{
			idc = 105;
			text = $STR_antistasi_dialogs_generic_button_no_text;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			action = "closeDialog 0; vehQuery = nil;";
		};
	};
};

class constructionRemovalConfirmation: SimpleMenuSmall
{
	idd=123;
	onLoad = "";
	onUnload = "";

	class Controls
	{
		class title: SimpleTitle
		{
			idc = 1244;
			text = $STR_antistasi_dialogs_remove_construction_confirmation;
		};

		class yesButton: SimpleButton
		{
			idc = 104;
			text = $STR_antistasi_dialogs_generic_button_yes_text;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			colorBackground[] = {"0.376","0.125","0.043",0.9};
			action = "closeDialog 0; removeConstruction = true;";
		};
		
		class noButton: SimpleButton
		{
			idc = 105;
			text = $STR_antistasi_dialogs_generic_button_no_text;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			action = "closeDialog 0; removeConstruction = nil;";
		};
	};
};

class aiManagement: SimpleMenuBigger 
{
	idd = -1;

	class Controls
	{
		class closeButton: ScrtRscCloseButton
		{
			idc = 103;
			x = 0.674 * safezoneW + safezoneX;
			y = 0.223941 * safezoneH + safezoneY;
			w = 0.02 * safezoneW;
			h = 0.02 * safezoneH;
			action = "closeDialog 0; createDialog 'radioComm';";
		};

		class title: SimpleTitle
		{
			idc = -1;
			text = $STR_antistasi_dialogs_ai_management_frame_text;
		};

		class l1Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_ai_control_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_ai_control_tooltip;
			action = "closeDialog 0; if ((count groupselectedUnits player > 0) and (count hcSelected player > 0)) exitWith {[localize 'STR_antistasi_dialogs_ai_control_title', localize 'STR_generic_ai_control_one_only'] call A3A_fnc_customHint;}; if (count groupselectedUnits player == 1) then {nul = [groupselectedUnits player] spawn A3A_fnc_controlunit}; if (count hcSelected player == 1) then {nul = [hcSelected player] spawn A3A_fnc_controlHCsquad;};";
		};

		class l2Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_high_command_transfer_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_arty_high_command_transfer_tooltip;
			action = "closeDialog 0;[] call SCRT_fnc_common_hcTransfer";
		};

		class l3Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_garrison_units_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_garrison_units_tooltip;
			action = "closeDialog 0;if (count groupselectedUnits player > 0) then {nul = [groupselectedUnits player] spawn A3A_fnc_addToGarrison} else {if (count (hcSelected player) > 0) then {nul = [hcSelected player] spawn A3A_fnc_addToGarrison}}; if ((count groupselectedUnits player == 0) and (count hcSelected player == 0)) then {[localize 'STR_garrison_garrison_header', localize 'STR_generic_no_units_squads_selected'] call A3A_fnc_customHint;}";
		};

		class l4Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_dismiss_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_dismiss_tooltip;
			action = "closeDialog 0;if (count groupselectedUnits player > 0) then {nul = [groupselectedUnits player] spawn A3A_fnc_dismissPlayerGroup} else {if (count (hcSelected player) > 0) then {nul = [hcSelected player] spawn A3A_fnc_dismissSquad}}; if ((count groupselectedUnits player == 0) and (count hcSelected player == 0)) then {[localize 'STR_generic_dismiss_squads', localize 'STR_generic_no_units_squads_selected'] call A3A_fnc_customHint;}";
		};

		class l5Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_arty_support_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.682 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_arty_support_tooltip;
			action = "closeDialog 0; [] spawn A3A_fnc_artySupport;";
		};
		
		class r1Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_auto_rearm_title;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_auto_rearm_tooltip;
			action = "closeDialog 0; if (count groupselectedUnits player == 0) then {nul = (units group player) spawn A3A_fnc_rearmCall} else {nul = (groupselectedUnits player) spawn A3A_fnc_rearmCall};";
		};

		class r2Button: SimpleButton
		{
			idc = -1;
			text = "SITREP";
			x = 0.477 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_sitrep_tooltip;
			action = "[""stats""] call A3A_fnc_vehStats;";
		};

		class r3Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_assign_vehicle_title;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_assign_vehicle_tooltip;
			action = "closeDialog 0;[] call A3A_fnc_addSquadVeh;";
		};

		class r4Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_mount_veh_title;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_mount_veh_tooltip;
			action = "[""mount""] call A3A_fnc_vehStats";
		};
	};
};

class commanderComm: SimpleMenuBigger
{
	idd = -1;

	class Controls
	{
		class closeButton: ScrtRscCloseButton
		{
			idc = -1;
			x = 0.674 * safezoneW + safezoneX;
			y = 0.223941 * safezoneH + safezoneY;
			w = 0.02 * safezoneW;
			h = 0.02 * safezoneH;
			action = "closeDialog 0; createDialog 'radioComm';";
		};

		class title: SimpleTitle
		{
			idc = -1;
			text = $STR_antistasi_dialogs_commander_battle_options_frame_text;
		};

		class l1Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_recruit_squad_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_add_recruit_squad_tooltip;
			action = "if (player isEqualTo theBoss) then {closeDialog 0; [] spawn A3A_fnc_squadRecruit; } else {[localize 'STR_antistasi_dialogs_recruit_squad_title', localize 'STR_generic_commander_only'] call A3A_fnc_customHint;};";
		};

		class l2Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_rally_point_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_add_rally_point_tooltip;
			action = "if (player isEqualTo theBoss) then {closeDialog 0; [] call SCRT_fnc_rally_toggleRallyPoint;} else {[localize 'STR_antistasi_dialogs_rally_point_title', localize 'STR_generic_commander_only'] call A3A_fnc_customHint;};";
		};

		class l3Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_share_faction_money_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_share_faction_money_tooltip;
			action = "if (player isEqualTo theBoss) then {closeDialog 0; [] call SCRT_fnc_common_shareFactionMoneyWithMembers;} else {[localize 'STR_antistasi_dialogs_share_faction_money_title', localize 'STR_generic_commander_only'] call A3A_fnc_customHint;};";
		}; //and theBoss call A3A_fnc_isMember?

		class l4Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_resign_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_resign_tooltip;
			action = "closeDialog 0; [player, cursorTarget] remoteExec ['A3A_fnc_theBossToggleEligibility', 2];";
		};

		class l5Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_arsenal_limits_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.682 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_arsenal_limits_tooltip;
			action = "if (player == theBoss) then {closeDialog 0; createDialog ""A3A_ArsenalLimitsDialog""} else {[localize 'STR_antistasi_dialogs_sell_vehicle_title', localize 'STR_antistasi_dialogs_not_commander_generic'] call A3A_fnc_customHint}";
		};

		class r1Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_open_add_to_air_title;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_open_add_to_air_tooltip;
			action = "if (player isEqualTo theBoss) then {closeDialog 0; [] call A3A_fnc_addBombRun;} else {[localize 'STR_antistasi_dialogs_open_add_to_air_title', localize 'STR_generic_commander_only'] call A3A_fnc_customHint;};";
		};

		class r2Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_open_clean_garbage_title;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_open_clean_garbage_tooltip;
			action = "if (player isEqualTo theBoss) then {closedialog 0;[] remoteExecCall [""A3A_fnc_garbageCleaner"",2]} else {[localize 'STR_antistasi_journal_entry_header_Options_7', localize 'STR_generic_commander_only'] call A3A_fnc_customHint;};";
		};

		class r3Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_open_comm_menu_title;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_open_comm_menu_tooltip;
			action = "closeDialog 0; closeDialog 0; [] call SCRT_fnc_ui_toggleCommanderMenu;";
		};

		class r4Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_sell_vehicle_title;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_sell_vehicle_tooltip;
			action = "if (player isEqualTo theBoss) then {closeDialog 0; [player,cursorObject] remoteExecCall [""A3A_fnc_sellVehicle"",2]} else {[localize 'STR_antistasi_journal_entry_header_commander_11', localize 'STR_generic_commander_only'] call A3A_fnc_customHint;};";
		};

		class r5Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_moveout_crew_title;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.682 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_moveout_crew_tooltip;
			action = "if (player isEqualTo theBoss) then {closeDialog 0; [player,cursorObject] remoteExecCall [""A3A_fnc_moveOutCrew"",2]} else {[localize 'STR_antistasi_journal_entry_header_commander_11', localize 'STR_generic_commander_only'] call A3A_fnc_customHint;};";
		};
	};
};

class constructionMenu: SimpleMenuSmall
{
	idd = 80000;
	
	class Controls
	{
		class closeButton: ScrtRscCloseButton
		{
			idc = -1;
			x = 0.674 * safezoneW + safezoneX;
			y = 0.223941 * safezoneH + safezoneY;
			w = 0.02 * safezoneW;
			h = 0.02 * safezoneH;
			action = "closeDialog 0;";
		};

		class title: SimpleTitle
		{
			idc = -1;
			text = $STR_antistasi_dialogs_construction_menu_frame_text;
		};

		class buildTypeComboBox: SimpleComboBox
		{
			idc = 505;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = "22 * pixelGridNoUIScale * pixelW";
			h = "2 * pixelGridNoUIScale * pixelH";
			onLBSelChanged = "[] call SCRT_fnc_ui_setBuildTypeCostText; [] call SCRT_fnc_ui_setAvailableBuildingTypes;";
		};

		class buildingComboBox: SimpleComboBox
		{
			idc = 506;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			w = "22 * pixelGridNoUIScale * pixelW";
			h = "2 * pixelGridNoUIScale * pixelH";
		};

		class costsText: SimpleText
		{
			idc = 510;
			text = "";
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			w = 0.183333 * safezoneW;	
			h = 0.0222222 * safezoneH;
		};

		// class r1Button: SimpleButton
		// {
		// 	idc = -1;
		// 	text = $STR_antistasi_dialogs_remove_construction;
		// 	tooltip = $STR_antistasi_dialogs_remove_construction_tooltip;
		// 	x = 0.477 * safezoneW + safezoneX;
		// 	y = 0.262 * safezoneH + safezoneY;	
		// 	colorBackground[] = {"0.376","0.125","0.043",0.9};
		// 	action = "[] spawn SCRT_fnc_ui_prepareConstructionRemoval;";
		// };

		// class r2Button: SimpleButton
		// {
		// 	idc = -1;
		// 	text = $STR_antistasi_dialogs_build;
		// 	x = 0.477 * safezoneW + safezoneX;
		// 	y = 0.346 * safezoneH + safezoneY;
		// 	tooltip = $STR_antistasi_dialogs_build_tooltip;
		// 	action = "[] call SCRT_fnc_ui_prepareConstructionBuild;";
		// 	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.376])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.125])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.043])",0.9};
		// };
	};
};

class squadRecruit: SimpleMenuBigger
{
	idd = 100;

	class Controls
	{
		class closeButton: ScrtRscCloseButton
		{
			idc = 103;
			x = 0.674 * safezoneW + safezoneX;
			y = 0.223941 * safezoneH + safezoneY;
			w = 0.02 * safezoneW;
			h = 0.02 * safezoneH;
			action = "closeDialog 0; createDialog 'radioComm';";
		};

		class title: SimpleTitle
		{
			idc = -1;
			text = $STR_antistasi_dialogs_squad_recruitment_menu_frame_text;
		};

		class l1Button: SimpleButton
		{
			idc = 104;
			text = $STR_antistasi_dialogs_infantry_squad_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			action = "closeDialog 0; [] spawn A3A_fnc_squadOptions;";
		};

		class l2Button: SimpleButton
		{
			idc = 106;
			text = $STR_antistasi_dialogs_at_team_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			action = "closeDialog 0;[A3A_faction_reb get 'groupAT'] spawn A3A_fnc_addFIAsquadHC";
		};

		class l3Button: SimpleButton
		{
			idc = 107;
			text = $STR_antistasi_dialogs_sniper_team_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			action = "closeDialog 0;[A3A_faction_reb get 'groupSniper'] spawn A3A_fnc_addFIAsquadHC";
		};

		class l4Button: SimpleButton
		{
			idc = 108;
			text = $STR_antistasi_dialogs_mg_team_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			action = "closeDialog 0;[selectRandom (A3A_faction_reb get 'staticMGs')] spawn A3A_fnc_addFIAsquadHC";
		};

		class l5Button: SimpleButton
		{
			idc = 112;
			text = $STR_antistasi_dialogs_veh_crew_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.682 * safezoneH + safezoneY;
			action = "closeDialog 0; [A3A_faction_reb get 'groupCrew'] spawn A3A_fnc_addFIAsquadHC";
		};
		
		class r1Button: SimpleButton
		{
			idc = 105;
			text = $STR_antistasi_dialogs_inf_team_title;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			action = "closeDialog 0;[A3A_faction_reb get 'groupMedium'] spawn A3A_fnc_addFIAsquadHC";
		};

		class r2Button: SimpleButton
		{
			idc = 109;
			text = $STR_antistasi_dialogs_at_car_title;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			action = "closeDialog 0;[selectRandom (A3A_faction_reb get 'vehiclesAT')] spawn A3A_fnc_addFIAsquadHC";
		};

		class r3Button: SimpleButton
		{
			idc = 110;
			text = $STR_antistasi_dialogs_aa_car_title;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			action = "closeDialog 0;[selectRandom (A3A_faction_reb get 'staticAA')] spawn A3A_fnc_addFIAsquadHC";
		};

		class r4Button: SimpleButton
		{
			idc = 111;
			text = $STR_antistasi_dialogs_mortar_team_title;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			action = "closeDialog 0;[selectRandom (A3A_faction_reb get 'staticMortars')] spawn A3A_fnc_addFIAsquadHC";
		};
		class r5Button: SimpleButton
		{
			idc = 113;
			text = $STR_antistasi_dialogs_mg_car_title;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.682 * safezoneH + safezoneY;
			action = "closeDialog 0;[selectRandom (A3A_faction_reb get 'vehiclesLightArmed')] spawn A3A_fnc_addFIAsquadHC";
		};
	};
};

class squadOptions: SimpleMenuSmall
{
	idd = 100;

	class Controls
	{
		class closeButton: ScrtRscCloseButton
		{
			idc = -1;
			x = 0.674 * safezoneW + safezoneX;
			y = 0.223941 * safezoneH + safezoneY;
			w = 0.02 * safezoneW;
			h = 0.02 * safezoneH;
			action = "closeDialog 0; createDialog 'squadRecruit';";
		};

		class title: SimpleTitle
		{
			idc = -1;
			text = $STR_antistasi_dialogs_squad_recruitment_menu_frame_text;
		};

		class l1Button: SimpleButton
		{
			idc = 104;
			text = $STR_antistasi_dialogs_normal_squad_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			action = "closeDialog 0; [A3A_faction_reb get 'groupSquad'] spawn A3A_fnc_addFIAsquadHC;";
		};

		class l2Button: SimpleButton
		{
			idc = 105;
			text = $STR_antistasi_dialogs_engineer_squad_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			action = "closeDialog 0; [A3A_faction_reb get 'groupSquadEng'] spawn A3A_fnc_addFIAsquadHC;";
		};
		
		class r1Button: SimpleButton
		{
			idc = 106;
			text = $STR_antistasi_dialogs_mg_squad_title;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			action = "closeDialog 0;[A3A_faction_reb get 'groupSquadSupp','MG'] spawn A3A_fnc_addFIAsquadHC";
		};

		class r2Button: SimpleButton
		{
			idc = 107;
			text = $STR_antistasi_dialogs_mortar_squad_title;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			action = "closeDialog 0; [A3A_faction_reb get 'groupSquadSupp','Mortar'] spawn A3A_fnc_addFIAsquadHC;";
		};
	};
};

class playerMoney: SimpleMenuSmall
{
	idd = -1;

	class Controls
	{
		class closeButton: ScrtRscCloseButton
		{
			idc = -1;
			x = 0.674 * safezoneW + safezoneX;
			y = 0.223941 * safezoneH + safezoneY;
			w = 0.02 * safezoneW;
			h = 0.02 * safezoneH;
			action = "closeDialog 0; createDialog 'radioComm'";
		};

		class title: SimpleTitle
		{
			idc = -1;
			text = $STR_antistasi_dialogs_squad_money_player_interaction_menu_frame_text;
		};

		class l1Button: SimpleButton
		{
			idc = 104;
			text = $STR_antistasi_dialogs_add_server_member_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_add_server_member_tooltip;
			action = "closeDialog 0; ['add'] call A3A_fnc_memberAdd;";
		};

		class l2Button: SimpleButton
		{
			idc = 105;
			text = $STR_antistasi_dialogs_remove_server_member_title;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			tooltip = $STR_antistasi_dialogs_remove_server_member_tooltip;
			action = "closeDialog 0; ['remove'] call A3A_fnc_memberAdd;";
		};
		
		class r1Text : SimpleText
		{
			idc = 120001;
			text = $STR_antistasi_dialogs_donate_player_title;
			tooltip = $STR_antistasi_dialogs_donate_player_tooltip;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.24 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.06 * safezoneH;
			style = ST_CENTER;
		};

		class r1Button: QuarterSimpleButton
		{
			idc = 308;
			text = "25%";
			x = 0.477 * safezoneW + safezoneX;
			y = 0.282 * safezoneH + safezoneY;
			action = "[player, cursorTarget, 0.25] call A3A_fnc_donateMoneyPercentage;";
		};

		class r2Button: QuarterSimpleButton
		{
			idc = 308;
			text = "50%";
			x = 0.527 * safezoneW + safezoneX;
			y = 0.282 * safezoneH + safezoneY;
			action = "[player, cursorTarget, 0.5] call A3A_fnc_donateMoneyPercentage;";
		};

		class r3Button: QuarterSimpleButton
		{
			idc = 308;
			text = "75%";
			x = 0.577 * safezoneW + safezoneX;
			y = 0.282 * safezoneH + safezoneY;
			action = "[player, cursorTarget, 0.75] call A3A_fnc_donateMoneyPercentage;";
		};

		class r4Button: QuarterSimpleButton
		{
			idc = 308;
			text = "100%";
			x = 0.627 * safezoneW + safezoneX;
			y = 0.282 * safezoneH + safezoneY;
			action = "[player, cursorTarget, 1] call A3A_fnc_donateMoneyPercentage;";
		};
		
		class r2Text : SimpleText
		{
			idc = 120001;
			text = $STR_antistasi_dialogs_donate_faction_title;
			tooltip = $STR_antistasi_dialogs_donate_faction_tooltip;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.06 * safezoneH;
			style = ST_CENTER;
		};

		class r5Button: QuarterSimpleButton
		{
			idc = 308;
			text = "25%";
			x = 0.477 * safezoneW + safezoneX;
			y = 0.366 * safezoneH + safezoneY;
			action = "[player, ObjNull, 0.25] call A3A_fnc_donateMoneyPercentage;";
		};

		class r6Button: QuarterSimpleButton
		{
			idc = 308;
			text = "50%";
			x = 0.527 * safezoneW + safezoneX;
			y = 0.366 * safezoneH + safezoneY;
			action = "[player, ObjNull, 0.5] call A3A_fnc_donateMoneyPercentage;";
		};

		class r7Button: QuarterSimpleButton
		{
			idc = 308;
			text = "75%";
			x = 0.577 * safezoneW + safezoneX;
			y = 0.366 * safezoneH + safezoneY;
			action = "[player, ObjNull, 0.75] call A3A_fnc_donateMoneyPercentage;";
		};

		class r8Button: QuarterSimpleButton
		{
			idc = 308;
			text = "100%";
			x = 0.627 * safezoneW + safezoneX;
			y = 0.366 * safezoneH + safezoneY;
			action = "[player, ObjNull, 1] call A3A_fnc_donateMoneyPercentage;";
		};
	};
};

class mortarType: SimpleMenuSmall 
{
	idd=-1;

	class Controls
	{
		class closeButton: ScrtRscCloseButton
		{
			idc = -1;
			x = 0.674 * safezoneW + safezoneX;
			y = 0.223941 * safezoneH + safezoneY;
			w = 0.02 * safezoneW;
			h = 0.02 * safezoneH;
			action = "closeDialog 0; createDialog 'radioComm'";
		};

		class title: SimpleTitle
		{
			idc = -1;
			text = $STR_antistasi_dialogs_barrage_strike;
		};

		class l1Button: SimpleButton
		{
			idc = -1;
			text = "HE";
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			action = "closeDialog 0; typeAmmunition = A3A_faction_reb get 'staticMortarMagHE';";
		};
		
		class r1Button: SimpleButton
		{
			idc = -1;
			text = "SMOKE";
			x = 0.477 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			action = "closeDialog 0; typeAmmunition = A3A_faction_reb get 'staticMortarMagSmoke';";
		};
	};
};

class roundsNumber: SimpleMenuBig
{
	idd = -1;

	class Controls
	{
		class title: SimpleTitle
		{
			idc = -1;
			text = $STR_antistasi_dialogs_rounds_quantity_title;
		};

		class l1Button: SimpleButton
		{
			idc = 104;
			text = "1";
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			action = "closeDialog 0;roundsX = 1;";
		};

		class l2Button: SimpleButton
		{
			idc = 106;
			text = "3";
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			action = "closeDialog 0;roundsX = 3;";
		};

		class l3Button: SimpleButton
		{
			idc = 107;
			text = "5";
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			action = "closeDialog 0;roundsX = 5;";
		};

		class l4Button: SimpleButton
		{
			idc = 108;
			text = "7";
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			action = "closeDialog 0;roundsX = 7;";
		};
		
		class r1Button: SimpleButton
		{
			idc = 105;
			text = "2";
			x = 0.477 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			action = "closeDialog 0;roundsX = 2;";
		};

		class r2Button: SimpleButton
		{
			idc = 109;
			text = "4";
			x = 0.477 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			action = "closeDialog 0;roundsX = 4;";
		};

		class r3Button: SimpleButton
		{
			idc = 110;
			text = "6";
			x = 0.477 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			action = "closeDialog 0;roundsX = 6;";
		};

		class r4Button: SimpleButton
		{
			idc = 111;
			text = "8";
			x = 0.477 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			action = "closeDialog 0;roundsX = 8;";
		};
	};
};

class strikeType: SimpleMenuSmall 
{
	idd=-1;

	class Controls
	{
		class title: SimpleTitle
		{
			idc = -1;
			text = $STR_antistasi_dialogs_select_strike_type;
		};

		class l1Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_single_point_strike;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			action = "closeDialog 0;typeArty = ""NORMAL"";";
		};
		
		class r1Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_barrage_strike;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			action = "closeDialog 0; typeArty = ""BARRAGE"";";
		};
	};
};

class NATOPlayer: SimpleMenuSmall 
{
	idd=-1;

	class Controls
	{
		class closeButton: ScrtRscCloseButton
		{
			idc = -1;
			x = 0.674 * safezoneW + safezoneX;
			y = 0.223941 * safezoneH + safezoneY;
			w = 0.02 * safezoneW;
			h = 0.02 * safezoneH;
			action = "closeDialog 0;";
		};

		class title: SimpleTitle
		{
			idc = -1;
			text = "SpecOps";
		};

		class l1Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_dialogs_quadbike;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			action = "closeDialog 0;[] call A3A_fnc_NATOQuadbike";
		};
		
		class r1Button: SimpleButton
		{
			idc = -1;
			text = $STR_antistasi_journal_entry_header_Features_11;
			x = 0.477 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			action = "closeDialog 0;[] spawn A3A_fnc_NATOFT";
		};
	};
};

class rebelLoadoutMenu: SimpleMenuMedium
{
	idd = 120000;
	onUnload ="";

	class Controls
	{
		class closeButton: ScrtRscCloseButton
		{
			idc = -1;
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.02 * safezoneW;
			h = 0.02 * safezoneH;
			action = "closeDialog 0;";
		};

		class title: SimpleTitle
		{
			idc = -1;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.02 * safezoneH;
			text = $STR_antistasi_dialogs_hq_button_rebel_loadouts_menu_title_text;
		};

		class l1Text: SimpleText
		{
			idc = 120001;
			text = $STR_antistasi_dialogs_rifleman_title;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;	
			h = 0.022 * safezoneH;
		};

		class l2Text: SimpleText
		{
			idc = 120002;
			text = $STR_antistasi_dialogs_autorifleman_title;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;	
			h = 0.022 * safezoneH;
		};

		class l3Text: SimpleText
		{
			idc = 120003;
			text = $STR_antistasi_dialogs_medic_title;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;	
			h = 0.022 * safezoneH;
		};

		class l4Text: SimpleText
		{
			idc = 120004;
			text = $STR_antistasi_dialogs_engineer_title;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;	
			h = 0.022 * safezoneH;
		};

		class l5Text: SimpleText
		{
			idc = 120005;
			text = $STR_antistasi_dialogs_grenadier_title;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;	
			h = 0.022 * safezoneH;
		};

		class l6Text: SimpleText
		{
			idc = 120006;
			text = $STR_antistasi_dialogs_marksman_title;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;	
			h = 0.022 * safezoneH;
		};

		class l7Text: SimpleText
		{
			idc = 120007;
			text = $STR_antistasi_dialogs_lat_title;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;	
			h = 0.022 * safezoneH;
		};

		class l8Text: SimpleText
		{
			idc = 120008;
			text = $STR_antistasi_dialogs_crewman_title;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;	
			h = 0.022 * safezoneH;
		};

		class l9Text: SimpleText
		{
			idc = 120009;
			text = $STR_antistasi_dialogs_squad_leader_title;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;	
			h = 0.022 * safezoneH;
		};

		class l10Text: SimpleText
		{
			idc = 120010;
			text = $STR_antistasi_dialogs_sapper_title;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;	
			h = 0.022 * safezoneH;
		};

		class l11Text: SimpleText
		{
			idc = 120011;
			text = $STR_antistasi_dialogs_at_title;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;	
			h = 0.022 * safezoneH;
		};

		class l12Text: SimpleText
		{
			idc = 120012;
			text = $STR_antistasi_dialogs_aa_title;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;	
			h = 0.022 * safezoneH;
		};

		class l1ArsenalButton: ArsenalButton
		{
			idc = -1;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "currentRebelLoadout = A3A_faction_reb get 'unitRifle'; [] call JN_fnc_arsenal_handleAction;";
		};

		class l1ResetButton: ResetButton
		{
			idc = -1;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "(A3A_faction_reb get 'unitRifle') call SCRT_fnc_arsenal_clearLoadout;";
		};

		class l2ArsenalButton: ArsenalButton
		{
			idc = -1;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "currentRebelLoadout = A3A_faction_reb get 'unitMG'; [] call JN_fnc_arsenal_handleAction;";
		};

		class l2ResetButton: ResetButton
		{
			idc = -1;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "(A3A_faction_reb get 'unitMG') call SCRT_fnc_arsenal_clearLoadout;";
		};

		class l3ArsenalButton: ArsenalButton
		{
			idc = -1;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "currentRebelLoadout = A3A_faction_reb get 'unitMedic'; [] call JN_fnc_arsenal_handleAction;";
		};

		class l3ResetButton: ResetButton
		{
			idc = -1;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "(A3A_faction_reb get 'unitMedic') call SCRT_fnc_arsenal_clearLoadout;";
		};

		class l4ArsenalButton: ArsenalButton
		{
			idc = -1;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "currentRebelLoadout = A3A_faction_reb get 'unitEng'; [] call JN_fnc_arsenal_handleAction;";
		};

		class l4ResetButton: ResetButton
		{
			idc = -1;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "(A3A_faction_reb get 'unitEng') call SCRT_fnc_arsenal_clearLoadout;";
		};
		
		class l5ArsenalButton: ArsenalButton
		{
			idc = -1;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "currentRebelLoadout = A3A_faction_reb get 'unitGL'; [] call JN_fnc_arsenal_handleAction;";
		};

		class l5ResetButton: ResetButton
		{
			idc = -1;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "(A3A_faction_reb get 'unitGL') call SCRT_fnc_arsenal_clearLoadout;";
		};

		class l6ArsenalButton: ArsenalButton
		{
			idc = -1;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "currentRebelLoadout = A3A_faction_reb get 'unitSniper'; [] call JN_fnc_arsenal_handleAction;";
		};

		class l6ResetButton: ResetButton
		{
			idc = -1;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "(A3A_faction_reb get 'unitSniper') call SCRT_fnc_arsenal_clearLoadout;";
		};

		class l7ArsenalButton: ArsenalButton
		{
			idc = -1;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "currentRebelLoadout = A3A_faction_reb get 'unitLAT'; [] call JN_fnc_arsenal_handleAction;";
		};

		class l7ResetButton: ResetButton
		{
			idc = -1;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "(A3A_faction_reb get 'unitLAT') call SCRT_fnc_arsenal_clearLoadout;";
		};

		class l8ArsenalButton: ArsenalButton
		{
			idc = -1;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "currentRebelLoadout = A3A_faction_reb get 'unitCrew'; [] call JN_fnc_arsenal_handleAction;";
		};

		class l8ResetButton: ResetButton
		{
			idc = -1;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "(A3A_faction_reb get 'unitCrew') call SCRT_fnc_arsenal_clearLoadout;";
		};

		class l9ArsenalButton: ArsenalButton
		{
			idc = -1;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "currentRebelLoadout = A3A_faction_reb get 'unitSL'; [] call JN_fnc_arsenal_handleAction;";
		};

		class l9ResetButton: ResetButton
		{
			idc = -1;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "(A3A_faction_reb get 'unitSL') call SCRT_fnc_arsenal_clearLoadout;";
		};

		class l10ArsenalButton: ArsenalButton
		{
			idc = -1;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "currentRebelLoadout = A3A_faction_reb get 'unitExp'; [] call JN_fnc_arsenal_handleAction;";
		};

		class l10ResetButton: ResetButton
		{
			idc = -1;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "(A3A_faction_reb get 'unitExp') call SCRT_fnc_arsenal_clearLoadout;";
		};

		class l11ArsenalButton: ArsenalButton
		{
			idc = -1;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "currentRebelLoadout = A3A_faction_reb get 'unitAT'; [] call JN_fnc_arsenal_handleAction;";
		};

		class l11ResetButton: ResetButton
		{
			idc = -1;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "(A3A_faction_reb get 'unitAT') call SCRT_fnc_arsenal_clearLoadout;";
		};

		class l12ArsenalButton: ArsenalButton
		{
			idc = -1;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "currentRebelLoadout = A3A_faction_reb get 'unitAA'; [] call JN_fnc_arsenal_handleAction;";
		};

		class l12ResetButton: ResetButton
		{
			idc = -1;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "(A3A_faction_reb get 'unitAA') call SCRT_fnc_arsenal_clearLoadout;";
		};
	};
};

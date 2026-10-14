class CfgMapContextMenu {
    class Location {
        class ContextBase {
            // Context menu action title
            title = "";
            // Context menu action tooltip
            tooltip = "";
            // Context menu action tooltip when the action is disabled
            tooltipDisabled = "";
            // Context menu action condition; signature [String marker, Object player[, Array params]] -> Boolean
            //
            // Variables available in condition statement:
            //   * `_isBlackMarketTrader`: Boolean indicating if the location is a black market trader
            //   * `_isCommander`: Boolean indicating if the player is the commander
            //   * `_isDestroyed`: Boolean indicating if the location is destroyed
            //   * `_isMilitaryAdministration`: Boolean indicating if the location is a military administration
            //   * `_isPlayerControlled`: Boolean indicating if rebels control the location
            //   * `_isRallyPoint`: Boolean indicating if the location is a rally point
            condition = "true";
            // Context menu action statement; signature [String marker, Object player[, Array params]] -> Void
            statement = "";
            // Additional parameters for callbacks
            parameters[] = {};
            // Context menu action icon
            icon = "";
            // Context menu action priority; lower numbers are shown first
            priority = 20;
            // Close context menu prior to statement being executed
            closeContextMenu = 1;
            // Close map prior to statement being executed
            closeMap = 0;
            // (true): show even if condition statement evaluates to false, but as inactive
            // (false): don't show if condition statement evaluates to false
            showIfDisabled = 0;
        };

        class GVAR(FastTravel): ContextBase {
            title = "$STR_antistasi_dialogs_main_fast_travel";
            tooltipDisabled = "$STR_A3U_CONTEXT_FASTTRAVEL_PLAYER_ONLY";
            showIfDisabled = 1;
            condition = QUOTE(call FUNC(canFastTravel));
            statement = QUOTE(_this spawn FUNCMAIN(fastTravelRadio));
            closeMap = 1;
        };

        class GVAR(Garrison): ContextBase {
            title = "$STR_A3A_garrison_header";
            tooltipDisabled = "$STR_A3U_CONTEXT_GARRISON_REQUIREMENTS";
            condition = QUOTE(_isPlayerControlled && _isCommander && !_isRallyPoint && !_isBlackMarketTrader && !_isMilitaryAdministration);
            statement = QUOTE(call FUNC(doGarrison));
        };

        class GVAR(DeliverSupplies): ContextBase {
            title = "$STR_A3U_CONTEXT_DELIVER_SUPPLIES";
            tooltip = "$STR_A3U_CONTEXT_DELIVER_SUPPLIES_DESC";
            condition = QUOTE(_isCommander && !_isDestroyed && { isNil QQUOTE(A3A_supplyMissionActive) } && { _this select 0 in citiesX });
            statement = QUOTE([ARR_2(_this,'A3A_fnc_SUPP_Supplies')] remoteExec[ARR_2('A3A_fnc_scheduler',2)]);
        };

        class GVAR(RebuildAssets): ContextBase {
            title = "$STR_antistasi_dialogs_hq_garrisons_rebuild_assets_button";
            condition = QUOTE(call FUNC(canRebuildAssets));
            statement = QUOTE(call FUNC(doRebuildAssets));
        };

        class GVAR(Close): ContextBase {
            title = "$STR_antistasi_dialogs_hq_button_close_text";
            statement = QUOTE(call FUNC(closeContextMenu));
            closeContextMenu = 0; // no infinite loop, plz
            priority = 255;
        };
    };
};

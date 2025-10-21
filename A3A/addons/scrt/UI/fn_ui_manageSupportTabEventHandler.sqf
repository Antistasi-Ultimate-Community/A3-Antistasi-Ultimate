params ["_mode"];


if(_mode isEqualTo "ADD") then {
    [
        "supportMap",
        "onMapSingleClick",
        {
            if(!isNil "isSupportMarkerPlacingLocked" && {isSupportMarkerPlacingLocked}) exitWith {};

            playSound "readoutClick";

            if (isNil "supportMarkerOrigin") then {
                if (supportType == "PARADROP") then {
                    private _nearMarker = [forbiddenParadropZones, _pos] call BIS_fnc_nearestPosition;
                    if ((getMarkerPos _nearMarker) distance2D _pos < 500) then {
                        [
                            localize "STR_notifiers_fail_type",
                            localize "STR_notifiers_paradrop_header",  
                            parseText (localize "STR_notifiers_paradrop_too_close"), 
                            30
                        ] spawn SCRT_fnc_ui_showMessage;
                    } else {
                        supportMarkerOrigin = createMarkerLocal ["BRStart", _pos];
                        supportMarkerOrigin setMarkerShapeLocal "ICON";
                        supportMarkerOrigin setMarkerTypeLocal "hd_destroy";
                    };
                } else {                   
                    supportMarkerOrigin = createMarkerLocal ["BRStart", _pos];
                    supportMarkerOrigin setMarkerShapeLocal "ICON";
                    supportMarkerOrigin setMarkerTypeLocal "hd_destroy";
                };

                switch (supportType) do {
                    case ("SUPPLY"): {
                        supportMarkerOrigin setMarkerColorLocal "ColorBlue";
                        supportMarkerOrigin setMarkerTextLocal (localize "STR_support_supply_run_init");
                    };
                    case ("SUPPLY_GROUND"): {
                        supportMarkerOrigin setMarkerColorLocal "ColorBlue";
                        supportMarkerOrigin setMarkerTextLocal (localize "STR_support_supply_run_ground");
                    };
                    case ("SMOKE");
                    case ("FLARE"): {
                        supportMarkerOrigin setMarkerColorLocal "ColorGrey";
                        supportMarkerOrigin setMarkerTextLocal (localize "STR_support_barrage");
                    };
                    case ("VEH_AIRDROP"): {
                        supportMarkerOrigin setMarkerColorLocal "ColorBrown";
                        supportMarkerOrigin setMarkerTextLocal (localize "STR_support_light_veh_init");
                    };
                    case ("RECON"): {
                        supportMarkerOrigin setMarkerColorLocal "ColorOrange";
                        supportMarkerOrigin setMarkerTextLocal (localize "STR_support_recon_plane_init");
                    };
                    case ("PARADROP"): {
                        supportMarkerOrigin setMarkerColorLocal "ColorGrey";
                        supportMarkerOrigin setMarkerTextLocal (localize "STR_support_paradrop_init");
                    };
                    case ("LOOTHELI"): {
                        supportMarkerOrigin setMarkerColorLocal "colorCivilian";
                        supportMarkerOrigin setMarkerTextLocal (localize "STR_support_loot_helicopter_init");
                    };
                    default {
                        supportMarkerOrigin setMarkerColorLocal "ColorRed";
                        supportMarkerOrigin setMarkerTextLocal (localize "STR_support_bomb_run_init");
                    };
                };
            } else {
                if !(supportType in ["SMOKE", "FLARE", "SUPPLY_GROUND"]) then {
                    if (supportType == "PARADROP") then {
                        private _nearMarker = [forbiddenParadropZones, _pos] call BIS_fnc_nearestPosition;
                        if ((getMarkerPos _nearMarker) distance2D _pos < 500) then {
                            [
                                localize "STR_notifiers_fail_type",
                                localize "STR_notifiers_paradrop_header",  
                                parseText (localize "STR_notifiers_paradrop_too_close"), 
                                30
                            ] spawn SCRT_fnc_ui_showMessage;
                        } else {
                            supportMarkerDestination = createMarkerLocal ["BRFin", _pos];
                            supportMarkerDestination setMarkerShapeLocal "ICON";
                            supportMarkerDestination setMarkerTypeLocal "hd_destroy";
                        };
                    } else {                   
                        supportMarkerDestination = createMarkerLocal ["BRFin", _pos];
                        supportMarkerDestination setMarkerShapeLocal "ICON";
                        supportMarkerDestination setMarkerTypeLocal "hd_destroy";
                    };

                    switch (supportType) do {
                        case ("SUPPLY"): {
                            supportMarkerDestination setMarkerColorLocal "ColorBlue";
                            supportMarkerDestination setMarkerTextLocal (localize "STR_support_supply_run_exit");
                        };
                        case ("VEH_AIRDROP"): {
                            supportMarkerDestination setMarkerColorLocal "ColorBrown";
                            supportMarkerDestination setMarkerTextLocal (localize "STR_support_light_veh_exit");
                        };
                        case ("RECON"): {
                            supportMarkerDestination setMarkerColorLocal "ColorOrange";
                            supportMarkerDestination setMarkerTextLocal (localize "STR_support_recon_plane_search_area");
                        };
                        case ("PARADROP"): {
                            supportMarkerDestination setMarkerColorLocal "ColorGrey";
                            supportMarkerDestination setMarkerTextLocal (localize "STR_support_paradrop_exit");
                        };
                        case ("LOOTHELI"): {
                            supportMarkerDestination setMarkerColorLocal "colorCivilian";
                            supportMarkerDestination setMarkerTextLocal (localize "STR_support_loot_helicopter_search_area");
                            private _areaMarker = createMarkerLocal ["LootHeliAreaMarker", _pos];
                            _areaMarker setMarkerShapeLocal "ELLIPSE";
                            _areaMarker setMarkerSizeLocal [250,250];
                            _areaMarker setMarkerTypeLocal "hd_warning";
                            _areaMarker setMarkerColorLocal "colorCivilian";
                            _areaMarker setMarkerBrushLocal "Grid";
                        };
                        default {
                            supportMarkerDestination setMarkerColorLocal "ColorRed";
                            supportMarkerDestination setMarkerTextLocal (localize "STR_support_bomb_run_exit");
                        };
                    };
                } else {
                    deleteMarkerLocal supportMarkerDestination;
                };
            };
        },
        []
	] call BIS_fnc_addStackedEventHandler;
} else {
    ["supportMap", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
};
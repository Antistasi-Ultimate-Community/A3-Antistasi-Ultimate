if(!isNil "supportCooldown" && {supportCooldown}) exitWith {
    [
		localize "STR_notifiers_fail_type",
		localize "STR_notifiers_support_header",  
		parseText (localize "STR_notifiers_support_overwhelmed"), 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

if (supportType in ["NAPALM", "HE", "CLUSTER", "CHEMICAL"] && bombRuns < 1) exitWith {
    [
		localize "STR_notifiers_fail_type",
		localize "STR_notifiers_support_header",  
		parseText (localize "STR_notifiers_support_not_enough_airstrikes"), 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

if (supportType in ["SUPPLY_GROUND", "LOOTHELI","SUPPLY", "SMOKE", "FLARE", "VEH_AIRDROP", "RECON", "PARADROP"] && supportPoints < 1) exitWith {
    [
		localize "STR_notifiers_fail_type",
		localize "STR_notifiers_support_header",  
		parseText (localize "STR_notifiers_support_not_enough_support"), 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

private _hasAirports = airportsX findIf { sidesX getVariable [_x, sideUnknown] isEqualTo teamPlayer } isNotEqualTo -1;
if (supportType in ["LOOTHELI","NAPALM", "HE", "CLUSTER", "CHEMICAL", "VEH_AIRDROP", "SUPPLY", "RECON", "PARADROP"] && !_hasAirports) exitWith {
    [
		localize "STR_notifiers_fail_type",
		localize "STR_notifiers_support_header",  
		parseText (localize "STR_notifiers_support_airport_needed"), 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

private _resourcesFIA = server getVariable "resourcesFIA";
if (supportType isEqualTo "PARADROP" && {_resourcesFIA < 500}) exitWith {
    [
		localize "STR_notifiers_fail_type",
		localize "STR_notifiers_support_header",  
		parseText format [localize "STR_notifiers_support_need_money", A3A_faction_reb get "name", 500, A3A_faction_civ get "currencySymbol"], 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

if (supportType isEqualTo "LOOTHELI" && {_resourcesFIA < 2000}) exitWith {
    [
		localize "STR_notifiers_fail_type",
		localize "STR_notifiers_support_header",  
		parseText format ["STR_notifiers_support_need_money", A3A_faction_reb get "name", 2000, A3A_faction_civ get "currencySymbol"], 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

if (supportType isEqualTo "VEH_AIRDROP" && {_resourcesFIA < 200}) exitWith {
    [
		localize "STR_notifiers_fail_type",
		localize "STR_notifiers_support_header",  
		parseText format ["STR_notifiers_support_need_money", A3A_faction_reb get "name", 200, A3A_faction_civ get "currencySymbol"], 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

if (!([player] call A3A_fnc_hasRadio)) exitWith {
    [
		localize "STR_notifiers_fail_type",
		localize "STR_notifiers_support_header",  
		parseText (localize "STR_notifiers_support_need_radio"), 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

if (isNil "supportMarkerOrigin") exitWith {
    [
		localize "STR_notifiers_fail_type",
		localize "STR_notifiers_support_header",  
		parseText (localize "STR_notifiers_support_specify_origin"), 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

if (!(supportType in ["SMOKE", "FLARE", "SUPPLY_GROUND"]) && {isNil "supportMarkerDestination"}) exitWith {
    [
		localize "STR_notifiers_fail_type",
		localize "STR_notifiers_support_header",  
		parseText (localize "STR_notifiers_support_specify_dest"), 
		30
	] spawn SCRT_fnc_ui_showMessage;
};

private _exit = false;
private _exitMessage = "";

if (supportType isEqualTo "PARADROP") then {
    if ((getMarkerPos "Synd_HQ") distance2D theBoss > 50) exitWith {
        _exit = true;
        _exitMessage = localize "STR_notifiers_paradrop_commander_on_hq";
    };

    if ([(getMarkerPos "Synd_HQ")] call A3A_fnc_enemyNearCheck) exitWith {
        _exit = true;
        _exitMessage = localize "STR_notifiers_paradrop_enemies_on_hq";
    };

    private _attendants = [missionNamespace, "paradropAttendants", []] call BIS_fnc_getServerVariable;
    if (_attendants isEqualTo []) exitWith {
        _exit = true;
        _exitMessage = localize "STR_notifiers_paradrop_no_players_ready";
    };

    _attendants = _attendants apply {_x call BIS_fnc_getUnitByUID};

    private _readyPlayers = _attendants select {
        _x distance2D (getMarkerPos "Synd_HQ") < 50 
        && vehicle _x isEqualTo _x && {[_x] call A3A_fnc_canFight} 
        && !(!(isNil "HR_GRG_placing") && {HR_GRG_placing})
    };
    if (isNil "_readyPlayers" || {count _readyPlayers == 0}) exitWith {
        _exit = true;
        _exitMessage = localize "STR_notifiers_paradrop_no_players_ready_2";
    };
};

if (_exit) exitWith {
    [
        localize "STR_notifiers_fail_type",
        localize "STR_notifiers_paradrop_header",  
        parseText _exitMessage, 
        30
    ] spawn SCRT_fnc_ui_showMessage;
};

switch (supportType) do {
    case ("SUPPLY_GROUND"): {
        supportPoints = supportPoints - 1;
        publicVariable "supportPoints";
        private _vehCost = [(A3A_faction_reb get "vehiclesTruck") # 0] call A3A_fnc_vehiclePrice;
        [-3,-_vehCost] remoteExec ["A3A_fnc_resourcesFIA",2];
    };
    case ("SUPPLY");
    case ("SMOKE");
    case ("FLARE");
    case ("RECON"): {
        supportPoints = supportPoints - 1;
        publicVariable "supportPoints";
    };
    case ("VEH_AIRDROP"): {
        supportPoints = supportPoints - 1;
        publicVariable "supportPoints";
        [0,-200] remoteExec ["A3A_fnc_resourcesFIA",2];
    };
    case ("PARADROP"): {
        supportPoints = supportPoints - 1;
        publicVariable "supportPoints";
        [0,-500] remoteExec ["A3A_fnc_resourcesFIA",2];
    };
    case ("LOOTHELI"): {
        supportPoints = supportPoints - 1;
        publicVariable "supportPoints";
        [0,-2000] remoteExec ["A3A_fnc_resourcesFIA",2];
    };
    case ("NAPALM");
    case ("HE");
    case ("CLUSTER");
    case ("CHEMICAL"): {
        bombRuns = bombRuns - 1;
        publicVariable "bombRuns";
    };
};

[] spawn A3A_fnc_statistics;
[] call SCRT_fnc_ui_updateSupportMenu;

switch (true) do {
    case (supportType isEqualTo "SUPPLY_GROUND"): {
        [] spawn SCRT_fnc_support_groundResupply;
    };
    case (supportType isEqualTo "SMOKE"): {
        [] spawn SCRT_fnc_support_smokeBarrage;
    };
    case (supportType isEqualTo "FLARE"): {
        [] spawn SCRT_fnc_support_flareBarrage;
    };
    case (supportType isEqualTo "RECON"): {
        [] spawn SCRT_fnc_support_planeReconRun;
    };
    case (supportType isEqualTo "PARADROP"): {
        [] remoteExec  ["SCRT_fnc_paradrop_prepare", 2];
        [] spawn SCRT_fnc_support_planeParadropRun;
    };
    case (supportType isEqualTo "LOOTHELI"): {
        [] spawn SCRT_fnc_support_lootHeli;
    };
    case (supportType isEqualTo "VEH_AIRDROP");
    case (supportType isEqualTo "SUPPLY");
    case (supportType in ["HE", "CLUSTER", "CHEMICAL", "NAPALM"]): {
        [] spawn SCRT_fnc_support_planePayloadedRun;
    };
};

supportCooldown = true;
publicVariable "supportCooldown";
isSupportMarkerPlacingLocked = true;
publicVariable "isSupportMarkerPlacingLocked";

[
    localize "STR_notifiers_success_type",
    localize "STR_notifiers_support_header",  
    parseText (localize "STR_notifiers_support_success"), 
    30
] spawn SCRT_fnc_ui_showMessage;

private _timeOut = time + 180;
waitUntil { sleep 1; !isSupportMarkerPlacingLocked || {time > _timeOut} };

supportCooldown = false;
publicVariable "supportCooldown";

[] spawn SCRT_fnc_ui_clearSupport;
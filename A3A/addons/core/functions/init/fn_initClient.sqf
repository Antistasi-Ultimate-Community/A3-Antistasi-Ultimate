#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

//Make sure logLevel is always initialised.
//This should be overridden by the server, as appropriate. Hence the nil check.
if (isNil "logLevel") then { logLevel = 2; A3A_logDebugConsole = 1 };

Info("initClient started");
A3A_clientVersion = QUOTE(VERSION);
Info_1("Client version: %1", QUOTE(VERSION_FULL));

// *************************** Client pre-setup init *******************************

if (call A3A_fnc_modBlacklist) exitWith {};

player forceAddUniform "U_C_WorkerCoveralls";

musicON = false;
recruitCooldown = 0;			//Prevents units being recruited too soon after being dismissed.
incomeRep = false;
isPowPaycheckAnnounced = false; //Are players know about that IDAP pays for released prisoners
isSupportAnnounced = false;     //Are support abilities announced
isMenuOpen = false;             //is Commander/Player menu open
isPlayerParadropable = true;    //parachute commander ability attendance
hasHeadlessClients = false;     //check if has headless clients

//enables Discord Rich Presence if game client uses English language and mod is turned on
private _richPresenceFunc = missionNamespace getVariable "DiscordRichPresence_fnc_update";
private _isEnglish = ((localize "STR_antistasi_dialogs_generic_button_yes_text") isEqualTo "Yes");
isDiscordRichPresenceActive = if (isNil "_richPresenceFunc") then {false} else {true};
Info_1("Discord Rich Presence: %1", str isDiscordRichPresenceActive);

//Disables rabbits and snakes, because they cause the log to be filled with "20:06:39 Ref to nonnetwork object Agent 0xf3b4a0c0"
//Can re-enable them if we find the source of the bug.
enableEnvironment [false, true];

// TODO: May need to strip players?
// TODO: May need to disable damage, but tricky if we're not sure when the player exists?

if !(isServer) then {
    call A3A_fnc_initVarCommon;

    [] execVM QPATHTOFOLDER(Scripts\fn_advancedTowingInit.sqf);

    Info("Running client JNA preload");
    ["Preload"] call jn_fnc_arsenal;

    // Headless client navgrid init
    if (!hasInterface) then {
        Info("HC Initialising PATCOM Variables");
        [] call A3A_fnc_patrolInit;

        call A3A_fnc_loadNavGrid;
        waitUntil { sleep 0.1; !isNil "serverInitDone" };			// addNodesNearMarkers needs marker lists
        call A3A_fnc_addNodesNearMarkers;
    };

    if ((isClass (configfile >> "CBA_Extended_EventHandlers")) && (
        isClass (configfile >> "CfgPatches" >> "lambs_danger"))) then {
        // disable lambs danger fsm entrypoint
        ["CAManBase", "InitPost", {
            params ["_unit"];
            (group _unit) setVariable ["lambs_danger_disableGroupAI", true];
            _unit setVariable ["lambs_danger_disableAI", true];
        }] call CBA_fnc_addClassEventHandler;
    };
};

// Server/client version check
waitUntil { sleep 0.1; !isNil "initZonesDone" };
if (isNil "A3A_serverVersion") then { A3A_serverVersion = "pre-2.2" };
if (A3A_clientVersion != A3A_serverVersion) exitWith {
    private _errorStr = format [localize "STR_A3A_feedback_serverinfo_mismatch", A3A_serverVersion, A3A_clientVersion];
    [localize "STR_A3A_feedback_serverinfo", _errorStr] call A3A_fnc_customHint;
};

// Show server startup state hints
if (isNil "A3A_startupState") then { A3A_startupState = "waitserver" };
while {true} do {
    if (dialog) then { sleep 0.1; continue };           // don't spam hints while the setup dialog is open
    private _stateStr = localize ("STR_A3A_feedback_serverinfo_" + A3A_startupState);
    isNil { [localize "STR_A3A_feedback_serverinfo", _stateStr, true] call A3A_fnc_customHint };         // not re-entrant, apparently
    if (A3A_startupState == "completed") exitWith {};
    sleep 0.1;
};

//****************************************************************

Info("Server started, continuing with client init");

call A3A_fnc_installSchrodingersBuildingFix;

if (!isServer) then {
    // get server to send us the current destroyedBuildings list, hide them locally
    "destroyedBuildings" addPublicVariableEventHandler {
        { hideObject _x } forEach (_this select 1);
    };
    [clientOwner, "destroyedBuildings"] remoteExecCall ["publicVariableClient", 2];

    boxX call jn_fnc_arsenal_init;
    if (A3A_hasACEMedical) then { call A3A_fnc_initACEUnconsciousHandler };
};

// Headless clients register with server and bail out at this point
if (!isServer and !hasInterface) exitWith {
    player setPosATL (markerPos respawnTeamPlayer vectorAdd [-100, -100, 0]);
    [clientOwner] remoteExecCall ["A3A_fnc_addHC",2];
};

waitUntil {local player};

[] spawn A3A_fnc_briefing;

if (enableSpectrumDevice) then {
	[] execVM QPATHTOFOLDER(Scripts\SpectumDevice\spectrum_device.sqf);
	[] execVM QPATHTOFOLDER(Scripts\SpectumDevice\sa_ewar.sqf);
};

// Placeholders, should get replaced globally by the server
player setVariable ["score",0];
player setVariable ["moneyX",0];
player setVariable ["rankX",rank player];

player setVariable ["owner",player,true];
player setVariable ["punish",0,true];

player setVariable ["eligible",player call A3A_fnc_isMember,true];
player setVariable ["A3A_playerUID",getPlayerUID player,true];			// Mark so that commander routines know for remote-controlling

//Move the player to HQ now they're initialised.
private _respawnPos = (getMarkerPos respawnTeamPlayer);
private _safePos = [
    _respawnPos, //center
    0, //minimal distance
    15, //maximumDistance
    1, //object distance
    0, //water mode
    0, //maximum terrain gradient
    0, //shore mode
    [], //blacklist positions
    [_respawnPos, _respawnPos] //default position
] call BIS_fnc_findSafePos;
player setPos _safePos;
player setDir ([player, boxX] call BIS_fnc_dirTo);
player setVariable ["spawner",true,true];

if (A3A_hasTFAR || A3A_hasTFARBeta || A3A_hasACRE) then {
    [] spawn A3A_fnc_radioJam;
};

[] call SCRT_fnc_common_set3dIcons;

private _colourTeamPlayer = teamPlayer call BIS_fnc_sideColor;
private _colorInvaders = Invaders call BIS_fnc_sideColor;

{
	_x set [3, 0.33]
} forEach [_colourTeamPlayer, _colorInvaders];

private _introShot = [
	(position petros), // Target position
	format ["%1, %2 %3", worldName, (localize (rank player)), name player], // SITREP text
	50, //  altitude
	50, //  radius
	90, //  degrees viewing angle
	0, // clockwise movement
	[
		["\a3\ui_f\data\map\markers\Nato\o_inf.paa", _colourTeamPlayer, markerPos "insertMrk", 1, 1, 0, "Insertion Point", 0],
		["\a3\ui_f\data\map\markers\Nato\o_inf.paa", _colorInvaders, markerPos "towerBaseMrk", 1, 1, 0, "Radio Towers", 0]
	]
] spawn BIS_fnc_establishingShot;

if (playerMarkersEnabled) then {
    [] spawn A3A_fnc_playerMarkers;
};

[player] spawn A3A_fnc_initRevive;		// with ACE medical, only used for helmet popping & TK checks
[] spawn A3A_fnc_outOfBounds;
[] spawn A3A_fnc_darkMapFix;
[] spawn A3A_fnc_clientIdleChecker;

if (!A3A_hasACE) then {
    [] spawn A3A_fnc_tags;
};


stragglers = creategroup teamPlayer;
(group player) enableAttack false;

if (isNil "ace_noradio_enabled" or {!ace_noradio_enabled}) then {
    [player, nil, selectRandom (A3A_faction_reb get "voices")] call A3A_fnc_setIdentity
};
//Give the player the base loadout.
[player] call A3A_fnc_dress;

player setvariable ["compromised",0];
player addEventHandler ["FiredMan", {
    _player = _this select 0;
    if (captive _player) then {
        //if ({((side _x== Invaders) or (side _x== Occupants)) and (_x knowsAbout player > 1.4)} count allUnits > 0) then
        if ({if (((side _x == Occupants) or (side _x == Invaders)) and (_x distance player < 300)) exitWith {1}} count allUnits > 0) then {
            [_player,false] remoteExec ["setCaptive",0,_player];
            _player setCaptive false;
        }
        else {
            _city = [citiesX,_player] call BIS_fnc_nearestPosition;
            _size = [_city] call A3A_fnc_sizeMarker;
            _dataX = server getVariable _city;
            if (random 100 < _dataX select 2) then {
                if (_player distance getMarkerPos _city < _size * 1.5) then {
                    [_player,false] remoteExec ["setCaptive",0,_player];
                    _player setCaptive false;
                    if (vehicle _player != _player) then {
                        {if (isPlayer _x) then {[_x,false] remoteExec ["setCaptive",0,_x]; _x setCaptive false}} forEach ((assignedCargo (vehicle _player)) + (crew (vehicle _player)) - [player]);
                    };
                };
            };
        };
    };
}];

player addEventHandler ["InventoryOpened", {
    private ["_playerX","_containerX","_typeX"];
    _control = false;
    _playerX = _this select 0;
    if (captive _playerX) then {
        _containerX = _this select 1;
        _typeX = typeOf _containerX;
        if (((_containerX isKindOf "Man") and (!alive _containerX)) or (_typeX in [A3A_faction_occ get "ammobox", A3A_faction_inv get "ammobox", A3A_faction_riv get "ammobox"])) then {
            if ({if (((side _x== Invaders) or (side _x== Occupants)) and (_x knowsAbout _playerX > 1.4)) exitWith {1}} count allUnits > 0) then{
                [_playerX,false] remoteExec ["setCaptive",0,_playerX];
                _playerX setCaptive false;
            }
            else {
                _city = [citiesX,_playerX] call BIS_fnc_nearestPosition;
                _size = [_city] call A3A_fnc_sizeMarker;
                _dataX = server getVariable _city;
                if (random 100 < _dataX select 2) then {
                    if (_playerX distance getMarkerPos _city < _size * 1.5) then {
                        [_playerX,false] remoteExec ["setCaptive",0,_playerX];
                        _playerX setCaptive false;
                    };
                };
            };
        };
    };
    _control
}];

player addEventHandler ["HandleHeal", {
    _player = _this select 0;
    if (captive _player) then {
        if ({((side _x== Invaders) or (side _x== Occupants)) and (_x knowsAbout player > 1.4)} count allUnits > 0) then {
            [_player,false] remoteExec ["setCaptive",0,_player];
            _player setCaptive false;
        }
        else {
            _city = [citiesX,_player] call BIS_fnc_nearestPosition;
            _size = [_city] call A3A_fnc_sizeMarker;
            _dataX = server getVariable _city;
            if (random 100 < _dataX select 2) then {
                if (_player distance getMarkerPos _city < _size * 1.5) then {
                    [_player,false] remoteExec ["setCaptive",0,_player];
                    _player setCaptive false;
                };
            };
        };
    };
}];

// notes:
// Static weapon objects are persistent through assembly/disassembly
// The bags are not persistent, object IDs change each time
// Static weapon position seems to follow bag1, but it's not an attached object
// Can use objectParent to identify backpack of static weapon

player addEventHandler ["WeaponAssembled", {
    private _veh = _this select 1;
    [_veh, teamPlayer] call A3A_fnc_AIVEHinit;		// will flip/capture if already initialized
    if (_veh isKindOf "StaticWeapon") then {
        if (not(_veh in staticsToSave)) then {
            staticsToSave pushBack _veh;
            publicVariable "staticsToSave";
        };
        _markersX = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
        _pos = position _veh;
        [_veh] call A3A_Logistics_fnc_addLoadAction;
        if (_markersX findIf {_pos inArea _x} != -1) then {[localize "STR_antistasi_actions_move_assets_static_deployed_header", localize "STR_antistasi_actions_move_assets_static_deployed_hint"] call A3A_fnc_customHint;};
    };
}];

player addEventHandler ["WeaponDisassembled", {
	[_this select 1] remoteExec ["A3A_fnc_postmortem", 2];
	[_this select 2] remoteExec ["A3A_fnc_postmortem", 2];
}];

if (areRivalsDiscovered) then {
	player addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		if (_killer getVariable ["isRival", false]) then {
			[-5, 60] remoteExec ["SCRT_fnc_rivals_reduceActivity",2];
		};
	}];
};

player addEventHandler ["GetInMan", {
    private _unit = _this select 0;
    private _veh = _this select 2;
    private _exit = false;
    if !([player] call A3A_fnc_isMember) then {
        if (!isNil {_veh getVariable "A3A_locked"}) then {
            _owner = _veh getVariable "ownerX";
            if ({getPlayerUID _x == _owner} count (units group player) == 0) then {
                [localize "STR_A3A_initClient_GetInMan_header", localize "STR_A3A_initClient_GetInMan_desc"] call A3A_fnc_customHint;
                moveOut _unit;
                _exit = true;
            };
        };
    };
    if (!_exit) then {
        private _vehType = typeOf _veh;
        if (_vehType in undercoverVehicles) then {
            if !(_veh getVariable ["A3A_reported", false]) then {
                [] spawn A3A_fnc_goUndercover;
            };
        };
    };
}];

private _blackMarketStock = call A3U_fnc_grabBlackMarketVehicles;

if ((_blackMarketStock select {(_x select 2) isEqualTo "ARTILLERY"}) isNotEqualTo []) then {
	player addEventHandler ["GetInMan", {
		params ["_unit", "_role", "_vehicle"];
		private _vehType = typeOf _vehicle;
		private _artyTypes = _blackMarketStock select {(_x select 2) isEqualTo "ARTILLERY"};

		if ((typeOf _vehicle) in _artyTypes) then {
			enableEngineArtillery false;
		};
	}];

	player addEventHandler ["GetOutMan", {
		params ["_unit", "_role", "_vehicle"];
        private _artyTypes = _blackMarketStock select {(_x select 2) isEqualTo "ARTILLERY"};

		if ((typeOf _vehicle) in _artyTypes) then {
			enableEngineArtillery true;
		};
	}];
};

if(isDiscordRichPresenceActive) then {
	player addEventHandler ["GetInMan", {
		params ["_unit", "_role", "_vehicle", "_turret"];

		private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

		switch (true) do {
			case (_vehicle isKindOf "StaticWeapon"): {
				[["UpdateState", format ["Operates %1", _vehicleName]]] call SCRT_fnc_misc_updateRichPresence;
			};
			case (_vehicle isKindOf "Air"): {
				private _isDriver = if ((driver (vehicle player)) isEqualTo player) then {true} else {false};
				private _isGunner = if ((gunner (vehicle player)) isEqualTo player) then {true} else {false};

				switch (true) do {
					case (_isDriver): {
						[["UpdateState", format ["Pilots %1", _vehicleName]]] call SCRT_fnc_misc_updateRichPresence;
					};
					case (_isGunner): {
						[["UpdateState", format ["Operates %1's turret", _vehicleName]]] call SCRT_fnc_misc_updateRichPresence;
					};
					default {
						[["UpdateState", format ["Rides %1", _vehicleName]]] call SCRT_fnc_misc_updateRichPresence;
					};
				};
			};
			default {
				private _isDriver = if ((driver (vehicle player)) isEqualTo player) then {true} else {false};
				private _isGunner = if ((gunner (vehicle player)) isEqualTo player) then {true} else {false};

				switch (true) do {
					case (_isDriver): {
						[["UpdateState", format ["Drives %1", _vehicleName]]] call SCRT_fnc_misc_updateRichPresence;
					};
					case (_isGunner): {
						[["UpdateState", format ["Operates %1's turret", _vehicleName]]] call SCRT_fnc_misc_updateRichPresence;
					};
					default {
						[["UpdateState", format ["Sits in %1 as passenger", _vehicleName]]] call SCRT_fnc_misc_updateRichPresence;
					};
				};
			};
		};
	}];

	player addEventHandler ["GetOutMan", {
		[] call SCRT_fnc_misc_updateRichPresence;
	}];

	player addEventHandler ["HandleHeal", {
		params ["_injured", "_healer"];
		if (!isPlayer _injured || {_injured == _healer}) exitWith {};

		_this spawn {
			params ["_injured", "_healer"];
			private _injuredName = name _injured;
			private _damage = damage _injured;
			[["UpdateState", format ["Heals %1", _injuredName]]] call SCRT_fnc_misc_updateRichPresence;
			waitUntil {sleep 0.1; damage _injured != _damage};
			[] call SCRT_fnc_misc_updateRichPresence;
		};
	}];
};

if (A3A_hasACE) then {
    ["ace_explosives_place", {
        params ["_explosive","_dir","_pitch","_unit"];
        if (_unit == player) then { player setCaptive false };
    }] call CBA_fnc_addEventHandler;
};

// Prevent players getting shot by their own AIs. EH is respawn-persistent
player addEventHandler ["HandleRating", {0}];

call A3A_fnc_initUndercover;

["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;//Exec on client
if (membershipEnabled) then {
    if (player call A3A_fnc_isMember) exitWith {};

    private _isMember = false;
    if (isServer) then {
        _isMember = true;
    };
    if (serverCommandAvailable "#logout") then {
        _isMember = true;
        [localize "STR_A3A_initClient_general_info", localize "STR_A3A_initClient_server_admin"] call A3A_fnc_customHint;
    };

    if (_isMember) then {
        membersX pushBack (getPlayerUID player);				// potential race condition, but there's only one admin so chance of hitting this is low
        publicVariable "membersX";
    } else {
        [localize "STR_A3A_initClient_general_info", localize "STR_A3A_initClient_server_guest"] call A3A_fnc_customHint;
    };
};

// Make player group leader, because if they disconnected with AI squadmates, they may not be
// In this case, the group will also no longer be local, so we need the remoteExec
if !(isPlayer leader group player) then {
    [group player, player] remoteExec ["selectLeader", groupOwner group player];
};


waitUntil { scriptDone _introshot };

cutText ["","BLACK IN", 3];

[] remoteExecCall ["A3A_fnc_assignBossIfNone", 2];


if (isServer || player isEqualTo theBoss || (call BIS_fnc_admin) > 0) then {  // Local Host || Commander || Dedicated Admin
    private _modsAndLoadText = [
        [A3A_hasTFAR || A3A_hasTFARBeta,"TFAR",localize "STR_A3A_initClient_mods_TFAR"],
        [A3A_hasACRE,"ACRE",localize "STR_A3A_initClient_mods_ACRE"],
        [A3A_hasACE,"ACE 3",localize "STR_A3A_initClient_mods_ACE"],
        [A3A_hasACEMedical,"ACE 3 Medical",localize "STR_A3A_initClient_mods_ACEMedical"]
    ] select {_x#0};

    private _loadedTemplateInfoXML = A3A_loadedTemplateInfoXML apply {[true,_x#0,_x#1]};	// Remove and simplify when the list above is empty and can be deleted.
    _modsAndLoadText append _loadedTemplateInfoXML;

    if (count _modsAndLoadText isEqualTo 0) exitWith {};
    private _textXML = "<t align='left'>" + ((_modsAndLoadText apply { "<t color='#f0d498'>" + _x#1 + ":</t>" + _x#2 }) joinString "<br/>") + "</t>";
    [localize "STR_A3A_initClient_mods_header",_textXML] call A3A_fnc_customHint;
};

// uh, what's this for exactly? What are we doing that needs the main display?
waituntil {!isnull (finddisplay 46)};
GVAR(keys_battleMenu) = false; //initilize key flags to false


if (A3A_hasACE) then
{
    if (isNil "ace_interact_menu_fnc_compileMenu" || isNil "ace_interact_menu_fnc_compileMenuSelfAction") exitWith {
        Error("ACE non-public functions have changed, rebel group join/leave actions will not be removed.");
    };
    // Remove group join action from all rebel unit types
    // Need to compile the menus first, because ACE delays creating menus until a unit of that class is created
    private _unitTypes = ["I_G_soldier_F", "I_G_Soldier_TL_F", "I_G_Soldier_AR_F", "I_G_medic_F", "I_G_engineer_F", "I_G_Soldier_GL_F", "I_G_officer_F"];
    {
        [_x] call ace_interact_menu_fnc_compileMenu;
        [_x] call ace_interact_menu_fnc_compileMenuSelfAction;
        [_x, 0, ["ACE_ApplyHandcuffs"]] call ace_interact_menu_fnc_removeActionFromClass;
        [_x, 1, ["ACE_SelfActions", "ACE_TeamManagement", "ACE_LeaveGroup"]] call ace_interact_menu_fnc_removeActionFromClass;
        [_x, 0, ["ACE_MainActions", "ACE_JoinGroup"]] call ace_interact_menu_fnc_removeActionFromClass;
    } forEach _unitTypes;			// TODO: add raw unit types from new templates
};

boxX allowDamage false;			// hmm...
boxX addAction [format ["<img image='\a3\ui_f\data\igui\cfg\simpletasks\types\container_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_antistasi_actions_transfer_to_arsenal"], {[] spawn A3A_fnc_empty;}, 3];
boxX addAction [localize "STR_antistasi_actions_move_this_asset", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)", 4];
if (A3A_hasACE) then { [boxX, boxX] call ace_common_fnc_claim;};	//Disables ALL Ace Interactions
flagX allowDamage false;
if(playerRecruitAI isEqualTo 1) then 
{
    flagX addAction [format ["<img image='\A3\ui_f\data\igui\cfg\simpleTasks\types\meet_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_antistasi_actions_recruit_units"], {if ([getPosATL player] call A3A_fnc_enemyNearCheck) then {["Recruit Unit", "You cannot recruit units while there are enemies near you."] call A3A_fnc_customHint;} else { [] spawn A3A_fnc_unit_recruit; }},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)"];
};
flagX addAction [format ["<img image='\A3\ui_f\data\igui\cfg\simpleTasks\types\run_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_antistasi_actions_rally_point_travel"], {[] spawn SCRT_fnc_rally_travelToRallyPoint},nil,0,false,true,"","(isPlayer _this) && (_this == _this getVariable ['owner',objNull]) && (side (group _this) == teamPlayer) && (!isNil 'isRallyPointPlaced' && {isRallyPointPlaced})",4];
flagX addAction [localize "STR_antistasi_actions_move_this_asset", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)", 4];

//Adds a light to the flag
private _flagLight = "#lightpoint" createVehicle (getPos flagX);
_flagLight setLightDayLight true;
_flagLight setLightColor [1, 1, 0.9];
_flagLight setLightBrightness 0.2;
_flagLight setLightAmbient [1, 1, 0.9];
_flagLight lightAttachObject [flagX, [0, 0, 4]];
_flagLight setLightAttenuation [7, 0, 0.5, 0.5];

vehicleBox allowDamage false;
vehicleBox addAction [format ["<img image='\A3\ui_f\data\igui\cfg\simpleTasks\types\use_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_A3A_actions_restore_units"], A3A_fnc_vehicleBoxRestore,nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer) and !A3A_removeRestore", 4];
[vehicleBox] call HR_GRG_fnc_initGarage;
if (A3A_hasACE) then { [vehicleBox, VehicleBox] call ace_common_fnc_claim;};	//Disables ALL Ace Interactions
vehicleBox addAction [format ["<img image='a3\ui_f\data\igui\cfg\simpletasks\types\truck_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_antistasi_actions_buy_vehicle"], {
    if ([getPosATL player] call A3A_fnc_enemyNearCheck) then {
        [localize "STR_A3A_initClient_purchase_vehicle", localize "STR_antistasi_actions_buy_vehicle_distance_check_failure"] call A3A_fnc_customHint;
    } else {
        createDialog "A3A_BuyVehicleDialog";
    }
},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];
vehicleBox addAction [localize "STR_antistasi_actions_move_this_asset", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)", 4];

call A3A_fnc_dropObject;
mapX allowDamage false;
mapX addAction [format ["<img image='\A3\ui_f\data\igui\cfg\simpleTasks\types\map_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_antistasi_actions_map_info"], A3A_fnc_cityinfo,nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) && (side (group _this) == teamPlayer)", 4];

mapX addAction [
	(localize "STR_antistasi_actions_game_options"),
	{
		closeDialog 0;
		closeDialog 0;
		createDialog "commanderMenu";
		isMenuOpen = true;
		[] spawn SCRT_fnc_misc_orbitingCamera;
		[] call SCRT_fnc_ui_populateGameOptionsMenu;
	},
	nil,
	0,
	false,
	true,
	"",
	"(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer) and player == theBoss",
	4
];
mapX addAction [
	(localize "STR_antistasi_actions_game_options"),
	{
		closeDialog 0;
		closeDialog 0;
		createDialog "rebelMenu";
		isMenuOpen = true;
		[] spawn SCRT_fnc_misc_orbitingCamera;
		[] call SCRT_fnc_ui_populateRebelMenu;
	},
	nil,
	0,
	false,
	true,
	"",
	"(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer) and player != theBoss",
	4
];
mapX addAction [localize "STR_antistasi_actions_ai_load_info", { [] remoteExec ["A3A_fnc_AILoadInfo",2];},nil,0,false,true,"","((_this == theBoss) || (serverCommandAvailable ""#logout""))"];
mapX addAction [localize "STR_antistasi_actions_move_this_asset", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)", 4];

[] spawn A3A_fnc_unitTraits;

// Get list of buildable objects, has map (and template?) dependency
call A3A_fnc_initBuildableObjects;

// Start cursorObject monitor loop for adding removeStructure actions
// Note: unitTraits must run first to add engineer trait to default commander
0 spawn A3A_fnc_initBuilderMonitors;

disableSerialization;
//1 cutRsc ["H8erHUD","PLAIN",0,false];
_layer = ["statisticsX"] call bis_fnc_rscLayer;
#ifdef UseDoomGUI
    ERROR("Disabled due to UseDoomGUI Switch.")
#else
    _layer cutRsc ["H8erHUD","PLAIN",0,false];
#endif
[] spawn A3A_fnc_statistics;

//Load the player's personal save.
[] spawn A3A_fnc_createDialog_shouldLoadPersonalSave;

[allCurators] remoteExecCall ["A3A_fnc_initZeusLogging",0];

if (magRepack) then {
	Info("Initializing Mag Repack...");
	[] execVM QPATHTOFOLDER(Scripts\MagRepack\MagRepack_init_sv.sqf);
};

[] call SCRT_fnc_misc_updateRichPresence;

// adding player as paradrop attendant by default
[] spawn {
	private _paradropAttendants = [missionNamespace, "paradropAttendants", nil] call BIS_fnc_getServerVariable;

	while {isNil "_paradropAttendants"} do {
		sleep 3;
		_paradropAttendants = [missionNamespace, "paradropAttendants", nil] call BIS_fnc_getServerVariable;
	};

	private _uid = getPlayerUID player;
	_paradropAttendants pushBackUnique _uid;
	[missionNamespace, "paradropAttendants", _paradropAttendants] call BIS_fnc_setServerVariable;
};

if (saveZeusBuildings) then {
    Info("Initializing Curator Persistent Save.");
	{
		_x addEventHandler ["CuratorObjectPlaced", {
			params ["_curator", "_entity"];
			if !(_entity isKindOf "Building") exitWith {};
			[_entity] remoteExecCall ["SCRT_fnc_build_saveConstruction", 2];
		}];
		_x addEventHandler ["CuratorObjectEdited", {
			params ["_curator", "_entity"];
			if !(_entity isKindOf "Building") exitWith {};
			[_entity] remoteExecCall ["SCRT_fnc_build_updateConstruction", 2];
		}];
		_x addEventHandler ["CuratorObjectDeleted", {
			params ["_curator", "_entity"];
			if !(_entity isKindOf "Building") exitWith {};
			[_entity] remoteExecCall ["SCRT_fnc_build_removeConstruction", 2];
		}];
	} forEach (allCurators);
};

[allCurators] remoteExecCall ["A3A_fnc_initZeusLogging",0];

initClientDone = true;
Info("initClient completed");

if (!isMultiplayer) then {
	["noSingleplayer",false,1,false,false] call BIS_fnc_endMission;
};

call A3U_fnc_checkMods;

if (A3A_hasACE) then {call A3A_fnc_initACE};

if (["WBK_IMS_ANIMS_2"] call A3U_fnc_hasAddon) then {
    [player] call A3U_fnc_IMS_stealthKill;
};

if (fatigueEnabled isEqualTo false) then { 
	player enableFatigue false; 
}; 
 
if (staminaEnabled isEqualTo false) then { 
	player enableStamina false; 
}; 

private _newWeaponSway = swayEnabled / 100;
player setCustomAimCoef _newWeaponSway;

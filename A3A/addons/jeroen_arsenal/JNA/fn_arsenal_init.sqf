#include "defineCommon.inc"
#include "\A3\ui_f\hpp\defineDIKCodes.inc"
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
///////////////////////////////////////////////////////////////////////////////////////////
scriptName "fn_arsenal_init.sqf";
private _fileName = "fn_arsenal_init.sqf";
[2,"JNA init started",_fileName] call A3A_fnc_log;
params [["_object",objNull,[objNull]]];

//check if it was already initialised
if(!isnull (missionnamespace getVariable ["jna_object",objNull]))exitWith{};
if(isNull _object)exitWith{["Error: wrong input given '%1'",_object] call BIS_fnc_error;};
missionnamespace setVariable ["jna_object",_object];

jna_minItemMember = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
//jna_minItemMember = [24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,memberOnlyMagLimit,24,24,24,24,memberOnlyMagLimit];
jna_minItemMember = jna_minItemMember apply { A3A_guestItemLimit };
jna_minItemMember set [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG, A3A_guestItemLimit*3];
jna_minItemMember set [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL, A3A_guestItemLimit*3];
//preload the ammobox so you dont need to wait the first time
["Preload"] call jn_fnc_arsenal;

//server
if(isServer)then{
    Info("JNA server detected");

    //load default if it was not loaded from savegame
    if(isnil "jna_dataList" )then{jna_dataList = [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]];};
};

//player
if(hasInterface)then{
    Info("JNA loading player data");

    //add arsenal button
    _object addAction [
        (format ["<img image='%1' size='1.6' shadow=2/>", STR_ACTION_ICON_ARSENAL] + format["<t size='1'> %1</t>", (localize "STR_A3_Arsenal")]),
        JN_fnc_arsenal_handleAction,
        [],
        6,
        true,
        false,
        "",
        "alive _target && {_target distance _this < 5} && {vehicle player == player}"
    ];

    //add vehicle/box filling button
    _object addAction [
		("<img image='" + QPATHTOFOLDER(Pictures\unloadvehicle.paa) + "' size='1.6' shadow=2/>" + format["<t size='1'> %1</t>", localize "STR_JNA_ACT_CONTAINER_OPEN"]),
        {
			private _object = _this select 0;
			
			private _script =  {
				params ["_object"];
				
				//check if player is looking at some object
				private _objectSelected = cursorObject;
				if(isnull _objectSelected)exitWith{hint localize "STR_JNA_ACT_CONTAINER_SELECTERROR1"; };

				//check if object is in range
				if(_object distance cursorObject > 50) exitWith {hint localize "STR_JNA_ACT_CONTAINER_SELECTERROR2";};

				//check if object has inventory
				private _className = typeOf _objectSelected;
				private _tb = getNumber (configFile >> "CfgVehicles" >> _className >> "transportmaxbackpacks");
				private _tm = getNumber (configFile >> "CfgVehicles" >> _className >> "transportmaxmagazines");
				private _tw = getNumber (configFile >> "CfgVehicles" >> _className >> "transportmaxweapons");
				if !(_tb > 0  || _tm > 0 || _tw > 0) exitWith{hint localize "STR_JNA_ACT_CONTAINER_SELECTERROR3";};

				//set type and object to use later
				UINamespace setVariable ["jn_type", "containerArsenal"];
				UINamespace setVariable ["jn_object",_object];
				UINamespace setVariable ["jn_object_selected",_objectSelected];

                //start loading screen and timer to close it if something breaks
				["jn_fnc_arsenal", "Loading Nutz™ Arsenal"] call bis_fnc_startloadingscreen;
				[] spawn {
					uisleep 5;
					private _ids = missionnamespace getvariable ["BIS_fnc_startLoadingScreen_ids",[]];
					if("jn_fnc_arsenal" in _ids)then{
						private _display =  uiNamespace getVariable ["arsenalDisplay","No display"];
						titleText["ERROR DURING LOADING ARSENAL", "PLAIN"];
						_display closedisplay 2;
						["jn_fnc_arsenal"] call BIS_fnc_endLoadingScreen;
					};
				};

                //request server to open arsenal
                [clientOwner] remoteExecCall ["jn_fnc_arsenal_requestOpen",2];
			};
			private _conditionActive = {
				params ["_object"];
				alive player;
			};
			private _conditionColor = {
				params ["_object"];
				
				!isnull cursorObject
				&&{
					_object distance cursorObject < 10;
				}&&{
					//check if object has inventory
					private _className = typeOf cursorObject;
					private _tb = getNumber (configFile >> "CfgVehicles" >> _className >> "transportmaxbackpacks");
					private _tm = getNumber (configFile >> "CfgVehicles" >> _className >> "transportmaxmagazines");
					private _tw = getNumber (configFile >> "CfgVehicles" >> _className >> "transportmaxweapons");
					if (_tb > 0  || _tm > 0 || _tw > 0) then {true;} else {false;};
				
				}//return
			};

            [localize "STR_A3AP_vehArsenal_header", localize "STR_A3AP_vehArsenal_desc"] call A3A_fnc_customHint;
						
			[_script,_conditionActive,_conditionColor,_object] call jn_fnc_common_addActionSelect;
		},
        [],
        6,
        true,
        false,
        "",
        "alive _target && {_target distance _this < 5 && {vehicle player == player}}"
    ];

    //add quick equip button
    _object addAction [
        (format ["<img image='%1' size='1.6' shadow=2/>", "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\vest_ca.paa"] + format["<t size='1'> %1</t>", (localize "STR_JNA_SCT_QUICK_EQUIP")]),
        { 
            private _player = _this select 1;
            private _prefix = "loadouts_reb_militia_";
            private _loadout =  switch (typeOf _player) do {
                case "I_G_medic_F":  { "Medic" }; 
                case "I_G_Soldier_TL_F": { "SquadLeader" };
                case "I_G_Soldier_F": { "Rifleman" };
                case "I_G_Soldier_GL_F": { "Grenadier" };
                case "I_G_Soldier_AR_F": { "MachineGunner" };
                case "I_G_engineer_F":  { "Engineer" };
            };

            [_player, 0, _prefix + _loadout] call A3A_fnc_equipRebel;
        },
        [],
        6,
        true,
        false,
        "",
        "alive _target && {_target distance _this < 5} && {vehicle player == player}"
    ];

    //add open event
    [missionNamespace, "arsenalOpened", {
        disableSerialization;
        UINamespace setVariable ["arsenalDisplay",(_this select 0)];

        //spawn this to make sure it doesnt freeze the game
        [] spawn {
            disableSerialization;
            private _type = UINamespace getVariable ["jn_type",""];
            _veh = vehicle player;

            switch (true) do {
                case (uiNamespace getVariable ["isLoadoutArsenal", false]): {
                    ["CustomInit", [uiNamespace getVariable "arsenalDisplay"]] call SCRT_fnc_arsenal_loadoutArsenal;
                    UINamespace setVariable ["jn_type","loadoutArsenal"];
                };
                case (_type isEqualTo "containerArsenal"): {
                    ["CustomInit", [uiNamespace getVariable "arsenalDisplay"]] call jn_fnc_vehicleArsenal;
                    UINamespace setVariable ["jn_type","containerArsenal"];
                };
                default {
                    ["CustomInit", [uiNamespace getVariable "arsenalDisplay"]] call jn_fnc_arsenal;
                };
            };
        };

    }] call BIS_fnc_addScriptedEventHandler;

	//add close event
    [missionNamespace, "arsenalClosed", {
        _type = UINamespace getVariable ["jn_type",""];

        if(_type isEqualTo "arsenal")then{
            [clientOwner] remoteExecCall ["jn_fnc_arsenal_requestClose",2];
        };

        if(_type isEqualTo "containerArsenal")then{
            ["Close"] call jn_fnc_vehicleArsenal;
            [clientOwner] remoteExecCall ["jn_fnc_arsenal_requestClose",2];
            UINamespace setVariable ["jn_type",""];
        };

        if(_type isEqualTo "loadoutArsenal") then {
            ["Close"] call SCRT_fnc_arsenal_loadoutArsenal;
            [clientOwner] remoteExecCall ["jn_fnc_arsenal_requestClose",2];
            UINamespace setVariable ["jn_type",""];
        };

        if (uiNamespace getVariable ["isLoadoutArsenal", false]) then {
            uiNamespace setVariable ["isLoadoutArsenal", nil];
        };

    }] call BIS_fnc_addScriptedEventHandler;
};
Info("JNA init completed");
arsenalInit = true;

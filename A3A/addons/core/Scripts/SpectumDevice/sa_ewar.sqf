/*  
	script by [STELS]BendeR https://steamcommunity.com/sharedfiles/filedetails/?id=2214415193&searchtext=spectrum+device
	Adopted and modified by wersal
	BASIC SCRIPT REQUIRED
	Spectrum Device friendly-foe scan & uav jamming
	1.1c ui fix
	v1.1
	-uavs from ins list automaticaly switch to autonomous mode when jammed 
*/

sa_scan_time_k=0.1;//scan cycle time parametrs
sa_scan_temp=0.5;
sa_ident_str=-100;//Minimum signal str for friendly-foe recognition
sa_jamm_time=5;//Jamm time
sa_ins_list= ["B_UAV_03_dynamicLoadout_F","B_UAV_05_F","B_UAV_02_dynamicLoadout_F","O_UAV_02_dynamicLoadout_F","O_T_UAV_04_CAS_F","I_UAV_02_dynamicLoadout_F"];//UAVs classes with inertial navigation (dont lose waypoints after jamm&start operate acording waypoint program)
//
// Faction(west) get "uavsAttack" + Faction(west) get "uavsPortable" + Faction(east) get "uavsAttack" + Faction(east) get "uavsPortable" + ("UAV" call _fnc_extractMarketClasses) 
//or "vehiclesUAVs"
//OR ALL VEHICLES AND JUST CHECK WHICH HAS UAV CONTROLS
sa_scan_progress=0;
sa_sel_freq=[];
sa_local_jamm_list=[];
sa_local_jamm_buffer=[];

if (isNil "sa_scan_in_progress") then { sa_scan_in_progress = false; };
if (isNil "sa_visible_freq") then { sa_visible_freq = []; };
if (isNil "sa_sens_min") then { sa_sens_min = -120; };
if (isNil "sa_sens_max") then { sa_sens_max = -20; };

if(isDedicated || !hasInterface) exitWith {}; ///?

sa_str_message_scan=if (isLocalized "STR_SA_Scan") then { localize "STR_SA_Scan" } else {"&lt;t align='left' valign='middle' size='1'&gt; UAV signals: &lt;t color='#00ff00'&gt; %1 &lt;/t&gt;&lt;t color='#ff0000'&gt; %2 &lt;/t&gt;&lt;br /&gt;"};
sa_str_message_jamm=if (isLocalized "STR_SA_Jamm") then { localize "STR_SA_Jamm" } else {"&lt;t align='left' valign='middle' size='1'&gt; Success chance: %1&lt;/t&gt;"};
sa_str_message_jamm_no_target=if (isLocalized "STR_SA_Jamm_NoTarget") then { localize "STR_SA_Jamm_NoTarget" } else {"&lt;t align='left' valign='middle' size='1'&gt; No suitable target &lt;/t&gt;"};
sa_str_message_nofunction=if (isLocalized "STR_SA_NoFunction") then { localize "STR_SA_NoFunction" } else {"&lt;t align='left' valign='middle' size='1'&gt; This antenna not functional yet &lt;/t&gt;"};

waitUntil { !isNull findDisplay 46 };
_sa_display_ctrl=uiNamespace getVariable "sa_display_ctrl";
if(isNil {_sa_display_ctrl}) then{
	uiNamespace setVariable ['sa_display_ctrl',controlNull];
	_sa_display_ctrl=uiNamespace getVariable "sa_display_ctrl";
};
if (isNull _sa_display_ctrl) then {
	disableSerialization;
	uiSleep 1.;
	_sa_display_ctrl=findDisplay 46 ctrlCreate ["RscStructuredText", -1];
	uiNamespace setVariable ['sa_display_ctrl',_sa_display_ctrl];
	a=str _sa_display_ctrl;
	_sa_display_ctrl ctrlSetPosition [safeZoneX+safeZoneW-0.55, safeZoneY+0.15, 0.35, 0.13];
	_sa_display_ctrl ctrlSetBackgroundColor [0,0,0,0.7];
	_sa_display_ctrl ctrlSetStructuredText parseText format [""];
	_sa_display_ctrl ctrlCommit 0;
	_sa_display_ctrl ctrlShow false;
};


//
sa_is_signal_uav={
	params ["_signal"];
	private ["_result"];
	_result=0;
	if((_signal select 0 select 0) in allUnitsUAV) then {
	 _result=1;
	};
	if(!isNil{_signal select 2}) then {
		if(_signal select 3) then{_result=2;};
	};
	_result;
};

//Scan friendly/foe now land vehicle and remove crew
sa_scan_friendly_foe={
	private _chance=0;
	private _txt="";
	private _unit=[];
	{
		if (([_x] call sa_is_signal_uav) in [1,2]) then {
			_chance=((_x select 1)-sa_sens_min)/(sa_sens_max-sa_sens_min);
			_txt=_txt+format ["%1%2 ",round(_chance*100),"%"];
			if(_chance>=(random 1)) then {
				_unit=_x select 0 select 0;
				[_unit] remoteExec ["fnc_sa_local_add_to_jamm_list",[0,-2] select isDedicated];
				if (_unit isKindOf "Air") then {
					private _safeLandPos = [_unit,1,250,2,0,4,0] call BIS_fnc_findSafePos;
					_wp = (group _unit) addWaypoint [_safeLandPos, 1];
					_wp setWaypointBehaviour "SAFE";
					//_wp setWaypointType "GETOUT";
					_wp setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) leaveVehicle (assignedVehicle this)"]; /////NEEDS TO BE TESTED
					private _time = time;
					waitUntil {sleep 0.1, (getPos _unit) select 2 <1.3/*  || time - _time <= 30 */};
					{
						_unit deleteVehicleCrew _x;
					} forEach crew _unit;
				} else {
					{
						_unit deleteVehicleCrew _x;
					} forEach crew _unit;
				};
			};
		};
	} forEach sa_sel_freq;
	
	if(_chance>0) then {
		_sa_display_ctrl ctrlSetStructuredText parseText format [ sa_str_message_jamm,_txt];
	}
	else {
		_sa_display_ctrl ctrlSetStructuredText parseText format [ sa_str_message_jamm_no_target];
	};
	_sa_display_ctrl ctrlSetPosition [safeZoneX+safeZoneW-0.55, safeZoneY+0.15, 0.35, 0.05];
	_sa_display_ctrl ctrlCommit 0;
	_sa_display_ctrl ctrlShow true;
	/* private ["_friendly_uavs","_enemy_uavs","_other_signals,_weak_signals"];
	_friendly_uavs=0;
	_enemy_uavs=0;
	_other_signals=0;
	_weak_signals=0;
	{
		[player,_x select 0 select 1] remoteExec ["fnc_sa_add_spike_signal",2];//no JIP for now
		if((_x select 1)>sa_ident_str) then {
			
			if(([_x] call sa_is_signal_uav)>0) then {
				if(side (_x select 0 select 0)==side player) then {
					_friendly_uavs=_friendly_uavs+1;
				}
				else {
					_enemy_uavs=_enemy_uavs+1;
				};
			}
			else {
				_other_signals=_other_signals+1;
			};
		}
		else {
			_weak_signals=_weak_signals+1;
		};
		
	} forEach sa_sel_freq;
	
	_sa_display_ctrl ctrlSetStructuredText parseText format [ sa_str_message_scan, _friendly_uavs,_enemy_uavs,_other_signals,_weak_signals];
	_sa_display_ctrl ctrlSetPosition [safeZoneX+safeZoneW-0.55, safeZoneY+0.15, 0.35, 0.13];
	_sa_display_ctrl ctrlCommit 0;
			
	_sa_display_ctrl ctrlShow true; */
};



fnc_sa_local_add_to_jamm_list={
	params ["_unit"];
	if (side _unit==side player) then {	sa_local_jamm_buffer pushBackUnique _unit;};
};
//remove antenna
sa_jamm={
	private _chance=0;
	private _txt="";
	private _unit=[];
	{
		if (([_x] call sa_is_signal_uav) in [1,2]) then {
			_chance=((_x select 1)-sa_sens_min)/(sa_sens_max-sa_sens_min);
			_txt=_txt+format ["%1%2 ",round(_chance*100),"%"];
			if(_chance>=(random 1)) then {
				_unit=_x select 0 select 0;
				[_unit] remoteExec ["fnc_sa_local_add_to_jamm_list",[0,-2] select isDedicated];
				//if!(typeof _unit in sa_ins_list) then { ///change it or simply delete it
					
					{
						_unit deleteVehicleCrew _x;
					} forEach crew _unit;
					
					_unit setHit ["motor",1,true, objNull, objNull, true]
					//object setHit [part, damage, useEffects, killer, instigator, breakRotor]
					///damage turret instead of deleting gunner (for UGV(or leave it as is))
					//_unit deleteVehicleCrew gunner _unit;
					/* group _unit spawn 
					{
						[_this, (currentWaypoint _this)] setWaypointPosition [getPosASL ((units _this) select 0), -1];
						sleep 0.1;
						for "_i" from count waypoints _this - 1 to 0 step -1 do 
						{
							deleteWaypoint [_this, _i];
						};
					}; */
				/* } else {
					if(!isAutonomous _unit) then {
						_unit setAutonomous true;
					};
				}; */
			};
		};
	} forEach sa_sel_freq;
	
	if(_chance>0) then {
		_sa_display_ctrl ctrlSetStructuredText parseText format [ sa_str_message_jamm,_txt];
	}
	else {
		_sa_display_ctrl ctrlSetStructuredText parseText format [ sa_str_message_jamm_no_target];
	};
	_sa_display_ctrl ctrlSetPosition [safeZoneX+safeZoneW-0.55, safeZoneY+0.15, 0.35, 0.05];
	_sa_display_ctrl ctrlCommit 0;
	_sa_display_ctrl ctrlShow true;
};

//1st antenna
sa_1st_antenna_swap={
	private ["_friendly_uavs","_enemy_uavs","_other_signals,_weak_signals"];
	_friendly_uavs=0;
	_enemy_uavs=0;
	_other_signals=0;
	_weak_signals=0;
	{
		[player,_x select 0 select 1] remoteExec ["fnc_sa_add_spike_signal",2];//no JIP for now
		if((_x select 1)>sa_ident_str) then {
			
			if(([_x] call sa_is_signal_uav)>0) then {
				if(side (_x select 0 select 0)==side player) then {
					_friendly_uavs=_friendly_uavs+1;
				}
				else {
					_enemy_uavs=_enemy_uavs+1;
				};
			}
			else {
				_other_signals=_other_signals+1;
			};
		}
		else {
			_weak_signals=_weak_signals+1;
		};
		
	} forEach sa_sel_freq;
	
	_sa_display_ctrl ctrlSetStructuredText parseText format [ sa_str_message_scan, _friendly_uavs,_enemy_uavs,_other_signals,_weak_signals];
	_sa_display_ctrl ctrlSetPosition [safeZoneX+safeZoneW-0.55, safeZoneY+0.15, 0.35, 0.13];
	_sa_display_ctrl ctrlCommit 0;
	private _chance=0;
	private _txt="";
	private _unit=[];
	{
		if (([_x] call sa_is_signal_uav) in [1,2]) then {
			_chance=((_x select 1)-sa_sens_min)/(sa_sens_max-sa_sens_min);
			_txt=_txt+format ["%1%2 ",round(_chance*100),"%"];
			if(_chance>=(random 1)) then {
				_friendlyGroup = createGroup independent;
				_unit=_x select 0 select 0;
				[_unit] remoteExec ["fnc_sa_local_add_to_jamm_list",[0,-2] select isDedicated];
				{
					[_x] joinSilent _friendlyGroup;
				} forEach crew _unit;
			};
		};
	} forEach sa_sel_freq;
	
	if(_chance>0) then {
		_sa_display_ctrl ctrlSetStructuredText parseText format [ sa_str_message_jamm,_txt];
	}
	else {
		_sa_display_ctrl ctrlSetStructuredText parseText format [ sa_str_message_jamm_no_target];
	};
	_sa_display_ctrl ctrlSetPosition [safeZoneX+safeZoneW-0.55, safeZoneY+0.15, 0.35, 0.05];
	_sa_display_ctrl ctrlCommit 0;
	_sa_display_ctrl ctrlShow true;
};
	
//Scan progress bar
[] spawn {
	
	waitUntil { player == player };
	while{true} do {
		uiSleep(sa_scan_time_k);
			
		if ((currentWeapon player) in ["hgun_esd_01_F","hgun_esd_01_antenna_01_F","hgun_esd_01_antenna_02_F","hgun_esd_01_antenna_03_F"]) then {
			sa_sel_freq=[];
			if (sa_scan_in_progress) then {
				_sel_min=missionNamespace getVariable "#EM_SelMin";
				_sel_max=missionNamespace getVariable "#EM_SelMax";
				sa_sel_freq=sa_visible_freq select {(((_x select 0) select 1)>=_sel_min)&&(((_x select 0) select 1)<=_sel_max)};
				if(count sa_sel_freq>0) then {
					sa_scan_progress=sa_scan_progress+(sa_scan_temp*sa_scan_time_k);
				}
				else
				{
					sa_scan_progress=0;
				};
			}
			else {
				sa_scan_progress=0;
			};
			if(sa_scan_progress>1) then {sa_scan_progress=1};
			missionNamespace setVariable ["#EM_Progress", sa_scan_progress];
		};
	};
};

//Scan complete routine
_g=[] spawn {

	private ["_unit","_jam_pos","_uav_list_disable"];
	private _scan_complete=false;
	private _scan_complete_ons=false;
	private _sa_display_ctrl=uiNamespace getVariable 'sa_display_ctrl';
	if(isDedicated || !hasInterface) exitWith {};
	waitUntil { player == player };
	while{true} do {
		uiSleep(1);
		
		if(sa_scan_progress>0.9) then {
			_scan_complete=true;
		}
		else{
			_scan_complete=false;
			missionNamespace setVariable ["#EM_Transmit", _scan_complete];
			_sa_display_ctrl ctrlShow false;
		};

		if(_scan_complete&&!_scan_complete_ons) then {
			missionNamespace setVariable ["#EM_Transmit", _scan_complete];
			
			switch ((handgunItems player) select 0) do {
				case "muzzle_antenna_01_f": {[] call sa_1st_antenna_swap;sa_scan_progress=0;_scan_complete=false};
				case "muzzle_antenna_02_f": {[] call sa_scan_friendly_foe;};
				case "muzzle_antenna_03_f": {[] call sa_jamm;sa_scan_progress=0;_scan_complete=false;};
				default {[] call sa_scan_friendly_foe;}
			};
		};
		_scan_complete_ons=_scan_complete;
		
		if (count(sa_local_jamm_buffer)>0) then{
			{
				_unit=_x;
				_jam_pos=sa_local_jamm_list findIf {(_x select 0)==_unit} ;
				if(_jam_pos>=0) then {
					sa_local_jamm_list set [_jam_pos, [sa_local_jamm_list select _jam_pos select 0, sa_jamm_time]];
				}
				else
				{
					sa_local_jamm_list pushBackUnique [_unit, sa_jamm_time];
				};
			} forEach sa_local_jamm_buffer;
			sa_local_jamm_buffer=[];
		};
	
		if (count(sa_local_jamm_list)>0) then{
			sa_local_jamm_list apply {_x set [1,(_x select 1)-1];};
			sa_local_jamm_list=sa_local_jamm_list select {(_x select 1)>=0};

			if(count((assignedItems player) arrayIntersect ["B_UavTerminal","O_UavTerminal","I_UavTerminal","C_UavTerminal","I_E_UavTerminal"])>0) then {
				if(count(sa_local_jamm_list select {(_x select 0)==player})>0) then {
					player disableUAVConnectability [allUnitsUAV];
					if(count(getConnectedUAV player)>0) then {
						player connectTerminalToUAV objNull;
					};
				}
				else {
					_uav_list_disable=[];
					{
						_unit=_x select 0;
						_uav_list_disable pushBackUnique _unit;
						if(_unit in (getConnectedUAV player) ) then {
							player connectTerminalToUAV objNull;
						};
						player disableUAVConnectability [_unit,false];
						
					} forEach sa_local_jamm_list;
					
					{
						player enableUAVConnectability [_x,false];
					} forEach (allUnitsUAV select {!(_x in _uav_list_disable)});
				};
			};
		};	
	};
};
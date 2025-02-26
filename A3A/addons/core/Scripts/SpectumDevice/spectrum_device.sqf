/*  
	script by [STELS]BendeR https://steamcommunity.com/sharedfiles/filedetails/?id=2214415193&searchtext=spectrum+device
	Adopted and modified by wersal
	//v1.3
	//-scan moved to separate script sa_ewar.sqf, small fixes, added jamm v1.0, antennas reworked
	//v1.2
	//-major script rework, added realistic signal fade&default values
*/
//Mission settings
//sa_beacons=[[r_inf1,-1,-1],[r_tnk1,587.4],[radio1,-1]];

//#define SA_DISABLE_UAV_TERMINAL_DETECT 1
//#define SA_DISABLE_UAV_DETECT 1 //If u need this-uncomment also previous line
//#define SA_DISABLE_SPIKE_SIGNALS 1

//Script settings
sa_tan_limit=0.9;//Antenna tangens (distance from center of screen)
sa_time_k=0.5;//scan frequency (frequency of script execution)
sa_base_signal_str=36;//dBm 4W signal
sa_min_random_str=23;
sa_max_random_str=36;
sa_freq_min=500;//MHz
sa_freq_max=1000;
sa_freq_window=20;
sa_freq_sel_step=1;

sa_sens_min=-120;//dBm Min&max device sensitivity
sa_sens_max=-20;

sa_objects_frequency=[];
sa_uav_terminals_frequency=[];
sa_spike_signals_frequency=[];
sa_spike_signals_buffer=[];
sa_visible_freq=[];
sa_scan_in_progress=false;

//adding spike signals through remexec
fnc_sa_add_spike_signal={
	params ["_obj","_freq","_str"];
	if (isNil "_str") then {
		sa_spike_signals_buffer pushBackUnique [_obj,_freq];
	}
	else {
		sa_spike_signals_buffer pushBackUnique [_obj,_freq,_str];
	};
};

//Calc terrain signal fade
//based on function TFAR_fnc_calcTerrainInterception from Taskforce Radio addon by NKey
fnc_sa_calc_terrain_fade ={
	params ["_pos_obj","_pos_player"];
	private ["_result","_middle","_l", "_r", "_m"];
	_result=1;
	if (terrainIntersectASL[_pos_obj, _pos_player]) then {
		_l = 0.1;
		_r = 1.0;
		_m = 0.5;
		_middle = [((_pos_obj select 0) + (_pos_player select 0)) / 2.0, ((_pos_obj select 1) + (_pos_player select 1)) / 2.0, ((_pos_obj select 2) + (_pos_player select 2)) / 2.0];	
		_base = _middle select 2;

		while {(_r - _l) > 0.1} do {
			_middle set[2, _base + (_m*100)];
			if ((!terrainIntersectASL [ _pos_obj, _middle ]) and {!terrainIntersectASL [ _pos_player, _middle ]}) then {
				_r = _m;
			} else {
				_l = _m;
			};
			_m = (_l + _r) / 2.0;
		};
	_result = 1-_m;
	};
	_result;
};

//Calc strength of received signal
fnc_sa_calc_signal_str ={
	params ["_signal","_antenna_k"];
	private ["_tan","_dif","_sa_obj_pos","_distance","_initial_signal_str","_signal_strength","_pos_player","_terrain_k"];
	_sa_obj_pos_asl=getPosASL (_signal select 0);
	_sa_obj_pos_agl=position (_signal select 0);
	_dif=worldToScreen _sa_obj_pos_agl;
	_pos_player=eyePos player;
	_signal_strength=sa_sens_min;
	if (count _dif != 0)then {
		_dif=_dif apply {_x-0.5};
		_tan=sqrt(((_dif select 0)^2)+((_dif select 1)^2));
		if(abs(_tan)<=sa_tan_limit) then {
			if (!underwater (_signal select 0)) then {
				_terrain_k=[_sa_obj_pos_asl,_pos_player] call fnc_sa_calc_terrain_fade;
				_direction_k=(sa_tan_limit-_tan)/sa_tan_limit;
				_distance=(player distance _sa_obj_pos_agl)/1000;
				
				if(isNil{_signal select 2}) then {
					_initial_signal_str=sa_base_signal_str;
				}
				else {
					_initial_signal_str=_signal select 2;
				};
				_signal_strength=_terrain_k*_antenna_k*_direction_k*_initial_signal_str-(32.4+(20*log(_signal select 1))+(20*log(_distance)));
			};
		};
	};
	_signal_strength;
};

[] spawn {
	if(isDedicated || !hasInterface) exitWith {};
	waitUntil { player == player };
	
	missionNamespace setVariable ["#EM_FMin", sa_freq_min];
	missionNamespace setVariable ["#EM_FMax", sa_freq_max];
	
	missionNamespace setVariable ["#EM_SMin", sa_sens_min];
	missionNamespace setVariable ["#EM_SMax", sa_sens_max];
	
	missionNamespace setVariable ["#EM_SelMin", sa_freq_min];
	missionNamespace setVariable ["#EM_SelMax", (sa_freq_min+sa_freq_window)];
	
	missionNamespace setVariable ["#EM_Transmit", false];
	
	private _sa_eh_mouse_down=-1;
	private _sa_eh_mouse_up=-1;
	private _sa_eh_key=-1;
	
	private ["_visible_signals","_sa_antenna_k","_sa_signal_str","_sel_max","_sel_min"];
	
	while{true} do {
		uiSleep(sa_time_k);
		
		_visible_signals=[];
		sa_visible_freq=[];
		
		if ((currentWeapon player) in ["hgun_esd_01_F","hgun_esd_01_antenna_01_F","hgun_esd_01_antenna_02_F","hgun_esd_01_antenna_03_F"]) then {
			switch ((handgunItems player) select 0) do {
				case "muzzle_antenna_01_f": {_sa_antenna_k=0.2;sa_tan_limit=1.2;};
				case "muzzle_antenna_02_f": {_sa_antenna_k=1;sa_tan_limit=0.9;};
				case "muzzle_antenna_03_f": {_sa_antenna_k=0.6;sa_tan_limit=0.4;};
				default {_sa_antenna_k=0.05;sa_tan_limit=0.4;}
			};
			
			{				
				_sa_signal_str=[_x,_sa_antenna_k] call fnc_sa_calc_signal_str;
				if(_sa_signal_str>sa_sens_min) then{
					sa_visible_freq pushBack [_x,_sa_signal_str];
					_visible_signals pushBack (_x select 1);
					_visible_signals pushBack _sa_signal_str;
				};
			} forEach sa_objects_frequency;
			
#ifndef SA_DISABLE_UAV_TERMINAL_DETECT		
			{
				_sa_signal_str=[_x,_sa_antenna_k] call fnc_sa_calc_signal_str;
				if(_sa_signal_str>sa_sens_min) then{
					if(player!=(_x select 0)) then {
						sa_visible_freq pushBack [_x,_sa_signal_str];
						_visible_signals pushBack (_x select 1);
						_visible_signals pushBack _sa_signal_str;
					};
				};
			} forEach sa_uav_terminals_frequency;
#endif

#ifndef SA_DISABLE_UAV_TERMINAL_DETECT	
		{
				_sa_signal_str=[_x,_sa_antenna_k] call fnc_sa_calc_signal_str;
				if(_sa_signal_str>sa_sens_min) then{
					if(player!=(_x select 0)) then {
						sa_visible_freq pushBack [_x,_sa_signal_str,true];
						_visible_signals pushBack (_x select 1);
						_visible_signals pushBack _sa_signal_str;
					};
				};
			} forEach sa_spike_signals_frequency;
#endif
			
		 missionNamespace setVariable ["#EM_Values",_visible_signals];
		 
		 //Event handler
			if (_sa_eh_mouse_down==-1) then {
				_sa_eh_mouse_down=findDisplay 46 displayAddEventHandler ["MouseButtonDown",
				{
					params ["_displayorcontrol", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
					if (_button==0) then {
						sa_scan_in_progress=true
					};
				}];
			};
			if (_sa_eh_mouse_up==-1) then {
				_sa_eh_mouse_up=findDisplay 46 displayAddEventHandler ["MouseButtonUp",{
					params ["_displayorcontrol", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
					if (_button==0) then {
						sa_scan_in_progress=false
					};
				}];
			};
			if (_sa_eh_key==-1) then {
				_sa_eh_key=findDisplay 46 displayAddEventHandler ["KeyDown",{
					params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
					if (_key in actionKeys "zeroingUp") then {
						if(_shift) then  {
							sa_time_k=sa_time_k+0.1;
							if(sa_time_k>1) then {
								sa_time_k=1;
							};
							hintSilent format ["Discretization step: %1",sa_time_k];
						}
						else
						{
							_sel_min=missionNamespace getVariable "#EM_SelMin";
							_sel_max=missionNamespace getVariable "#EM_SelMax";
							_sel_max=_sel_max+sa_freq_sel_step;
							_sel_min=_sel_min+sa_freq_sel_step;
							if (_sel_max>sa_freq_max) then{
								_sel_max=sa_freq_max;
								_sel_min=sa_freq_max-sa_freq_window;
							};
							missionNamespace setVariable ["#EM_SelMin", _sel_min];
							missionNamespace setVariable ["#EM_SelMax", _sel_max];
						};
					};
					if (_key in actionKeys "zeroingDown") then {
						if(_shift) then  {
							sa_time_k=sa_time_k-0.1;
							if(sa_time_k<0.1) then {
								sa_time_k=0.1;
							};
							hintSilent format ["Discretization step: %1",sa_time_k];
						}
						else
						{
							_sel_min=missionNamespace getVariable "#EM_SelMin";
							_sel_max=missionNamespace getVariable "#EM_SelMax";
							_sel_max=_sel_max-sa_freq_sel_step;
							_sel_min=_sel_min-sa_freq_sel_step;
							if (_sel_min<sa_freq_min) then{
								_sel_max=sa_freq_min+sa_freq_window;
								_sel_min=sa_freq_min;
							};
							missionNamespace setVariable ["#EM_SelMin", _sel_min];
							missionNamespace setVariable ["#EM_SelMax", _sel_max];
						};
					};
				}];
			};
		}
		else {
		 if (_sa_eh_mouse_down!=-1) then {
			findDisplay 46 displayRemoveEventHandler ["MouseButtonDown",_sa_eh_mouse_down];
			_sa_eh_mouse_down=-1;
		 };
		 if (_sa_eh_mouse_up!=-1) then {
			findDisplay 46 displayRemoveEventHandler ["MouseButtonUp",_sa_eh_mouse_up];
			_sa_eh_mouse_up=-1;
		 };
		 if (_sa_eh_key!=-1) then {
			findDisplay 46 displayRemoveEventHandler ["KeyDown",_sa_eh_key];
			_sa_eh_key=-1;
		 };
		};
	};
};

if(!isServer) exitWith {};

addMissionEventHandler ["PlayerConnected",
{
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	if(_owner>2) then {
		[sa_objects_frequency,sa_uav_terminals_frequency,sa_spike_signals_frequency,{sa_objects_frequency=_this select 0;sa_uav_terminals_frequency=_this select 1;sa_spike_signals_frequency=_this select 2;}] remoteExec ["bis_fnc_call", _owner]; 
	};
}];

_g=[] spawn {
	private _bpla=[];
	private _used_freq=[];
	private _empty_freq=[];
	private _bpla_frequency=[];
	private _generated_sa_beacons=[];
	
	private _sa_objects_frequency_ons=[];
	private _sa_uav_terminals_frequenc_ons=[];
	private _sa_spike_signals_frequency_ons=[];
	
	private _frequency=0;
	private _signal_str=0;
	private _controllers=[];
	/* {
		_frequency=_x select 1;
		if (_frequency==-1) then {
			_frequency=round(random (sa_freq_min*10))/10+sa_freq_min;
			while{_frequency in _used_freq} do {
				_frequency=round(random (sa_freq_min*10))/10+sa_freq_min;
			}; 
		};
		_used_freq pushBackUnique _frequency;
		
		if(isNil{_x select 2}) then {
			_generated_sa_beacons pushBackUnique [(_x select 0),_frequency];	
		}
		else{
			_signal_str=_x select 2;
			if(_signal_str==-1) then {
				_signal_str=[sa_min_random_str,sa_max_random_str] call BIS_fnc_randomInt;
			};
			_generated_sa_beacons pushBackUnique [(_x select 0),_frequency,_signal_str];
		};
	} forEach sa_beacons; */
	
	while{true} do {
#ifndef	SA_DISABLE_UAV_DETECT
		{	
			if (!(_x in _bpla))then{
				_bpla pushBackUnique _x;
				_frequency=round(random (sa_freq_min*10))/10+sa_freq_min;
				while{_frequency in _used_freq} do {
					_frequency=round(random (sa_freq_min*10))/10+sa_freq_min;
				};
				_used_freq pushBackUnique _frequency;
				_bpla_frequency pushBackUnique [_x,_frequency];
			};
		} forEach allUnitsUAV;
		
		_empty_freq=[];
		{
			_empty_freq pushBackUnique (_x select 1);
		} forEach (_bpla_frequency select {!((_x select 0) in allUnitsUAV)});
		_bpla_frequency=_bpla_frequency select {(_x select 0) in allUnitsUAV};		
#endif
		sa_objects_frequency=_generated_sa_beacons+_bpla_frequency;
		
		_bpla=_bpla select {_x in allUnitsUAV};
		
#ifndef SA_DISABLE_UAV_TERMINAL_DETECT		
		sa_uav_terminals_frequency=[];
		{
			_controllers=UAVControl  (_x select 0);
			if(!isNull(_controllers select 0)) then{
				_frequency=_x select 1;
				{
					if ((_forEachIndex % 2) ==0) then {
						sa_uav_terminals_frequency pushBackUnique [_x,_frequency];
					};
				} forEach _controllers;
			};
		} forEach _bpla_frequency;
#endif

#ifndef SA_DISABLE_SPIKE_SIGNALS
		sa_spike_signals_frequency=sa_spike_signals_buffer;
		sa_spike_signals_buffer=[];
#endif
		
		if!(_sa_objects_frequency_ons isEqualTo sa_objects_frequency) then{
			publicVariable "sa_objects_frequency";
			_sa_objects_frequency_ons=sa_objects_frequency;
		};
		if!(_sa_uav_terminals_frequenc_ons isEqualTo sa_uav_terminals_frequency) then{
			publicVariable "sa_uav_terminals_frequency";
			_sa_uav_terminals_frequenc_ons=sa_uav_terminals_frequency;
		};
		if!(_sa_spike_signals_frequency_ons isEqualTo sa_spike_signals_frequency) then{
			publicVariable "sa_spike_signals_frequency";
			_sa_spike_signals_frequency_ons=sa_spike_signals_frequency;
		};
		
		uiSleep(10);	
	};
};


// fn_petrosSpook.sqf
params ["_petros"];
if (!local _petros) exitWith {};

sleep 5;

diag_log "PETROS_SPOOK: started";
systemChat "PETROS_SPOOK: started";

private _hiddenAnims = [
    ["AmovPercMstpSrasWrflDnon_SaluteOut", 0.4],
    ["AmovPercMstpSnonWnonDnon_exerciseKata", 33],
    ["AmovPercMstpSnonWnonDnon_exercisekneeBendB", 3],
    ["TestSurrender", 2],
    ["TestDance", 3],
    ["AswmPercMstpSnonWnonDnon", 5.3],
    ["AswmPercMstpSnonWnonDnon_AswmPercMstpSnonWnonDnon_putDown", 0.611],
    ["AswmPercMstpSnonWnonDnon_putDown_AswmPercMstpSnonWnonDnon", 2.125],
    ["AswmPercMstpSnonWnonDnon_godown", 1.68],
    ["AswmPercMstpSnonWnonDnon_relax", 5],
    ["AswmPercMstpSnonWnonDnon_putDown", 0.611],
    ["AsswPercMstpSnonWnonDnon_goup", 5.3],
    ["AsswPercMstpSnonWnonDnon_goDown", 5.3],
    ["AsswPercMstpSnonWnonDnon_relax", 5],
    ["AsswPercMstpSnonWnonDnon_putDown", 0.098],
    ["AsswPercMrunSnonWnonDf_AsswPercMstpSnonWnonDnon", 1.099],
    ["AbswPercMstpSnonWnonDnon_putDown", 0.096],
    ["AmovPercMwlkSrasWrflDf_AdvePercMrunSnonWnonDf", 0.444],
    ["AmovPercMwlkSnonWnonDf_AdvePercMrunSnonWnonDf", 0.444],
    ["AdvePercMstpSnonWrflDnon_godown", 1.25],
    ["AdvePercMstpSnonWrflDnon_goup", 1.667],
    ["AsdvPercMstpSnonWnonDnon_AsdvPercMstpSnonWnonDnon_putDown", 0.61],
    ["AsdvPercMstpSnonWnonDnon_godown", 1.25],
    ["AsdvPercMwlkSnonWnonDf", 8.152],
    ["AinvPknlMstpSlayWnonDnon_medicOther", 7.525],
    ["AinvPpneMstpSlayWnonDnon_medicOther", 7.754],
    ["AparPercMstpSnonWnonDnon_AmovPpneMstpSnonWnonDnon", 1.5],
    ["AmovPpneMstpSnonWnonDnon_healed", 5.88],
    ["Heli_Attack_01Pilot_AmovPercMstpSlowWrflDnon", 1.092],
    ["Heli_Attack_01Gunner_AmovPercMstpSlowWrflDnon", 1.092],
    ["AmovPercMstpSnonWnonDnon_Heli_Attack_01Pilot", 1.55],
    ["AmovPercMstpSnonWnonDnon_Heli_Attack_01Gunner", 1.092],
    ["AinjPpneMstpSnonWrflDnon", 3],
    ["AinjPpneMstpSnonWnonDnon_kneel", 2.496],
    ["AinjPpneMstpSnonWrflDb", 1],
    ["AcinPknlMwlkSlowWrflDb_death", 1],
    ["AcinPercMrunSrasWrflDf_death", 4.545],
    ["AcinPknlMwlkSlowWrflDb_death2", 1],
    ["AinjPpneMstpSnonWnonDnon_rolltoback", 1],
    ["AinjPpneMstpSnonWnonDnon_rolltofront", 1],
    ["AcinPercMrunSnonWnonDf", 0.8],
    ["AcinPercMrunSnonWnonDf_death", 4.545],
    ["AidlPsitMstpSnonWnonDnon_ground00", 3.3],
    ["AfalPercMstpSnonWnonDnon", 1],
    ["AfalPknlMstpSnonWnonDnon", 1],
    ["AfalPpneMstpSnonWnonDnon", 1],
    ["HaloFreeFall_F", 0.967],
    ["HaloFreeFall_B", 0.967],
    ["HubTemplateU", 2],
    ["Acts_JetsCrewaidRCrouchThumbup_in", 1.533],
    ["Acts_JetsCrewaidRCrouchThumbup_in_m", 1.533],
    ["Acts_JetsCrewaidRCrouchThumbup_out", 1.367],
    ["Acts_JetsCrewaidRCrouchThumbup_out_m", 1.367],
    ["Acts_JetsShooterShootingLaunch_in", 1.791],
    ["Acts_JetsCrewaidFCrouchThumbup_in", 0.867],
    ["Acts_JetsShooterNavigate_stop", 2.7],
    ["Acts_JetsShooterIdleMoveaway_in", 1.2],
    ["Acts_JetsShooterIdleMoveaway_in_m", 1.2],
    ["Acts_JetsShooterIdleMoveaway_loop", 1.43],
    ["Acts_JetsShooterIdleMoveaway_loop_m", 1.43],
    ["Acts_JetsShooterShootingReady_pointing", 4.167],
    ["Acts_JetsShooterMoveAway_stillpose", 3],
    ["Acts_JetsShooterShootingReady_loop", 6.48],
    ["Acts_JetsShooterShootingReady_in", 0.767],
    ["Acts_JetsShooterNavigate_in", 1.033], // absolute cinema
    ["Acts_JetsShooterNavigate_loop", 13.15],
    ["Acts_JetsMarshallingClear_in", 1.5],
    ["Acts_JetsMarshallingEmergencyStop_in", 0.867],
    ["Acts_JetsMarshallingEnginesOff_in", 0.6],
    ["Acts_JetsMarshallingEnginesOn_in", 2.367],
    ["Acts_JetsMarshallingSlow_in", 0.533],
    ["Acts_JetsFlyoverCheering_1", 6.035],
    ["Acts_JetsFlyoverCheering_2", 5.2],
    ["HubTemplate", 2],
    ["HubFixingVehicleProne_idle1", 18.349],
    ["HubShootingRange_base", 2],
    ["HubTemplate_Briefing", 2],
    ["Acts_PercMwlkSlowWrflDf", 2],
    ["Acts_WalkingChecking", 26.178], // funny one
    ["Acts_AidlPercMstpSlowWrflDnon_pissing", 19.157],
    ["Acts_welcomeOnHUB01_AIWalk", 3],
    ["Acts_welcomeOnHUB03_PlayerWalk_5", 12.658],
    ["Acts_SittingWounded_wave", 3.1],
    ["Acts_SittingWounded_out", 4.367],
    ["Acts_Abuse_abuser", 94.34], // long
    ["Acts_Abuse_Akhanteros", 76.923], // long
    ["Acts_Abuse_Lacey", 86.207], // long
    ["Acts_Abuse_Lacey2", 14.327],
    ["Acts_Abuse_Lacey3", 86.207], // long
    ["Acts_Abuse_Lacey4", 86.207], // long
    ["Acts_BootKoreShootingRange_Lacey", 7.402],
    ["Acts_BootKoreShootingRange_Lacey1", 7.402],
    ["Acts_BootKoreShootingRange_Lacey2", 11.862],
    ["Acts_FarmIncident_Lacey1", 3.4],
    ["Acts_FarmIncident_Lacey2", 2.867],
    ["Acts_Kore_IdleNoWeapon_out", 2.333],
    ["LaceyTest1a", 2.667],
    ["LaceyTest1b", 1],
    ["LaceyTest2a", 2.667], // this 3 should probably be played one after another
    ["Acts_AidlPsitMstpSsurWnonDnon02", 6.64],
    ["ApanPknlMrunSnonWnonDb", 1.82],
    ["ApanPpneMrunSnonWnonDf", 1.43],
    ["ApanPercMwlkSnonWnonDf", 2.845], // walking anim
    ["ApanPercMsprSnonWnonDf", 0.529], // walking anim
    ["ApanPknlMsprSnonWnonDf", 2.212], // walking anim
    ["ApanPpneMsprSnonWnonDf", 1.36], // walking anim
    ["ApanPercMstpSnonWnonDnon_G01", 15],
    ["Acts_CivilInjuredHead_1", 25],
    ["Acts_CivilShocked_1", 9.98],
    ["Acts_CivilTalking_1", 19.95],
    ["Acts_CivilTalking_2", 19.933],
    ["KIA_RHIB_Cargo", 2],
    ["KIA_Zodiac_Driver", 1],
    ["PreciseCrew", 3],
    ["Commander_APC_Wheeled_03_cannon_F_out_settlein", 1],
    ["Commander_APC_tracked_02_aa_F_out_settlein", 2],
    ["Gunner_APC_tracked_03_cannon_F_settlein", 0.86],
    ["Gunner_APC_tracked_03_cannon_F_in", 3],
    ["KIA_Gunner_Offroad_02_AT_F", 2],
    ["KIA_Gunner_Offroad_02_LMG_F", 2],
    ["Acts_EpicSplit", 10],
    ["Acts_EpicSplit_out", 10],
    ["passenger_inside_2_Idle_Unarmed_Idling", 10],
    ["passenger_boat_4_Die", 1],
    ["passenger_boat_4_Die_Pistol", 1],
    ["acts_ViperAppearing", 17.8],
    ["acts_viperSgtAppearing", 17.8],
    ["viper_runLoop", 1.765],
    ["acts_miller_knockout", 4.367],
    ["acts_millerPOV", 4.367],
    ["Acts_Briefing_SA_In", 18.699],
    ["Acts_Briefing_SB_In", 15.267],
    ["Acts_ExecutionVictim_Forehand", 2.567],
    ["Acts_ExecutionVictim_Backhand", 3.7],
    ["Acts_Executioner_StandingLoop", 11],
    ["Acts_Executioner_Squat", 10.033],
    ["Pilot_Plane_Fighter_01_GetIn", 7.71],
    ["Pilot_Plane_Fighter_01_GetOut", 11.364],
    ["Acts_StaticDeath_Coffin", 10],
    ["Acts_StaticPose_ContactBoxArt_01", 5],
    ["Acts_Accessing_Computer_Out_2", 15.244],
    ["Acts_Breakout_SquadLeader_2", 2.4],
    ["Acts_Breakout_Rifleman", 21.008],
    ["Acts_Stargazer", 24.381],
    ["Acts_Watching_Fire_Loop", 13.3],
    ["Acts_Arrival_Response", 53.763],
    ["Acts_Soldier_Moves_Inside_2", 2.466],
    ["Acts_Stunned_Unconscious", 7.032],
    ["Acts_Taking_Cover_From_Jets_in_loop", 8.814],
    ["Acts_Taking_Cover_From_Jets_action", 5.467],
    ["Acts_RU_Briefing_Point", 2.6],
    ["Acts_Pointing_Up", 3.329],
    ["Acts_Ambient_Facepalm_1", 5.9], // perhaps could be used somewhere
    ["Acts_Ambient_Facepalm_2", 3.6], //
    ["Acts_Ambient_Huh", 5.432],
    ["Acts_Ambient_Approximate", 1.4],
    ["Acts_Peering_Front", 4],
    ["Acts_Briefing_Intro2_Major_1", 3.066],
    ["Acts_Briefing_Intro2_Major_2", 3.066],
    ["Acts_Briefing_Intro3_Major_2", 1.566],
    ["AinjPfalMstpSnonWnonDf_carried_fallwc", 4.545]
];

private _tweaking = [
    ["AbswPercMstpSnonWnonDnon_putDown", 0.1],
    ["Acts_AidlPercMstpSloWWpstDnon_warmup_7", 0.03],
    ["Acts_AidlPercMstpSloWWpstDnon_warmup_8", 0.05],
    ["Acts_AidlPercMstpSloWWpstDnon_warmup_6", 0.05],
    ["Acts_AidlPercMstpSloWWpstDnon_warmup_5", 0.035],
    ["Acts_AidlPercMstpSloWWrflDnon_warmup_1", 0.035],
    ["Acts_AidlPercMstpSloWWrflDnon_warmup_2", 0.03],
    ["Acts_AidlPercMstpSloWWrflDnon_warmup_3", 0.04],
    ["Acts_AidlPercMstpSloWWrflDnon_warmup_4", 0.025],
    ["Acts_AidlPercMstpSloWWrflDnon_warmup_5", 0.03],
    ["Acts_AidlPercMstpSloWWrflDnon_warmup_6", 0.03],
    ["Acts_AidlPercMstpSloWWpstDnon_warmup_4", 0.03],
    ["Acts_AidlPercMstpSnonWnonDnon_warmup_1", 0.03],
    ["Acts_AidlPercMstpSnonWnonDnon_warmup_2", 0.033],
    ["Acts_AidlPercMstpSnonWnonDnon_warmup_3", 0.45],
    ["Acts_AidlPercMstpSnonWnonDnon_warmup_4", 0.25],
    ["Acts_AidlPercMstpSnonWnonDnon_warmup_5", 0.28],
    ["Acts_AidlPercMstpSnonWnonDnon_warmup_6", 0.33],
    ["Acts_AidlPercMstpSnonWnonDnon_warmup_7", 0.33],
    ["Acts_AidlPercMstpSnonWnonDnon_warmup_8", 0.3],
    ["AinjPfalMstpSnonWnonDf_carried", 0.74],
    ["AsswPercMstpSnonWnonDnon_putDown", 0.8],
    ["AwopPercMstpSgthWnonDnon_throw", 0.333],
    ["AwopPercMstpSgthWnonDnon_end", 1.026]
];

private _remainingTweaking = +_tweaking;
_remainingTweaking = _remainingTweaking call BIS_fnc_arrayShuffle;
private _watchedAnim = ["Acts_Arriving_Camp_Player", "LaceyTest1a"];

[_petros] spawn {
    params ["_petros"];
    private _duration = 0;
    private _currentWatcher = objNull;

    while {alive _petros} do {
        private _someoneWatching = false;
        private _watcher = objNull;
        private _anyLooking = false;
        private _inTimeout = (time < (_petros getVariable ["A3A_Petros_lastWatchTimeout", 0]));
        private _isAttached = !isNull attachedTo _petros;
        private _moveEnabled = _petros checkAIFeature "MOVE";
        private _canAct = (!_isAttached || !_moveEnabled);

        if (_canAct && !_inTimeout) then {
            {
                if (isPlayer _x && alive _x && (_x distance _petros) < 30) then {
                    private _dist = _x distance _petros;
                    private _visible = [objNull, "VIEW"] checkVisibility [eyePos _x, eyePos _petros];
                    if (_visible > 0.3) then {
                        private _dirToPetros = vectorNormalized ((eyePos _petros) vectorDiff (eyePos _x));
                        private _viewDir = eyeDirection _x;
                        private _dot = (_dirToPetros select 0)*(_viewDir select 0) + (_dirToPetros select 1)*(_viewDir select 1) + (_dirToPetros select 2)*(_viewDir select 2);
                        if (_dot > 0.8 && _dist <= 20) then {
                            _anyLooking = true;
                        };
                        if (_dot > 0.8) then {
                            if (_currentWatcher != _x) then {
                                _duration = 0;
                                _currentWatcher = _x;
                            };
                            _duration = _duration + 1;
                            if (_dist <= 10 && _duration >= 5) then {
                                _someoneWatching = true;
                                _watcher = _x;
                            };
                        } else {
                            if (_currentWatcher == _x) then {
                                _duration = 0;
                                _currentWatcher = objNull;
                            };
                        };
                    } else {
                        if (_currentWatcher == _x) then {
                            _duration = 0;
                            _currentWatcher = objNull;
                        };
                    };
                } else {
                    if (_currentWatcher == _x) then {
                        _duration = 0;
                        _currentWatcher = objNull;
                    };
                };
            } forEach allPlayers;
        } else {
            _duration = 0;
            _currentWatcher = objNull;
        };

        _petros setVariable ["A3A_Petros_spook_watching", _someoneWatching];
        _petros setVariable ["A3A_Petros_spook_watcher", _watcher];
        _petros setVariable ["A3A_Petros_spook_duration", _duration];
        _petros setVariable ["A3A_Petros_spook_currentWatcher", _currentWatcher];
        _petros setVariable ["A3A_Petros_spook_anyLooking", _anyLooking];

        sleep 1;
    };
};

while {alive _petros} do {
    diag_log "=== Spook cycle start ===";
    systemChat "=== Spook cycle start ===";

    private _someoneWatching = _petros getVariable ["A3A_Petros_spook_watching", false];
    private _watcher = _petros getVariable ["A3A_Petros_spook_watcher", objNull];
    private _anyLooking = _petros getVariable ["A3A_Petros_spook_anyLooking", false];
    private _timeoutEnd = _petros getVariable ["A3A_Petros_lastWatchTimeout", 0];
    private _inTimeout = (time < _timeoutEnd);
    private _isAttached = !isNull attachedTo _petros;
    private _moveEnabled = _petros checkAIFeature "MOVE";
    private _canAct = (!_isAttached || !_moveEnabled);

    diag_log format ["Spook state: canAct=%1, inTimeout=%2, watching=%3, anyLooking=%4", _canAct, _inTimeout, _someoneWatching, _anyLooking];
    systemChat format ["Spook state: canAct=%1, inTimeout=%2, watching=%3, anyLooking=%4", _canAct, _inTimeout, _someoneWatching, _anyLooking];

    if (_canAct) then {
        if (_someoneWatching && !_inTimeout) then {
            private _chosenAnim = selectRandom _watchedAnim;
            diag_log format ["Reaction: spawning with anim %1 for watcher %2", _chosenAnim, name _watcher];
            systemChat format ["Reaction: spawning with anim %1 for watcher %2", _chosenAnim, name _watcher];
            [_petros, _watcher, _chosenAnim] spawn {
                params ["_petros", "_watcher", "_chosenAnim"];
                private _originalPos = getPos _petros;
                private _originalDir = getDir _petros;
                _petros setDir (_petros getDir _watcher);
                _petros switchMove _chosenAnim;
                sleep 3;
                _petros setDir _originalDir;
                _petros setPos _originalPos;
                _petros switchMove "AmovPercMstpSnonWnonDnon";
                diag_log "Reaction animation finished, restored position/direction";
                systemChat "Reaction animation finished, restored position/direction";
            };
            _petros setVariable ["A3A_Petros_lastWatchTimeout", time + 20];
            diag_log "Set reaction timeout for 20 seconds";
            systemChat "Set reaction timeout for 20 seconds";
        } else {
            if (!_anyLooking) then {
                if (random 1 < 0.2) then {
                    private _selected = selectRandom _hiddenAnims;
                    private _anim = _selected select 0;
                    private _durationAnim = _selected select 1;
                    diag_log format ["Playing hidden anim: %1, duration %2", _anim, _durationAnim];
                    systemChat format ["Playing hidden anim: %1, duration %2", _anim, _durationAnim];
                    private _originalPos = getPos _petros;
                    private _originalDir = getDir _petros;
                    _petros switchMove _anim;
                    sleep _durationAnim;
                    _petros setDir _originalDir;
                    _petros setPos _originalPos;
                    diag_log "Hidden anim finished, restored position/direction";
                    systemChat "Hidden anim finished, restored position/direction";
                } else {
                    diag_log "Playing tweaking animations (all remaining)";
                    systemChat "Playing tweaking animations (all remaining)";
                    private _originalPos = getPos _petros;
                    while {count _remainingTweaking > 0 && !_anyLooking} do {
                        private _selected = _remainingTweaking deleteAt 0;
                        private _anim = _selected select 0;
                        private _durationAnim = _selected select 1;
                        private _repeats = 1 + floor (random 2);
                        diag_log format ["Tweaking: anim %1, repeats %2", _anim, _repeats];
                        systemChat format ["Tweaking: anim %1, repeats %2", _anim, _repeats];
                        for "_i" from 1 to _repeats do {
                            _petros switchMove _anim;
                            _petros setPos _originalPos;
                            sleep _durationAnim;
                        };
                    };
                    diag_log "All tweaking animations played, reshuffling list";
                    systemChat "All tweaking animations played, reshuffling list";
                    _remainingTweaking = +_tweaking;
                    _remainingTweaking = _remainingTweaking call BIS_fnc_arrayShuffle;
                };
            } else {
                diag_log "Skipping random anims because someone is looking (anyLooking=true)";
                systemChat "Skipping random anims because someone is looking";
            };
        };
    } else {
        diag_log "Skipping actions: canAct is false";
        systemChat "Skipping actions: canAct is false";
    };
    sleep 1;
};
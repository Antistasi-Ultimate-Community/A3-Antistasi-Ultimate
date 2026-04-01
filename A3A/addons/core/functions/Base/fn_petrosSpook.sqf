// fn_petrosSpook.sqf
params ["_petros"];
if (!local _petros) exitWith {};

sleep 30;

//diag_log "PETROS_SPOOK: started";

private _duration = 0;
private _currentWatcher = objNull;
private _watchedAnim = "Acts_Arriving_Camp_Player";

while {alive _petros} do {
    private _someoneWatching = false;
    private _watcher = objNull;
    private _inTimeout = (time < (_petros getVariable ["A3A_Petros_lastWatchTimeout", 0]));
    private _isAttached = !isNull attachedTo _petros;
    private _moveEnabled = _petros checkAIFeature "MOVE";
    private _canAct = (!_isAttached && !_moveEnabled); // Petros is stationary and can react
    private _partyActive = _petros getVariable ["A3A_Petros_partyActive", false]; // Check if party is active

    // Check players if action is possible, no timeout, and party is NOT active
    if (_canAct && !_inTimeout && !_partyActive) then {
        {
            if (isPlayer _x && alive _x && (_x distance _petros) < 50) then {
                private _dist = _x distance _petros;
                private _visible = [objNull, "VIEW"] checkVisibility [eyePos _x, eyePos _petros];
                if (_visible > 0.1) then {
                    private _dirToPetros = vectorNormalized ((eyePos _petros) vectorDiff (eyePos _x));
                    private _viewDir = eyeDirection _x;
                    private _dot = (_dirToPetros select 0)*(_viewDir select 0) + (_dirToPetros select 1)*(_viewDir select 1) + (_dirToPetros select 2)*(_viewDir select 2);
                    // If looking towards Petros and within 20m radius
                    if (_dot > 0.8 && _dist <= 20) then { //
                        _someoneWatching = true;
                        _watcher = _x;
                    };
                };
            };
        } forEach allPlayers;
    };

    // If there is an observer, no timeout, action possible, and party NOT active — trigger reaction
    if (_someoneWatching && !_inTimeout && _canAct && !_partyActive) then {
        // Run reaction in a separate thread
        [_petros, _watcher, _watchedAnim] spawn {
            params ["_petros", "_watcher", "_anim"];
            private _originalPos = getPos _petros;
            private _originalDir = getDir _petros;
            _petros setDir (_petros getDir _watcher);
            [_petros, _anim] remoteExec ["switchMove", 0];
            private _message = format ["Petros :)  %1", localize "STR_A3U_Petros_spook_boo"];
            [_message] remoteExec ["systemChat", owner _watcher];
            sleep 2.8;
            _petros setDir _originalDir;
            _petros setPos _originalPos;
            [_petros, "AmovPercMstpSnonWnonDnon"] remoteExec ["switchMove", 0];
            //diag_log "Reaction animation finished, restored position/direction";
        };
        _petros setVariable ["A3A_Petros_lastWatchTimeout", time + 30];
        // Short pause to avoid spamming reactions (though timeout already set)
    };
    sleep 1;
};
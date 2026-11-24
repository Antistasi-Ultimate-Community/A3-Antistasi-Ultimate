private _veh = cursorObject;

if (isNull _veh) exitWith {
    [localize "STR_A3A_Base_unlockVehicle_header", localize "STR_HR_GRG_Feedback_addVehicle_Null"] call SCRT_fnc_misc_deniedHint;
};

if (!alive _veh) exitWith {[localize "STR_A3A_Base_unlockVehicle_header", "You cannot unlock/lock destroyed."] call SCRT_fnc_misc_deniedHint;};

if (_veh isKindOf "Man") exitWith {[localize "STR_A3A_Base_unlockVehicle_header", format [localize "STR_A3A_Base_unlockVehicle_cantunlock",name _veh]] call SCRT_fnc_misc_deniedHint;};

if (not(_veh isKindOf "AllVehicles")) exitWith {[localize "STR_A3A_Base_unlockVehicle_header", localize "STR_A3A_Base_unlockVehicle_noallveh"] call SCRT_fnc_misc_deniedHint;};
_ownerX = _veh getVariable "ownerX";

if (isNil "_ownerX") exitWith {[localize "STR_A3A_Base_unlockVehicle_header", localize "STR_A3A_Base_unlockVehicle_noowner"] call SCRT_fnc_misc_deniedHint;};

if (_ownerX != getPlayerUID player) exitWith {[localize "STR_A3A_Base_unlockVehicle_header", localize "STR_A3A_Base_unlockVehicle_wrongowner"] call SCRT_fnc_misc_deniedHint;};

if (isNil { _veh getVariable "A3A_locked"} ) then {
    _veh setVariable ["A3A_locked",true,true];
    [localize "STR_A3A_Base_unlockVehicle_header", localize "STR_A3A_Base_unlockVehicle_lock_success"] call A3A_fnc_customHint;
} else {
    _veh setVariable ["A3A_locked",nil,true];
    [localize "STR_A3A_Base_unlockVehicle_header", localize "STR_A3A_Base_unlockVehicle_unlock_success"] call A3A_fnc_customHint;	
};

playSound "A3AP_UiSuccess";

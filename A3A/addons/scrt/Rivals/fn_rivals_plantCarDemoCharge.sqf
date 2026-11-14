/*
Maintainer: Socrates
    Applies car demo charge on selected vehicle.

Arguments:
    <VEHICLE> Any vehicle. 

Return Value:
    <NIL>

Scope: Server
Environment: Any
Public: Yes
Dependencies:
    <INTEGER> inactivityLevelRivals

Example:
[_vehicle] call SCRT_fnc_rivals_plantCarDemoCharge;
*/
#include "..\defines.inc"
FIX_LINE_NUMBERS()

params [["_vehicleToCharge", objNull], ["_proximityChance", 40]];

private _charge = "DemoCharge_F" createVehicle [0,0,0];
_charge setVectorDirAndUp [(vectorDir _vehicleToCharge), [0,0,-1]];
_charge setPosWorld ((getPosWorld _vehicleToCharge) vectorAdd [0,0,-0.8]);
_charge attachTo [_vehicleToCharge, [0,0,-0.8]];
[
    _charge,
    (localize "STR_antistasi_actions_car_bomb_disarm"),
    "a3\ui_f\data\igui\cfg\holdactions\holdaction_unbind_ca.paa",
    "a3\ui_f\data\igui\cfg\holdactions\holdaction_unbind_ca.paa",
    "(_this distance _target < 3) and (_this getUnitTrait 'engineer')",
    "_caller distance _target < 3",
    {},
    {},
    { deleteVehicle _target },
    {},
    [],
    12,
    0,
    true,
    false
] remoteExec ["BIS_fnc_holdActionAdd", 0, _charge];

_vehicleToCharge setVariable ["democharge", _charge];

private _engineEhId = _vehicleToCharge addEventHandler 
[
	"Engine", 
	{
		params ["_vehicleToCharge", "_engineOn"];
        if (_engineOn) then { 
			_this spawn { 
				params ["_vehicleToCharge", "_engineOn"]; 
				private _charge = _vehicleToCharge getVariable ["democharge", _vehicleToCharge]; 

                if (isNull _charge || {isNil "_charge"}) then {
                    _charge = _vehicleToCharge;
                };

                { 
					[
                        "RivalsActivityDetected", 
                        [
                            format [localize "STR_rivals_activity_header",  A3A_faction_riv get "name"], 
                            format [localize "STR_rivals_activity_demo_car_description", A3A_faction_riv get "nameLeader"]
                        ]
                    ] remoteExec ["BIS_fnc_showNotification", _x];
                } forEach ((call SCRT_fnc_misc_getRebelPlayers) select {(position _x) distance _vehicleToCharge < 100});
				
				private _timeOut = time + 1;
	            waitUntil {_timeOut < time};

				playSound3D ["x\A3A\addons\core\Sounds\Misc\BombCountdown.ogg", _charge, false, getPosASL _charge, 2.5, 1, 50]; 
				
                private _timeOut = time + 2;
	            waitUntil {_timeOut < time};

				private _chargePos = getPosWorld _charge; 
				if (_charge != _vehicleToCharge) then { 
					deleteVehicle _charge; 
				}; 
				_charge = "DemoCharge_Remote_Ammo_Scripted" createVehicle [0,0,0]; 
				_charge setPosWorld _chargePos; 
				_charge setDamage 1; 
			}; 
 
			_vehicleToCharge removeEventHandler [_thisEvent, _thisEventHandler]; 
		};
	}
];

[_vehicleToCharge, _charge, _engineEhId, _proximityChance] spawn {
    params ["_vehicleToCharge", "_charge", "_engineEhId", "_proximityChance"];
    
    waitUntil {
        isNil "_vehicleToCharge" 
        || {!alive _vehicleToCharge
        || {(call SCRT_fnc_misc_getRebelPlayers) findIf { _x distance _vehicleToCharge < 25 } != -1}}
    };

    //this should handle despawn
    if (isNil "_vehicleToCharge" || {isNull _vehicleToCharge || {!alive _vehicleToCharge}}) exitWith {
        deleteVehicle _charge;
        _vehicleToCharge removeEventHandler ["Engine", _engineEhId];
    };
    if ((random 100) > _proximityChance) exitWith {};

    { 
        [
            "RivalsActivityDetected", 
            [
                format [localize "STR_rivals_activity_header",  A3A_faction_riv get "name"], 
                format [localize "STR_rivals_activity_demo_car_description", A3A_faction_riv get "nameLeader"]
            ]
        ] remoteExec ["BIS_fnc_showNotification", _x];
    } forEach ((call SCRT_fnc_misc_getRebelPlayers) select {(position _x) distance _vehicleToCharge < 100});

    private _timeOut = time + 1;
	waitUntil {_timeOut < time};


    playSound3D ["x\A3A\addons\core\Sounds\Misc\BombCountdown.ogg", _charge, false, getPosASL _charge, 2.5, 1, 50]; 
    
    private _timeOut = time + 1;
	waitUntil {_timeOut < time};

    private _chargePos = getPosWorld _charge;
    deleteVehicle _charge;
    _chargeScripted = "DemoCharge_Remote_Ammo_Scripted" createVehicle [0,0,0];
    _chargeScripted setPosWorld _chargePos;
    _chargeScripted setDamage 1;
    
    _vehicleToCharge removeEventHandler ["Engine", _engineEhId];
};

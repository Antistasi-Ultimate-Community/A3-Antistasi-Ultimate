#include "..\defines.inc"
FIX_LINE_NUMBERS()

params ["_plane", "_payload", "_supportType"];

private _planeVehicle = vehicle _plane;

sleep random 5;

Info_2("Dropping cargo at %1 (near %2)", getPos _planeVehicle, text nearestLocation [getPos _planeVehicle, "NameCity"]);

if (alive _planeVehicle) then {

    private _supplyDrop = createVehicle [_payload, [getPos _planeVehicle select 0, getPos _planeVehicle select 1, (getPos _planeVehicle select 2)- 5], [], 0, "NONE"];
    waituntil {!isnull _supplyDrop};
    sleep 1.5;

    private _paraPos = nil;

    switch(_supportType) do {
        case ("VEH_AIRDROP"): {
            _paraPos = [0, 0, -0.1];
        };
        default {
            _supplyDrop remoteExecCall ["SCRT_fnc_common_fillSupplyDrop", 2];
            [_supplyDrop] call A3A_Logistics_fnc_addLoadAction;
            _paraPos = [0, 0, -0.6];
        };
    };

    private _para = createVehicle ["B_parachute_02_F", [0,0,0], [], 0, "NONE"];
    _para setDir getDir _supplyDrop;
    _para setPos getPos _supplyDrop;
    _supplyDrop attachTo [_para, _paraPos];

    
	private _startTime = time;

    [_supplyDrop, _para] spawn {
        params ["_obj","_para"];

        private _smokeShellVariants = ["SmokeShellRed", "SmokeShellGreen", "SmokeShellYellow", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"];

        waitUntil {
            sleep 0.01;
            ((position _obj) select 2) < 2 
            || 
            isNull _para 
            || 
            (count (lineIntersectsWith [getPosASL _obj, (getPosASL _obj) vectorAdd [0, 0, -0.5], _obj, _para])) > 0
            || 
            (time - _startTime) > 30
        };
            
        _para disableCollisionWith _obj;
        _obj setVectorUp [0,0,1];
        _obj setVelocity [0,0,0];
        detach _obj;
        
        // mark landing with smoke
        _smokeShell = (selectRandom _smokeShellVariants) createVehicle (position _obj);

        if(sunOrMoon < 1) then {
            private _chemlightVariants = ["Chemlight_green", "Chemlight_red", "Chemlight_yellow", "Chemlight_blue"];
            _chemLight = (selectRandom _chemlightVariants) createVehicle (position _obj);
        };
        
        if (!isNull _para) then {deleteVehicle _para};
    };
};

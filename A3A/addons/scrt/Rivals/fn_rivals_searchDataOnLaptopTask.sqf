#include "..\defines.inc"
FIX_LINE_NUMBERS()


params ["_laptop", "_caller", "_action"];

[_laptop, _action] remoteExec ["removeAction", [teamPlayer, civilian], _laptop];

if !(_laptop getVariable ["isLaptopOpened", false]) then {	
	private _openClosedLaptopMap = ["Land_laptop_03_closed_black_F", "Land_laptop_03_closed_sand_F", "Land_laptop_03_closed_olive_F"] 
		createHashMapFromArray ["Land_Laptop_03_black_F", "Land_Laptop_03_sand_F", "Land_Laptop_03_olive_F"];
	private _openedLaptopClass = _openClosedLaptopMap get (typeOf _laptop);

	private _oldLaptopPos = getPosATL _laptop;

	private _openedLaptop = createVehicle [_openedLaptopClass, [0,0,0], [], 0 , "CAN_COLLIDE"];
	_openedLaptop setPosATL _oldLaptopPos;
	_openedLaptop setObjectTextureGlobal [1, QPATHTOFOLDER(Pictures\Intel\laptop_scan.paa)];
	_openedLaptop setVariable ["isLaptopOpened", true, true];

	deleteVehicle _laptop;
	_laptop = _openedLaptop;
};

private _callerDir = [_caller,_laptop] call BIS_fnc_DirTo;
_laptop setDir _callerDir;

_caller setVariable ["laptopSearchTime", (time + 10)];
_caller setVariable ["laptopSearchAnimsDone",false];
_caller setVariable ["laptopSearchDone", false];
_caller setVariable ["cancelLaptopSearch",false];

_caller playMoveNow selectRandom medicAnims;
private _cancelAction = player addAction [
	(localize "STR_millaptop_cancel_action"),
	{
		(_this select 1) setVariable ["cancelLaptopSearch",true]
	},
	nil,
	6,
	true,
	true,
	"",
	"(isPlayer _this)"
];

private _soundSource = createVehicle ["Land_HelipadEmpty_F", (position _laptop), [], 0 , "CAN_COLLIDE"];
playSound3D ["x\A3A\addons\core\Sounds\Misc\Typing.ogg", _soundSource, false, getPosASL _soundSource, 3, 1, 50];

_caller addEventHandler
[
    "AnimDone",
    {
        private _caller = _this select 0;
        if (
            ([_caller] call A3A_fnc_canFight) &&                        //Caller is still able to fight
            {(time <= (_caller getVariable ["laptopSearchTime",time])) &&     //Time is not yet finished
            {!(_caller getVariable ["cancelLaptopSearch",false]) &&           //Search hasn't been cancelled
            {(isNull objectParent _caller)}}}                           //Caller has not entered a vehicle
        ) then {
            _caller playMoveNow selectRandom medicAnims;
        }
        else {
            _caller removeEventHandler ["AnimDone", _thisEventHandler];
            _caller setVariable ["laptopSearchAnimsDone",true];
        };
    }
];

waitUntil {_caller getVariable ["laptopSearchAnimsDone", false]};

deleteVehicle _soundSource;

_caller setVariable ["laptopSearchTime",nil];
_caller setVariable ["laptopSearchAnimsDone",nil];
_caller removeAction _cancelAction;

private _wasCancelled = _caller getVariable ["cancelLaptopSearch", false];
_caller setVariable ["cancelLaptopSearch", nil];

if(_wasCancelled) exitWith {
    [(localize "STR_millaptop_cancel_header"), (localize "STR_millaptop_cancel_description")] call A3A_fnc_customHint;
    _caller setVariable ["laptopSearchDone", nil];
    [_laptop, "rivals_quest"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_laptop];
};

_laptop setObjectTextureGlobal [1, QPATHTOFOLDER(Pictures\Intel\laptop_signal.paa)];
_caller setVariable ["laptopSearchDone", true];

//for garbage clean and other things in RES_Rivals task
rivalsLaptop = _laptop; 
publicVariable "rivalsLaptop";

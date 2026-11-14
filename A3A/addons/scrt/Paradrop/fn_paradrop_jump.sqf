private _jumper = _this;

private _fnc_reattachPackHolderOnChute = {
    params ["_unit", "_packHolder"];
    waitUntil {animationState _unit == "para_pilot" || {!alive _unit}};
    if (!alive _unit) exitWith {};

    cutText ["","BLACK IN",2];
    _packHolder attachTo [vehicle _unit,[-0.07,0.67,-0.13],"pelvis"]; 
    _packHolder setVectorDirAndUp [[0,-0.2,-1],[0,1,0]];

    waitUntil {isTouchingGround _unit || {(getPos _unit select 2) < 1}};
    if (!isNil "_packHolder") then {
        detach _packHolder;
        deleteVehicle _packHolder;
    };
};

cutText ["","BLACK IN",2];

private _backpackClass = backpack _jumper;
private _packHolder = nil;
private _backPackitems = nil;
if (_backpackClass != "") then {
    _backPackitems = backpackItems _jumper;
    _packHolder = createVehicle ["GroundWeaponHolder", [0,0,0], [], 0, "CAN_COLLIDE"];
    _packHolder addBackpackCargoGlobal [_backpackClass, 1];
    _packHolder attachTo [_jumper, [-0.12,-0.02,-.74], "pelvis"]; 
	_packHolder setVectorDirAndUp [[0,-1,-0.05],[0,0,-1]];
    removeBackpack _jumper;
};

_jumper addBackpack "b_parachute";

if (!isNil "_packHolder") then {  
    [_jumper, _packHolder] spawn _fnc_reattachPackHolderOnChute;
};

waitUntil {isTouchingGround _jumper || {(getPos _jumper select 2) < 1}};

if (!alive _jumper) exitWith {};

if (!isNil "_backPackClass" && {!isNil "_backPackitems"}) then {
    _jumper addBackpack _backpackClass;
    clearAllItemsFromBackpack _jumper;
    {_jumper addItemToBackpack _x} forEach _backPackitems;
};

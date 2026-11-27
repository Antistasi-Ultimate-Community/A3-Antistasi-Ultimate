// Note: leader might not be group leader, so locality isn't guaranteed. This case is a bit broken (disableAI etc)
// AIs may even switch locality mid-function
params ["_unit"];

if (isPlayer _unit) exitWith {};
private _leader = _unit getVariable ["owner",leader group _unit];
if (!isPlayer _leader) exitWith {};
if (!captive _leader) exitWith {};
if (captive _unit) exitWith {};
[_unit,true] remoteExec ["setCaptive",_unit];
_unit setCaptive true;
_unit disableAI "TARGET";
_unit disableAI "AUTOTARGET";

private _oldBehaviour = combatBehaviour _unit;		// actually the same as behaviour _unit?

_unit setCombatBehaviour "CARELESS";
_unit setUnitPos "UP";
private _loadOut = getUnitLoadout _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeAllWeapons _unit;			// also removes magazines
removeGoggles _unit;
removeVest _unit;

_unit addHeadgear (selectRandom (A3A_faction_civ get "headgear"));
_unit forceAddUniform (selectRandom (A3A_faction_civ get "uniforms"));

while {captive _leader && {captive _unit}} do{
	sleep 1;
	if ((!isNull objectParent _unit) and (not((typeOf vehicle _unit) in undercoverVehicles))) exitWith {};
	if ((primaryWeapon _unit != "") or (secondaryWeapon _unit != "") or (handgunWeapon _unit != "")) exitWith {};
};

if (!captive _unit) then {
	_unit groupChat (selectRandom [
		localize "STR_outpost_ai_spotted_1",
		localize "STR_outpost_ai_spotted_2",
		localize "STR_outpost_ai_spotted_3"
	]);
} else {
	[_unit,false] remoteExec ["setCaptive",_unit]; 
	_unit setCaptive false
};
if (captive _leader) then {sleep 5};
_unit setCombatBehaviour _oldBehaviour;
_unit enableAI "TARGET";
_unit enableAI "AUTOTARGET";
_unit setUnitPos "AUTO";

// Remove backpack if changed, prevents static/device dupe exploits
if (_loadOut#5 isNotEqualTo [] and { backpack _unit != _loadOut#5#0 }) then { _loadOut set [5, []] };
_unit setUnitLoadout _loadOut;

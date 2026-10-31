params ["_unit"];

if (!local _unit) exitWith {};
if (_unit getVariable "respawning") exitWith {};
if (_unit != _unit getVariable ["owner",_unit]) exitWith {};
if (!isPlayer _unit) exitWith {};

_unit setVariable ["respawning",true];
private _layer = ["A3A_infoCenter"] call BIS_fnc_rscLayer;
[localize "STR_antistasi_respawn",0,0,3,0,0,_layer] spawn bis_fnc_dynamicText;

if (!isNil "respawnMenu") then {(findDisplay 46) displayRemoveEventHandler ["KeyDown", respawnMenu]};

if (captive _unit) then {
	[_unit,false] remoteExec ["setCaptive",0,_unit]; 
	_unit setCaptive false;
};

_unit setVariable ["respawning",false];
_unit setDamage 1;

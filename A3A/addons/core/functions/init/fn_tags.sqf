//////////////////////////////////////////////////////////////////
// Function file for Armed Assault II
// Created by: Marker and Melbo
//////////////////////////////////////////////////////////////////

if (isDedicated) exitWith {};

#define _refresh 0.34
#define _distance 300

private _layer = ["A3A_tags"] call BIS_fnc_rscLayer;

while{ true } do {
   // PLAYER NAME CHECK AND DISPLAY
	_target = cursorTarget;
	if (_target isKindOf "CAManBase" && player == vehicle player) then{
			if((side _target == playerSide) && ((player distance _target) < _distance))then {
			_weaponsplayer = weapons _target;
			_name = name _target;
			_nameString = "<t size='0.5' shadow='2' color='#7FFF00'>" + format['%1',_target getVariable ['unitname', name _target]] + "</t>";
			_rank = [_target,"displayNameShort"] call BIS_fnc_rankParams;
			if (count _weaponsPlayer > 0) then {
				_weaponsplayer =  _weaponsplayer select 0;
				_weaponsplayername = getText (configFile >> "CfgWeapons" >> _weaponsplayer >> "displayname");
				_weaponspic = getText (configFile >> "CfgWeapons" >> _weaponsplayer >> "picture");

			// PRINT THE RANK/NAME/WEAPON ONSCREEN
			_nameString = format ["<t size='0.5' color='#f0e68c'>%4. </t><t size='0.5' color='#f0e68c'>%1</t><br/><t size='0.5' color='#f0e68c'>%2</t><br/><img size='0.8' image='%3'/><br/>",_name, _weaponsplayername,_weaponspic,_rank];
			} else {
				_nameString = format ["<t size='0.5' color='#f0e68c'>%2. </t><t size='0.5' color='#f0e68c'>%1</t>",_name,_rank];
			};
			[_nameString,0.5,0.9,_refresh,0,0,_layer] spawn bis_fnc_dynamicText;
		};
	};

    sleep _refresh;
};
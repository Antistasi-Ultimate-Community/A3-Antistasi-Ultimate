params ["_typeUnit"];

if !(player call A3A_fnc_isMember) exitWith {[localize "STR_A3A_reinf_reinfPlayer_header", localize "STR_A3A_reinf_reinfPlayer_only_members"] call A3A_fnc_customHint;};

if (recruitCooldown > time) exitWith {[localize "STR_A3A_reinf_reinfPlayer_header", format [localize "STR_A3A_reinf_reinfPlayer_cooldown",round (recruitCooldown - time)]] call A3A_fnc_customHint;};

if (player != player getVariable ["owner",player]) exitWith {[localize "STR_A3A_reinf_reinfPlayer_header", localize "STR_A3A_reinf_reinfPlayer_aicontrol"] call A3A_fnc_customHint;};

if ([getPosATL player] call A3A_fnc_enemyNearCheck) exitWith {[localize "STR_A3A_reinf_reinfPlayer_header", localize "STR_A3A_reinf_reinfPlayer_enemy_near"] call A3A_fnc_customHint;};

if (player != leader group player) exitWith {[localize "STR_A3A_reinf_reinfPlayer_header", localize "STR_A3A_reinf_reinfPlayer_no_leader"] call A3A_fnc_customHint;};

private _hr = server getVariable "hr";

if (_hr < 1) exitWith {[localize "STR_A3A_reinf_reinfPlayer_header", localize "STR_A3A_reinf_reinfPlayer_no_hr"] call A3A_fnc_customHint;};
private _costs = server getVariable _typeUnit;
private _resourcesFIA = player getVariable ["moneyX", 0];

if (_costs > _resourcesFIA) exitWith {[localize "STR_A3A_reinf_reinfPlayer_header", format [localize "STR_A3A_reinf_reinfPlayer_no_money", _costs, A3A_faction_civ get "currencySymbol"]] call A3A_fnc_customHint;};

if ((count units group player) + (count units stragglers) > 9) exitWith {[localize "STR_A3A_reinf_reinfPlayer_header", localize "STR_A3A_reinf_reinfPlayer_full_squad"] call A3A_fnc_customHint;};

// private _weaponHM = createHashMapFromArray [
// 	[A3A_faction_reb get "unitSniper", "SniperRifles"],
// 	[A3A_faction_reb get "unitLAT", "RocketLaunchers"],
// 	[A3A_faction_reb get "unitMG", "MachineGuns"],
// 	[A3A_faction_reb get "unitGL", "GrenadeLaunchers"],
// 	[A3A_faction_reb get "unitAA", "MissileLaunchersAA"],
// 	[A3A_faction_reb get "unitAT", "MissileLaunchersAT"]
// ];

// if (A3A_rebelGear getOrDefault [_weaponHM getOrDefault [_typeUnit, ""], false] isEqualTo []) exitWith {
// 	[localize "STR_A3A_reinf_reinfPlayer_header", localize "STR_A3A_reinf_reinfPlayer_no_weapons_equip"] call A3A_fnc_customHint;
// };

private _unit = [group player, _typeUnit, position player, [], 0, "NONE"] call A3A_fnc_createUnit;

private _hrCost = 1;

switch (_typeUnit) do {
    case "loadouts_reb_militia_Rifleman": { _hrCost = rifle_hr_cost; };
    case "loadouts_reb_militia_Grenadier": { _hrCost = GL_hr_cost; };
    case "loadouts_reb_militia_ExplosivesExpert": { _hrCost = EXP_hr_cost; };
    case "loadouts_reb_militia_MachineGunner": { _hrCost = MG_hr_cost; };
    case "loadouts_reb_militia_LAT": { _hrCost = LAT_hr_cost; };
    case "loadouts_reb_militia_AT": { _hrCost = AT_hr_cost; };
    case "loadouts_reb_militia_AA": { _hrCost = AA_hr_cost; };
    case "loadouts_reb_militia_Medic": { _hrCost = MED_hr_cost; };
    case "loadouts_reb_militia_Engineer": { _hrCost = ENG_hr_cost; };
    case "loadouts_reb_militia_Sniper": { _hrCost = Sniper_hr_cost; };
    default { _hrCost = 1; };
};

[-_hrCost, 0] remoteExec ["A3A_fnc_resourcesFIA",2];
[-_costs] call A3A_fnc_resourcesPlayer;
[localize "STR_A3A_reinf_reinfPlayer_header", localize "STR_A3A_reinf_reinfPlayer_success"] call A3A_fnc_customHint;

[_unit] spawn A3A_fnc_FIAinit;
_unit disableAI "AUTOCOMBAT";
sleep 1;
petros directSay "SentGenReinforcementsArrived";

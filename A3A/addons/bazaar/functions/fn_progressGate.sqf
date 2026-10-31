// SERVER: the "Rarity gate by war tier" setting (v1.1.0) - the highest
// rarity a trader may roll right now, as [single items & vehicles, bulk
// crates]. Rarity tiers: 0 Common, 1 Uncommon, 2 Rare, 3 Exotic.
//   Off:    everything, always
//   Gentle: Rare items from war tier 3, Exotic from 5; Rare crates from 4, Exotic crates from 6
//   Strict: Rare items from war tier 4, Exotic from 7; Rare crates from 6, Exotic crates from 8
// Outside Antistasi (no war tier) there is no gate.
private _mode = missionNamespace getVariable ["ABZ_progression", 0];
if (!(_mode isEqualType 0) || {_mode <= 0} || {!(call ABZ_fnc_isAntistasi)}) exitWith { [3, 3] };
private _t = missionNamespace getVariable ["tierWar", 1];
if !(_t isEqualType 0) then { _t = 1 };
(([[3, 5, 4, 6], [4, 7, 6, 8]]) select ((_mode min 2) - 1)) params ["_rare", "_exotic", "_rareCrate", "_exoticCrate"];
[
	[1, [2, 3] select (_t >= _exotic)] select (_t >= _rare),
	[1, [2, 3] select (_t >= _exoticCrate)] select (_t >= _rareCrate)
]

// War-tier progress as 0..1 (tier 1 = 0, tier 10 = 1) when Antistasi is
// running and "Stock grows with war tier" is ON; otherwise the tier-5
// baseline (0.45) so the sliders mean what they say.
if !(missionNamespace getVariable ["ABZ_tierScaling", true]) exitWith { 0.45 };
private _t = missionNamespace getVariable ["tierWar", -1];
if (!(_t isEqualType 0) || {_t < 1}) exitWith { 0.45 };
(((_t min 10) - 1) / 9) max 0

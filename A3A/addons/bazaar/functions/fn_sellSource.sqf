// Client: what "SELL from vehicle / crate" sells out of (v1.1.1): the nearest
// vehicle with cargo space within 15m of the player (the same one "Into
// vehicle nearby" delivers to), otherwise the nearest crate, box or ground
// holder within 6m. objNull when there's none (fn_sellBoxOk decides).
private _v = call ABZ_fnc_cargoTarget;
if (!isNull _v && {[_v] call ABZ_fnc_sellBoxOk}) exitWith { _v };
private _boxes = (nearestObjects [player, ["ReammoBox_F", "WeaponHolder", "Cargo_base_F"], 6]) select { [_x] call ABZ_fnc_sellBoxOk };
_boxes param [0, objNull]

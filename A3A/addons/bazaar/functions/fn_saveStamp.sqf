// SERVER: Antistasi's stamp of its most recent save - the real-world time
// it was made ("saveTime", written by every Antistasi save) - as a string.
// "" when there is none yet, or no Antistasi save system. Cheap (one
// getVariable), so it can be checked every frame (fn_syncCommit).
if (isNil "A3A_fnc_returnSavedStat" || {isNil "A3A_saveTarget"}) exitWith { "" };
private _v = ["saveTime"] call A3A_fnc_returnSavedStat;
if (isNil "_v") then { "" } else { str _v }

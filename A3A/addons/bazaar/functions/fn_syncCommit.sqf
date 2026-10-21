// SERVER, unscheduled: has Antistasi saved since the Bazaar last committed?
// Then commit the Bazaar NOW, in one uninterrupted step, before anything
// else changes. Checked every frame (an EachFrame handler set up at boot by
// fn_queueSave) and as the first thing in every handler that changes what
// the Bazaar saves (buy, sell, unpack, reset) - so a purchase landing in the
// same frame as Antistasi's save can never get into the Bazaar save while
// its money is missing from Antistasi's, and a host who saves and quits at
// once still has both saves agree.
// Does nothing outside Antistasi (ABZ_saveStampLast is never set there).
#include "..\script_component.hpp"
if (!isServer || {isNil "ABZ_saveStampLast"}) exitWith {};
private _now = call ABZ_fnc_saveStamp;
if (_now isEqualTo ABZ_saveStampLast) exitWith {};
ABZ_saveStampLast = _now;
ABZ_saveDirty = false;
isNil { call ABZ_fnc_save };
Info("[ABZ] Antistasi saved - Bazaar state committed with it");

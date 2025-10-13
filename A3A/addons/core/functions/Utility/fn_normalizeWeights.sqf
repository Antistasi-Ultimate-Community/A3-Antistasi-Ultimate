params ["_weightedList"];

if (!(_weightedList isEqualType []) || {!((_weightedList select 1) isEqualType 0)}) exitWith {};

private _totalWeight = 0;  
{ _totalWeight = _totalWeight + _x } forEach (_weightedList select {_x isEqualType 1}); 
_weightedList apply {if (_x isEqualType 1) then {_x / _totalWeight} else {_x}};
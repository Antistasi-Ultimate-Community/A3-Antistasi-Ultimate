// SERVER: makes sure a trader entry has every field this version uses
// (older saves are shorter). Pads in place and returns the entry.
//   12 job []   13 smuggling-run offer []   14 restock count the offer was rolled for (-1)
//   15 the offer was taken this rotation (false)
// See fn_vendorCreate for the full layout.
params [["_e", [], [[]]]];
if (_e isEqualTo []) exitWith { _e };
while { count _e < 13 } do { _e pushBack [] };
if (count _e < 14) then { _e pushBack [] };
if (count _e < 15) then { _e pushBack -1 };
if (count _e < 16) then { _e pushBack false };
if !((_e select 12) isEqualType []) then { _e set [12, []] };
if !((_e select 13) isEqualType []) then { _e set [13, []] };
if !((_e select 14) isEqualType 0) then { _e set [14, -1] };
if !((_e select 15) isEqualType false) then { _e set [15, false] };
_e

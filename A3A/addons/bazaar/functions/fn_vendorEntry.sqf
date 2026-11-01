// SERVER: the live entry array for a trader id (by reference), or [].
params [["_id", -1, [0]]];
if (_id isEqualTo ABZ_legacyVendorId) exitWith { ABZ_legacyVendorEntry };
private _i = ABZ_vendors findIf { (_x select 0) == _id };
if (_i < 0) exitWith { [] };
ABZ_vendors select _i

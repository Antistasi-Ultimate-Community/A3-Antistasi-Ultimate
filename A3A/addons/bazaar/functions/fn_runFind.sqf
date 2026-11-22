// SERVER: index of the active smuggling run held by this player UID, or -1.
params [["_uid", "", [""]]];
if (_uid == "") exitWith { -1 };
ABZ_runs findIf { (_x select 1) == _uid }

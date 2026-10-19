// Client: my Wanted List - up to ten pinned class names, kept in my
// profile so they follow me between campaigns and servers.
private _l = profileNamespace getVariable ["ABZ_wanted", []];
if !(_l isEqualType []) then { _l = [] };
(_l select { _x isEqualType "" && {_x != ""} && {[_x] call ABZ_fnc_wantedValid} }) select [0, ABZ_wantedMax]

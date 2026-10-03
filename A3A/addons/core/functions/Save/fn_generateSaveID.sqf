// Create new campaign ID, avoiding collisions
private _allIDs = call A3A_fnc_collectSaveData apply { _x get "gameID" };
private _newID = str(floor(random(90000) + 10000));
while { _newID in _allIDs } do { _newID = str(floor(random(90000) + 10000)) };

_newID

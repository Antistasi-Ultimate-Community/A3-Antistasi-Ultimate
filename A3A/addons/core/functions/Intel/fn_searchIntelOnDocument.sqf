params ["_intel"];

/*  Handles the retrieving of medium intel
*   Params:
*       _intel : OBJECT : The object which is holding the intel
*
*   Returns:
*       Nothing
*/

//Take intel from desk
private _side = _intel getVariable "side";
[(localize "STR_intel_search_intel_header"), (localize "STR_intel_documents_taken_description")] call A3A_fnc_customHint;
["Medium", _side] remoteExec ["A3A_fnc_selectIntel", 2];
{
    [5,_x] call A3A_fnc_addScorePlayer;
    [100,_x] call A3A_fnc_addMoneyPlayer;
} forEach ([50,0,_intel,teamPlayer] call A3A_fnc_distanceUnits);
deleteVehicle _intel;

/*
    Author:
        Creep'nCrunch
    
    Description:
        Updates the occupier / invader faction data hashmaps (e.g. A3A_faction_occ / A3A_faction_inv) vehicles according to war level.
    
    Params:
        N/A
    
    Dependencies:
        N/A
    
    Scope:
        Server
    
    Environment:
        Unscheduled
    
    Usage:
		[] call A3U_fnc_updateVehiclesData;
    
    Return:
        N/A
*/

{
	private _data = + _x;
	private _vehiclesData = _data get "vehiclesData";
	if (isNil "_vehiclesData") then { continue };
	
	{
		_data set [_x, _y];
	} forEach (_vehiclesData call SCRT_fnc_unit_getTiered);

	call A3A_fnc_compileMissionAssets;
	{
    	publicVariable ("A3A_faction_"+_x);
	} forEach ["occ", "inv", "all"];
} forEach [A3A_faction_occ, A3A_faction_inv];
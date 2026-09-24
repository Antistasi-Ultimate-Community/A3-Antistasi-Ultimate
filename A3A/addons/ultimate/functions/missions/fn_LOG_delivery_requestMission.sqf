/*
    Author:
        Silence
    
    Description:
        Gets relevant zones to hopefully request a delivery mission starting from _origin
        Currently attached to the black market/arms dealer. Works anywhere, really, as the BM controls all trade anyway
    
    Params:
        _origin <STRING>
    
    Dependencies:
        outposts | seaports | milbases | airportsX | factories | resourcesX
        watchpostsFIA | roadblocksFIA | hmgPostsFIA | aaPostsFIA | atPostsFIA
        traderMarker
    
    Scope:
        Server
    
    Environment:
        Unscheduled
    
    Usage:
        [traderMarker] call A3U_fnc_LOG_delivery_requestMission;
    
    Return:
        N/A
*/

#define HINT_HEADER_BM localize "STR_A3U_HOVER_BLACK_MARKET"

params [["_origin", ""]];

private _hasBeenRequested = missionNamespace getVariable ["A3A_cargo_hasBeenRequested", false];
if (_hasBeenRequested) exitWith {[HINT_HEADER_BM, localize "STR_chats_mission_request_already_type"] remoteExec ["A3A_fnc_customHint", 0, false]};

private _areas = (outposts + seaports + milbases + airportsX + factories + resourcesX); // + citiesX?
private _friendlyAreasAI = (watchpostsFIA + roadblocksFIA + hmgPostsFIA + aaPostsFIA + atPostsFIA);
private _friendlyAreasOwned = (_areas select {sidesX getVariable [_x, sideUnknown] isEqualTo teamPlayer});
private _friendlyAreas = (_friendlyAreasAI + _friendlyAreasOwned);

if (!isNil "traderMarker") then {_friendlyAreas pushBack traderMarker};

if (_origin isEqualTo "") then {
    _origin = selectRandom (_friendlyAreas + "Synd_HQ");
};

private _originPos = getMarkerPos _origin;

_friendlyAreas deleteAt (_friendlyAreas find _origin); // Just incase to prevent stupidity
private _destinationAreas = _friendlyAreas select {((getMarkerPos _x) distance2D _originPos) >= distanceMission}; // We want to find FAR targets first, ideally
if (_destinationAreas isEqualTo []) then {_destinationAreas = _friendlyAreas};
if (_destinationAreas isEqualTo []) exitWith { // If we're STILL empty then RIP
    [
        HINT_HEADER_BM,
        localize "STR_A3A_Missions_LOG_Delivery_request_fail_viability_text"
    ] remoteExec ["A3A_fnc_customHint", 0, false]
};

private _destination = selectRandom _destinationAreas;

[[_origin, _destination], "A3A_fnc_LOG_Delivery"] remoteExec ["A3A_fnc_scheduler", 2];

[600] spawn A3U_fnc_LOG_delivery_requestCooldown; // 600 usual (10 minutes), prob best to make it a param
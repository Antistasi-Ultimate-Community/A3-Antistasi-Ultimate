#include "..\defines.inc"
FIX_LINE_NUMBERS()

private _posBase = getMarkerPos respawnTeamPlayer;
_potentials = [];

private _sites = citiesX select {
    private _markerPos = getMarkerPos _x; 
    sidesX getVariable [_x,sideUnknown] != teamPlayer && {(getMarkerPos _x distance2D getMarkerPos respawnTeamPlayer < distanceMission)}
};

//fallback in case nothing would be found
if (_sites isEqualTo []) then {
    _sites = citiesX;
};

private _missionSite = selectRandom _sites;

Info_1("Using %1 as rivals site",_missionSite);

isRivalsDiscoveryQuestAssigned = true;
publicVariable "isRivalsDiscoveryQuestAssigned";

[[_missionSite],"A3A_fnc_RIV_ENC_Rivals"] remoteExec ["A3A_fnc_scheduler",2];

#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

if (disableTrader) exitWith {};

if (isTraderQuestAssigned || isTraderQuestCompleted) exitWith {
    Warning("Something tries to call for Arms Dealer quest again, aborting...");
};

isTraderQuestAssigned = true;
publicVariable "isTraderQuestAssigned";

private _posbase = getMarkerPos respawnTeamPlayer;
private _potentials = [];

private _sites = (controlsX select {!(isOnRoad getMarkerPos _x) && {sidesX getVariable [_x,sideUnknown] != teamPlayer}});

if (count _sites > 0) then {
    for "_i" from 0 to ((count _sites) - 1) do {
        private _siteX = _sites select _i;
        private _pos = getMarkerPos _siteX;

       if (_pos distance _posbase < distanceMission * 2) then {
           _potentials pushBack _siteX;
       };
    };
};

if (count _potentials < 1) then {
    //hope there are no maps without controls
    private _defaultSite = controlsX select 0;
    _potentials pushBack _defaultSite;
};

[[(selectRandom _potentials)],"A3A_fnc_ENC_Trader"] remoteExec ["A3A_fnc_scheduler",2];
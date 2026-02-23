#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];

private _mrkD = format ["Dum%1",_marker];
private _mrkSide = sidesX getVariable _marker;
private _faction = Faction(_mrkSide);

if (_marker in airportsX) then {
    _mrkD setMarkerTypeLocal (_faction get "flagMarkerType");
    _mrkD setMarkerColorLocal "Default";
} else {
    if (_marker in destroyedSites and _marker in citiesX) exitWith { _mrkD setMarkerColorLocal "ColorBlack" };
    if (_mrkSide == teamPlayer) exitWith {
        if (_marker in milbases) then {
            _mrkD setMarkerTypeLocal "A3AU_milbase_mrk_I";
        };
        if (_marker in seaports) then {
            _mrkD setMarkerTypeLocal "A3AU_seaport_mrk_I";
        };
        _mrkD setMarkerColorLocal colorTeamPlayer;
    };

    if (_marker in milbases) then {
        private _markerType = if (_mrkSide == Invaders) then {"A3AU_milbase_mrk_O"} else {"A3AU_milbase_mrk_B"};
        _mrkD setMarkerTypeLocal _markerType;
    };
    if (_marker in seaports) then {
        private _markerType = if (_mrkSide == Invaders) then {"A3AU_seaport_mrk_O"} else {"A3AU_seaport_mrk_B"};
        _mrkD setMarkerTypeLocal _markerType;
    };

    _mrkD setMarkerColorLocal ([colorOccupants, colorInvaders] select (_mrkSide == Invaders));
};
private _positionX = getMarkerPos (_mrkD);

private _mrkText = call {
    if (_marker in airportsX) exitWith {
        private _airfieldNames = (localize "STR_A3AU_airfieldNames") splitString "|";
        private _markerIndex = airportsX find _marker;
        private _airfieldName = if (_markerIndex >= 0 && _markerIndex < count _airfieldNames) then {
            _airfieldNames select _markerIndex
        } else {
            ""
        };
        format [localize "STR_airbase", _faction get "name", _airfieldName]
    };
    if (_marker in outposts) exitWith {
        private _outpostNames = (localize "STR_A3AU_outpostNames") splitString "|";
        private _markerIndex = outposts find _marker;
        private _outpostName = if (_markerIndex >= 0 && _markerIndex < count _outpostNames) then {
            _outpostNames select _markerIndex
        } else {
            ""
        };
        format [localize "STR_outpost", _outpostName]
    };
    if (_marker in resourcesX) exitWith { format [localize "STR_resources", [citiesX, _positionX] call BIS_fnc_nearestPosition] };
    if (_marker in factories) exitWith { format [localize "STR_factory", [citiesX, _positionX] call BIS_fnc_nearestPosition] };
    if (_marker in milbases) exitWith {
        private _milbaseNames = (localize "STR_A3AU_milbaseNames") splitString "|";
        private _markerIndex = milbases find _marker;
        private _milbaseName = if (_markerIndex >= 0 && _markerIndex < count _milbaseNames) then {
            _milbaseNames select _markerIndex
        } else {
            ""
        };
        format [localize "STR_milbase", _milbaseName]
    };
    if (_marker in seaports) exitWith {
        private _seaportNames = (localize "STR_A3AU_seaportNames") splitString "|";
        private _markerIndex = seaports find _marker;
        private _seaportName = if (_markerIndex >= 0 && _markerIndex < count _seaportNames) then {
            _seaportNames select _markerIndex
        } else {
            ""
        };
        if (toLowerANSI worldName in ["enoch", "vn_khe_sanh", "esseker"]) then {
            format [localize "STR_port_river", _seaportName]
        } else {
            format [localize "STR_port_sea", _seaportName]
        };
    };
    ""; // city
};

if (_mrkSide == teamPlayer) then {
    private _numTroops = count (garrison getVariable [_marker, []]);
    private _limit = [_marker] call A3A_fnc_getGarrisonLimit;
    if (_numTroops > 0) then {
        _mrkText = format ["%1: %2%3",
            _mrkText,
            _numTroops,
            if (_limit != -1) then {format ["/%1", _limit]} else {""}
        ];
    };
};

A3A_localMarkerText set [_mrkD, _mrkText];
_mrkD setMarkerText _mrkText;
_mrkD setMarkerShadow true;
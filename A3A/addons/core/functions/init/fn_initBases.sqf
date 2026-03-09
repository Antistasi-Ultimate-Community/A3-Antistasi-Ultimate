#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Info("InitBases started");

// This is called pre-setup so that the map looks vaguely plausible

// private _hideEnemyMarkers = missionNamespace getVariable ["A3U_setting_hideEnemyMarkers",false];

private _fnc_initMarkerList =
{
	params ["_mrkCSAT", "_markers", "_mrkType", "_mrkText", ["_useSideName", false]];

	{
        private _isInvader = _x in _mrkCSAT;
		private _pos = getMarkerPos _x;
		private _mrkD = createMarkerLocal [format ["Dum%1", _x], _pos];
		_mrkD setMarkerShapeLocal "ICON";

        switch (true) do 
        {
            case (_x in airportsX): 
            {
                _mrkD setMarkerTypeLocal (["flag_NATO", "flag_CSAT"] select _isInvader);
                _mrkD setMarkerColorLocal "Default";
            };
            case (_x in milbases): 
            {
                _mrkD setMarkerTypeLocal (["A3AU_milbase_mrk", "A3AU_milbase_mrk"] select _isInvader);
                _mrkD setMarkerColorLocal ([colorOccupants, colorInvaders] select _isInvader);
            };
            case (_x in seaports): 
            {
                _mrkD setMarkerTypeLocal "A3AU_seaport_mrk";
                _mrkD setMarkerColorLocal ([colorOccupants, colorInvaders] select _isInvader);
            };
            default 
            {
                _mrkD setMarkerTypeLocal _mrkType;
                _mrkD setMarkerColorLocal ([colorOccupants, colorInvaders] select _isInvader);
            };
        };

        // if (hideEnemyMarkers && {!(_x in airportsX)}) then {
        //     _mrkD setMarkerAlpha 0;
        // };

        _mrkD setMarkerText format [_mrkText, [localize "STR_A3A_initBases_occ", localize "STR_A3A_initBases_inv"] select _isInvader];

        // arguable whether this should be done here? could be delayed until game start
        sidesX setVariable [_x, [Occupants, Invaders] select _isInvader, true];
        garrison setVariable [_x, [], true];
		if (_useSideName) then {             // in this case it's an airport or outpost
			killZones setVariable [_x, [], true];
			server setVariable [_x, 0, true];           // TODO: check if these two need to be global
        };

		[_x, _roadblockPositions] call A3A_fnc_generateRoadblock;

	} forEach _markers;
};


private _mapInfoRoot = if (isClass (missionConfigFile/"A3A"/"mapInfo"/toLower worldName)) then {missionConfigFile} else {configFile};
getArray (_mapInfoRoot/"A3A"/"mapInfo"/toLower worldName/"garrison") params ["", ["_mrkCSAT",[],[[]]], "", ["_controlsCSAT",[],[[]]]];

// This only sets the sides for mission-file roadblocks. Generated ones are handled by generateRoadblock
private _controlsNATO = controlsX - _controlsCSAT;
{sidesX setVariable [_x, Occupants, true]} forEach _controlsNATO;
{sidesX setVariable [_x, Invaders, true]} forEach _controlsCSAT;

private _roadblockPositions = controlsX apply { markerPos _x };

[_mrkCSAT, airportsX, "flag_NATO", localize "STR_airbase", true] call _fnc_initMarkerList;
[_mrkCSAT, resourcesX, "A3AU_resource_mrk", localize "STR_resources"] call _fnc_initMarkerList;
[_mrkCSAT, factories, "A3AU_factory_mrk", localize "STR_factory"] call _fnc_initMarkerList;
[_mrkCSAT, outposts, "A3AU_outpost_mrk", localize "STR_outpost", true] call _fnc_initMarkerList;
[_mrkCSAT, milbases, "A3AU_milbase_mrk", localize "STR_milbase", true] call _fnc_initMarkerList;

private _portName = [
    localize "STR_port_sea",
    localize "STR_port_river"
] select (toLowerANSI worldName in ["enoch", "vn_khe_sanh", "esseker", "sefrouramal"]);
[_mrkCSAT, seaports, "b_naval", _portName] call _fnc_initMarkerList;

Info("InitBases completed");

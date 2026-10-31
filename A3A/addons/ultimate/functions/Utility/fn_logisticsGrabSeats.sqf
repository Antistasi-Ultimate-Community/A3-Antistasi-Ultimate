/*
    Author:
    Silence

    Description:
    Handles grabbing seats and drawing them.

    Params:
	_vehicle    <OBJECT>
	_unit       <OBJECT> <DEFAULT: player>

    Usage:
    [_vehicle, _unit] call A3U_fnc_logisticsGrabSeats;

    If you want to overwrite these, add these variables just after you call the script.
    For example:
    [cursorObject] call A3U_fnc_logisticsGrabSeats;
    textSize = 0.1;
    iconSize = 2;
    colour = [0,1,0,1];
*/

params [
	["_vehicle", cursorObject],
	["_unit", player]
];

textSize = 0.05;
iconSize = 1.5;
colour = [1,1,1,0.8];

if (_vehicle getVariable ["A3U_helper_logisticsDrawer", ""] isNotEqualTo "") then {
    removeMissionEventHandler ["Draw3D", _vehicle getVariable "A3U_helper_logisticsDrawer"];
};

private _selections = _vehicle selectionNames "FireGeometry";

private _selectionsNames = [];

private _selectionsCoords = [];

{
    private _inModelPosition = _vehicle selectionPosition [_x, "FireGeometry", "FirstPoint"];

	private _splitSelections = _x splitString "";
	private _splitSelection = parseNumber ((_splitSelections select -3) + (_splitSelections select -2) + (_splitSelections select -1)) - 1; // get the last 3 numbers, - 1
	private _splitSelection = str _splitSelection; // I forgot the index starts at 0, so technically it's been outputting the seat index + 1...

    if !("cargo" in _x && {!("gunner" in _x)}) then {} else {
        _selectionsCoords pushBack _inModelPosition;
        _selectionsNames pushBack _splitSelection;
    };
} forEach _selections;

hint str _selectionsCoords;

canDraw = true;

private _helperID = addMissionEventHandler ["Draw3D",{
    private _selectionsNames = (_thisArgs select 0);
    private _selectionsCoords = (_thisArgs select 1);
    private _vehicle = (_thisArgs select 2);
    if (canDraw) then {
        hintSilent str [_selectionsNames, _selectionsCoords, _vehicle];
        {
            _name = _selectionsNames select _forEachIndex;
            drawIcon3D [
                "a3\ui_f\data\Map\Markers\Military\dot_ca.paa",
                colour,
                _vehicle modelToWorldVisual (_selectionsCoords select _forEachIndex),
                iconSize,iconSize,0,
                _name,
                0,
                textSize
            ];
        } forEach _selectionsCoords;
    };
}, [_selectionsNames, _selectionsCoords, _vehicle]];

_vehicle setVariable ["A3U_helper_logisticsDrawer", _helperID];
// private _crew = fullCrew _vehicle;

// private _seats = _vehicle emptyPositions "Cargo";

// if (_crew isEqualTo []) then {
// 	for "_i" from 0 to _seats - 1 do {
// 		private _vehicleUnit = (createGroup side _unit) createUnit ["B_Soldier_F", position _unit, [], 0, "FORM"];
// 		_vehicleUnit moveInCargo _vehicle;
// 	};
// };

// private _crew = fullCrew _vehicle;

// private _seatIndexes = [];

// {
//   _seatIndexes pushBack (_x select 2);
// } forEach _crew;

// hint str _seatIndexes;

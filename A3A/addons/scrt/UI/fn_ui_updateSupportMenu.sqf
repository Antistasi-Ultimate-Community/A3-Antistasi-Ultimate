disableSerialization;

private _display = findDisplay 60000;
if (str (_display) != "no display") then {
    private _supportControl = _display displayCtrl 1702;
	_supportControl ctrlSetText format [(localize "STR_commander_menu_abilities_available_supports" + " %1" + "/%2"), supportPoints, maxSupportPoints];

    if (supportPoints < 1) then {
        _supportControl ctrlSetTextColor [1, 0, 0, 1];
    };

    private _airstrikesControl = _display displayCtrl 1703;
	_airstrikesControl ctrlSetText format [
        (localize "STR_commander_menu_abilities_available_airstrikes" + " %1" + "/%2"), 
        (floor bombRuns), 
        (({sidesX getVariable [_x,sideUnknown] == teamPlayer} count airportsX) * 2)
    ];

    if (bombRuns < 1) then {
        _airstrikesControl ctrlSetTextColor [1, 0, 0, 1];
    };

    private _airportsControl = _display displayCtrl 1704;
    private _airports = { sidesX getVariable [_x, sideUnknown] isEqualTo teamPlayer } count airportsX;
	_airportsControl ctrlSetText format [(localize "STR_commander_menu_abilities_captured_airports" + " %1" + "/%2"), _airports, (count airportsX)];

    if (_airports < 1) then {
        _airportsControl ctrlSetTextColor [1, 0, 0, 1];
    };
};

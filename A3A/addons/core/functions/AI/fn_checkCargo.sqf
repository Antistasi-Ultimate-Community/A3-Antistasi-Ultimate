params ["_target", "_playerX"];

private _destination = _target getVariable ["A3A_cargo_deliveryDestination", ""];

if (_destination isEqualTo "") exitWith {
    [localize "STR_A3U_HOVER_BLACK_MARKET", localize "STR_A3A_Missions_LOG_Delivery_search_fail_text"] remoteExec ["A3A_fnc_customHint", _playerX];
};

private _destinationName = format ["%1 (%2)", ([_destination] call A3A_fnc_localizar), (mapGridPosition getMarkerPos _destination)];

[localize "STR_A3U_HOVER_BLACK_MARKET", format [localize "STR_A3A_Missions_LOG_Delivery_search_text", _destinationName]] remoteExec ["A3A_fnc_customHint", _playerX];
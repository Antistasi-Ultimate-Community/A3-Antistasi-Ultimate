private _membersText = "";

if (membershipEnabled) then {
	private _countN = 0;
	{
		_playerX = _x getVariable ["owner",objNull];
		if (!isNull _playerX) then {
			if (_playerX call A3A_fnc_isMember) then {
				_membersText = format ["%1%2, ", _membersText, name _playerX]
			} else {
				_countN = _countN + 1
			};
		};
	} forEach (playableUnits);

	_membersText = format [localize "STR_commander_menu_server_members_guests", _membersText, _countN];
} else {
	_membersText = localize "STR_commander_menu_server_members_disabled";
};

_membersText

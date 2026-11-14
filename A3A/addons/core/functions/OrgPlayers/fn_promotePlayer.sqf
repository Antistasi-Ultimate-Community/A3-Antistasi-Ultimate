#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Debug("Working on player ranks");

private _textX = "Promoted Players:<br/><br/>";

private _promoted = false;
{
	private _player = _x getVariable ["owner", _x];
	private _pointsX = _player getVariable ["score",0];
	private _dataX = [_player] call A3A_fnc_numericRank;
	private _newRank = _dataX select 1;
	private _rank = _x getVariable ["rankX","PRIVATE"];
	if (_rank == "COLONEL") exitWith {};

	private _promotionThreshold = _newRank call SCRT_fnc_common_getPromotionThreshold;

	if (_promotionThreshold isEqualTo -1) exitWith {
		Error_2("Negative promotion threshold for %1 player and invalid rank %2",(name _player),_newRank);
	};

	if (_pointsX >= _promotionThreshold) then {
		Info_3("Promoting %1 player (Current Rank: %2) to new %3.",(name _player),_rank,_newRank);
		_promoted = true;
		[_player,_newRank] remoteExec ["A3A_fnc_ranksMP"];
		_player setVariable ["rankX",_newRank,true];
		_textX = format ["%1%2: %3.<br/>",_textX, name _player, _newRank];
		sleep 5;
	};
} forEach ((call A3A_fnc_playableUnits) select {(side (group _x) in [teamPlayer, civilian])});

Debug(_textX);

if (_promoted) then {
	_textX = format [localize "STR_hints_promotion_congrats",_textX];
	[petros,"hint",_textX, localize "STR_hints_promotion_header"] remoteExec ["A3A_fnc_commsMP"];
};

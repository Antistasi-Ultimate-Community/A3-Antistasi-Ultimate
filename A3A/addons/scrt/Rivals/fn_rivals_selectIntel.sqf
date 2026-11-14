/*
Maintainer: Socrates
    Randomly selects an intel, executes code tied to it, then returns message about corresponding intel.

Return Value:
    <STRING> Message for Intel Found notification

Scope: Server
Environment: Any
Public: Yes

Example:
[] call SCRT_fnc_rivals_selectIntel;
*/

params [
	["_excludeId", 0, [0]]
];

#define BANK_ACCOUNT    100
#define REDUCE_ACTIVITY 101
#define RIVALS_NETWORK  102
#define RIVALS_EXCLUDE	103

private _text = "";
private _rivalsName = A3A_faction_riv get "name";

if (!areRivalsEnabled) exitWith {};
if (areRivalsDefeated) exitWith {};

private _events = [
	[BANK_ACCOUNT, REDUCE_ACTIVITY, RIVALS_NETWORK, RIVALS_EXCLUDE],
	([BANK_ACCOUNT, REDUCE_ACTIVITY, RIVALS_NETWORK, RIVALS_EXCLUDE] select { _x != _excludeId })
] select (_excludeId isNotEqualTo 0);

private _weight = 1 / (count _events); 
private _eventsWithWeights = flatten (_events apply { [_x, _weight] });

private _intelContent = selectRandomWeighted _eventsWithWeights;

switch (_intelContent) do {
	case (BANK_ACCOUNT): {
		private _money = ((round (random 50)) + (10 * tierWar)) * 100;
		_text = format [(localize "STR_intel_select_rivals_bank_account"), [] call SCRT_fnc_misc_getWorldName];

		private _rebels = call SCRT_fnc_misc_getRebelPlayers;
		private _rebelsCount = count _rebels;

		if(_rebelsCount > 0) then {
			private _totalSalary = round ((random [400,500,800]) * _rebelsCount);
        	private _incomePerPlayer = round(_totalSalary / _rebelsCount);
			{
				[_incomePerPlayer,_x] call A3A_fnc_addMoneyPlayer;
			} forEach _rebels;
		};
	};
	case (REDUCE_ACTIVITY): {
		[15, ((100/baseRivalsDecay)/2)] call SCRT_fnc_rivals_reduceActivity;
		_text = format [(localize "STR_intel_select_reduce_activity"), _rivalsName, ([] call SCRT_fnc_misc_getWorldName)];
	};
	case (RIVALS_NETWORK): {
		_text = format [(localize "STR_intel_select_rivals_network_hideout"), _rivalsName];
		[] remoteExecCall ["SCRT_fnc_rivals_revealLocation", 2];
	};
	case (RIVALS_EXCLUDE): {
		private _locations = (citiesX + (controlsX select {!(isOnRoad getMarkerPos _x)})) select {!(_x in rivalsLocationsMap) && {!(_x in rivalsExcludedLocations)}};

		if (_locations isNotEqualTo []) then {
			private _location = selectRandom _locations;
			[_location] remoteExecCall ["SCRT_fnc_rivals_excludeLocation", 2];
			_text = format [(localize "STR_intel_select_rivals_exclusion"), _rivalsName, ([_location] call A3A_fnc_localizar)];
		} else {
			_text = [RIVALS_EXCLUDE] call SCRT_fnc_rivals_selectIntel;
		};
	};
};

[15] remoteExecCall ["SCRT_fnc_rivals_addProgressToRivalsLocationReveal", 2];

if (_text isNotEqualTo "") then {
    [_text, true] remoteExec ["A3A_fnc_showIntel", [civilian, teamPlayer]];
};

/*  Selects random Rivals event and then executes it on scheduler. 
    Execution on: Server

    Scope: Internal

    Params:
        <NUMBER> _excludeId - ability to exclude some event (for example - for rerolling event)

    Returns:
        Nothing
*/

#include "..\defines.inc"
FIX_LINE_NUMBERS()

#include "Constants.inc"

params [["_excludeId", 0]];

Info("Event condition has procced, selecting event...");
 
isRivalEventInProgress = true;

private _events = [
	[CARDEMO, UAVGRENADE, ROVINGMORTAR, HELIRAID , SKIRMISH_OCCVSRIV , SKIRMISH_POLICEVSRIV],
	([CARDEMO, UAVGRENADE, ROVINGMORTAR, HELIRAID ,SKIRMISH_OCCVSRIV , SKIRMISH_POLICEVSRIV] select { _x != _excludeId })
] select (_excludeId isNotEqualTo 0);

if ((A3A_faction_riv get "vehiclesRivalsUavs") isEqualTo []) then {
	_events deleteAt (_events find UAVGRENADE); 
};

private _weight = 1 / (count _events); 
private _eventsWithWeights = flatten (_events apply { [_x, _weight] });
private _eventType = selectRandomWeighted _eventsWithWeights;

switch (_eventType) do {
	case (CARDEMO): {
		[[], "SCRT_fnc_rivals_encounter_carDemo"] call A3A_fnc_scheduler;
	};
	case (UAVGRENADE): {
		[[], "SCRT_fnc_rivals_encounter_uavFlyby"] call A3A_fnc_scheduler;
	};
	case (ROVINGMORTAR): {
		[[], "SCRT_fnc_rivals_encounter_rovingMortar"] call A3A_fnc_scheduler;
	};
	case (HELIRAID): {
		[[], "SCRT_fnc_rivals_encounter_heliRaid"] call A3A_fnc_scheduler;
	};
	case (SKIRMISH_OCCVSRIV): {
		[[], "SCRT_fnc_rivals_encounter_OccVsRivalsSkirmish"] call A3A_fnc_scheduler;
	};
	case (SKIRMISH_POLICEVSRIV): {
		[[], "SCRT_fnc_rivals_encounter_policeVsRivalsskirmish"] call A3A_fnc_scheduler;
	};
};
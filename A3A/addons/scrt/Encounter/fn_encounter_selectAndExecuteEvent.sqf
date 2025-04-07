/*  Selects random event and then executes it on scheduler. 
    Execution on: Server

    Scope: Internal

    Params:
        <NUMBER> _excludeId - ability to exclude some event (for example - for rerolling event)

    Returns:
        Nothing
*/
#include "Constants.inc"
#include "..\defines.inc"
FIX_LINE_NUMBERS()

params [["_excludeId", -1]];


Info("Event condition has been procced, selecting event...");

private _events = [
	[CIV_HELI, CIV_PLANE, CIV_CONVOY, POLICE, VEH_MOVE, VEH_PATROL, VEH_POSTAMBUSH, VEH_SLINGLOADTRANSPORT, SKIRMISH_FRONTLINE],
	([CIV_HELI, CIV_PLANE, CIV_CONVOY, POLICE, VEH_MOVE, VEH_PATROL, VEH_POSTAMBUSH, VEH_SLINGLOADTRANSPORT, SKIRMISH_FRONTLINE] select { _x != _excludeId })
] select (_excludeId isNotEqualTo 0);

private _weight = 1 / (count _events); 
private _eventsWithWeights = flatten (_events apply { [_x, _weight] });
private _eventType = selectRandomWeighted _eventsWithWeights;

switch (_eventType) do {
	case (CIV_HELI): {
		[[], "SCRT_fnc_encounter_civHeli"] call A3A_fnc_scheduler;
	};
	case (CIV_PLANE): {
		[[], "SCRT_fnc_encounter_civPlane"] call A3A_fnc_scheduler;
	};
	case (CIV_CONVOY): {
		[[], "SCRT_fnc_encounter_fleeingCivConvoy"] call A3A_fnc_scheduler;
	};
	case (POLICE): {
		[[], "SCRT_fnc_encounter_police"] call A3A_fnc_scheduler;
	};
	case (VEH_MOVE): {
		[[], "SCRT_fnc_encounter_vehicleMove"] call A3A_fnc_scheduler;
	};
	case (VEH_PATROL): {
		[[], "SCRT_fnc_encounter_vehiclePatrol"] call A3A_fnc_scheduler;
	};
	case (VEH_POSTAMBUSH): {
		[[], "SCRT_fnc_encounter_postAmbush"] call A3A_fnc_scheduler;
	};
	case (VEH_SLINGLOADTRANSPORT): {
		[[], "SCRT_fnc_encounter_HeliSlingloadCargo"] call A3A_fnc_scheduler;
	};
	case (SKIRMISH_FRONTLINE): {
		[[], "SCRT_fnc_encounter_frontlineSkirmish"] call A3A_fnc_scheduler;
	}; //bam
};

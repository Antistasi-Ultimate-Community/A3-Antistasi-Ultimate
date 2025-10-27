/*
Maintainer: Socrates
    Chooses group for spawn depending on current inactivityLevel. Lower the value - better rivals group will be chosen.

Return Value:
    <ARRAY> [GROUP, VEHICLE]

Scope: Server
Environment: Any
Public: Yes
Dependencies:
    <NUMBER> inactivityLevelRivals

Example:
private _rivalsGroup = [] call SCRT_fnc_rivals_chooseGroupToSpawn;
*/

#include "..\defines.inc"
FIX_LINE_NUMBERS()

private _groupAndVehicleToSpawn = switch (inactivityLevelRivals) do {
	case 5: {
		[selectRandom (A3A_faction_riv get "groupsSentry"), ""]
	};
	case 4: {
		private _group = if (random 100 < ((100 - 20 * inactivityLevelRivals) max 0)) then {
			selectRandom (A3A_faction_riv get "groupsFireteam");
		} else {
			(selectRandom ((A3A_faction_riv get "groupsSentry") + (A3A_faction_riv get "groupsAA") + (A3A_faction_riv get "groupsAT")));
		};

		[_group, ""]
	};
	case 3: {
		private _group = if (random 100 < ((100 - 20 * inactivityLevelRivals) max 0)) then {
			selectRandom (A3A_faction_riv get "groupsSquad");
		} else {
			selectRandom ((A3A_faction_riv get "groupsFireteam") + (A3A_faction_riv get "groupsAA") + (A3A_faction_riv get "groupsAT"));
		};

		private _vehicle = if (random 100 < (((100 - 20 * inactivityLevelRivals) - 10) max 0)) then {
			selectRandomWeighted (FactionGetTieredFT(A3A_faction_riv, "vehiclesLightArmed", 0));
		} else {
			""
		};

		[_group, _vehicle]
	};
	case 2: {
		private _group = if (random 100 < ((100 - 20 * inactivityLevelRivals) max 0)) then {
			selectRandom (A3A_faction_riv get "groupsSquad");
		} else {
			selectRandom ((A3A_faction_riv get "groupsFireteam") + (A3A_faction_riv get "groupsAA") + (A3A_faction_riv get "groupsAT"));
		};

		private _vehicle = switch (true) do {
            case ((random 100) < 25): {
				selectRandomWeighted (FactionGetTieredFT(A3A_faction_riv, "vehiclesLightArmed", 0));
			};
			case ((random 100) < 15): {
				private _apcs = FactionGetTieredFT(A3A_faction_riv, "vehiclesAPCs", 0);
				if (_apcs isEqualTo []) then {
					selectRandomWeighted (FactionGetTieredFT(A3A_faction_riv, "vehiclesLightArmed", 0));
				} else {
					selectRandomWeighted _apcs;
				};
			};
			default {
				""
			};
		};

		[_group, _vehicle]
	};
	case 1: {
		private _group = selectRandom (A3A_faction_riv get "groupsSquad");
		private _vehicle = switch (true) do {
			case ((random 100) < 35): {
				selectRandomWeighted (FactionGetTieredFT(A3A_faction_riv, "vehiclesLightArmed", 0));
			};
            case ((random 100) < 25): {
				private _apcs = FactionGetTieredFT(A3A_faction_riv, "vehiclesAPCs", 0);
				if (_apcs isEqualTo []) then {
					selectRandomWeighted (FactionGetTieredFT(A3A_faction_riv, "vehiclesLightArmed", 0));
				} else {
					selectRandomWeighted _apcs;
				};
			};
            case ((random 100) < 15): {
				private _tanks = FactionGetTieredFT(A3A_faction_riv, "vehiclesTanks", 0);
				private _apcs = FactionGetTieredFT(A3A_faction_riv, "vehiclesAPCs", 0);

				switch (true) do {
					case (_tanks isNotEqualTo []): {
						selectRandomWeighted _tanks;
					};
					case (_apcs isNotEqualTo []): {
						selectRandomWeighted _apcs;
					};
					default {
						selectRandomWeighted (FactionGetTieredFT(A3A_faction_riv, "vehiclesLightArmed", 0));
					};
				};
			};
			default {
				""
			};
		};

		[_group, _vehicle]
	};
	default {
		Error("Invalid Rivals Inactivity Level, returning empty array.");
		[[], ""]
	};
};

_groupAndVehicleToSpawn
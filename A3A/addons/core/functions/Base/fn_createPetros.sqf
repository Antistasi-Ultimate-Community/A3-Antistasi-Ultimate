#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_location", ["_radius", 0]];

private _groupPetros = if (isNull petros or {side group petros != teamPlayer}) then {createGroup teamPlayer} else {group petros};

// Don't re-use group if petros was killed by enemy while being moved
if (!isNil "_location" && count units _groupPetros > 1) then { _groupPetros = createGroup teamPlayer };

if (isNil "_location") then {
	if (count units _groupPetros > 1) then {
		_location = getPosATL petros;
	} else {
		// Use Petros' saved position if no location is passed.
		private _petrosPosition = "petrosPosition" call A3A_fnc_returnSavedStat;
		if (isNil "_petrosPosition") then {
			_location = getMarkerPos respawnTeamPlayer;
		} else {
			_location = _petrosPosition;
		};
	};
};

private _petrosIdentity = A3A_faction_reb getOrDefault [
	"petrosIdentity",
	createHashMapFromArray [
		["face", "GreekHead_A3_01"],
		["speaker", "Male01GRE"],
		["pitch", 1.1],
		["firstName", "Petros"],
		["lastName", ":)"]
	]
];

private _oldPetros = petros;
petros = [_groupPetros, FactionGet(reb,"unitPetros"), _location, [], _radius, "NONE", _petrosIdentity] call A3A_fnc_createUnit;
publicVariable "petros";
deleteVehicle _oldPetros;		// Petros should now be leader unless there's a player in the group

call A3A_fnc_initPetros;
